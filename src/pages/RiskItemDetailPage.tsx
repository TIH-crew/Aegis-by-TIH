import { useEffect, useState } from 'react'
import { Link, useLocation, useParams } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { useBranches } from '../context/BranchesContext'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { listEmployees } from '../services/employee.service'
import type { RiskItem } from '../types'
import type { Employee } from '../types/employee'
import { formatCurrency, formatDate } from '../lib/utils'

type Tab = 'details' | 'activity' | 'linked'

export function RiskItemDetailPage() {
  const { id } = useParams<{ id: string }>()
  const location = useLocation()
  const { branches } = useBranches()
  const { accountId } = useAuth()
  const dataService = useDataService()
  const [item, setItem] = useState<RiskItem | null>(null)
  const [employees, setEmployees] = useState<Employee[]>([])
  const [tab, setTab] = useState<Tab>('details')
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

  if (loading) return <p className="text-sm text-muted">Loading record...</p>
  if (!item) return <p className="text-sm text-red-600">Record not found.</p>

  const branchName = branches.find((b) => b.id === item.branch_id)?.name
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
        to="/collections/risk-items"
        className="mb-4 inline-flex items-center gap-2 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={16} />
        Back to Risk Items
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

      <div className="mb-4">
        <h1 className="text-2xl font-semibold">{item.name}</h1>
        <p className="text-xs text-muted">Ref {item.asset_tag}</p>
        <p className="mt-1 text-sm text-muted">
          View only — changes to insured items are requested via your broker on the policy.
        </p>
      </div>

      <div className="mb-6 flex gap-6 border-b border-border">
        {(['details', 'activity', 'linked'] as Tab[]).map((t) => (
          <button
            key={t}
            type="button"
            onClick={() => setTab(t)}
            className={`border-b-2 px-1 pb-3 text-sm font-medium capitalize ${
              tab === t
                ? 'border-accent text-accent'
                : 'border-transparent text-muted hover:text-gray-900'
            }`}
          >
            {t === 'details' ? 'Record details' : t === 'linked' ? 'Linked records' : 'Activity'}
          </button>
        ))}
      </div>

      {tab === 'details' && (
        <div className="rounded-lg border border-border bg-surface p-6 shadow-sm">
          <div className="mb-6 flex justify-center">
            <div className="flex h-48 w-full max-w-md items-center justify-center rounded-lg border border-border bg-gray-50 text-muted">
              {item.image_url ? (
                <img src={item.image_url} alt="" className="max-h-full max-w-full object-contain" />
              ) : (
                <span className="text-sm">Asset image</span>
              )}
            </div>
          </div>

          <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
            <ReadonlyField label="Item name" value={item.name} />
            <ReadonlyField label="Unit cost" value={formatCurrency(item.unit_cost)} />
            <ReadonlyField label="Repair cost" value={formatCurrency(item.repair_cost)} />
            <ReadonlyField
              label="Record date"
              value={item.record_date ? formatDate(item.record_date) : '—'}
            />
            <ReadonlyField label="Category" value={item.category || '—'} />
            <ReadonlyField label="Insurance status" value={item.insurance_status || '—'} />
            <ReadonlyField label="Assigned to" value={assignee || 'Unassigned'} />
            <ReadonlyField label="Branch" value={branchName || '—'} />
            <ReadonlyField label="Serial number" value={item.serial_number || '—'} />
            {item.category === 'Motor' && (
              <>
                <ReadonlyField
                  label="Number plate"
                  value={String(item.zoho_fields?.Registration_Number ?? '—')}
                />
                <ReadonlyField
                  label="Rental vehicle"
                  value={item.is_rental ? 'Yes' : 'No'}
                />
                {item.is_rental && (
                  <>
                    <ReadonlyField label="Rental company" value={item.rental_company || '—'} />
                    <ReadonlyField
                      label="Rental period"
                      value={
                        item.rental_start_date || item.rental_end_date
                          ? `${item.rental_start_date ?? '?'} – ${item.rental_end_date ?? '?'}`
                          : '—'
                      }
                    />
                  </>
                )}
              </>
            )}
            <ReadonlyField
              label="Purchase value"
              value={
                item.purchase_value != null ? formatCurrency(item.purchase_value) : '—'
              }
            />
            <ReadonlyField
              label="Purchase date"
              value={item.purchase_date ? formatDate(item.purchase_date) : '—'}
            />
            <ReadonlyField
              label="Proof of purchase"
              value={
                item.purchase_invoice_url
                  ? item.purchase_invoice_name || 'View document'
                  : '—'
              }
            />
            {item.purchase_invoice_url && (
              <div className="md:col-span-2 text-sm">
                <a
                  href={item.purchase_invoice_url}
                  target="_blank"
                  rel="noreferrer"
                  className="text-primary underline"
                >
                  Open invoice / proof of purchase
                </a>
              </div>
            )}
            <ReadonlyField label="Financed" value={item.is_financed ? 'Yes' : 'No'} />
            {item.is_financed && (
              <>
                <ReadonlyField label="Finance house" value={item.finance_house || '—'} />
                <ReadonlyField
                  label="Finance account"
                  value={item.finance_account_number || '—'}
                />
                <ReadonlyField
                  label="Finance amount"
                  value={
                    item.finance_amount != null ? formatCurrency(item.finance_amount) : '—'
                  }
                />
              </>
            )}
            <div className="md:col-span-2">
              <ReadonlyField label="Description" value={item.description || '—'} />
            </div>
          </div>

          {Array.isArray(item.item_extensions) && item.item_extensions.length > 0 && (
            <div className="mt-6 border-t border-border pt-6">
              <h3 className="mb-3 text-sm font-semibold text-gray-900">Extensions & add-ons</h3>
              <ul className="space-y-1 text-sm text-gray-800">
                {(item.item_extensions as Array<Record<string, unknown>>).map((ext, idx) => {
                  const label =
                    String(ext.label ?? ext.name ?? ext.code ?? `Extension ${idx + 1}`)
                  const sumInsured =
                    ext.sum_insured != null
                      ? ` · ${formatCurrency(Number(ext.sum_insured))}`
                      : ''
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

          {extraFields.length > 0 && (
            <div className="mt-6 border-t border-border pt-6">
              <h3 className="mb-3 text-sm font-semibold text-gray-900">Additional details</h3>
              <div className="grid grid-cols-1 gap-3 md:grid-cols-2">
                {extraFields.map(([key, value]) => (
                  <ReadonlyField
                    key={key}
                    label={key.replace(/_/g, ' ')}
                    value={String(value)}
                  />
                ))}
              </div>
            </div>
          )}

          <p className="mt-4 text-xs text-muted">
            Current value: {formatCurrency(item.unit_cost)}
          </p>
        </div>
      )}

      {tab === 'activity' && (
        <div className="rounded-lg border border-border bg-surface p-6 text-sm text-muted">
          Activity for this item appears in Reports when schedule changes are logged.
        </div>
      )}

      {tab === 'linked' && (
        <div className="rounded-lg border border-border bg-surface p-6 text-sm text-muted">
          Linked quotations and policies appear under their collections. Use Send to Broker from a
          quotation or policy to request new items.
        </div>
      )}
    </div>
  )
}

function ReadonlyField({ label, value }: { label: string; value: string }) {
  return (
    <div>
      <p className="mb-1 text-sm font-medium text-gray-700">{label}</p>
      <p className="rounded-lg border border-border bg-page px-3 py-2 text-sm text-gray-900">
        {value}
      </p>
    </div>
  )
}
