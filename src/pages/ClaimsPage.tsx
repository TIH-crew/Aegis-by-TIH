import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Loader2, Plus } from 'lucide-react'
import { StageBadge } from '../components/crm/StageBadge'
import { useAuth } from '../context/AuthContext'
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
          <p className="text-sm text-muted">Claims linked to your policies in Zoho CRM.</p>
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
              <th className="px-4 py-3">Status</th>
            </tr>
          </thead>
          <tbody>
            {items.map((c) => (
              <tr key={c.id} className="border-b border-border last:border-0">
                <td className="px-4 py-3 font-medium">{c.name}</td>
                <td className="px-4 py-3 text-muted">{c.policy_name ?? '—'}</td>
                <td className="px-4 py-3">
                  {c.status ? <StageBadge stage={c.status} /> : '—'}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
