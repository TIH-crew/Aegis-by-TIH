import { useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useSearch } from '../context/SearchContext'
import { listEmployees } from '../services/employee.service'
import { recordCustody } from '../services/assignment.service'
import type { CustodyAction, Employee } from '../types/employee'
import type { RiskItem } from '../types'

interface CustodyFormPageProps {
  action: CustodyAction
  title: string
  intro: ReactNode
  submitLabel: string
  itemFilter: (item: RiskItem) => boolean
  requireEmployee?: boolean
  showDueDate?: boolean
  showKeepAssignment?: boolean
}

export function CustodyFormPage({
  action,
  title,
  intro,
  submitLabel,
  itemFilter,
  requireEmployee = true,
  showDueDate = false,
  showKeepAssignment = false,
}: CustodyFormPageProps) {
  const { accountId } = useAuth()
  const { riskItems, refreshRiskItems } = useSearch()
  const [searchParams] = useSearchParams()
  const [employees, setEmployees] = useState<Employee[]>([])
  const [employeeId, setEmployeeId] = useState(searchParams.get('employeeId') ?? '')
  const [selected, setSelected] = useState<string[]>([])
  const [notes, setNotes] = useState('')
  const [dueAt, setDueAt] = useState('')
  const [keepAssignment, setKeepAssignment] = useState(true)
  const [query, setQuery] = useState('')
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [done, setDone] = useState<string | null>(null)

  useEffect(() => {
    if (!accountId) return
    void listEmployees(accountId).then((rows) =>
      setEmployees(rows.filter((row) => row.status === 'active')),
    )
  }, [accountId])

  const items = useMemo(() => {
    const q = query.trim().toLowerCase()
    return riskItems.filter(itemFilter).filter((item) => {
      if (!q) return true
      return [item.name, item.asset_tag, item.category, item.employee_name]
        .filter(Boolean)
        .some((value) => String(value).toLowerCase().includes(q))
    })
  }, [riskItems, itemFilter, query])

  function toggle(id: string) {
    setSelected((current) =>
      current.includes(id) ? current.filter((row) => row !== id) : [...current, id],
    )
  }

  async function handleSubmit() {
    if (!accountId) return
    if (requireEmployee && !employeeId) {
      setError('Select an employee.')
      return
    }
    if (selected.length === 0) {
      setError('Select at least one item.')
      return
    }
    setSaving(true)
    setError(null)
    setDone(null)
    try {
      await recordCustody({
        accountId,
        riskItemIds: selected,
        employeeId: employeeId || null,
        action,
        notes,
        dueAt: dueAt || null,
        keepAssignment,
      })
      await refreshRiskItems()
      setSelected([])
      setDone(`${submitLabel} completed for ${selected.length} item${selected.length === 1 ? '' : 's'}.`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="mx-auto max-w-4xl space-y-4">
      <div>
        <h1 className="text-2xl font-semibold">{title}</h1>
        <div className="mt-2 rounded-lg border border-border bg-surface p-4 text-sm text-muted">
          {intro}
        </div>
      </div>

      {error && (
        <p className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </p>
      )}
      {done && (
        <p className="rounded-md border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">
          {done}
        </p>
      )}

      <div className="grid gap-4 md:grid-cols-2">
        {requireEmployee && (
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Employee</span>
            <select
              className="field-input"
              value={employeeId}
              onChange={(e) => setEmployeeId(e.target.value)}
            >
              <option value="">Select employee</option>
              {employees.map((employee) => (
                <option key={employee.id} value={employee.id}>
                  {employee.full_name}
                  {employee.branch_name ? ` · ${employee.branch_name}` : ''}
                </option>
              ))}
            </select>
            <Link to="/collections/employees/new" className="mt-1 inline-block text-xs text-primary">
              Add employee
            </Link>
          </label>
        )}
        {showDueDate && (
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Expected return</span>
            <input
              type="date"
              className="field-input"
              value={dueAt}
              onChange={(e) => setDueAt(e.target.value)}
            />
          </label>
        )}
        <label className="block text-sm md:col-span-2">
          <span className="mb-1 block font-medium">Notes</span>
          <textarea
            className="field-input min-h-20"
            value={notes}
            onChange={(e) => setNotes(e.target.value)}
          />
        </label>
        {showKeepAssignment && (
          <label className="flex items-center gap-2 text-sm md:col-span-2">
            <input
              type="checkbox"
              checked={keepAssignment}
              onChange={(e) => setKeepAssignment(e.target.checked)}
            />
            Keep this employee as the assigned custodian after check-in
          </label>
        )}
      </div>

      <input
        className="field-input"
        placeholder="Filter items…"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />

      <div className="overflow-hidden rounded-lg border border-border bg-surface">
        <table className="min-w-full text-sm">
          <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
            <tr>
              <th className="w-10 px-3 py-2" />
              <th className="px-3 py-2">Item</th>
              <th className="px-3 py-2">Category</th>
              <th className="px-3 py-2">Assigned to</th>
              <th className="px-3 py-2">Custody</th>
            </tr>
          </thead>
          <tbody>
            {items.map((item) => (
              <tr key={item.id} className="border-b border-border last:border-0">
                <td className="px-3 py-2">
                  <input
                    type="checkbox"
                    checked={selected.includes(item.id)}
                    onChange={() => toggle(item.id)}
                  />
                </td>
                <td className="px-3 py-2 font-medium">{item.name}</td>
                <td className="px-3 py-2 text-muted">{item.category}</td>
                <td className="px-3 py-2 text-muted">{item.employee_name ?? '—'}</td>
                <td className="px-3 py-2 capitalize text-muted">
                  {(item.assignment_status ?? 'unassigned').replace('_', ' ')}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {items.length === 0 && (
          <p className="px-4 py-6 text-sm text-muted">No matching items.</p>
        )}
      </div>

      <button
        type="button"
        onClick={() => void handleSubmit()}
        disabled={saving}
        className="rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white disabled:opacity-60"
      >
        {saving ? 'Saving…' : submitLabel}
      </button>
    </div>
  )
}

export function AssignToPage() {
  return (
    <CustodyFormPage
      action="assign"
      title="Assign to"
      submitLabel="Assign items"
      itemFilter={() => true}
      intro={
        <>
          <p>
            <strong>Assign to</strong> sets the employee who is responsible for an asset — a laptop,
            phone, or vehicle that lives with that person.
          </p>
          <p className="mt-2">
            This is the standing custodian. Check-out is for a temporary loan on top of, or instead
            of, that assignment.
          </p>
        </>
      }
    />
  )
}

export function CheckOutPage() {
  return (
    <CustodyFormPage
      action="check_out"
      title="Check out"
      submitLabel="Check out items"
      showDueDate
      itemFilter={(item) => item.assignment_status !== 'checked_out'}
      intro={
        <>
          <p>
            <strong>Check out</strong> is a temporary loan: a pool vehicle, camera, or tool leaves
            the branch with an employee for a job and is expected back.
          </p>
          <p className="mt-2">
            The item stays on the policy schedule. Custody changes to checked out so you can see who
            has it and when it should return. Use Check in when it comes back.
          </p>
        </>
      }
    />
  )
}

export function CheckInPage() {
  return (
    <CustodyFormPage
      action="check_in"
      title="Check in"
      submitLabel="Check in items"
      requireEmployee={false}
      showKeepAssignment
      itemFilter={(item) => item.assignment_status === 'checked_out'}
      intro={
        <>
          <p>
            <strong>Check in</strong> returns a checked-out item to the branch. The movement is
            logged against the employee who had it.
          </p>
          <p className="mt-2">
            Leave “keep assigned” on if the person still owns the asset (their laptop). Turn it off
            for pool items that go back into store for the next person.
          </p>
        </>
      }
    />
  )
}
