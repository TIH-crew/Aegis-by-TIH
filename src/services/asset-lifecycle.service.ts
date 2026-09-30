import { supabase } from '../lib/supabase'
import { barcodeNeedsPhysicalLabel, generateAssetBarcode } from '../domain/barcode'
import { labelledAmount, neverZeroUnknown } from '../domain/asset-display'
import type { AamAsset } from '../types/asset-ledger'

export type IncidentInput = {
  assetId: string
  incidentType:
    | 'accident'
    | 'theft'
    | 'fire'
    | 'damage'
    | 'breakdown'
    | 'missing'
    | 'obsolete'
    | 'end_of_useful_life'
    | 'other'
  incidentDate: string
  description: string
  locationText?: string
  stillUsable?: boolean
  heldAt?: string
  estimatedRepairCost?: string | null
  estimatedSalvageValue?: string | null
  replacementNeeded?: boolean
  reporterName?: string
  userId?: string
}

const VEHICLE_CHECKLIST = [
  'Record incident and upload evidence',
  'Submit or link insurance claim',
  'Obtain insurer / assessor outcome',
  'Finance reviews damage and accounting outcome',
  'Tax reviews disposal and settlement implications',
  'Approve repair or write-off',
  'Start and approve replacement',
  'Add replacement to insurance',
  'Reconcile settlement, journals and endorsements',
  'Close case with complete evidence',
]

async function nextIncidentNumber(accountId: string): Promise<string> {
  const { count } = await supabase
    .from('aam_incidents')
    .select('*', { count: 'exact', head: true })
    .eq('account_id', accountId)
  const n = (count ?? 0) + 1
  return `INC-${new Date().getFullYear()}-${String(n).padStart(5, '0')}`
}

export async function appendTimeline(
  accountId: string,
  assetId: string,
  event: {
    eventType: string
    summary: string
    detail?: string
    before?: Record<string, unknown>
    after?: Record<string, unknown>
    actorUserId?: string
    actorLabel?: string
    effectiveDate?: string
    incidentId?: string
    documentId?: string
    auditId?: string
  },
) {
  await supabase.from('aam_timeline_events').insert({
    account_id: accountId,
    asset_id: assetId,
    event_type: event.eventType,
    summary: event.summary,
    detail: event.detail ?? null,
    before_values: event.before ?? null,
    after_values: event.after ?? null,
    actor_user_id: event.actorUserId ?? null,
    actor_label: event.actorLabel ?? null,
    effective_date: event.effectiveDate ?? null,
    incident_id: event.incidentId ?? null,
    document_id: event.documentId ?? null,
    audit_id: event.auditId ?? null,
  })
}

export async function ensureBarcode(accountId: string, asset: AamAsset): Promise<string | null> {
  if (asset.barcode) return asset.barcode
  const needsLabel = barcodeNeedsPhysicalLabel(asset.ownership_type, asset.asset_type)
  if (!needsLabel) {
    const internal = generateAssetBarcode({
      accountShort: accountId.slice(0, 4),
      assetTag: asset.asset_tag,
    })
    await supabase
      .from('aam_assets')
      .update({
        barcode: internal,
        barcode_kind: 'internal_only',
        barcode_reason:
          asset.asset_type === 'intangible'
            ? 'Intangible asset — internal identifier only'
            : 'Insurance-only record — no physical label required',
      })
      .eq('id', asset.id)
    await appendTimeline(accountId, asset.id, {
      eventType: 'barcode_created',
      summary: 'Internal identifier assigned (no physical label)',
      after: { barcode: internal },
    })
    return internal
  }
  const barcode = generateAssetBarcode({
    accountShort: accountId.slice(0, 4),
    assetTag: asset.asset_tag,
  })
  const { error } = await supabase
    .from('aam_assets')
    .update({ barcode, barcode_kind: 'physical', barcode_reason: null })
    .eq('id', asset.id)
  if (error) throw error
  await appendTimeline(accountId, asset.id, {
    eventType: 'barcode_created',
    summary: 'Barcode generated for physical label',
    after: { barcode },
  })
  return barcode
}

