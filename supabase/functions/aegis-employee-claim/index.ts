import { createClient } from 'jsr:@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers':
    'authorization, x-client-info, apikey, content-type, x-aegis-claim-session',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
}

const VERIFYNOW_BASE = 'https://www.verifynow.co.za/api/external'

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}

function getServiceClient() {
  const url = Deno.env.get('SUPABASE_URL')
  const key = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
  if (!url || !key) throw new Error('Supabase service credentials are not configured')
  return createClient(url, key)
}

function normalizeWa(raw: string): string {
  const digits = raw.replace(/[^\d+]/g, '')
  if (digits.startsWith('+')) return digits
  if (digits.startsWith('0') && digits.length >= 10) {
    return `+27${digits.slice(1)}`
  }
  if (digits.startsWith('27')) return `+${digits}`
  return digits.startsWith('+') ? digits : `+${digits}`
}

function maskWa(wa: string): string {
  const d = wa.replace(/\D/g, '')
  if (d.length < 6) return '***'
  return `+${d.slice(0, 2)}***${d.slice(-3)}`
}

function normalizePlate(raw: string): string {
  return raw.toUpperCase().replace(/[^A-Z0-9]/g, '')
}

async function sha256Hex(value: string): Promise<string> {
  const data = new TextEncoder().encode(value)
  const hash = await crypto.subtle.digest('SHA-256', data)
  return [...new Uint8Array(hash)].map((b) => b.toString(16).padStart(2, '0')).join('')
}

function randomOtp(): string {
  const n = crypto.getRandomValues(new Uint32Array(1))[0] % 1_000_000
  return String(n).padStart(6, '0')
}

function randomSessionToken(): string {
  const bytes = crypto.getRandomValues(new Uint8Array(32))
  return [...bytes].map((b) => b.toString(16).padStart(2, '0')).join('')
}

