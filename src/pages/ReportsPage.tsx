import { useEffect, useMemo, useState } from 'react'
import { ChevronDown, ChevronRight, Loader2 } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import {
  fetchClientSheet,
  formatPeriodLabel,
  formatSheetPremium,
  monthHasChanges,
  parseMonthLog,
  type ClientSheetRow,
  type ParsedMonthLog,
} from '../services/client-sheet.service'

export function ReportsPage() {
  const { accountId } = useAuth()
  const [rows, setRows] = useState<ClientSheetRow[]>([])
  const [periods, setPeriods] = useState<string[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [expandedPolicyId, setExpandedPolicyId] = useState<string | null>(null)
  const [expandedMonth, setExpandedMonth] = useState<string | null>(null)
  const [coverFilter, setCoverFilter] = useState('')
  const [changesOnly, setChangesOnly] = useState(false)

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void fetchClientSheet(accountId)
      .then((data) => {
        setRows(data.rows)
        setPeriods(data.periods)
      })
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load client sheet'))
      .finally(() => setLoading(false))
  }, [accountId])

  const coverTypes = useMemo(() => {
    return [...new Set(rows.map((r) => r.cover_type).filter(Boolean))] as string[]
  }, [rows])

  const visible = useMemo(() => {
    let list = coverFilter ? rows.filter((r) => r.cover_type === coverFilter) : rows
    if (changesOnly) {
      list = list.filter((r) => periods.some((p) => monthHasChanges(r.months[p])))
    }
    return list
  }, [rows, coverFilter, changesOnly, periods])

  const grandTotal = useMemo(
    () => visible.reduce((sum, r) => sum + (r.monthly_premium ?? 0), 0),
    [visible],
  )

  const changeCount = useMemo(() => {
    let n = 0
    for (const row of rows) {
      for (const p of periods) {
        if (monthHasChanges(row.months[p])) n += 1
      }
    }
    return n
  }, [rows, periods])

  function togglePolicy(id: string) {
    setExpandedPolicyId((cur) => (cur === id ? null : id))
    setExpandedMonth(null)
  }

  function toggleMonth(period: string) {
    setExpandedMonth((cur) => (cur === period ? null : period))
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Reports</h1>
        <p className="text-sm text-muted">
          Monthly endorsement notes — open a policy, then a month, for the full change breakdown.
        </p>
      </div>

      <div className="flex flex-wrap items-center gap-3">
        <label className="inline-flex items-center gap-2 text-sm text-muted">
          Cover type
          <select
            className="field-input w-auto"
            value={coverFilter}
            onChange={(e) => setCoverFilter(e.target.value)}
          >
            <option value="">All</option>
            {coverTypes.map((t) => (
              <option key={t} value={t}>
                {t}
              </option>
            ))}
          </select>
        </label>
        <label className="inline-flex items-center gap-2 text-sm text-muted">
          <input
            type="checkbox"
            checked={changesOnly}
            onChange={(e) => setChangesOnly(e.target.checked)}
            className="rounded border-border"
          />
          Months with changes only
        </label>
        <p className="text-xs text-muted">
          {visible.length} polic{visible.length === 1 ? 'y' : 'ies'} · {changeCount} change
          {changeCount === 1 ? '' : 's'} · Monthly total {formatSheetPremium(grandTotal)}
        </p>
      </div>

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading reports…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && rows.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No client sheet data yet. Monthly change notes from the broker client sheet will appear
          here.
        </p>
      )}

      {!loading && visible.length > 0 && (
        <div className="space-y-3">
          {visible.map((row) => {
            const open = expandedPolicyId === row.id
            const monthsWithNotes = periods.filter((p) => Boolean(row.months[p]))
            const monthsWithChanges = monthsWithNotes.filter((p) => monthHasChanges(row.months[p]))
            return (
              <article
                key={row.id}
                className="overflow-hidden rounded-xl border border-border bg-surface shadow-sm"
              >
                <button
                  type="button"
                  onClick={() => togglePolicy(row.id)}
                  className="flex w-full items-start gap-3 px-4 py-4 text-left hover:bg-page/60"
                >
                  <span className="mt-1 text-muted">
                    {open ? <ChevronDown size={18} /> : <ChevronRight size={18} />}
                  </span>
                  <div className="min-w-0 flex-1">
                    <div className="flex flex-wrap items-center gap-2">
                      <h2 className="text-base font-semibold text-gray-900">{row.policy_number}</h2>
                      {row.cover_type && (
                        <span className="rounded-md bg-page px-2 py-0.5 text-xs font-medium text-muted">
                          {row.cover_type}
                        </span>
                      )}
                      {monthsWithChanges.length > 0 && (
                        <span className="rounded-md bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-900">
                          {monthsWithChanges.length} month
                          {monthsWithChanges.length === 1 ? '' : 's'} with changes
                        </span>
                      )}
                    </div>
                    <p className="mt-1 truncate text-sm text-muted">
                      {row.insured_name ?? '—'}
                      {row.insurer ? ` · ${row.insurer}` : ''}
                      {row.renewal_month ? ` · Renews ${row.renewal_month}` : ''}
                    </p>
                  </div>
                  <div className="shrink-0 text-right">
                    <p className="text-sm font-semibold tabular-nums text-gray-900">
                      {formatSheetPremium(row.monthly_premium)}
                    </p>
                    <p className="text-xs text-muted">{row.frequency ?? 'Monthly'}</p>
                  </div>
                </button>

                {open && (
                  <div className="border-t border-border bg-page/40 px-4 py-4">
                    <div className="flex flex-wrap gap-2">
                      {(changesOnly ? monthsWithChanges : monthsWithNotes).map((period) => {
                        const changed = monthHasChanges(row.months[period])
                        const monthOpen = expandedMonth === period
                        return (
                          <button
                            key={period}
                            type="button"
                            onClick={() => toggleMonth(period)}
                            className={`rounded-lg border px-3 py-2 text-left text-sm transition ${
                              monthOpen
                                ? 'border-primary bg-surface shadow-sm'
                                : changed
                                  ? 'border-amber-200 bg-amber-50 text-amber-950 hover:border-amber-300'
                                  : 'border-border bg-surface text-muted hover:border-gray-300'
                            }`}
                          >
                            <span className="block text-xs font-medium uppercase tracking-wide opacity-80">
                              {formatPeriodLabel(period)}
                            </span>
                            <span className="mt-0.5 block font-medium">
                              {changed ? 'Changes logged' : 'No changes'}
                            </span>
                          </button>
                        )
                      })}
                    </div>

                    {expandedMonth && row.months[expandedMonth] && (
                      <MonthBreakdown
                        period={expandedMonth}
                        text={row.months[expandedMonth]}
                        parsed={parseMonthLog(row.months[expandedMonth])}
                      />
                    )}

                    {row.debit_details && (
                      <details className="mt-4 rounded-lg border border-border bg-surface px-3 py-2 text-sm">
                        <summary className="cursor-pointer font-medium text-gray-900">
                          Debit / payment details
                        </summary>
                        <pre className="mt-2 whitespace-pre-wrap font-sans text-xs text-muted">
                          {row.debit_details}
                        </pre>
                      </details>
                    )}
                  </div>
                )}
              </article>
            )
          })}
        </div>
      )}
    </div>
  )
}

