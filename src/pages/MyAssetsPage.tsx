import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { listAssignmentsForEmployee } from '../services/assignment.service'
import { listEmployees } from '../services/employee.service'
import type { ItemAssignment } from '../types/employee'

export function MyAssetsPage() {
  const { accountId, portalUser } = useAuth()
  const [rows, setRows] = useState<ItemAssignment[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!accountId || !portalUser?.email) {
      setLoading(false)
      return
    }
    let cancelled = false
    void (async () => {
      setLoading(true)
      try {
        const employees = await listEmployees(accountId)
        const email = portalUser.email.toLowerCase()
        const match = employees.find((r) => (r.email ?? '').toLowerCase() === email)
        if (!match) {
          if (!cancelled) setRows([])
          return
        }
        const linked = await listAssignmentsForEmployee(accountId, match.id)
        if (!cancelled) setRows(linked)
      } finally {
        if (!cancelled) setLoading(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [accountId, portalUser?.email])

  return (
    <div className="mx-auto max-w-3xl space-y-4">
      <div>
        <Link to="/me" className="text-sm text-muted hover:text-gray-900">
          ← My profile
        </Link>
        <h1 className="mt-2 text-2xl font-semibold">My linked items</h1>
        <p className="text-sm text-muted">
          Simplified view of assets you are assigned to or have checked out — no premiums or sums
          insured.
        </p>
      </div>

      {loading && <p className="text-sm text-muted">Loading…</p>}

      {!loading && rows.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No linked items yet.
        </p>
      )}

      {rows.length > 0 && (
        <ul className="divide-y divide-border rounded-lg border border-border bg-surface shadow-sm">
          {rows.map((row) => (
            <li key={row.id} className="flex flex-wrap items-center justify-between gap-2 px-4 py-3">
              <div>
                <p className="font-medium text-gray-900">{row.item_name ?? 'Item'}</p>
                <p className="text-xs text-muted">
                  {row.action.replace('_', ' ')} · {row.status}
                  {row.notes ? ` · ${row.notes}` : ''}
                </p>
              </div>
              {row.risk_item_id && (
                <Link
                  to={`/collections/risk-items/${row.risk_item_id}`}
                  className="text-sm text-primary hover:underline"
                >
                  View
                </Link>
              )}
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
