import type { ReactNode } from 'react'
import { cn } from '../../lib/utils'

export function PageHeader({
  title,
  description,
  actions,
  meta,
}: {
  title: string
  description?: string
  actions?: ReactNode
  meta?: ReactNode
}) {
  return (
    <div className="mb-5 flex flex-wrap items-start justify-between gap-3">
      <div className="min-w-0">
        <h1 className="text-xl font-semibold tracking-tight text-ink sm:text-2xl">{title}</h1>
        {description && <p className="mt-0.5 max-w-2xl text-sm text-muted">{description}</p>}
        {meta && <div className="mt-2">{meta}</div>}
      </div>
      {actions && <div className="flex flex-wrap items-center gap-2">{actions}</div>}
    </div>
  )
}

export function MetricTile({
  label,
  value,
  hint,
  unavailable,
}: {
  label: string
  value: string
  hint?: string
  unavailable?: boolean
}) {
  return (
    <div className="ws-panel px-3.5 py-3">
      <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">{label}</p>
      <p
        className={cn(
          'mt-1 text-lg font-semibold tabular-nums tracking-tight',
          unavailable ? 'text-muted' : 'text-ink',
        )}
      >
        {value}
      </p>
      {hint && <p className="mt-0.5 text-[11px] leading-snug text-muted">{hint}</p>}
    </div>
  )
}

export function EmptyState({
  title,
  description,
  action,
}: {
  title: string
  description?: string
  action?: ReactNode
}) {
  return (
    <div className="ws-panel flex flex-col items-start gap-2 border-dashed px-5 py-8">
      <p className="text-sm font-medium text-ink">{title}</p>
      {description && <p className="max-w-lg text-sm text-muted">{description}</p>}
      {action}
    </div>
  )
}

export function IntegrationState({
  title,
  description,
  status = 'not_connected',
}: {
  title: string
  description: string
  status?: 'not_connected' | 'awaiting_mapping' | 'draft'
}) {
  const badge =
    status === 'awaiting_mapping'
      ? 'Awaiting mapping'
      : status === 'draft'
        ? 'Draft — needs approval'
        : 'Not connected'

  return (
    <div className="ws-panel p-4">
      <div className="mb-2 flex flex-wrap items-center gap-2">
        <h3 className="text-sm font-semibold text-ink">{title}</h3>
        <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">{badge}</span>
      </div>
      <p className="text-sm text-muted">{description}</p>
    </div>
  )
}

export function EntityScopeBanner({
  entityName,
  scopeLabel,
  note,
}: {
  entityName: string
  scopeLabel: string
  note?: string
}) {
  return (
    <div className="mb-4 flex flex-wrap items-center gap-x-3 gap-y-1 rounded-md border border-border bg-surface px-3.5 py-2.5 text-sm">
      <span className="font-semibold text-ink">{entityName}</span>
      <span className="ws-status bg-accent-light text-primary">{scopeLabel}</span>
      {note && <span className="text-xs text-muted">{note}</span>}
    </div>
  )
}

export function FigureWithSource({
  label,
  value,
  source,
  effectiveDate,
  period,
}: {
  label: string
  value: string
  source?: string
  effectiveDate?: string
  period?: string
}) {
  return (
    <div>
      <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">{label}</p>
      <p className="mt-0.5 text-base font-semibold tabular-nums text-ink">{value}</p>
      <p className="mt-0.5 text-[11px] text-muted">
        {[source && `Source: ${source}`, effectiveDate && `Effective: ${effectiveDate}`, period && `Period: ${period}`]
          .filter(Boolean)
          .join(' · ') || '—'}
      </p>
    </div>
  )
}