export async function getAssetCompleteRecord(accountId: string, assetId: string) {
  const { data: asset, error } = await supabase
    .from('aam_assets')
    .select('*')
    .eq('id', assetId)
    .eq('account_id', accountId)
    .single()
  if (error) throw error

  const [
    book,
    tax,
    insurance,
    valuations,
    docs,
    timeline,
    openIncidents,
    requirements,
  ] = await Promise.all([
    supabase
      .from('aam_book_schedule_lines')
      .select('*')
      .eq('asset_id', assetId)
      .order('period_end', { ascending: false })
      .limit(1)
      .maybeSingle()
      .then((r) => r.data),
    supabase
      .from('aam_tax_asset_positions')
      .select('*')
      .eq('asset_id', assetId)
      .maybeSingle()
      .then((r) => r.data),
    supabase
      .from('aam_insurance_links')
      .select('*, portal_risk_items(unit_cost, insurance_status, name), portal_policies(policy_number)')
      .eq('asset_id', assetId)
      .limit(1)
      .maybeSingle()
      .then((r) => r.data),
    supabase
      .from('aam_valuations')
      .select('*')
      .eq('asset_id', assetId)
      .eq('status', 'approved')
      .order('valuation_date', { ascending: false })
      .then((r) => r.data ?? []),
    supabase
      .from('aam_documents')
      .select('*')
      .eq('entity_type', 'aam_assets')
      .eq('entity_id', assetId)
      .neq('verification_status', 'superseded')
      .order('uploaded_at', { ascending: false })
      .then((r) => r.data ?? []),
    supabase
      .from('aam_timeline_events')
      .select('*')
      .eq('asset_id', assetId)
      .order('created_at', { ascending: false })
      .limit(100)
      .then((r) => r.data ?? []),
    supabase
      .from('aam_incidents')
      .select('*')
      .eq('asset_id', assetId)
      .neq('status', 'completed')
      .neq('status', 'cancelled')
      .then((r) => r.data ?? []),
    supabase
      .from('aam_document_requirements')
      .select('*')
      .or(`account_id.eq.${accountId},account_id.is.null`)
      .eq('event_type', 'capitalisation')
      .eq('active', true)
      .then((r) => r.data ?? []),
  ])

  const fyLines = await supabase
    .from('aam_book_schedule_lines')
    .select('current_charge, period_key')
    .eq('asset_id', assetId)
    .like('period_key', `${new Date().getFullYear()}-%`)
    .then((r) => r.data ?? [])

  const fyDep = fyLines.reduce((s, l) => s + Number(l.current_charge ?? 0), 0)
  const market = valuations.find((v) => v.valuation_kind === 'market')
  const replacement = valuations.find((v) => v.valuation_kind === 'replacement')
  const risk = insurance?.portal_risk_items as
    | { unit_cost?: number; insurance_status?: string; name?: string }
    | null
    | undefined
  const policy = insurance?.portal_policies as { policy_number?: string } | null | undefined

  const values = {
    acquisitionPrice: labelledAmount('Original acquisition price', neverZeroUnknown(asset.capitalised_cost), {
      hint: 'From approved capitalisation',
      emptyLabel: 'Not supplied',
    }),
    capitalisedCost: labelledAmount('Approved capitalised cost', neverZeroUnknown(asset.capitalised_cost), {
      emptyLabel: 'Not capitalised',
    }),
    netBookValue: labelledAmount(
      'Current net book value',
      neverZeroUnknown(book?.closing_nbv ?? null),
      { hint: book ? `From schedule ${book.period_key}` : 'Needs depreciation run', emptyLabel: 'Needs schedule' },
    ),
    monthDepreciation: labelledAmount(
      'Depreciation (latest period)',
      neverZeroUnknown(book?.current_charge ?? null),
      { hint: book?.period_key, emptyLabel: 'Not calculated' },
    ),
    yearDepreciation: labelledAmount(
      'Depreciation (financial year to date)',
      fyDep > 0 ? String(fyDep) : null,
      { emptyLabel: 'Not calculated' },
    ),
    accumulatedDepreciation: labelledAmount(
      'Accumulated depreciation to date',
      neverZeroUnknown(book?.closing_accum_dep ?? null),
      { emptyLabel: 'Not calculated' },
    ),
    taxValue: labelledAmount(
      'Current tax value',
      neverZeroUnknown(tax?.remaining_tax_value ?? null),
      {
        hint: tax ? `Status: ${tax.classification_status}` : 'Needs tax classification',
        emptyLabel: 'Needs review',
      },
    ),
    taxAllowances: labelledAmount(
      'Tax allowances claimed (prior)',
      neverZeroUnknown(tax?.prior_allowances ?? null),
      { emptyLabel: 'None recorded' },
    ),
    marketValue: labelledAmount(
      'Current market / estimated sale value',
      neverZeroUnknown(market?.amount ?? asset.market_value),
      {
        hint: market
          ? `Date ${market.valuation_date} · ${market.source}`
          : asset.market_value_date
            ? `Date ${asset.market_value_date} · ${asset.market_value_source ?? '—'}`
            : 'Needs valuation',
        emptyLabel: 'Needs valuation',
      },
    ),
    replacementValue: labelledAmount(
      'Current replacement value',
      neverZeroUnknown(replacement?.amount ?? asset.replacement_value),
      {
        hint: replacement
          ? `Date ${replacement.valuation_date} · ${replacement.source}`
          : asset.replacement_value_date
            ? `Date ${asset.replacement_value_date} · ${asset.replacement_value_source ?? '—'}`
            : 'Needs valuation',
        emptyLabel: 'Needs valuation',
      },
    ),
    insuredValue: labelledAmount(
      'Current insured value',
      insurance?.insured_value != null
        ? String(insurance.insured_value)
        : risk?.unit_cost != null
          ? String(risk.unit_cost)
          : null,
      {
        hint: policy?.policy_number
          ? `Policy ${policy.policy_number} · ${insurance?.section ?? 'section n/a'}`
          : 'Coverage review',
        emptyLabel: 'Not on schedule',
      },
    ),
  }

  const reqs = requirements.filter(
    (r) => !r.asset_class || r.asset_class === asset.asset_class,
  )
  const presentTypes = new Set(docs.map((d) => d.doc_type).filter(Boolean))
  const missingDocs = reqs.filter((r) => r.mandatory && !presentTypes.has(r.doc_type))

  const health = {
    documentation: missingDocs.length === 0 ? ('Complete' as const) : ('Missing items' as const),
    finance:
      asset.status === 'disposed' || asset.processing_status === 'disposed'
        ? ('Written off' as const)
        : asset.capitalised_cost
          ? ('Capitalised' as const)
          : ('Needs review' as const),
    tax: !tax
      ? ('Needs review' as const)
      : tax.classification_status === 'approved'
        ? ('Classified' as const)
        : ('Needs review' as const),
    insurance: openIncidents.some((i) =>
      ['submitted', 'assessing', 'repair_authorised', 'total_loss_accepted'].includes(i.insurance_status),
    )
      ? ('Claim open' as const)
      : insurance
        ? ('Covered' as const)
        : ('Coverage review' as const),
    valuation:
      market || replacement || asset.replacement_value || asset.market_value
        ? market &&
          (Date.now() - new Date(market.valuation_date).getTime()) / 86400000 > 365
          ? ('Outdated' as const)
          : ('Current' as const)
        : ('Missing' as const),
  }

  return {
    asset: asset as AamAsset & {
      processing_status?: string
      barcode?: string | null
      barcode_kind?: string
      barcode_reason?: string | null
      condition_code?: string | null
    },
    values,
    health,
    documents: docs,
    missingDocs,
    timeline,
    openIncidents,
    book,
    tax,
    insurance,
  }
}

