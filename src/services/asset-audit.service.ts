import { supabase } from '../lib/supabase'
import { appendTimeline, queueEmail, reportIncident } from './asset-lifecycle.service'

export type AuditScope = {
  branchIds?: string[]
  assetClasses?: string[]
  assetIds?: string[]
}

export async function createAudit(
  accountId: string,
  input: {
    name: string
    purpose?: string
    scope: AuditScope
    startAt: string
    submissionDeadline: string
    reviewDeadline: string
    requirePhotos?: boolean
    requireSerialCheck?: boolean
    requireLocation?: boolean
    escalationEmail?: string
    organiserUserId?: string
  },
) {
  const { data, error } = await supabase
    .from('aam_audits')
    .insert({
      account_id: accountId,
      name: input.name,
      purpose: input.purpose ?? null,
      status: 'draft',
      scope: input.scope,
      start_at: input.startAt,
      submission_deadline: input.submissionDeadline,
      review_deadline: input.reviewDeadline,
      timezone: 'Africa/Johannesburg',
      require_photos: input.requirePhotos ?? true,
      require_serial_check: input.requireSerialCheck ?? true,
      require_location: input.requireLocation ?? true,
      escalation_email: input.escalationEmail ?? null,
      organiser_user_id: input.organiserUserId ?? null,
    })
    .select('*')
    .single()
  if (error) throw error
  return data
}

export async function listAudits(accountId: string) {
  const { data, error } = await supabase
    .from('aam_audits')
    .select('*')
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })
  if (error) throw error
  return data ?? []
}

export async function launchAudit(accountId: string, auditId: string) {
  const { data: audit } = await supabase
    .from('aam_audits')
    .select('*')
    .eq('id', auditId)
    .eq('account_id', accountId)
    .single()
  if (!audit) throw new Error('Audit not found')

  const scope = (audit.scope ?? {}) as AuditScope
  let q = supabase
    .from('aam_assets')
    .select('id, asset_tag, description, custodian_employee_id, branch_id, barcode')
    .eq('account_id', accountId)
    .in('status', ['active', 'draft', 'pending_capitalisation'])

  if (scope.assetIds?.length) q = q.in('id', scope.assetIds)
  if (scope.branchIds?.length) q = q.in('branch_id', scope.branchIds)
  if (scope.assetClasses?.length) q = q.in('asset_class', scope.assetClasses)

  const { data: assets, error: assetErr } = await q
  if (assetErr) throw assetErr
  const list = assets ?? []

  // Snapshot assignees at launch
  const employeeIds = [...new Set(list.map((a) => a.custodian_employee_id).filter(Boolean))] as string[]
  const employees =
    employeeIds.length > 0
      ? await supabase
          .from('portal_employees')
          .select('id, full_name, email, user_id, branch_id')
          .in('id', employeeIds)
          .then((r) => r.data ?? [])
      : []
  const empById = new Map(employees.map((e) => [e.id, e]))

  const snapshot = list.map((a) => ({
    asset_id: a.id,
    asset_tag: a.asset_tag,
    custodian_employee_id: a.custodian_employee_id,
    branch_id: a.branch_id,
    barcode: a.barcode,
  }))

  await supabase
    .from('aam_audits')
    .update({ status: 'launched', asset_snapshot: snapshot })
    .eq('id', auditId)

  // Create assignments
  const assignments = list.map((a) => {
    const emp = a.custodian_employee_id ? empById.get(a.custodian_employee_id) : null
    return {
      account_id: accountId,
      audit_id: auditId,
      asset_id: a.id,
      assignee_employee_id: a.custodian_employee_id,
      assignee_user_id: emp?.user_id ?? null,
      assignee_email: emp?.email ?? null,
      branch_id: a.branch_id,
      invite_status: emp?.email ? 'pending' : 'failed',
    }
  })

  if (assignments.length) {
    const { error } = await supabase.from('aam_audit_assignments').upsert(assignments, {
      onConflict: 'audit_id,asset_id',
    })
    if (error) throw error
  }

  // One email per assignee (group assets), not per asset
  const byEmail = new Map<string, typeof list>()
  for (const a of list) {
    const emp = a.custodian_employee_id ? empById.get(a.custodian_employee_id) : null
    const email = emp?.email
    if (!email) continue
    const bucket = byEmail.get(email) ?? []
    bucket.push(a)
    byEmail.set(email, bucket)
  }

  const emailResults: { email: string; status: string; error?: string }[] = []
  for (const [email, assetsForUser] of byEmail) {
    const tags = assetsForUser.map((a) => a.asset_tag).join(', ')
    try {
      const row = await queueEmail(accountId, {
        templateKey: 'audit_invitation',
        toEmail: email,
        subject: `Asset audit: ${audit.name} — response required`,
        bodyText: [
          `You have been asked to verify ${assetsForUser.length} asset(s) for "${audit.name}".`,
          `Deadline: ${audit.submission_deadline} (Africa/Johannesburg).`,
          `Assets: ${tags}`,
          `Open ASSETS → Audits to complete your report. Do not share this request.`,
        ].join('\n\n'),
        idempotencyKey: `audit-invite-${auditId}-${email}`,
        payload: { auditId, assetIds: assetsForUser.map((a) => a.id) },
      })
      emailResults.push({ email, status: row.status, error: row.last_error ?? undefined })
      await supabase
        .from('aam_audit_assignments')
        .update({
          invite_status: row.status === 'skipped_no_provider' || row.status === 'queued' ? 'delivered' : 'failed',
        })
        .eq('audit_id', auditId)
        .eq('assignee_email', email)
    } catch (err) {
      emailResults.push({
        email,
        status: 'failed',
        error: err instanceof Error ? err.message : 'send failed',
      })
    }
  }

  // Flag failed delivery where no email
  const failedNoEmail = assignments.filter((a) => a.invite_status === 'failed')
  for (const a of list) {
    await appendTimeline(accountId, a.id, {
      eventType: 'audit_assigned',
      summary: `Included in physical audit "${audit.name}"`,
      auditId,
    })
  }

  return {
    auditId,
    assetCount: list.length,
    invitations: emailResults,
    deliveryFailures: [
      ...failedNoEmail.map((a) => ({
        assetId: a.asset_id,
        reason: 'No verified email / account for assignee',
      })),
      ...emailResults.filter((e) => e.status === 'failed' || e.status === 'skipped_no_provider'),
    ],
    providerConfigured: import.meta.env.VITE_EMAIL_PROVIDER_CONFIGURED === 'true',
  }
}

