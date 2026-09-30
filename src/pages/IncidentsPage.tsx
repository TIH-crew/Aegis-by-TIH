import { useCallback, useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { EntityScopeBanner, EmptyState, PageHeader } from '../components/workspace/WorkspaceUi'
import {
  approveFinanceOutcome,
  getIncident,
  listIncidents,
  receiveReplacementAsset,
  startReplacement,
  updateIncidentInsurance,
} from '../services/asset-lifecycle.service'
import { cn } from '../lib/utils'

export function IncidentsPage() {
  const { accountId, homeAccountName } = useAuth()
  const [rows, setRows] = useState<Awaited<ReturnType<typeof listIncidents>>>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const refresh = useCallback(async () => {
    if (!accountId) return
    setLoading(true)
    try {
      setRows(await listIncidents(accountId))
      setError(null)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load incidents')
    } finally {
      setLoading(false)
    }
  }, [accountId])

  useEffect(() => {
    void refresh()
  }, [refresh])

  return (
    <div className="space-y-4">
      <PageHeader
        title="Incidents & write-offs"
        description="Cases opened from damage, loss or write-off flags. Insurance total-loss does not remove the asset from the register until Finance approves."
      />
      <EntityScopeBanner entityName={homeAccountName ?? 'Legal entity'} scopeLabel="Legal entity" />
      {error && <p className="text-sm text-red-700">{error}</p>}
      {loading ? (
        <p className="text-sm text-muted">Loading…</p>
      ) : rows.length === 0 ? (
        <EmptyState title="No open cases" description="Flag an asset from the register or asset detail to start a case." />
      ) : (
        <div className="ws-panel overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead>
              <tr className="border-b text-[11px] uppercase text-muted">
                <th className="px-3 py-2">Case</th>
                <th className="px-3 py-2">Asset</th>
                <th className="px-3 py-2">Type</th>
                <th className="px-3 py-2">Status</th>
                <th className="px-3 py-2">Insurance</th>
                <th className="px-3 py-2">Finance</th>
                <th className="px-3 py-2">Tax</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => {
                const asset = r.aam_assets as { asset_tag?: string; description?: string } | null
                return (
                  <tr key={r.id} className="border-b border-border/40">
                    <td className="px-3 py-2">
                      <Link className="font-medium underline-offset-2 hover:underline" to={`/assets/incidents/${r.id}`}>
                        {r.incident_number}
                      </Link>
                    </td>
                    <td className="px-3 py-2">
                      {asset?.asset_tag}
                      <span className="block text-xs text-muted">{asset?.description}</span>
                    </td>
                    <td className="px-3 py-2">{r.incident_type}</td>
                    <td className="px-3 py-2">{String(r.status).replace(/_/g, ' ')}</td>
                    <td className="px-3 py-2">{String(r.insurance_status).replace(/_/g, ' ')}</td>
                    <td className="px-3 py-2">{String(r.finance_status).replace(/_/g, ' ')}</td>
                    <td className="px-3 py-2">{String(r.tax_status).replace(/_/g, ' ')}</td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}

export function IncidentDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { accountId, user, homeAccountName } = useAuth()
  const [pack, setPack] = useState<Awaited<ReturnType<typeof getIncident>> | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [claimNo, setClaimNo] = useState('')
  const [spec, setSpec] = useState('')
  const [newTag, setNewTag] = useState('')

  const refresh = useCallback(async () => {
    if (!accountId || !id) return
    try {
      const data = await getIncident(accountId, id)
      setPack(data)
      setClaimNo(data.incident.claim_number ?? '')
      setError(null)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load case')
    }
  }, [accountId, id])

  useEffect(() => {
    void refresh()
  }, [refresh])

  if (!pack) {
    return <p className="text-sm text-muted">{error ?? 'Loading case…'}</p>
  }

  const { incident, tasks, checklist, replacements } = pack
  const asset = incident.aam_assets as { id: string; asset_tag: string; description: string }

  async function run<T>(fn: () => Promise<T>) {
    setBusy(true)
    try {
      await fn()
      await refresh()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Action failed')
    } finally {
      setBusy(false)
    }
  }

  const nextStep = checklist.find((c) => c.status === 'in_progress' || c.status === 'pending')

  return (
    <div className="space-y-4">
      <PageHeader
        title={incident.incident_number}
        description={`${incident.incident_type} · ${asset.asset_tag} — ${asset.description}`}
        actions={
          <Link to={`/assets/ledger/${asset.id}`} className="ws-btn-secondary text-sm">
            Open asset
          </Link>
        }
      />
      <EntityScopeBanner entityName={homeAccountName ?? 'Legal entity'} scopeLabel="Legal entity" />
      {error && <p className="text-sm text-red-700">{error}</p>}

      {nextStep && (
        <div className="ws-panel border-amber-200 bg-amber-50/40 px-4 py-3 text-sm">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-amber-900">Who acts next</p>
          <p className="font-medium text-ink">
            Step {nextStep.step_no}: {nextStep.label}
          </p>
          <p className="text-xs text-muted">{nextStep.owner_label ?? 'Owner not assigned yet'}</p>
        </div>
      )}

      {/* Guided checklist */}
      <section className="ws-panel p-4">
        <h2 className="mb-3 text-sm font-semibold">Case checklist</h2>
        <ol className="space-y-2">
          {checklist.map((s) => (
            <li key={s.id} className="flex gap-3 text-sm">
              <span
                className={cn(
                  'mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full text-[10px] font-bold',
                  s.status === 'done'
                    ? 'bg-emerald-100 text-emerald-800'
                    : s.status === 'in_progress'
                      ? 'bg-amber-100 text-amber-900'
                      : 'bg-slate-100 text-slate-500',
                )}
              >
                {s.step_no}
              </span>
              <div>
                <p className={s.status === 'done' ? 'text-muted line-through' : 'text-ink'}>{s.label}</p>
                <p className="text-[11px] text-muted">{s.status.replace(/_/g, ' ')}</p>
              </div>
            </li>
          ))}
        </ol>
      </section>

      <div className="grid gap-4 lg:grid-cols-3">
        {/* Insurance */}
        <section className="ws-panel space-y-2 p-4">
          <h3 className="text-sm font-semibold">Insurance</h3>
          <p className="text-xs text-muted">Status: {String(incident.insurance_status).replace(/_/g, ' ')}</p>
          {incident.insurance_status === 'review_required' && (
            <p className="rounded bg-amber-50 px-2 py-1 text-xs text-amber-900">Insurance review required — no matching cover</p>
          )}
          <label className="block text-xs text-muted">
            Claim number
            <input
              className="mt-1 w-full rounded border border-border px-2 py-1 text-sm"
              value={claimNo}
              onChange={(e) => setClaimNo(e.target.value)}
            />
          </label>
          <div className="flex flex-wrap gap-1">
            <button
              type="button"
              disabled={busy}
              className="ws-btn-secondary text-xs"
              onClick={() =>
                void run(() =>
                  updateIncidentInsurance(
                    accountId!,
                    incident.id,
                    { insuranceStatus: 'submitted', claimNumber: claimNo },
                    { userId: user?.id, label: 'Broker' },
                  ),
                )
              }
            >
              Submit claim
            </button>
            <button
              type="button"
              disabled={busy}
              className="ws-btn-secondary text-xs"
              onClick={() =>
                void run(() =>
                  updateIncidentInsurance(
                    accountId!,
                    incident.id,
                    {
                      insuranceStatus: 'total_loss_accepted',
                      coverageDecision: 'total_loss',
                      claimNumber: claimNo,
                    },
                    { userId: user?.id, label: 'Insurer' },
                  ),
                )
              }
            >
              Record total loss
            </button>
            <button
              type="button"
              disabled={busy}
              className="ws-btn-secondary text-xs"
              onClick={() =>
                void run(() =>
                  updateIncidentInsurance(
                    accountId!,
                    incident.id,
                    { insuranceStatus: 'declined', coverageDecision: 'declined' },
                    { userId: user?.id, label: 'Insurer' },
                  ),
                )
              }
            >
              Declined
            </button>
            <button
              type="button"
              disabled={busy}
              className="ws-btn-secondary text-xs"
              onClick={() =>
                void run(() =>
                  updateIncidentInsurance(
                    accountId!,
                    incident.id,
                    { insuranceStatus: 'repair_authorised', coverageDecision: 'repair' },
                    { userId: user?.id, label: 'Insurer' },
                  ),
                )
              }
            >
              Repair authorised
            </button>
          </div>
          <p className="text-[11px] text-muted">
            Insurer total loss is not automatic authority to remove the asset from the accounting register.
          </p>
        </section>

        {/* Finance */}
        <section className="ws-panel space-y-2 p-4">
          <h3 className="text-sm font-semibold">Finance</h3>
          <p className="text-xs text-muted">Status: {String(incident.finance_status).replace(/_/g, ' ')}</p>
          <p className="text-[11px] text-muted">
            Stop depreciation / derecognise only after approved accounting event — not when first flagged.
          </p>
          <div className="flex flex-wrap gap-1">
            <button
              type="button"
              disabled={busy}
              className="ws-btn-primary text-xs"
              onClick={() =>
                void run(() =>
                  approveFinanceOutcome(accountId!, incident.id, 'full_write_off', {
                    userId: user?.id,
                    label: 'Finance',
                    stopDepreciation: true,
                  }),
                )
              }
            >
              Approve full write-off
            </button>
            <button
              type="button"
              disabled={busy}
              className="ws-btn-secondary text-xs"
              onClick={() =>
                void run(() =>
                  approveFinanceOutcome(accountId!, incident.id, 'repair', {
                    userId: user?.id,
                    label: 'Finance',
                    stopDepreciation: false,
                  }),
                )
              }
            >
              Approve repair
            </button>
          </div>
        </section>

        {/* Tax */}
        <section className="ws-panel space-y-2 p-4">
          <h3 className="text-sm font-semibold">Tax</h3>
          <p className="text-xs text-muted">Status: {String(incident.tax_status).replace(/_/g, ' ')} (provisional)</p>
          <p className="text-[11px] text-muted">
            Does not auto-approve from insurer claim status. Reviewer must confirm recoupment, CGT, VAT and replacement treatment.
          </p>
          <span className="ws-status bg-amber-50 text-amber-900 ring-amber-200/80">Awaiting Tax reviewer</span>
        </section>
      </div>

      {/* Team tasks */}
      <section className="ws-panel p-4">
        <h3 className="mb-2 text-sm font-semibold">Linked team tasks (same incident + asset)</h3>
        <ul className="space-y-1 text-sm">
          {tasks.map((t) => (
            <li key={t.id} className="flex flex-wrap justify-between gap-2 border-b border-border/40 py-1.5 last:border-0">
              <span>
                <span className="font-medium uppercase text-[10px] text-muted">{t.team}</span> {t.title}
              </span>
              <span className="text-xs text-muted">{t.status}</span>
            </li>
          ))}
        </ul>
      </section>

      {/* Replacement */}
      <section className="ws-panel space-y-3 p-4">
        <h3 className="text-sm font-semibold">Replacement</h3>
        <p className="text-xs text-muted">
          Creates a new asset with its own tag. Works even if uninsured or claim declined. Temporary hire tracked separately.
        </p>
        {replacements.length === 0 ? (
          <div className="flex flex-wrap items-end gap-2">
            <label className="block text-xs text-muted">
              Proposed specification
              <input
                className="mt-1 w-64 rounded border border-border px-2 py-1 text-sm"
                value={spec}
                onChange={(e) => setSpec(e.target.value)}
              />
            </label>
            <button
              type="button"
              disabled={busy}
              className="ws-btn-primary text-sm"
              onClick={() =>
                void run(() =>
                  startReplacement(accountId!, incident.id, {
                    specification: spec,
                    insurerAction: incident.insurance_status === 'declined' ? 'decline' : 'unknown',
                    userId: user?.id,
                  }),
                )
              }
            >
              Start replacement
            </button>
          </div>
        ) : (
          replacements.map((r) => (
            <div key={r.id} className="rounded border border-border/60 p-3 text-sm">
              <p>
                Request {r.status} · insurer action: {r.insurer_action ?? 'unknown'}
                {r.is_temporary_hire ? ' · temporary hire' : ''}
              </p>
              {r.new_asset_id ? (
                <Link className="text-xs underline" to={`/assets/ledger/${r.new_asset_id}`}>
                  Open new asset
                </Link>
              ) : (
                <div className="mt-2 flex flex-wrap items-end gap-2">
                  <label className="block text-xs text-muted">
                    New asset tag
                    <input
                      className="mt-1 w-40 rounded border border-border px-2 py-1 text-sm"
                      value={newTag}
                      onChange={(e) => setNewTag(e.target.value)}
                    />
                  </label>
                  <button
                    type="button"
                    disabled={busy || !newTag}
                    className="ws-btn-primary text-xs"
                    onClick={() =>
                      void run(() =>
                        receiveReplacementAsset(
                          accountId!,
                          r.id,
                          {
                            assetTag: newTag,
                            description: `Replacement for ${asset.asset_tag}`,
                            assetClass: 'Motor',
                            capitalisedCost: '0',
                            availableForUseDate: new Date().toISOString().slice(0, 10),
                          },
                          user?.id,
                        ),
                      )
                    }
                  >
                    Receive as new asset
                  </button>
                </div>
              )}
            </div>
          ))
        )}
      </section>
    </div>
  )
}
