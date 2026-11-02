import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { RISK_CATEGORIES } from '../config/collections'
import {
  MotorRentalPanel,
  resolveRentalCompany,
  validateMotorRental,
  type MotorRentalValue,
} from '../components/risk-items/MotorRentalPanel'
import {
  PurchaseProofPanel,
  emptyPurchaseProof,
  type PurchaseProofValue,
} from '../components/risk-items/PurchaseProofPanel'
import { useBranches } from '../context/BranchesContext'
import { useSearch } from '../context/SearchContext'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { validateAssignmentPurchase } from '../services/purchase-proof.service'
import { listEmployees } from '../services/employee.service'
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
  const { accountId } = useAuth()
  const dataService = useDataService()
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [employees, setEmployees] = useState<Employee[]>([])
  const [rental, setRental] = useState<MotorRentalValue>(emptyRental)
  const [purchase, setPurchase] = useState<PurchaseProofValue>(emptyPurchaseProof())
  const [form, setForm] = useState({
    name: '',
    category: RISK_CATEGORIES[0] as string,
    unit_cost: 0,
    repair_cost: 0,
    branch_id: '',
    employee_id: '',
    employee_name: '',
    serial_number: '',
    description: '',
    vehicle_verification: {} as Record<string, unknown>,
    zoho_fields: {} as Record<string, unknown>,
  })

  const isMotor = form.category === 'Motor'
  const isAssigning = Boolean(form.employee_id)

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
      const plate = String(form.zoho_fields?.Registration_Number ?? '').trim()
      if (!plate) {
        setError('Enter the vehicle registration / number plate before saving.')
        return
      }
    }

    if (isAssigning) {
      const purchaseError = validateAssignmentPurchase({
        purchase_value: purchase.purchase_value || form.unit_cost,
        purchase_invoice_url: purchase.purchase_invoice_url,
        is_financed: purchase.is_financed,
        finance_house: purchase.finance_house,
        finance_account_number: purchase.finance_account_number,
        finance_amount: purchase.finance_amount,
      })
      if (purchaseError) {
        setError(purchaseError)
        return
      }
    }

    setSaving(true)
    setError(null)
    try {
      const rentalCompany = resolveRentalCompany(rental)
      const created = await dataService.createRiskItem({
        ...form,
        unit_cost: form.unit_cost || purchase.purchase_value || 0,
        employee_id: form.employee_id || null,
        branch_id: form.branch_id,
        purchase_value: purchase.purchase_value || form.unit_cost || null,
        purchase_invoice_url: purchase.purchase_invoice_url || null,
        purchase_invoice_name: purchase.purchase_invoice_name || null,
        purchase_date: purchase.purchase_date || null,
        is_financed: purchase.is_financed,
        finance_house: purchase.is_financed ? purchase.finance_house : null,
        finance_account_number: purchase.is_financed ? purchase.finance_account_number : null,
        finance_amount: purchase.is_financed ? purchase.finance_amount : null,
        zoho_fields: {
          ...form.zoho_fields,
          ...(purchase.is_financed ? { Is_Financed: true, Finance_House: purchase.finance_house } : {}),
        },
        is_rental: isMotor ? rental.is_rental : false,
        rental_company: isMotor && rental.is_rental ? rentalCompany : null,
        rental_start_date: isMotor && rental.is_rental ? rental.rental_start_date : null,
        rental_end_date: isMotor && rental.is_rental ? rental.rental_end_date : null,
      })

      await refreshRiskItems()
      navigate(`/assets/${created.id}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to create record')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="mx-auto max-w-3xl">
      <Link
        to="/assets"
        className="mb-4 inline-flex items-center gap-2 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={16} />
        Back to assets
      </Link>

      <h1 className="mb-6 text-2xl font-semibold">Add asset</h1>

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
            <span className="mb-1 block font-medium">Purchase cost (R)</span>
            <input
              className="field-input"
              type="number"
              value={form.unit_cost}
              onChange={(e) => setForm({ ...form, unit_cost: Number(e.target.value) })}
            />
          </label>
          <p className="text-sm text-muted md:col-span-2">
            Insurance is shown as a status after the asset is saved. Cover, sums insured and policy changes are not edited here.
          </p>
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
            <div className="rounded-lg border border-border bg-page p-4">
              <h3 className="text-sm font-semibold text-ink">Vehicle details</h3>
              <p className="mt-0.5 text-xs text-muted">
                Enter registration and identifiers manually. Automated VerifyNow vehicle lookups have
                been removed.
              </p>
              <div className="mt-3 grid grid-cols-1 gap-3 md:grid-cols-2">
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">
                    Registration / number plate <span className="text-red-600">*</span>
                  </span>
                  <input
                    className="field-input uppercase"
                    value={String(form.zoho_fields?.Registration_Number ?? '')}
                    onChange={(e) =>
                      setForm((prev) => ({
                        ...prev,
                        zoho_fields: {
                          ...prev.zoho_fields,
                          Registration_Number: e.target.value.toUpperCase(),
                        },
                      }))
                    }
                    placeholder="e.g. CA123456"
                    autoComplete="off"
                  />
                </label>
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">VIN (optional)</span>
                  <input
                    className="field-input"
                    value={String(form.zoho_fields?.VIN_Number ?? '')}
                    onChange={(e) =>
                      setForm((prev) => ({
                        ...prev,
                        zoho_fields: { ...prev.zoho_fields, VIN_Number: e.target.value },
                        serial_number: e.target.value || prev.serial_number,
                      }))
                    }
                    placeholder="Vehicle identification number"
                  />
                </label>
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">Make (optional)</span>
                  <input
                    className="field-input"
                    value={String(form.zoho_fields?.Vehicle_Make ?? '')}
                    onChange={(e) =>
                      setForm((prev) => ({
                        ...prev,
                        zoho_fields: { ...prev.zoho_fields, Vehicle_Make: e.target.value },
                      }))
                    }
                  />
                </label>
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">Model (optional)</span>
                  <input
                    className="field-input"
                    value={String(form.zoho_fields?.Vehicle_Model ?? '')}
                    onChange={(e) =>
                      setForm((prev) => ({
                        ...prev,
                        zoho_fields: { ...prev.zoho_fields, Vehicle_Model: e.target.value },
                      }))
                    }
                  />
                </label>
              </div>
            </div>
            <MotorRentalPanel value={rental} onChange={setRental} />
          </>
        )}

        {(isAssigning || isMotor) && accountId && (
          <PurchaseProofPanel
            accountId={accountId}
            value={purchase}
            required={isAssigning}
            onChange={(next) => {
              setPurchase(next)
              if (next.purchase_value > 0 && !form.unit_cost) {
                setForm((prev) => ({ ...prev, unit_cost: next.purchase_value }))
              }
            }}
          />
        )}

        <div className="flex justify-end gap-3 pt-2">
          <button
            type="button"
            onClick={() => navigate('/assets')}
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
            {saving ? 'Saving...' : 'Save'}
          </button>
        </div>
      </div>
    </div>
  )
}
