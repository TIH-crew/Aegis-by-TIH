import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { EntityScopeBanner, PageHeader } from '../components/workspace/WorkspaceUi'
import { importAssetRows } from '../services/asset-lifecycle.service'

type DraftRow = {
  assetTag: string
  description: string
  assetClass: string
  serial?: string
  amount?: string
  quantity?: number
  exclude?: boolean
  error?: string
}

const TEMPLATE = `asset_tag,description,asset_class,serial_number,value,quantity
LAP-001,Dell Latitude 5540,IT Equipment,SN001,18500,1
LAP-BATCH,Identical docking station,IT Equipment,,1200,3
VEH-DEMO,Demo bakkie,Motor,VIN123,420000,1
`

function parseCsv(text: string): DraftRow[] {
  const lines = text.trim().split(/\r?\n/).filter(Boolean)
  if (lines.length < 2) return []
  const header = lines[0]!.split(',').map((h) => h.trim().toLowerCase())
  const idx = (name: string) => header.indexOf(name)
  return lines.slice(1).map((line, i) => {
    const cols = line.split(',').map((c) => c.trim())
    const tag = cols[idx('asset_tag')] ?? `ROW-${i + 1}`
    const qty = Number(cols[idx('quantity')] ?? '1')
    const row: DraftRow = {
      assetTag: tag,
      description: cols[idx('description')] ?? '',
      assetClass: cols[idx('asset_class')] ?? 'General',
      serial: cols[idx('serial_number')] || undefined,
      amount: cols[idx('value')] || undefined,
      quantity: Number.isFinite(qty) && qty > 0 ? qty : 1,
    }
    if (!row.description) row.error = 'Description required'
    if (row.quantity! > 1 && !row.assetTag) row.error = 'Tag required for multi-qty expand'
    return row
  })
}

async function sha256(text: string) {
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text))
  return [...new Uint8Array(buf)].map((b) => b.toString(16).padStart(2, '0')).join('')
}

