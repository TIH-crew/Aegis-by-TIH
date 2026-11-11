import { supabase } from '../lib/supabase'
import type { Employee, EmployeeInput, WorkforceException } from '../types/employee'
import {
  createEmployee,
  getEmployee,
  updateEmployee,
} from './employee.service'

export function splitName(fullName: string): { first_name: string; last_name: string } {
  const parts = fullName.trim().split(/\s+/).filter(Boolean)
  if (parts.length === 0) return { first_name: '', last_name: '' }
  if (parts.length === 1) return { first_name: parts[0]!, last_name: parts[0]! }
  return { first_name: parts[0]!, last_name: parts.slice(1).join(' ') }
}

async function audit(
  accountId: string,
  event: {
    employeeId?: string | null
    eventType: string
    summary: string
    detail?: Record<string, unknown>
    actorUserId?: string
    actorLabel?: string
  },
) {
  await supabase.from('portal_workforce_audit_events').insert({
    account_id: accountId,
    employee_id: event.employeeId ?? null,
    event_type: event.eventType,
    summary: event.summary,
    detail: event.detail ?? {},
    actor_user_id: event.actorUserId ?? null,
    actor_label: event.actorLabel ?? null,
  })
}

export async function findDuplicateEmployee(
  accountId: string,
  opts: { email?: string | null; employeeNumber?: string | null; excludeId?: string },
): Promise<Employee | null> {
  if (opts.employeeNumber?.trim()) {
    const { data } = await supabase
      .from('portal_employees')
      .select('*')
      .eq('account_id', accountId)
      .ilike('employee_number', opts.employeeNumber.trim())
      .neq('id', opts.excludeId ?? '00000000-0000-0000-0000-000000000000')
      .limit(1)
      .maybeSingle()
    if (data) return data as Employee
  }
  if (opts.email?.trim()) {
    const { data } = await supabase
      .from('portal_employees')
      .select('*')
      .eq('account_id', accountId)
      .eq('status', 'active')
      .ilike('email', opts.email.trim())
      .neq('id', opts.excludeId ?? '00000000-0000-0000-0000-000000000000')
      .limit(1)
      .maybeSingle()
    if (data) return data as Employee
  }
  return null
}

export async function createEmployeeWithChecks(
  accountId: string,
  input: EmployeeInput,
  actor?: { userId?: string; label?: string },
): Promise<{ employee: Employee; duplicateExceptionId?: string }> {
  const names =
    input.first_name || input.last_name
      ? {
          first_name: input.first_name?.trim() || splitName(input.full_name).first_name,
          last_name: input.last_name?.trim() || splitName(input.full_name).last_name,
        }
      : splitName(input.full_name)

  const dup = await findDuplicateEmployee(accountId, {
    email: input.email,
    employeeNumber: input.employee_number,
  })
  if (dup) {
    const { data: ex } = await supabase
      .from('portal_workforce_exceptions')
      .insert({
        account_id: accountId,
        exception_type: 'suspected_duplicate',
        severity: 'high',
        status: 'open',
        employee_id: dup.id,
        title: `Suspected duplicate for ${input.full_name}`,
        details: {
          existing_id: dup.id,
          existing_employee_number: dup.employee_number,
          existing_email: dup.email,
          attempted: input,
        },
        created_by: actor?.userId ?? null,
      })
      .select('id')
      .single()
    throw Object.assign(new Error(`Duplicate employee: matches ${dup.full_name}`), {
      code: 'DUPLICATE_EMPLOYEE',
      exceptionId: ex?.id,
      existing: dup,
    })
  }

  const employee = await createEmployee(accountId, {
    ...input,
    ...names,
    full_name: input.full_name.trim() || `${names.first_name} ${names.last_name}`.trim(),
    whatsapp_number: input.whatsapp_number?.trim() || '',
  })

  await audit(accountId, {
    employeeId: employee.id,
    eventType: 'employee_created',
    summary: `Employee created: ${employee.full_name}`,
    actorUserId: actor?.userId,
    actorLabel: actor?.label,
    detail: { employee_number: employee.employee_number, email: employee.email },
  })

  // Routine create — no broker approval required
  return { employee }
}

