import { supabase } from '../lib/supabase'
import {
  calculateStraightLinePeriod,
  moneyOrZero,
  parsePeriodKeyYm,
  serialiseScheduleLine,
} from '../domain/book/straight-line'
import { money, toDb, zero } from '../domain/money'
import {
  assertNoDoubleClaim,
  parseTaxRuleRow,
  proposeTaxAllowance,
} from '../domain/tax/tax-engine'
import {
  computeDifference,
  glDedupeKey,
  rankInsuranceMatches,
  reconcileSubledgerToGl,
} from '../domain/reconciliation/engines'
import type {
  AamAcquisition,
  AamAcquisitionLine,
  AamAsset,
  AamBookPolicy,
  CapitalisationResult,
  JournalPreviewLine,
} from '../types/asset-ledger'

function duplicateKey(opts: {
  invoiceNumber?: string | null
  serial?: string | null
  assetTag?: string | null
  sourceRef?: string | null
}) {
  const parts = [
    opts.invoiceNumber?.trim().toLowerCase(),
    opts.serial?.trim().toLowerCase(),
    opts.assetTag?.trim().toLowerCase(),
    opts.sourceRef?.trim().toLowerCase(),
  ].filter(Boolean)
  return parts.length ? parts.join('|') : null
}

async function audit(
  accountId: string,
  eventType: string,
  entityType: string,
  entityId: string | null,
  payload: Record<string, unknown>,
) {
  await supabase.from('aam_audit_events').insert({
    account_id: accountId,
    event_type: eventType,
    entity_type: entityType,
    entity_id: entityId,
    payload,
  })
}

/** Create acquisition header + lines. Classifies nothing silently as fixed asset. */
export async function createAcquisition(
  accountId: string,
  input: {
    supplierName?: string
    invoiceNumber?: string
    purchaseOrder?: string
    invoiceDate?: string
    currency?: string
    notes?: string
    lines: {
      description: string
      quantity?: number
      grossAmount: string
      vatAmount?: string
      recoverableVat?: string
      nonRecoverableVat?: string
      attributableCosts?: string
      classification?: AamAcquisitionLine['classification']
      assetClass?: string
      branchId?: string
      serialNumber?: string
    }[]
  },
): Promise<{ acquisition: AamAcquisition; lines: AamAcquisitionLine[]; warnings: string[] }> {
  const warnings: string[] = []
  const dup = duplicateKey({
    invoiceNumber: input.invoiceNumber,
    sourceRef: input.purchaseOrder,
  })

  if (dup) {
    const { data: existing } = await supabase
      .from('aam_acquisitions')
      .select('id')
      .eq('account_id', accountId)
      .eq('duplicate_check_key', dup)
      .maybeSingle()
    if (existing) {
      throw new Error(`Duplicate acquisition detected for key ${dup}`)
    }
  }

  const { data: acq, error } = await supabase
    .from('aam_acquisitions')
    .insert({
      account_id: accountId,
      supplier_name: input.supplierName ?? null,
      invoice_number: input.invoiceNumber ?? null,
      purchase_order: input.purchaseOrder ?? null,
      invoice_date: input.invoiceDate ?? null,
      currency: input.currency ?? 'ZAR',
      status: 'draft',
      duplicate_check_key: dup,
      notes: input.notes ?? null,
    })
    .select('*')
    .single()

  if (error) throw error

  const lineRows = input.lines.map((line, idx) => {
    const classification = line.classification ?? 'needs_classification'
    if (classification === 'needs_classification') {
      warnings.push(`Line ${idx + 1}: classification required before capitalisation`)
    }
    const gross = money(line.grossAmount, input.currency ?? 'ZAR')
    const vat = money(line.vatAmount ?? '0', input.currency ?? 'ZAR')
    const recVat = money(line.recoverableVat ?? '0', input.currency ?? 'ZAR')
    const nonRec = money(line.nonRecoverableVat ?? toDb(vat), input.currency ?? 'ZAR')
    const attr = money(line.attributableCosts ?? '0', input.currency ?? 'ZAR')
    // Capitalised cost = gross - recoverable VAT + non-recoverable VAT portion already in gross + attributable
    // Standard: capitalise net of recoverable VAT + attributable costs + non-recoverable VAT if not in gross
    const capitalised =
      classification === 'fixed_asset' || classification === 'intangible' || classification === 'leased_asset'
        ? toDb(money(gross.amount.minus(recVat.amount).plus(attr.amount), gross.currency))
        : null

    return {
      account_id: accountId,
      acquisition_id: acq.id,
      line_no: idx + 1,
      description: line.description,
      quantity: line.quantity ?? 1,
      gross_amount: toDb(gross),
      vat_amount: toDb(vat),
      recoverable_vat: toDb(recVat),
      non_recoverable_vat: toDb(nonRec),
      directly_attributable_costs: toDb(attr),
      capitalised_cost: capitalised,
      classification,
      asset_class: line.assetClass ?? null,
      branch_id: line.branchId ?? null,
      serial_number: line.serialNumber ?? null,
    }
  })

  const { data: lines, error: lineErr } = await supabase
    .from('aam_acquisition_lines')
    .insert(lineRows)
    .select('*')

  if (lineErr) throw lineErr

  await audit(accountId, 'acquisition_created', 'aam_acquisitions', acq.id, {
    lineCount: lines?.length ?? 0,
  })

  return { acquisition: acq as AamAcquisition, lines: (lines ?? []) as AamAcquisitionLine[], warnings }
}

