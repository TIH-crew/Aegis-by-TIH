export type PortalUserRole = 'owner' | 'admin' | 'member'

export interface PortalUser {
  id: string
  user_id: string
  account_id: string
  role: PortalUserRole
  email: string
  full_name: string | null
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
}
