import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import { StageBadge } from '../components/crm/StageBadge'
import { PageHeader } from '../components/workspace/WorkspaceUi'
import { useAuth } from '../context/AuthContext'
import { fetchPolicies } from '../services/crm.service'
import { formatCurrency, formatDate } from '../lib/utils'
import type { PolicySummary } from '../types/crm'

function daysUntil(dateStr: string | null): number | null {
  if (!dateStr) return null
  const [y, m, d] = dateStr.split('-').map(Number)
  const target = new Date(y, (m ?? 1) - 1, d ?? 1)
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  target.setHours(0, 0, 0, 0)
  return Math.round((target.getTime() - today.getTime()) / 86400000)
}

export function PoliciesPage() {
  const navigate = useNavigate()
  const { accountId } = useAuth()
  const [items, setItems] = useState<PolicySummary[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void fetchPolicies()
      .then(setItems)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load policies'))
      .finally(() => setLoading(false))
  }, [accountId])

  return (
    <div className="space-y-4">
      <PageHeader
        title="Policies"
        description="Coverage schedule, premiums, renewal dates, and policy documents for this legal entity."
      />

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading policies…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && items.length === 0 && (
        <p className="ws-panel border-dashed px-5 py-8 text-sm text-muted">
          No policies found for this company.
        </p>
      )}

      <div className="ws-panel overflow-hidden">
        <div className="overflow-x-auto">
        <table className="ws-table min-w-[720px]">
          <thead>
            <tr>
              <th>Policy</th>
              <th>Insurer</th>
              <th>Premium</th>
              <th>Renewal date</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {items.map((p) => {
              const days = daysUntil(p.renewal_date)
              return (
                <tr
                  key={p.id}
                  className="cursor-pointer border-b border-border last:border-0 hover:bg-page/50"
                  onClick={() => navigate(`/insurance/policies/${p.id}`)}
                >
                  <td className="px-4 py-3">
                    <Link
                      to={`/insurance/policies/${p.id}`}
                      className="font-medium text-primary hover:underline"
                      onClick={(e) => e.stopPropagation()}
                    >
                      {p.policy_number}
                    </Link>
                  </td>
                  <td className="px-4 py-3 text-muted">{p.insurer ?? '—'}</td>
                  <td className="px-4 py-3">
                    {p.premium != null ? formatCurrency(p.premium) : '—'}
                  </td>
                  <td className="px-4 py-3">
                    {p.renewal_date ? (
                      <div>
                        <p className="font-medium text-gray-900">{formatDate(p.renewal_date)}</p>
                        {days != null && (
                          <p
                            className={`text-xs ${
                              days < 0
                                ? 'text-red-600'
                                : days <= 30
                                  ? 'text-amber-700'
                                  : 'text-muted'
                            }`}
                          >
                            {days < 0
                              ? `${Math.abs(days)} day${Math.abs(days) === 1 ? '' : 's'} overdue`
                              : days === 0
                                ? 'Renews today'
                                : `${days} day${days === 1 ? '' : 's'} left`}
                          </p>
                        )}
                      </div>
                    ) : (
                      <span className="text-muted">—</span>
                    )}
                  </td>
                  <td className="px-4 py-3">
                    {p.status ? <StageBadge stage={p.status} /> : '—'}
                  </td>
                </tr>
              )
            })}
          </tbody>
        </table>
        </div>
      </div>
    </div>
  )
}
