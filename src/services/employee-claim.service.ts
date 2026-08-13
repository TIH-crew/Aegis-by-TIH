const SESSION_KEY = 'aegis.claimSession'

function claimBaseUrl() {
  const functionsBase = import.meta.env.VITE_SUPABASE_FUNCTIONS_URL
  if (functionsBase) {
    return `${functionsBase.replace(/\/$/, '')}/aegis-employee-claim`
  }
  const url = import.meta.env.VITE_SUPABASE_URL
  if (!url) throw new Error('Missing VITE_SUPABASE_URL')
  return `${url.replace(/\/$/, '')}/functions/v1/aegis-employee-claim`
}

async function claimFetch<T>(
  path: string,
  init?: RequestInit & { sessionToken?: string | null },
): Promise<T> {
  const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
    ...(anonKey ? { apikey: anonKey, Authorization: `Bearer ${anonKey}` } : {}),
    ...(init?.headers as Record<string, string> | undefined),
  }
  if (init?.sessionToken) {
    headers['x-aegis-claim-session'] = init.sessionToken
  }

  const res = await fetch(`${claimBaseUrl()}/${path.replace(/^\//, '')}`, {
    ...init,
    headers,
  })
  const data = await res.json().catch(() => ({}))
  if (!res.ok || data.ok === false) {
    throw new Error(data.error ?? `Claim request failed (${res.status})`)
  }
  return data as T
}

export interface ClaimResolveResult {
  employee: { first_name: string; whatsapp_masked: string }
}

export interface ClaimOtpSendResult {
  whatsapp_masked: string
  expires_in_seconds: number
  channel: string
  dev_code?: string
}

export interface ClaimVerifiedEmployee {
  id: string
  account_id: string
  full_name: string
  first_name: string
  email: string | null
  phone: string | null
  whatsapp_number: string
  job_title: string | null
  employee_number: string | null
  branch_id: string | null
  branch_name: string | null
  company_name: string | null
  id_number: string | null
  verified: true
}

export interface ClaimOtpVerifyResult {
  session_token: string
  expires_at: string
  employee: ClaimVerifiedEmployee
}

export interface ClaimPhotoMeta {
  url: string
  captured_at: string
  latitude: number | null
  longitude: number | null
  accuracy: number | null
}

export interface ClaimRiskItem {
  id: string
  name: string
  category: string
  branch: string | null
  branch_id: string | null
  zoho_risk_id: string | null
  asset_tag: string
  registration_hint: string | null
}

export interface ClaimMatchVehicleResult {
  matched: boolean
  plate: string
  registration_normalized: string
  item: ClaimRiskItem | null
  policy: {
    policy_id: string
    zoho_policy_id: string
    policy_number: string | null
    insurer: string | null
  } | null
  extension_notes?: string[]
}

export function saveClaimSession(token: string, expiresAt: string) {
  sessionStorage.setItem(SESSION_KEY, JSON.stringify({ token, expiresAt }))
}

export function loadClaimSession(): { token: string; expiresAt: string } | null {
  try {
    const raw = sessionStorage.getItem(SESSION_KEY)
    if (!raw) return null
    const parsed = JSON.parse(raw) as { token: string; expiresAt: string }
    if (!parsed.token || new Date(parsed.expiresAt).getTime() < Date.now()) {
      sessionStorage.removeItem(SESSION_KEY)
      return null
    }
    return parsed
  } catch {
    return null
  }
}

export function clearClaimSession() {
  sessionStorage.removeItem(SESSION_KEY)
}

export function resolveClaimQr(token: string) {
  return claimFetch<ClaimResolveResult & { ok: true }>(`resolve/${token}`)
}

export function sendClaimOtp(token: string) {
  return claimFetch<ClaimOtpSendResult & { ok: true }>('otp/send', {
    method: 'POST',
    body: JSON.stringify({ token }),
  })
}

export function verifyClaimOtp(token: string, code: string) {
  return claimFetch<ClaimOtpVerifyResult & { ok: true }>('otp/verify', {
    method: 'POST',
    body: JSON.stringify({ token, code }),
  })
}

