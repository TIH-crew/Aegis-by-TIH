import { useRef, useState } from 'react'
import { Car, Loader2, ScanLine, Search } from 'lucide-react'
import {
  lookupNumberPlate,
  scanVehicleLicenceDisc,
  vehicleResultToZohoFields,
  type NumberPlateResult,
  type VehicleDiscResult,
} from '../../services/verifynow.service'

interface MotorVerifyPanelProps {
  registrationNumber?: string
  onApply: (payload: {
    name?: string
    serial_number?: string | null
    zoho_fields: Record<string, unknown>
    vehicle_verification: Record<string, unknown>
  }) => void
}

export function MotorVerifyPanel({ registrationNumber = '', onApply }: MotorVerifyPanelProps) {
  const discInputRef = useRef<HTMLInputElement>(null)
  const [plate, setPlate] = useState(registrationNumber)
  const [loading, setLoading] = useState<'disc' | 'plate' | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [discResult, setDiscResult] = useState<VehicleDiscResult | null>(null)
  const [plateResult, setPlateResult] = useState<NumberPlateResult | null>(null)

  async function handleDisc(file: File, reportType: 'barcode' | 'plate') {
    setLoading('disc')
    setError(null)
    try {
      const data = await scanVehicleLicenceDisc(file, reportType)
      if (!data.success && !data.data) throw new Error(data.error || 'Disc scan failed')
      setDiscResult(data)
      const fields = vehicleResultToZohoFields(data.data)
      if (data.data?.registrationNumber) setPlate(data.data.registrationNumber)
      const label = [data.data?.make, data.data?.model, data.data?.registrationNumber]
        .filter(Boolean)
        .join(' ')
      onApply({
        name: label || undefined,
        serial_number: data.data?.vin ?? null,
        zoho_fields: fields,
        vehicle_verification: {
          disc: data,
          scanned_at: new Date().toISOString(),
        },
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Disc scan failed')
    } finally {
      setLoading(null)
    }
  }

  async function handlePlateLookup() {
    if (!plate.trim()) {
      setError('Enter a registration number first.')
      return
    }
    setLoading('plate')
    setError(null)
    try {
      const data = await lookupNumberPlate(plate.trim())
      if (!data.vehicle && !data.success) {
        throw new Error(data.error || 'Number plate lookup failed')
      }
      setPlateResult(data)
      const fields = {
        Registration_Number: data.registrationNumber || plate.trim(),
        ...vehicleResultToZohoFields(data.vehicle),
      }
      const label = [data.vehicle?.make, data.vehicle?.model, fields.Registration_Number]
        .filter(Boolean)
        .join(' ')
      onApply({
        name: label || undefined,
        serial_number: data.vehicle?.vin ?? null,
        zoho_fields: fields,
        vehicle_verification: {
          number_plate: data,
          looked_up_at: new Date().toISOString(),
        },
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Number plate lookup failed')
    } finally {
      setLoading(null)
    }
  }

  const disc = discResult?.data
  const vehicle = plateResult?.vehicle

  return (
    <div className="rounded-lg border border-border bg-surface shadow-sm">
      <div className="border-b border-border bg-page px-4 py-3">
        <h3 className="flex items-center gap-2 font-semibold text-gray-900">
          <Car size={16} />
          Vehicle verification
        </h3>
        <p className="text-xs text-muted">
          Scan the licence disc barcode or look up the number plate via VerifyNow, then apply the
          details to this motor item.
        </p>
      </div>

      <div className="space-y-4 p-4">
        <div>
          <p className="mb-2 text-sm font-medium">Licence disc scanner</p>
          <input
            ref={discInputRef}
            type="file"
            accept="image/jpeg,image/png,image/webp"
            className="hidden"
            onChange={(e) => {
              const file = e.target.files?.[0]
              if (file) void handleDisc(file, 'barcode')
              e.target.value = ''
            }}
          />
          <div className="flex flex-wrap gap-2">
            <button
              type="button"
              disabled={loading != null}
              onClick={() => discInputRef.current?.click()}
              className="inline-flex items-center gap-2 rounded-lg border border-border bg-page px-3 py-2 text-sm font-medium hover:bg-gray-50 disabled:opacity-60"
            >
              {loading === 'disc' ? (
                <Loader2 size={14} className="animate-spin" />
              ) : (
                <ScanLine size={14} />
              )}
              Scan disc
            </button>
            <button
              type="button"
              disabled={loading != null}
              onClick={() => {
                const input = document.createElement('input')
                input.type = 'file'
                input.accept = 'image/jpeg,image/png,image/webp'
                input.onchange = () => {
                  const file = input.files?.[0]
                  if (file) void handleDisc(file, 'plate')
                }
                input.click()
              }}
              className="inline-flex items-center gap-2 rounded-lg border border-border bg-page px-3 py-2 text-sm font-medium hover:bg-gray-50 disabled:opacity-60"
            >
              Scan disc + plate check
            </button>
          </div>
        </div>

        <div>
          <p className="mb-2 text-sm font-medium">Number plate lookup</p>
          <div className="flex flex-wrap gap-2">
            <input
              className="field-input max-w-xs"
              placeholder="e.g. CA 123-456"
              value={plate}
              onChange={(e) => setPlate(e.target.value)}
            />
            <button
              type="button"
              disabled={loading != null}
              onClick={() => void handlePlateLookup()}
              className="inline-flex items-center gap-2 rounded-lg bg-primary px-3 py-2 text-sm font-medium text-white disabled:opacity-60"
            >
              {loading === 'plate' ? (
                <Loader2 size={14} className="animate-spin" />
              ) : (
                <Search size={14} />
              )}
              Look up plate
            </button>
          </div>
        </div>

        {error && <p className="text-sm text-red-600">{error}</p>}

        {(disc || vehicle) && (
          <div className="rounded-lg border border-border bg-page p-3 text-sm">
            <p className="mb-2 font-medium text-gray-900">Latest result</p>
            <dl className="grid grid-cols-1 gap-1 sm:grid-cols-2">
              <Row label="Registration" value={disc?.registrationNumber || plateResult?.registrationNumber || plate} />
              <Row label="Make" value={disc?.make || vehicle?.make} />
              <Row label="Model" value={disc?.model || vehicle?.model} />
              <Row label="Year" value={vehicle?.year} />
              <Row label="VIN" value={disc?.vin || vehicle?.vin} />
              <Row label="Colour" value={disc?.colour || disc?.color || vehicle?.color || vehicle?.colour} />
              <Row label="Disc expiry" value={disc?.expiryDate} />
              <Row
                label="Expired"
                value={disc?.expired == null ? undefined : disc.expired ? 'Yes' : 'No'}
              />
            </dl>
          </div>
        )}
      </div>
    </div>
  )
}

function Row({ label, value }: { label: string; value?: string | null }) {
  if (!value) return null
  return (
    <div>
      <dt className="text-xs text-muted">{label}</dt>
      <dd className="font-medium text-gray-900">{value}</dd>
    </div>
  )
}
