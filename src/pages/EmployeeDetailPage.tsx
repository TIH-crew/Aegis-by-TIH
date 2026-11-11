import { useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  ArrowLeft,
  MessageCircle,
  QrCode,
  UserRound,
} from 'lucide-react'
import { StatusBadge } from '../components/collections/StatusBadge'
import { EmptyState } from '../components/workspace/WorkspaceUi'
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
  listBenefitMemberships,
  listEmployeeAuditEvents,
  resendEmployeeInvite,
  revokeEmployeeInvite,
  splitName,
  type WorkforceAuditEvent,
} from '../services/workforce.service'
import { promoteEmployeeContact, searchWorkforceContacts } from '../services/crm.service'
import { employeeClaimUrl } from '../services/employee-claim.service'
import { employeeHasClaimWhatsApp } from '../lib/contact-validation'
import { whatsappHref } from '../lib/extensions'
import { cn, formatCurrency, formatDate } from '../lib/utils'
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

type ProfileTab = 'overview' | 'employment' | 'benefits' | 'assets' | 'activity'

const TABS: { id: ProfileTab; label: string }[] = [
  { id: 'overview', label: 'Overview' },
  { id: 'employment', label: 'Employment' },
  { id: 'benefits', label: 'Benefits' },
  { id: 'assets', label: 'Assets & Claims' },
  { id: 'activity', label: 'Activity' },
]

const BENEFIT_GROUPS: { key: string; label: string; types: string[] }[] = [
  { key: 'retirement', label: 'Retirement Funds', types: ['pension', 'provident'] },
  { key: 'medical', label: 'Medical Aid', types: ['medical_aid'] },
  { key: 'gap', label: 'Gap Cover', types: ['gap_cover'] },
  { key: 'risk', label: 'Group Risk', types: ['group_life', 'disability', 'funeral'] },
  { key: 'other', label: 'Other Benefits', types: ['other'] },
]

function inviteLabel(status: string) {
  const map: Record<string, string> = {
    not_invited: 'Not invited',
    pending: 'Invite pending',
    accepted: 'Activated',
    expired: 'Invite expired',
    revoked: 'Invite revoked',
  }
  return map[status] ?? status.replace(/_/g, ' ')
}

function employmentLabel(status: string) {
  return status === 'active' ? 'Active employee' : 'Inactive'
}

