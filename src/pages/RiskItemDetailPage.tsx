import { useEffect, useState } from 'react'
import { Link, useLocation, useParams } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { StatusBadge } from '../components/collections/StatusBadge'
import { FigureWithSource, IntegrationState } from '../components/workspace/WorkspaceUi'
import { useBranches } from '../context/BranchesContext'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { lifecycleLabel } from '../lib/risk-items-view'
import { cn, formatCurrency, formatDate } from '../lib/utils'
import { listEmployees } from '../services/employee.service'
import type { RiskItem } from '../types'
import type { Employee } from '../types/employee'

type Tab =
  | 'overview'
  | 'location'
  | 'finance'
  | 'tax'
  | 'insurance'
  | 'documents'
  | 'history'

const TABS: { id: Tab; label: string }[] = [
  { id: 'overview', label: 'Overview' },
  { id: 'location', label: 'Location & custody' },
  { id: 'finance', label: 'Finance' },
  { id: 'tax', label: 'Tax' },
  { id: 'insurance', label: 'Insurance' },
  { id: 'documents', label: 'Documents' },
  { id: 'history', label: 'History' },
]

export function RiskItemDetailPage() {
  const { id } = useParams<{ id: string }>()
  const location = useLocation()
  const { branches } = useBranches()
  const { accountId } = useAuth()
  const dataService = useDataService()
  const [item, setItem] = useState<RiskItem | null>(null)
  const [employees, setEmployees] = useState<Employee[]>([])
  const [tab, setTab] = useState<Tab>('overview')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [toast, setToast] = useState<string | null>(
    (location.state as { toast?: string } | null)?.toast ?? null,
  )

  useEffect(() => {
    if (!id || !dataService) return
    let cancelled = false
    setLoading(true)
    dataService
      .getRiskItem(id)
      .then((data) => {
        if (!cancelled && data) setItem(data)
      })
      .catch((err) => {
        if (!cancelled) setError(err instanceof Error ? err.message : 'Failed to load record')
      })
      .finally(() => {
        if (!cancelled) setLoading(false)
      })
    return () => {
      cancelled = true
    }
  }, [id, dataService])

  useEffect(() => {
    if (!accountId) return
    void listEmployees(accountId).then((rows) =>
      setEmployees(rows.filter((row) => row.status === 'active')),
    )
  }, [accountId])

  if (loading) return <p className="text-sm text-muted">Loading asset…</p>
  if (!item) return <p className="text-sm text-red-600">Asset not found.</p>

  const branchName = branches.find((b) => b.id === item.branch_id)?.name ?? item.branch
  const assignee =
    employees.find((e) => e.id === item.employee_id)?.full_name ?? item.employee_name

  const extraFields = Object.entries(item.zoho_fields ?? {}).filter(
    ([key, value]) =>
      value != null &&
      String(value).trim() !== '' &&
      !(item.category === 'Motor' && key === 'Registration_Number'),
  )

  return (
    <div className="mx-auto max-w-5xl">
      <Link
        to="/assets"
        className="mb-4 inline-flex items-center gap-2 text-sm text-muted hover:text-ink"
      >
        <ArrowLeft size={16} />
        Back to assets
      </Link>

      {toast && (
        <p className="mb-4 rounded-md border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-900">
          {toast}
          <button
            type="button"
            className="ml-3 text-emerald-800 underline"
            onClick={() => setToast(null)}
          >
            Dismiss
          </button>
        </p>
      )}

      {error && (
        <p className="mb-4 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </p>
      )}

      <div className="mb-4 flex flex-wrap items-start justify-between gap-3">
        <div>
          <div className="mb-1 flex flex-wrap items-center gap-2">
            <h1 className="text-xl font-semibold tracking-tight text-ink sm:text-2xl">{item.name}</h1>
            <StatusBadge status={lifecycleLabel(item)} />
          </div>
          <p className="font-mono text-xs text-muted">{item.asset_tag}</p>
          <p className="mt-1 text-sm text-muted">
            View only for insured schedule changes — request updates via your broker.
            Insured items may be third-party owned and are not automatically fixed assets.
          </p>
        </div>
        {item.image_url && (
          <img
            src={item.image_url}
            alt=""
            className="h-20 w-20 rounded-md border border-border object-cover"
          />
        )}
      </div>

      <div className="mb-5 flex gap-1 overflow-x-auto border-b border-border">
        {TABS.map((t) => (
          <button
            key={t.id}
            type="button"
            onClick={() => setTab(t.id)}
            className={cn(
              '-mb-px shrink-0 border-b-2 px-3 py-2.5 text-sm font-medium',
              tab === t.id
                ? 'border-primary text-primary'
                : 'border-transparent text-muted hover:text-ink',
            )}
          >
            {t.label}
          </button>
        ))}
      </div>

      {tab === 'overview' && (
        <div className="space-y-4">
          <div className="ws-panel grid gap-4 p-4 sm:grid-cols-3">
            <FigureWithSource
              label="Acquisition cost"
              value={
                item.purchase_value != null ? formatCurrency(item.purchase_value) : 'Not captured'
              }
              source="Purchase record"
              effectiveDate={item.purchase_date ? formatDate(item.purchase_date) : undefined}
            />
            <FigureWithSource
              label="Net book value"
              value="Not connected"
              source="GL / depreciation"
            />
            <FigureWithSource
              label="Insured / declared value"
              value={
                item.insurance_status === 'Insured with us'
                  ? formatCurrency(item.unit_cost)
                  : 'Not on our schedule'
              }
              source="Insurance schedule (unit cost)"
              effectiveDate={item.record_date ? formatDate(item.record_date) : undefined}
            />
          </div>

          <div className="ws-panel grid grid-cols-1 gap-3 p-4 md:grid-cols-2">
            <ReadonlyField label="Asset class" value={item.category || '—'} />
            <ReadonlyField label="Insurance status" value={item.insurance_status || '—'} />
            <ReadonlyField label="Serial number" value={item.serial_number || '—'} />
            <ReadonlyField label="Record date" value={item.record_date ? formatDate(item.record_date) : '—'} />
            <div className="md:col-span-2">
              <ReadonlyField label="Description" value={item.description || '—'} />
            </div>
            {item.category === 'Motor' && (
              <>
                <ReadonlyField
                  label="Number plate"
                  value={String(item.zoho_fields?.Registration_Number ?? '—')}
                />
                <ReadonlyField label="Rental vehicle" value={item.is_rental ? 'Yes' : 'No'} />
              </>
            )}
          </div>

          {extraFields.length > 0 && (
            <div className="ws-panel p-4">
              <h3 className="mb-3 text-sm font-semibold">Additional details</h3>
              <div className="grid grid-cols-1 gap-3 md:grid-cols-2">
                {extraFields.map(([key, value]) => (
                  <ReadonlyField key={key} label={key.replace(/_/g, ' ')} value={String(value)} />
                ))}
              </div>
            </div>
          )}
        </div>
      )}

      {tab === 'location' && (
        <div className="ws-panel grid gap-3 p-4 md:grid-cols-2">
          <ReadonlyField label="Branch / location" value={branchName || '—'} />
          <ReadonlyField label="Custodian" value={assignee || 'Unassigned'} />
          <ReadonlyField label="Assignment status" value={item.assignment_status.replace('_', ' ')} />
          <ReadonlyField
            label="Coordinates"
            value={
              item.latitude != null && item.longitude != null
                ? `${item.latitude}, ${item.longitude}`
                : '—'
            }
          />
          <div className="md:col-span-2 flex flex-wrap gap-2 pt-2">
            <Link to="/movements/assign" className="rounded-md border border-border px-3 py-1.5 text-sm hover:bg-page">
              Assign
            </Link>
            <Link to="/movements/check-out" className="rounded-md border border-border px-3 py-1.5 text-sm hover:bg-page">
              Check out
            </Link>
            <Link to="/movements/check-in" className="rounded-md border border-border px-3 py-1.5 text-sm hover:bg-page">
              Check in
            </Link>
          </div>
        </div>
      )}

      {tab === 'finance' && (
        <div className="space-y-3">
          <div className="ws-panel grid gap-3 p-4 md:grid-cols-2">
            <FigureWithSource
              label="Acquisition cost"
              value={
                item.purchase_value != null ? formatCurrency(item.purchase_value) : 'Not captured'
              }
              source="Purchase value"
              effectiveDate={item.purchase_date ? formatDate(item.purchase_date) : undefined}
            />
            <FigureWithSource
              label="Repair / reinstatement estimate"
              value={formatCurrency(item.repair_cost)}
              source="Register"
            />
            <ReadonlyField label="Asset financed" value={item.is_financed ? 'Yes' : 'No'} />
            {item.is_financed && (
              <>
                <ReadonlyField label="Finance house" value={item.finance_house || '—'} />
                <ReadonlyField label="Finance account" value={item.finance_account_number || '—'} />
                <ReadonlyField
                  label="Finance amount"
                  value={item.finance_amount != null ? formatCurrency(item.finance_amount) : '—'}
                />
              </>
            )}
          </div>
          <IntegrationState
            title="Depreciation & net book value"
            description="Accounting depreciation runs, GL mapping, and NBV are not connected for this entity. Figures will appear here once an accounting integration and asset-class policies are configured."
            status="not_connected"
          />
        </div>
      )}

      {tab === 'tax' && (
        <div className="space-y-3">
          <IntegrationState
            title="Tax register"
            description="Book-to-tax comparison, SARS allowances, brought-into-use dates, and recoupment review require a versioned tax rule engine. No deduction is inferred from book depreciation."
            status="not_connected"
          />
          <IntegrationState
            title="VAT treatment"
            description="VAT on acquisition / disposal is not yet modelled on this asset. Capture will be configurable with effective dates."
            status="awaiting_mapping"
          />
        </div>
      )}

      {tab === 'insurance' && (
        <div className="space-y-3">
          <div className="ws-panel grid gap-3 p-4 md:grid-cols-2">
            <ReadonlyField label="Insurance status" value={item.insurance_status || '—'} />
            <ReadonlyField label="Section" value={item.insurance_section || '—'} />
            <FigureWithSource
              label="Insured / declared value"
              value={
                item.insurance_status === 'Insured with us'
                  ? formatCurrency(item.unit_cost)
                  : '—'
              }
              source="Schedule unit cost"
              effectiveDate={item.record_date ? formatDate(item.record_date) : undefined}
            />
            <FigureWithSource
              label="Replacement / repair estimate"
              value={formatCurrency(item.repair_cost)}
              source="Register repair cost"
            />
            <ReadonlyField label="Zoho risk id" value={item.zoho_risk_id || 'Not linked'} />
          </div>
          {Array.isArray(item.item_extensions) && item.item_extensions.length > 0 && (
            <div className="ws-panel p-4">
              <h3 className="mb-3 text-sm font-semibold">Extensions & add-ons</h3>
              <ul className="space-y-1 text-sm">
                {(item.item_extensions as Array<Record<string, unknown>>).map((ext, idx) => {
                  const label = String(ext.label ?? ext.name ?? ext.code ?? `Extension ${idx + 1}`)
                  const sumInsured =
                    ext.sum_insured != null ? ` · ${formatCurrency(Number(ext.sum_insured))}` : ''
                  return (
                    <li key={`${label}-${idx}`} className="rounded-md border border-border bg-page px-3 py-2">
                      {label}
                      {sumInsured}
                    </li>
                  )
                })}
              </ul>
            </div>
          )}
          <p className="text-sm text-muted">
            Policy matching and endorsement history live under{' '}
            <Link to="/insurance" className="text-primary underline">
              Insurance
            </Link>
            .
          </p>
        </div>
      )}

      {tab === 'documents' && (
        <div className="ws-panel space-y-3 p-4">
          <ReadonlyField
            label="Proof of purchase"
            value={
              item.purchase_invoice_url
                ? item.purchase_invoice_name || 'View document'
                : 'None on file'
            }
          />
          {item.purchase_invoice_url && (
            <a
              href={item.purchase_invoice_url}
              target="_blank"
              rel="noreferrer"
              className="inline-block text-sm text-primary underline"
            >
              Open invoice / proof of purchase
            </a>
          )}
          {!item.image_url && !item.purchase_invoice_url && (
            <p className="text-sm text-muted">No documents attached to this asset yet.</p>
          )}
        </div>
      )}

      {tab === 'history' && (
        <div className="space-y-3">
          <div className="ws-panel p-4 text-sm text-muted">
            Full chronological movements (acquisition, transfer, impairment, disposal) will appear
            here when the movements ledger is extended. Current custody workflows remain under{' '}
            <Link to="/movements" className="text-primary underline">
              Movements
            </Link>
            .
          </div>
          <div className="ws-panel p-4 text-sm">
            <p className="font-medium text-ink">Register timestamps</p>
            <p className="mt-1 text-muted">Created {formatDate(item.created_at)}</p>
            <p className="text-muted">Updated {formatDate(item.updated_at)}</p>
          </div>
        </div>
      )}
    </div>
  )
}

function ReadonlyField({ label, value }: { label: string; value: string }) {
  return (
    <div>
      <p className="mb-1 text-xs font-semibold uppercase tracking-wide text-muted">{label}</p>
      <p className="rounded-md border border-border bg-page px-3 py-2 text-sm text-ink">{value}</p>
    </div>
  )
}