export async function getMyAuditAssignments(accountId: string, email?: string, userId?: string) {
  let q = supabase
    .from('aam_audit_assignments')
    .select('*, aam_assets(asset_tag, description, barcode, location_text), aam_audits(name, submission_deadline, status)')
    .eq('account_id', accountId)
  if (email) q = q.eq('assignee_email', email)
  else if (userId) q = q.eq('assignee_user_id', userId)
  const { data, error } = await q
  if (error) throw error
  return data ?? []
}

export async function saveAuditReport(
  accountId: string,
  input: {
    auditId: string
    assignmentId: string
    assetId: string
    possession: string
    locationConfirmed?: string
    barcodeConfirmed?: string
    conditionCode?: string
    comments?: string
    repairsNone?: boolean
    repairs?: {
      date: string
      description: string
      supplier?: string
      costZar: string
      documentUrl?: string
      possibleCapitalImprovement?: boolean
    }[]
    photoUrls?: string[]
    draft?: boolean
    attestationName?: string
    userId?: string
  },
) {
  const payload = {
    account_id: accountId,
    audit_id: input.auditId,
    assignment_id: input.assignmentId,
    asset_id: input.assetId,
    status: input.draft ? 'draft' : 'submitted',
    possession: input.possession,
    location_confirmed: input.locationConfirmed ?? null,
    barcode_confirmed: input.barcodeConfirmed ?? null,
    condition_code: input.conditionCode ?? null,
    comments: input.comments ?? null,
    repairs_none: input.repairsNone ?? false,
    repairs: input.repairs ?? [],
    photo_urls: input.photoUrls ?? [],
    attestation_name: input.draft ? null : input.attestationName ?? null,
    attested_at: input.draft ? null : new Date().toISOString(),
    submitted_at: input.draft ? null : new Date().toISOString(),
    updated_at: new Date().toISOString(),
  }

  const { data, error } = await supabase
    .from('aam_audit_reports')
    .upsert(payload, { onConflict: 'assignment_id' })
    .select('*')
    .single()
  if (error) throw error

  if (!input.draft) {
    await supabase
      .from('aam_audit_assignments')
      .update({ invite_status: 'submitted' })
      .eq('id', input.assignmentId)

    await appendTimeline(accountId, input.assetId, {
      eventType: 'audit_report_submitted',
      summary: `Audit report submitted: ${input.possession}`,
      auditId: input.auditId,
      actorUserId: input.userId,
      actorLabel: input.attestationName,
    })

    // Damage / write-off → incident workflow (do not change accounting values)
    if (['damaged', 'write_off_potential', 'missing'].includes(input.possession)) {
      const incident = await reportIncident(accountId, {
        assetId: input.assetId,
        incidentType: input.possession === 'missing' ? 'missing' : 'damage',
        incidentDate: new Date().toISOString().slice(0, 10),
        description: `Escalated from physical audit: ${input.comments ?? input.possession}`,
        stillUsable: input.possession !== 'write_off_potential',
        reporterName: input.attestationName,
        userId: input.userId,
      })
      await supabase
        .from('aam_audit_reports')
        .update({ incident_id: incident.id, status: 'escalated' })
        .eq('id', data.id)
    }

    // Capital improvement flags → finance task only (never auto-add to cost)
    const capitalRepairs = (input.repairs ?? []).filter((r) => r.possibleCapitalImprovement)
    if (capitalRepairs.length) {
      await appendTimeline(accountId, input.assetId, {
        eventType: 'finance_change_requested',
        summary: 'Repair flagged as possible capital improvement — Finance review required',
        detail: JSON.stringify(capitalRepairs),
        auditId: input.auditId,
      })
    }
  }

  return data
}

