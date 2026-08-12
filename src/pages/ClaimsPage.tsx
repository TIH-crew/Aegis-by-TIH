import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { ChevronRight, Loader2, Plus } from 'lucide-react'
import { StageBadge } from '../components/crm/StageBadge'
import { useAuth } from '../context/AuthContext'
import { formatCurrency, formatDate } from '../lib/utils'
import { fetchClaims } from '../services/crm.service'
import type { ClaimSummary } from '../types/crm'

export function ClaimsPage() {
  const { accountId } = useAuth()
  const [items, setItems] = useState<ClaimSummary[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void fetchClaims()
      .then(setItems)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load claims'))
      .finally(() => setLoading(false))
  }, [accountId])

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold">Claims</h1>
          <p className="text-sm text-muted">
            Open a claim for CRM status, next actions, invoices, quotes and confirmation docs.
          </p>
        </div>
        <Link
          to="/collections/claims/new"
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white"
        >
          <Plus size={14} />
          New claim
        </Link>
      </div>

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading claims…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && items.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No claims yet. Create a new claim against one of your risk items.
        </p>
      )}

      <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
        <table className="min-w-full text-sm">
          <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
            <tr>
              <th className="px-4 py-3">Claim</th>
              <th className="px-4 py-3">Policy</th>
              <th className="px-4 py-3">Amount</th>
              <th className="px-4 py-3">Lodged</th>
              <th className="px-4 py-3">Status</th>
              <th className="px-4 py-3" />
            </tr>
          </thead>
          <tbody>
            {items.map((c) => (
              <tr key={c.id} className="border-b border-border last:border-0 hover:bg-page/60">
                <td className="px-4 py-3">
                  <Link
                    to={`/collections/claims/${c.portal_id ?? c.id}`}
                    className="font-medium text-primary hover:underline"
                  >
                    {c.name}
                  </Link>
                  {c.schedule_item_name && (
                    <p className="mt-0.5 text-xs text-muted">{c.schedule_item_name}</p>
                  )}
                </td>
                <td className="px-4 py-3 text-muted">{c.policy_name ?? '—'}</td>
                <td className="px-4 py-3 tabular-nums text-muted">
                  {c.claim_amount != null ? formatCurrency(c.claim_amount) : '—'}
                </td>
                <td className="px-4 py-3 text-muted">
                  {c.created_time ? formatDate(c.created_time.slice(0, 10)) : '—'}
                </td>
                <td className="px-4 py-3">
                  {c.status ? <StageBadge stage={c.status} /> : '—'}
                </td>
                <td className="px-4 py-3 text-right">
                  <Link
                    to={`/collections/claims/${c.portal_id ?? c.id}`}
                    className="inline-flex items-center gap-1 text-xs font-medium text-primary hover:underline"
                  >
                    Open <ChevronRight size={14} />
                  </Link>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
