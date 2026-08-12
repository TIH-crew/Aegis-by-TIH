import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { ArrowLeft, Check } from 'lucide-react'
import { CategoryTotalsTable } from '../components/crm/CategoryTotalsTable'
import { StageBadge } from '../components/crm/StageBadge'
import { useAuth } from '../context/AuthContext'
import { categoryForSection, sectionNoteForCategory } from '../config/cover-extras'
import { computeCategoryTotals } from '../lib/category-totals'
import { quoteIsAcceptable } from '../lib/rbac'
import { formatCurrency, formatDate } from '../lib/utils'
import { acceptQuotation, fetchQuotation } from '../services/crm.service'
import type { QuotationDetail } from '../types/crm'

export function QuotationDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { canViewQuoteMoney, canAcceptQuoteStage, isAdmin } = useAuth()
  const [quotation, setQuotation] = useState<QuotationDetail | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [accepting, setAccepting] = useState(false)

  useEffect(() => {
    if (!id) return
    void fetchQuotation(id)
      .then(setQuotation)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load quotation'))
      .finally(() => setLoading(false))
  }, [id])

  const showMoney = quotation ? canViewQuoteMoney(quotation.stage) : false
  const canAccept = quotation ? canAcceptQuoteStage(quotation.stage) : false
  const awaiting = quotation ? quoteIsAcceptable(quotation.stage) : false

  const categoryTotals = useMemo(() => {
    if (!quotation || !showMoney) return []
    // Accumulate ALL sections; map Fire → Building (portal category), not a raw "Fire" bucket.
    return computeCategoryTotals(
      quotation.risk_items.map((item) => ({
        category: categoryForSection(item.risk_category ?? item.risk_type ?? 'Uncategorised'),
        value: item.unit_cost ?? 0,
        premium: 0,
      })),
    )
  }, [quotation, showMoney])

  async function handleAccept() {
    if (!quotation || !canAccept) return
    setAccepting(true)
    setError(null)
    try {
      const updated = await acceptQuotation(quotation.id)
      setQuotation({ ...quotation, stage: updated.stage })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to accept quotation')
    } finally {
      setAccepting(false)
    }
  }

  if (loading) return <p className="text-sm text-muted">Loading quotation…</p>
  if (error && !quotation) return <p className="text-sm text-red-600">{error}</p>
  if (!quotation) return <p className="text-sm text-muted">Quotation not found.</p>

  if (!awaiting && !isAdmin) {
    return (
      <div className="space-y-4">
        <Link
          to="/collections/quotations"
          className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
        >
          <ArrowLeft size={14} /> Back to quotations
        </Link>
        <div className="rounded-lg border border-amber-200 bg-amber-50 p-6">
          <h1 className="text-lg font-semibold text-amber-950">{quotation.name}</h1>
          <p className="mt-2 text-sm text-amber-900">
            This quotation is still with the broker (
            <StageBadge stage={quotation.stage} />
            ). Financial detail and accept open when it reaches{' '}
            <strong>Awaiting client feedback</strong>.
          </p>
          {quotation.eta_date && (
            <p className="mt-2 text-sm text-amber-900">ETA: {formatDate(quotation.eta_date)}</p>
          )}
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <Link
        to="/collections/quotations"
        className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={14} /> Back to quotations
      </Link>

      {error && (
        <p className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </p>
      )}

      <div className="flex flex-wrap items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-semibold">{quotation.name}</h1>
          <p className="mt-1 text-sm text-muted">
            {quotation.quote_number ? `Quote ${quotation.quote_number}` : 'Quotation'}
            {quotation.broker_name ? ` · Broker ${quotation.broker_name}` : ''}
            {quotation.eta_date ? ` · ETA ${formatDate(quotation.eta_date)}` : ''}
          </p>
          <div className="mt-2">
            <StageBadge stage={quotation.stage} />
          </div>
        </div>
        {canAccept && (
          <button
            type="button"
            onClick={handleAccept}
            disabled={accepting}
            className="inline-flex items-center gap-2 rounded-lg bg-emerald-700 px-4 py-2 text-sm font-medium text-white hover:bg-emerald-800 disabled:opacity-60"
          >
            <Check size={14} />
            {accepting ? 'Accepting…' : 'Accept quote'}
          </button>
        )}
      </div>

      {!showMoney && (
        <p className="rounded-lg border border-border bg-page px-4 py-3 text-sm text-muted">
          Premiums and quoted values are hidden until the quotation is awaiting client feedback.
        </p>
      )}

      {showMoney && categoryTotals.length > 0 && (
        <CategoryTotalsTable
          totals={categoryTotals}
          valueLabel="Sum insured"
          showPremium={categoryTotals.some((row) => row.totalPremium > 0)}
        />
      )}

      {showMoney && quotation.amount != null && (
        <p className="text-sm">
          Deal amount:{' '}
          <span className="font-semibold tabular-nums">{formatCurrency(quotation.amount)}</span>
        </p>
      )}

      <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
        <div className="border-b border-border px-4 py-3">
          <h2 className="font-semibold">Risk items</h2>
          <p className="text-xs text-muted">
            Items on this quotation
            {!showMoney ? ' (values hidden)' : ''}
          </p>
        </div>
        {quotation.risk_items.length === 0 ? (
          <p className="p-4 text-sm text-muted">No risk items on this quotation yet.</p>
        ) : (
          <table className="min-w-full text-sm">
            <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
              <tr>
                <th className="px-4 py-2">Item</th>
                <th className="px-4 py-2">Category</th>
                {showMoney && <th className="px-4 py-2 text-right">Value</th>}
                <th className="px-4 py-2">Status</th>
              </tr>
            </thead>
            <tbody>
              {quotation.risk_items.map((item) => {
                const portalCategory = categoryForSection(
                  item.risk_type ?? item.risk_category ?? '',
                )
                const fireNote = sectionNoteForCategory(portalCategory)
                return (
                <tr key={item.id} className="border-b border-border last:border-0 hover:bg-page/40">
                  <td className="px-4 py-3 font-medium">{item.name}</td>
                  <td className="px-4 py-3 text-muted">
                    {portalCategory || '—'}
                    {fireNote ? ` · ${fireNote}` : ''}
                  </td>
                  {showMoney && (
                    <td className="px-4 py-3 text-right">
                      {item.unit_cost != null ? formatCurrency(item.unit_cost) : '—'}
                    </td>
                  )}
                  <td className="px-4 py-3">{item.risk_status ?? '—'}</td>
                </tr>
              )})}
            </tbody>
          </table>
        )}
      </div>

      {!canAccept && awaiting && (
        <p className="text-sm text-muted">
          This quote is ready for feedback. Only authorised admin users can accept on the platform.
        </p>
      )}

      <button
        type="button"
        className="text-sm text-muted hover:text-gray-900"
        onClick={() => navigate('/collections/quotations')}
      >
        Back to list
      </button>
    </div>
  )
}
