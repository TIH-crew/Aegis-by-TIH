import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { INSURANCE_STATUSES, RISK_CATEGORIES } from '../config/collections'
import { BROKER_NOTIFY_EMAIL } from '../config/motor-rental'
import { CategoryZohoFields } from '../components/risk-items/CategoryZohoFields'
import {
  MotorRentalPanel,
  resolveRentalCompany,
  validateMotorRental,
  type MotorRentalValue,
} from '../components/risk-items/MotorRentalPanel'
import {
  ItemExtrasQuestionnaire,
  answersToSelectedExtensions,
  emptyExtrasAnswers,
  validateExtrasQuestionnaire,
  type ExtrasQuestionnaireAnswers,
} from '../components/risk-items/ItemExtrasQuestionnaire'
import { MotorVerifyPanel } from '../components/risk-items/MotorVerifyPanel'
import { useBranches } from '../context/BranchesContext'
import { useSearch } from '../context/SearchContext'
import { useOrganization } from '../context/OrganizationContext'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { validateZohoFields } from '../lib/zoho-risk-sync'
import {
  attachRiskItemToPolicy,
  fetchPolicies,
  sendBrokerRequest,
} from '../services/crm.service'
import { listEmployees } from '../services/employee.service'
import type { PolicySummary } from '../types/crm'
import type { Employee } from '../types/employee'

const emptyRental: MotorRentalValue = {
  is_rental: false,
  rental_company: '',
  rental_company_other: '',
  rental_start_date: '',
  rental_end_date: '',
}

