import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { ArrowLeft, MessageCircle, QrCode, UserRound } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useBranches } from '../context/BranchesContext'
import { useSearch } from '../context/SearchContext'
import {
  getEmployee,
  rotateEmployeeClaimToken,
  updateEmployee,
  uploadEmployeePhoto,
} from '../services/employee.service'
import {
  createEmployeeWithChecks,
  deactivateEmployee,
  inviteEmployee,
  resendEmployeeInvite,
  revokeEmployeeInvite,
  listBenefitMemberships,
  splitName,
} from '../services/workforce.service'
import { promoteEmployeeContact, searchWorkforceContacts } from '../services/crm.service'
import { employeeClaimUrl } from '../services/employee-claim.service'
import { employeeHasClaimWhatsApp } from '../lib/contact-validation'
import { whatsappHref } from '../lib/extensions'
import { formatCurrency, formatDate } from '../lib/utils'
import type { EmployeeInput } from '../types/employee'

const EMPTY: EmployeeInput = {
  full_name: '',
  first_name: '',
  last_name: '',
  job_title: '',
  department: '',
  email: '',
  phone: '',
  whatsapp_number: '',
  employee_number: '',
  branch_id: '',
  status: 'active',
  employment_start_date: '',
  employment_end_date: '',
  id_number: '',
  licence_number: '',
  licence_valid_to: '',
  licence_categories: [],
}