export async function deactivateEmployee(
  accountId: string,
  employeeId: string,
  reason: string,
  actor?: { userId?: string; label?: string },
): Promise<Employee> {
  const endDate = new Date().toISOString().slice(0, 10)
  const employee = await updateEmployee(accountId, employeeId, {
    status: 'inactive',
    employment_end_date: endDate,
  })

  await supabase
    .from('portal_employees')
    .update({
      deactivated_at: new Date().toISOString(),
      deactivation_reason: reason,
      invitation_status: 'revoked',
      updated_at: new Date().toISOString(),
    })
    .eq('id', employeeId)
    .eq('account_id', accountId)

  await supabase
    .from('portal_employee_invites')
    .update({ status: 'revoked' })
    .eq('employee_id', employeeId)
    .eq('status', 'pending')

  await audit(accountId, {
    employeeId,
    eventType: 'employee_deactivated',
    summary: `Employment ended: ${reason}`,
    actorUserId: actor?.userId,
    actorLabel: actor?.label,
    detail: { employment_end_date: endDate },
  })

  return (await getEmployee(accountId, employeeId)) ?? employee
}

async function sha256Hex(text: string) {
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text))
  return [...new Uint8Array(buf)].map((b) => b.toString(16).padStart(2, '0')).join('')
}

export async function inviteEmployee(
  accountId: string,
  employeeId: string,
  actor?: { userId?: string; label?: string },
): Promise<{ inviteId: string; expiresAt: string; email: string; token: string }> {
  const employee = await getEmployee(accountId, employeeId)
  if (!employee) throw new Error('Employee not found')
  if (!employee.email?.trim()) {
    throw new Error('Cannot invite without a verified email address')
  }
  if (employee.status !== 'active') throw new Error('Cannot invite an inactive employee')

  const token = crypto.randomUUID()
  const tokenHash = await sha256Hex(token)
  const expiresAt = new Date(Date.now() + 7 * 86400000).toISOString()

  await supabase
    .from('portal_employee_invites')
    .update({ status: 'revoked' })
    .eq('employee_id', employeeId)
    .eq('status', 'pending')

  const { data, error } = await supabase
    .from('portal_employee_invites')
    .insert({
      account_id: accountId,
      employee_id: employeeId,
      email: employee.email.trim().toLowerCase(),
      token_hash: tokenHash,
      status: 'pending',
      invited_by: actor?.userId ?? null,
      expires_at: expiresAt,
    })
    .select('id')
    .single()
  if (error) throw error

  await supabase
    .from('portal_employees')
    .update({
      invitation_status: 'pending',
      invited_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', employeeId)

  await audit(accountId, {
    employeeId,
    eventType: 'employee_invited',
    summary: `Invitation issued to ${employee.email}`,
    actorUserId: actor?.userId,
    actorLabel: actor?.label,
  })

  // Deliver activation email via edge (magic link + optional Resend/SendGrid notify)
  try {
    const functionsBase =
      (import.meta.env.VITE_SUPABASE_FUNCTIONS_URL as string | undefined)?.replace(/\/$/, '') ||
      `${(import.meta.env.VITE_SUPABASE_URL as string).replace(/\/$/, '')}/functions/v1`
    const anon = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined
    await fetch(`${functionsBase}/aegis-crm/workforce/activation`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        ...(anon ? { apikey: anon, Authorization: `Bearer ${anon}` } : {}),
      },
      body: JSON.stringify({ action: 'send_magic_link', token }),
    })
  } catch {
    // Invite row remains; HR can resend
  }

  // Plain token returned once for email delivery adapters; only hash is stored
  return { inviteId: data.id, expiresAt, email: employee.email, token }
}

/** Resend = revoke pending + issue a new token (same as invite). */
export async function resendEmployeeInvite(
  accountId: string,
  employeeId: string,
  actor?: { userId?: string; label?: string },
) {
  return inviteEmployee(accountId, employeeId, actor)
}

export async function revokeEmployeeInvite(
  accountId: string,
  employeeId: string,
  actor?: { userId?: string; label?: string },
) {
  await supabase
    .from('portal_employee_invites')
    .update({ status: 'revoked' })
    .eq('account_id', accountId)
    .eq('employee_id', employeeId)
    .eq('status', 'pending')

  await supabase
    .from('portal_employees')
    .update({
      invitation_status: 'revoked',
      updated_at: new Date().toISOString(),
    })
    .eq('id', employeeId)
    .eq('account_id', accountId)

  await audit(accountId, {
    employeeId,
    eventType: 'employee_invite_revoked',
    summary: 'Employee activation invitation revoked',
    actorUserId: actor?.userId,
    actorLabel: actor?.label,
  })
}

