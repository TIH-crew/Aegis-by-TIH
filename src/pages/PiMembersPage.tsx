import { useEffect, useMemo, useState } from 'react'
import { Loader2, UserRound } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { listSubsidiaryAccounts } from '../services/account-hierarchy.service'
import {
  fetchPiMembersForGroup,
  formatPiPremium,
} from '../services/pi-members.service'
import type { PiMember } from '../types/auth'

export function PiMembersPage() {
  const { accountId, homeAccountId, isBranchScoped } = useAuth()
  const [rows, setRows] = useState<PiMember[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [policyFilter, setPolicyFilter] = useState('')
  const [statusFilter, setStatusFilter] = useState('')

  useEffect(() => {
    const base = accountId ?? homeAccountId
    if (!base) return
    setLoading(true)
    setError(null)
    void (async () => {
      try {
        const ids = isBranchScoped
          ? [base]
          : [base, ...(await listSubsidiaryAccounts(homeAccountId ?? base).catch(() => [])).map((s) => s.id)]
        const unique = [...new Set(ids)]
        const data = await fetchPiMembersForGroup(unique)
        setRows(data)
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load PI members')
      } finally {
        setLoading(false)
      }
    })()
  }, [accountId, homeAccountId, isBranchScoped])

  const policies = useMemo(
    () => [...new Set(rows.map((r) => r.policy_number).filter(Boolean))] as string[],
    [rows],
  )
  const statuses = useMemo(
    () => [...new Set(rows.map((r) => r.payment_status).filter(Boolean))] as string[],
    [rows],
  )

  const visible = useMemo(() => {
    return rows.filter((r) => {
      if (policyFilter && r.policy_number !== policyFilter) return false
      if (statusFilter && r.payment_status !== statusFilter) return false
      return true
    })
  }, [rows, policyFilter, statusFilter])

  const totalPremium = useMemo(
    () => visible.reduce((sum, r) => sum + (r.premium ?? 0), 0),
    [visible],
  )

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">PI members</h1>
        <p className="text-sm text-muted">
          Professional indemnity covered individuals and premiums (separate from staff / employees).
        </p>
      </div>

      <div className="flex flex-wrap items-center gap-3">
        <label className="inline-flex items-center gap-2 text-sm text-muted">
          Policy
          <select
            className="field-input w-auto"
            value={policyFilter}
            onChange={(e) => setPolicyFilter(e.target.value)}
          >
            <option value="">All</option>
            {policies.map((p) => (
              <option key={p} value={p}>
                {p}
              </option>
            ))}
          </select>
        </label>
        <label className="inline-flex items-center gap-2 text-sm text-muted">
          Payment
          <select
            className="field-input w-auto"
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
          >
            <option value="">All</option>
            {statuses.map((s) => (
              <option key={s} value={s}>
                {s}
              </option>
            ))}
          </select>
        </label>
        <p className="text-xs text-muted">
          {visible.length} member{visible.length === 1 ? '' : 's'} · Premium total{' '}
          {formatPiPremium(totalPremium)}
        </p>
      </div>

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading PI members…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && visible.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No PI members for this company yet.
        </p>
      )}

      {!loading && visible.length > 0 && (
        <div className="overflow-x-auto rounded-xl border border-border bg-surface shadow-sm">
          <table className="min-w-full text-sm">
            <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
              <tr>
                <th className="px-3 py-3">Member</th>
                <th className="px-3 py-3">Entity</th>
                <th className="px-3 py-3">ID / Council</th>
                <th className="px-3 py-3">Contact</th>
                <th className="px-3 py-3">Policy</th>
                <th className="px-3 py-3 text-right">Premium</th>
                <th className="px-3 py-3">Status</th>
              </tr>
            </thead>
            <tbody>
              {visible.map((row) => (
                <tr key={row.id} className="border-b border-border last:border-0">
                  <td className="px-3 py-3">
                    <span className="inline-flex items-center gap-2 font-medium text-gray-900">
                      <UserRound size={14} className="text-muted" />
                      {row.full_name}
                    </span>
                  </td>
                  <td className="px-3 py-3 text-muted">{row.entity_name ?? '—'}</td>
                  <td className="px-3 py-3 text-xs text-muted">
                    <div>{row.id_number ?? '—'}</div>
                    {row.council_number && <div>{row.council_number}</div>}
                  </td>
                  <td className="px-3 py-3 text-xs text-muted">
                    <div>{row.email ?? '—'}</div>
                    {row.phone && <div>{row.phone}</div>}
                  </td>
                  <td className="px-3 py-3 font-medium">{row.policy_number ?? '—'}</td>
                  <td className="px-3 py-3 text-right tabular-nums">
                    {formatPiPremium(row.premium)}
                  </td>
                  <td className="px-3 py-3">
                    <span
                      className={`rounded-md px-2 py-0.5 text-xs font-medium ${
                        (row.payment_status ?? '').toLowerCase() === 'paid'
                          ? 'bg-emerald-50 text-emerald-800'
                          : 'bg-page text-muted'
                      }`}
                    >
                      {row.payment_status ?? '—'}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
            <tfoot>
              <tr className="bg-page font-semibold">
                <td className="px-3 py-3" colSpan={5}>
                  Total
                </td>
                <td className="px-3 py-3 text-right tabular-nums">
                  {formatPiPremium(totalPremium)}
                </td>
                <td className="px-3 py-3" />
              </tr>
            </tfoot>
          </table>
        </div>
      )}
    </div>
  )
}
