import type { RiskItem } from '../types'

export type RiskItemsSortField =
  | 'name'
  | 'category'
  | 'branch'
  | 'employee_name'
  | 'unit_cost'
  | 'record_date'
  | 'insurance_status'

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
  { value: 'name', label: 'Item name' },
  { value: 'category', label: 'Category' },
  { value: 'branch', label: 'Branch' },
  { value: 'employee_name', label: 'Assigned to' },
  { value: 'unit_cost', label: 'Unit cost' },
  { value: 'record_date', label: 'Date' },
  { value: 'insurance_status', label: 'Status' },
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
      case 'record_date':
        cmp = a.record_date.localeCompare(b.record_date)
        break
      case 'branch':
        cmp = (a.branch ?? '').localeCompare(b.branch ?? '')
        break
      case 'employee_name':
        cmp = (a.employee_name ?? '').localeCompare(b.employee_name ?? '')
        break
      default:
        cmp = String(a[field]).localeCompare(String(b[field]))
    }
    return direction === 'asc' ? cmp : -cmp
  })
  return sorted
}