/** Associate auth user after they accept a hashed activation token (server/edge should call). */
export async function acceptEmployeeInviteByHash(
  accountId: string,
  tokenHash: string,
  userId: string,
) {
  const { data: invite, error } = await supabase
    .from('portal_employee_invites')
    .select('*')
    .eq('account_id', accountId)
    .eq('token_hash', tokenHash)
    .eq('status', 'pending')
    .maybeSingle()
  if (error) throw error
  if (!invite) throw new Error('Invitation not found or already used')
  if (new Date(invite.expires_at).getTime() < Date.now()) {
    await supabase
      .from('portal_employee_invites')
      .update({ status: 'expired' })
      .eq('id', invite.id)
    throw new Error('Invitation expired')
  }

  await supabase
    .from('portal_employee_invites')
    .update({ status: 'accepted', accepted_at: new Date().toISOString() })
    .eq('id', invite.id)

  await supabase
    .from('portal_employees')
    .update({
      invitation_status: 'accepted',
      activated_at: new Date().toISOString(),
      user_id: userId,
      updated_at: new Date().toISOString(),
    })
    .eq('id', invite.employee_id)
    .eq('account_id', accountId)

  await audit(accountId, {
    employeeId: invite.employee_id,
    eventType: 'employee_activated',
    summary: 'Employee accepted AEGIS activation invite',
    actorUserId: userId,
  })

  return invite.employee_id as string
}

export type ImportDraftRow = {
  fullName: string
  firstName?: string
  lastName?: string
  email?: string
  phone?: string
  whatsapp?: string
  employeeNumber?: string
  department?: string
  jobTitle?: string
  startDate?: string
  exclude?: boolean
  error?: string
}

export type ColumnMap = Partial<{
  full_name: string
  first_name: string
  last_name: string
  email: string
  phone: string
  whatsapp: string
  employee_number: string
  department: string
  job_title: string
  start_date: string
}>

const DEFAULT_ALIASES: Record<keyof ColumnMap, string[]> = {
  full_name: ['full_name', 'name', 'employee name', 'employee'],
  first_name: ['first_name', 'firstname', 'first'],
  last_name: ['last_name', 'lastname', 'surname', 'last'],
  email: ['email', 'work_email', 'e-mail'],
  phone: ['phone', 'mobile', 'cell'],
  whatsapp: ['whatsapp', 'whatsapp_number'],
  employee_number: ['employee_number', 'employee no', 'emp_no', 'staff_number', 'empno'],
  department: ['department', 'dept'],
  job_title: ['job_title', 'title', 'role', 'position'],
  start_date: ['start_date', 'employment_start_date', 'start'],
}

export function suggestColumnMap(headers: string[]): ColumnMap {
  const lower = headers.map((h) => h.trim().toLowerCase())
  const map: ColumnMap = {}
  for (const [field, aliases] of Object.entries(DEFAULT_ALIASES) as [keyof ColumnMap, string[]][]) {
    const hit = aliases.find((a) => lower.includes(a))
    if (hit) {
      const original = headers[lower.indexOf(hit)]
      if (original) map[field] = original
    }
  }
  return map
}

function cell(row: Record<string, string>, key: string | undefined): string {
  if (!key) return ''
  return (row[key] ?? row[key.toLowerCase()] ?? '').trim()
}

export function mapRowsToDraft(
  rows: Record<string, string>[],
  columnMap: ColumnMap,
): ImportDraftRow[] {
  return rows.map((raw) => {
    const first = cell(raw, columnMap.first_name)
    const last = cell(raw, columnMap.last_name)
    const full = cell(raw, columnMap.full_name) || [first, last].filter(Boolean).join(' ')
    const row: ImportDraftRow = {
      fullName: full,
      firstName: first || undefined,
      lastName: last || undefined,
      email: cell(raw, columnMap.email) || undefined,
      phone: cell(raw, columnMap.phone) || undefined,
      whatsapp: cell(raw, columnMap.whatsapp) || undefined,
      employeeNumber: cell(raw, columnMap.employee_number) || undefined,
      department: cell(raw, columnMap.department) || undefined,
      jobTitle: cell(raw, columnMap.job_title) || undefined,
      startDate: cell(raw, columnMap.start_date) || undefined,
    }
    if (!row.fullName) row.error = 'Name is required'
    if (!row.employeeNumber && !row.email) {
      row.error = (row.error ? `${row.error}; ` : '') + 'Employee number or email required'
    }
    return row
  })
}