export function AddRiskItemPage() {
  const navigate = useNavigate()
  const { branches, loading: branchesLoading } = useBranches()
  const { refreshRiskItems } = useSearch()
  const { organization } = useOrganization()
  const { accountId } = useAuth()
  const dataService = useDataService()
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [employees, setEmployees] = useState<Employee[]>([])
  const [policies, setPolicies] = useState<PolicySummary[]>([])
  const [policyId, setPolicyId] = useState('')
  const [rental, setRental] = useState<MotorRentalValue>(emptyRental)
  const [extras, setExtras] = useState<ExtrasQuestionnaireAnswers>(emptyExtrasAnswers())
  const [form, setForm] = useState({
    name: '',
    category: RISK_CATEGORIES[0] as string,
    unit_cost: 0,
    repair_cost: 0,
    branch_id: '',
    employee_id: '',
    employee_name: '',
    insurance_status: 'Brand new' as string,
    serial_number: '',
    description: '',
    item_extensions: [] as unknown,
    vehicle_verification: {} as Record<string, unknown>,
    zoho_fields: {} as Record<string, unknown>,
  })

  const isMotor = form.category === 'Motor'

  useEffect(() => {
    if (branches.length && !form.branch_id) {
      setForm((prev) => ({ ...prev, branch_id: branches[0].id }))
    }
  }, [branches, form.branch_id])

  useEffect(() => {
    if (!accountId) return
    void listEmployees(accountId).then((rows) =>
      setEmployees(rows.filter((row) => row.status === 'active')),
    )
  }, [accountId])

  useEffect(() => {
    if (!isMotor) return
    void fetchPolicies()
      .then((rows) => {
        setPolicies(rows)
        setPolicyId((prev) => prev || rows[0]?.id || '')
      })
      .catch(() => setPolicies([]))
  }, [isMotor])

  async function handleSubmit() {
    if (!form.name.trim()) {
      setError('Item name is required.')
      return
    }
    if (!form.branch_id) {
      setError('Select a branch. Add branches under Organization settings first.')
      return
    }
    if (!dataService) {
      setError('Your session is not ready. Please try again.')
      return
    }

    if (isMotor) {
      const rentalError = validateMotorRental(rental)
      if (rentalError) {
        setError(rentalError)
        return
      }
      if (!policyId) {
        setError('Select a policy to add this motor item to.')
        return
      }
    }

    const extrasError = validateExtrasQuestionnaire(form.category, extras)
    if (extrasError) {
      setError(extrasError)
      return
    }

    const branch = branches.find((b) => b.id === form.branch_id)
    const zohoIssues = validateZohoFields(
      {
        name: form.name,
        category: form.category,
        unit_cost: form.unit_cost,
        serial_number: form.serial_number,
        description: form.description,
        insurance_status: form.insurance_status,
        asset_tag: '',
        zoho_fields: form.zoho_fields,
      },
      { branchAddress: branch?.address, zohoAccountId: organization?.zoho_account_id },
    )
    if (zohoIssues.length > 0) {
      setError(zohoIssues.map((i) => i.message).join(' '))
      return
    }

    setSaving(true)
    setError(null)
    try {
      const rentalCompany = resolveRentalCompany(rental)
      const selectedExtras = answersToSelectedExtensions(extras, form.category)
      const coverKey =
        extras.cover_type_key ||
        (form.category !== 'Motor' ? 'standard' : extras.cover_type_key)
      const created = await dataService.createRiskItem({
        ...form,
        employee_id: form.employee_id || null,
        branch_id: form.branch_id,
        item_extensions: selectedExtras,
        zoho_fields: {
          ...form.zoho_fields,
          ...(coverKey ? { Cover_Type: coverKey } : {}),
          ...(extras.vehicle_use ? { Vehicle_Use: extras.vehicle_use } : {}),
          ...(extras.is_financed != null ? { Is_Financed: extras.is_financed } : {}),
          ...(extras.finance_house ? { Finance_House: extras.finance_house } : {}),
          ...(extras.has_tracker != null
            ? { Tracking_Device: extras.has_tracker ? 'Yes' : 'No' }
            : {}),
          ...(selectedExtras.some((e) => e.code === 'credit_shortfall')
            ? { Credit_shortfall: true }
            : {}),
        },
        is_rental: isMotor ? rental.is_rental : false,
        rental_company: isMotor && rental.is_rental ? rentalCompany : null,
        rental_start_date: isMotor && rental.is_rental ? rental.rental_start_date : null,
        rental_end_date: isMotor && rental.is_rental ? rental.rental_end_date : null,
      })

      if (isMotor && policyId) {
        const policy = policies.find((p) => p.id === policyId)
        await attachRiskItemToPolicy({
          policyId,
          riskItem: {
            id: created.id,
            name: created.name,
            category: created.category,
            unit_cost: created.unit_cost,
            branch: created.branch,
            description: created.description,
            is_rental: created.is_rental,
            rental_company: created.rental_company,
            rental_start_date: created.rental_start_date,
            rental_end_date: created.rental_end_date,
            item_extensions: selectedExtras,
          },
        })

        const zohoPolicyId = policy?.zoho_policy_id
        let brokerNote = `Item added to policy ${policy?.policy_number ?? ''}.`
        if (zohoPolicyId) {
          try {
            const rentalLine = created.is_rental
              ? `Rental from ${created.rental_company} (${created.rental_start_date} to ${created.rental_end_date}).`
              : 'Not a rental vehicle.'
            await sendBrokerRequest({
              context_type: 'policy',
              context_zoho_id: zohoPolicyId,
              context_label: policy.policy_number || policy.id,
              risk_item_id: created.id,
              nimbis_add: true,
              notify_email: BROKER_NOTIFY_EMAIL,
              task_subject: `Aegis: Add motor item to Nimbis — ${policy.policy_number || 'policy'}`,
              message: [
                `New motor risk item added via Aegis portal.`,
                rentalLine,
                `Please add this item to the policy on Nimbis.`,
              ].join(' '),
            })
            brokerNote = `Item added to policy. Broker (${BROKER_NOTIFY_EMAIL}) notified to add on Nimbis.`
          } catch {
            brokerNote =
              'Item added to policy, but broker notification failed. Please contact the broker manually.'
          }
        } else {
          brokerNote =
            'Item added to policy. No Zoho policy link — create the Nimbis task manually for the broker.'
        }

        await refreshRiskItems()
        navigate(`/collections/risk-items/${created.id}`, { state: { toast: brokerNote } })
        return
      }

      await refreshRiskItems()
      navigate(`/collections/risk-items/${created.id}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to create record')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="mx-auto max-w-3xl">
      <Link
        to="/collections/risk-items"
        className="mb-4 inline-flex items-center gap-2 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={16} />
        Back to Risk Items
      </Link>

      <h1 className="mb-6 text-2xl font-semibold">Add Risk Item</h1>

      {error && (
        <p className="mb-4 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </p>
      )}

      {!branchesLoading && branches.length === 0 && (
        <p className="mb-4 rounded-md border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
          Add at least one branch in{' '}
          <Link to="/settings/organization" className="font-medium underline">
            Organization settings
          </Link>{' '}
          before creating risk items.
        </p>
      )}

      <div className="space-y-4 rounded-lg border border-border bg-surface p-6 shadow-sm">
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
          <label className="block text-sm md:col-span-2">
            <span className="mb-1 block font-medium">Item Name *</span>
            <input
              className="field-input"
              value={form.name}
              onChange={(e) => setForm({ ...form, name: e.target.value })}
              placeholder="Laptop - Finance dept"
            />
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Category</span>
            <select
              className="field-input"
              value={form.category}
              onChange={(e) => {
                const category = e.target.value
                setForm({ ...form, category })
                setExtras(emptyExtrasAnswers())
                if (category !== 'Motor') setRental(emptyRental)
              }}
            >
              {RISK_CATEGORIES.map((c) => (
                <option key={c} value={c}>
                  {c}
                </option>
              ))}
            </select>
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Branch *</span>
            <select
              className="field-input"
              value={form.branch_id}
              onChange={(e) => setForm({ ...form, branch_id: e.target.value })}
              disabled={!branches.length}
            >
              {branches.map((b) => (
                <option key={b.id} value={b.id}>
                  {b.name}
                </option>
              ))}
            </select>
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Unit Cost (R)</span>
            <input
              className="field-input"
              type="number"
              value={form.unit_cost}
              onChange={(e) => setForm({ ...form, unit_cost: Number(e.target.value) })}
            />
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Insurance Status</span>
            <select
              className="field-input"
              value={form.insurance_status}
              onChange={(e) => setForm({ ...form, insurance_status: e.target.value })}
            >
              {INSURANCE_STATUSES.map((s) => (
                <option key={s} value={s}>
                  {s}
                </option>
              ))}
            </select>
          </label>
          <label className="block text-sm md:col-span-2">
            <span className="mb-1 block font-medium">Assign to</span>
            <select
              className="field-input"
              value={form.employee_id}
              onChange={(e) => {
                const employee = employees.find((row) => row.id === e.target.value)
                setForm({
                  ...form,
                  employee_id: e.target.value,
                  employee_name: employee?.full_name ?? '',
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
          </label>
          <label className="block text-sm md:col-span-2">
            <span className="mb-1 block font-medium">Description</span>
            <textarea
              className="field-input min-h-24"
              value={form.description}
              onChange={(e) => setForm({ ...form, description: e.target.value })}
            />
          </label>
        </div>

        {isMotor && (
          <>
            <MotorRentalPanel value={rental} onChange={setRental} />

            <label className="block text-sm">
              <span className="mb-1 block font-medium">Add to policy *</span>
              <select
                className="field-input"
                value={policyId}
                onChange={(e) => setPolicyId(e.target.value)}
              >
                <option value="">Select policy</option>
                {policies.map((policy) => (
                  <option key={policy.id} value={policy.id}>
                    {policy.policy_number}
                    {policy.insurer ? ` · ${policy.insurer}` : ''}
                    {policy.status ? ` (${policy.status})` : ''}
                  </option>
                ))}
              </select>
              <span className="mt-1 block text-xs text-muted">
                Creates a Nimbis add-item task for {BROKER_NOTIFY_EMAIL} after save.
              </span>
            </label>

            <MotorVerifyPanel
              registrationNumber={String(form.zoho_fields.Registration_Number ?? '')}
              onApply={(payload) => {
                setForm((prev) => ({
                  ...prev,
                  name: payload.name || prev.name,
                  serial_number: payload.serial_number ?? prev.serial_number,
                  zoho_fields: { ...prev.zoho_fields, ...payload.zoho_fields },
                  vehicle_verification: {
                    ...prev.vehicle_verification,
                    ...payload.vehicle_verification,
                  },
                }))
              }}
            />
          </>
        )}

        <ItemExtrasQuestionnaire
          category={form.category}
          value={extras}
          onChange={setExtras}
        />

        <CategoryZohoFields
          category={form.category}
          values={form.zoho_fields}
          onChange={(zoho_fields) => setForm({ ...form, zoho_fields })}
        />

        <div className="flex justify-end gap-3 pt-2">
          <button
            type="button"
            onClick={() => navigate('/collections/risk-items')}
            className="rounded-lg border border-border px-4 py-2 text-sm hover:bg-gray-50"
          >
            Cancel
          </button>
          <button
            type="button"
            onClick={handleSubmit}
            disabled={saving || !branches.length}
            className="rounded-lg bg-accent px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-accent-hover disabled:opacity-60"
          >
            {saving ? 'Saving...' : isMotor ? 'Save & notify broker' : 'Save to Supabase'}
          </button>
        </div>
      </div>
    </div>
  )
}
