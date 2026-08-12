import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import { StageBadge } from '../components/crm/StageBadge'
import { useAuth } from '../context/AuthContext'
import { formatDate } from '../lib/utils'
import { quoteIsAcceptable } from '../lib/rbac'
import { fetchQuotations } from '../services/crm.service'
import type { QuotationSummary } from '../types/crm'

export function QuotationsPage() {
  const navigate = useNavigate()
  const { accountId } = useAuth()
  const [items, setItems] = useState<QuotationSummary[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void fetchQuotations()
      .then(setItems)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load quotations'))
      .finally(() => setLoading(false))
  }, [accountId])

  return (
    <div className="space-y-4">
      <div>
        <h1 className="text-2xl font-semibold">Quotations</h1>
        <p className="text-sm text-muted">
          Quotations with your broker — stage and ETA. Premiums stay hidden until awaiting client
          feedback.
        </p>
      </div>

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading quotations…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && items.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No quotations found for your organization.
        </p>
      )}

      <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
        <table className="min-w-full text-sm">
          <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
            <tr>
              <th className="px-4 py-3">Quotation</th>
              <th className="px-4 py-3">Broker</th>
              <th className="px-4 py-3">Stage</th>
              <th className="px-4 py-3">ETA</th>
              <th className="px-4 py-3" />
            </tr>
          </thead>
          <tbody>
            {items.map((q) => {
              const openable = quoteIsAcceptable(q.stage)
              return (
                <tr key={q.id} className="border-b border-border last:border-0 hover:bg-page/50">
                  <td className="px-4 py-3">
                    <p className="font-medium text-gray-900">{q.name}</p>
                    <p className="text-xs text-muted">{q.quote_number ?? '—'}</p>
                  </td>
                  <td className="px-4 py-3 text-muted">{q.broker_name ?? 'The Insurance Hub'}</td>
                  <td className="px-4 py-3">
                    <StageBadge stage={q.stage} />
                  </td>
                  <td className="px-4 py-3 text-muted">
                    {q.eta_date ? formatDate(q.eta_date) : '—'}
                  </td>
                  <td className="px-4 py-3 text-right">
                    {openable ? (
                      <button
                        type="button"
                        onClick={() => navigate(`/collections/quotations/${q.id}`)}
                        className="rounded-lg bg-primary px-3 py-1.5 text-xs font-medium text-white"
                      >
                        Open
                      </button>
                    ) : (
                      <span className="text-xs text-muted">In progress</span>
                    )}
                  </td>
                </tr>
              )
            })}
          </tbody>
        </table>
      </div>
    </div>
  )
}
