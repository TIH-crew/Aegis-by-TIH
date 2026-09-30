/**
 * Typed contracts for Finance & Tax workspaces.
 * UI can render these shapes once accounting / tax engines are connected.
 * Do not invent balances or SARS allowances in the client.
 */

export type FinanceIntegrationStatus =
  | 'not_connected'
  | 'awaiting_mapping'
  | 'connected'
  | 'error'

export interface AssetFinanceSnapshot {
  assetId: string
  legalEntityId: string
  /** Opening book cost for the reporting period */
  openingBalance: number | null
  additions: number | null
  disposals: number | null
  transfersAdjustments: number | null
  depreciation: number | null
  closingBalance: number | null
  netBookValue: number | null
  acquisitionCost: number | null
  glAssetAccount: string | null
  glAccumDepAccount: string | null
  depreciationPolicyId: string | null
  period: string | null
  status: FinanceIntegrationStatus
  reconciliationException: string | null
}

export interface DepreciationRunSummary {
  id: string
  legalEntityId: string
  period: string
  status: 'draft' | 'posted' | 'reversed' | 'unavailable'
  journalDraftId: string | null
  assetClass: string | null
}

export interface GlMappingRow {
  assetClass: string
  glAssetAccount: string | null
  glAccumDepAccount: string | null
  glDepExpenseAccount: string | null
  status: 'mapped' | 'awaiting_mapping' | 'not_connected'
}

export interface TaxRegisterRow {
  assetId: string
  legalEntityId: string
  taxTreatment: string | null
  qualifyingProvision: string | null
  broughtIntoUseDate: string | null
  costBasis: number | null
  priorAllowances: number | null
  currentAllowance: number | null
  remainingTaxValue: number | null
  vatTreatment: string | null
  approvalStatus: 'draft' | 'approved' | 'rejected' | 'unavailable'
  evidenceRefs: string[]
  /** Rule version that produced this calculation — never hard-code SARS rates in UI. */
  ruleVersionId: string | null
  effectiveFrom: string | null
}

export interface TaxRuleVersion {
  id: string
  name: string
  effectiveFrom: string
  effectiveTo: string | null
  notes: string | null
}
