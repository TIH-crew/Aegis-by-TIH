export type PortalUserRole = 'owner' | 'admin' | 'member'

export interface PortalUser {
  id: string
  user_id: string
  account_id: string
  role: PortalUserRole
  email: string
  full_name: string | null
  /** When set, the user only sees this branch — not the parent group */
  branch_id: string | null
  director_id: string | null
  created_at: string
}

export interface PortalInvite {
  id: string
  account_id: string
  email: string
  role: PortalUserRole
  invited_by: string | null
  accepted_at: string | null
  created_at: string
  branch_id?: string | null
  director_id?: string | null
}

export interface PortalDirector {
  id: string
  full_name: string
  id_number: string | null
  email: string | null
  phone: string | null
  notes: string | null
  user_id: string | null
}

export interface PiMember {
  id: string
  account_id: string
  policy_id: string | null
  policy_number: string | null
  full_name: string
  entity_name: string | null
  id_number: string | null
  email: string | null
  phone: string | null
  council_number: string | null
  vat_amount: number | null
  premium: number | null
  payment_status: string | null
  cover_year: number | null
  cover_month: string | null
  comments: string | null
}
