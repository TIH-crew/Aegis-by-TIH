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

export interface ClaimOtpVerifyResult {
  session_token: string
  expires_at: string
  employee: { id: string; full_name: string }
}

export interface ClaimPhotoMeta {
  url: string
  captured_at: string
  latitude: number | null
  longitude: number | null
  accuracy: number | null
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

  // Private bucket — store object path; portal/admin resolves via signed download later.
  return signed.path
}

export function submitEmployeeClaim(
  sessionToken: string,
  payload: {
    title: string
    description: string
    broker_message?: string
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

export function employeeClaimUrl(token: string): string {
  const origin = typeof window !== 'undefined' ? window.location.origin : 'https://aegis-by-tih.vercel.app'
  return `${origin}/claim/${token}`
}
