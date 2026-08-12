export interface Organization {
  id: string
  name: string
  logo_url: string | null
  zoho_account_id: string | null
  parent_account_id: string | null
  phone: string | null
  website: string | null
  registration_number: string | null
  vat_number: string | null
  industry: string | null
  zoho_synced_at: string | null
  aegis_status: string | null
  created_at: string
}

export interface OrganizationInput {
  name: string
  logo_url?: string | null
  phone?: string | null
  website?: string | null
  registration_number?: string | null
  vat_number?: string | null
  industry?: string | null
}
