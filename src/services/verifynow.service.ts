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

/** Drivers licence barcode verification only — vehicle disc / plate lookup removed. */
export async function verifyDriversLicence(imageFile: File): Promise<DriversLicenceResult> {
  const image_base64 = await fileToBase64(imageFile)
  return verifynowFetch<DriversLicenceResult>('drivers-licence', { image_base64 })
}
