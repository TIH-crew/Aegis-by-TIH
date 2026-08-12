import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Activity, Filter, Loader2 } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import {
  activityEventLabel,
  listPolicyActivity,
  type PolicyActivityRow,
} from '../services/policy-activity.service'
import { formatCurrency, formatDate } from '../lib/utils'

const EVENT_FILTERS: { value: string; label: string }[] = [
  { value: '', label: 'All events' },
  { value: 'item_added', label: 'Items added' },
  { value: 'item_removed', label: 'Items removed' },
  { value: 'item_adjusted', label: 'Items adjusted' },
  { value: 'premium_changed', label: 'Premium changes' },
  { value: 'status_changed', label: 'Status changes' },
  { value: 'claim_lodged', label: 'Claims lodged' },
]

export function ReportsPage() {
  const { accountId } = useAuth()
  const [rows, setRows] = useState<PolicyActivityRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [eventType, setEventType] = useState('')

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void listPolicyActivity(accountId, { limit: 500 })
      .then(setRows)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load activity'))
      .finally(() => setLoading(false))
  }, [accountId])

  const summary = useMemo(() => {
    const counts = new Map<string, number>()
    for (const row of rows) {
      counts.set(row.event_type, (counts.get(row.event_type) ?? 0) + 1)
    }
    return counts
  }, [rows])

  const visibleRows = useMemo(
    () => (eventType ? rows.filter((r) => r.event_type === eventType) : rows),
    [rows, eventType],
  )

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Reports</h1>
        <p className="text-sm text-muted">
          Policy activity log — items added, removed or adjusted, premium changes, and related
          events.
        </p>
      </div>

      <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-6">
        {EVENT_FILTERS.filter((f) => f.value).map((f) => (
          <button
            key={f.value}
            type="button"
            onClick={() => setEventType(eventType === f.value ? '' : f.value)}
            className={`rounded-lg border px-3 py-3 text-left shadow-sm ${
              eventType === f.value
                ? 'border-primary bg-accent-light'
                : 'border-border bg-surface hover:bg-page'
            }`}
          >
            <p className="text-xs text-muted">{f.label}</p>
            <p className="mt-1 text-xl font-semibold tabular-nums">
              {summary.get(f.value) ?? 0}
            </p>
          </button>
        ))}
      </div>

      <div className="flex flex-wrap items-center gap-3">
        <label className="inline-flex items-center gap-2 text-sm text-muted">
          <Filter size={14} />
          <select
            className="field-input w-auto"
            value={eventType}
            onChange={(e) => setEventType(e.target.value)}
          >
            {EVENT_FILTERS.map((f) => (
              <option key={f.value || 'all'} value={f.value}>
                {f.label}
              </option>
            ))}
          </select>
        </label>
        <p className="text-xs text-muted">
          {visibleRows.length} event{visibleRows.length === 1 ? '' : 's'}
        </p>
      </div>

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading activity…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && visibleRows.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No policy activity logged yet. Events appear when schedule items are added, removed,
          adjusted, or premiums change.
        </p>
      )}

      <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
        <table className="min-w-full text-sm">
          <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
            <tr>
              <th className="px-4 py-3">When</th>
              <th className="px-4 py-3">Event</th>
              <th className="px-4 py-3">Policy</th>
              <th className="px-4 py-3">Summary</th>
              <th className="px-4 py-3">Actor</th>
            </tr>
          </thead>
          <tbody>
            {visibleRows.map((row) => (
              <tr key={row.id} className="border-b border-border last:border-0 hover:bg-page/50">
                <td className="whitespace-nowrap px-4 py-3 text-muted">
                  {formatDate(row.created_at.slice(0, 10))}
                  <span className="block text-[11px] text-muted">
                    {new Date(row.created_at).toLocaleTimeString()}
                  </span>
                </td>
                <td className="px-4 py-3">
                  <span className="inline-flex items-center gap-1 rounded-full bg-accent-light px-2 py-0.5 text-xs font-medium text-primary">
                    <Activity size={12} />
                    {activityEventLabel(row.event_type)}
                  </span>
                </td>
                <td className="px-4 py-3">
                  {row.policy_id ? (
                    <Link
                      to={`/collections/policies/${row.policy_id}`}
                      className="font-medium text-primary hover:underline"
                    >
                      {row.policy_number ?? 'Policy'}
                    </Link>
                  ) : (
                    <span className="text-muted">{row.policy_number ?? '—'}</span>
                  )}
                </td>
                <td className="px-4 py-3">
                  <p className="font-medium text-gray-900">{row.summary}</p>
                  <ActivityDetails details={row.details} />
                </td>
                <td className="px-4 py-3 text-muted">
                  {row.actor_name || row.actor_email || 'System'}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}

function ActivityDetails({ details }: { details: Record<string, unknown> }) {
  const bits: string[] = []
  if (details.item_name) bits.push(String(details.item_name))
  if (details.section) bits.push(`Section: ${details.section}`)
  if (details.sum_insured != null) bits.push(`SI ${formatCurrency(Number(details.sum_insured))}`)
  if (details.premium != null) bits.push(`Premium ${formatCurrency(Number(details.premium))}`)
  if (details.previous_premium != null && details.new_premium != null) {
    bits.push(
      `${formatCurrency(Number(details.previous_premium))} → ${formatCurrency(Number(details.new_premium))}`,
    )
  }
  if (details.previous_sum_insured != null && details.new_sum_insured != null) {
    bits.push(
      `SI ${formatCurrency(Number(details.previous_sum_insured))} → ${formatCurrency(Number(details.new_sum_insured))}`,
    )
  }
  if (bits.length === 0) return null
  return <p className="mt-0.5 text-xs text-muted">{bits.join(' · ')}</p>
}
