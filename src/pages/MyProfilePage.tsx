import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { listEmployees } from '../services/employee.service'
import { listAssignmentsForEmployee } from '../services/assignment.service'
import type { Employee } from '../types/employee'
import type { ItemAssignment } from '../types/employee'

export function MyProfilePage() {
  const { accountId, portalUser, user, appRole, isAdmin } = useAuth()
  const [employee, setEmployee] = useState<Employee | null>(null)
  const [assignments, setAssignments] = useState<ItemAssignment[]>([])
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
        const rows = await listEmployees(accountId)
        const email = portalUser.email.toLowerCase()
        const match =
          rows.find((r) => (r.email ?? '').toLowerCase() === email) ??
          rows.find((r) => (r.full_name ?? '').toLowerCase() === (portalUser.full_name ?? '').toLowerCase()) ??
          null
        if (cancelled) return
        setEmployee(match)
        if (match) {
          const linked = await listAssignmentsForEmployee(accountId, match.id).catch(() => [])
          if (!cancelled) setAssignments(linked.filter((a) => a.status === 'open'))
        }
      } finally {
        if (!cancelled) setLoading(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [accountId, portalUser?.email, portalUser?.full_name])

  if (loading) return <p className="text-sm text-muted">Loading your profile…</p>

  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">My profile</h1>
        <p className="text-sm text-muted">
          {appRole === 'employee'
            ? 'Employee self-service — update your details and see attached items.'
            : 'Your portal profile.'}
        </p>
      </div>

      <div className="rounded-lg border border-border bg-surface p-5 shadow-sm">
        <dl className="grid grid-cols-1 gap-3 text-sm sm:grid-cols-2">
          <div>
            <dt className="text-xs uppercase text-muted">Signed in as</dt>
            <dd className="font-medium">{user?.email ?? portalUser?.email}</dd>
          </div>
          <div>
            <dt className="text-xs uppercase text-muted">Role</dt>
            <dd className="font-medium capitalize">{appRole}</dd>
          </div>
          <div>
            <dt className="text-xs uppercase text-muted">Name</dt>
            <dd className="font-medium">
              {employee?.full_name ?? portalUser?.full_name ?? '—'}
            </dd>
          </div>
          <div>
            <dt className="text-xs uppercase text-muted">Job title</dt>
            <dd className="font-medium">{employee?.job_title ?? '—'}</dd>
          </div>
          <div>
            <dt className="text-xs uppercase text-muted">Branch</dt>
            <dd className="font-medium">{employee?.branch_name ?? '—'}</dd>
          </div>
          <div>
            <dt className="text-xs uppercase text-muted">WhatsApp</dt>
            <dd className="font-medium">{employee?.whatsapp_number ?? '—'}</dd>
          </div>
        </dl>
        {!employee && (
          <p className="mt-4 text-sm text-amber-800">
            No employee record is linked to your email yet. Ask an admin to add you under Employees.
          </p>
        )}
        {employee && isAdmin && (
          <Link
            to={`/collections/employees/${employee.id}`}
            className="mt-4 inline-block text-sm font-medium text-primary hover:underline"
          >
            Open full employee record
          </Link>
        )}
      </div>

      <div className="rounded-lg border border-border bg-surface p-5 shadow-sm">
        <h2 className="font-semibold">Currently attached items</h2>
        <p className="text-xs text-muted">Assets assigned or checked out to you (no financial detail).</p>
        {assignments.length === 0 ? (
          <p className="mt-3 text-sm text-muted">No open assignments.</p>
        ) : (
          <ul className="mt-3 divide-y divide-border">
            {assignments.map((row) => (
              <li key={row.id} className="flex items-center justify-between gap-3 py-2 text-sm">
                <span className="font-medium">{row.item_name ?? 'Item'}</span>
                <span className="text-xs capitalize text-muted">{row.action.replace('_', ' ')}</span>
              </li>
            ))}
          </ul>
        )}
        <Link to="/me/assets" className="mt-3 inline-block text-sm text-primary hover:underline">
          View all linked items
        </Link>
      </div>
    </div>
  )
}
