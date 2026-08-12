import type { SupabaseClient } from 'jsr:@supabase/supabase-js@2'
import { fetchZohoAccount } from './zoho.ts'

export interface ZohoAccountRecord {
  id: string
  Account_Name?: string
  Phone?: string
  Website?: string
  Company_Registration_Number?: string
  Vat_Number?: string
  Industry?: string
  Default_Email_Address?: string
}

export function mapZohoAccountSnapshot(account: ZohoAccountRecord) {
  return {
    id: String(account.id),
    name: account.Account_Name?.trim() || 'Unnamed Account',
    phone: account.Phone?.trim() || null,
    website: account.Website?.trim() || null,
    registration_number: account.Company_Registration_Number?.trim() || null,
    vat_number: account.Vat_Number?.trim() || null,
    industry: account.Industry?.trim() || null,
    email: account.Default_Email_Address?.trim() || null,
  }
}

export async function refreshPortalAccountFromZoho(
  supabase: SupabaseClient,
  portalAccountId: string,
  zohoAccountId: string,
) {
  const zohoAccount = await fetchZohoAccount(zohoAccountId)
  const snapshot = mapZohoAccountSnapshot(zohoAccount)

  const { error } = await supabase
    .from('portal_accounts')
    .update({
      name: snapshot.name,
      phone: snapshot.phone,
      website: snapshot.website,
      registration_number: snapshot.registration_number,
      vat_number: snapshot.vat_number,
      industry: snapshot.industry,
      zoho_synced_at: new Date().toISOString(),
    })
    .eq('id', portalAccountId)

  if (error) throw error
  return snapshot
}