function MonthBreakdown({
  period,
  text,
  parsed,
}: {
  period: string
  text: string
  parsed: ParsedMonthLog
}) {
  const hasStructured =
    parsed.cancelled.length > 0 ||
    parsed.added.length > 0 ||
    parsed.premiumNotes.length > 0 ||
    parsed.otherNotes.length > 0

  return (
    <div className="mt-4 rounded-xl border border-border bg-surface p-4 shadow-sm">
      <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
        <h3 className="text-sm font-semibold text-gray-900">{formatPeriodLabel(period)}</h3>
        <span
          className={`rounded-md px-2 py-0.5 text-xs font-medium ${
            parsed.hasChanges ? 'bg-amber-50 text-amber-900' : 'bg-page text-muted'
          }`}
        >
          {parsed.hasChanges ? 'Endorsement activity' : 'Steady month'}
        </span>
      </div>

      {hasStructured ? (
        <div className="space-y-4">
          {parsed.cancelled.length > 0 && (
            <BreakdownList title="Items cancelled" items={parsed.cancelled} tone="amber" />
          )}
          {parsed.added.length > 0 && (
            <BreakdownList title="Items / covers added" items={parsed.added} tone="green" />
          )}
          {parsed.premiumNotes.length > 0 && (
            <BreakdownList title="Premium & credits" items={parsed.premiumNotes} tone="slate" />
          )}
          {parsed.otherNotes.length > 0 && (
            <BreakdownList title="Other notes" items={parsed.otherNotes} tone="slate" />
          )}
        </div>
      ) : (
        <pre className="whitespace-pre-wrap font-sans text-sm leading-relaxed text-gray-800">
          {text}
        </pre>
      )}
    </div>
  )
}

function BreakdownList({
  title,
  items,
  tone,
}: {
  title: string
  items: string[]
  tone: 'amber' | 'green' | 'slate'
}) {
  const toneClass =
    tone === 'amber'
      ? 'border-amber-100 bg-amber-50/60'
      : tone === 'green'
        ? 'border-emerald-100 bg-emerald-50/60'
        : 'border-border bg-page'

  return (
    <div>
      <p className="mb-2 text-xs font-semibold uppercase tracking-wide text-muted">{title}</p>
      <ul className="space-y-1.5">
        {items.map((item) => (
          <li
            key={item}
            className={`rounded-lg border px-3 py-2 text-sm leading-relaxed text-gray-900 ${toneClass}`}
          >
            {item}
          </li>
        ))}
      </ul>
    </div>
  )
}