export async function reportIncident(accountId: string, input: IncidentInput) {
  const number = await nextIncidentNumber(accountId)
  const hasInsuranceLink = await supabase
    .from('aam_insurance_links')
    .select('id, policy_id')
    .eq('asset_id', input.assetId)
    .limit(1)
    .maybeSingle()

  const insuranceStatus = hasInsuranceLink.data ? 'not_submitted' : 'review_required'

  const { data: incident, error } = await supabase
    .from('aam_incidents')
    .insert({
      account_id: accountId,
      asset_id: input.assetId,
      incident_number: number,
      incident_type: input.incidentType,
      incident_date: input.incidentDate,
      location_text: input.locationText ?? null,
      description: input.description,
      reporter_user_id: input.userId ?? null,
      reporter_name: input.reporterName ?? null,
      still_usable: input.stillUsable ?? null,
      held_at: input.heldAt ?? null,
      estimated_repair_cost: input.estimatedRepairCost ?? null,
      estimated_salvage_value: input.estimatedSalvageValue ?? null,
      replacement_needed: input.replacementNeeded ?? null,
      status: 'reported',
      insurance_status: insuranceStatus,
      policy_id: hasInsuranceLink.data?.policy_id ?? null,
    })
    .select('*')
    .single()

  if (error) throw error

  // Do NOT dispose asset — only flag processing
  await supabase
    .from('aam_assets')
    .update({ processing_status: 'under_review' })
    .eq('id', input.assetId)

  const checklist = VEHICLE_CHECKLIST.map((label, i) => ({
    account_id: accountId,
    incident_id: incident.id,
    step_no: i + 1,
    label,
    status: i === 0 ? 'in_progress' : 'pending',
  }))
  await supabase.from('aam_case_checklist').insert(checklist)

  const taskDefs: { team: string; title: string; step: number; key: string }[] = [
    {
      team: 'insurance',
      title: hasInsuranceLink.data
        ? 'Link or open insurance claim'
        : 'Insurance review required — no matching cover',
      step: 2,
      key: `ins-claim-${incident.id}`,
    },
    {
      team: 'finance',
      title: 'Review damage / impairment and accounting treatment',
      step: 4,
      key: `fin-review-${incident.id}`,
    },
    {
      team: 'tax',
      title: 'Review tax implications (provisional — do not auto-approve)',
      step: 5,
      key: `tax-review-${incident.id}`,
    },
  ]

  await supabase.from('aam_case_tasks').insert(
    taskDefs.map((t) => ({
      account_id: accountId,
      incident_id: incident.id,
      asset_id: input.assetId,
      team: t.team,
      title: t.title,
      status: 'open',
      checklist_step: t.step,
      idempotency_key: t.key,
    })),
  )

  await appendTimeline(accountId, input.assetId, {
    eventType: 'incident_reported',
    summary: `Incident ${number}: ${input.incidentType} — flagged for write-off review`,
    detail: input.description,
    actorUserId: input.userId,
    actorLabel: input.reporterName,
    effectiveDate: input.incidentDate,
    incidentId: incident.id,
    after: { status: 'reported', insurance_status: insuranceStatus },
  })

  return incident
}

