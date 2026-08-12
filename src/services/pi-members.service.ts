import { supabase } from '../lib/supabase'
import type { PiMember } from '../types/auth'
import { formatCurrency } from '../lib/utils'

export async function fetchPiMembers(accountId: string, policyNumber?: string): Promise<PiMember[]> {
  let q = supabase
    .from('portal_pi_members')
    .select('*')
    .eq('account_id', accountId)
    .order('full_name', { ascending: true })

  if (policyNumber) q = q.eq('policy_number', policyNumber)

  const { data, error } = await q
  if (error) throw error
  return (data ?? []).map((row) => ({
    ...row,
    vat_amount: row.vat_amount != null ? Number(row.vat_amount) : null,
    premium: row.premium != null ? Number(row.premium) : null,
  })) as PiMember[]
}

export async function fetchPiMembersForGroup(accountIds: string[]): Promise<PiMember[]> {
  if (accountIds.length === 0) return []
  const { data, error } = await supabase
    .from('portal_pi_members')
    .select('*')
    .in('account_id', accountIds)
    .order('full_name', { ascending: true })
  if (error) throw error
  return (data ?? []).map((row) => ({
    ...row,
    vat_amount: row.vat_amount != null ? Number(row.vat_amount) : null,
    premium: row.premium != null ? Number(row.premium) : null,
  })) as PiMember[]
}

export function formatPiPremium(value: number | null | undefined): string {
  if (value == null || Number.isNaN(value)) return '—'
  return formatCurrency(value)
}