export function parseEmployeeCsv(text: string, columnMap?: ColumnMap): ImportDraftRow[] {
  const lines = text.trim().split(/\r?\n/).filter(Boolean)
  if (lines.length < 2) return []
  const headers = lines[0]!.split(',').map((h) => h.trim())
  const map = columnMap ?? suggestColumnMap(headers)
  const rows = lines.slice(1).map((line) => {
    const cols = line.split(',').map((c) => c.trim())
    const obj: Record<string, string> = {}
    headers.forEach((h, i) => {
      obj[h] = cols[i] ?? ''
      obj[h.toLowerCase()] = cols[i] ?? ''
    })
    return obj
  })
  return mapRowsToDraft(rows, map)
}

/** Parse first sheet of an XLSX ArrayBuffer into header+row objects (preview-safe). */
export async function parseEmployeeXlsx(
  buffer: ArrayBuffer,
  columnMap?: ColumnMap,
): Promise<{ headers: string[]; rows: ImportDraftRow[]; raw: Record<string, string>[] }> {
  const XLSX = await import('xlsx')
  const workbook = XLSX.read(buffer, { type: 'array' })
  const sheetName = workbook.SheetNames[0]
  if (!sheetName) return { headers: [], rows: [], raw: [] }
  const sheet = workbook.Sheets[sheetName]
  const json = XLSX.utils.sheet_to_json<Record<string, unknown>>(sheet, { defval: '' })
  const raw = json.map((r) => {
    const out: Record<string, string> = {}
    for (const [k, v] of Object.entries(r)) {
      out[k] = String(v ?? '').trim()
      out[k.toLowerCase()] = String(v ?? '').trim()
    }
    return out
  })
  const headers = raw[0] ? Object.keys(json[0] ?? {}) : []
  const map = columnMap ?? suggestColumnMap(headers)
  return { headers, rows: mapRowsToDraft(raw, map), raw }
}

export function buildImportErrorCsv(
  results: { row: number; status: string; message?: string }[],
): string {
  const lines = ['row,status,message']
  for (const r of results.filter((x) => x.status === 'invalid' || x.message)) {
    lines.push(`${r.row},${r.status},"${(r.message ?? '').replace(/"/g, '""')}"`)
  }
  return lines.join('\n')
}

