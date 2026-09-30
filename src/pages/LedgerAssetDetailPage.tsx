import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { AlertTriangle, Printer } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useOrganization } from '../context/OrganizationContext'
import {
  EntityScopeBanner,
  MetricTile,
  PageHeader,
} from '../components/workspace/WorkspaceUi'
import {
  ensureBarcode,
  getAssetCompleteRecord,
  reportIncident,
  updateAssetFields,
} from '../services/asset-lifecycle.service'
import { cn } from '../lib/utils'

type Tab = 'overview' | 'documents' | 'timeline' | 'values'

export function LedgerAssetDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { accountId, user, homeAccountName } = useAuth()
  const { organization } = useOrganization()
  const [tab, setTab] = useState<Tab>('overview')
  const [record, setRecord] = useState<Awaited<ReturnType<typeof getAssetCompleteRecord>> | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [editDesc, setEditDesc] = useState('')
  const [editLoc, setEditLoc] = useState('')
  const [saving, setSaving] = useState(false)
  const [timelineFilter, setTimelineFilter] = useState('all')

  const refresh = useCallback(async () => {
    if (!accountId || !id) return
    setLoading(true)
    setError(null)
    try {
      const data = await getAssetCompleteRecord(accountId, id)
      setRecord(data)
      setEditDesc(data.asset.description)
      setEditLoc(data.asset.location_text ?? '')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load asset')
      setRecord(null)
    } finally {
      setLoading(false)
    }
  }, [accountId, id])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const timeline = useMemo(() => {
    if (!record) return []
    if (timelineFilter === 'all') return record.timeline
    return record.timeline.filter((e) => e.event_type === timelineFilter)
  }, [record, timelineFilter])

  async function saveEdits() {
    if (!accountId || !id) return
    setSaving(true)
    try {
      await updateAssetFields(
        accountId,
        id,
        { description: editDesc, location_text: editLoc },
        { userId: user?.id, reason: 'Asset details updated by manager' },
      )
      await refresh()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed')
    } finally {
      setSaving(false)
    }
  }

  async function onFlag() {
    if (!accountId || !id) return
    setSaving(true)
    try {
      await reportIncident(accountId, {
        assetId: id,
        incidentType: 'accident',
        incidentDate: new Date().toISOString().slice(0, 10),
        description: 'Report damage, loss or possible write-off from asset detail',
        reporterName: user?.email ?? 'Reporter',
        userId: user?.id,
        stillUsable: false,
        replacementNeeded: true,
      })
      await refresh()
      setTab('overview')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not open incident')
    } finally {
      setSaving(false)
    }
  }

  async function onBarcode() {
    if (!accountId || !record) return
    await ensureBarcode(accountId, record.asset)
    await refresh()
  }

  function printLabel() {
    if (!record?.asset.barcode) return
    const w = window.open('', '_blank', 'width=420,height=320')
    if (!w) return
    const company = organization?.name ?? homeAccountName ?? 'ASSETS'
    w.document.write(`<!doctype html><html><head><title>Label</title>
      <style>
        body{font-family:ui-monospace,monospace;padding:24px}
        .tag{font-size:22px;font-weight:700}
        .bc{font-size:14px;letter-spacing:1px;margin:12px 0;padding:8px;border:1px solid #111;display:inline-block}
        .desc{font-size:12px;max-width:280px}
        .co{font-size:11px;margin-top:8px;color:#444}
      </style></head><body>
      <div class="tag">${record.asset.asset_tag}</div>
      <div class="bc">${record.asset.barcode}</div>
      <div class="desc">${record.asset.description}</div>
      <div class="co">${company}</div>
      <script>window.print()</script></body></html>`)
    w.document.close()
  }

  if (loading) return <p className="text-sm text-muted">Loading asset record…</p>
  if (!record) return <p className="text-sm text-red-700">{error ?? 'Not found'}</p>

  const { asset, values, health, documents, missingDocs, openIncidents } = record
  const healthItems = [
    { k: 'Documentation', v: health.documentation },
    { k: 'Finance', v: health.finance },
    { k: 'Tax', v: health.tax },
    { k: 'Insurance', v: health.insurance },
    { k: 'Valuation', v: health.valuation },
  ]

  return (
    <div className="space-y-4">
      <PageHeader
        title={asset.asset_tag}
        description={asset.description}
        actions={
          <div className="flex flex-wrap gap-2">
            <button type="button" className="ws-btn-secondary inline-flex items-center gap-1 text-sm" onClick={() => void onBarcode()}>
              Ensure barcode
            </button>
            <button
              type="button"
              className="ws-btn-secondary inline-flex items-center gap-1 text-sm"
              disabled={!asset.barcode || asset.barcode_kind === 'internal_only'}
              onClick={printLabel}
              title={asset.barcode_reason ?? undefined}
            >
              <Printer className="h-3.5 w-3.5" />
              Print label
            </button>
            <button
              type="button"
              disabled={saving}
              className="ws-btn-primary inline-flex items-center gap-1.5 text-sm"
              onClick={() => void onFlag()}
            >
              <AlertTriangle className="h-3.5 w-3.5" />
              Report damage, loss or possible write-off
            </button>
          </div>
        }
      />
      <EntityScopeBanner entityName={organization?.name ?? homeAccountName ?? 'Legal entity'} scopeLabel="Legal entity" />
      {error && <p className="text-sm text-red-700">{error}</p>}

      <section className="ws-panel p-4">
        <h2 className="mb-3 text-sm font-semibold text-ink">Asset health</h2>
        <div className="grid gap-2 sm:grid-cols-5">
          {healthItems.map((h) => (
            <div key={h.k} className="rounded-md border border-border/60 px-3 py-2">
              <p className="text-[11px] uppercase tracking-wide text-muted">{h.k}</p>
              <p
                className={cn(
                  'mt-0.5 text-sm font-medium',
                  /Missing|Needs|Outdated|Claim|Written|review/i.test(h.v) ? 'text-amber-800' : 'text-emerald-800',
                )}
              >
                {h.v}
              </p>
            </div>
          ))}
        </div>
        <p className="mt-2 text-xs text-muted">
          Processing: <strong>{(asset.processing_status ?? 'incomplete').replace(/_/g, ' ')}</strong>
          {asset.processing_status === 'incomplete' ? ' — Incomplete, action required (recording still allowed).' : ''}
        </p>
      </section>

      <div className="flex flex-wrap gap-1 border-b border-border/60 pb-px">
        {(
          [
            ['overview', 'Identity & custody'],
            ['values', 'Values'],
            ['documents', 'Documents'],
            ['timeline', 'Timeline'],
          ] as const
        ).map(([k, label]) => (
          <button
            key={k}
            type="button"
            onClick={() => setTab(k)}
            className={cn(
              'px-3 py-2 text-sm',
              tab === k ? 'border-b-2 border-ink font-semibold text-ink' : 'text-muted',
            )}
          >
            {label}
          </button>
        ))}
      </div>

      {tab === 'overview' && (
        <div className="grid gap-4 lg:grid-cols-2">
          <section className="ws-panel space-y-2 p-4 text-sm">
            <h3 className="font-semibold">Identity and custody</h3>
            <dl className="grid grid-cols-[140px_1fr] gap-y-1.5">
              <dt className="text-muted">Asset tag</dt>
              <dd>{asset.asset_tag}</dd>
              <dt className="text-muted">Class</dt>
              <dd>{asset.asset_class}</dd>
              <dt className="text-muted">Serial / VIN / IMEI</dt>
              <dd>{asset.serial_number || asset.vin || asset.imei || 'Not supplied'}</dd>
              <dt className="text-muted">Ownership</dt>
              <dd>{asset.ownership_type.replace(/_/g, ' ')}</dd>
              <dt className="text-muted">Location</dt>
              <dd>{asset.location_text || 'Not supplied'}</dd>
              <dt className="text-muted">Lifecycle</dt>
              <dd>{asset.status}</dd>
              <dt className="text-muted">Barcode</dt>
              <dd className="font-mono text-xs">
                {asset.barcode ?? 'Not generated'}
                {asset.barcode_kind === 'internal_only' && (
                  <span className="ml-2 text-muted">({asset.barcode_reason})</span>
                )}
              </dd>
            </dl>
            {openIncidents.length > 0 && (
              <div className="mt-3 rounded-md bg-amber-50 px-3 py-2 text-amber-950">
                Open incident:{' '}
                <Link className="underline" to={`/assets/incidents/${openIncidents[0]!.id}`}>
                  {(openIncidents[0] as { incident_number?: string }).incident_number ?? openIncidents[0]!.id}
                </Link>
              </div>
            )}
          </section>
          <section className="ws-panel space-y-3 p-4">
            <h3 className="text-sm font-semibold">Edit permitted fields</h3>
            <label className="block text-xs text-muted">
              Description
              <input
                className="mt-1 w-full rounded-md border border-border px-2 py-1.5 text-sm"
                value={editDesc}
                onChange={(e) => setEditDesc(e.target.value)}
              />
            </label>
            <label className="block text-xs text-muted">
              Location
              <input
                className="mt-1 w-full rounded-md border border-border px-2 py-1.5 text-sm"
                value={editLoc}
                onChange={(e) => setEditLoc(e.target.value)}
              />
            </label>
            <p className="text-[11px] text-muted">
              Changes to acquisition cost or depreciation policy require Finance approval and will not silently rewrite closed periods.
            </p>
            <button type="button" disabled={saving} className="ws-btn-primary text-sm" onClick={() => void saveEdits()}>
              Save changes
            </button>
          </section>
        </div>
      )}

      {tab === 'values' && (
        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {Object.values(values).map((v) => (
            <MetricTile key={v.label} label={v.label} value={v.display} hint={v.hint} unavailable={v.missing} />
          ))}
        </div>
      )}

      {tab === 'documents' && (
        <div className="space-y-3">
          {missingDocs.length > 0 && (
            <div className="ws-panel border-amber-200 bg-amber-50/50 p-3 text-sm text-amber-950">
              <p className="font-medium">Missing evidence (assigned as tasks)</p>
              <ul className="mt-1 list-inside list-disc text-xs">
                {missingDocs.map((d) => (
                  <li key={d.id}>{d.label}</li>
                ))}
              </ul>
            </div>
          )}
          <div className="ws-panel overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead>
                <tr className="border-b text-[11px] uppercase text-muted">
                  <th className="px-3 py-2">Type</th>
                  <th className="px-3 py-2">File</th>
                  <th className="px-3 py-2">Date</th>
                  <th className="px-3 py-2">Source</th>
                  <th className="px-3 py-2">Status</th>
                  <th className="px-3 py-2">Ver</th>
                </tr>
              </thead>
              <tbody>
                {documents.length === 0 ? (
                  <tr>
                    <td colSpan={6} className="px-3 py-4 text-muted">
                      No documents uploaded yet
                    </td>
                  </tr>
                ) : (
                  documents.map((d) => (
                    <tr key={d.id} className="border-b border-border/40">
                      <td className="px-3 py-2">{d.doc_type ?? '—'}</td>
                      <td className="px-3 py-2">{d.file_name ?? d.id}</td>
                      <td className="px-3 py-2 text-xs">{d.uploaded_at?.slice(0, 10)}</td>
                      <td className="px-3 py-2">{d.source ?? '—'}</td>
                      <td className="px-3 py-2">{d.verification_status}</td>
                      <td className="px-3 py-2">{d.version}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {tab === 'timeline' && (
        <div className="space-y-3">
          <select
            className="rounded-md border border-border px-2 py-1.5 text-sm"
            value={timelineFilter}
            onChange={(e) => setTimelineFilter(e.target.value)}
          >
            <option value="all">All events</option>
            <option value="field_edit">Field edits</option>
            <option value="document_upload">Documents</option>
            <option value="incident_reported">Incidents</option>
            <option value="barcode_created">Barcodes</option>
            <option value="bulk_import">Imports</option>
            <option value="audit_assigned">Audits</option>
            <option value="finance_approved">Finance</option>
            <option value="insurance_update">Insurance</option>
          </select>
          <ol className="space-y-2">
            {timeline.map((e) => (
              <li key={e.id} className="ws-panel px-3 py-2 text-sm">
                <div className="flex flex-wrap items-baseline justify-between gap-2">
                  <p className="font-medium text-ink">{e.summary}</p>
                  <time className="text-[11px] text-muted">{new Date(e.created_at).toLocaleString('en-ZA')}</time>
                </div>
                <p className="text-xs text-muted">
                  {e.event_type}
                  {e.actor_label ? ` · ${e.actor_label}` : ''}
                  {e.effective_date ? ` · effective ${e.effective_date}` : ''}
                  {e.incident_id ? (
                    <>
                      {' · '}
                      <Link className="underline" to={`/assets/incidents/${e.incident_id}`}>
                        case
                      </Link>
                    </>
                  ) : null}
                </p>
                {e.detail && <p className="mt-1 text-xs text-muted">{e.detail}</p>}
              </li>
            ))}
            {timeline.length === 0 && <p className="text-sm text-muted">No timeline events yet.</p>}
          </ol>
        </div>
      )}
    </div>
  )
}