export function EmployeeDetailPage() {
  const { id } = useParams<{ id: string }>()
  const isNew = id === 'new'
  const navigate = useNavigate()
  const { accountId, user, can } = useAuth()
  const { branches } = useBranches()
  const { riskItems } = useSearch()
  const [form, setForm] = useState<EmployeeInput>(EMPTY)
  const [imageUrl, setImageUrl] = useState<string | null>(null)
  const [loading, setLoading] = useState(!isNew)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [note, setNote] = useState<string | null>(null)
  const [employeeId, setEmployeeId] = useState<string | null>(isNew ? null : id ?? null)
  const [claimToken, setClaimToken] = useState<string | null>(null)
  const [invitationStatus, setInvitationStatus] = useState('not_invited')
  const [crmStatus, setCrmStatus] = useState('none')
  const [zohoContactId, setZohoContactId] = useState<string | null>(null)
  const [benefits, setBenefits] = useState<
    { benefit_type: string; enrolment_status: string; provider_confirmation_status: string }[]
  >([])
  const canBroker = can('workforce_broker')

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
        setClaimToken(employee.claim_access_token ?? null)
        setInvitationStatus(employee.invitation_status ?? 'not_invited')
        setCrmStatus(employee.zoho_contact_link_status ?? 'none')
        setZohoContactId(employee.zoho_contact_id ?? null)
        setForm({
          full_name: employee.full_name,
          first_name: employee.first_name ?? '',
          last_name: employee.last_name ?? '',
          job_title: employee.job_title ?? '',
          department: employee.department ?? '',
          email: employee.email ?? '',
          phone: employee.phone ?? '',
          whatsapp_number: employee.whatsapp_number ?? '',
          employee_number: employee.employee_number ?? '',
          branch_id: employee.branch_id ?? '',
          status: employee.status,
          employment_start_date: employee.employment_start_date ?? '',
          employment_end_date: employee.employment_end_date ?? '',
          id_number: employee.id_number ?? '',
          licence_number: employee.licence_number ?? '',
          licence_valid_to: employee.licence_valid_to ?? '',
          licence_categories: employee.licence_categories ?? [],
          drivers_licence_verified_at: employee.drivers_licence_verified_at ?? null,
          drivers_licence_verification: employee.drivers_licence_verification ?? {},
        })
        void listBenefitMemberships(accountId, employee.id).then(setBenefits).catch(() => setBenefits([]))
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
    setSaving(true)
    setError(null)
    setNote(null)
    try {
      const names = splitName(form.full_name)
      const payload: EmployeeInput = {
        ...form,
        first_name: form.first_name || names.first_name,
        last_name: form.last_name || names.last_name,
        branch_id: form.branch_id || null,
        whatsapp_number: form.whatsapp_number || '',
      }
      if (isNew || !employeeId) {
        const { employee: created } = await createEmployeeWithChecks(accountId, payload, {
          userId: user?.id,
          label: user?.email ?? 'HR',
        })
        navigate(`/people/${created.id}`, { replace: true })
      } else {
        await updateEmployee(accountId, employeeId, payload)
        setNote('Saved.')
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
        to="/people"
        className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={14} /> Back to people
      </Link>

      <div className="flex flex-wrap items-start justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold">{isNew ? 'New employee' : form.full_name}</h1>
          <p className="text-sm text-muted">
            Employment record for this organisation. Ending employment preserves history and does not delete the person.
          </p>
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
      {note && (
        <p className="rounded-md border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-900">
          {note}
        </p>
      )}

      {!isNew && employeeId && accountId && (
        <section className="ws-panel grid gap-3 p-4 sm:grid-cols-2">
          <div>
            <p className="text-xs font-semibold uppercase tracking-wide text-muted">AEGIS invite</p>
            <p className="mt-1 text-sm">{invitationStatus.replace(/_/g, ' ')}</p>
            <div className="mt-2 flex flex-wrap gap-2">
              <button
                type="button"
                className="ws-btn-secondary text-xs"
                disabled={saving || !form.email}
                onClick={() => {
                  setSaving(true)
                  const action =
                    invitationStatus === 'pending' ? resendEmployeeInvite : inviteEmployee
                  void action(accountId, employeeId, { userId: user?.id, label: user?.email })
                    .then((r) => {
                      setInvitationStatus('pending')
                      setNote(
                        `Activation invite for ${r.email} (expires ${r.expiresAt.slice(0, 10)}). Email delivery uses hashed tokens — claim QR is separate.`,
                      )
                    })
                    .catch((err) => setError(err instanceof Error ? err.message : 'Invite failed'))
                    .finally(() => setSaving(false))
                }}
              >
                {invitationStatus === 'pending' ? 'Resend invite' : 'Invite to activate account'}
              </button>
              {invitationStatus === 'pending' && (
                <button
                  type="button"
                  className="ws-btn-secondary text-xs"
                  disabled={saving}
                  onClick={() => {
                    setSaving(true)
                    void revokeEmployeeInvite(accountId, employeeId, {
                      userId: user?.id,
                      label: user?.email,
                    })
                      .then(() => {
                        setInvitationStatus('revoked')
                        setNote('Activation invitation revoked.')
                      })
                      .catch((err) => setError(err instanceof Error ? err.message : 'Revoke failed'))
                      .finally(() => setSaving(false))
                  }}
                >
                  Revoke invite
                </button>
              )}
            </div>
          </div>
          <div>
            <p className="text-xs font-semibold uppercase tracking-wide text-muted">Employment</p>
            <p className="mt-1 text-sm">{form.status}</p>
            {form.status === 'active' && (
              <button
                type="button"
                className="mt-2 ws-btn-secondary text-xs"
                disabled={saving}
                onClick={() => {
                  setSaving(true)
                  void deactivateEmployee(accountId, employeeId, 'Left employer', {
                    userId: user?.id,
                    label: user?.email,
                  })
                    .then(() => {
                      setForm((f) => ({ ...f, status: 'inactive' }))
                      setNote('Employment ended. History and CRM links preserved.')
                    })
                    .catch((err) => setError(err instanceof Error ? err.message : 'Deactivate failed'))
                    .finally(() => setSaving(false))
                }}
              >
                End employment
              </button>
            )}
          </div>
          {canBroker && (
            <div className="sm:col-span-2">
              <p className="text-xs font-semibold uppercase tracking-wide text-muted">CRM Contact</p>
              <p className="mt-1 text-sm">
                Status: {crmStatus}
                {zohoContactId ? ` · ${zohoContactId}` : ' · not linked'}
              </p>
              <p className="text-[11px] text-muted">
                Promotion is broker-initiated only. Does not run on bulk import.
              </p>
              {!zohoContactId && (
                <button
                  type="button"
                  className="mt-2 ws-btn-primary text-xs"
                  disabled={saving}
                  onClick={() => {
                    setSaving(true)
                    void (async () => {
                      const matches = await searchWorkforceContacts({
                        email: form.email,
                        phone: form.phone || form.whatsapp_number,
                      })
                      const existingId = matches[0]?.id
                      const result = await promoteEmployeeContact({
                        employeeId,
                        zohoContactId: existingId,
                        idempotencyKey: `promote-${employeeId}`,
                      })
                      setZohoContactId(result.zoho_contact_id)
                      setCrmStatus('linked')
                      setNote(
                        result.duplicated
                          ? 'Already linked (idempotent).'
                          : existingId
                            ? `Linked existing Contact ${result.zoho_contact_id}.`
                            : `Created and linked Contact ${result.zoho_contact_id}.`,
                      )
                    })()
                      .catch((err) =>
                        setError(err instanceof Error ? err.message : 'CRM promotion failed'),
                      )
                      .finally(() => setSaving(false))
                  }}
                >
                  Promote / link Zoho Contact
                </button>
              )}
            </div>
          )}
          <div className="sm:col-span-2">
            <p className="text-xs font-semibold uppercase tracking-wide text-muted">Benefits summary</p>
            {benefits.length === 0 ? (
              <p className="mt-1 text-sm text-muted">
                No benefit memberships yet. HR enrolment ≠ provider confirmation.
              </p>
            ) : (
              <ul className="mt-1 space-y-1 text-sm">
                {benefits.map((b) => (
                  <li key={b.benefit_type}>
                    {b.benefit_type.replace(/_/g, ' ')} — enrolled: {b.enrolment_status}; provider:{' '}
                    {b.provider_confirmation_status}
                  </li>
                ))}
              </ul>
            )}
          </div>
        </section>
      )}

      {!isNew && (
        <div
          id="employee-claim-qr"
          className="rounded-lg border-2 border-primary/30 bg-accent-light/40 p-4 shadow-sm print:border-0 print:shadow-none"
        >
          <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
            <div className="flex items-center gap-2">
              <QrCode size={18} className="text-primary" />
              <h2 className="font-semibold">Staff claim QR (print this)</h2>
            </div>
            <div className="flex flex-wrap gap-2">
              {employeeHasClaimWhatsApp(form.whatsapp_number) && claimToken && (
                <button
                  type="button"
                  className="rounded-lg border border-border bg-surface px-3 py-1.5 text-xs font-medium hover:bg-page"
                  onClick={() => window.print()}
                >
                  Print
                </button>
              )}
              <button
                type="button"
                className="rounded-lg border border-border bg-surface px-3 py-1.5 text-xs font-medium hover:bg-page"
                onClick={() => {
                  if (!accountId || !employeeId) return
                  if (!employeeHasClaimWhatsApp(form.whatsapp_number)) {
                    setError(
                      'Add a usable WhatsApp number before enabling claim QR / OTP.',
                    )
                    return
                  }
                  void rotateEmployeeClaimToken(accountId, employeeId)
                    .then((emp) => setClaimToken(emp.claim_access_token ?? null))
                    .catch((err) =>
                      setError(err instanceof Error ? err.message : 'Failed to rotate QR'),
                    )
                }}
              >
                {claimToken ? 'Rotate QR' : 'Enable claim QR'}
              </button>
            </div>
          </div>
          {!employeeHasClaimWhatsApp(form.whatsapp_number) ? (
            <p className="text-sm text-amber-900">
              WhatsApp is optional for HR registration, but claim OTP requires a usable mobile
              number. Save a WhatsApp number to enable the claim QR — we will not invent one.
            </p>
          ) : claimToken ? (
            <>
              <p className="mb-3 text-xs text-muted">
                Staff scan this code on their phone → WhatsApp OTP → lodge claim (photos, GPS, voice).
                Separate from AEGIS account activation invites.
              </p>
              <div className="flex flex-col items-center gap-3 sm:flex-row sm:items-start">
                <img
                  alt="Employee claim QR code"
                  className="h-44 w-44 rounded-lg border border-border bg-white p-2"
                  src={`https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=${encodeURIComponent(employeeClaimUrl(claimToken))}`}
                />
                <div className="min-w-0 flex-1 space-y-2 text-sm">
                  <p className="font-medium">{form.full_name}</p>
                  <p className="break-all text-xs text-muted">{employeeClaimUrl(claimToken)}</p>
                  <p className="text-xs text-muted">WhatsApp OTP goes to {form.whatsapp_number}</p>
                </div>
              </div>
            </>
          ) : (
            <p className="text-sm text-muted">Enable claim QR once WhatsApp is on file.</p>
          )}
        </div>
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
          <Field label="Department">
            <input
              className="field-input"
              value={form.department ?? ''}
              onChange={(e) => setForm({ ...form, department: e.target.value })}
            />
          </Field>
          <Field label="Employment start">
            <input
              className="field-input"
              type="date"
              value={form.employment_start_date ?? ''}
              onChange={(e) => setForm({ ...form, employment_start_date: e.target.value })}
            />
          </Field>
          <Field label="WhatsApp number (optional for HR; needed for claim OTP)">
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
                      <Link to={`/assets/${item.id}`} className="font-medium text-primary">
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
