import { useEffect, useState } from 'react'
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom'
import { ArrowLeft, MoreVertical, Sparkles, Upload } from 'lucide-react'
import { INSURANCE_STATUSES, RISK_CATEGORIES } from '../config/collections'
import { ZOHO_LAYOUTS } from '../config/zoho-risk-field-mappings'
import { CategoryZohoFields } from '../components/risk-items/CategoryZohoFields'
import {
  MotorRentalPanel,
  resolveRentalCompany,
  validateMotorRental,
  type MotorRentalValue,
} from '../components/risk-items/MotorRentalPanel'
import { MotorVerifyPanel } from '../components/risk-items/MotorVerifyPanel'
import { RENTAL_COMPANIES } from '../config/motor-rental'
import { useBranches } from '../context/BranchesContext'
import { useSearch } from '../context/SearchContext'
import { useOrganization } from '../context/OrganizationContext'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { buildZohoClientRiskPayload, validateZohoFields } from '../lib/zoho-risk-sync'
import { listEmployees } from '../services/employee.service'
import type { RiskItem } from '../types'
import type { Employee } from '../types/employee'
import { formatCurrency } from '../lib/utils'

type Tab = 'details' | 'activity' | 'linked'

export function RiskItemDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const location = useLocation()
  const { branches } = useBranches()
  const { refreshRiskItems } = useSearch()
  const { organization } = useOrganization()
  const { accountId } = useAuth()
  const dataService = useDataService()
  const [item, setItem] = useState<RiskItem | null>(null)
  const [employees, setEmployees] = useState<Employee[]>([])
  const [tab, setTab] = useState<Tab>('details')
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [toast, setToast] = useState<string | null>(
    (location.state as { toast?: string } | null)?.toast ?? null,
  )
  const [rental, setRental] = useState<MotorRentalValue>({
    is_rental: false,
    rental_company: '',
    rental_company_other: '',
    rental_start_date: '',
    rental_end_date: '',
  })

  useEffect(() => {
    if (!id || !dataService) return
    let cancelled = false
    setLoading(true)
    dataService
      .getRiskItem(id)
      .then((data) => {
        if (!cancelled && data) {
          setItem(data)
          setRental({
            is_rental: Boolean(data.is_rental),
            rental_company: data.rental_company ?? '',
            rental_company_other:
              data.rental_company &&
              !(RENTAL_COMPANIES as readonly string[]).includes(data.rental_company)
                ? data.rental_company
                : '',
            rental_start_date: data.rental_start_date ?? '',
            rental_end_date: data.rental_end_date ?? '',
          })
        }
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

  async function handleSave() {
    if (!item || !id || !dataService) return

    if (item.category === 'Motor') {
      const rentalError = validateMotorRental(rental)
      if (rentalError) {
        setError(rentalError)
        return
      }
    }

    const branch = branches.find((b) => b.id === item.branch_id)
    const zohoIssues = validateZohoFields(item, {
      branchAddress: branch?.address,
      zohoAccountId: organization?.zoho_account_id,
    })
    if (zohoIssues.length > 0) {
      setError(zohoIssues.map((i) => i.message).join(' '))
      return
    }

    setSaving(true)
    setError(null)
    try {
      const rentalCompany = resolveRentalCompany(rental)
      const updated = await dataService.updateRiskItem(id, {
        name: item.name,
        category: item.category,
        unit_cost: item.unit_cost,
        repair_cost: item.repair_cost,
        record_date: item.record_date,
        employee_name: item.employee_name,
        employee_id: item.employee_id,
        item_extensions: item.item_extensions,
        vehicle_verification: item.vehicle_verification,
        assignment_status: item.assignment_status,
        insurance_status: item.insurance_status,
        description: item.description,
        serial_number: item.serial_number,
        branch_id: item.branch_id,
        zoho_fields: item.zoho_fields,
        is_rental: item.category === 'Motor' ? rental.is_rental : false,
        rental_company: item.category === 'Motor' && rental.is_rental ? rentalCompany : null,
        rental_start_date:
          item.category === 'Motor' && rental.is_rental ? rental.rental_start_date : null,
        rental_end_date:
          item.category === 'Motor' && rental.is_rental ? rental.rental_end_date : null,
      })
      setItem(updated)
      await refreshRiskItems()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save')
    } finally {
      setSaving(false)
    }
  }

  if (loading) return <p className="text-sm text-muted">Loading record...</p>
  if (!item) return <p className="text-sm text-red-600">Record not found.</p>

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

      <div className="mb-4 flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold">{item.name}</h1>
          <p className="text-xs text-muted">Ref {item.asset_tag}</p>
        </div>
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={() => navigate('/collections/risk-items')}
            className="rounded-lg border border-border px-4 py-2 text-sm hover:bg-gray-50"
          >
            Cancel
          </button>
          <button
            type="button"
            className="inline-flex items-center gap-1.5 rounded-lg border border-border px-4 py-2 text-sm hover:bg-gray-50"
          >
            <Sparkles size={16} />
            AI autofill
          </button>
          <button
            type="button"
            onClick={handleSave}
            disabled={saving}
            className="rounded-lg bg-accent px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-accent-hover disabled:opacity-60"
          >
            {saving ? 'Saving...' : 'Save'}
          </button>
          <button type="button" className="rounded-lg border border-border p-2 hover:bg-gray-50">
            <MoreVertical size={16} />
          </button>
        </div>
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
            {t === 'details'
              ? 'Record details'
              : t === 'linked'
                ? 'Linked records'
                : 'Activity'}
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

          <div className="grid grid-cols-1 gap-6 md:grid-cols-2">
            <Field label="Item Name">
              <input
                className="field-input"
                value={item.name}
                onChange={(e) => setItem({ ...item, name: e.target.value })}
              />
            </Field>
            <Field label="Unit Cost">
              <input
                className="field-input"
                type="number"
                value={item.unit_cost}
                onChange={(e) => setItem({ ...item, unit_cost: Number(e.target.value) })}
              />
            </Field>
            <Field label="Repair Cost">
              <input
                className="field-input"
                type="number"
                value={item.repair_cost}
                onChange={(e) => setItem({ ...item, repair_cost: Number(e.target.value) })}
              />
            </Field>
            <Field label="Record Date">
              <input
                className="field-input"
                type="date"
                value={item.record_date}
                onChange={(e) => setItem({ ...item, record_date: e.target.value })}
              />
            </Field>
            <Field label="Category">
              <select
                className="field-input"
                value={
                  RISK_CATEGORIES.includes(item.category as (typeof RISK_CATEGORIES)[number])
                    ? item.category
                    : RISK_CATEGORIES[0]
                }
                onChange={(e) => setItem({ ...item, category: e.target.value })}
              >
                {!RISK_CATEGORIES.includes(item.category as (typeof RISK_CATEGORIES)[number]) &&
                  item.category && (
                    <option value={item.category}>{item.category}</option>
                  )}
                {RISK_CATEGORIES.map((c) => (
                  <option key={c} value={c}>
                    {c}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="Insurance Status">
              <select
                className="field-input"
                value={item.insurance_status}
                onChange={(e) => setItem({ ...item, insurance_status: e.target.value })}
              >
                {INSURANCE_STATUSES.map((s) => (
                  <option key={s} value={s}>
                    {s}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="Assign to">
              <select
                className="field-input"
                value={item.employee_id ?? ''}
                onChange={(e) => {
                  const nextId = e.target.value || null
                  const employee = employees.find((row) => row.id === nextId)
                  setItem({
                    ...item,
                    employee_id: nextId,
                    employee_name: employee?.full_name ?? null,
                    assignment_status: nextId ? 'assigned' : 'unassigned',
                  })
                }}
              >
                <option value="">Unassigned</option>
                {employees.map((employee) => (
                  <option key={employee.id} value={employee.id}>
                    {employee.full_name}
                    {employee.branch_name ? ` · ${employee.branch_name}` : ''}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="Branch">
              <select
                className="field-input"
                value={item.branch_id ?? ''}
                onChange={(e) => setItem({ ...item, branch_id: e.target.value || null })}
              >
                <option value="">Select branch</option>
                {branches.map((b) => (
                  <option key={b.id} value={b.id}>
                    {b.name}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="Serial Number">
              <input
                className="field-input"
                value={item.serial_number ?? ''}
                onChange={(e) => setItem({ ...item, serial_number: e.target.value })}
              />
            </Field>
            <Field label="Attachments">
              <div className="flex items-center gap-2 rounded-lg border border-dashed border-border p-4 text-sm text-muted">
                <Upload size={16} />
                Upload attachment (Phase 2)
              </div>
            </Field>
            <div className="md:col-span-2">
              <Field label="Description">
                <textarea
                  className="field-input min-h-24"
                  value={item.description ?? ''}
                  onChange={(e) => setItem({ ...item, description: e.target.value })}
                />
              </Field>
            </div>
          </div>

          <div className="mt-6">
            <CategoryZohoFields
              category={item.category}
              values={item.zoho_fields ?? {}}
              onChange={(zoho_fields) => setItem({ ...item, zoho_fields })}
            />
          </div>

          {item.category === 'Motor' && (
            <div className="mt-6 space-y-4">
              <MotorRentalPanel value={rental} onChange={setRental} />
              <MotorVerifyPanel
                registrationNumber={String(item.zoho_fields?.Registration_Number ?? '')}
                onApply={(payload) => {
                  setItem({
                    ...item,
                    name: payload.name || item.name,
                    serial_number: payload.serial_number ?? item.serial_number,
                    zoho_fields: { ...(item.zoho_fields ?? {}), ...payload.zoho_fields },
                    vehicle_verification: {
                      ...(item.vehicle_verification ?? {}),
                      ...payload.vehicle_verification,
                    },
                  })
                }}
              />
            </div>
          )}

          <ZohoSyncPreview
            item={item}
            branchAddress={branches.find((b) => b.id === item.branch_id)?.address}
            zohoAccountId={organization?.zoho_account_id}
          />

          <p className="mt-4 text-xs text-muted">
            Current value: {formatCurrency(item.unit_cost)} · Stored in Supabase
          </p>
        </div>
      )}

      {tab === 'activity' && (
        <div className="rounded-lg border border-border bg-surface p-6 text-sm text-muted">
          Activity feed will sync from Zoho CRM in a later phase.
        </div>
      )}

      {tab === 'linked' && (
        <div className="rounded-lg border border-border bg-surface p-6 text-sm text-muted">
          Linked quotations and policies from Zoho CRM appear in their collections. Use Send to Broker from a quotation or policy to request new items.
        </div>
      )}
    </div>
  )
}

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <label className="block">
      <span className="mb-1.5 block text-sm font-medium text-gray-700">{label}</span>
      {children}
    </label>
  )
}

function ZohoSyncPreview({
  item,
  branchAddress,
  zohoAccountId,
}: {
  item: RiskItem
  branchAddress?: string
  zohoAccountId?: string | null
}) {
  const issues = validateZohoFields(item, { branchAddress, zohoAccountId })
  const payload = buildZohoClientRiskPayload(item, { branchAddress, zohoAccountId })

  return (
    <div className="mt-4 rounded-lg border border-dashed border-border bg-page p-4 text-xs">
      <p className="mb-2 font-medium text-gray-700">
        Zoho CRM sync preview (Client_Risks · {ZOHO_LAYOUTS.clientRisksCommercialAssets.displayName})
      </p>
      {!zohoAccountId && (
        <p className="mb-2 text-amber-800">
          Missing organization Zoho Account ID. Set it on the portal account before syncing.
        </p>
      )}
      {issues.length > 0 ? (
        <ul className="mb-2 list-disc pl-4 text-amber-800">
          {issues.map((issue) => (
            <li key={issue.apiName}>{issue.message}</li>
          ))}
        </ul>
      ) : (
        <p className="mb-2 text-green-700">All required broker fields are present.</p>
      )}
      <pre className="max-h-40 overflow-auto rounded bg-surface p-2 text-[11px] text-muted">
        {JSON.stringify(payload, null, 2)}
      </pre>
    </div>
  )
}
