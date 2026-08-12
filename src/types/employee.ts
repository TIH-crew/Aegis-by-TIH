export type EmployeeStatus = 'active' | 'inactive'
export type AssignmentStatus = 'unassigned' | 'assigned' | 'checked_out'
export type CustodyAction = 'assign' | 'check_out' | 'check_in'

export interface Employee {
  id: string
  account_id: string
  full_name: string
  job_title: string | null
  email: string | null
  phone: string | null
  whatsapp_number: string
  employee_number: string | null
  branch_id: string | null
  branch_name?: string | null
  image_url: string | null
  status: EmployeeStatus
  id_number?: string | null
  licence_number?: string | null
  licence_valid_to?: string | null
  licence_categories?: string[] | null
  drivers_licence_verified_at?: string | null
  drivers_licence_verification?: Record<string, unknown> | null
  created_at: string
  updated_at: string
  item_count?: number
}

export interface EmployeeInput {
  full_name: string
  job_title?: string | null
  email?: string | null
  phone?: string | null
  whatsapp_number: string
  employee_number?: string | null
  branch_id?: string | null
  image_url?: string | null
  status?: EmployeeStatus
  id_number?: string | null
  licence_number?: string | null
  licence_valid_to?: string | null
  licence_categories?: string[] | null
  drivers_licence_verified_at?: string | null
  drivers_licence_verification?: Record<string, unknown> | null
}

export interface ItemAssignment {
  id: string
  account_id: string
  risk_item_id: string
  employee_id: string | null
  action: CustodyAction
  status: 'open' | 'closed'
  notes: string | null
  due_at: string | null
  created_at: string
  closed_at: string | null
  employee_name?: string | null
  item_name?: string | null
}

export interface SelectedExtension {
  code: string
  name: string
  included: boolean
  sum_insured?: number | null
  premium_excl?: number | null
  notes?: string | null
}

export interface PolicySectionExtension extends SelectedExtension {
  section: string
}
