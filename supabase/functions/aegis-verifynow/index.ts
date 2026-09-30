/**
 * Proxy for VerifyNow.co.za — drivers licence only.
 * Vehicle disc / number-plate lookup endpoints are retired.
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
  const key = Deno.env.get('VERIFYNOW_API_KEY')
  if (!key) throw new Error('VERIFYNOW_API_KEY is not configured')
  return key
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
      return json({
        ok: true,
        drivers_licence: true,
        vehicle_lookup: false,
        vehicle_licence_disc: false,
      })
    }

    if (req.method !== 'POST') return json({ error: 'Method not allowed' }, 405)

    // Retired — portal no longer offers VerifyNow vehicle validation
    if (
      path === 'vehicle' ||
      path === 'number-plate' ||
      path === 'vehicle-licence-disc'
    ) {
      return json(
        {
          error: 'This endpoint has been retired.',
          message:
            'VerifyNow vehicle disc and number-plate lookup are no longer available. Enter vehicle details manually.',
        },
        410,
      )
    }

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

    return json({ error: `Unknown path: ${path || '(root)'}` }, 404)
  } catch (err) {
    const message = err instanceof Error ? err.message : 'VerifyNow proxy failed'
    const status = message === 'Unauthorized' ? 401 : 500
    return json({ error: message }, status)
  }
})
