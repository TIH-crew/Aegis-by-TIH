import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Loader2, Plus, QrCode } from 'lucide-react'
import { StatusBadge } from '../components/collections/StatusBadge'
import { EmptyState, PageHeader } from '../components/workspace/WorkspaceUi'
import { useAuth } from '../context/AuthContext'
import { listEmployees } from '../services/employee.service'
import type { Employee } from '../types/employee'

export function EmployeesPage() {
  const { accountId } = useAuth()
  const [items, setItems] = useState<Employee[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [query, setQuery] = useState('')
  const [selectedId, setSelectedId] = useState<string | null>(null)

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void listEmployees(accountId)
      .then(setItems)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load people'))
      .finally(() => setLoading(false))
  }, [accountId])

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return items
    return items.filter((employee) =>
      [employee.full_name, employee.job_title, employee.branch_name, employee.employee_number]
        .filter(Boolean)
        .some((value) => String(value).toLowerCase().includes(q)),
    )
  }, [items, query])

  const selected = items.find((e) => e.id === selectedId) ?? null

  return (
    <div className="space-y-4">
      <PageHeader
        title="People"
        description="Custodian directory for the selected legal entity. Phone numbers are hidden in the directory by default."
        actions={
          <Link
            to="/people/new"
            className="inline-flex items-center gap-2 rounded-md bg-primary px-3.5 py-2 text-sm font-medium text-white hover:bg-burgundy-dark"
          >
            <Plus size={14} />
            Add person
          </Link>
        }
      />

      <input
        className="field-input max-w-md"
        placeholder="Search name, role, branch, employee number…"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        aria-label="Search people"
      />

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading directory…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && filtered.length === 0 && (
        <EmptyState
          title="No custodians yet"
          description="Add a person, then use Movements → Assign to attach assets."
          action={
            <Link to="/people/new" className="text-sm font-medium text-primary underline">
              Add person
            </Link>
          }
        />
      )}

      <div className="grid gap-4 lg:grid-cols-[minmax(0,1fr)_minmax(280px,340px)]">
        <div className="ws-panel overflow-hidden">
          <div className="overflow-x-auto">
            <table className="ws-table min-w-[640px]">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Role</th>
                  <th>Branch</th>
                  <th className="text-right">Assets</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {filtered.map((employee) => (
                  <tr
                    key={employee.id}
                    className="cursor-pointer"
                    onClick={() => setSelectedId(employee.id)}
                  >
                    <td className="font-medium text-ink">{employee.full_name}</td>
                    <td>{employee.job_title ?? '—'}</td>
                    <td>{employee.branch_name ?? '—'}</td>
                    <td className="text-right tabular-nums">{employee.item_count ?? 0}</td>
                    <td>
                      <StatusBadge status={employee.status} />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <aside className="ws-panel p-4">
          {!selected ? (
            <p className="text-sm text-muted">Select a person to view custody summary and claim QR access.</p>
          ) : (
            <div className="space-y-3">
              <div>
                <h2 className="text-base font-semibold text-ink">{selected.full_name}</h2>
                <p className="text-sm text-muted">{selected.job_title ?? 'Custodian'}</p>
                <p className="text-xs text-muted">{selected.branch_name ?? 'No branch'}</p>
              </div>
              <p className="text-sm">
                <span className="font-medium tabular-nums">{selected.item_count ?? 0}</span>{' '}
                assigned asset{(selected.item_count ?? 0) === 1 ? '' : 's'}
              </p>
              {selected.drivers_licence_verified_at && (
                <p className="text-xs font-medium text-emerald-700">Drivers licence verified</p>
              )}
              <div className="flex flex-col gap-2 border-t border-border pt-3">
                <Link
                  to={`/people/${selected.id}`}
                  className="rounded-md border border-border px-3 py-2 text-center text-sm font-medium hover:bg-page"
                >
                  Open full profile
                </Link>
                <Link
                  to={`/people/${selected.id}`}
                  className="inline-flex items-center justify-center gap-1.5 rounded-md bg-page px-3 py-2 text-sm text-muted hover:text-ink"
                  title="Claim QR requires profile access"
                >
                  <QrCode size={14} />
                  Claim QR (secondary)
                </Link>
              </div>
              <p className="text-[11px] text-muted">
                WhatsApp and phone numbers are available on the profile for users with people access — not shown in the directory grid.
              </p>
            </div>
          )}
        </aside>
      </div>
    </div>
  )
}
