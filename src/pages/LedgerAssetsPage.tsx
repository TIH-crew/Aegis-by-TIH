import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AlertTriangle, Upload } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useOrganization } from '../context/OrganizationContext'
import { EntityScopeBanner, EmptyState, PageHeader } from '../components/workspace/WorkspaceUi'
import { listLedgerAssets, reportIncident } from '../services/asset-lifecycle.service'
import { cn } from '../lib/utils'

type Row = {
  id: string
  asset_tag: string
  description: string
  asset_class: string
  status: string
  processing_status?: string
  barcode?: string | null
  capitalised_cost?: string | null
  aam_incidents?: { id: string; status: string; incident_number: string }[]
}

export function LedgerAssetsPage() {
  const { accountId, homeAccountName, subsidiaries, homeAccountId, user } = useAuth()
  const { organization } = useOrganization()
  const [rows, setRows] = useState<Row[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [flagId, setFlagId] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

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
      const data = await listLedgerAssets(accountId)
      setRows(data as Row[])
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load register')
      setRows([])
    } finally {
      setLoading(false)
    }
  }, [accountId])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const openFlags = useMemo(
    () => rows.filter((r) => (r.aam_incidents ?? []).some((i) => i.status !== 'completed' && i.status !== 'cancelled')),
    [rows],
  )

  async function flagWriteOff(assetId: string) {
    if (!accountId) return
    setBusy(true)
    try {
      await reportIncident(accountId, {
        assetId,
        incidentType: 'damage',
        incidentDate: new Date().toISOString().slice(0, 10),
        description: 'Flagged from asset register for write-off / damage review',
        reporterName: user?.email ?? 'Asset manager',
        userId: user?.id,
        stillUsable: true,
      })
      setFlagId(null)
      await refresh()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not flag asset')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="space-y-4">
      <PageHeader
        title="Asset register"
        description="Complete ledger records with processing status, documents and values. Flagging write-off opens a case — it does not dispose the asset."
        actions={
          <div className="flex flex-wrap gap-2">
            <Link to="/assets/import" className="ws-btn-secondary inline-flex items-center gap-1.5 text-sm">
              <Upload className="h-3.5 w-3.5" />
              Bulk import
            </Link>
            <Link to="/assets/incidents" className="ws-btn-secondary text-sm">
              Incidents & write-offs ({openFlags.length})
            </Link>
            <Link to="/assets/audits" className="ws-btn-secondary text-sm">
              Physical audits
            </Link>
          </div>
        }
      />
      <EntityScopeBanner entityName={name} scopeLabel="Legal entity" />

      {error && <p className="text-sm text-red-700">{error}</p>}
      {loading ? (
        <p className="text-sm text-muted">Loading register…</p>
      ) : rows.length === 0 ? (
        <EmptyState
          title="No ledger assets yet"
          description="Import a CSV/XLSX or capitalise from Finance. Insurance-only risk items stay on the Insurance schedule."
          action={
            <Link to="/assets/import" className="ws-btn-primary text-sm">
              Start bulk import
            </Link>
          }
        />
      ) : (
        <div className="ws-panel overflow-x-auto">
          <table className="w-full min-w-[720px] text-left text-sm">
            <thead>
              <tr className="border-b border-border/70 text-[11px] uppercase tracking-wide text-muted">
                <th className="px-3 py-2 font-semibold">Tag</th>
                <th className="px-3 py-2 font-semibold">Description</th>
                <th className="px-3 py-2 font-semibold">Class</th>
                <th className="px-3 py-2 font-semibold">Processing</th>
                <th className="px-3 py-2 font-semibold">Barcode</th>
                <th className="px-3 py-2 font-semibold">Open case</th>
                <th className="px-3 py-2 font-semibold" />
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => {
                const open = (r.aam_incidents ?? []).find(
                  (i) => i.status !== 'completed' && i.status !== 'cancelled',
                )
                return (
                  <tr key={r.id} className="border-b border-border/40 last:border-0">
                    <td className="px-3 py-2 font-medium">
                      <Link to={`/assets/ledger/${r.id}`} className="text-ink underline-offset-2 hover:underline">
                        {r.asset_tag}
                      </Link>
                    </td>
                    <td className="px-3 py-2 text-muted">{r.description}</td>
                    <td className="px-3 py-2">{r.asset_class}</td>
                    <td className="px-3 py-2">
                      <span
                        className={cn(
                          'ws-status',
                          r.processing_status === 'incomplete' || r.processing_status === 'under_review'
                            ? 'bg-amber-50 text-amber-900 ring-amber-200/80'
                            : 'bg-emerald-50 text-emerald-900 ring-emerald-200/80',
                        )}
                      >
                        {r.processing_status === 'incomplete'
                          ? 'Incomplete — action required'
                          : (r.processing_status ?? r.status).replace(/_/g, ' ')}
                      </span>
                    </td>
                    <td className="px-3 py-2 font-mono text-xs">{r.barcode ?? '—'}</td>
                    <td className="px-3 py-2">
                      {open ? (
                        <Link to={`/assets/incidents/${open.id}`} className="text-xs text-ink underline">
                          {open.incident_number}
                        </Link>
                      ) : (
                        '—'
                      )}
                    </td>
                    <td className="px-3 py-2 text-right">
                      {flagId === r.id ? (
                        <div className="flex justify-end gap-1">
                          <button
                            type="button"
                            disabled={busy}
                            className="ws-btn-primary text-xs"
                            onClick={() => void flagWriteOff(r.id)}
                          >
                            Confirm
                          </button>
                          <button type="button" className="ws-btn-secondary text-xs" onClick={() => setFlagId(null)}>
                            Cancel
                          </button>
                        </div>
                      ) : (
                        <button
                          type="button"
                          className="inline-flex items-center gap-1 text-xs text-amber-800 hover:underline"
                          onClick={() => setFlagId(r.id)}
                        >
                          <AlertTriangle className="h-3 w-3" />
                          Flag for write-off
                        </button>
                      )}
                    </td>
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