async function sendWhatsAppOtp(toE164: string, code: string): Promise<{ channel: string; sid?: string }> {
  const accountSid = Deno.env.get('TWILIO_ACCOUNT_SID')
  const authToken = Deno.env.get('TWILIO_AUTH_TOKEN')
  const verifySid = Deno.env.get('TWILIO_VERIFY_SERVICE_SID') ?? Deno.env.get('VERIFY_SERVICE_SID')

  if (accountSid && authToken && verifySid) {
    const auth = btoa(`${accountSid}:${authToken}`)
    const body = new URLSearchParams({
      To: toE164,
      Channel: 'whatsapp',
    })
    const res = await fetch(
      `https://verify.twilio.com/v2/Services/${verifySid}/Verifications`,
      {
        method: 'POST',
        headers: {
          Authorization: `Basic ${auth}`,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body,
      },
    )
    const data = await res.json()
    if (!res.ok) {
      console.warn('Twilio Verify WhatsApp failed:', data)
    } else {
      return { channel: 'twilio_verify_whatsapp', sid: data.sid }
    }
  }

  if (!accountSid || !authToken) {
    console.warn('No Twilio credentials — OTP stored only (dev mode)')
    return { channel: 'dev_log' }
  }

  const auth = btoa(`${accountSid}:${authToken}`)
  const fromRaw = (Deno.env.get('TWILIO_WHATSAPP_FROM') ?? Deno.env.get('TWILIO_SMS_FROM') ?? '').trim()
  const fromE164 = fromRaw.replace(/^whatsapp:/i, '')
  const fromWa = fromE164 ? `whatsapp:${fromE164.startsWith('+') ? fromE164 : `+${fromE164}`}` : ''

  if (fromWa) {
    const body = new URLSearchParams({
      To: `whatsapp:${toE164}`,
      From: fromWa,
      Body: `Aegis claim verification code: ${code}. Valid for 10 minutes.`,
    })
    const res = await fetch(
      `https://api.twilio.com/2010-04-01/Accounts/${accountSid}/Messages.json`,
      {
        method: 'POST',
        headers: {
          Authorization: `Basic ${auth}`,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body,
      },
    )
    const data = await res.json()
    if (res.ok) {
      return { channel: 'twilio_whatsapp_message', sid: data.sid }
    }
    console.warn('Twilio WhatsApp send failed, trying SMS:', data)
  }

  if (fromE164) {
    const smsFrom = fromE164.startsWith('+') ? fromE164 : `+${fromE164}`
    const body = new URLSearchParams({
      To: toE164,
      From: smsFrom,
      Body: `Aegis claim verification code: ${code}. Valid for 10 minutes.`,
    })
    const res = await fetch(
      `https://api.twilio.com/2010-04-01/Accounts/${accountSid}/Messages.json`,
      {
        method: 'POST',
        headers: {
          Authorization: `Basic ${auth}`,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body,
      },
    )
    const data = await res.json()
    if (!res.ok) {
      const msg = String(data.message ?? 'Failed to send OTP')
      if (/channel with the specified from address/i.test(msg)) {
        throw new Error(
          'Twilio number is not enabled for WhatsApp. Enable WhatsApp on this sender (or use the WhatsApp Sandbox), or use a verified SMS-capable From number.',
        )
      }
      throw new Error(msg)
    }
    return { channel: 'twilio_sms', sid: data.sid }
  }

  console.warn('No Twilio From number — OTP stored only (dev mode)')
  return { channel: 'dev_log' }
}

async function sendBrokerWhatsApp(bodyText: string, mediaUrls: string[] = []): Promise<{ ok: boolean; sid?: string; error?: string }> {
  const accountSid = Deno.env.get('TWILIO_ACCOUNT_SID')
  const authToken = Deno.env.get('TWILIO_AUTH_TOKEN')
  const toRaw = (Deno.env.get('BROKER_WHATSAPP_TO') ?? '+27824567868').trim()
  const fromRaw = (Deno.env.get('TWILIO_WHATSAPP_FROM') ?? Deno.env.get('TWILIO_SMS_FROM') ?? '').trim()

  if (!accountSid || !authToken || !fromRaw) {
    console.warn('Broker WhatsApp skipped — Twilio / TWILIO_WHATSAPP_FROM not configured')
    return { ok: false, error: 'Twilio WhatsApp not configured' }
  }

  const toE164 = normalizeWa(toRaw)
  const fromE164 = fromRaw.replace(/^whatsapp:/i, '')
  const fromWa = `whatsapp:${fromE164.startsWith('+') ? fromE164 : `+${fromE164}`}`
  const auth = btoa(`${accountSid}:${authToken}`)

  const params = new URLSearchParams({
    To: `whatsapp:${toE164}`,
    From: fromWa,
    Body: bodyText.slice(0, 1500),
  })
  for (const url of mediaUrls.slice(0, 5)) {
    params.append('MediaUrl', url)
  }

  const res = await fetch(
    `https://api.twilio.com/2010-04-01/Accounts/${accountSid}/Messages.json`,
    {
      method: 'POST',
      headers: {
        Authorization: `Basic ${auth}`,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: params,
    },
  )
  const data = await res.json()
  if (!res.ok) {
    console.warn('Broker WhatsApp failed:', data)
    return { ok: false, error: String(data.message ?? 'WhatsApp send failed') }
  }
  return { ok: true, sid: data.sid }
}

async function checkTwilioVerify(toE164: string, code: string): Promise<boolean | null> {
  const accountSid = Deno.env.get('TWILIO_ACCOUNT_SID')
  const authToken = Deno.env.get('TWILIO_AUTH_TOKEN')
  const verifySid = Deno.env.get('TWILIO_VERIFY_SERVICE_SID') ?? Deno.env.get('VERIFY_SERVICE_SID')
  if (!accountSid || !authToken || !verifySid) return null

  const auth = btoa(`${accountSid}:${authToken}`)
  const body = new URLSearchParams({ To: toE164, Code: code })
  const res = await fetch(
    `https://verify.twilio.com/v2/Services/${verifySid}/VerificationCheck`,
    {
      method: 'POST',
      headers: {
        Authorization: `Basic ${auth}`,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body,
    },
  )
  const data = await res.json()
  if (!res.ok) {
    console.warn('Twilio Verify check failed:', data)
    return null
  }
  return data.status === 'approved'
}

function routePath(url: URL): string[] {
  const parts = url.pathname.split('/').filter(Boolean)
  const idx = parts.indexOf('aegis-employee-claim')
  return idx >= 0 ? parts.slice(idx + 1) : parts
}

async function resolveEmployee(token: string) {
  const admin = getServiceClient()
  const { data, error } = await admin
    .from('portal_employees')
    .select(
      'id, account_id, full_name, whatsapp_number, status, claim_access_token, email, phone, job_title, employee_number, branch_id, id_number',
    )
    .eq('claim_access_token', token)
    .maybeSingle()
  if (error) throw error
  if (!data) throw new Error('Invalid claim QR code')
  if (data.status !== 'active') throw new Error('Employee is inactive')
  return data
}

async function loadVerifiedCallerProfile(employeeId: string, accountId: string) {
  const admin = getServiceClient()
  const [{ data: employee, error: empError }, { data: account }] = await Promise.all([
    admin
      .from('portal_employees')
      .select(
        'id, account_id, full_name, email, phone, whatsapp_number, job_title, employee_number, branch_id, id_number, status',
      )
      .eq('id', employeeId)
      .maybeSingle(),
    admin.from('portal_accounts').select('id, name').eq('id', accountId).maybeSingle(),
  ])
  if (empError) throw empError
  if (!employee) throw new Error('Employee not found')

  let branchName: string | null = null
  if (employee.branch_id) {
    const { data: branchRow } = await admin
      .from('portal_branches')
      .select('id, name')
      .eq('id', employee.branch_id)
      .maybeSingle()
    branchName = branchRow?.name ?? null
  }

  const firstName = String(employee.full_name ?? '').split(/\s+/)[0] || 'there'
  return {
    id: employee.id,
    account_id: employee.account_id,
    full_name: employee.full_name,
    first_name: firstName,
    email: employee.email ?? null,
    phone: employee.phone ?? null,
    whatsapp_number: employee.whatsapp_number,
    job_title: employee.job_title ?? null,
    employee_number: employee.employee_number ?? null,
    branch_id: employee.branch_id ?? null,
    branch_name: branchName,
    company_name: account?.name ?? null,
    id_number: employee.id_number ?? null,
    verified: true as const,
  }
}

async function requireClaimSession(req: Request) {
  const sessionToken = req.headers.get('x-aegis-claim-session')
  if (!sessionToken) throw new Error('Claim session required — verify WhatsApp OTP first')
  const admin = getServiceClient()
  const { data, error } = await admin
    .from('portal_claim_otp_sessions')
    .select('id, employee_id, account_id, expires_at, verified_at, session_token')
    .eq('session_token', sessionToken)
    .maybeSingle()
  if (error) throw error
  if (!data?.verified_at) throw new Error('Claim session not verified')
  if (new Date(data.expires_at).getTime() < Date.now()) throw new Error('Claim session expired')
  return data
}

function extractPlateFromItem(item: {
  name: string
  zoho_fields?: Record<string, unknown> | null
}): string | null {
  const zf = item.zoho_fields ?? {}
  const fromFields = [
    zf.Registration_Number,
    zf.registration_number,
    zf.registrationNumber,
    (zf as { Vehicle?: Record<string, unknown> }).Vehicle?.registrationNumber,
  ]
    .map((v) => (v != null ? normalizePlate(String(v)) : ''))
    .find((v) => v.length >= 5)
  if (fromFields) return fromFields

  const name = String(item.name ?? '')
  const m = name.match(/([A-Z0-9]{2,}\s*[A-Z0-9]{2,}(?:\s*[A-Z]{2})?)\s*$/i)
  if (m?.[1]) {
    const plate = normalizePlate(m[1])
    if (plate.length >= 5 && plate.length <= 12) return plate
  }
  // SA plate glued at end e.g. MJ89RBGP
  const glued = name.match(/([A-Z]{2,3}\d{1,3}[A-Z]{1,3}[A-Z]{2})\s*$/i)
  if (glued?.[1]) return normalizePlate(glued[1])
  const trailing = name.trim().split(/\s+/).pop() ?? ''
  const candidate = normalizePlate(trailing)
  if (candidate.length >= 6 && candidate.length <= 10 && /[A-Z]/.test(candidate) && /\d/.test(candidate)) {
    return candidate
  }
  return null
}

async function findLinkedPolicy(admin: ReturnType<typeof getServiceClient>, accountId: string, riskItemId: string, zohoRiskId: string | null) {
  const { data: policies } = await admin
    .from('portal_policies')
    .select('id, zoho_policy_id, policy_number, insurer, covered_items, section_extensions')
    .eq('account_id', accountId)

  for (const p of policies ?? []) {
    const covered = Array.isArray(p.covered_items) ? p.covered_items : []
    for (const c of covered) {
      if (!c || typeof c !== 'object') continue
      const row = c as Record<string, unknown>
      if (String(row.risk_item_id ?? '') === riskItemId) {
        return {
          policy_id: p.id,
          zoho_policy_id: p.zoho_policy_id,
          policy_number: p.policy_number,
          insurer: p.insurer,
          covered_item: row,
          section_extensions: p.section_extensions,
        }
      }
      if (zohoRiskId && (String(row.zoho_risk_id ?? '') === zohoRiskId || String(row.external_risk_id ?? '') === zohoRiskId)) {
        return {
          policy_id: p.id,
          zoho_policy_id: p.zoho_policy_id,
          policy_number: p.policy_number,
          insurer: p.insurer,
          covered_item: row,
          section_extensions: p.section_extensions,
        }
      }
    }
  }
  // Fallback: first account policy with matching policy_number on risk zoho_fields
  return null
}

function extensionNotesFromItem(opts: {
  item_extensions?: unknown
  covered_item?: Record<string, unknown> | null
  section_extensions?: unknown
}): string[] {
  const notes: string[] = []
  const blobs: unknown[] = []
  if (Array.isArray(opts.item_extensions)) blobs.push(...opts.item_extensions)
  if (Array.isArray(opts.section_extensions)) blobs.push(...opts.section_extensions)
  const covered = opts.covered_item
  if (covered) {
    if (Array.isArray(covered.selected_extensions)) blobs.push(...covered.selected_extensions)
    if (Array.isArray(covered.extensions)) blobs.push(...covered.extensions)
  }

  const haystack = blobs
    .map((b) => {
      if (!b || typeof b !== 'object') return String(b ?? '')
      const o = b as Record<string, unknown>
      return [o.name, o.code, o.notes, o.label, JSON.stringify(o)].filter(Boolean).join(' ')
    })
    .join(' ')
    .toLowerCase()

  if (/car\s*hire|bryte\s*car\s*hire/.test(haystack)) {
    notes.push('Vehicle has Car Hire — may need to be provisioned for the client')
  }
  if (/accommodation|emergency\s*accommodation/.test(haystack)) {
    notes.push('Vehicle / policy has Emergency Accommodation — may need to be provisioned for the client')
  }
  if (/(?:bryte\s*)?assist|roadside|emergency\s*assist/.test(haystack) && !/sasria/.test(haystack)) {
    notes.push('Vehicle has Emergency Assistance / Assist — may need to be provisioned for the client')
  }
  return [...new Set(notes)]
}

async function callVerifyNowDisc(imageBase64: string): Promise<{ registrationNumber?: string; raw?: unknown }> {
  const apiKey =
    Deno.env.get('VERIFYNOW_API_KEY') ||
    'vn_live_654f47c37f1a9e1e2f54e468454066db2361eba6bf92d0a42cd969aa420c6bee'
  const body = {
    bundle: 'vehicle_licence_disc',
    report_type: 'barcode',
    authority_confirmed: true,
    allow_visual_fallback: true,
    mode: Deno.env.get('VERIFYNOW_MODE') === 'sandbox' ? 'sandbox' : 'production',
    image_base64: imageBase64.replace(/^data:[^;]+;base64,/, ''),
  }
  const res = await fetch(`${VERIFYNOW_BASE}/vehicle-licence-disc`, {
    method: 'POST',
    headers: {
      'x-api-key': apiKey,
      'Content-Type': 'application/json',
      'Idempotency-Key': crypto.randomUUID(),
    },
    body: JSON.stringify(body),
  })
  const data = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(data.error || data.message || 'VerifyNow disc scan failed')
  }
  const reg =
    data?.data?.registrationNumber ||
    data?.registrationNumber ||
    data?.data?.Registration_Number
  return { registrationNumber: reg ? String(reg) : undefined, raw: data }
}

async function createZohoClaimBestEffort(payload: Record<string, unknown>): Promise<string | null> {
  try {
    const auth = await getZohoAccessToken()
    if (!auth) return null

    const insertRes = await fetch(`https://${auth.apiDomain}/crm/v2/Claims`, {
      method: 'POST',
      headers: {
        Authorization: `Zoho-oauthtoken ${auth.accessToken}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ data: [payload] }),
    })
    const insertData = await insertRes.json()
    if (!insertRes.ok) {
      console.warn('Zoho Claims insert failed:', insertData)
      return null
    }
    const row = insertData.data?.[0]
    const id = row?.details?.id ?? row?.id
    return id != null ? String(id) : null
  } catch (err) {
    console.warn('Zoho Claims best-effort failed:', err)
    return null
  }
}

async function getZohoAccessToken(): Promise<{ accessToken: string; apiDomain: string } | null> {
  const clientId = Deno.env.get('ZOHO_CLIENT_ID')
  const clientSecret = Deno.env.get('ZOHO_CLIENT_SECRET')
  const refreshToken = Deno.env.get('ZOHO_REFRESH_TOKEN')
  const accountsUrl = Deno.env.get('ZOHO_ACCOUNTS_URL') ?? 'https://accounts.zoho.com'
  const apiDomain = Deno.env.get('ZOHO_API_DOMAIN') ?? 'www.zohoapis.com'
  if (!clientId || !clientSecret || !refreshToken) return null

  const tokenRes = await fetch(
    `${accountsUrl}/oauth/v2/token?${new URLSearchParams({
      refresh_token: refreshToken,
      client_id: clientId,
      client_secret: clientSecret,
      grant_type: 'refresh_token',
    })}`,
    { method: 'POST' },
  )
  const tokenData = await tokenRes.json()
  if (!tokenRes.ok || !tokenData.access_token) {
    console.warn('Zoho token refresh failed for employee claim')
    return null
  }
  return { accessToken: String(tokenData.access_token), apiDomain }
}

async function uploadZohoClaimAttachment(
  recordId: string,
  filename: string,
  bytes: Uint8Array,
  contentType: string,
): Promise<boolean> {
  try {
    const auth = await getZohoAccessToken()
    if (!auth) return false
    const form = new FormData()
    form.append(
      'file',
      new Blob([bytes], { type: contentType }),
      filename,
    )
    const res = await fetch(
      `https://${auth.apiDomain}/crm/v2/Claims/${recordId}/Attachments`,
      {
        method: 'POST',
        headers: { Authorization: `Zoho-oauthtoken ${auth.accessToken}` },
        body: form,
      },
    )
    if (!res.ok) {
      const errBody = await res.text()
      console.warn('Zoho Claims attachment upload failed:', errBody)
      return false
    }
    return true
  } catch (err) {
    console.warn('Zoho Claims attachment upload error:', err)
    return false
  }
}

function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null
}

async function fetchVapiCall(callId: string): Promise<Record<string, unknown> | null> {
  const key = Deno.env.get('VAPI_PRIVATE_KEY')?.trim()
  if (!key) throw new Error('VAPI_PRIVATE_KEY is not configured on the edge function')

  let lastError: unknown = null
  for (let attempt = 0; attempt < 4; attempt += 1) {
    if (attempt > 0) await sleep(1500 * attempt)
    try {
      const res = await fetch(`https://api.vapi.ai/call/${encodeURIComponent(callId)}`, {
        headers: { Authorization: `Bearer ${key}` },
      })
      if (!res.ok) {
        lastError = await res.text()
        continue
      }
      const data = (await res.json()) as Record<string, unknown>
      return data
    } catch (err) {
      lastError = err
    }
  }
  console.warn('Vapi call fetch failed:', lastError)
  return null
}

async function downloadVapiMonoRecording(
  callId: string,
): Promise<{ bytes: Uint8Array; contentType: string; extension: string } | null> {
  const key = Deno.env.get('VAPI_PRIVATE_KEY')?.trim()
  if (!key) return null

  for (let attempt = 0; attempt < 4; attempt += 1) {
    if (attempt > 0) await sleep(1500 * attempt)
    try {
      const res = await fetch(
        `https://api.vapi.ai/call/${encodeURIComponent(callId)}/mono-recording`,
        {
          headers: { Authorization: `Bearer ${key}` },
          redirect: 'follow',
        },
      )
      if (!res.ok) continue
      const contentType = res.headers.get('content-type') || 'audio/wav'
      const buffer = new Uint8Array(await res.arrayBuffer())
      if (buffer.byteLength < 64) continue
      const extension = contentType.includes('mpeg') || contentType.includes('mp3')
        ? 'mp3'
        : contentType.includes('webm')
          ? 'webm'
          : 'wav'
      return { bytes: buffer, contentType, extension }
    } catch (err) {
      console.warn('Vapi mono-recording download attempt failed:', err)
    }
  }
  return null
}

function buildTranscriptFromArtifact(
  call: Record<string, unknown> | null,
  fallback: unknown[],
): string {
  const artifact = isRecord(call?.artifact) ? call.artifact : null
  const direct = artifact && typeof artifact.transcript === 'string' ? artifact.transcript.trim() : ''
  if (direct) return direct

  const messages = Array.isArray(artifact?.messages) ? artifact.messages : []
  const lines: string[] = []
  for (const msg of messages) {
    if (!isRecord(msg)) continue
    const role = String(msg.role ?? 'unknown')
    const text = String(msg.message ?? msg.content ?? msg.transcript ?? '').trim()
    if (!text) continue
    lines.push(`${role}: ${text}`)
  }
  if (lines.length) return lines.join('\n')

  for (const msg of fallback) {
    if (!isRecord(msg)) continue
    const role = String(msg.role ?? 'unknown')
    const text = String(msg.text ?? msg.content ?? '').trim()
    if (!text || text.startsWith('[')) continue
    lines.push(`${role}: ${text}`)
  }
  return lines.join('\n')
}

function extractStructuredClaim(call: Record<string, unknown> | null): Record<string, unknown> {
  const artifact = isRecord(call?.artifact) ? call.artifact : null
  const outputs = isRecord(artifact?.structuredOutputs) ? artifact.structuredOutputs : null
  if (!outputs) return {}

  const preferredId = Deno.env.get('VAPI_CLAIM_STRUCTURED_OUTPUT_ID')?.trim()
  if (preferredId && isRecord(outputs[preferredId])) {
    const result = outputs[preferredId].result
    if (isRecord(result)) return result
  }

  for (const value of Object.values(outputs)) {
    if (!isRecord(value)) continue
    const name = String(value.name ?? '').toLowerCase()
    const result = value.result
    if (!isRecord(result)) continue
    if (name.includes('claim') || name.includes('aegis') || result.title != null) {
      return result
    }
  }

  const first = Object.values(outputs)[0]
  if (isRecord(first) && isRecord(first.result)) return first.result
  return {}
}

function normalizeMatchText(value: string): string {
  return value.toUpperCase().replace(/[^A-Z0-9]/g, '')
}

async function matchEmployeeRiskItem(
  admin: ReturnType<typeof getServiceClient>,
  accountId: string,
  employeeId: string,
  preferredId: string | null,
  assetHint: string | null,
) {
  if (preferredId) {
    const { data } = await admin
      .from('portal_risk_items')
      .select('id, name, category, branch, zoho_risk_id, item_extensions, zoho_fields, employee_id')
      .eq('id', preferredId)
      .eq('account_id', accountId)
      .maybeSingle()
    if (data && (!data.employee_id || data.employee_id === employeeId)) return data
  }

  const { data: items } = await admin
    .from('portal_risk_items')
    .select('id, name, category, branch, zoho_risk_id, item_extensions, zoho_fields, employee_id, asset_tag')
    .eq('account_id', accountId)
    .eq('employee_id', employeeId)

  if (!items?.length) return null
  if (!assetHint?.trim()) return items.length === 1 ? items[0] : null

  const hint = normalizeMatchText(assetHint)
  for (const item of items) {
    const plate = extractPlateFromItem({
      name: String(item.name ?? ''),
      zoho_fields: (item.zoho_fields as Record<string, unknown>) ?? {},
    })
    const candidates = [
      String(item.name ?? ''),
      String(item.asset_tag ?? ''),
      plate ?? '',
    ].map(normalizeMatchText)
    if (candidates.some((c) => c && (c.includes(hint) || hint.includes(c)))) {
      return item
    }
  }
  return null
}

async function storeVapiArtifacts(opts: {
  admin: ReturnType<typeof getServiceClient>
  accountId: string
  employeeId: string
  callId: string
  recording: { bytes: Uint8Array; contentType: string; extension: string } | null
  transcript: string
}): Promise<{ recordingPath: string | null; transcriptPath: string | null }> {
  const base = `${opts.accountId}/employee-claims/${opts.employeeId}/vapi-${opts.callId}`
  let recordingPath: string | null = null
  let transcriptPath: string | null = null

  if (opts.recording) {
    recordingPath = `${base}/recording.${opts.recording.extension}`
    const { error } = await opts.admin.storage
      .from('claim-attachments')
      .upload(recordingPath, opts.recording.bytes, {
        contentType: opts.recording.contentType,
        upsert: true,
      })
    if (error) {
      console.warn('Failed to store Vapi recording:', error)
      recordingPath = null
    }
  }

  if (opts.transcript.trim()) {
    transcriptPath = `${base}/transcript.txt`
    const bytes = new TextEncoder().encode(opts.transcript)
    const { error } = await opts.admin.storage
      .from('claim-attachments')
      .upload(transcriptPath, bytes, {
        contentType: 'text/plain; charset=utf-8',
        upsert: true,
      })
    if (error) {
      console.warn('Failed to store Vapi transcript file:', error)
      transcriptPath = null
    }
  }

  return { recordingPath, transcriptPath }
}

async function signAttachmentUrls(
  admin: ReturnType<typeof getServiceClient>,
  paths: string[],
): Promise<string[]> {
  const urls: string[] = []
  const sevenDays = 60 * 60 * 24 * 7
  for (const path of paths) {
    if (!path) continue
    if (/^https?:\/\//i.test(path)) {
      urls.push(path)
      continue
    }
    const { data, error } = await admin.storage
      .from('claim-attachments')
      .createSignedUrl(path, sevenDays)
    if (!error && data?.signedUrl) urls.push(data.signedUrl)
  }
  return urls
}

function serializeItem(row: Record<string, unknown>) {
  return {
    id: row.id,
    name: row.name,
    category: row.category,
    branch: row.branch,
    branch_id: row.branch_id,
    zoho_risk_id: row.zoho_risk_id,
    asset_tag: row.asset_tag,
    registration_hint: extractPlateFromItem({
      name: String(row.name ?? ''),
      zoho_fields: (row.zoho_fields as Record<string, unknown>) ?? {},
    }),
  }
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })

  try {
    const segments = routePath(new URL(req.url))
    const action = segments[0] ?? ''

    // GET /resolve/:token
    if (req.method === 'GET' && action === 'resolve' && segments[1]) {
      const emp = await resolveEmployee(segments[1])
      return json({
        ok: true,
        employee: {
          first_name: String(emp.full_name).split(/\s+/)[0],
          whatsapp_masked: maskWa(emp.whatsapp_number),
        },
      })
    }

    // POST /otp/send { token }
    if (req.method === 'POST' && action === 'otp' && segments[1] === 'send') {
      const body = await req.json()
      const token = String(body.token ?? '')
      if (!token) throw new Error('token is required')
      const emp = await resolveEmployee(token)
      const wa = normalizeWa(emp.whatsapp_number)
      const code = randomOtp()
      const codeHash = await sha256Hex(code)
      const expiresAt = new Date(Date.now() + 10 * 60 * 1000).toISOString()

      const sendResult = await sendWhatsAppOtp(wa, code)
      const usingTwilioVerify = sendResult.channel === 'twilio_verify_whatsapp'

      const admin = getServiceClient()
      await admin.from('portal_claim_otp_sessions').insert({
        employee_id: emp.id,
        account_id: emp.account_id,
        whatsapp_number: wa,
        code_hash: usingTwilioVerify ? await sha256Hex(`verify:${wa}`) : codeHash,
        expires_at: expiresAt,
      })

      const payload: Record<string, unknown> = {
        ok: true,
        whatsapp_masked: maskWa(wa),
        expires_in_seconds: 600,
        channel: sendResult.channel,
      }
      if (sendResult.channel === 'dev_log') {
        payload.dev_code = code
      }
      return json(payload)
    }

    // POST /otp/verify { token, code }
    if (req.method === 'POST' && action === 'otp' && segments[1] === 'verify') {
      const body = await req.json()
      const token = String(body.token ?? '')
      const code = String(body.code ?? '').trim()
      if (!token || !code) throw new Error('token and code are required')
      const emp = await resolveEmployee(token)
      const wa = normalizeWa(emp.whatsapp_number)

      const admin = getServiceClient()
      const { data: session, error } = await admin
        .from('portal_claim_otp_sessions')
        .select('*')
        .eq('employee_id', emp.id)
        .is('verified_at', null)
        .gt('expires_at', new Date().toISOString())
        .order('created_at', { ascending: false })
        .limit(1)
        .maybeSingle()
      if (error) throw error
      if (!session) throw new Error('No active OTP — request a new code')
      if (session.attempts >= 5) throw new Error('Too many attempts — request a new code')

      let ok = false
      const verifyPlaceholder = await sha256Hex(`verify:${wa}`)
      if (session.code_hash === verifyPlaceholder) {
        ok = (await checkTwilioVerify(wa, code)) === true
      } else {
        ok = (await sha256Hex(code)) === session.code_hash
      }

      await admin
        .from('portal_claim_otp_sessions')
        .update({ attempts: session.attempts + 1 })
        .eq('id', session.id)

      if (!ok) throw new Error('Invalid verification code')

      const sessionToken = randomSessionToken()
      const sessionExpires = new Date(Date.now() + 2 * 60 * 60 * 1000).toISOString()
      await admin
        .from('portal_claim_otp_sessions')
        .update({
          verified_at: new Date().toISOString(),
          session_token: sessionToken,
          expires_at: sessionExpires,
        })
        .eq('id', session.id)

      const caller = await loadVerifiedCallerProfile(emp.id, emp.account_id)

      return json({
        ok: true,
        session_token: sessionToken,
        expires_at: sessionExpires,
        employee: caller,
      })
    }

    // GET /profile — verified staff member for the active claim session (used by Vapi caller context)
    if (req.method === 'GET' && action === 'profile') {
      const session = await requireClaimSession(req)
      const employee = await loadVerifiedCallerProfile(session.employee_id, session.account_id)
      return json({ ok: true, employee })
    }

    // GET|POST /items — risk items for the verified employee
    if ((req.method === 'GET' || req.method === 'POST') && action === 'items') {
      const session = await requireClaimSession(req)
      const admin = getServiceClient()
      const { data: items, error } = await admin
        .from('portal_risk_items')
        .select('id, name, category, branch, branch_id, zoho_risk_id, asset_tag, zoho_fields, item_extensions')
        .eq('account_id', session.account_id)
        .eq('employee_id', session.employee_id)
        .order('category', { ascending: true })
        .order('name', { ascending: true })
      if (error) throw error
      return json({
        ok: true,
        items: (items ?? []).map((row) => serializeItem(row as Record<string, unknown>)),
      })
    }

    // POST /match-vehicle — plate text and/or licence disc image → matched item + policy
    if (req.method === 'POST' && action === 'match-vehicle') {
      const session = await requireClaimSession(req)
      const body = await req.json()
      let plateText = String(body.plate_text ?? body.registration_number ?? '').trim()
      const imageBase64 = body.image_base64 ? String(body.image_base64) : ''
      let verifynow: unknown = null

      if (!plateText && imageBase64) {
        const disc = await callVerifyNowDisc(imageBase64)
        verifynow = disc.raw
        if (disc.registrationNumber) plateText = disc.registrationNumber
      }
      if (!plateText) throw new Error('Provide plate_text or a licence disc image')

      const needle = normalizePlate(plateText)
      const admin = getServiceClient()
      const { data: candidates, error } = await admin
        .from('portal_risk_items')
        .select('id, name, category, branch, branch_id, zoho_risk_id, asset_tag, zoho_fields, item_extensions, employee_id')
        .eq('account_id', session.account_id)
      if (error) throw error

      type Cand = (typeof candidates extends (infer T)[] | null ? T : never) & Record<string, unknown>
      let matched: Cand | null = null
      for (const row of (candidates ?? []) as Cand[]) {
        const plate = extractPlateFromItem({
          name: String(row.name ?? ''),
          zoho_fields: (row.zoho_fields as Record<string, unknown>) ?? {},
        })
        if (plate && plate === needle) {
          matched = row
          break
        }
        if (normalizePlate(String(row.name ?? '')).includes(needle) && needle.length >= 6) {
          matched = row
          break
        }
      }

      if (!matched) {
        return json({
          ok: true,
          matched: false,
          plate: plateText,
          registration_normalized: needle,
          verifynow,
          item: null,
          policy: null,
        })
      }

      const policy = await findLinkedPolicy(
        admin,
        session.account_id,
        String(matched.id),
        matched.zoho_risk_id ? String(matched.zoho_risk_id) : null,
      )

      return json({
        ok: true,
        matched: true,
        plate: plateText,
        registration_normalized: needle,
        verifynow,
        item: serializeItem(matched as Record<string, unknown>),
        policy: policy
          ? {
              policy_id: policy.policy_id,
              zoho_policy_id: policy.zoho_policy_id,
              policy_number: policy.policy_number,
              insurer: policy.insurer,
            }
          : null,
        extension_notes: extensionNotesFromItem({
          item_extensions: matched.item_extensions,
          covered_item: policy?.covered_item ?? null,
          section_extensions: policy?.section_extensions,
        }),
      })
    }

    // POST /submit — claim form after OTP
    if (req.method === 'POST' && action === 'submit') {
      const session = await requireClaimSession(req)
      const body = await req.json()
      const title = String(body.title ?? '').trim()
      const description = String(body.description ?? '').trim()
      if (!title) throw new Error('title is required')

      const riskItemId = body.risk_item_id ? String(body.risk_item_id) : null
      if (!riskItemId) throw new Error('risk_item_id is required — select an item to claim against')

      const latitude = body.latitude != null ? Number(body.latitude) : null
      const longitude = body.longitude != null ? Number(body.longitude) : null
      const location_accuracy = body.location_accuracy != null ? Number(body.location_accuracy) : null
      const photo_meta = Array.isArray(body.photo_meta) ? body.photo_meta : []
      const attachments = Array.isArray(body.attachments) ? body.attachments.map(String) : []
      const voice_note_url = body.voice_note_url ? String(body.voice_note_url) : null
      const claim_amount = body.claim_amount != null ? Number(body.claim_amount) : null
      const roadside_needed = body.roadside_needed === true
      const roadside_call_preference =
        body.roadside_call_preference === 'self' || body.roadside_call_preference === 'broker'
          ? body.roadside_call_preference
          : null
      const roadside_provider =
        body.roadside_provider && typeof body.roadside_provider === 'object'
          ? body.roadside_provider
          : null
      const vapiCallId = body.vapi_call_id ? String(body.vapi_call_id) : null
      const vapiTranscript = body.vapi_transcript ? String(body.vapi_transcript) : null
      const vapiRecordingPath = body.vapi_recording_path
        ? String(body.vapi_recording_path)
        : voice_note_url
      const vapiTranscriptPath = body.vapi_transcript_path
        ? String(body.vapi_transcript_path)
        : null
      const submittedVia = body.submitted_via === 'employee_vapi' ? 'employee_vapi' : 'employee_qr'

      const attachmentSet = new Set<string>(attachments)
      if (vapiRecordingPath) attachmentSet.add(vapiRecordingPath)
      if (vapiTranscriptPath) attachmentSet.add(vapiTranscriptPath)
      const mergedAttachments = [...attachmentSet]
      const admin = getServiceClient()

      if (vapiCallId) {
        const { data: existing } = await admin
          .from('portal_claims')
          .select(
            'id, title, status, created_at, zoho_claim_id, risk_item_id, zoho_policy_id, vapi_call_id',
          )
          .eq('vapi_call_id', vapiCallId)
          .maybeSingle()
        if (existing) {
          return json({ ok: true, claim: existing, status: 'submitted', duplicate: true })
        }
      }

      const { data: risk, error: riskErr } = await admin
        .from('portal_risk_items')
        .select('id, name, category, branch, zoho_risk_id, item_extensions, zoho_fields, employee_id')
        .eq('id', riskItemId)
        .eq('account_id', session.account_id)
        .maybeSingle()
      if (riskErr) throw riskErr
      if (!risk) throw new Error('Risk item not found for this account')

      const policy =
        (await findLinkedPolicy(
          admin,
          session.account_id,
          risk.id,
          risk.zoho_risk_id ? String(risk.zoho_risk_id) : null,
        )) ?? null

      let zohoPolicyId = body.zoho_policy_id ? String(body.zoho_policy_id) : policy?.zoho_policy_id ?? null

      const extNotes = extensionNotesFromItem({
        item_extensions: risk.item_extensions,
        covered_item: policy?.covered_item ?? null,
        section_extensions: policy?.section_extensions,
      })

      const userBroker = body.broker_message ? String(body.broker_message).trim() : ''
      const brokerParts = [userBroker, ...extNotes].filter(Boolean)
      const broker_message = brokerParts.join('\n') || null

      const { data: employee } = await admin
        .from('portal_employees')
        .select('id, full_name, whatsapp_number, email, job_title')
        .eq('id', session.employee_id)
        .maybeSingle()

      let zohoClaimId: string | null = null
      if (zohoPolicyId) {
        zohoClaimId = await createZohoClaimBestEffort({
          Name: title,
          Claim_Status: 'Submitted',
          Client_Name: zohoPolicyId,
          Claim_Address: [
            description,
            `Risk item: ${risk.name} (${risk.category})`,
            risk.zoho_risk_id ? `Zoho risk: ${risk.zoho_risk_id}` : '',
            employee?.full_name ? `Employee: ${employee.full_name}` : '',
            broker_message ? `Broker notes:\n${broker_message}` : '',
            vapiCallId ? `Vapi call: ${vapiCallId}` : '',
          ]
            .filter(Boolean)
            .join('\n'),
        })
      }

      const { data: claim, error } = await admin
        .from('portal_claims')
        .insert({
          account_id: session.account_id,
          employee_id: session.employee_id,
          risk_item_id: risk.id,
          zoho_policy_id: zohoPolicyId,
          zoho_claim_id: zohoClaimId,
          title,
          description,
          status: 'Submitted',
          attachments: mergedAttachments,
          voice_note_url: vapiRecordingPath ?? voice_note_url,
          claim_amount: Number.isFinite(claim_amount as number) ? claim_amount : null,
          latitude,
          longitude,
          location_accuracy,
          photo_meta,
          submitted_via: submittedVia,
          broker_message,
          roadside_needed,
          roadside_call_preference: roadside_needed ? roadside_call_preference : null,
          roadside_provider:
            roadside_needed && roadside_call_preference === 'broker' ? roadside_provider : null,
          vapi_call_id: vapiCallId,
          vapi_transcript: vapiTranscript,
          vapi_recording_path: vapiRecordingPath,
        })
        .select(
          'id, title, status, created_at, zoho_claim_id, risk_item_id, zoho_policy_id, vapi_call_id, vapi_recording_path',
        )
        .single()
      if (error) throw error

      if (zohoClaimId) {
        if (vapiRecordingPath) {
          const { data: recFile } = await admin.storage
            .from('claim-attachments')
            .download(vapiRecordingPath)
          if (recFile) {
            const bytes = new Uint8Array(await recFile.arrayBuffer())
            const ext = vapiRecordingPath.split('.').pop() || 'wav'
            await uploadZohoClaimAttachment(
              zohoClaimId,
              `vapi-recording.${ext}`,
              bytes,
              recFile.type || 'audio/wav',
            )
          }
        }
        if (vapiTranscript || vapiTranscriptPath) {
          let transcriptBytes: Uint8Array | null = null
          if (vapiTranscriptPath) {
            const { data: txtFile } = await admin.storage
              .from('claim-attachments')
              .download(vapiTranscriptPath)
            if (txtFile) transcriptBytes = new Uint8Array(await txtFile.arrayBuffer())
          }
          if (!transcriptBytes && vapiTranscript) {
            transcriptBytes = new TextEncoder().encode(vapiTranscript)
          }
          if (transcriptBytes) {
            await uploadZohoClaimAttachment(
              zohoClaimId,
              'vapi-transcript.txt',
              transcriptBytes,
              'text/plain; charset=utf-8',
            )
          }
        }
      }

      const signedUrls = await signAttachmentUrls(admin, [
        ...mergedAttachments,
        ...(vapiRecordingPath ? [vapiRecordingPath] : []),
        ...(voice_note_url ? [voice_note_url] : []),
      ])

      const locationLine =
        latitude != null && longitude != null
          ? `${latitude.toFixed(5)}, ${longitude.toFixed(5)}${location_accuracy != null ? ` (±${Math.round(location_accuracy)}m)` : ''}`
          : 'Not captured'

      const roadsideLine = roadside_needed
        ? `Yes — preference: ${roadside_call_preference ?? 'unspecified'}${
            roadside_provider && typeof roadside_provider === 'object' && 'name' in roadside_provider
              ? ` · provider: ${(roadside_provider as { name?: string }).name}`
              : ''
          }`
        : 'No'

      const waBody = [
        submittedVia === 'employee_vapi'
          ? 'Aegis employee voice claim submitted'
          : 'Aegis employee claim submitted',
        `Employee: ${employee?.full_name ?? session.employee_id}`,
        employee?.whatsapp_number ? `Employee WA: ${employee.whatsapp_number}` : null,
        `Item: ${risk.name} (${risk.category})`,
        risk.branch ? `Branch: ${risk.branch}` : null,
        zohoPolicyId
          ? `Policy: ${policy?.policy_number ?? zohoPolicyId}${policy?.insurer ? ` · ${policy.insurer}` : ''}`
          : 'Policy: (not linked)',
        `Title: ${title}`,
        description ? `Details: ${description}` : null,
        `Location: ${locationLine}`,
        `Roadside: ${roadsideLine}`,
        vapiCallId ? `Vapi call: ${vapiCallId}` : null,
        broker_message ? `Extension / broker notes:\n${broker_message}` : null,
        signedUrls.length ? `Attachments:\n${signedUrls.map((u, i) => `${i + 1}. ${u}`).join('\n')}` : null,
        `Claim id: ${claim.id}`,
      ]
        .filter(Boolean)
        .join('\n')

      const waResult = await sendBrokerWhatsApp(
        waBody,
        signedUrls.filter(
          (u) => /\.(jpe?g|png|gif|webp)(\?|$)/i.test(u) || u.includes('claim-attachments'),
        ),
      )

      return json({
        ok: true,
        status: 'submitted',
        claim,
        extension_notes: extNotes,
        broker_whatsapp: waResult,
      })
    }

    // POST /vapi/complete — finish voice claim from Vapi call id
    if (req.method === 'POST' && action === 'vapi' && segments[1] === 'complete') {
      const session = await requireClaimSession(req)
      const body = await req.json()
      const callId = String(body.vapi_call_id ?? '').trim()
      if (!callId) throw new Error('vapi_call_id is required')

      const admin = getServiceClient()
      const { data: existing } = await admin
        .from('portal_claims')
        .select(
          'id, title, status, created_at, zoho_claim_id, risk_item_id, zoho_policy_id, vapi_call_id',
        )
        .eq('vapi_call_id', callId)
        .maybeSingle()
      if (existing) {
        return json({ ok: true, status: 'submitted', claim: existing, duplicate: true })
      }

      const call = await fetchVapiCall(callId)
      const structured = extractStructuredClaim(call)
      const fallbackMessages = Array.isArray(body.transcript_fallback)
        ? body.transcript_fallback
        : []
      const transcript = buildTranscriptFromArtifact(call, fallbackMessages)
      const recording = await downloadVapiMonoRecording(callId)
      const stored = await storeVapiArtifacts({
        admin,
        accountId: session.account_id,
        employeeId: session.employee_id,
        callId,
        recording,
        transcript,
      })

      const title = String(structured.title ?? '').trim()
      const description = String(structured.description ?? '').trim()
      const assetHint = String(structured.asset_name_or_plate ?? '').trim() || null
      const preferredRiskId = body.risk_item_id ? String(body.risk_item_id) : null
      const claimAmount =
        structured.claim_amount != null && Number.isFinite(Number(structured.claim_amount))
          ? Number(structured.claim_amount)
          : null
      const brokerMessage = String(structured.broker_message ?? '').trim()
      const roadsideNeeded = structured.roadside_needed === true
      const readyToSubmit = structured.ready_to_submit !== false

      const risk = await matchEmployeeRiskItem(
        admin,
        session.account_id,
        session.employee_id,
        preferredRiskId,
        assetHint,
      )

      const draft = {
        title: title || (assetHint ? `Claim — ${assetHint}` : ''),
        description:
          description ||
          (transcript
            ? `Voice claim transcript summary:\n${transcript.slice(0, 1500)}`
            : ''),
        broker_message: brokerMessage || null,
        claim_amount: claimAmount,
        roadside_needed: roadsideNeeded,
        risk_item_id: risk?.id ?? preferredRiskId,
        asset_name_or_plate: assetHint,
        ready_to_submit: readyToSubmit,
      }

      const canSubmit = Boolean(draft.title && risk?.id && readyToSubmit)
      if (!canSubmit) {
        return json({
          ok: true,
          status: 'needs_review',
          draft,
          vapi_call_id: callId,
          vapi_recording_path: stored.recordingPath,
          vapi_transcript_path: stored.transcriptPath,
          vapi_transcript: transcript || null,
          recording_ready: Boolean(stored.recordingPath),
        })
      }

      const latitude = body.latitude != null ? Number(body.latitude) : null
      const longitude = body.longitude != null ? Number(body.longitude) : null
      const location_accuracy =
        body.location_accuracy != null ? Number(body.location_accuracy) : null

      const policy =
        (await findLinkedPolicy(
          admin,
          session.account_id,
          risk!.id,
          risk!.zoho_risk_id ? String(risk!.zoho_risk_id) : null,
        )) ?? null
      const zohoPolicyId = policy?.zoho_policy_id ?? null
      const extNotes = extensionNotesFromItem({
        item_extensions: risk!.item_extensions,
        covered_item: policy?.covered_item ?? null,
        section_extensions: policy?.section_extensions,
      })
      const broker_message = [brokerMessage, ...extNotes].filter(Boolean).join('\n') || null

      const { data: employee } = await admin
        .from('portal_employees')
        .select('id, full_name, whatsapp_number, email, job_title')
        .eq('id', session.employee_id)
        .maybeSingle()

      let zohoClaimId: string | null = null
      if (zohoPolicyId) {
        zohoClaimId = await createZohoClaimBestEffort({
          Name: draft.title,
          Claim_Status: 'Submitted',
          Client_Name: zohoPolicyId,
          Claim_Address: [
            draft.description,
            `Risk item: ${risk!.name} (${risk!.category})`,
            risk!.zoho_risk_id ? `Zoho risk: ${risk!.zoho_risk_id}` : '',
            employee?.full_name ? `Employee: ${employee.full_name}` : '',
            broker_message ? `Broker notes:\n${broker_message}` : '',
            `Vapi call: ${callId}`,
          ]
            .filter(Boolean)
            .join('\n'),
        })
      }

      const attachments = [stored.recordingPath, stored.transcriptPath].filter(
        Boolean,
      ) as string[]
      const { data: claim, error } = await admin
        .from('portal_claims')
        .insert({
          account_id: session.account_id,
          employee_id: session.employee_id,
          risk_item_id: risk!.id,
          zoho_policy_id: zohoPolicyId,
          zoho_claim_id: zohoClaimId,
          title: draft.title,
          description: draft.description,
          status: 'Submitted',
          attachments,
          voice_note_url: stored.recordingPath,
          claim_amount: claimAmount,
          latitude,
          longitude,
          location_accuracy,
          photo_meta: [],
          submitted_via: 'employee_vapi',
          broker_message,
          roadside_needed: roadsideNeeded,
          roadside_call_preference: null,
          roadside_provider: null,
          vapi_call_id: callId,
          vapi_transcript: transcript || null,
          vapi_recording_path: stored.recordingPath,
        })
        .select(
          'id, title, status, created_at, zoho_claim_id, risk_item_id, zoho_policy_id, vapi_call_id, vapi_recording_path',
        )
        .single()
      if (error) throw error

      if (zohoClaimId) {
        if (recording && stored.recordingPath) {
          await uploadZohoClaimAttachment(
            zohoClaimId,
            `vapi-recording.${recording.extension}`,
            recording.bytes,
            recording.contentType,
          )
        }
        if (transcript) {
          await uploadZohoClaimAttachment(
            zohoClaimId,
            'vapi-transcript.txt',
            new TextEncoder().encode(transcript),
            'text/plain; charset=utf-8',
          )
        }
      }

      const signedUrls = await signAttachmentUrls(admin, attachments)
      const waBody = [
        'Aegis employee voice claim submitted',
        `Employee: ${employee?.full_name ?? session.employee_id}`,
        `Item: ${risk!.name} (${risk!.category})`,
        `Title: ${draft.title}`,
        draft.description ? `Details: ${draft.description}` : null,
        `Vapi call: ${callId}`,
        `Claim id: ${claim.id}`,
        signedUrls.length ? `Recording/transcript:\n${signedUrls.join('\n')}` : null,
      ]
        .filter(Boolean)
        .join('\n')
      const waResult = await sendBrokerWhatsApp(waBody, [])

      return json({
        ok: true,
        status: 'submitted',
        claim,
        broker_whatsapp: waResult,
        vapi_recording_path: stored.recordingPath,
        vapi_transcript_path: stored.transcriptPath,
      })
    }

    // POST /upload-url — signed upload path for photos/voice
    if (req.method === 'POST' && action === 'upload-url') {
      const session = await requireClaimSession(req)
      const body = await req.json()
      const filename = String(body.filename ?? `file-${Date.now()}`)
      const contentType = String(body.contentType ?? 'application/octet-stream')
      const path = `${session.account_id}/employee-claims/${session.employee_id}/${Date.now()}-${filename}`
      const admin = getServiceClient()
      const { data, error } = await admin.storage
        .from('claim-attachments')
        .createSignedUploadUrl(path)
      if (error) throw error
      return json({
        ok: true,
        path,
        token: data.token,
        signedUrl: data.signedUrl,
        contentType,
      })
    }

    return json({ ok: false, error: 'Not found' }, 404)
  } catch (err) {
    console.error('aegis-employee-claim:', err)
    return json(
      { ok: false, error: err instanceof Error ? err.message : 'Unexpected error' },
      400,
    )
  }
})