export function AssetImportPage() {
  const { accountId, user, homeAccountName } = useAuth()
  const [raw, setRaw] = useState(TEMPLATE)
  const [valueKind, setValueKind] = useState<'purchase_cost' | 'insured_value' | 'replacement_value' | 'unknown'>(
    'purchase_cost',
  )
  const [rows, setRows] = useState<DraftRow[]>(() => parseCsv(TEMPLATE))
  const [result, setResult] = useState<{ batchId: string; duplicated: boolean; results: unknown[] } | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const validCount = useMemo(() => rows.filter((r) => !r.exclude && !r.error).length, [rows])

  function onFile(file: File) {
    const reader = new FileReader()
    reader.onload = () => {
      const text = String(reader.result ?? '')
      setRaw(text)
      setRows(parseCsv(text))
      setResult(null)
    }
    reader.readAsText(file)
  }

  async function runImport() {
    if (!accountId) return
    setBusy(true)
    setError(null)
    try {
      const hash = await sha256(raw)
      const payload = rows
        .filter((r) => !r.exclude && !r.error)
        .map((r) => ({
          assetTag: r.assetTag,
          description: r.description,
          assetClass: r.assetClass,
          serial: r.serial,
          amount: r.amount,
          quantity: r.quantity,
        }))
      const res = await importAssetRows(accountId, {
        fileName: 'import.csv',
        sourceHash: hash,
        valueKind,
        ownershipType: 'owned',
        userId: user?.id,
        rows: payload,
      })
      setResult(res)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Import failed')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="space-y-4">
      <PageHeader
        title="Bulk import"
        description="Map values explicitly. Multi-quantity physical rows create individual assets and barcodes. Import does not auto-approve Finance, Tax or Insurance."
        actions={
          <a
            className="ws-btn-secondary text-sm"
            href={`data:text/csv;charset=utf-8,${encodeURIComponent(TEMPLATE)}`}
            download="assets-by-tih-import-template.csv"
          >
            Download template
          </a>
        }
      />
      <EntityScopeBanner entityName={homeAccountName ?? 'Legal entity'} scopeLabel="Legal entity" />

      <ol className="ws-panel list-decimal space-y-1 px-5 py-3 text-sm text-muted">
        <li>Download the template</li>
        <li>Upload CSV (XLSX: export to CSV for now)</li>
        <li>Confirm what “value” means — never assume accounting cost</li>
        <li>Preview and exclude invalid rows</li>
        <li>Import; identical source hash is idempotent</li>
      </ol>

      <div className="grid gap-4 lg:grid-cols-2">
        <section className="ws-panel space-y-3 p-4">
          <label className="block text-xs text-muted">
            Upload CSV
            <input
              type="file"
              accept=".csv,text/csv"
              className="mt-1 block w-full text-sm"
              onChange={(e) => {
                const f = e.target.files?.[0]
                if (f) onFile(f)
              }}
            />
          </label>
          <label className="block text-xs text-muted">
            What does the value column represent?
            <select
              className="mt-1 w-full rounded border border-border px-2 py-1.5 text-sm"
              value={valueKind}
              onChange={(e) => setValueKind(e.target.value as typeof valueKind)}
            >
              <option value="purchase_cost">Purchase / capitalisation cost</option>
              <option value="insured_value">Insured value (not book cost)</option>
              <option value="replacement_value">Replacement value (not book cost)</option>
              <option value="unknown">Unknown — leave values unset</option>
            </select>
          </label>
          <textarea
            className="h-40 w-full rounded border border-border p-2 font-mono text-xs"
            value={raw}
            onChange={(e) => {
              setRaw(e.target.value)
              setRows(parseCsv(e.target.value))
            }}
          />
          <button type="button" disabled={busy || validCount === 0} className="ws-btn-primary text-sm" onClick={() => void runImport()}>
            Import {validCount} valid row(s)
          </button>
          {error && <p className="text-sm text-red-700">{error}</p>}
        </section>

        <section className="ws-panel overflow-x-auto p-2">
          <table className="w-full text-left text-xs">
            <thead>
              <tr className="border-b text-[10px] uppercase text-muted">
                <th className="px-2 py-1">Exclude</th>
                <th className="px-2 py-1">Tag</th>
                <th className="px-2 py-1">Qty</th>
                <th className="px-2 py-1">Description</th>
                <th className="px-2 py-1">Issues</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r, i) => (
                <tr key={`${r.assetTag}-${i}`} className="border-b border-border/40">
                  <td className="px-2 py-1">
                    <input
                      type="checkbox"
                      checked={!!r.exclude}
                      onChange={(e) => {
                        const next = [...rows]
                        next[i] = { ...r, exclude: e.target.checked }
                        setRows(next)
                      }}
                    />
                  </td>
                  <td className="px-2 py-1 font-mono">{r.assetTag}</td>
                  <td className="px-2 py-1">{r.quantity}</td>
                  <td className="px-2 py-1">{r.description}</td>
                  <td className="px-2 py-1 text-amber-800">
                    {r.error}
                    {(r.quantity ?? 1) > 1 ? ' → expands to individual barcodes' : ''}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </section>
      </div>

      {result && (
        <div className="ws-panel p-4 text-sm">
          {result.duplicated ? (
            <p className="text-amber-800">Same source already imported — no duplicates created (batch {result.batchId}).</p>
          ) : (
            <p>
              Batch {result.batchId} completed. Assets placed in review queue (missing documents / Finance / Tax / Insurance matching).{' '}
              <Link className="underline" to="/assets/ledger">
                Open register
              </Link>
            </p>
          )}
          <pre className="mt-2 max-h-40 overflow-auto rounded bg-slate-50 p-2 text-[11px]">
            {JSON.stringify(result.results, null, 2)}
          </pre>
        </div>
      )}
    </div>
  )
}
