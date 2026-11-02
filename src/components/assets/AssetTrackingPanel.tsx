import { useState } from 'react'
import { assignAssetTag, type TagKind, type TagTarget } from '../../services/asset-tracking.service'
import { nfcReaderAvailable, readNfcSerial } from '../../domain/asset-tags'

export function AssetTrackingPanel({
  accountId,
  target,
  recordId,
  barcode,
  nfcUid,
  rfidEpc,
  userId,
  onChanged,
}: {
  accountId: string
  target: TagTarget
  recordId: string
  barcode?: string | null
  nfcUid?: string | null
  rfidEpc?: string | null
  userId?: string
  onChanged?: () => void
}) {
  const [nfc, setNfc] = useState('')
  const [rfid, setRfid] = useState('')
  const [busy, setBusy] = useState<TagKind | 'read' | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [note, setNote] = useState<string | null>(null)

  async function save(kind: TagKind, raw: string) {
    setBusy(kind)
    setError(null)
    setNote(null)
    try {
      const saved = await assignAssetTag({
        accountId,
        target,
        recordId,
        kind,
        rawValue: raw,
        userId,
      })
      setNote(`${kind === 'nfc' ? 'NFC' : 'RFID'} tag saved: ${saved}`)
      if (kind === 'nfc') setNfc('')
      else setRfid('')
      onChanged?.()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save tag')
    } finally {
      setBusy(null)
    }
  }

  async function readNfc() {
    setBusy('read')
    setError(null)
    try {
      const serial = await readNfcSerial()
      setNfc(serial)
      await save('nfc', serial)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'NFC read failed')
      setBusy(null)
    }
  }

  return (
    <section className="ws-panel space-y-3 p-4">
      <div>
        <h3 className="text-sm font-semibold text-ink">Tracking tags</h3>
        <p className="text-xs text-muted">
          Barcode, NFC and RFID each resolve to this asset. A retired tag is never reused.
        </p>
      </div>
      <dl className="grid grid-cols-[120px_1fr] gap-y-1.5 text-sm">
        <dt className="text-muted">Barcode</dt>
        <dd className="font-mono text-xs">{barcode || 'Not generated'}</dd>
        <dt className="text-muted">NFC UID</dt>
        <dd className="font-mono text-xs">{nfcUid || 'Not assigned'}</dd>
        <dt className="text-muted">RFID EPC</dt>
        <dd className="font-mono text-xs">{rfidEpc || 'Not assigned'}</dd>
      </dl>
      <div className="flex flex-wrap items-end gap-2">
        <label className="block text-xs text-muted">
          NFC UID
          <input
            className="mt-1 w-48 rounded border border-border px-2 py-1.5 font-mono text-sm"
            value={nfc}
            onChange={(e) => setNfc(e.target.value)}
            placeholder="Scan or type"
          />
        </label>
        {nfcReaderAvailable() && (
          <button type="button" className="ws-btn-secondary text-xs" disabled={busy != null} onClick={() => void readNfc()}>
            Read NFC
          </button>
        )}
        <button
          type="button"
          className="ws-btn-primary text-xs"
          disabled={busy != null || !nfc.trim()}
          onClick={() => void save('nfc', nfc)}
        >
          Save NFC
        </button>
      </div>
      <div className="flex flex-wrap items-end gap-2">
        <label className="block text-xs text-muted">
          RFID EPC
          <input
            className="mt-1 w-56 rounded border border-border px-2 py-1.5 font-mono text-sm"
            value={rfid}
            onChange={(e) => setRfid(e.target.value)}
            placeholder="USB reader types the EPC"
          />
        </label>
        <button
          type="button"
          className="ws-btn-primary text-xs"
          disabled={busy != null || !rfid.trim()}
          onClick={() => void save('rfid', rfid)}
        >
          Save RFID
        </button>
      </div>
      {error && <p className="text-sm text-red-700">{error}</p>}
      {note && <p className="text-sm text-emerald-800">{note}</p>}
    </section>
  )
}
