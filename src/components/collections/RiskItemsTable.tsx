import { useNavigate } from 'react-router-dom'
import type { RiskItemsColumnId } from '../../config/risk-items-columns'
import type { RiskItem } from '../../types'
import { assetNeedsAttention, lifecycleLabel } from '../../lib/risk-items-view'
import { cn, formatCurrency, formatDate } from '../../lib/utils'
import { StatusBadge } from './StatusBadge'

interface DataTableProps {
  items: RiskItem[]
  visibleColumns: Record<RiskItemsColumnId, boolean>
  selectedId?: string | null
  onSelect?: (id: string) => void
  selectedIds?: Set<string>
  onToggleSelect?: (id: string) => void
  onToggleSelectAll?: () => void
}

export function RiskItemsTable({
  items,
  visibleColumns,
  selectedId,
  onSelect,
  selectedIds,
  onToggleSelect,
  onToggleSelectAll,
}: DataTableProps) {
  const navigate = useNavigate()
  const allSelected = items.length > 0 && selectedIds && items.every((i) => selectedIds.has(i.id))

  const visibleCount =
    Object.values(visibleColumns).filter(Boolean).length + 1

  return (
    <div className="ws-panel overflow-hidden">
      <div className="overflow-x-auto">
        <table className="ws-table min-w-[960px]">
          <thead>
            <tr>
              <th className="w-10">
                <input
                  type="checkbox"
                  className="rounded border-gray-300"
                  checked={Boolean(allSelected)}
                  onChange={() => onToggleSelectAll?.()}
                  aria-label="Select all visible assets"
                />
              </th>
              {visibleColumns.asset_tag && <th>Asset tag</th>}
              {visibleColumns.name && <th>Name</th>}
              {visibleColumns.attachments && <th>Photo</th>}
              {visibleColumns.category && <th>Asset class</th>}
              {visibleColumns.branch && <th>Branch / location</th>}
              {visibleColumns.employee_name && <th>Custodian</th>}
              {visibleColumns.lifecycle && <th>Lifecycle</th>}
              {visibleColumns.acquisition_cost && <th className="text-right">Acquisition cost</th>}
              {visibleColumns.insured_value && <th className="text-right">Insured / declared</th>}
              {visibleColumns.unit_cost && <th className="text-right">Unit cost</th>}
              {visibleColumns.record_date && <th>Record date</th>}
              {visibleColumns.insurance_status && <th>Insurance</th>}
              {visibleColumns.exception && <th>Exception</th>}
            </tr>
          </thead>
          <tbody>
            {items.map((item) => {
              const exception = assetNeedsAttention(item)
              return (
                <tr
                  key={item.id}
                  onClick={() => {
                    onSelect?.(item.id)
                    navigate(`/assets/${item.id}`)
                  }}
                  className={cn(
                    'cursor-pointer',
                    selectedId === item.id && 'bg-accent-light/70',
                  )}
                >
                  <td onClick={(e) => e.stopPropagation()}>
                    <input
                      type="checkbox"
                      className="rounded border-gray-300"
                      checked={selectedIds?.has(item.id) ?? false}
                      onChange={() => onToggleSelect?.(item.id)}
                      aria-label={`Select ${item.name}`}
                    />
                  </td>
                  {visibleColumns.asset_tag && (
                    <td className="font-mono text-[12px] text-muted">{item.asset_tag}</td>
                  )}
                  {visibleColumns.name && (
                    <td className="max-w-[220px] truncate font-medium text-ink">{item.name}</td>
                  )}
                  {visibleColumns.attachments && (
                    <td>
                      {item.image_url ? (
                        <img
                          src={item.image_url}
                          alt=""
                          className="h-8 w-8 rounded object-cover"
                        />
                      ) : (
                        <span className="text-xs text-muted">—</span>
                      )}
                    </td>
                  )}
                  {visibleColumns.category && <td>{item.category}</td>}
                  {visibleColumns.branch && <td>{item.branch ?? '—'}</td>}
                  {visibleColumns.employee_name && (
                    <td>{item.employee_name ?? '—'}</td>
                  )}
                  {visibleColumns.lifecycle && (
                    <td>
                      <StatusBadge status={lifecycleLabel(item)} />
                    </td>
                  )}
                  {visibleColumns.acquisition_cost && (
                    <td className="text-right tabular-nums">
                      {item.purchase_value != null
                        ? formatCurrency(item.purchase_value)
                        : '—'}
                    </td>
                  )}
                  {visibleColumns.insured_value && (
                    <td className="text-right tabular-nums">
                      {item.insurance_status === 'Insured with us'
                        ? formatCurrency(item.unit_cost)
                        : '—'}
                    </td>
                  )}
                  {visibleColumns.unit_cost && (
                    <td className="text-right tabular-nums">{formatCurrency(item.unit_cost)}</td>
                  )}
                  {visibleColumns.record_date && (
                    <td>{item.record_date ? formatDate(item.record_date) : '—'}</td>
                  )}
                  {visibleColumns.insurance_status && (
                    <td>
                      <StatusBadge status={item.insurance_status} />
                    </td>
                  )}
                  {visibleColumns.exception && (
                    <td>
                      {exception ? (
                        <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">
                          {exception}
                        </span>
                      ) : (
                        <span className="text-xs text-muted">—</span>
                      )}
                    </td>
                  )}
                </tr>
              )
            })}
            {!items.length && (
              <tr>
                <td colSpan={visibleCount} className="px-4 py-12 text-center text-muted">
                  No assets match this view.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  )
}
