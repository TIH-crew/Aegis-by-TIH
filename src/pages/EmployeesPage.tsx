import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Loader2, MessageCircle, Plus, UserRound } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { listEmployees } from '../services/employee.service'
import { whatsappHref } from '../lib/extensions'
import type { Employee } from '../types/employee'

export function EmployeesPage() {
  const { accountId } = useAuth()
  const [items, setItems] = useState<Employee[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [query, setQuery] = useState('')

  useEffect(() => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    void listEmployees(accountId)
      .then(setItems)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load employees'))
      .finally(() => setLoading(false))
  }, [accountId])

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return items
    return items.filter((employee) =>
      [employee.full_name, employee.job_title, employee.branch_name, employee.whatsapp_number]
        .filter(Boolean)
        .some((value) => String(value).toLowerCase().includes(q)),
    )
  }, [items, query])

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold">Employees</h1>
          <p className="text-sm text-muted">
            People who hold company assets. Assign items to them, then check items out and back in.
          </p>
        </div>
        <Link
          to="/collections/employees/new"
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white"
        >
          <Plus size={14} />
          Add employee
        </Link>
      </div>

      <input
        className="field-input max-w-md"
        placeholder="Search name, branch, WhatsApp…"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading employees…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {!loading && !error && filtered.length === 0 && (
        <p className="rounded-lg border border-dashed border-border bg-surface p-6 text-sm text-muted">
          No employees yet. Add a person with a WhatsApp number, then use Assign to attach items.
        </p>
      )}

      <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 xl:grid-cols-3">
        {filtered.map((employee) => {
          const wa = whatsappHref(employee.whatsapp_number)
          return (
            <Link
              key={employee.id}
              to={`/collections/employees/${employee.id}`}
              className="rounded-lg border border-border bg-surface p-4 shadow-sm hover:border-accent/40"
            >
              <div className="flex items-start gap-3">
                <div className="flex h-16 w-16 shrink-0 items-center justify-center overflow-hidden rounded-full bg-gray-100 text-muted">
                  {employee.image_url ? (
                    <img src={employee.image_url} alt="" className="h-full w-full object-cover" />
                  ) : (
                    <UserRound size={28} />
                  )}
                </div>
                <div className="min-w-0 flex-1">
                  <p className="truncate font-semibold text-gray-900">{employee.full_name}</p>
                  <p className="text-xs text-muted">{employee.job_title ?? 'Employee'}</p>
                  <p className="text-xs text-muted">{employee.branch_name ?? 'No branch'}</p>
                  <p className="mt-2 text-xs text-muted">
                    {employee.item_count ?? 0} attached item
                    {(employee.item_count ?? 0) === 1 ? '' : 's'}
                  </p>
                  {employee.drivers_licence_verified_at && (
                    <p className="mt-1 text-xs font-medium text-emerald-700">Licence verified</p>
                  )}
                  {wa && (
                    <span className="mt-2 inline-flex items-center gap-1 text-xs text-emerald-700">
                      <MessageCircle size={12} />
                      {employee.whatsapp_number}
                    </span>
                  )}
                </div>
              </div>
            </Link>
          )
        })}
      </div>
    </div>
  )
}