export function EmployeeDetailPage() {
  const { id } = useParams<{ id: string }>()
  const isNew = id === 'new'
  const navigate = useNavigate()
  const { accountId, user, can, homeAccountName } = useAuth()
  const { branches } = useBranches()
  const { riskItems } = useSearch()
  const [form, setForm] = useState<EmployeeInput>(EMPTY)
  const [baseline, setBaseline] = useState<EmployeeInput>(EMPTY)
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
    {
      benefit_type: string
      enrolment_status: string
      provider_confirmation_status: string
      provider_name?: string | null
      membership_number?: string | null
    }[]
  >([])
  const [activity, setActivity] = useState<WorkforceAuditEvent[]>([])
  const [tab, setTab] = useState<ProfileTab>(isNew ? 'employment' : 'overview')
  const [editing, setEditing] = useState(isNew)
  const [confirmEnd, setConfirmEnd] = useState(false)

  const canHr = can('workforce_hr')
  const canBroker = can('workforce_broker')
  const canEdit = canHr || can('employees')

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
        const next: EmployeeInput = {
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
        }
        setForm(next)
        setBaseline(next)
        void listBenefitMemberships(accountId, employee.id).then(setBenefits).catch(() => setBenefits([]))
        void listEmployeeAuditEvents(accountId, employee.id).then(setActivity).catch(() => setActivity([]))
      })
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load employee'))
      .finally(() => setLoading(false))
  }, [accountId, id, isNew])

  const dirty = useMemo(() => JSON.stringify(form) !== JSON.stringify(baseline), [form, baseline])

  const attachedItems = useMemo(
    () => riskItems.filter((item) => item.employee_id === employeeId),
    [riskItems, employeeId],
  )

  const branchName = branches.find((b) => b.id === form.branch_id)?.name
  const wa = form.whatsapp_number ? whatsappHref(form.whatsapp_number) : null
  const initials = (form.full_name || '?')
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, 2)
    .map((p) => p[0]?.toUpperCase() ?? '')
    .join('')

  function patchForm(partial: Partial<EmployeeInput>) {
    setForm((f) => ({ ...f, ...partial }))
    if (!editing && !isNew) setEditing(true)
  }

  function switchTab(next: ProfileTab) {
    if (dirty && next !== 'employment' && editing) {
      const leave = window.confirm('You have unsaved changes. Switch tabs anyway?')
      if (!leave) return
    }
    setTab(next)
  }

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
        setBaseline(payload)
        setEditing(false)
        setNote('Profile saved.')
        void listEmployeeAuditEvents(accountId, employeeId).then(setActivity).catch(() => undefined)
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

  async function runInvite() {
    if (!accountId || !employeeId) return
    setSaving(true)
    setError(null)
    const action = invitationStatus === 'pending' ? resendEmployeeInvite : inviteEmployee
    try {
      const r = await action(accountId, employeeId, { userId: user?.id, label: user?.email })
      setInvitationStatus('pending')
      setNote(
        `Activation invite for ${r.email} (expires ${r.expiresAt.slice(0, 10)}). Claim QR is separate.`,
      )
      void listEmployeeAuditEvents(accountId, employeeId).then(setActivity).catch(() => undefined)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Invite failed')
    } finally {
      setSaving(false)
    }
  }

  async function runRevoke() {
    if (!accountId || !employeeId) return
    setSaving(true)
    try {
      await revokeEmployeeInvite(accountId, employeeId, { userId: user?.id, label: user?.email })
      setInvitationStatus('revoked')
      setNote('Activation invitation revoked.')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Revoke failed')
    } finally {
      setSaving(false)
    }
  }

  async function runDeactivate() {
    if (!accountId || !employeeId) return
    setSaving(true)
    setConfirmEnd(false)
    try {
      await deactivateEmployee(accountId, employeeId, 'Left employer', {
        userId: user?.id,
        label: user?.email,
      })
      patchForm({ status: 'inactive' })
      setBaseline((b) => ({ ...b, status: 'inactive' }))
      setNote('Employment ended. History and CRM links preserved.')
      void listEmployeeAuditEvents(accountId, employeeId).then(setActivity).catch(() => undefined)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Deactivate failed')
    } finally {
      setSaving(false)
    }
  }

  async function runPromote() {
    if (!employeeId) return
    setSaving(true)
    setError(null)
    try {
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
      if (accountId) {
        void listEmployeeAuditEvents(accountId, employeeId).then(setActivity).catch(() => undefined)
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'CRM promotion failed')
    } finally {
      setSaving(false)
    }
  }

  if (loading) return <p className="text-sm text-muted">Loading employee…</p>

  return (
    <div className="mx-auto max-w-5xl space-y-4">
      <Link
        to="/people/employees"
        className="inline-flex items-center gap-1 text-sm text-muted hover:text-ink"
      >
        <ArrowLeft size={14} /> Back to employees
      </Link>

      {error && (
        <p className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</p>
      )}
      {note && (
        <p className="rounded-md border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-900">
          {note}
        </p>
      )}

      {/* Profile header */}
      <header className="ws-panel flex flex-col gap-4 p-4 sm:flex-row sm:items-center sm:justify-between">
        <div className="flex min-w-0 items-start gap-3 sm:items-center">
          <div className="flex h-16 w-16 shrink-0 items-center justify-center overflow-hidden rounded-full bg-page text-sm font-semibold text-burgundy ring-1 ring-border">
            {imageUrl ? (
              <img src={imageUrl} alt="" className="h-full w-full object-cover" />
            ) : isNew ? (
              <UserRound size={28} className="text-muted" />
            ) : (
              initials
            )}
          </div>
          <div className="min-w-0">
            <h1 className="truncate text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              {isNew ? 'New employee' : form.full_name || 'Employee'}
            </h1>
            <p className="mt-0.5 truncate text-sm text-muted">
              {[form.job_title || null, form.department || null, homeAccountName || null]
                .filter(Boolean)
                .join(' · ') || 'Employment record'}
            </p>
            {!isNew && (
              <div className="mt-2 flex flex-wrap gap-1.5">
                <StatusBadge status={form.status === 'active' ? 'active' : 'inactive'} />
                <span className="ws-status bg-stone-100 text-stone-700 ring-1 ring-stone-200/80">
                  {inviteLabel(invitationStatus)}
                </span>
                {canBroker && (
                  <span className="ws-status bg-stone-100 text-stone-700 ring-1 ring-stone-200/80">
                    CRM: {(crmStatus || 'none').replace(/_/g, ' ')}
                  </span>
                )}
              </div>
            )}
          </div>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          {dirty && (
            <span className="text-xs font-medium text-amber-800">Unsaved changes</span>
          )}
          {canEdit && (
            <>
              {!isNew && !editing && (
                <button
                  type="button"
                  className="ws-btn-secondary text-sm"
                  onClick={() => {
                    setEditing(true)
                    setTab('employment')
                  }}
                >
                  Edit profile
                </button>
              )}
              {(editing || isNew || dirty) && (
                <button
                  type="button"
                  onClick={() => void handleSave()}
                  disabled={saving}
                  className="rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white hover:bg-burgundy-dark disabled:opacity-60"
                >
                  {saving ? 'Saving…' : isNew ? 'Create employee' : 'Save'}
                </button>
              )}
            </>
          )}
        </div>
      </header>

      {!isNew && (
        <nav
          className="flex gap-1 overflow-x-auto border-b border-border pb-px"
          aria-label="Employee profile sections"
        >
          {TABS.map((t) => (
            <button
              key={t.id}
              type="button"
              onClick={() => switchTab(t.id)}
              className={cn(
                'shrink-0 rounded-t-md px-3 py-2 text-sm font-medium transition-colors',
                tab === t.id
                  ? 'border-b-2 border-primary text-primary'
                  : 'text-muted hover:text-ink',
              )}
            >
              {t.label}
            </button>
          ))}
        </nav>
      )}

      {/* OVERVIEW */}
      {(isNew ? false : tab === 'overview') && (
        <div className="grid gap-3 lg:grid-cols-2">
          <InfoCard title="Employment">
            <Dl
              rows={[
                ['Status', employmentLabel(form.status ?? 'active')],
                ['Job title', form.job_title || '—'],
                ['Department', form.department || '—'],
                ['Branch', branchName || '—'],
                ['Employee number', form.employee_number || '—'],
              ]}
            />
          </InfoCard>

          <InfoCard title="AEGIS access">
            <Dl
              rows={[
                ['Invitation', inviteLabel(invitationStatus)],
                [
                  'Account',
                  invitationStatus === 'accepted' ? 'Activated' : 'Not activated',
                ],
              ]}
            />
            {canHr && (
              <div className="mt-3 flex flex-wrap gap-2">
                <button
                  type="button"
                  className="ws-btn-secondary text-xs"
                  disabled={saving || !form.email}
                  onClick={() => void runInvite()}
                >
                  {invitationStatus === 'pending' ? 'Resend invite' : 'Invite employee'}
                </button>
                {invitationStatus === 'pending' && (
                  <button
                    type="button"
                    className="ws-btn-secondary text-xs"
                    disabled={saving}
                    onClick={() => void runRevoke()}
                  >
                    Revoke invite
                  </button>
                )}
              </div>
            )}
            {!form.email && canHr && (
              <p className="mt-2 text-xs text-amber-800">Add an email on the Employment tab to invite.</p>
            )}
          </InfoCard>

          <InfoCard title="Benefits">
            {benefits.length === 0 ? (
              <p className="text-sm text-muted">
                No employee benefits have been registered yet. HR enrolment is not provider confirmation.
              </p>
            ) : (
              <ul className="space-y-1.5 text-sm">
                {benefits.slice(0, 4).map((b) => (
                  <li key={b.benefit_type} className="flex flex-wrap justify-between gap-2">
                    <span className="capitalize">{b.benefit_type.replace(/_/g, ' ')}</span>
                    <span className="text-xs text-muted">
                      {b.enrolment_status.replace(/_/g, ' ')}
                      {b.provider_confirmation_status === 'confirmed'
                        ? ' · provider confirmed'
                        : ' · provider unconfirmed'}
                    </span>
                  </li>
                ))}
              </ul>
            )}
            <button
              type="button"
              className="mt-3 text-xs font-medium text-primary underline"
              onClick={() => setTab('benefits')}
            >
              View benefits
            </button>
          </InfoCard>

          {canBroker && (
            <InfoCard title="CRM relationship">
              <Dl
                rows={[
                  ['Link status', (crmStatus || 'none').replace(/_/g, ' ')],
                  ['Contact ID', zohoContactId || 'Not linked'],
                ]}
              />
              {!zohoContactId && (
                <button
                  type="button"
                  className="mt-3 ws-btn-primary text-xs"
                  disabled={saving}
                  onClick={() => void runPromote()}
                >
                  Promote / link Zoho Contact
                </button>
              )}
              <p className="mt-2 text-[11px] text-muted">
                Broker-initiated only. Never created automatically on import.
              </p>
            </InfoCard>
          )}

          <InfoCard title="Quick actions" className="lg:col-span-2">
            <div className="flex flex-wrap gap-2">
              {canEdit && (
                <button
                  type="button"
                  className="ws-btn-secondary text-xs"
                  onClick={() => {
                    setEditing(true)
                    setTab('employment')
                  }}
                >
                  Edit employee
                </button>
              )}
              {canHr && (
                <button
                  type="button"
                  className="ws-btn-secondary text-xs"
                  disabled={saving || !form.email}
                  onClick={() => void runInvite()}
                >
                  Invite employee
                </button>
              )}
              <button
                type="button"
                className="ws-btn-secondary text-xs"
                onClick={() => setTab('assets')}
              >
                View assigned assets
              </button>
              <button
                type="button"
                className="ws-btn-secondary text-xs"
                onClick={() => setTab('benefits')}
              >
                View benefits
              </button>
              {canBroker && !zohoContactId && (
                <button
                  type="button"
                  className="ws-btn-secondary text-xs"
                  disabled={saving}
                  onClick={() => void runPromote()}
                >
                  Promote to CRM Contact
                </button>
              )}
            </div>
          </InfoCard>
        </div>
      )}

      {/* EMPLOYMENT / NEW */}
      {(isNew || tab === 'employment') && (
        <div className="space-y-4">
          <div className="grid gap-4 md:grid-cols-[180px_1fr]">
            <div className="ws-panel p-4 text-center">
              <div className="mx-auto mb-3 flex h-28 w-28 items-center justify-center overflow-hidden rounded-full bg-page text-muted ring-1 ring-border">
                {imageUrl ? (
                  <img src={imageUrl} alt="" className="h-full w-full object-cover" />
                ) : (
                  <UserRound size={36} />
                )}
              </div>
              {canEdit && (
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
              )}
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

            <div className="space-y-4">
              <InfoCard title="Personal and contact">
                <div className="grid gap-3 sm:grid-cols-2">
                  <Field label="Full name">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.full_name}
                      onChange={(e) => patchForm({ full_name: e.target.value })}
                    />
                  </Field>
                  <Field label="First name">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.first_name ?? ''}
                      onChange={(e) => patchForm({ first_name: e.target.value })}
                    />
                  </Field>
                  <Field label="Last name">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.last_name ?? ''}
                      onChange={(e) => patchForm({ last_name: e.target.value })}
                    />
                  </Field>
                  <Field label="Email">
                    <input
                      className="field-input"
                      type="email"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.email ?? ''}
                      onChange={(e) => patchForm({ email: e.target.value })}
                    />
                  </Field>
                  <Field label="Phone">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.phone ?? ''}
                      onChange={(e) => patchForm({ phone: e.target.value })}
                    />
                  </Field>
                  <Field label="WhatsApp (optional; required for claim OTP)">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.whatsapp_number}
                      placeholder="+27…"
                      onChange={(e) => patchForm({ whatsapp_number: e.target.value })}
                    />
                  </Field>
                  <Field label="ID number">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.id_number ?? ''}
                      onChange={(e) => patchForm({ id_number: e.target.value })}
                    />
                  </Field>
                </div>
              </InfoCard>

              <InfoCard title="Employment information">
                <div className="grid gap-3 sm:grid-cols-2">
                  <Field label="Employee number">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.employee_number ?? ''}
                      onChange={(e) => patchForm({ employee_number: e.target.value })}
                    />
                  </Field>
                  <Field label="Job title">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.job_title ?? ''}
                      onChange={(e) => patchForm({ job_title: e.target.value })}
                    />
                  </Field>
                  <Field label="Department">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.department ?? ''}
                      onChange={(e) => patchForm({ department: e.target.value })}
                    />
                  </Field>
                  <Field label="Branch">
                    <select
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.branch_id ?? ''}
                      onChange={(e) => patchForm({ branch_id: e.target.value })}
                    >
                      <option value="">Select branch</option>
                      {branches.map((branch) => (
                        <option key={branch.id} value={branch.id}>
                          {branch.name}
                        </option>
                      ))}
                    </select>
                  </Field>
                  <Field label="Employment start">
                    <input
                      className="field-input"
                      type="date"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.employment_start_date ?? ''}
                      onChange={(e) => patchForm({ employment_start_date: e.target.value })}
                    />
                  </Field>
                  <Field label="Employment end">
                    <input
                      className="field-input"
                      type="date"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.employment_end_date ?? ''}
                      onChange={(e) => patchForm({ employment_end_date: e.target.value })}
                    />
                  </Field>
                  <Field label="Status">
                    <select
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.status}
                      onChange={(e) =>
                        patchForm({ status: e.target.value as EmployeeInput['status'] })
                      }
                    >
                      <option value="active">Active</option>
                      <option value="inactive">Inactive</option>
                    </select>
                  </Field>
                  <Field label="Licence number">
                    <input
                      className="field-input"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.licence_number ?? ''}
                      onChange={(e) => patchForm({ licence_number: e.target.value })}
                    />
                  </Field>
                  <Field label="Licence valid to">
                    <input
                      className="field-input"
                      type="date"
                      disabled={!canEdit || (!editing && !isNew)}
                      value={form.licence_valid_to ?? ''}
                      onChange={(e) => patchForm({ licence_valid_to: e.target.value })}
                    />
                  </Field>
                </div>
                {form.drivers_licence_verified_at && (
                  <p className="mt-3 text-xs text-muted">
                    Licence last verified {formatDate(form.drivers_licence_verified_at.slice(0, 10))}
                    {form.licence_categories && form.licence_categories.length > 0
                      ? ` · Categories ${form.licence_categories.join(', ')}`
                      : ''}
                  </p>
                )}
              </InfoCard>

              {!isNew && canHr && form.status === 'active' && (
                <InfoCard title="Employment lifecycle">
                  <p className="text-sm text-muted">
                    Ending employment soft-deactivates the record. Custody, claims, CRM links and history are preserved.
                  </p>
                  {!confirmEnd ? (
                    <button
                      type="button"
                      className="mt-3 ws-btn-secondary text-xs"
                      disabled={saving}
                      onClick={() => setConfirmEnd(true)}
                    >
                      End employment
                    </button>
                  ) : (
                    <div className="mt-3 flex flex-wrap items-center gap-2">
                      <p className="text-sm text-amber-900">Confirm end employment for this organisation?</p>
                      <button
                        type="button"
                        className="rounded-lg bg-primary px-3 py-1.5 text-xs font-medium text-white"
                        disabled={saving}
                        onClick={() => void runDeactivate()}
                      >
                        Confirm
                      </button>
                      <button
                        type="button"
                        className="ws-btn-secondary text-xs"
                        onClick={() => setConfirmEnd(false)}
                      >
                        Cancel
                      </button>
                    </div>
                  )}
                </InfoCard>
              )}
            </div>
          </div>
        </div>
      )}

      {/* BENEFITS */}
      {!isNew && tab === 'benefits' && (
        <div className="space-y-3">
          {benefits.length === 0 ? (
            <EmptyState
              title="No employee benefits have been registered yet."
              description="HR-reported enrolment is not the same as provider-confirmed cover. Pension balances and medical claims are not shown here."
            />
          ) : (
            BENEFIT_GROUPS.map((group) => {
              const rows = benefits.filter((b) => group.types.includes(b.benefit_type))
              if (rows.length === 0) return null
              return (
                <InfoCard key={group.key} title={group.label}>
                  <ul className="divide-y divide-border/60">
                    {rows.map((b) => (
                      <li key={b.benefit_type} className="py-2.5 text-sm first:pt-0 last:pb-0">
                        <div className="flex flex-wrap items-baseline justify-between gap-2">
                          <p className="font-medium capitalize text-ink">
                            {b.benefit_type.replace(/_/g, ' ')}
                          </p>
                          <p className="text-xs text-muted">
                            Provider: {b.provider_confirmation_status.replace(/_/g, ' ')}
                          </p>
                        </div>
                        <p className="mt-0.5 text-xs text-muted">
                          HR enrolment: {b.enrolment_status.replace(/_/g, ' ')}
                          {b.provider_name ? ` · ${b.provider_name}` : ''}
                          {b.membership_number ? ` · #${b.membership_number}` : ''}
                        </p>
                        {b.provider_confirmation_status !== 'confirmed' && (
                          <p className="mt-1 text-[11px] text-amber-800">
                            Not shown as confirmed coverage until the provider confirms.
                          </p>
                        )}
                      </li>
                    ))}
                  </ul>
                </InfoCard>
              )
            })
          )}
        </div>
      )}

      {/* ASSETS & CLAIMS */}
      {!isNew && tab === 'assets' && (
        <div className="space-y-4">
          <InfoCard title="Staff claim QR">
            <p className="mb-3 text-xs text-muted">
              Insurance claim access for this employee. Separate from AEGIS account activation invites.
            </p>
            <div id="employee-claim-qr">
              <div className="mb-3 flex flex-wrap gap-2">
                {employeeHasClaimWhatsApp(form.whatsapp_number) && claimToken && (
                  <button
                    type="button"
                    className="ws-btn-secondary text-xs"
                    onClick={() => window.print()}
                  >
                    Print QR
                  </button>
                )}
                <button
                  type="button"
                  className="ws-btn-secondary text-xs"
                  onClick={() => {
                    if (!accountId || !employeeId) return
                    if (!employeeHasClaimWhatsApp(form.whatsapp_number)) {
                      setError('Add a usable WhatsApp number before enabling claim QR / OTP.')
                      setTab('employment')
                      setEditing(true)
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
              {!employeeHasClaimWhatsApp(form.whatsapp_number) ? (
                <p className="text-sm text-amber-900">
                  WhatsApp is optional for HR registration, but claim OTP requires a usable mobile
                  number. We will not invent one.
                </p>
              ) : claimToken ? (
                <div className="flex flex-col items-center gap-3 sm:flex-row sm:items-start">
                  <img
                    alt="Employee claim QR code"
                    className="h-40 w-40 rounded-lg border border-border bg-white p-2"
                    src={`https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=${encodeURIComponent(employeeClaimUrl(claimToken))}`}
                  />
                  <div className="min-w-0 flex-1 space-y-1 text-sm">
                    <p className="inline-flex items-center gap-1 font-medium">
                      <QrCode size={14} /> {form.full_name}
                    </p>
                    <p className="break-all text-xs text-muted">{employeeClaimUrl(claimToken)}</p>
                    <p className="text-xs text-muted">WhatsApp OTP → {form.whatsapp_number}</p>
                  </div>
                </div>
              ) : (
                <p className="text-sm text-muted">Enable claim QR once WhatsApp is on file.</p>
              )}
            </div>
          </InfoCard>

          <div className="ws-panel overflow-hidden">
            <div className="flex items-center justify-between border-b border-border px-4 py-3">
              <div>
                <h2 className="text-sm font-semibold text-ink">Assigned assets</h2>
                <p className="text-xs text-muted">Risk items currently in this employee’s custody.</p>
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
        </div>
      )}

      {/* ACTIVITY */}
      {!isNew && tab === 'activity' && (
        <div className="ws-panel p-4">
          {activity.length === 0 ? (
            <EmptyState
              title="No workforce activity yet"
              description="Invites, updates, CRM links and employment changes will appear here when recorded."
            />
          ) : (
            <ul className="space-y-3">
              {activity.map((ev) => (
                <li key={ev.id} className="border-b border-border/50 pb-3 last:border-0 last:pb-0">
                  <div className="flex flex-wrap items-baseline justify-between gap-2">
                    <p className="text-sm font-medium text-ink">{ev.summary}</p>
                    <time className="text-xs text-muted">
                      {new Date(ev.created_at).toLocaleString()}
                    </time>
                  </div>
                  <p className="mt-0.5 text-xs capitalize text-muted">
                    {ev.event_type.replace(/_/g, ' ')}
                    {ev.actor_label ? ` · ${ev.actor_label}` : ''}
                  </p>
                </li>
              ))}
            </ul>
          )}
        </div>
      )}
    </div>
  )
}

function InfoCard({
  title,
  children,
  className,
}: {
  title: string
  children: ReactNode
  className?: string
}) {
  return (
    <section className={cn('ws-panel p-4', className)}>
      <h2 className="text-xs font-semibold uppercase tracking-wide text-muted">{title}</h2>
      <div className="mt-2">{children}</div>
    </section>
  )
}

function Dl({ rows }: { rows: [string, string][] }) {
  return (
    <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1.5 text-sm">
      {rows.map(([k, v]) => (
        <div key={k} className="contents">
          <dt className="text-muted">{k}</dt>
          <dd className="font-medium text-ink">{v}</dd>
        </div>
      ))}
    </dl>
  )
}

function Field({ label, children }: { label: string; children: ReactNode }) {
  return (
    <label className="block text-sm">
      <span className="mb-1 block font-medium text-ink">{label}</span>
      {children}
    </label>
  )
}
