/** Domain types for fixed-asset ledger (aam_* tables). */

export type OwnershipType =
  | 'owned'
  | 'leased_rou'
  | 'hired_in'
  | 'third_party'
  | 'client_property'
  | 'insurance_only'

export type AssetLifecycleStatus =
  | 'draft'
  | 'pending_capitalisation'
  | 'active'
  | 'held_for_sale'
  | 'disposed'
  | 'written_off'
  | 'insurance_only'

export type AcquisitionLineClassification =
  | 'fixed_asset'
  | 'expense'
  | 'inventory'
  | 'intangible'
  | 'leased_asset'
  | 'insurance_only'
  | 'needs_classification'

export interface AamAsset {
  id: string
  account_id: string
  asset_tag: string
  description: string
  asset_class: string
  asset_type: 'tangible' | 'intangible'
  ownership_type: OwnershipType
  branch_id: string | null
  location_text: string | null
  custodian_employee_id: string | null
  serial_number: string | null
  imei: string | null
  vin: string | null
  acquisition_date: string | null
  available_for_use_date: string | null
  tax_brought_into_use_date: string | null
  status: AssetLifecycleStatus
  quantity: number
  unit_of_measure: string
  parent_asset_id: string | null
  book_policy_id: string | null
  portal_risk_item_id: string | null
  capitalised_cost: string | null
  currency: string
  replacement_value: string | null
  replacement_value_date: string | null
  replacement_value_source: string | null
  created_at: string
  updated_at: string
}

export interface AamAcquisition {
  id: string
  account_id: string
  supplier_name: string | null
  invoice_number: string | null
  purchase_order: string | null
  invoice_date: string | null
  currency: string
  status: 'draft' | 'pending_approval' | 'approved' | 'rejected' | 'cancelled'
  duplicate_check_key: string | null
  notes: string | null
  created_at: string
}

export interface AamAcquisitionLine {
  id: string
  account_id: string
  acquisition_id: string
  line_no: number
  description: string
  quantity: number
  gross_amount: string
  vat_amount: string
  recoverable_vat: string
  non_recoverable_vat: string
  directly_attributable_costs: string
  capitalised_cost: string | null
  classification: AcquisitionLineClassification
  asset_class: string | null
  branch_id: string | null
  serial_number: string | null
  proposed_asset_id: string | null
}

export interface AamBookPolicy {
  id: string
  account_id: string
  name: string
  asset_class: string
  method: 'straight_line' | 'reducing_balance' | 'units_of_production'
  useful_life_months: number | null
  residual_value_pct: string | null
  residual_value_amount: string | null
  first_period_convention: 'full_month' | 'pro_rata_days' | 'half_year'
  version: number
  effective_from: string
  effective_to: string | null
  status: 'draft' | 'approved' | 'superseded'
  gl_asset_account: string | null
  gl_accum_dep_account: string | null
  gl_dep_expense_account: string | null
}

export interface AamClosePeriod {
  id: string
  account_id: string
  period_key: string
  period_start: string
  period_end: string
  status: 'draft' | 'in_review' | 'approved' | 'locked' | 'reopened'
}

export interface JournalPreviewLine {
  accountCode: string
  accountRole: 'asset' | 'accum_dep' | 'dep_expense' | 'clearing'
  debit: string
  credit: string
  narrative: string
  assetId: string
  periodKey: string
  traceRef: string
}

export interface CapitalisationResult {
  asset: AamAsset
  movementId: string
  taxPositionCreated: boolean
  insuranceReviewTaskCreated: boolean
  warnings: string[]
}
