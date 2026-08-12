import { supabase } from '../lib/supabase'

const VERIFYNOW_MODE =
  (import.meta.env.VITE_VERIFYNOW_MODE as string | undefined) === 'sandbox'
    ? 'sandbox'
    : 'production'

function functionsBase() {
  const override = import.meta.env.VITE_SUPABASE_FUNCTIONS_URL as string | undefined
  if (override) return override.replace(/\/$/, '')
  const url = import.meta.env.VITE_SUPABASE_URL as string | undefined
  if (!url) throw new Error('Missing VITE_SUPABASE_URL')
  return `${url.replace(/\/$/, '')}/functions/v1`
}

async function verifynowFetch<T>(path: string, body: Record<string, unknown>): Promise<T> {
  const {
    data: { session },
  } = await supabase.auth.getSession()
  if (!session?.access_token) throw new Error('Not signed in')

  const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined
  const res = await fetch(`${functionsBase()}/aegis-verifynow/${path.replace(/^\//, '')}`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${session.access_token}`,
      apikey: anonKey ?? '',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      ...body,
      mode: VERIFYNOW_MODE,
      idempotencyKey: crypto.randomUUID(),
    }),
  })

  const data = (await res.json().catch(() => ({}))) as T & { error?: string; message?: string }
  if (!res.ok) {
    throw new Error(data.error || data.message || `VerifyNow request failed (${res.status})`)
  }
  return data
}

export async function fileToBase64(file: File): Promise<string> {
  const buffer = await file.arrayBuffer()
  const bytes = new Uint8Array(buffer)
  let binary = ''
  for (let i = 0; i < bytes.length; i += 1) binary += String.fromCharCode(bytes[i]!)
  return btoa(binary)
}

export interface DriversLicenceResult {
  success?: boolean
  requestId?: string
  creditsUsed?: number
  data?: {
    surname?: string
    initials?: string
    idNumber?: string
    licenceNumber?: string
    validTo?: string
    validFrom?: string
    vehicleCategories?: { code?: string }[]
    portrait?: { available?: boolean; imageDataUrl?: string }
    confidence?: string
    [key: string]: unknown
  }
  error?: string
}

export interface VehicleDiscResult {
  success?: boolean
  requestId?: string
  reportType?: string
  creditsUsed?: number
  data?: {
    registrationNumber?: string
    vin?: string
    make?: string
    model?: string
    expiryDate?: string
    expired?: boolean
    colour?: string
    color?: string
    engineNumber?: string
    vehicleClass?: string
    [key: string]: unknown
  }
  verification?: Record<string, unknown>
  error?: string
}

export interface NumberPlateResult {
  success?: boolean
  requestId?: string
  registrationNumber?: string
  vehicle?: {
    make?: string
    model?: string
    year?: string
    color?: string
    colour?: string
    engineNumber?: string
    vin?: string
    [key: string]: unknown
  }
  remainingCredits?: number
  error?: string
}

export async function verifyDriversLicence(imageFile: File): Promise<DriversLicenceResult> {
  const image_base64 = await fileToBase64(imageFile)
  return verifynowFetch<DriversLicenceResult>('drivers-licence', { image_base64 })
}

export async function scanVehicleLicenceDisc(
  imageFile: File,
  reportType: 'barcode' | 'plate' = 'barcode',
): Promise<VehicleDiscResult> {
  const image_base64 = await fileToBase64(imageFile)
  return verifynowFetch<VehicleDiscResult>('vehicle-licence-disc', {
    image_base64,
    report_type: reportType,
    allow_visual_fallback: true,
  })
}

export async function lookupNumberPlate(registrationNumber: string): Promise<NumberPlateResult> {
  return verifynowFetch<NumberPlateResult>('vehicle', { registrationNumber })
}

/** Map VerifyNow vehicle fields onto portal Motor zoho_fields keys. */
export function vehicleResultToZohoFields(
  source: VehicleDiscResult['data'] | NumberPlateResult['vehicle'] | undefined,
): Record<string, string> {
  if (!source) return {}
  const out: Record<string, string> = {}
  if (source.make) out.Vehicle_Make = String(source.make)
  if (source.model) out.Vehicle_Model = String(source.model)
  if ('year' in source && source.year) out.Vehicle_Year = String(source.year)
  if ('registrationNumber' in source && source.registrationNumber) {
    out.Registration_Number = String(source.registrationNumber)
  }
  if (source.vin) out.VIN_Number = String(source.vin)
  return out
}
