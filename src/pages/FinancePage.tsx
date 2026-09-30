import { useCallback, useEffect, useMemo, useState } from 'react'
import { useAuth } from '../context/AuthContext'
import { useOrganization } from '../context/OrganizationContext'
import {
  EntityScopeBanner,
  IntegrationState,
  PageHeader,
} from '../components/workspace/WorkspaceUi'
import {
  listAssets,
  runDraftDepreciation,
  runSubledgerGlRecon,
} from '../services/asset-ledger.service'
import { supabase } from '../lib/supabase'
import type { AamAsset } from '../types/asset-ledger'
import { formatCurrency } from '../lib/utils'

function currentPeriodKey(d = new Date()) {
  return `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
}

export function FinancePage() {
  const { accountId, homeAccountName, subsidiaries, homeAccountId, user } = useAuth()
  const { organization } = useOrganization()
  const [assets, setAssets] = useState<AamAsset[]>([])
  const [mappings, setMappings] = useState<
    { asset_class: string; gl_asset_account: string | null; gl_accum_dep_account: string | null; gl_dep_expense_account: string | null; status: string }[]
  >([])
  const [periodKey, setPeriodKey] = useState(currentPeriodKey())
  const [runLog, setRunLog] = useState<string | null>(null)
  const [journals, setJournals] = useState<{ accountCode: string; debit: string; credit: string; narrative: string }[]>([])
  const [exceptions, setExceptions] = useState<
    { account: string; registerAmount: string; glAmount: string; difference: string; withinTolerance: boolean }[]
  >([])
  const [closeStatus, setCloseStatus] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const isSub = Boolean(homeAccountId && accountId && accountId !== homeAccountId)
  const name =
    (isSub ? subsidiaries.find((s) => s.id === accountId)?.name : null) ??
    organization?.name ??
    homeAccountName ??
    'Legal entity'

  const refresh = useCallback(async () => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    try {
      const [assetRows, mapRows, closeRow] = await Promise.all([
        listAssets(accountId),
        supabase.from('aam_gl_mappings').select('*').eq('account_id', accountId).then((r) => r.data ?? []),
        supabase
          .from('aam_close_periods')
          .select('status')
          .eq('account_id', accountId)
          .eq('period_key', periodKey)
          .maybeSingle()
          .then((r) => r.data?.status ?? null),
      ])
      setAssets(assetRows)
      setMappings(mapRows)
      setCloseStatus(closeRow)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load finance workspace')
      setAssets([])
      setMappings([])
    } finally {
      setLoading(false)
    }
  }, [accountId, periodKey])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const capitalised = useMemo(
    () => assets.filter((a) => a.capitalised_cost != null && a.ownership_type !== 'insurance_only'),
    [assets],
  )

  const acquisitionTotal = useMemo(() => {
    return capitalised.reduce((sum, a) => sum + Number(a.capitalised_cost ?? 0), 0)
  }, [capitalised])

  async function handleDepreciationRun() {
    if (!accountId) return
    setRunLog('Running draft depreciation…')
    try {
      const result = await runDraftDepreciation(accountId, periodKey)
      setJournals(result.journals.map((j) => ({
        accountCode: j.accountCode,
        debit: j.debit,
        credit: j.credit,
        narrative: j.narrative,
      })))
      setRunLog(
        `Draft run complete: ${result.lines} schedule line(s). ${result.errors.length ? `Issues: ${result.errors.join('; ')}` : 'No errors.'}`,
      )
    } catch (err) {
      setRunLog(err instanceof Error ? err.message : 'Depreciation run failed')
    }
  }

  async function handleRecon() {
    if (!accountId) return
    setRunLog('Running subledger ↔ GL reconciliation…')
    try {
      const result = await runSubledgerGlRecon(accountId, periodKey)
      setExceptions(
        result.exceptions.map((e) => ({
          account: e.account,
          registerAmount: e.registerAmount.amount.toFixed(4),
          glAmount: e.glAmount.amount.toFixed(4),
          difference: e.difference.amount.toFixed(4),
          withinTolerance: e.withinTolerance,
        })),
      )
      setRunLog(`Reconciliation ${result.reconciliationId}: ${result.exceptions.filter((e) => !e.withinTolerance).length} exception(s) outside tolerance.`)
    } catch (err) {
      setRunLog(err instanceof Error ? err.message : 'Reconciliation failed — apply migration / map GL accounts first')
    }
  }

  return (
    <div className="space-y-5">
      <PageHeader
        title="Finance"
        description="Period close, depreciation runs, journal preview, GL mapping and reconciliation. Figures only appear from approved capitalisations and schedule runs — never from insured values."
        actions={
          <label className="flex items-center gap-2 text-sm">
            <span className="text-muted">Period</span>
            <input
              className="field-input w-36"
              value={periodKey}
              onChange={(e) => setPeriodKey(e.target.value)}
              aria-label="Financial period YYYY-MM"
              placeholder="YYYY-MM"
            />
          </label>
        }
      />

      <EntityScopeBanner
        entityName={name}
        scopeLabel={isSub ? 'Subsidiary' : 'Legal entity'}
        note={`Close status: ${closeStatus ?? 'Not opened'} · Signed in as ${user?.email ?? 'user'}`}
      />

      {loading && <p className="text-sm text-muted">Loading finance workspace…</p>}
      {error && (
        <p className="rounded-md border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-950">
          {error.includes('does not exist') || error.includes('schema cache')
            ? 'Fixed-asset tables are not on this database yet. Apply supabase/migrations/20260929_fixed_asset_accounting.sql, then refresh.'
            : error}
        </p>
      )}

      <div className="grid grid-cols-2 gap-3 md:grid-cols-4">
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Capitalised assets</p>
          <p className="mt-1 text-lg font-semibold tabular-nums">{capitalised.length}</p>
        </div>
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Acquisition cost (register)</p>
          <p className="mt-1 text-lg font-semibold tabular-nums">
            {capitalised.length ? formatCurrency(acquisitionTotal) : '—'}
          </p>
          <p className="text-[11px] text-muted">From aam_assets.capitalised_cost only</p>
        </div>
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Net book value</p>
          <p className="mt-1 text-lg font-semibold text-muted">
            {journals.length || capitalised.length ? 'Run depreciation' : 'Awaiting source data'}
          </p>
        </div>
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">GL mappings</p>
          <p className="mt-1 text-lg font-semibold tabular-nums">
            {mappings.filter((m) => m.status === 'mapped').length}/{Math.max(mappings.length, 4)}
          </p>
        </div>
      </div>

      <div className="flex flex-wrap gap-2">
        <button
          type="button"
          onClick={() => void handleDepreciationRun()}
          className="rounded-md bg-primary px-3.5 py-2 text-sm font-medium text-white hover:bg-burgundy-dark"
        >
          Run draft depreciation
        </button>
        <button
          type="button"
          onClick={() => void handleRecon()}
          className="rounded-md border border-border bg-surface px-3.5 py-2 text-sm font-medium hover:bg-page"
        >
          Reconcile subledger ↔ GL
        </button>
      </div>
      {runLog && <p className="text-sm text-muted">{runLog}</p>}

      {journals.length > 0 && (
        <section className="ws-panel overflow-hidden">
          <div className="border-b border-border px-4 py-3">
            <h2 className="text-sm font-semibold">Journal preview (draft)</h2>
            <p className="text-xs text-muted">Not posted — requires Finance Approver before lock.</p>
          </div>
          <div className="overflow-x-auto">
            <table className="ws-table">
              <thead>
                <tr>
                  <th>Account</th>
                  <th className="text-right">Debit</th>
                  <th className="text-right">Credit</th>
                  <th>Narrative</th>
                </tr>
              </thead>
              <tbody>
                {journals.map((j, i) => (
                  <tr key={`${j.accountCode}-${i}`}>
                    <td className="font-mono text-xs">{j.accountCode}</td>
                    <td className="text-right tabular-nums">{j.debit}</td>
                    <td className="text-right tabular-nums">{j.credit}</td>
                    <td>{j.narrative}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>
      )}

      {exceptions.length > 0 && (
        <section className="ws-panel overflow-hidden">
          <div className="border-b border-border px-4 py-3">
            <h2 className="text-sm font-semibold">Reconciliation exceptions</h2>
          </div>
          <table className="ws-table">
            <thead>
              <tr>
                <th>Account role</th>
                <th className="text-right">Register</th>
                <th className="text-right">GL</th>
                <th className="text-right">Difference</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {exceptions.map((e) => (
                <tr key={e.account}>
                  <td>{e.account}</td>
                  <td className="text-right tabular-nums">{e.registerAmount}</td>
                  <td className="text-right tabular-nums">{e.glAmount}</td>
                  <td className="text-right tabular-nums">{e.difference}</td>
                  <td>
                    {e.withinTolerance ? (
                      <span className="ws-status bg-emerald-50 text-emerald-800 ring-1 ring-emerald-200/70">OK</span>
                    ) : (
                      <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">Open</span>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </section>
      )}

      <section className="ws-panel overflow-hidden">
        <div className="border-b border-border px-4 py-3">
          <h2 className="text-sm font-semibold text-ink">GL account mapping by asset class</h2>
          <p className="text-xs text-muted">
            Configure via <code className="rounded bg-page px-1">aam_gl_mappings</code>. Status stays awaiting until mapped.
          </p>
        </div>
        <div className="overflow-x-auto">
          <table className="ws-table">
            <thead>
              <tr>
                <th>Asset class</th>
                <th>Asset account</th>
                <th>Accum. depreciation</th>
                <th>Depreciation expense</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {(mappings.length
                ? mappings
                : [
                    { asset_class: 'Motor', gl_asset_account: null, gl_accum_dep_account: null, gl_dep_expense_account: null, status: 'not_connected' },
                    { asset_class: 'Plant & Machinery', gl_asset_account: null, gl_accum_dep_account: null, gl_dep_expense_account: null, status: 'not_connected' },
                  ]
              ).map((row) => (
                <tr key={row.asset_class}>
                  <td className="font-medium">{row.asset_class}</td>
                  <td className="font-mono text-xs">{row.gl_asset_account ?? '—'}</td>
                  <td className="font-mono text-xs">{row.gl_accum_dep_account ?? '—'}</td>
                  <td className="font-mono text-xs">{row.gl_dep_expense_account ?? '—'}</td>
                  <td>
                    <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">
                      {row.status.replace(/_/g, ' ')}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      {!capitalised.length && !loading && !error && (
        <IntegrationState
          title="No capitalised assets yet"
          description="Use the acquisition → approval → capitalisation vertical slice (asset-ledger.service) to create book assets. Insurance risk items are not auto-capitalised."
          status="awaiting_mapping"
        />
      )}

      <p className="text-xs text-muted">
        Schema: <code className="rounded bg-page px-1">docs/asset-accounting.md</code> · Migration{' '}
        <code className="rounded bg-page px-1">20260929_fixed_asset_accounting.sql</code>
      </p>
    </div>
  )
}
