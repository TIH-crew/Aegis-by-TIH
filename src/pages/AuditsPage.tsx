import { useCallback, useEffect, useState } from 'react'
import { useAuth } from '../context/AuthContext'
import { EntityScopeBanner, EmptyState, PageHeader } from '../components/workspace/WorkspaceUi'
import {
  completeAudit,
  createAudit,
  launchAudit,
  listAudits,
  managerReviewReport,
  saveAuditReport,
} from '../services/asset-audit.service'
import { supabase } from '../lib/supabase'

export function AuditsPage() {
  const { accountId, user, homeAccountName } = useAuth()
  const [audits, setAudits] = useState<Awaited<ReturnType<typeof listAudits>>>([])
  const [name, setName] = useState('Q1 physical verification')
  const [launchInfo, setLaunchInfo] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [selectedAudit, setSelectedAudit] = useState<string | null>(null)
  const [reports, setReports] = useState<
    { id: string; status: string; possession: string | null; asset_id: string; manager_decision: string | null }[]
  >([])
  const [assignments, setAssignments] = useState<
    { id: string; asset_id: string; invite_status: string; assignee_email: string | null }[]
  >([])

  const refresh = useCallback(async () => {
    if (!accountId) return
    setAudits(await listAudits(accountId))
  }, [accountId])

  useEffect(() => {
    void refresh().catch((err) => setError(err instanceof Error ? err.message : 'Load failed'))
  }, [refresh])

  useEffect(() => {
    if (!accountId || !selectedAudit) return
    void Promise.all([
      supabase
        .from('aam_audit_reports')
        .select('id, status, possession, asset_id, manager_decision')
        .eq('audit_id', selectedAudit)
        .then((r) => setReports(r.data ?? [])),
      supabase
        .from('aam_audit_assignments')
        .select('id, asset_id, invite_status, assignee_email')
        .eq('audit_id', selectedAudit)
        .then((r) => setAssignments(r.data ?? [])),
    ])
  }, [accountId, selectedAudit, launchInfo])

  async function onCreate() {
    if (!accountId) return
    setBusy(true)
    try {
      const start = new Date()
      const submit = new Date(start.getTime() + 7 * 86400000)
      const review = new Date(start.getTime() + 14 * 86400000)
      const audit = await createAudit(accountId, {
        name,
        purpose: 'Scheduled physical verification',
        scope: {},
        startAt: start.toISOString(),
        submissionDeadline: submit.toISOString(),
        reviewDeadline: review.toISOString(),
        organiserUserId: user?.id,
        escalationEmail: user?.email ?? undefined,
      })
      setSelectedAudit(audit.id)
      await refresh()
      setError(null)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Create failed')
    } finally {
      setBusy(false)
    }
  }

  async function onLaunch(id: string) {
    if (!accountId) return
    setBusy(true)
    try {
      const res = await launchAudit(accountId, id)
      const providerNote = res.providerConfigured
        ? 'Invitations queued for configured email provider.'
        : 'Email not configured — invitations logged as skipped_no_provider (no real emails sent).'
      setLaunchInfo(
        `Launched ${res.assetCount} assets. ${res.invitations.length} grouped invitation(s). ${providerNote} Failures: ${res.deliveryFailures.length}.`,
      )
      setSelectedAudit(id)
      await refresh()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Launch failed')
    } finally {
      setBusy(false)
    }
  }

  async function demoEmployeeReports() {
    if (!accountId || !selectedAudit || assignments.length < 1) return
    setBusy(true)
    try {
      const a0 = assignments[0]!
      await saveAuditReport(accountId, {
        auditId: selectedAudit,
        assignmentId: a0.id,
        assetId: a0.asset_id,
        possession: 'have',
        conditionCode: 'good',
        locationConfirmed: 'Head office',
        barcodeConfirmed: 'scanned',
        repairsNone: true,
        attestationName: 'Demo Employee',
        userId: user?.id,
      })
      if (assignments[1]) {
        await saveAuditReport(accountId, {
          auditId: selectedAudit,
          assignmentId: assignments[1].id,
          assetId: assignments[1].asset_id,
          possession: 'have',
          conditionCode: 'fair',
          repairsNone: false,
          repairs: [
            {
              date: new Date().toISOString().slice(0, 10),
              description: 'Screen replacement',
              supplier: 'TechFix',
              costZar: '2500',
              possibleCapitalImprovement: false,
            },
          ],
          attestationName: 'Demo Employee',
          userId: user?.id,
        })
      }
      if (assignments[2]) {
        await saveAuditReport(accountId, {
          auditId: selectedAudit,
          assignmentId: assignments[2].id,
          assetId: assignments[2].asset_id,
          possession: 'damaged',
          conditionCode: 'damaged',
          comments: 'Accident damage — escalate',
          repairsNone: true,
          attestationName: 'Demo Employee',
          userId: user?.id,
        })
      }
      setLaunchInfo('Demo employee reports submitted (good / repaired / damaged). Damaged opens linked incident.')
      const { data } = await supabase
        .from('aam_audit_reports')
        .select('id, status, possession, asset_id, manager_decision')
        .eq('audit_id', selectedAudit)
      setReports(data ?? [])
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Report failed')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="space-y-4">
      <PageHeader
        title="Physical audits"
        description="Schedule verification by legal entity / branch / class. One invitation email per assignee. Condition updates only after manager review — never overwrites book, tax or insured values."
      />
      <EntityScopeBanner entityName={homeAccountName ?? 'Legal entity'} scopeLabel="Legal entity" />
      {error && <p className="text-sm text-red-700">{error}</p>}
      {launchInfo && <p className="ws-panel bg-slate-50 px-3 py-2 text-sm">{launchInfo}</p>}

      <section className="ws-panel flex flex-wrap items-end gap-2 p-4">
        <label className="block text-xs text-muted">
          Audit name
          <input
            className="mt-1 w-64 rounded border border-border px-2 py-1.5 text-sm"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </label>
        <button type="button" disabled={busy} className="ws-btn-primary text-sm" onClick={() => void onCreate()}>
          Schedule audit
        </button>
      </section>

      {audits.length === 0 ? (
        <EmptyState title="No audits yet" description="Create a draft, then launch to snapshot assignees and queue invitations." />
      ) : (
        <div className="ws-panel overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead>
              <tr className="border-b text-[11px] uppercase text-muted">
                <th className="px-3 py-2">Name</th>
                <th className="px-3 py-2">Status</th>
                <th className="px-3 py-2">Deadline</th>
                <th className="px-3 py-2" />
              </tr>
            </thead>
            <tbody>
              {audits.map((a) => (
                <tr key={a.id} className="border-b border-border/40">
                  <td className="px-3 py-2 font-medium">{a.name}</td>
                  <td className="px-3 py-2">{a.status}</td>
                  <td className="px-3 py-2 text-xs">
                    {a.submission_deadline
                      ? new Date(a.submission_deadline).toLocaleString('en-ZA', { timeZone: 'Africa/Johannesburg' })
                      : '—'}
                  </td>
                  <td className="px-3 py-2 text-right space-x-1">
                    <button type="button" className="text-xs underline" onClick={() => setSelectedAudit(a.id)}>
                      Open
                    </button>
                    {a.status === 'draft' || a.status === 'scheduled' ? (
                      <button
                        type="button"
                        disabled={busy}
                        className="ws-btn-secondary text-xs"
                        onClick={() => void onLaunch(a.id)}
                      >
                        Launch
                      </button>
                    ) : null}
                    {a.status === 'launched' || a.status === 'in_progress' || a.status === 'under_review' ? (
                      <button
                        type="button"
                        disabled={busy}
                        className="ws-btn-secondary text-xs"
                        onClick={() =>
                          void completeAudit(accountId!, a.id).then((s) =>
                            setLaunchInfo(
                              `Audit complete — assigned ${s.totalAssigned}, submitted ${s.submitted}, approved ${s.approved}, missing ${s.missing}, damaged ${s.damaged}, repair ZAR ${s.repairCostTotal}, incidents ${s.incidents.length}.`,
                            ),
                          )
                        }
                      >
                        Complete
                      </button>
                    ) : null}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {selectedAudit && (
        <section className="space-y-3">
          <div className="flex flex-wrap gap-2">
            <button type="button" disabled={busy} className="ws-btn-secondary text-sm" onClick={() => void demoEmployeeReports()}>
              Demo: submit employee reports (good / repair / damaged)
            </button>
          </div>
          <div className="grid gap-3 lg:grid-cols-2">
            <div className="ws-panel p-3 text-sm">
              <h3 className="mb-2 font-semibold">Invitations</h3>
              <ul className="space-y-1 text-xs">
                {assignments.map((a) => (
                  <li key={a.id}>
                    {a.assignee_email ?? 'No email'} — {a.invite_status}
                  </li>
                ))}
                {assignments.length === 0 && <li className="text-muted">No assignments (launch first, or no custodians).</li>}
              </ul>
            </div>
            <div className="ws-panel p-3 text-sm">
              <h3 className="mb-2 font-semibold">Branch manager review</h3>
              <ul className="space-y-2">
                {reports.map((r) => (
                  <li key={r.id} className="flex flex-wrap items-center justify-between gap-2 border-b border-border/40 pb-2">
                    <span>
                      {r.possession ?? '—'} · {r.status}
                      {r.manager_decision ? ` · mgr: ${r.manager_decision}` : ''}
                    </span>
                    <span className="flex gap-1">
                      <button
                        type="button"
                        className="text-xs underline"
                        onClick={() =>
                          void managerReviewReport(accountId!, r.id, 'confirmed', 'Matches register', user?.id)
                        }
                      >
                        Approve
                      </button>
                      <button
                        type="button"
                        className="text-xs underline"
                        onClick={() =>
                          void managerReviewReport(
                            accountId!,
                            r.id,
                            'clarification',
                            'Please re-check location photo',
                            user?.id,
                          )
                        }
                      >
                        Clarify
                      </button>
                    </span>
                  </li>
                ))}
                {reports.length === 0 && <li className="text-muted text-xs">No reports yet.</li>}
              </ul>
            </div>
          </div>
        </section>
      )}
    </div>
  )
}