export async function managerReviewReport(
  accountId: string,
  reportId: string,
  decision: 'confirmed' | 'clarification' | 'rejected' | 'discrepancy' | 'escalated',
  reason: string,
  managerUserId?: string,
) {
  const { data: report, error } = await supabase
    .from('aam_audit_reports')
    .update({
      manager_decision: decision,
      manager_reason: reason,
      manager_user_id: managerUserId ?? null,
      manager_decided_at: new Date().toISOString(),
      status:
        decision === 'confirmed'
          ? 'manager_approved'
          : decision === 'clarification'
            ? 'clarification'
            : decision === 'escalated'
              ? 'escalated'
              : 'rejected',
      updated_at: new Date().toISOString(),
    })
    .eq('id', reportId)
    .eq('account_id', accountId)
    .select('*')
    .single()
  if (error) throw error

  // Only after manager confirmation may condition / verification date update
  if (decision === 'confirmed') {
    await supabase
      .from('aam_assets')
      .update({
        condition_code: report.condition_code,
        last_verified_at: new Date().toISOString(),
        // NEVER overwrite accounting / tax / insured values from condition report
      })
      .eq('id', report.asset_id)
  }

  await appendTimeline(accountId, report.asset_id, {
    eventType: 'audit_manager_decision',
    summary: `Branch manager ${decision}: ${reason}`,
    auditId: report.audit_id,
    actorUserId: managerUserId,
  })

  return report
}

export async function completeAudit(accountId: string, auditId: string) {
  const { data: reports } = await supabase
    .from('aam_audit_reports')
    .select('*')
    .eq('audit_id', auditId)
    .eq('account_id', accountId)

  const { data: assignments } = await supabase
    .from('aam_audit_assignments')
    .select('*')
    .eq('audit_id', auditId)

  const summary = {
    totalAssigned: assignments?.length ?? 0,
    submitted: reports?.filter((r) => r.status !== 'draft').length ?? 0,
    approved: reports?.filter((r) => r.manager_decision === 'confirmed').length ?? 0,
    missing: reports?.filter((r) => r.possession === 'missing').length ?? 0,
    damaged: reports?.filter((r) => r.possession === 'damaged').length ?? 0,
    repairCostTotal: (reports ?? []).reduce((s, r) => {
      const repairs = (r.repairs ?? []) as { costZar?: string }[]
      return s + repairs.reduce((a, x) => a + Number(x.costZar ?? 0), 0)
    }, 0),
    incidents: reports?.filter((r) => r.incident_id).map((r) => r.incident_id) ?? [],
  }

  await supabase
    .from('aam_audits')
    .update({ status: 'completed', completed_at: new Date().toISOString() })
    .eq('id', auditId)

  return summary
}
