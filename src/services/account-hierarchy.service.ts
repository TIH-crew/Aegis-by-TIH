import { supabase } from '../lib/supabase'
import type { Organization } from '../types/organization'

export interface SubsidiarySummary {
  id: string
  name: string
  industry: string | null
  aegis_status: string | null
  parent_account_id: string | null
}

export async function listSubsidiaryAccounts(parentAccountId: string): Promise<SubsidiarySummary[]> {
  const { data, error } = await supabase
    .from('portal_accounts')
    .select('id, name, industry, aegis_status, parent_account_id')
    .eq('parent_account_id', parentAccountId)
    .order('name')

  if (error) throw error
  return (data ?? []) as SubsidiarySummary[]
}

export async function getNextPolicyRenewal(accountId: string): Promise<{
  renewal_date: string
  policy_number: string
  insurer: string | null
} | null> {
  const today = new Date().toISOString().slice(0, 10)
  const { data, error } = await supabase
    .from('portal_policies')
    .select('renewal_date, policy_number, insurer')
    .eq('account_id', accountId)
    .not('renewal_date', 'is', null)
    .gte('renewal_date', today)
    .order('renewal_date', { ascending: true })
    .limit(1)
    .maybeSingle()

  if (error) throw error
  if (!data?.renewal_date) return null
  return {
    renewal_date: data.renewal_date,
    policy_number: data.policy_number ?? 'Policy',
    insurer: data.insurer,
  }
}

export type { Organization }
