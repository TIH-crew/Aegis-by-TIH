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
          onClick={() => navigate(`/assets/${item.id}`)}
          className="ws-panel p-4 text-left transition-colors hover:bg-page"
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
                <p className="truncate font-semibold text-ink">{item.name}</p>
              )}
              <p className="font-mono text-xs text-muted">{item.asset_tag}</p>
              {(visibleColumns.insurance_status || visibleColumns.lifecycle) && (
                <div className="mt-2">
                  <StatusBadge status={item.insurance_status} />
                </div>
              )}
            </div>
          </div>

          <dl className="space-y-1.5 text-sm">
            {visibleColumns.category && (
              <Row label="Asset class" value={item.category} />
            )}
            {visibleColumns.branch && (
              <Row label="Branch" value={item.branch ?? '—'} />
            )}
            {visibleColumns.employee_name && (
              <Row label="Custodian" value={item.employee_name ?? '—'} />
            )}
            {visibleColumns.acquisition_cost && (
              <Row
                label="Acquisition cost"
                value={
                  item.purchase_value != null ? formatCurrency(item.purchase_value) : '—'
                }
              />
            )}
            {visibleColumns.insured_value && (
              <Row
                label="Insured / declared"
                value={
                  item.insurance_status === 'Insured with us'
                    ? formatCurrency(item.unit_cost)
                    : '—'
                }
              />
            )}
            {visibleColumns.unit_cost && (
              <Row label="Unit cost" value={formatCurrency(item.unit_cost)} />
            )}
            {visibleColumns.record_date && (
              <Row label="Record date" value={formatDate(item.record_date)} />
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
