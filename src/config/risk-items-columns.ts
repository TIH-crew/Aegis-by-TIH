export type RiskItemsColumnId =
  | 'asset_tag'
  | 'name'
  | 'category'
  | 'branch'
  | 'employee_name'
  | 'lifecycle'
  | 'acquisition_cost'
  | 'insured_value'
  | 'exception'
  | 'attachments'
  | 'unit_cost'
  | 'record_date'
  | 'insurance_status'

export interface RiskItemsColumn {
  id: RiskItemsColumnId
  label: string
  defaultVisible: boolean
}

export const RISK_ITEMS_COLUMNS: RiskItemsColumn[] = [
  { id: 'asset_tag', label: 'Asset tag', defaultVisible: true },
  { id: 'name', label: 'Name', defaultVisible: true },
  { id: 'category', label: 'Asset class', defaultVisible: true },
  { id: 'branch', label: 'Branch / location', defaultVisible: true },
  { id: 'employee_name', label: 'Custodian', defaultVisible: true },
  { id: 'lifecycle', label: 'Lifecycle', defaultVisible: true },
  { id: 'acquisition_cost', label: 'Acquisition cost', defaultVisible: true },
  { id: 'insured_value', label: 'Insured / declared value', defaultVisible: true },
  { id: 'exception', label: 'Exception', defaultVisible: true },
  { id: 'attachments', label: 'Photo', defaultVisible: false },
  { id: 'unit_cost', label: 'Unit cost (legacy)', defaultVisible: false },
  { id: 'record_date', label: 'Record date', defaultVisible: false },
  { id: 'insurance_status', label: 'Insurance status', defaultVisible: false },
]

export function defaultVisibleColumns(): Record<RiskItemsColumnId, boolean> {
  return Object.fromEntries(RISK_ITEMS_COLUMNS.map((c) => [c.id, c.defaultVisible])) as Record<
    RiskItemsColumnId,
    boolean
  >
}