export function fetchClaimProfile(sessionToken: string) {
  return claimFetch<{ ok: true; employee: ClaimVerifiedEmployee }>('profile', {
    method: 'GET',
    sessionToken,
  })
}

export function listClaimItems(sessionToken: string) {
  return claimFetch<{ ok: true; items: ClaimRiskItem[] }>('items', {
    method: 'GET',
    sessionToken,
  })
}

async function fileToBase64(file: File): Promise<string> {
  const buffer = await file.arrayBuffer()
  const bytes = new Uint8Array(buffer)
  let binary = ''
  for (let i = 0; i < bytes.length; i += 1) binary += String.fromCharCode(bytes[i]!)
  return btoa(binary)
}

export async function matchClaimVehicle(
  sessionToken: string,
  opts: { plateText?: string; discFile?: File | null },
) {
  const payload: Record<string, unknown> = {}
  if (opts.plateText?.trim()) payload.plate_text = opts.plateText.trim()
  if (opts.discFile) payload.image_base64 = await fileToBase64(opts.discFile)
  return claimFetch<ClaimMatchVehicleResult & { ok: true }>('match-vehicle', {
    method: 'POST',
    sessionToken,
    body: JSON.stringify(payload),
  })
}

export async function uploadClaimMedia(
  sessionToken: string,
  file: Blob,
  filename: string,
  contentType: string,
): Promise<string> {
  const signed = await claimFetch<{
    ok: true
    path: string
    token: string
    signedUrl: string
  }>('upload-url', {
    method: 'POST',
    sessionToken,
    body: JSON.stringify({ filename, contentType }),
  })

  const put = await fetch(signed.signedUrl, {
    method: 'PUT',
    headers: {
      'Content-Type': contentType,
      'x-upsert': 'true',
    },
    body: file,
  })
  if (!put.ok) throw new Error('Failed to upload media')

  return signed.path
}

export function submitEmployeeClaim(
  sessionToken: string,
  payload: {
    title: string
    description: string
    broker_message?: string
    risk_item_id: string
    zoho_policy_id?: string | null
    claim_amount?: number | null
    latitude?: number | null
    longitude?: number | null
    location_accuracy?: number | null
    photo_meta: ClaimPhotoMeta[]
    attachments: string[]
    voice_note_url?: string | null
    roadside_needed?: boolean
    roadside_call_preference?: 'self' | 'broker' | null
    roadside_provider?: Record<string, unknown> | null
    vapi_call_id?: string | null
    vapi_transcript?: string | null
    vapi_recording_path?: string | null
    vapi_transcript_path?: string | null
    submitted_via?: 'employee_qr' | 'employee_vapi'
  },
) {
  return claimFetch<{ ok: true; claim: { id: string; title: string; status: string } }>(
    'submit',
    {
      method: 'POST',
      sessionToken,
      body: JSON.stringify(payload),
    },
  )
}

export interface VapiCompleteDraft {
  title: string
  description: string
  broker_message: string | null
  claim_amount: number | null
  roadside_needed: boolean
  risk_item_id: string | null
  asset_name_or_plate: string | null
  ready_to_submit: boolean
}

export interface VapiCompleteResult {
  ok: true
  status: 'submitted' | 'needs_review'
  claim?: { id: string; title: string; status: string; zoho_claim_id?: string | null }
  draft?: VapiCompleteDraft
  vapi_call_id?: string
  vapi_recording_path?: string | null
  vapi_transcript_path?: string | null
  vapi_transcript?: string | null
  recording_ready?: boolean
  duplicate?: boolean
}

export function completeVapiClaim(
  sessionToken: string,
  payload: {
    vapi_call_id: string
    risk_item_id?: string | null
    latitude?: number | null
    longitude?: number | null
    location_accuracy?: number | null
    transcript_fallback?: Array<{ role: string; text: string }>
  },
) {
  return claimFetch<VapiCompleteResult>('vapi/complete', {
    method: 'POST',
    sessionToken,
    body: JSON.stringify(payload),
  })
}

export function employeeClaimUrl(token: string): string {
  const origin = typeof window !== 'undefined' ? window.location.origin : 'https://aegis-by-tih.vercel.app'
  return `${origin}/claim/${token}`
}