export async function importEmployees(
  accountId: string,
  batch: {
    fileName: string
    sourceHash: string
    rows: ImportDraftRow[]
    userId?: string
  },
) {
  const { data: existing } = await supabase
    .from('portal_employee_import_batches')
    .select('id, status')
    .eq('account_id', accountId)
    .eq('source_hash', batch.sourceHash)
    .maybeSingle()
  if (existing?.status === 'completed') {
    return { batchId: existing.id, duplicated: true as const, results: [] as unknown[] }
  }

  const { data: batchRow, error: batchErr } = await supabase
    .from('portal_employee_import_batches')
    .insert({
      account_id: accountId,
      file_name: batch.fileName,
      source_hash: batch.sourceHash,
      status: 'importing',
      row_count: batch.rows.length,
      uploaded_by: batch.userId ?? null,
    })
    .select('*')
    .single()
  if (batchErr) throw batchErr

  const results: { row: number; status: string; message?: string; employeeId?: string }[] = []
  let success = 0
  let errors = 0
  let skipped = 0

  for (let i = 0; i < batch.rows.length; i++) {
    const row = batch.rows[i]!
    if (row.exclude) {
      skipped += 1
      results.push({ row: i + 1, status: 'excluded' })
      continue
    }
    if (row.error || !row.fullName) {
      errors += 1
      results.push({ row: i + 1, status: 'invalid', message: row.error ?? 'Invalid' })
      await supabase.from('portal_employee_import_rows').insert({
        account_id: accountId,
        batch_id: batchRow.id,
        row_no: i + 1,
        source_key: row.employeeNumber ?? row.email ?? null,
        payload: row,
        status: 'invalid',
        error_message: row.error ?? 'Invalid',
      })
      continue
    }

    const dup = await findDuplicateEmployee(accountId, {
      email: row.email,
      employeeNumber: row.employeeNumber,
    })
    if (dup) {
      // Idempotent re-import: update permitted contact fields, do not duplicate
      await updateEmployee(accountId, dup.id, {
        job_title: row.jobTitle ?? undefined,
        department: row.department ?? undefined,
        phone: row.phone ?? undefined,
        email: row.email ?? undefined,
        whatsapp_number: row.whatsapp !== undefined ? row.whatsapp || '' : undefined,
      })
      skipped += 1
      results.push({ row: i + 1, status: 'updated', employeeId: dup.id, message: 'Matched existing — updated' })
      await supabase.from('portal_employee_import_rows').insert({
        account_id: accountId,
        batch_id: batchRow.id,
        row_no: i + 1,
        source_key: row.employeeNumber ?? row.email ?? null,
        payload: row,
        status: 'updated',
        employee_id: dup.id,
      })
      continue
    }

    // No emp-no match: name collision without stable key → exception, do not silent-merge
    if (!row.employeeNumber && row.fullName) {
      const { data: nameHits } = await supabase
        .from('portal_employees')
        .select('id, full_name, email, employee_number')
        .eq('account_id', accountId)
        .eq('status', 'active')
        .ilike('full_name', row.fullName.trim())
        .limit(3)
      if (nameHits && nameHits.length > 0) {
        errors += 1
        const message = 'Name matches existing employee without employee number — manual review'
        results.push({ row: i + 1, status: 'invalid', message })
        await supabase.from('portal_workforce_exceptions').insert({
          account_id: accountId,
          exception_type: 'suspected_duplicate',
          severity: 'high',
          status: 'open',
          employee_id: nameHits[0]!.id,
          import_batch_id: batchRow.id,
          title: message,
          details: { attempted: row, candidates: nameHits },
          created_by: batch.userId ?? null,
        })
        await supabase.from('portal_employee_import_rows').insert({
          account_id: accountId,
          batch_id: batchRow.id,
          row_no: i + 1,
          source_key: row.email ?? null,
          payload: row,
          status: 'invalid',
          error_message: message,
        })
        continue
      }
    }

    try {
      const { employee } = await createEmployeeWithChecks(
        accountId,
        {
          full_name: row.fullName,
          first_name: row.firstName,
          last_name: row.lastName,
          email: row.email,
          phone: row.phone,
          // Never invent WhatsApp from phone — leave empty if absent
          whatsapp_number: row.whatsapp?.trim() || '',
          employee_number: row.employeeNumber,
          department: row.department,
          job_title: row.jobTitle,
          employment_start_date: row.startDate,
          status: 'active',
        },
        { userId: batch.userId, label: 'Bulk import' },
      )
      success += 1
      results.push({ row: i + 1, status: 'imported', employeeId: employee.id })
      await supabase.from('portal_employee_import_rows').insert({
        account_id: accountId,
        batch_id: batchRow.id,
        row_no: i + 1,
        source_key: row.employeeNumber ?? row.email ?? null,
        payload: row,
        status: 'imported',
        employee_id: employee.id,
      })
    } catch (err) {
      errors += 1
      const message = err instanceof Error ? err.message : 'Import failed'
      results.push({ row: i + 1, status: 'invalid', message })
      await supabase.from('portal_employee_import_rows').insert({
        account_id: accountId,
        batch_id: batchRow.id,
        row_no: i + 1,
        source_key: row.employeeNumber ?? row.email ?? null,
        payload: row,
        status: 'invalid',
        error_message: message,
      })
      if (errors >= 50 && success === 0) {
        await supabase.from('portal_workforce_exceptions').insert({
          account_id: accountId,
          exception_type: 'unusual_bulk_change',
          severity: 'high',
          status: 'open',
          import_batch_id: batchRow.id,
          title: 'Bulk import failed validation for many rows',
          details: { error_count: errors },
          created_by: batch.userId ?? null,
        })
      }
    }
  }

  if (batch.rows.length >= 100 && success > 50) {
    await supabase.from('portal_workforce_exceptions').insert({
      account_id: accountId,
      exception_type: 'unusual_bulk_change',
      severity: 'medium',
      status: 'open',
      import_batch_id: batchRow.id,
      title: `Large bulk import: ${success} employees`,
      details: { success, errors, skipped },
      created_by: batch.userId ?? null,
    })
  }

  await supabase
    .from('portal_employee_import_batches')
    .update({
      status: 'completed',
      success_count: success,
      error_count: errors,
      skipped_count: skipped,
      result_report: results,
      completed_at: new Date().toISOString(),
    })
    .eq('id', batchRow.id)

  await audit(accountId, {
    eventType: 'employee_bulk_import',
    summary: `Imported ${success} employees from ${batch.fileName}`,
    actorUserId: batch.userId,
    detail: { batchId: batchRow.id, success, errors, skipped },
  })

  return { batchId: batchRow.id, duplicated: false as const, results }
}

