import { supabase } from '../lib/supabase'
import type { Organization, OrganizationInput } from '../types/organization'

const ORG_LOGO_BUCKET = 'org-logos'

const ORG_COLUMNS =
  'id, name, logo_url, zoho_account_id, parent_account_id, phone, website, registration_number, vat_number, industry, zoho_synced_at, aegis_status, created_at'

export async function getOrganization(accountId: string): Promise<Organization | null> {
  const { data, error } = await supabase
    .from('portal_accounts')
    .select(ORG_COLUMNS)
    .eq('id', accountId)
    .maybeSingle()

  if (error) throw error
  return data as Organization | null
}

export async function updateOrganization(
  accountId: string,
  input: Partial<OrganizationInput>,
): Promise<Organization> {
  const patch: Record<string, unknown> = {}
  if (input.name !== undefined) patch.name = input.name
  if (input.logo_url !== undefined) patch.logo_url = input.logo_url
  if (input.phone !== undefined) patch.phone = input.phone
  if (input.website !== undefined) patch.website = input.website
  if (input.registration_number !== undefined) patch.registration_number = input.registration_number
  if (input.vat_number !== undefined) patch.vat_number = input.vat_number
  if (input.industry !== undefined) patch.industry = input.industry

  const { data, error } = await supabase
    .from('portal_accounts')
    .update(patch)
    .eq('id', accountId)
    .select(ORG_COLUMNS)
    .single()

  if (error) throw error
  return data as Organization
}

export async function uploadOrganizationLogo(
  accountId: string,
  file: File,
): Promise<string> {
  const ext = file.name.split('.').pop()?.toLowerCase() || 'png'
  const path = `${accountId}/logo.${ext}`

  const { error: uploadError } = await supabase.storage
    .from(ORG_LOGO_BUCKET)
    .upload(path, file, { upsert: true, contentType: file.type })

  if (uploadError) throw uploadError

  const { data } = supabase.storage.from(ORG_LOGO_BUCKET).getPublicUrl(path)
  const publicUrl = `${data.publicUrl}?t=${Date.now()}`

  await updateOrganization(accountId, { logo_url: publicUrl })
  return publicUrl
}
