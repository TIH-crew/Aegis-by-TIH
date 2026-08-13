export type RiskItemsColumnId =
  | 'name'
  | 'attachments'
  | 'category'
  | 'branch'
  | 'employee_name'
  | 'unit_cost'
  | 'record_date'
  | 'insurance_status'

export interface RiskItemsColumn {
  id: RiskItemsColumnId
  label: string
  defaultVisible: boolean
}

export const RISK_ITEMS_COLUMNS: RiskItemsColumn[] = [
  { id: 'name', label: 'Item Name', defaultVisible: true },
  { id: 'attachments', label: 'Attachments', defaultVisible: true },
  { id: 'category', label: 'Category', defaultVisible: true },
  { id: 'branch', label: 'Branch', defaultVisible: true },
  { id: 'employee_name', label: 'Assigned To', defaultVisible: true },
  { id: 'unit_cost', label: 'Unit Cost', defaultVisible: true },
  { id: 'record_date', label: 'Date', defaultVisible: true },
  { id: 'insurance_status', label: 'Status', defaultVisible: true },
]

export function defaultVisibleColumns(): Record<RiskItemsColumnId, boolean> {
  return Object.fromEntries(RISK_ITEMS_COLUMNS.map((c) => [c.id, c.defaultVisible])) as Record<
    RiskItemsColumnId,
    boolean
  >
}