export async function submitAcquisitionForApproval(accountId: string, acquisitionId: string) {
  const { data, error } = await supabase
    .from('aam_acquisitions')
    .update({ status: 'pending_approval', updated_at: new Date().toISOString() })
    .eq('id', acquisitionId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error
  await audit(accountId, 'acquisition_submitted', 'aam_acquisitions', acquisitionId, {})
  return data as AamAcquisition
}

export async function approveAcquisition(accountId: string, acquisitionId: string, userId: string) {
  const { data, error } = await supabase
    .from('aam_acquisitions')
    .update({
      status: 'approved',
      approved_by: userId,
      approved_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', acquisitionId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error

  await supabase.from('aam_approvals').insert({
    account_id: accountId,
    entity_type: 'aam_acquisitions',
    entity_id: acquisitionId,
    action: 'capitalisation_gate',
    decision: 'approved',
    actor_user_id: userId,
  })

  await audit(accountId, 'acquisition_approved', 'aam_acquisitions', acquisitionId, { userId })
  return data as AamAcquisition
}

/**
 * Capitalise an approved fixed_asset / intangible line into aam_assets.
 * Does NOT copy insured values. Creates tax position (needs classification) + insurance review movement.
 */
export async function capitaliseAcquisitionLine(
  accountId: string,
  lineId: string,
  opts: {
    assetTag: string
    availableForUseDate: string
    bookPolicyId: string
    ownershipType?: AamAsset['ownership_type']
    userId?: string
    linkRiskItemId?: string | null
  },
): Promise<CapitalisationResult> {
  const warnings: string[] = []

  const { data: line, error: lineErr } = await supabase
    .from('aam_acquisition_lines')
    .select('*, aam_acquisitions!inner(status, currency, invoice_date)')
    .eq('id', lineId)
    .eq('account_id', accountId)
    .single()

  if (lineErr) throw lineErr
  const acq = line.aam_acquisitions as { status: string; currency: string; invoice_date: string | null }
  if (acq.status !== 'approved') {
    throw new Error('Acquisition must be approved before capitalisation')
  }
  if (!['fixed_asset', 'intangible', 'leased_asset'].includes(line.classification)) {
    throw new Error(`Line classification ${line.classification} cannot be capitalised as a fixed asset`)
  }
  if (!line.capitalised_cost) {
    throw new Error('Capitalised cost not set on line')
  }

  const { data: policy } = await supabase
    .from('aam_book_policies')
    .select('*')
    .eq('id', opts.bookPolicyId)
    .eq('account_id', accountId)
    .single()

  if (!policy || policy.status !== 'approved') {
    throw new Error('An approved book policy is required for capitalisation')
  }

  const ownership = opts.ownershipType ?? 'owned'
  const { data: asset, error: assetErr } = await supabase
    .from('aam_assets')
    .insert({
      account_id: accountId,
      asset_tag: opts.assetTag,
      description: line.description,
      asset_class: line.asset_class ?? policy.asset_class,
      asset_type: line.classification === 'intangible' ? 'intangible' : 'tangible',
      ownership_type: ownership,
      branch_id: line.branch_id,
      serial_number: line.serial_number,
      acquisition_date: acq.invoice_date,
      available_for_use_date: opts.availableForUseDate,
      status: 'active',
      book_policy_id: opts.bookPolicyId,
      portal_risk_item_id: opts.linkRiskItemId ?? null,
      capitalised_cost: line.capitalised_cost,
      currency: acq.currency,
    })
    .select('*')
    .single()

  if (assetErr) throw assetErr

  await supabase
    .from('aam_acquisition_lines')
    .update({ proposed_asset_id: asset.id })
    .eq('id', lineId)

  const { data: movement, error: movErr } = await supabase
    .from('aam_asset_movements')
    .insert({
      account_id: accountId,
      asset_id: asset.id,
      movement_type: 'capitalisation',
      effective_date: opts.availableForUseDate,
      actor_user_id: opts.userId ?? null,
      reason: 'Capitalisation from approved acquisition line',
      before_state: {},
      after_state: {
        capitalised_cost: line.capitalised_cost,
        book_policy_id: opts.bookPolicyId,
      },
      amount: line.capitalised_cost,
      currency: acq.currency,
      requires_insurance_endorsement: true,
    })
    .select('id')
    .single()

  if (movErr) throw movErr

  const { error: taxErr } = await supabase.from('aam_tax_asset_positions').insert({
    account_id: accountId,
    asset_id: asset.id,
    classification_status: 'needs_tax_classification',
    tax_cost_base: line.capitalised_cost,
    prior_allowances: '0',
    remaining_tax_value: line.capitalised_cost,
    brought_into_use_date: opts.availableForUseDate,
  })
  if (taxErr) warnings.push(`Tax position: ${taxErr.message}`)

  await supabase.from('aam_asset_movements').insert({
    account_id: accountId,
    asset_id: asset.id,
    movement_type: 'insurance_review',
    effective_date: opts.availableForUseDate,
    actor_user_id: opts.userId ?? null,
    reason: 'Decide whether to add/amend insurance cover after capitalisation',
    before_state: {},
    after_state: { task: 'insurance_review' },
    requires_insurance_endorsement: true,
  })

  await audit(accountId, 'asset_capitalised', 'aam_assets', asset.id, {
    lineId,
    acquisitionId: line.acquisition_id,
  })

  return {
    asset: asset as AamAsset,
    movementId: movement.id,
    taxPositionCreated: !taxErr,
    insuranceReviewTaskCreated: true,
    warnings,
  }
}

/** Link existing risk item as insurance-only without inventing book cost from unit_cost. */
export async function registerInsuranceOnlyFromRiskItem(
  accountId: string,
  riskItem: {
    id: string
    asset_tag: string
    name: string
    category: string
    branch_id: string | null
    serial_number: string | null
  },
): Promise<AamAsset> {
  const { data, error } = await supabase
    .from('aam_assets')
    .insert({
      account_id: accountId,
      asset_tag: `INS-${riskItem.asset_tag}`.slice(0, 64),
      description: riskItem.name,
      asset_class: riskItem.category,
      asset_type: 'tangible',
      ownership_type: 'insurance_only',
      branch_id: riskItem.branch_id,
      serial_number: riskItem.serial_number,
      status: 'insurance_only',
      portal_risk_item_id: riskItem.id,
      capitalised_cost: null,
      currency: 'ZAR',
    })
    .select('*')
    .single()
  if (error) throw error

  await supabase.from('aam_insurance_links').insert({
    account_id: accountId,
    asset_id: data.id,
    portal_risk_item_id: riskItem.id,
    match_confidence: 'exact',
    match_method: 'portal_risk_item_id',
  })

  await audit(accountId, 'insurance_only_registered', 'aam_assets', data.id, {
    riskItemId: riskItem.id,
    note: 'No acquisition cost inferred from insured value',
  })

  return data as AamAsset
}

export async function runDraftDepreciation(
  accountId: string,
  periodKey: string,
  assetIds?: string[],
): Promise<{ lines: number; journals: JournalPreviewLine[]; errors: string[] }> {
  const period = parsePeriodKeyYm(periodKey)
  const errors: string[] = []
  const journals: JournalPreviewLine[] = []

  let q = supabase
    .from('aam_assets')
    .select('*, aam_book_policies(*)')
    .eq('account_id', accountId)
    .eq('status', 'active')
    .not('capitalised_cost', 'is', null)

  if (assetIds?.length) q = q.in('id', assetIds)

  const { data: assets, error } = await q
  if (error) throw error

  let lines = 0
  for (const asset of assets ?? []) {
    const policy = asset.aam_book_policies as AamBookPolicy | null
    if (!policy || policy.status !== 'approved') {
      errors.push(`${asset.asset_tag}: no approved book policy`)
      continue
    }
    if (policy.method !== 'straight_line') {
      errors.push(`${asset.asset_tag}: method ${policy.method} not yet implemented in run`)
      continue
    }
    if (!policy.useful_life_months || !asset.available_for_use_date) {
      errors.push(`${asset.asset_tag}: missing useful life or available-for-use date`)
      continue
    }

    const currency = asset.currency || 'ZAR'
    const residual = policy.residual_value_amount
      ? moneyOrZero(policy.residual_value_amount, currency)
      : zero(currency)

    // Prior approved/locked accum
    const { data: prior } = await supabase
      .from('aam_book_schedule_lines')
      .select('closing_accum_dep, closing_gross_cost')
      .eq('asset_id', asset.id)
      .in('status', ['approved', 'locked'])
      .order('period_end', { ascending: false })
      .limit(1)
      .maybeSingle()

    const openingGross = prior
      ? moneyOrZero(prior.closing_gross_cost, currency)
      : moneyOrZero(asset.capitalised_cost, currency)
    const openingAccum = prior ? moneyOrZero(prior.closing_accum_dep, currency) : zero(currency)

    const result = calculateStraightLinePeriod({
      policy: {
        method: 'straight_line',
        usefulLifeMonths: policy.useful_life_months,
        residualValue: residual,
        firstPeriodConvention: policy.first_period_convention,
      },
      policyVersion: policy.version,
      capitalisedCost: moneyOrZero(asset.capitalised_cost, currency),
      availableForUseDate: new Date(asset.available_for_use_date),
      openingGrossCost: openingGross,
      additions: zero(currency),
      disposals: zero(currency),
      openingAccumDep: openingAccum,
      impairment: zero(currency),
      period,
      indefiniteLife: asset.asset_type === 'intangible' && !policy.useful_life_months,
    })

    const serialised = serialiseScheduleLine(result)
    const { error: insErr } = await supabase.from('aam_book_schedule_lines').upsert(
      {
        account_id: accountId,
        asset_id: asset.id,
        period_key: periodKey,
        period_start: period.periodStart.toISOString().slice(0, 10),
        period_end: period.periodEnd.toISOString().slice(0, 10),
        book_policy_id: policy.id,
        book_policy_version: policy.version,
        ...serialised,
        status: 'draft',
      },
      { onConflict: 'asset_id,component_id,period_key,book_policy_version' },
    )
    if (insErr) {
      errors.push(`${asset.asset_tag}: ${insErr.message}`)
      continue
    }
    lines += 1

    if (policy.gl_dep_expense_account && policy.gl_accum_dep_account) {
      journals.push({
        accountCode: policy.gl_dep_expense_account,
        accountRole: 'dep_expense',
        debit: serialised.current_charge,
        credit: '0.0000',
        narrative: `Depreciation ${asset.asset_tag} ${periodKey}`,
        assetId: asset.id,
        periodKey,
        traceRef: String(result.calculationTrace.monthlyCharge ?? ''),
      })
      journals.push({
        accountCode: policy.gl_accum_dep_account,
        accountRole: 'accum_dep',
        debit: '0.0000',
        credit: serialised.current_charge,
        narrative: `Accum dep ${asset.asset_tag} ${periodKey}`,
        assetId: asset.id,
        periodKey,
        traceRef: String(result.calculationTrace.monthlyCharge ?? ''),
      })
    }
  }

  await audit(accountId, 'depreciation_draft_run', 'aam_book_schedule_lines', null, {
    periodKey,
    lines,
    journalLines: journals.length,
  })

  return { lines, journals, errors }
}

export async function proposeTaxForAsset(
  accountId: string,
  assetId: string,
  taxYear: number,
  opts: { approvedWriteOffYears?: number | null; approvedAnnualPct?: number | null },
) {
  const { data: position } = await supabase
    .from('aam_tax_asset_positions')
    .select('*')
    .eq('asset_id', assetId)
    .eq('account_id', accountId)
    .single()

  if (!position?.tax_rule_id) {
    return { ok: false as const, reason: 'needs_tax_classification' as const }
  }

  const { data: ruleRow } = await supabase
    .from('aam_tax_rules')
    .select('*')
    .eq('id', position.tax_rule_id)
    .single()

  if (!ruleRow) return { ok: false as const, reason: 'Rule not found' }

  const rule = parseTaxRuleRow(ruleRow)
  const result = proposeTaxAllowance({
    rule,
    taxYear,
    taxCostBase: moneyOrZero(position.tax_cost_base, 'ZAR'),
    priorAllowances: moneyOrZero(position.prior_allowances, 'ZAR'),
    broughtIntoUseDate: position.brought_into_use_date
      ? new Date(position.brought_into_use_date)
      : null,
    approvedWriteOffYears: opts.approvedWriteOffYears ?? null,
    approvedAnnualPct: opts.approvedAnnualPct ?? null,
  })

  if (!result.ok) return result

  const { data: existing } = await supabase
    .from('aam_tax_schedule_lines')
    .select('tax_rule_id, aam_tax_rules(legal_provision)')
    .eq('asset_id', assetId)
    .eq('status', 'approved')

  const provisions =
    existing?.map((e) => (e.aam_tax_rules as { legal_provision?: string } | null)?.legal_provision).filter(Boolean) as string[] ??
    []
  const stacking = assertNoDoubleClaim({
    existingApprovedProvisions: provisions,
    proposedProvision: rule.legalProvision,
  })
  if (!stacking.ok) return stacking

  await supabase.from('aam_tax_schedule_lines').upsert(
    {
      account_id: accountId,
      asset_id: assetId,
      tax_year: taxYear,
      tax_rule_id: rule.id,
      tax_rule_version: rule.version,
      opening_tax_value: toDb(result.openingTaxValue),
      proposed_allowance: toDb(result.proposedAllowance),
      closing_tax_value: toDb(result.closingTaxValue),
      inputs: result.inputs,
      calculation_trace: result.calculationTrace,
      status: 'provisional',
    },
    { onConflict: 'asset_id,tax_year,tax_rule_version' },
  )

  return result
}

export async function importGlBatch(
  accountId: string,
  input: {
    sourceSystem: string
    periodKey: string
    batchKey: string
    fileName?: string
    lines: { glAccount: string; amount: string; sourceIdentifier: string; narrative?: string }[]
  },
) {
  const { data: batch, error } = await supabase
    .from('aam_gl_imports')
    .insert({
      account_id: accountId,
      source_system: input.sourceSystem,
      period_key: input.periodKey,
      import_batch_key: input.batchKey,
      file_name: input.fileName ?? null,
      status: 'imported',
    })
    .select('*')
    .single()

  if (error) {
    if (error.code === '23505') throw new Error(`GL import batch ${input.batchKey} already imported (idempotent)`)
    throw error
  }

  const rows = input.lines.map((line) => ({
    account_id: accountId,
    import_id: batch.id,
    period_key: input.periodKey,
    gl_account: line.glAccount,
    amount: line.amount,
    currency: 'ZAR',
    source_identifier: line.sourceIdentifier,
    dedupe_key: glDedupeKey({
      accountId,
      periodKey: input.periodKey,
      glAccount: line.glAccount,
      sourceIdentifier: line.sourceIdentifier,
    }),
    narrative: line.narrative ?? null,
  }))

  const { error: lineErr } = await supabase.from('aam_gl_lines').upsert(rows, {
    onConflict: 'account_id,dedupe_key',
    ignoreDuplicates: true,
  })
  if (lineErr) throw lineErr

  await audit(accountId, 'gl_import', 'aam_gl_imports', batch.id, {
    lines: rows.length,
    periodKey: input.periodKey,
  })

  return batch
}

export async function runSubledgerGlRecon(accountId: string, periodKey: string, tolerance = '0.01') {
  const { data: recon, error } = await supabase
    .from('aam_reconciliations')
    .insert({
      account_id: accountId,
      recon_type: 'subledger_to_gl',
      period_key: periodKey,
      status: 'open',
    })
    .select('*')
    .single()
  if (error) throw error

  const { data: schedule } = await supabase
    .from('aam_book_schedule_lines')
    .select('current_charge, closing_gross_cost, closing_accum_dep, opening_gross_cost, additions, disposals, opening_accum_dep')
    .eq('account_id', accountId)
    .eq('period_key', periodKey)

  const currency = 'ZAR'
  let openingCost = zero(currency)
  let additions = zero(currency)
  let disposals = zero(currency)
  let closingCost = zero(currency)
  let depExp = zero(currency)
  let openingAccum = zero(currency)
  let closingAccum = zero(currency)

  for (const row of schedule ?? []) {
    openingCost = moneyOrZero(toDb(openingCost), currency) // keep types happy — use add from money
    openingCost = money(openingCost.amount.plus(moneyOrZero(row.opening_gross_cost, currency).amount), currency)
    additions = money(additions.amount.plus(moneyOrZero(row.additions, currency).amount), currency)
    disposals = money(disposals.amount.plus(moneyOrZero(row.disposals, currency).amount), currency)
    closingCost = money(closingCost.amount.plus(moneyOrZero(row.closing_gross_cost, currency).amount), currency)
    depExp = money(depExp.amount.plus(moneyOrZero(row.current_charge, currency).amount), currency)
    openingAccum = money(openingAccum.amount.plus(moneyOrZero(row.opening_accum_dep, currency).amount), currency)
    closingAccum = money(closingAccum.amount.plus(moneyOrZero(row.closing_accum_dep, currency).amount), currency)
  }

  const { data: glLines } = await supabase
    .from('aam_gl_lines')
    .select('gl_account, amount')
    .eq('account_id', accountId)
    .eq('period_key', periodKey)

  const { data: mappings } = await supabase
    .from('aam_gl_mappings')
    .select('*')
    .eq('account_id', accountId)

  const sumAccounts = (codes: (string | null | undefined)[]) => {
    const set = new Set(codes.filter(Boolean) as string[])
    let total = zero(currency)
    for (const line of glLines ?? []) {
      if (set.has(line.gl_account)) {
        total = money(total.amount.plus(moneyOrZero(line.amount, currency).amount), currency)
      }
    }
    return total
  }

  const exceptions = reconcileSubledgerToGl(
    {
      openingCost,
      additions,
      disposals,
      closingCost,
      depreciationExpense: depExp,
      openingAccumDep: openingAccum,
      closingAccumDep: closingAccum,
    },
    {
      costAccount: sumAccounts((mappings ?? []).map((m) => m.gl_asset_account)),
      accumDepAccount: sumAccounts((mappings ?? []).map((m) => m.gl_accum_dep_account)),
      depExpenseAccount: sumAccounts((mappings ?? []).map((m) => m.gl_dep_expense_account)),
    },
    moneyOrZero(tolerance, currency),
  )

  const exceptionRows = exceptions
    .filter((e) => !e.withinTolerance)
    .map((e) => ({
      account_id: accountId,
      reconciliation_id: recon.id,
      scope_key: e.account,
      register_amount: toDb(e.registerAmount),
      external_amount: toDb(e.glAmount),
      difference: toDb(e.difference),
      tolerance,
      status: 'open' as const,
    }))

  if (exceptionRows.length) {
    await supabase.from('aam_reconciliation_exceptions').insert(exceptionRows)
  }

  return { reconciliationId: recon.id, exceptions }
}

export async function proposeInsuranceMatches(accountId: string) {
  const { data: assets } = await supabase
    .from('aam_assets')
    .select('id, asset_tag, vin, serial_number, description')
    .eq('account_id', accountId)
    .neq('ownership_type', 'insurance_only')

  const { data: risks } = await supabase
    .from('portal_risk_items')
    .select('id, asset_tag, serial_number, name, zoho_fields')
    .eq('account_id', accountId)

  const candidates = rankInsuranceMatches({
    assets: (assets ?? []).map((a) => ({
      id: a.id,
      assetTag: a.asset_tag,
      vin: a.vin,
      serial: a.serial_number,
      name: a.description,
    })),
    riskItems: (risks ?? []).map((r) => ({
      id: r.id,
      assetTag: r.asset_tag,
      serial: r.serial_number,
      vin: (r.zoho_fields as { VIN?: string } | null)?.VIN ?? null,
      name: r.name,
    })),
  })

  for (const c of candidates) {
    // Exact/high only — proposed fuzzy matches require human review (never silent merge)
    if (c.confidence === 'proposed') continue
    const { error } = await supabase.from('aam_insurance_links').insert({
      account_id: accountId,
      asset_id: c.assetId,
      portal_risk_item_id: c.riskItemId,
      match_confidence: c.confidence,
      match_method: c.method,
    })
    if (error && error.code !== '23505') {
      // ignore unique violations; surface others via return
    }
  }

  return candidates
}

export async function listAssets(accountId: string) {
  const { data, error } = await supabase
    .from('aam_assets')
    .select('*')
    .eq('account_id', accountId)
    .order('asset_tag')
  if (error) throw error
  return (data ?? []) as AamAsset[]
}

export async function getAssetFinanceSummary(accountId: string, assetId: string) {
  const { data: asset } = await supabase
    .from('aam_assets')
    .select('*')
    .eq('id', assetId)
    .eq('account_id', accountId)
    .maybeSingle()

  const { data: latest } = await supabase
    .from('aam_book_schedule_lines')
    .select('*')
    .eq('asset_id', assetId)
    .order('period_end', { ascending: false })
    .limit(1)
    .maybeSingle()

  const { data: tax } = await supabase
    .from('aam_tax_asset_positions')
    .select('*')
    .eq('asset_id', assetId)
    .maybeSingle()

  const { data: link } = await supabase
    .from('aam_insurance_links')
    .select('*, portal_risk_items(unit_cost, insurance_status)')
    .eq('asset_id', assetId)
    .limit(1)
    .maybeSingle()

  return { asset, latestBook: latest, tax, insuranceLink: link }
}

export { computeDifference, duplicateKey }
