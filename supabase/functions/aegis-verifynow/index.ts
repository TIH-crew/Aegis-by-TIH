/**
 * Proxy for VerifyNow.co.za external API.
 * Keeps the API key server-side. Auth: portal user JWT.
 */
import { createClient } from 'jsr:@supabase/supabase-js@2'

const VERIFYNOW_BASE = 'https://www.verifynow.co.za/api/external'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
}

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}

function apiKey() {
  return (
    Deno.env.get('VERIFYNOW_API_KEY') ||
    // Temporary fallback until secrets are rotated in the dashboard.
    'vn_live_654f47c37f1a9e1e2f54e468454066db2361eba6bf92d0a42cd969aa420c6bee'
  )
}

async function requirePortalUser(req: Request) {
  const authHeader = req.headers.get('Authorization')
  if (!authHeader?.startsWith('Bearer ')) throw new Error('Unauthorized')

  const url = Deno.env.get('SUPABASE_URL')!
  const anonKey = Deno.env.get('SUPABASE_ANON_KEY')!
  const userClient = createClient(url, anonKey, {
    global: { headers: { Authorization: authHeader } },
  })

  const {
    data: { user },
    error,
  } = await userClient.auth.getUser()
  if (error || !user) throw new Error('Unauthorized')
  return user
}

async function callVerifyNow(path: string, body: Record<string, unknown>, idempotencyKey: string) {
  const response = await fetch(`${VERIFYNOW_BASE}${path}`, {
    method: 'POST',
    headers: {
      'x-api-key': apiKey(),
      'Content-Type': 'application/json',
      'Idempotency-Key': idempotencyKey,
    },
    body: JSON.stringify(body),
  })

  const data = await response.json().catch(() => ({ error: 'Invalid VerifyNow response' }))
  return { ok: response.ok, status: response.status, data }
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })

  try {
    await requirePortalUser(req)

    const url = new URL(req.url)
    const path = url.pathname.replace(/^\/aegis-verifynow\/?/, '').replace(/^\//, '')

    if (req.method === 'GET' && (path === 'health' || path === '')) {
      const res = await fetch(`${VERIFYNOW_BASE}/health`)
      const data = await res.json().catch(() => ({}))
      return json({ ok: res.ok, verifynow: data })
    }

    if (req.method !== 'POST') return json({ error: 'Method not allowed' }, 405)

    const payload = (await req.json()) as Record<string, unknown>
    const idempotencyKey =
      (typeof payload.idempotencyKey === 'string' && payload.idempotencyKey) ||
      crypto.randomUUID()
    const mode = payload.mode === 'sandbox' ? 'sandbox' : 'production'

    if (path === 'drivers-licence') {
      const imageBase64 = payload.image_base64 ?? payload.imageBase64
      const barcodeBase64 = payload.barcode_base64 ?? payload.barcodeBase64
      if (!imageBase64 && !barcodeBase64) {
        return json({ error: 'Provide image_base64 (back of licence) or barcode_base64' }, 400)
      }
      const body: Record<string, unknown> = {
        bundle: 'drivers_licence_barcode',
        authority_confirmed: true,
        mode,
      }
      if (imageBase64) body.image_base64 = String(imageBase64).replace(/^data:[^;]+;base64,/, '')
      if (barcodeBase64) body.barcode_base64 = String(barcodeBase64).replace(/^data:[^;]+;base64,/, '')

      const result = await callVerifyNow('/drivers-licence', body, idempotencyKey)
      return json(result.data, result.ok ? 200 : result.status)
    }

    if (path === 'vehicle-licence-disc') {
      const imageBase64 = payload.image_base64 ?? payload.imageBase64
      const barcodeText = payload.barcode_text ?? payload.barcodeText
      if (!imageBase64 && !barcodeText) {
        return json({ error: 'Provide image_base64 (disc photo) or barcode_text' }, 400)
      }
      const reportType = payload.report_type === 'plate' ? 'plate' : 'barcode'
      const body: Record<string, unknown> = {
        bundle: 'vehicle_licence_disc',
        report_type: reportType,
        authority_confirmed: true,
        allow_visual_fallback: payload.allow_visual_fallback !== false,
        mode,
      }
      if (imageBase64) body.image_base64 = String(imageBase64).replace(/^data:[^;]+;base64,/, '')
      if (barcodeText) body.barcode_text = String(barcodeText)

      const result = await callVerifyNow('/vehicle-licence-disc', body, idempotencyKey)
      return json(result.data, result.ok ? 200 : result.status)
    }

    if (path === 'vehicle' || path === 'number-plate') {
      const registrationNumber = String(
        payload.registrationNumber ?? payload.registration_number ?? '',
      ).trim()
      if (!registrationNumber) {
        return json({ error: 'registrationNumber is required' }, 400)
      }
      const body = {
        bundle: 'vehicle_lookup',
        registrationNumber,
        mode,
      }
      const result = await callVerifyNow('/vehicle', body, idempotencyKey)
      return json(result.data, result.ok ? 200 : result.status)
    }

    return json({ error: `Unknown path: ${path || '(root)'}` }, 404)
  } catch (err) {
    const message = err instanceof Error ? err.message : 'VerifyNow proxy failed'
    const status = message === 'Unauthorized' ? 401 : 500
    return json({ error: message }, status)
  }
})
