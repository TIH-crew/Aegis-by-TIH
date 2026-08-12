import { supabase } from '../lib/supabase'
import { listSubsidiaryAccounts } from './account-hierarchy.service'
import { formatCurrency } from '../lib/utils'

export interface OrgMapBranchNode {
  id: string
  name: string
  address: string | null
  latitude: number
  longitude: number
  employeeCount: number
  itemCount: number
  totalValue: number
}

export interface OrgMapCompanyNode {
  id: string
  name: string
  isHome: boolean
  industry: string | null
  employeeCount: number
  itemCount: number
  totalValue: number
  branches: OrgMapBranchNode[]
}

export interface OrgMapData {
  home: OrgMapCompanyNode
  subsidiaries: OrgMapCompanyNode[]
}

async function loadCompanyNode(
  accountId: string,
  name: string,
  isHome: boolean,
  industry: string | null,
): Promise<OrgMapCompanyNode> {
  const [{ data: branches }, { data: employees }, { data: items }] = await Promise.all([
    supabase
      .from('portal_branches')
      .select('id, name, address, latitude, longitude')
      .eq('account_id', accountId),
    supabase
      .from('portal_employees')
      .select('id, branch_id')
      .eq('account_id', accountId)
      .eq('status', 'active'),
    supabase
      .from('portal_risk_items')
      .select('id, branch_id, unit_cost, latitude, longitude, name')
      .eq('account_id', accountId),
  ])

  const empByBranch = new Map<string, number>()
  for (const e of employees ?? []) {
    if (!e.branch_id) continue
    empByBranch.set(e.branch_id, (empByBranch.get(e.branch_id) ?? 0) + 1)
  }

  const itemByBranch = new Map<string, { count: number; value: number }>()
  let totalValue = 0
  for (const item of items ?? []) {
    const value = Number(item.unit_cost) || 0
    totalValue += value
    const key = item.branch_id ?? '__none__'
    const cur = itemByBranch.get(key) ?? { count: 0, value: 0 }
    itemByBranch.set(key, { count: cur.count + 1, value: cur.value + value })
  }

  const branchNodes: OrgMapBranchNode[] = (branches ?? []).map((b) => {
    const itemStats = itemByBranch.get(b.id) ?? { count: 0, value: 0 }
    return {
      id: b.id,
      name: b.name,
      address: b.address,
      latitude: Number(b.latitude) || 0,
      longitude: Number(b.longitude) || 0,
      employeeCount: empByBranch.get(b.id) ?? 0,
      itemCount: itemStats.count,
      totalValue: itemStats.value,
    }
  })

  return {
    id: accountId,
    name,
    isHome,
    industry,
    employeeCount: (employees ?? []).length,
    itemCount: (items ?? []).length,
    totalValue,
    branches: branchNodes.sort((a, b) => a.name.localeCompare(b.name)),
  }
}

export async function fetchOrganizationMap(opts: {
  homeAccountId: string
  homeAccountName: string | null
}): Promise<OrgMapData> {
  const { data: homeRow } = await supabase
    .from('portal_accounts')
    .select('id, name, industry')
    .eq('id', opts.homeAccountId)
    .maybeSingle()

  const subsidiaries = await listSubsidiaryAccounts(opts.homeAccountId)
  const home = await loadCompanyNode(
    opts.homeAccountId,
    homeRow?.name ?? opts.homeAccountName ?? 'Organization',
    true,
    homeRow?.industry ?? null,
  )

  const subNodes = await Promise.all(
    subsidiaries.map((s) => loadCompanyNode(s.id, s.name, false, s.industry)),
  )

  return { home, subsidiaries: subNodes }
}

export interface OrgMapItemMarker {
  id: string
  name: string
  branch_id: string | null
  latitude: number | null
  longitude: number | null
  unit_cost: number | null
}

export async function fetchOrgMapItems(accountId: string): Promise<OrgMapItemMarker[]> {
  const { data, error } = await supabase
    .from('portal_risk_items')
    .select('id, name, branch_id, latitude, longitude, unit_cost')
    .eq('account_id', accountId)
  if (error) throw error
  return (data ?? []).map((row) => ({
    id: row.id,
    name: row.name,
    branch_id: row.branch_id,
    latitude: row.latitude != null ? Number(row.latitude) : null,
    longitude: row.longitude != null ? Number(row.longitude) : null,
    unit_cost: row.unit_cost != null ? Number(row.unit_cost) : null,
  }))
}

export function formatOrgValue(value: number) {
  return formatCurrency(value)
}
