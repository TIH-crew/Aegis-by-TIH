import { Package } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import type { RiskItemsColumnId } from '../../config/risk-items-columns'
import type { RiskItem } from '../../types'
import { cn, formatCurrency, formatDate } from '../../lib/utils'
import { StatusBadge } from './StatusBadge'

interface RiskItemsGridProps {
  items: RiskItem[]
  visibleColumns: Record<RiskItemsColumnId, boolean>
}

export function RiskItemsGrid({ items, visibleColumns }: RiskItemsGridProps) {
  const navigate = useNavigate()

  if (!items.length) {
    return (
      <div className="rounded-lg border border-border bg-surface px-4 py-12 text-center text-sm text-muted shadow-sm">
        No records found.
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 xl:grid-cols-3">
      {items.map((item) => (
        <button
          key={item.id}
          type="button"
          onClick={() => navigate(`/collections/risk-items/${item.id}`)}
          className="rounded-lg border border-border bg-surface p-4 text-left shadow-sm transition-colors hover:border-accent/40 hover:bg-accent-light/20"
        >
          <div className="mb-3 flex items-start gap-3">
            {visibleColumns.attachments && (
              <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-md bg-gray-100 text-muted">
                {item.image_url ? (
                  <img
                    src={item.image_url}
                    alt=""
                    className="h-full w-full rounded-md object-cover"
                  />
                ) : (
                  <Package size={22} />
                )}
              </div>
            )}
            <div className="min-w-0 flex-1">
              {visibleColumns.name && (
                <p className="truncate font-semibold text-burgundy">{item.name}</p>
              )}
              <p className="text-xs text-muted">{item.asset_tag}</p>
              {visibleColumns.insurance_status && (
                <div className="mt-2">
                  <StatusBadge status={item.insurance_status} />
                </div>
              )}
            </div>
          </div>

          <dl className="space-y-1.5 text-sm">
            {visibleColumns.category && (
              <Row label="Category" value={item.category} />
            )}
            {visibleColumns.branch && (
              <Row label="Branch" value={item.branch ?? '—'} />
            )}
            {visibleColumns.employee_name && (
              <Row label="Assigned to" value={item.employee_name ?? 'Unassigned'} />
            )}
            {visibleColumns.unit_cost && (
              <Row label="Unit cost" value={formatCurrency(item.unit_cost)} />
            )}
            {visibleColumns.record_date && (
              <Row label="Date" value={formatDate(item.record_date)} />
            )}
          </dl>
        </button>
      ))}
    </div>
  )
}

function Row({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex justify-between gap-3">
      <dt className="text-muted">{label}</dt>
      <dd className={cn('text-right font-medium text-gray-800')}>{value}</dd>
    </div>
  )
}
