import { Package } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import type { RiskItemsColumnId } from '../../config/risk-items-columns'
import type { RiskItem } from '../../types'
import { cn, formatCurrency, formatDate } from '../../lib/utils'
import { StatusBadge } from './StatusBadge'

interface DataTableProps {
  items: RiskItem[]
  visibleColumns: Record<RiskItemsColumnId, boolean>
  selectedId?: string | null
  onSelect?: (id: string) => void
}

export function RiskItemsTable({ items, visibleColumns, selectedId, onSelect }: DataTableProps) {
  const navigate = useNavigate()

  const visibleCount =
    Object.values(visibleColumns).filter(Boolean).length + 1

  return (
    <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
      <div className="overflow-x-auto">
        <table className="min-w-full text-sm">
          <thead className="border-b border-border bg-gray-50 text-left text-xs font-medium uppercase tracking-wide text-gray-500">
            <tr>
              <th className="w-10 px-4 py-3">
                <input type="checkbox" className="rounded border-gray-300" />
              </th>
              {visibleColumns.name && <th className="px-4 py-3">Item Name</th>}
              {visibleColumns.attachments && <th className="px-4 py-3">Attachments</th>}
              {visibleColumns.category && <th className="px-4 py-3">Category</th>}
              {visibleColumns.branch && <th className="px-4 py-3">Branch</th>}
              {visibleColumns.unit_cost && <th className="px-4 py-3">Unit Cost</th>}
              {visibleColumns.record_date && <th className="px-4 py-3">Date</th>}
              {visibleColumns.insurance_status && <th className="px-4 py-3">Status</th>}
            </tr>
          </thead>
          <tbody className="divide-y divide-border">
            {items.map((item) => (
              <tr
                key={item.id}
                onClick={() => {
                  onSelect?.(item.id)
                  navigate(`/collections/risk-items/${item.id}`)
                }}
                className={cn(
                  'cursor-pointer transition-colors hover:bg-accent-light/40',
                  selectedId === item.id && 'bg-accent-light/70',
                )}
              >
                <td className="px-4 py-3" onClick={(e) => e.stopPropagation()}>
                  <input type="checkbox" className="rounded border-gray-300" />
                </td>
                {visibleColumns.name && (
                  <td className="px-4 py-3 font-medium text-burgundy">{item.name}</td>
                )}
                {visibleColumns.attachments && (
                  <td className="px-4 py-3">
                    <div className="flex h-10 w-10 items-center justify-center rounded-md bg-gray-100 text-muted">
                      {item.image_url ? (
                        <img
                          src={item.image_url}
                          alt=""
                          className="h-full w-full rounded-md object-cover"
                        />
                      ) : (
                        <Package size={18} />
                      )}
                    </div>
                  </td>
                )}
                {visibleColumns.category && (
                  <td className="px-4 py-3 text-gray-700">{item.category}</td>
                )}
                {visibleColumns.branch && (
                  <td className="px-4 py-3 text-gray-700">{item.branch ?? '—'}</td>
                )}
                {visibleColumns.unit_cost && (
                  <td className="px-4 py-3 text-gray-700">{formatCurrency(item.unit_cost)}</td>
                )}
                {visibleColumns.record_date && (
                  <td className="px-4 py-3 text-gray-700">{formatDate(item.record_date)}</td>
                )}
                {visibleColumns.insurance_status && (
                  <td className="px-4 py-3">
                    <StatusBadge status={item.insurance_status} />
                  </td>
                )}
              </tr>
            ))}
            {!items.length && (
              <tr>
                <td colSpan={visibleCount} className="px-4 py-12 text-center text-muted">
                  No records found.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  )
}
