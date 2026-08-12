import { useRef, useState } from 'react'
import { CheckCircle2, IdCard, Loader2, Upload } from 'lucide-react'
import {
  verifyDriversLicence,
  type DriversLicenceResult,
} from '../../services/verifynow.service'
import { formatDate } from '../../lib/utils'

interface DriversLicenceVerifyPanelProps {
  onVerified: (payload: {
    full_name?: string
    id_number?: string
    licence_number?: string
    licence_valid_to?: string | null
    licence_categories?: string[]
    image_url?: string | null
    drivers_licence_verification: DriversLicenceResult
  }) => void | Promise<void>
}

export function DriversLicenceVerifyPanel({ onVerified }: DriversLicenceVerifyPanelProps) {
  const inputRef = useRef<HTMLInputElement>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<DriversLicenceResult | null>(null)

  async function handleFile(file: File) {
    setLoading(true)
    setError(null)
    try {
      const data = await verifyDriversLicence(file)
      if (!data.success && !data.data) {
        throw new Error(data.error || 'Licence verification failed')
      }
      setResult(data)
      const card = data.data ?? {}
      const categories = (card.vehicleCategories ?? [])
        .map((row) => row.code)
        .filter((code): code is string => Boolean(code))
      const name = [card.initials, card.surname].filter(Boolean).join(' ').trim()
      await onVerified({
        full_name: name || undefined,
        id_number: card.idNumber,
        licence_number: card.licenceNumber,
        licence_valid_to: card.validTo ?? null,
        licence_categories: categories,
        image_url: card.portrait?.imageDataUrl ?? null,
        drivers_licence_verification: data,
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Verification failed')
    } finally {
      setLoading(false)
    }
  }

  const card = result?.data

  return (
    <div className="rounded-lg border border-border bg-surface shadow-sm">
      <div className="border-b border-border bg-page px-4 py-3">
        <h3 className="flex items-center gap-2 font-semibold text-gray-900">
          <IdCard size={16} />
          Driver&apos;s licence verification
        </h3>
        <p className="text-xs text-muted">
          Upload a photo of the back of the SA driver&apos;s licence (PDF417 barcode). Powered by
          VerifyNow.
        </p>
      </div>

      <div className="space-y-3 p-4">
        <input
          ref={inputRef}
          type="file"
          accept="image/jpeg,image/png,image/webp"
          className="hidden"
          onChange={(e) => {
            const file = e.target.files?.[0]
            if (file) void handleFile(file)
            e.target.value = ''
          }}
        />
        <button
          type="button"
          disabled={loading}
          onClick={() => inputRef.current?.click()}
          className="inline-flex items-center gap-2 rounded-lg border border-border bg-page px-3 py-2 text-sm font-medium hover:bg-gray-50 disabled:opacity-60"
        >
          {loading ? <Loader2 size={14} className="animate-spin" /> : <Upload size={14} />}
          {loading ? 'Verifying…' : 'Scan licence barcode'}
        </button>

        {error && <p className="text-sm text-red-600">{error}</p>}

        {card && (
          <div className="rounded-lg border border-emerald-200 bg-emerald-50 p-3 text-sm">
            <p className="mb-2 flex items-center gap-1.5 font-medium text-emerald-800">
              <CheckCircle2 size={14} /> Verified
            </p>
            <dl className="grid grid-cols-1 gap-1 sm:grid-cols-2">
              <Row label="Name" value={[card.initials, card.surname].filter(Boolean).join(' ')} />
              <Row label="ID number" value={card.idNumber} />
              <Row label="Licence number" value={card.licenceNumber} />
              <Row
                label="Valid to"
                value={card.validTo ? formatDate(card.validTo) : undefined}
              />
              <Row
                label="Categories"
                value={(card.vehicleCategories ?? [])
                  .map((row) => row.code)
                  .filter(Boolean)
                  .join(', ')}
              />
            </dl>
          </div>
        )}
      </div>
    </div>
  )
}

function Row({ label, value }: { label: string; value?: string }) {
  if (!value) return null
  return (
    <div>
      <dt className="text-xs text-muted">{label}</dt>
      <dd className="font-medium text-gray-900">{value}</dd>
    </div>
  )
}