export async function listIncidents(accountId: string) {
  const { data, error } = await supabase
    .from('aam_incidents')
    .select('*, aam_assets(asset_tag, description)')
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })
  if (error) throw error
  return data ?? []
}

export async function getIncident(accountId: string, incidentId: string) {
  const { data: incident, error } = await supabase
    .from('aam_incidents')
    .select('*, aam_assets(*)')
    .eq('id', incidentId)
    .eq('account_id', accountId)
    .single()
  if (error) throw error

  const [tasks, checklist, replacements] = await Promise.all([
    supabase.from('aam_case_tasks').select('*').eq('incident_id', incidentId).then((r) => r.data ?? []),
    supabase
      .from('aam_case_checklist')
      .select('*')
      .eq('incident_id', incidentId)
      .order('step_no')
      .then((r) => r.data ?? []),
    supabase
      .from('aam_replacement_requests')
      .select('*')
      .eq('incident_id', incidentId)
      .then((r) => r.data ?? []),
  ])

  return { incident, tasks, checklist, replacements }
}

export async function updateIncidentInsurance(
  accountId: string,
  incidentId: string,
  patch: {
    insuranceStatus?: string
    claimNumber?: string
    insurerName?: string
    excessAmount?: string
    assessorName?: string
    coverageDecision?: string
    estimatedSettlement?: string | null
    finalSettlement?: string | null
    settlementDate?: string | null
    salvageDecision?: string
    portalClaimId?: string | null
  },
  actor?: { userId?: string; label?: string },
) {
  const { data, error } = await supabase
    .from('aam_incidents')
    .update({
      insurance_status: patch.insuranceStatus,
      claim_number: patch.claimNumber,
      insurer_name: patch.insurerName,
      excess_amount: patch.excessAmount,
      assessor_name: patch.assessorName,
      coverage_decision: patch.coverageDecision,
      estimated_settlement: patch.estimatedSettlement,
      final_settlement: patch.finalSettlement,
      settlement_date: patch.settlementDate,
      salvage_decision: patch.salvageDecision,
      portal_claim_id: patch.portalClaimId,
      updated_at: new Date().toISOString(),
    })
    .eq('id', incidentId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error

  // Insurer total loss must NOT auto-remove from register
  if (patch.insuranceStatus === 'total_loss_accepted') {
    await supabase
      .from('aam_case_tasks')
      .update({ status: 'in_progress' })
      .eq('incident_id', incidentId)
      .eq('team', 'finance')
      .eq('status', 'open')
  }

  await appendTimeline(accountId, data.asset_id, {
    eventType: 'insurance_update',
    summary: `Insurance status → ${patch.insuranceStatus ?? data.insurance_status}`,
    incidentId,
    actorUserId: actor?.userId,
    actorLabel: actor?.label,
    after: patch as Record<string, unknown>,
  })

  return data
}

export async function approveFinanceOutcome(
  accountId: string,
  incidentId: string,
  outcome: NonNullable<IncidentInput extends never ? never : string> | string,
  opts: { userId?: string; label?: string; stopDepreciation?: boolean },
) {
  const { data: incident, error } = await supabase
    .from('aam_incidents')
    .update({
      finance_status: 'approved',
      outcome,
      status: 'approved_outcome',
      updated_at: new Date().toISOString(),
    })
    .eq('id', incidentId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error

  // Only now may future depreciation stop / derecognition be considered
  if (opts.stopDepreciation && ['full_write_off', 'sale', 'scrap', 'theft_loss'].includes(outcome)) {
    await supabase
      .from('aam_assets')
      .update({ status: 'written_off', processing_status: 'write_off_pending' })
      .eq('id', incident.asset_id)
  }

  await supabase
    .from('aam_case_tasks')
    .update({ status: 'done', completed_at: new Date().toISOString(), completed_by: opts.userId ?? null })
    .eq('incident_id', incidentId)
    .eq('team', 'finance')

  await appendTimeline(accountId, incident.asset_id, {
    eventType: 'finance_approved',
    summary: `Finance approved outcome: ${outcome}`,
    detail: 'Depreciation / derecognition only follows this approved accounting event',
    incidentId,
    actorUserId: opts.userId,
    actorLabel: opts.label,
  })

  return incident
}

export async function startReplacement(
  accountId: string,
  incidentId: string,
  input: {
    specification?: string
    budgetAmount?: string
    responsiblePerson?: string
    insurerAction?: string
    isTemporaryHire?: boolean
    userId?: string
  },
) {
  const { data: incident } = await supabase
    .from('aam_incidents')
    .select('asset_id')
    .eq('id', incidentId)
    .eq('account_id', accountId)
    .single()
  if (!incident) throw new Error('Incident not found')

  const { data, error } = await supabase
    .from('aam_replacement_requests')
    .insert({
      account_id: accountId,
      incident_id: incidentId,
      original_asset_id: incident.asset_id,
      specification: input.specification ?? null,
      budget_amount: input.budgetAmount ?? null,
      responsible_person: input.responsiblePerson ?? null,
      insurer_action: input.insurerAction ?? 'unknown',
      is_temporary_hire: input.isTemporaryHire ?? false,
      status: 'draft',
    })
    .select('*')
    .single()
  if (error) throw error

  await appendTimeline(accountId, incident.asset_id, {
    eventType: 'replacement_started',
    summary: 'Replacement request opened (new asset will get its own tag)',
    incidentId,
    actorUserId: input.userId,
  })

  return data
}

export async function receiveReplacementAsset(
  accountId: string,
  replacementId: string,
  newAsset: {
    assetTag: string
    description: string
    assetClass: string
    capitalisedCost: string
    availableForUseDate: string
    bookPolicyId?: string
  },
  userId?: string,
) {
  const { data: req } = await supabase
    .from('aam_replacement_requests')
    .select('*')
    .eq('id', replacementId)
    .eq('account_id', accountId)
    .single()
  if (!req) throw new Error('Replacement request not found')

  const { data: asset, error } = await supabase
    .from('aam_assets')
    .insert({
      account_id: accountId,
      asset_tag: newAsset.assetTag,
      description: newAsset.description,
      asset_class: newAsset.assetClass,
      asset_type: 'tangible',
      ownership_type: 'owned',
      status: 'active',
      processing_status: 'awaiting_documents',
      capitalised_cost: newAsset.capitalisedCost,
      available_for_use_date: newAsset.availableForUseDate,
      acquisition_date: newAsset.availableForUseDate,
      book_policy_id: newAsset.bookPolicyId ?? null,
      currency: 'ZAR',
    })
    .select('*')
    .single()
  if (error) throw error

  await ensureBarcode(accountId, asset as AamAsset)

  await supabase
    .from('aam_replacement_requests')
    .update({ new_asset_id: asset.id, status: 'received', updated_at: new Date().toISOString() })
    .eq('id', replacementId)

  // Insurance review for new + remove old
  await supabase.from('aam_case_tasks').insert([
    {
      account_id: accountId,
      incident_id: req.incident_id,
      asset_id: asset.id,
      team: 'insurance',
      title: 'Add replacement asset to insurance schedule',
      status: 'open',
      idempotency_key: `ins-add-new-${replacementId}`,
    },
    {
      account_id: accountId,
      incident_id: req.incident_id,
      asset_id: req.original_asset_id,
      team: 'insurance',
      title: 'Endorse removal of damaged asset from schedule',
      status: 'open',
      idempotency_key: `ins-remove-old-${replacementId}`,
    },
  ])

  await appendTimeline(accountId, req.original_asset_id, {
    eventType: 'replacement_received',
    summary: `New asset ${asset.asset_tag} created as replacement`,
    incidentId: req.incident_id,
    actorUserId: userId,
    after: { new_asset_id: asset.id },
  })
  await appendTimeline(accountId, asset.id, {
    eventType: 'created',
    summary: `Created as replacement for incident`,
    incidentId: req.incident_id,
    actorUserId: userId,
  })

  return asset
}

export async function listLedgerAssets(accountId: string) {
  const { data, error } = await supabase
    .from('aam_assets')
    .select('*, aam_incidents(id, status, incident_number)')
    .eq('account_id', accountId)
    .order('asset_tag')
  if (error) throw error
  return data ?? []
}

export async function updateAssetFields(
  accountId: string,
  assetId: string,
  patch: Record<string, unknown>,
  opts: { userId?: string; reason: string; financial?: boolean },
) {
  const { data: before } = await supabase
    .from('aam_assets')
    .select('*')
    .eq('id', assetId)
    .eq('account_id', accountId)
    .single()
  if (!before) throw new Error('Asset not found')

  if (opts.financial) {
    // Controlled financial fields require Finance approval — do not silent rewrite closed periods
    await appendTimeline(accountId, assetId, {
      eventType: 'finance_change_requested',
      summary: `Financial change requested — awaiting Finance approval`,
      detail: opts.reason,
      before: before as Record<string, unknown>,
      after: patch,
      actorUserId: opts.userId,
    })
    return { pendingApproval: true as const }
  }

  const allowed = [
    'description',
    'location_text',
    'custodian_employee_id',
    'serial_number',
    'imei',
    'vin',
    'condition_code',
    'branch_id',
  ]
  const clean: Record<string, unknown> = {}
  for (const k of allowed) {
    if (k in patch) clean[k] = patch[k]
  }
  clean.updated_at = new Date().toISOString()

  const { data, error } = await supabase
    .from('aam_assets')
    .update(clean)
    .eq('id', assetId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error

  await appendTimeline(accountId, assetId, {
    eventType: 'field_edit',
    summary: opts.reason || 'Asset details updated',
    before: before as Record<string, unknown>,
    after: clean,
    actorUserId: opts.userId,
  })

  return { pendingApproval: false as const, asset: data }
}

/** Idempotent CSV-ish bulk import of simple asset rows. */
export async function importAssetRows(
  accountId: string,
  batch: {
    fileName: string
    sourceHash: string
    valueKind: 'purchase_cost' | 'insured_value' | 'replacement_value' | 'other' | 'unknown'
    ownershipType?: string
    branchId?: string
    userId?: string
    rows: {
      assetTag: string
      description: string
      assetClass: string
      serial?: string
      amount?: string
      quantity?: number
    }[]
  },
) {
  const { data: existing } = await supabase
    .from('aam_import_batches')
    .select('id, status')
    .eq('account_id', accountId)
    .eq('source_hash', batch.sourceHash)
    .maybeSingle()
  if (existing?.status === 'completed') {
    return { batchId: existing.id, duplicated: true as const, results: [] as unknown[] }
  }

  const { data: batchRow, error: batchErr } = await supabase
    .from('aam_import_batches')
    .insert({
      account_id: accountId,
      file_name: batch.fileName,
      source_hash: batch.sourceHash,
      status: 'importing',
      value_kind: batch.valueKind,
      ownership_type: batch.ownershipType ?? 'owned',
      branch_id: batch.branchId ?? null,
      row_count: batch.rows.length,
      uploaded_by: batch.userId ?? null,
    })
    .select('*')
    .single()
  if (batchErr) throw batchErr

  const results: { row: number; status: string; message?: string; assetId?: string }[] = []
  let success = 0
  let errors = 0

  for (let i = 0; i < batch.rows.length; i++) {
    const row = batch.rows[i]!
    const qty = Math.max(1, Math.floor(row.quantity ?? 1))
    if (qty > 1 && batch.valueKind !== 'unknown') {
      // Create individual assets for multi-qty physical items
    }
    for (let q = 0; q < qty; q++) {
      const tag = qty > 1 ? `${row.assetTag}-${q + 1}` : row.assetTag
      const capitalised =
        batch.valueKind === 'purchase_cost' && row.amount != null ? row.amount : null
      const { data: asset, error } = await supabase
        .from('aam_assets')
        .insert({
          account_id: accountId,
          asset_tag: tag,
          description: row.description,
          asset_class: row.assetClass,
          asset_type: 'tangible',
          ownership_type: batch.ownershipType ?? 'owned',
          branch_id: batch.branchId ?? null,
          serial_number: row.serial ?? null,
          status: 'draft',
          processing_status: 'incomplete',
          capitalised_cost: capitalised,
          replacement_value: batch.valueKind === 'replacement_value' ? row.amount : null,
          currency: 'ZAR',
        })
        .select('*')
        .single()

      if (error) {
        errors += 1
        results.push({ row: i + 1, status: 'invalid', message: error.message })
        await supabase.from('aam_import_rows').insert({
          account_id: accountId,
          batch_id: batchRow.id,
          row_no: i + 1,
          source_key: tag,
          payload: row,
          status: 'invalid',
          error_message: error.message,
        })
        continue
      }

      await ensureBarcode(accountId, asset as AamAsset)
      await appendTimeline(accountId, asset.id, {
        eventType: 'bulk_import',
        summary: `Imported from ${batch.fileName}`,
        actorUserId: batch.userId,
        after: { value_kind: batch.valueKind },
      })
      // Place in review queue — do not auto-approve finance/tax/insurance
      success += 1
      results.push({ row: i + 1, status: 'imported', assetId: asset.id })
      await supabase.from('aam_import_rows').insert({
        account_id: accountId,
        batch_id: batchRow.id,
        row_no: i + 1,
        source_key: tag,
        payload: row,
        status: 'imported',
        asset_id: asset.id,
      })
    }
  }

  await supabase
    .from('aam_import_batches')
    .update({
      status: 'completed',
      success_count: success,
      error_count: errors,
      result_report: results,
      completed_at: new Date().toISOString(),
    })
    .eq('id', batchRow.id)

  return { batchId: batchRow.id, duplicated: false as const, results }
}

export async function queueEmail(
  accountId: string,
  msg: {
    templateKey: string
    toEmail: string
    subject: string
    bodyText: string
    idempotencyKey: string
    payload?: Record<string, unknown>
  },
) {
  const providerConfigured = Boolean(import.meta.env.VITE_EMAIL_PROVIDER_CONFIGURED === 'true')
  const { data, error } = await supabase
    .from('aam_email_outbox')
    .upsert(
      {
        account_id: accountId,
        template_key: msg.templateKey,
        to_email: msg.toEmail,
        subject: msg.subject,
        body_text: msg.bodyText,
        payload: msg.payload ?? {},
        idempotency_key: msg.idempotencyKey,
        status: providerConfigured ? 'queued' : 'skipped_no_provider',
        attempts: 0,
        last_error: providerConfigured ? null : 'Email not configured',
      },
      { onConflict: 'account_id,idempotency_key' },
    )
    .select('*')
    .single()
  if (error) throw error
  return data
}

export { VEHICLE_CHECKLIST }