export async function listWorkforceExceptions(accountId: string): Promise<WorkforceException[]> {
  const { data, error } = await supabase
    .from('portal_workforce_exceptions')
    .select('*')
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })
  if (error) throw error
  return (data ?? []) as WorkforceException[]
}

export async function resolveWorkforceException(
  accountId: string,
  exceptionId: string,
  notes: string,
  userId?: string,
  dismiss = false,
) {
  const { data, error } = await supabase
    .from('portal_workforce_exceptions')
    .update({
      status: dismiss ? 'dismissed' : 'resolved',
      resolution_notes: notes,
      resolved_by: userId ?? null,
      resolved_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', exceptionId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error
  await audit(accountId, {
    employeeId: data.employee_id,
    eventType: 'exception_resolved',
    summary: dismiss ? 'Exception dismissed' : 'Exception resolved',
    actorUserId: userId,
    detail: { exceptionId, notes },
  })
  return data
}

export async function getWorkforceOverview(accountId: string) {
  const { data: employees } = await supabase
    .from('portal_employees')
    .select('id, status, invitation_status')
    .eq('account_id', accountId)
  const rows = employees ?? []
  const { count: openExceptions } = await supabase
    .from('portal_workforce_exceptions')
    .select('*', { count: 'exact', head: true })
    .eq('account_id', accountId)
    .eq('status', 'open')

  return {
    total: rows.length,
    active: rows.filter((e) => e.status === 'active').length,
    inactive: rows.filter((e) => e.status === 'inactive').length,
    pendingInvites: rows.filter((e) => e.invitation_status === 'pending').length,
    openExceptions: openExceptions ?? 0,
  }
}

export async function listBenefitMemberships(accountId: string, employeeId: string) {
  const { data, error } = await supabase
    .from('portal_employee_benefit_memberships')
    .select('*')
    .eq('account_id', accountId)
    .eq('employee_id', employeeId)
  if (error) throw error
  return data ?? []
}

/** Record CRM Contact link without inventing Zoho custom field API names. */
export async function linkEmployeeToZohoContact(
  accountId: string,
  employeeId: string,
  zohoContactId: string,
  opts: { userId?: string; method?: 'broker_promote' | 'manual_link'; idempotencyKey: string },
) {
  const { data: existing } = await supabase
    .from('portal_employee_crm_links')
    .select('*')
    .eq('account_id', accountId)
    .eq('idempotency_key', opts.idempotencyKey)
    .maybeSingle()
  if (existing) return { link: existing, duplicated: true as const }

  const { data: link, error } = await supabase
    .from('portal_employee_crm_links')
    .insert({
      account_id: accountId,
      employee_id: employeeId,
      zoho_contact_id: zohoContactId,
      link_status: 'linked',
      link_method: opts.method ?? 'broker_promote',
      idempotency_key: opts.idempotencyKey,
      linked_by: opts.userId ?? null,
    })
    .select('*')
    .single()
  if (error) throw error

  await supabase
    .from('portal_employees')
    .update({
      zoho_contact_id: zohoContactId,
      zoho_contact_link_status: 'linked',
      zoho_contact_linked_at: new Date().toISOString(),
      zoho_contact_linked_by: opts.userId ?? null,
      updated_at: new Date().toISOString(),
    })
    .eq('id', employeeId)
    .eq('account_id', accountId)

  await audit(accountId, {
    employeeId,
    eventType: 'crm_contact_linked',
    summary: `Linked Zoho Contact ${zohoContactId}`,
    actorUserId: opts.userId,
    detail: { zohoContactId, idempotencyKey: opts.idempotencyKey },
  })

  return { link, duplicated: false as const }
}
