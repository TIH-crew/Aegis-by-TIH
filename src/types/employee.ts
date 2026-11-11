export type EmployeeStatus = 'active' | 'inactive'
export type AssignmentStatus = 'unassigned' | 'assigned' | 'checked_out'
export type CustodyAction = 'assign' | 'check_out' | 'check_in'

export type EmployeeInvitationStatus =
  | 'not_invited'
  | 'pending'
  | 'accepted'
  | 'expired'
  | 'revoked'

export type ZohoContactLinkStatus =
  | 'none'
  | 'matched'
  | 'linked'
  | 'create_pending'
  | 'failed'

export interface Employee {
  id: string
  account_id: string
  full_name: string
  first_name?: string | null
  last_name?: string | null
  job_title: string | null
  department?: string | null
  email: string | null
  phone: string | null
  whatsapp_number: string
  employee_number: string | null
  branch_id: string | null
  branch_name?: string | null
  image_url: string | null
  status: EmployeeStatus
  employment_start_date?: string | null
  employment_end_date?: string | null
  invitation_status?: EmployeeInvitationStatus
  invited_at?: string | null
  activated_at?: string | null
  user_id?: string | null
  zoho_contact_id?: string | null
  zoho_contact_link_status?: ZohoContactLinkStatus
  zoho_contact_linked_at?: string | null
  deactivated_at?: string | null
  deactivation_reason?: string | null
  claim_access_token?: string | null
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
  first_name?: string | null
  last_name?: string | null
  job_title?: string | null
  department?: string | null
  email?: string | null
  phone?: string | null
  whatsapp_number?: string
  employee_number?: string | null
  branch_id?: string | null
  image_url?: string | null
  status?: EmployeeStatus
  employment_start_date?: string | null
  employment_end_date?: string | null
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

export interface WorkforceException {
  id: string
  account_id: string
  exception_type: string
  severity: string
  status: string
  employee_id: string | null
  import_batch_id: string | null
  title: string
  details: Record<string, unknown>
  assigned_to: string | null
  resolution_notes: string | null
  created_at: string
}

export interface EmployeeBenefitMembership {
  id: string
  employee_id: string
  benefit_type: string
  employment_verified: boolean
  aegis_activation_status: string
  enrolment_status: string
  provider_confirmation_status: string
  provider_name: string | null
  membership_number: string | null
}
