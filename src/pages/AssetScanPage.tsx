import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { EntityScopeBanner, PageHeader } from '../components/workspace/WorkspaceUi'
import { findAssetByScan } from '../services/asset-tracking.service'
import { nfcReaderAvailable, readNfcSerial } from '../domain/asset-tags'

export function AssetScanPage() {
  const { accountId, homeAccountName } = useAuth()
  const navigate = useNavigate()
  const [code, setCode] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function openCode(raw: string) {
    if (!accountId) return
    setBusy(true)
    setError(null)
    try {
      const match = await findAssetByScan(accountId, raw)
      if (!match) {
        setError('No asset in this legal entity matches that barcode, NFC or RFID tag.')
        return
      }
      navigate(match.target === 'ledger' ? `/assets/ledger/${match.id}` : `/assets/${match.id}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Lookup failed')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="mx-auto max-w-lg space-y-4">
      <PageHeader
        title="Scan a tag"
        description="Barcode scanners, NFC phones and RFID readers open the matching asset. Tags are unique inside this legal entity and are never reused."
      />
      <EntityScopeBanner entityName={homeAccountName ?? 'Legal entity'} scopeLabel="Legal entity" />
      <form
        className="ws-panel space-y-3 p-4"
        onSubmit={(e) => {
          e.preventDefault()
          void openCode(code)
        }}
      >
        <label className="block text-sm">
          <span className="mb-1 block font-medium">Tag, barcode or asset tag</span>
          <input
            autoFocus
            className="field-input font-mono"
            value={code}
            onChange={(e) => setCode(e.target.value)}
            placeholder="Scan now"
          />
        </label>
        <div className="flex flex-wrap gap-2">
          <button type="submit" className="ws-btn-primary text-sm" disabled={busy || !code.trim()}>
            Open asset
          </button>
          {nfcReaderAvailable() && (
            <button
              type="button"
              className="ws-btn-secondary text-sm"
              disabled={busy}
              onClick={() => {
                setBusy(true)
                void readNfcSerial()
                  .then((serial) => {
                    setCode(serial)
                    return openCode(serial)
                  })
                  .catch((err) => {
                    setError(err instanceof Error ? err.message : 'NFC read failed')
                    setBusy(false)
                  })
              }}
            >
              Read NFC
            </button>
          )}
        </div>
        {error && <p className="text-sm text-red-700">{error}</p>}
      </form>
    </div>
  )
}
