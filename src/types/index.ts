export interface RiskItem {
  id: string
  account_id: string
  asset_tag: string
  name: string
  category: string
  insurance_section: string | null
  unit_cost: number
  repair_cost: number
  record_date: string
  image_url: string | null
  employee_name: string | null
  employee_id: string | null
  item_extensions: unknown
  assignment_status: 'unassigned' | 'assigned' | 'checked_out'
  vehicle_verification: Record<string, unknown>
  is_rental: boolean
  rental_company: string | null
  rental_start_date: string | null
  rental_end_date: string | null
  insurance_status: string
  description: string | null
  serial_number: string | null
  branch: string | null
  branch_id: string | null
  latitude: number | null
  longitude: number | null
  zoho_fields: Record<string, unknown>
  zoho_risk_id: string | null
  purchase_value: number | null
  purchase_invoice_url: string | null
  purchase_invoice_name: string | null
  purchase_date: string | null
  is_financed: boolean
  finance_house: string | null
  finance_account_number: string | null
  finance_amount: number | null
  created_at: string
  updated_at: string
}

export interface RiskItemInput {
  name: string
  category: string
  unit_cost: number
  repair_cost?: number
  record_date?: string
  image_url?: string | null
  employee_name?: string | null
  employee_id?: string | null
  item_extensions?: unknown
  assignment_status?: 'unassigned' | 'assigned' | 'checked_out'
  vehicle_verification?: Record<string, unknown>
  is_rental?: boolean
  rental_company?: string | null
  rental_start_date?: string | null
  rental_end_date?: string | null
  insurance_status?: string
  description?: string | null
  serial_number?: string | null
  branch_id?: string | null
  zoho_fields?: Record<string, unknown>
  purchase_value?: number | null
  purchase_invoice_url?: string | null
  purchase_invoice_name?: string | null
  purchase_date?: string | null
  is_financed?: boolean
  finance_house?: string | null
  finance_account_number?: string | null
  finance_amount?: number | null
}

export interface DashboardStats {
  totalRecords: number
  insuredWithUsCount: number
  pipelineCount: number
  uninsuredCount: number
  totalValue: number
}

export interface CollectionConfig {
  key: string
  label: string
  path: string
  table: 'portal_risk_items' | 'portal_quotations' | 'portal_policies' | 'portal_claims' | 'portal_employees'
}
