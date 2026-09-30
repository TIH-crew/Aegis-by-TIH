import { add, fromDb, money, mul, sub, toDb, zero, type Money } from '../money'

/**
 * Tax engine — rules-driven, never copies book depreciation.
 * Rates and write-off years MUST come from approved aam_tax_rules.config — not hard-coded here.
 */

export type TaxRuleConfig = {
  method?: string
  write_off_years?: number | null
  write_off_pct_per_year?: number | null
  requires_approved_life_table?: boolean
  default_decision?: string
  suggested_decision_if_motor_car?: string
}

export type TaxRuleSnapshot = {
  id: string
  version: number
  legalProvision: string
  status: string
  effectiveFrom: string
  effectiveTo: string | null
  taxYearFrom: number | null
  taxYearTo: number | null
  config: TaxRuleConfig
  sourceReference: string
  qualificationCriteria: Record<string, unknown>
}

export type TaxAllowanceInput = {
  rule: TaxRuleSnapshot
  taxYear: number
  taxCostBase: Money
  priorAllowances: Money
  broughtIntoUseDate: Date | null
  /** Explicit write-off years approved for this asset (from life table / reviewer). */
  approvedWriteOffYears: number | null
  /** Explicit annual % if method uses percentage. */
  approvedAnnualPct: number | null
}

export type TaxAllowanceResult =
  | {
      ok: true
      status: 'provisional'
      openingTaxValue: Money
      proposedAllowance: Money
      closingTaxValue: Money
      inputs: Record<string, string | number | boolean | null>
      calculationTrace: Record<string, string>
    }
  | {
      ok: false
      reason: string
      needsClassification?: boolean
    }

function ruleAppliesToYear(rule: TaxRuleSnapshot, taxYear: number): boolean {
  if (rule.status !== 'approved') {
    return false
  }
  if (rule.taxYearFrom != null && taxYear < rule.taxYearFrom) return false
  if (rule.taxYearTo != null && taxYear > rule.taxYearTo) return false
  const from = new Date(rule.effectiveFrom)
  if (Number.isNaN(from.getTime())) return false
  // Rough applicability: tax year end assumed 28/29 Feb for ZA companies often — caller should pass calibrated years
  if (rule.effectiveTo) {
    const to = new Date(rule.effectiveTo)
    if (!Number.isNaN(to.getTime()) && to < new Date(`${taxYear - 1}-03-01`)) return false
  }
  return true
}

/**
 * Propose an annual tax allowance. Always provisional until Tax review approves.
 * Does not apply expired incentives; does not invent write-off years.
 */
