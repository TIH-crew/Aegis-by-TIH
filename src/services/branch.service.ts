import { supabase } from '../lib/supabase'
import type { Branch, BranchInput } from '../types/branch'

function mapBranch(row: Branch): Branch {
  return {
    ...row,
    latitude: Number(row.latitude),
    longitude: Number(row.longitude),
  }
}

export async function getBranches(accountId: string): Promise<Branch[]> {
  const { data, error } = await supabase
    .from('portal_branches')
    .select('*')
    .eq('account_id', accountId)
    .order('name')

  if (error) throw error
  return (data ?? []).map(mapBranch)
}

export async function createBranch(accountId: string, input: BranchInput): Promise<Branch> {
  const { data, error } = await supabase
    .from('portal_branches')
    .insert({
      account_id: accountId,
      name: input.name,
      address: input.address,
      latitude: input.latitude,
      longitude: input.longitude,
      place_id: input.place_id ?? null,
    })
    .select('*')
    .single()

  if (error) throw error
  return mapBranch(data as Branch)
}

export async function deleteBranch(accountId: string, id: string): Promise<void> {
  const { error } = await supabase
    .from('portal_branches')
    .delete()
    .eq('id', id)
    .eq('account_id', accountId)

  if (error) throw error
}
