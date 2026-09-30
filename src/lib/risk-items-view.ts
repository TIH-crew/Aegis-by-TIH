import type { RiskItem } from '../types'

export type AssetViewTab = 'all' | 'attention' | 'acquisition' | 'active' | 'disposed'

export type RiskItemsSortField =
  | 'name'
  | 'asset_tag'
  | 'category'
  | 'branch'
  | 'employee_name'
  | 'unit_cost'
  | 'purchase_value'
  | 'record_date'
  | 'insurance_status'
  | 'assignment_status'

export type SortDirection = 'asc' | 'desc'

export interface RiskItemsFilters {
  category: string
  branch: string
  employee_name: string
  insurance_status: string
}

export const EMPTY_RISK_ITEMS_FILTERS: RiskItemsFilters = {
  category: '',
  branch: '',
  employee_name: '',
  insurance_status: '',
}

export const RISK_ITEMS_SORT_OPTIONS: { value: RiskItemsSortField; label: string }[] = [
  { value: 'name', label: 'Name' },
  { value: 'asset_tag', label: 'Asset tag' },
  { value: 'category', label: 'Asset class' },
  { value: 'branch', label: 'Branch' },
  { value: 'employee_name', label: 'Custodian' },
  { value: 'purchase_value', label: 'Acquisition cost' },
  { value: 'unit_cost', label: 'Insured / declared value' },
  { value: 'record_date', label: 'Record date' },
  { value: 'insurance_status', label: 'Insurance status' },
  { value: 'assignment_status', label: 'Lifecycle' },
]

export function countActiveFilters(filters: RiskItemsFilters) {
  return [filters.category, filters.branch, filters.employee_name, filters.insurance_status].filter(
    Boolean,
  ).length
}

export function matchesSearch(item: RiskItem, query: string) {
  if (!query.trim()) return true
  const q = query.toLowerCase().trim()
  const fields = [
    item.name,
    item.asset_tag,
    item.category,
    item.branch,
    item.employee_name,
    item.serial_number,
    item.description,
    item.insurance_status,
    item.insurance_section,
  ]
  return fields.some((field) => field?.toLowerCase().includes(q))
}

export function matchesFilters(item: RiskItem, filters: RiskItemsFilters) {
  if (filters.category && item.category !== filters.category) return false
  if (filters.branch && (item.branch ?? '') !== filters.branch) return false
  if (filters.employee_name && (item.employee_name ?? '') !== filters.employee_name) return false
  if (filters.insurance_status && item.insurance_status !== filters.insurance_status) return false
  return true
}

export function isUninsuredStatus(status: string | null | undefined) {
  return (
    status === 'Uninsured' ||
    status === 'Insured elsewhere' ||
    status === 'Covered Elsewhere'
  )
}

export function assetNeedsAttention(item: RiskItem): string | null {
  if (isUninsuredStatus(item.insurance_status)) return 'Uninsured'
  if (
    item.purchase_value != null &&
    Number(item.purchase_value) > 0 &&
    !item.purchase_invoice_url
  ) {
    return 'Missing acquisition evidence'
  }
  if (item.assignment_status === 'unassigned' || (!item.employee_id && !item.employee_name)) {
    return 'No custodian'
  }
  if (item.insurance_status === 'In acquisition' || item.insurance_status === 'Brand new') {
    return 'Pending insurance placement'
  }
  return null
}

export function matchesAssetView(item: RiskItem, tab: AssetViewTab): boolean {
  switch (tab) {
    case 'attention':
      return assetNeedsAttention(item) != null
    case 'acquisition':
      return (
        item.insurance_status === 'In acquisition' || item.insurance_status === 'Brand new'
      )
    case 'active':
      return (
        item.insurance_status === 'Insured with us' ||
        (item.assignment_status !== 'unassigned' && !isUninsuredStatus(item.insurance_status))
      )
    case 'disposed':
      // Disposal lifecycle is not yet modelled — keep empty until backend supports it.
      return false
    default:
      return true
  }
}

export function lifecycleLabel(item: RiskItem): string {
  if (item.insurance_status === 'In acquisition' || item.insurance_status === 'Brand new') {
    return 'In acquisition'
  }
  if (item.assignment_status === 'checked_out') return 'Checked out'
  if (item.assignment_status === 'assigned') return 'Active'
  if (isUninsuredStatus(item.insurance_status)) return 'Uninsured'
  return 'Registered'
}

export function sortRiskItems(
  items: RiskItem[],
  field: RiskItemsSortField,
  direction: SortDirection,
) {
  const sorted = [...items].sort((a, b) => {
    let cmp = 0
    switch (field) {
      case 'unit_cost':
        cmp = a.unit_cost - b.unit_cost
        break
      case 'purchase_value':
        cmp = Number(a.purchase_value ?? 0) - Number(b.purchase_value ?? 0)
        break
      case 'record_date':
        cmp = a.record_date.localeCompare(b.record_date)
        break
      case 'branch':
        cmp = (a.branch ?? '').localeCompare(b.branch ?? '')
        break
      case 'employee_name':
        cmp = (a.employee_name ?? '').localeCompare(b.employee_name ?? '')
        break
      case 'asset_tag':
        cmp = a.asset_tag.localeCompare(b.asset_tag)
        break
      case 'assignment_status':
        cmp = a.assignment_status.localeCompare(b.assignment_status)
        break
      default:
        cmp = String(a[field as keyof RiskItem] ?? '').localeCompare(
          String(b[field as keyof RiskItem] ?? ''),
        )
    }
    return direction === 'asc' ? cmp : -cmp
  })
  return sorted
}