export function proposeTaxAllowance(input: TaxAllowanceInput): TaxAllowanceResult {
  const { rule, taxYear, taxCostBase, priorAllowances } = input

  if (rule.status === 'expired' || rule.status === 'superseded') {
    return {
      ok: false,
      reason: `Rule ${rule.legalProvision} v${rule.version} is ${rule.status} — do not apply to new claims`,
    }
  }

  if (rule.status !== 'approved') {
    return {
      ok: false,
      reason: `Rule ${rule.legalProvision} is ${rule.status}; approve the rule template before proposing claims`,
      needsClassification: true,
    }
  }

  if (!ruleAppliesToYear(rule, taxYear)) {
    return {
      ok: false,
      reason: `Rule ${rule.legalProvision} is not effective for tax year ${taxYear}`,
    }
  }

  if (!input.broughtIntoUseDate) {
    return {
      ok: false,
      reason: 'Brought-into-use date required before any tax allowance proposal',
      needsClassification: true,
    }
  }

  const opening = sub(taxCostBase, priorAllowances)
  if (opening.amount.lte(0)) {
    return {
      ok: true,
      status: 'provisional',
      openingTaxValue: opening.amount.isNeg() ? zero(taxCostBase.currency) : opening,
      proposedAllowance: zero(taxCostBase.currency),
      closingTaxValue: opening.amount.isNeg() ? zero(taxCostBase.currency) : opening,
      inputs: { taxYear, note: 'Fully written off for tax' },
      calculationTrace: {
        ruleId: rule.id,
        ruleVersion: String(rule.version),
        source: rule.sourceReference,
        result: 'nil allowance — remaining tax value is zero',
      },
    }
  }

  const method = rule.config.method ?? 'straight_line_write_off'
  let years = input.approvedWriteOffYears ?? rule.config.write_off_years ?? null
  let pct = input.approvedAnnualPct ?? rule.config.write_off_pct_per_year ?? null

  if (rule.config.requires_approved_life_table && years == null && pct == null) {
    return {
      ok: false,
      reason:
        'Rule requires an approved write-off life/percentage from the SARS life table — set approvedWriteOffYears or approvedAnnualPct after Tax review',
      needsClassification: true,
    }
  }

  let proposed: Money
  const trace: Record<string, string> = {
    ruleId: rule.id,
    ruleVersion: String(rule.version),
    legalProvision: rule.legalProvision,
    source: rule.sourceReference,
    method,
  }

  if (method === 'straight_line_write_off' && years != null && years > 0) {
    proposed = money(taxCostBase.amount.div(years), taxCostBase.currency)
    trace.formula = `taxCostBase / ${years}`
  } else if (pct != null && pct > 0) {
    proposed = mul(taxCostBase, pct / 100)
    trace.formula = `taxCostBase * ${pct}%`
  } else {
    return {
      ok: false,
      reason: 'No approved write-off years or percentage available on rule/asset',
      needsClassification: true,
    }
  }

  if (proposed.amount.gt(opening.amount)) {
    proposed = opening
    trace.capped = 'Capped at remaining tax value'
  }

  const closing = sub(opening, proposed)

  return {
    ok: true,
    status: 'provisional',
    openingTaxValue: opening,
    proposedAllowance: proposed,
    closingTaxValue: closing,
    inputs: {
      taxYear,
      taxCostBase: toDb(taxCostBase),
      priorAllowances: toDb(priorAllowances),
      writeOffYears: years,
      annualPct: pct,
      broughtIntoUse: input.broughtIntoUseDate.toISOString().slice(0, 10),
    },
    calculationTrace: {
      ...trace,
      proposedAllowance: toDb(proposed),
      closingTaxValue: toDb(closing),
      status: 'provisional — requires Tax/Finance approval before claim',
    },
  }
}

/**
 * Prevent double-claiming incompatible provisions against the same cost
 * unless an approved rule explicitly permits stacking.
 */
export function assertNoDoubleClaim(opts: {
  existingApprovedProvisions: string[]
  proposedProvision: string
  stackingAllowedWith?: string[]
}): { ok: true } | { ok: false; reason: string } {
  const conflict = opts.existingApprovedProvisions.filter(
    (p) => p !== opts.proposedProvision && !(opts.stackingAllowedWith ?? []).includes(p),
  )
  if (conflict.length > 0) {
    return {
      ok: false,
      reason: `Incompatible allowances already approved (${conflict.join(', ')}); stacking not permitted unless rule explicitly allows`,
    }
  }
  return { ok: true }
}

export function suggestVatMotorCarDecision(rule: TaxRuleSnapshot, isDefinedMotorCar: boolean) {
  if (!isDefinedMotorCar) {
    return { decision: 'needs_review' as const, note: 'Confirm VAT classification with evidence' }
  }
  const suggested =
    rule.config.suggested_decision_if_motor_car ?? 'motor_car_restriction'
  return {
    decision: suggested,
    note: 'Business use alone does not prove input VAT recoverable on a defined motor car (VAT 404 / VAT Act).',
  }
}

export function parseTaxRuleRow(row: {
  id: string
  version: number
  legal_provision: string
  status: string
  effective_from: string
  effective_to: string | null
  tax_year_from: number | null
  tax_year_to: number | null
  config: TaxRuleConfig | null
  source_reference: string
  qualification_criteria: Record<string, unknown> | null
}): TaxRuleSnapshot {
  return {
    id: row.id,
    version: row.version,
    legalProvision: row.legal_provision,
    status: row.status,
    effectiveFrom: row.effective_from,
    effectiveTo: row.effective_to,
    taxYearFrom: row.tax_year_from,
    taxYearTo: row.tax_year_to,
    config: row.config ?? {},
    sourceReference: row.source_reference,
    qualificationCriteria: row.qualification_criteria ?? {},
  }
}

export { fromDb, money, toDb, add, sub }
