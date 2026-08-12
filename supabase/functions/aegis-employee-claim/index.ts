import { createClient } from 'jsr:@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers':
    'authorization, x-client-info, apikey, content-type, x-aegis-claim-session',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
}

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
    // SA local → E.164
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

  // Preferred: Twilio Verify WhatsApp
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
      // Fall through to messaging API / custom
      console.warn('Twilio Verify WhatsApp failed:', data)
    } else {
      return { channel: 'twilio_verify_whatsapp', sid: data.sid }
    }
  }

  // Fallback: Programmable Messaging WhatsApp template/body
  const fromWa = Deno.env.get('TWILIO_WHATSAPP_FROM') // e.g. whatsapp:+14155238886
  if (accountSid && authToken && fromWa) {
    const auth = btoa(`${accountSid}:${authToken}`)
    const body = new URLSearchParams({
      To: `whatsapp:${toE164}`,
      From: fromWa.startsWith('whatsapp:') ? fromWa : `whatsapp:${fromWa}`,
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
    if (!res.ok) throw new Error(data.message ?? 'Failed to send WhatsApp OTP')
    return { channel: 'twilio_whatsapp_message', sid: data.sid }
  }

  // Dev / misconfigured: still store OTP so flow can be tested
  console.warn('No Twilio WhatsApp config — OTP stored only (dev mode)')
  return { channel: 'dev_log' }
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
    .select('id, account_id, full_name, whatsapp_number, status, claim_access_token')
    .eq('claim_access_token', token)
    .maybeSingle()
  if (error) throw error
  if (!data) throw new Error('Invalid claim QR code')
  if (data.status !== 'active') throw new Error('Employee is inactive')
  return data
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
      // If Twilio Verify manages the code, store a placeholder hash (verification via Twilio check)
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
      // Only expose code when Twilio is not configured (local/dev)
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

      return json({
        ok: true,
        session_token: sessionToken,
        expires_at: sessionExpires,
        employee: {
          id: emp.id,
          full_name: emp.full_name,
        },
      })
    }

    // POST /submit — claim form after OTP
    if (req.method === 'POST' && action === 'submit') {
      const session = await requireClaimSession(req)
      const body = await req.json()
      const title = String(body.title ?? '').trim()
      const description = String(body.description ?? '').trim()
      if (!title) throw new Error('title is required')

      const latitude = body.latitude != null ? Number(body.latitude) : null
      const longitude = body.longitude != null ? Number(body.longitude) : null
      const location_accuracy = body.location_accuracy != null ? Number(body.location_accuracy) : null
      const photo_meta = Array.isArray(body.photo_meta) ? body.photo_meta : []
      const attachments = Array.isArray(body.attachments) ? body.attachments : []
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

      const admin = getServiceClient()
      const { data: claim, error } = await admin
        .from('portal_claims')
        .insert({
          account_id: session.account_id,
          employee_id: session.employee_id,
          title,
          description,
          status: 'Submitted',
          attachments,
          voice_note_url,
          claim_amount: Number.isFinite(claim_amount as number) ? claim_amount : null,
          latitude,
          longitude,
          location_accuracy,
          photo_meta,
          submitted_via: 'employee_qr',
          broker_message: body.broker_message ? String(body.broker_message) : null,
          roadside_needed,
          roadside_call_preference: roadside_needed ? roadside_call_preference : null,
          roadside_provider:
            roadside_needed && roadside_call_preference === 'broker' ? roadside_provider : null,
        })
        .select('id, title, status, created_at')
        .single()
      if (error) throw error

      return json({ ok: true, claim })
    }

    // POST /upload-url — signed upload path for photos/voice (optional helper)
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
