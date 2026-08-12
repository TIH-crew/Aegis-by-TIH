import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { ArrowLeft, MessageCircle, UserRound } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useBranches } from '../context/BranchesContext'
import { useSearch } from '../context/SearchContext'
import {
  createEmployee,
  getEmployee,
  updateEmployee,
  uploadEmployeePhoto,
} from '../services/employee.service'
import { DriversLicenceVerifyPanel } from '../components/employees/DriversLicenceVerifyPanel'
import { whatsappHref } from '../lib/extensions'
import { formatCurrency, formatDate } from '../lib/utils'
import type { EmployeeInput } from '../types/employee'

const EMPTY: EmployeeInput = {
  full_name: '',
  job_title: '',
  email: '',
  phone: '',
  whatsapp_number: '',
  employee_number: '',
  branch_id: '',
  status: 'active',
  id_number: '',
  licence_number: '',
  licence_valid_to: '',
  licence_categories: [],
}

export function EmployeeDetailPage() {
  const { id } = useParams<{ id: string }>()
  const isNew = id === 'new'
  const navigate = useNavigate()
  const { accountId } = useAuth()
  const { branches } = useBranches()
  const { riskItems } = useSearch()
  const [form, setForm] = useState<EmployeeInput>(EMPTY)
  const [imageUrl, setImageUrl] = useState<string | null>(null)
  const [loading, setLoading] = useState(!isNew)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [employeeId, setEmployeeId] = useState<string | null>(isNew ? null : id ?? null)

  useEffect(() => {
    if (!accountId || isNew || !id) return
    setLoading(true)
    void getEmployee(accountId, id)
      .then((employee) => {
        if (!employee) {
          setError('Employee not found.')
          return
        }
        setEmployeeId(employee.id)
        setImageUrl(employee.image_url)
        setForm({
          full_name: employee.full_name,
          job_title: employee.job_title ?? '',
          email: employee.email ?? '',
          phone: employee.phone ?? '',
          whatsapp_number: employee.whatsapp_number,
          employee_number: employee.employee_number ?? '',
          branch_id: employee.branch_id ?? '',
          status: employee.status,
          id_number: employee.id_number ?? '',
          licence_number: employee.licence_number ?? '',
          licence_valid_to: employee.licence_valid_to ?? '',
          licence_categories: employee.licence_categories ?? [],
          drivers_licence_verified_at: employee.drivers_licence_verified_at ?? null,
          drivers_licence_verification: employee.drivers_licence_verification ?? {},
        })
      })
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load employee'))
      .finally(() => setLoading(false))
  }, [accountId, id, isNew])

  const attachedItems = useMemo(
    () => riskItems.filter((item) => item.employee_id === employeeId),
    [riskItems, employeeId],
  )

  const wa = form.whatsapp_number ? whatsappHref(form.whatsapp_number) : null

  async function handleSave() {
    if (!accountId) return
    if (!form.full_name.trim()) {
      setError('Name is required.')
      return
    }
    if (!form.whatsapp_number.trim()) {
      setError('WhatsApp number is required.')
      return
    }
    setSaving(true)
    setError(null)
    try {
      const payload: EmployeeInput = {
        ...form,
        branch_id: form.branch_id || null,
      }
      if (isNew || !employeeId) {
        const created = await createEmployee(accountId, payload)
        navigate(`/collections/employees/${created.id}`, { replace: true })
      } else {
        await updateEmployee(accountId, employeeId, payload)
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save employee')
    } finally {
      setSaving(false)
    }
  }

  async function handlePhoto(file: File) {
    if (!accountId || !employeeId) {
      setError('Save the employee first, then add a photo.')
      return
    }
    try {
      const url = await uploadEmployeePhoto(accountId, employeeId, file)
      setImageUrl(url)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to upload photo')
    }
  }

  if (loading) return <p className="text-sm text-muted">Loading employee…</p>

  return (
    <div className="mx-auto max-w-4xl space-y-6">
      <Link
        to="/collections/employees"
        className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={14} /> Back to employees
      </Link>

      <div className="flex flex-wrap items-start justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold">{isNew ? 'New employee' : form.full_name}</h1>
          <p className="text-sm text-muted">Photo, branch, WhatsApp, and attached risk items.</p>
        </div>
        <button
          type="button"
          onClick={() => void handleSave()}
          disabled={saving}
          className="rounded-lg bg-accent px-4 py-2 text-sm font-medium text-white disabled:opacity-60"
        >
          {saving ? 'Saving…' : 'Save'}
        </button>
      </div>

      {error && (
        <p className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </p>
      )}

      <div className="grid gap-6 md:grid-cols-[220px_1fr]">
        <div className="rounded-lg border border-border bg-surface p-4 text-center">
          <div className="mx-auto mb-3 flex h-40 w-40 items-center justify-center overflow-hidden rounded-full bg-gray-100 text-muted">
            {imageUrl ? (
              <img src={imageUrl} alt="" className="h-full w-full object-cover" />
            ) : (
              <UserRound size={48} />
            )}
          </div>
          <label className="cursor-pointer text-xs font-medium text-primary">
            Upload photo
            <input
              type="file"
              accept="image/*"
              className="hidden"
              onChange={(e) => {
                const file = e.target.files?.[0]
                if (file) void handlePhoto(file)
              }}
            />
          </label>
          {wa && (
            <a
              href={wa}
              target="_blank"
              rel="noreferrer"
              className="mt-3 inline-flex items-center gap-1 text-sm text-emerald-700"
            >
              <MessageCircle size={14} /> WhatsApp
            </a>
          )}
        </div>

        <div className="grid grid-cols-1 gap-4 rounded-lg border border-border bg-surface p-4 md:grid-cols-2">
          <Field label="Full name">
            <input
              className="field-input"
              value={form.full_name}
              onChange={(e) => setForm({ ...form, full_name: e.target.value })}
            />
          </Field>
          <Field label="Job title">
            <input
              className="field-input"
              value={form.job_title ?? ''}
              onChange={(e) => setForm({ ...form, job_title: e.target.value })}
            />
          </Field>
          <Field label="WhatsApp number">
            <input
              className="field-input"
              value={form.whatsapp_number}
              onChange={(e) => setForm({ ...form, whatsapp_number: e.target.value })}
              placeholder="+27…"
            />
          </Field>
          <Field label="Phone">
            <input
              className="field-input"
              value={form.phone ?? ''}
              onChange={(e) => setForm({ ...form, phone: e.target.value })}
            />
          </Field>
          <Field label="Email">
            <input
              className="field-input"
              type="email"
              value={form.email ?? ''}
              onChange={(e) => setForm({ ...form, email: e.target.value })}
            />
          </Field>
          <Field label="Employee number">
            <input
              className="field-input"
              value={form.employee_number ?? ''}
              onChange={(e) => setForm({ ...form, employee_number: e.target.value })}
            />
          </Field>
          <Field label="ID number">
            <input
              className="field-input"
              value={form.id_number ?? ''}
              onChange={(e) => setForm({ ...form, id_number: e.target.value })}
            />
          </Field>
          <Field label="Licence number">
            <input
              className="field-input"
              value={form.licence_number ?? ''}
              onChange={(e) => setForm({ ...form, licence_number: e.target.value })}
            />
          </Field>
          <Field label="Licence valid to">
            <input
              className="field-input"
              type="date"
              value={form.licence_valid_to ?? ''}
              onChange={(e) => setForm({ ...form, licence_valid_to: e.target.value })}
            />
          </Field>
          <Field label="Branch">
            <select
              className="field-input"
              value={form.branch_id ?? ''}
              onChange={(e) => setForm({ ...form, branch_id: e.target.value })}
            >
              <option value="">Select branch</option>
              {branches.map((branch) => (
                <option key={branch.id} value={branch.id}>
                  {branch.name}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Status">
            <select
              className="field-input"
              value={form.status}
              onChange={(e) =>
                setForm({ ...form, status: e.target.value as EmployeeInput['status'] })
              }
            >
              <option value="active">Active</option>
              <option value="inactive">Inactive</option>
            </select>
          </Field>
        </div>
      </div>

      <DriversLicenceVerifyPanel
        onVerified={async (payload) => {
          const next = {
            ...form,
            full_name: payload.full_name || form.full_name,
            id_number: payload.id_number ?? form.id_number,
            licence_number: payload.licence_number ?? form.licence_number,
            licence_valid_to: payload.licence_valid_to ?? form.licence_valid_to,
            licence_categories: payload.licence_categories ?? form.licence_categories,
            drivers_licence_verified_at: new Date().toISOString(),
            drivers_licence_verification: payload.drivers_licence_verification as Record<
              string,
              unknown
            >,
            image_url: payload.image_url ?? form.image_url,
          }
          setForm(next)
          if (payload.image_url) setImageUrl(payload.image_url)
          if (accountId && employeeId) {
            try {
              await updateEmployee(accountId, employeeId, next)
            } catch (err) {
              setError(err instanceof Error ? err.message : 'Failed to save licence details')
            }
          }
        }}
      />

      {form.drivers_licence_verified_at && (
        <p className="text-xs text-muted">
          Licence last verified {formatDate(form.drivers_licence_verified_at.slice(0, 10))}
          {form.licence_categories && form.licence_categories.length > 0
            ? ` · Categories ${form.licence_categories.join(', ')}`
            : ''}
        </p>
      )}

      {!isNew && (
        <div className="rounded-lg border border-border bg-surface shadow-sm">
          <div className="flex items-center justify-between border-b border-border px-4 py-3">
            <div>
              <h2 className="font-semibold">Attached items</h2>
              <p className="text-xs text-muted">Risk items currently assigned to this employee.</p>
            </div>
            <Link
              to={`/forms/assign-to?employeeId=${employeeId ?? ''}`}
              className="text-sm font-medium text-primary"
            >
              Assign items
            </Link>
          </div>
          {attachedItems.length === 0 ? (
            <p className="px-4 py-6 text-sm text-muted">No items attached yet.</p>
          ) : (
            <table className="min-w-full text-sm">
              <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
                <tr>
                  <th className="px-4 py-2">Item</th>
                  <th className="px-4 py-2">Category</th>
                  <th className="px-4 py-2">Branch</th>
                  <th className="px-4 py-2">Custody</th>
                  <th className="px-4 py-2 text-right">Value</th>
                </tr>
              </thead>
              <tbody>
                {attachedItems.map((item) => (
                  <tr key={item.id} className="border-b border-border last:border-0">
                    <td className="px-4 py-3">
                      <Link to={`/collections/risk-items/${item.id}`} className="font-medium text-primary">
                        {item.name}
                      </Link>
                    </td>
                    <td className="px-4 py-3 text-muted">{item.category}</td>
                    <td className="px-4 py-3 text-muted">{item.branch ?? '—'}</td>
                    <td className="px-4 py-3 capitalize text-muted">
                      {(item.assignment_status ?? 'assigned').replace('_', ' ')}
                    </td>
                    <td className="px-4 py-3 text-right">{formatCurrency(item.unit_cost)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      )}
    </div>
  )
}

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <label className="block text-sm">
      <span className="mb-1 block font-medium">{label}</span>
      {children}
    </label>
  )
}
