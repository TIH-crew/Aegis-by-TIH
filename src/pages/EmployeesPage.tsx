import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { ArrowLeft, Loader2, Plus, Upload } from 'lucide-react'
import { StatusBadge } from '../components/collections/StatusBadge'
import { EmptyState, MetricTile, PageHeader } from '../components/workspace/WorkspaceUi'
import { useAuth } from '../context/AuthContext'
import { listEmployees } from '../services/employee.service'
import {
  buildImportErrorCsv,
  getWorkforceOverview,
  importEmployees,
  listWorkforceExceptions,
  parseEmployeeCsv,
  parseEmployeeXlsx,
  resolveWorkforceException,
  suggestColumnMap,
  type ImportDraftRow,
} from '../services/workforce.service'
import type { Employee, WorkforceException } from '../types/employee'

export function EmployeesPage() {
  const { accountId, user, can } = useAuth()
  const [items, setItems] = useState<Employee[]>([])
  const [overview, setOverview] = useState({
    total: 0,
    active: 0,
    inactive: 0,
    pendingInvites: 0,
    openExceptions: 0,
  })
  const [exceptions, setExceptions] = useState<WorkforceException[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [query, setQuery] = useState('')
  const [statusFilter, setStatusFilter] = useState('all')
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [showImport, setShowImport] = useState(false)
  const [importRaw, setImportRaw] = useState(
    'full_name,email,employee_number,department,job_title,phone\nJane Doe,jane@example.com,E001,Finance,Accountant,+27821234567\n',
  )
  const [importRows, setImportRows] = useState<ImportDraftRow[]>([])
  const [importBusy, setImportBusy] = useState(false)
  const [importResult, setImportResult] = useState<string | null>(null)
  const [importFileName, setImportFileName] = useState('employees.csv')
  const [errorCsv, setErrorCsv] = useState<string | null>(null)
  const [deptFilter, setDeptFilter] = useState('all')

  // Mutation requires workforce_hr — brokers have employees read, not HR write
  const canHr = can('workforce_hr')
  const canBroker = can('workforce_broker')

  const refresh = useCallback(async () => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    try {
      const [emps, ov, ex] = await Promise.all([
        listEmployees(accountId),
        getWorkforceOverview(accountId),
        listWorkforceExceptions(accountId),
      ])
      setItems(emps)
      setOverview(ov)
      setExceptions(ex.filter((e) => e.status === 'open' || e.status === 'assigned'))
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load people')
    } finally {
      setLoading(false)
    }
  }, [accountId])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const departments = useMemo(() => {
    return [...new Set(items.map((e) => e.department).filter(Boolean) as string[])].sort()
  }, [items])

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase()
    return items.filter((employee) => {
      if (statusFilter === 'active' && employee.status !== 'active') return false
      if (statusFilter === 'inactive' && employee.status !== 'inactive') return false
      if (statusFilter === 'pending' && employee.invitation_status !== 'pending') return false
      if (deptFilter !== 'all' && (employee.department ?? '') !== deptFilter) return false
      if (!q) return true
      return [employee.full_name, employee.job_title, employee.branch_name, employee.employee_number, employee.email, employee.department]
        .filter(Boolean)
        .some((value) => String(value).toLowerCase().includes(q))
    })
  }, [items, query, statusFilter, deptFilter])

  const selected = items.find((e) => e.id === selectedId) ?? null

  async function onImportFile(file: File) {
    setImportFileName(file.name)
    setErrorCsv(null)
    setImportResult(null)
    if (file.name.toLowerCase().endsWith('.xlsx') || file.name.toLowerCase().endsWith('.xls')) {
      const buf = await file.arrayBuffer()
      const parsed = await parseEmployeeXlsx(buf)
      setImportRows(parsed.rows)
      setImportRaw(`(XLSX) ${file.name} · ${parsed.rows.length} rows · map ${JSON.stringify(suggestColumnMap(parsed.headers))}`)
      return
    }
    const text = await file.text()
    setImportRaw(text)
    setImportRows(parseEmployeeCsv(text))
  }

  async function runImport() {
    if (!accountId) return
    setImportBusy(true)
    setImportResult(null)
    setErrorCsv(null)
    try {
      const rows = importRows.length ? importRows : parseEmployeeCsv(importRaw)
      setImportRows(rows)
      const hashSource = importRaw.startsWith('(XLSX)')
        ? JSON.stringify(rows)
        : importRaw
      const hashBuf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(hashSource))
      const hash = [...new Uint8Array(hashBuf)].map((b) => b.toString(16).padStart(2, '0')).join('')
      const res = await importEmployees(accountId, {
        fileName: importFileName,
        sourceHash: hash,
        rows,
        userId: user?.id,
      })
      const invalid = (res.results as { row: number; status: string; message?: string }[]).filter(
        (r) => r.status === 'invalid',
      )
      if (invalid.length) setErrorCsv(buildImportErrorCsv(invalid))
      setImportResult(
        res.duplicated
          ? `Same file already imported (batch ${res.batchId}).`
          : `Imported. Batch ${res.batchId}.`,
      )
      await refresh()
    } catch (err) {
      setImportResult(err instanceof Error ? err.message : 'Import failed')
    } finally {
      setImportBusy(false)
    }
  }

  return (
    <div className="space-y-4">
      <Link
        to="/people"
        className="inline-flex items-center gap-1 text-sm text-muted hover:text-ink"
      >
        <ArrowLeft size={14} /> Back to overview
      </Link>
      <PageHeader
        title="Employees"
        description="Corporate workforce directory. Routine HR adds do not need broker approval. Zoho Contacts are never created automatically."
        actions={
          canHr ? (
            <div className="flex flex-wrap gap-2">
              <button
                type="button"
                className="inline-flex items-center gap-2 rounded-md border border-border bg-surface px-3.5 py-2 text-sm font-medium hover:bg-page"
                onClick={() => {
                  setShowImport(true)
                  setImportRows(parseEmployeeCsv(importRaw))
                }}
              >
                <Upload size={14} />
                Bulk import
              </button>
              <Link
                to="/people/new"
                className="inline-flex items-center gap-2 rounded-md bg-primary px-3.5 py-2 text-sm font-medium text-white hover:bg-burgundy-dark"
              >
                <Plus size={14} />
                Add person
              </Link>
            </div>
          ) : null
        }
      />

      <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-5">
        <MetricTile label="Total" value={String(overview.total)} />
        <MetricTile label="Active" value={String(overview.active)} />
        <MetricTile label="Pending invites" value={String(overview.pendingInvites)} />
        <MetricTile label="Inactive" value={String(overview.inactive)} />
        <MetricTile
          label="Open reviews"
          value={String(overview.openExceptions)}
          unavailable={overview.openExceptions === 0}
        />
      </div>

      <div className="flex flex-wrap gap-2">
        <input
          className="field-input max-w-md"
          placeholder="Search name, email, department, employee number…"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          aria-label="Search people"
        />
        <select
          className="field-input w-auto"
          value={statusFilter}
          onChange={(e) => setStatusFilter(e.target.value)}
        >
          <option value="all">All statuses</option>
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
          <option value="pending">Pending invite</option>
        </select>
        <select
          className="field-input w-auto"
          value={deptFilter}
          onChange={(e) => setDeptFilter(e.target.value)}
        >
          <option value="all">All departments</option>
          {departments.map((d) => (
            <option key={d} value={d}>
              {d}
            </option>
          ))}
        </select>
      </div>

      {loading && (
        <p className="flex items-center gap-2 text-sm text-muted">
          <Loader2 size={14} className="animate-spin" /> Loading directory…
        </p>
      )}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {canBroker && exceptions.length > 0 && (
        <section className="ws-panel space-y-2 p-4">
          <h2 className="text-sm font-semibold">Exceptions requiring review</h2>
          <ul className="space-y-2 text-sm">
            {exceptions.slice(0, 8).map((ex) => (
              <li key={ex.id} className="flex flex-wrap items-center justify-between gap-2 border-b border-border/40 pb-2">
                <span>
                  <span className="font-medium">{ex.title}</span>
                  <span className="ml-2 text-xs text-muted">
                    {ex.exception_type.replace(/_/g, ' ')} · {ex.severity}
                  </span>
                </span>
                <button
                  type="button"
                  className="text-xs underline"
                  onClick={() =>
                    void resolveWorkforceException(
                      accountId!,
                      ex.id,
                      'Reviewed and accepted',
                      user?.id,
                    ).then(() => refresh())
                  }
                >
                  Resolve
                </button>
              </li>
            ))}
          </ul>
        </section>
      )}

      {!loading && !error && filtered.length === 0 && (
        <EmptyState
          title="No people yet"
          description="Add employees individually or import a CSV. They stay in AEGIS — not Zoho Contacts."
          action={
            canHr ? (
              <Link to="/people/new" className="text-sm font-medium text-primary underline">
                Add person
              </Link>
            ) : undefined
          }
        />
      )}

      <div className="grid gap-4 lg:grid-cols-[minmax(0,1fr)_minmax(280px,340px)]">
        <div className="ws-panel overflow-hidden">
          <div className="overflow-x-auto">
            <table className="ws-table min-w-[720px]">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Role</th>
                  <th>Dept</th>
                  <th>Invite</th>
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
                    <td className="font-medium text-ink">
                      <Link
                        to={`/people/${employee.id}`}
                        className="hover:underline"
                        onClick={(e) => e.stopPropagation()}
                      >
                        {employee.full_name}
                      </Link>
                      {employee.employee_number ? (
                        <span className="mt-0.5 block text-[11px] text-muted">{employee.employee_number}</span>
                      ) : null}
                    </td>
                    <td>{employee.job_title ?? '—'}</td>
                    <td>{employee.department ?? '—'}</td>
                    <td className="text-xs">{(employee.invitation_status ?? 'not_invited').replace(/_/g, ' ')}</td>
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
            <p className="text-sm text-muted">
              Select a person for a quick summary. Open the record for invites, leave processing and CRM promotion.
            </p>
          ) : (
            <div className="space-y-3 text-sm">
              <div>
                <p className="text-base font-semibold text-ink">{selected.full_name}</p>
                <p className="text-muted">{selected.job_title ?? 'No title'}</p>
              </div>
              <dl className="grid grid-cols-[100px_1fr] gap-y-1 text-xs">
                <dt className="text-muted">Email</dt>
                <dd>{selected.email ?? '—'}</dd>
                <dt className="text-muted">Invite</dt>
                <dd>{(selected.invitation_status ?? 'not_invited').replace(/_/g, ' ')}</dd>
                <dt className="text-muted">CRM</dt>
                <dd>
                  {canBroker
                    ? (selected.zoho_contact_link_status ?? 'none')
                    : 'Visible to authorised brokers'}
                </dd>
                <dt className="text-muted">Assets</dt>
                <dd>{selected.item_count ?? 0}</dd>
              </dl>
              <Link to={`/people/${selected.id}`} className="inline-block text-sm text-primary underline">
                Open full record
              </Link>
            </div>
          )}
        </aside>
      </div>

      {showImport && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4">
          <div className="max-h-[90vh] w-full max-w-2xl overflow-y-auto rounded-lg bg-surface p-5 shadow-lg">
            <h2 className="text-lg font-semibold">Bulk employee import</h2>
            <p className="mt-1 text-sm text-muted">
              Upload → preview → confirm. No writes during preview. Match on organisation + employee
              number / email. Names alone never merge. WhatsApp is optional; never invented.
            </p>
            <input
              type="file"
              accept=".csv,.xlsx,.xls,text/csv"
              className="mt-3 block w-full text-sm"
              onChange={(e) => {
                const f = e.target.files?.[0]
                if (f) void onImportFile(f)
              }}
            />
            <textarea
              className="mt-3 h-32 w-full rounded border border-border p-2 font-mono text-xs"
              value={importRaw}
              onChange={(e) => {
                setImportRaw(e.target.value)
                setImportFileName('employees.csv')
                setImportRows(parseEmployeeCsv(e.target.value))
              }}
            />
            {importRows.length > 0 && (
              <div className="mt-3 max-h-40 overflow-auto rounded border border-border text-xs">
                <table className="w-full">
                  <thead>
                    <tr className="bg-page text-left">
                      <th className="p-1">Name</th>
                      <th className="p-1">Emp no</th>
                      <th className="p-1">Email</th>
                      <th className="p-1">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {importRows.slice(0, 25).map((r, i) => (
                      <tr key={i} className="border-t border-border/50">
                        <td className="p-1">{r.fullName || '—'}</td>
                        <td className="p-1">{r.employeeNumber || '—'}</td>
                        <td className="p-1">{r.email || '—'}</td>
                        <td className="p-1 text-red-700">{r.error ?? 'ok'}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
            <p className="mt-2 text-xs text-muted">
              {importRows.filter((r) => !r.error && !r.exclude).length} valid ·{' '}
              {importRows.filter((r) => r.error).length} with errors
            </p>
            {importResult && <p className="mt-2 text-sm">{importResult}</p>}
            {errorCsv && (
              <a
                className="mt-2 inline-block text-sm text-primary underline"
                href={`data:text/csv;charset=utf-8,${encodeURIComponent(errorCsv)}`}
                download="import-errors.csv"
              >
                Download error report
              </a>
            )}
            <div className="mt-4 flex justify-end gap-2">
              <button type="button" className="ws-btn-secondary text-sm" onClick={() => setShowImport(false)}>
                Close
              </button>
              <button
                type="button"
                className="ws-btn-primary text-sm"
                disabled={importBusy || importRows.every((r) => r.error)}
                onClick={() => void runImport()}
              >
                {importBusy ? 'Importing…' : 'Confirm import'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
