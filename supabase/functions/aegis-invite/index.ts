import { createClient } from 'jsr:@supabase/supabase-js@2'
import {
  downloadZohoAccountPhoto,
  fetchZohoAccount,
  mapZohoAccountToProvisionPayload,
  updateZohoAccountAegisStatus,
} from './zoho.ts'
import { syncPortalFromZoho } from './sync-portal.ts'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type, x-aegis-secret',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
}

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}

function requireSecret(req: Request) {
  const expected = Deno.env.get('AEGIS_REQUEST_SECRET')
  if (!expected) {
    console.warn('AEGIS_REQUEST_SECRET is not set — request auth is disabled')
    return true
  }
  const provided = req.headers.get('x-aegis-secret')
  if (!provided || provided !== expected) {
    return false
  }
  return true
}

function getServiceClient() {
  const url = Deno.env.get('SUPABASE_URL')
  const key = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
  if (!url || !key) {
    throw new Error('Supabase service credentials are not configured')
  }
  return createClient(url, key, {
    auth: { autoRefreshToken: false, persistSession: false },
  })
}

async function uploadAccountLogo(
  supabase: ReturnType<typeof createClient>,
  accountId: string,
  zohoAccountId: string,
): Promise<string | null> {
  const blob = await downloadZohoAccountPhoto(zohoAccountId)
  if (!blob) return null

  const ext = blob.type.includes('png')
    ? 'png'
    : blob.type.includes('jpeg') || blob.type.includes('jpg')
      ? 'jpg'
      : blob.type.includes('webp')
        ? 'webp'
        : 'png'

  const path = `${accountId}/logo.${ext}`
  const { error } = await supabase.storage.from('org-logos').upload(path, blob, {
    upsert: true,
    contentType: blob.type || 'image/png',
  })

  if (error) {
    console.warn('Logo upload failed:', error.message)
    return null
  }

  const { data } = supabase.storage.from('org-logos').getPublicUrl(path)
  return data.publicUrl
}

async function sendMagicLinkEmail(email: string, redirectTo: string) {
  const url = Deno.env.get('SUPABASE_URL')
  const key = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
  if (!url || !key) throw new Error('Supabase credentials missing')

  const res = await fetch(`${url}/auth/v1/otp`, {
    method: 'POST',
    headers: {
      apikey: key,
      Authorization: `Bearer ${key}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      email: email.toLowerCase().trim(),
      create_user: true,
      options: { email_redirect_to: redirectTo },
    }),
  })

  if (!res.ok) {
    const data = await res.json().catch(() => ({}))
    throw new Error(data.msg ?? data.error_description ?? 'Failed to send magic link email')
  }
}

async function handleInvite(req: Request) {
  const body = await req.json()

  if (body.action === 'sync_risks') {
    const zohoAccountId = String(body.zoho_account_id ?? '').trim()
    if (!zohoAccountId) {
      return jsonResponse({ ok: false, error: 'zoho_account_id is required' }, 400)
    }

    const supabase = getServiceClient()
    const { data: account, error: accountError } = await supabase
      .from('portal_accounts')
      .select('id')
      .eq('zoho_account_id', zohoAccountId)
      .maybeSingle()

    if (accountError || !account?.id) {
      return jsonResponse({ ok: false, error: 'Portal account not found for this Zoho account' }, 404)
    }

    const synced = await syncPortalFromZoho(supabase, account.id, zohoAccountId)
    return jsonResponse({ ok: true, synced })
  }

  const zohoAccountId = String(body.zoho_account_id ?? '').trim()
  const email = String(body.email ?? '').trim().toLowerCase()
  const role = String(body.role ?? 'owner').trim()
  const invitedByEmail = String(body.invited_by_email ?? '').trim() || null

  if (!zohoAccountId || !email) {
    return jsonResponse({ ok: false, error: 'zoho_account_id and email are required' }, 400)
  }

  if (!['owner', 'admin', 'member'].includes(role)) {
    return jsonResponse({ ok: false, error: 'Invalid role' }, 400)
  }

  const supabase = getServiceClient()
  const zohoAccount = await fetchZohoAccount(zohoAccountId)
  const provisionPayload = mapZohoAccountToProvisionPayload(zohoAccount)

  const { data: accountId, error: provisionError } = await supabase.rpc(
    'provision_portal_account_from_zoho',
    { p_payload: provisionPayload },
  )

  if (provisionError || !accountId) {
    throw new Error(provisionError?.message ?? 'Failed to provision portal account')
  }

  const logoUrl = await uploadAccountLogo(supabase, accountId, zohoAccountId)
  if (logoUrl) {
    await supabase
      .from('portal_accounts')
      .update({ logo_url: logoUrl })
      .eq('id', accountId)
  }

  const { data: inviteId, error: inviteError } = await supabase.rpc('upsert_portal_invite', {
    p_account_id: accountId,
    p_email: email,
    p_role: role,
    p_invited_by_email: invitedByEmail,
    p_zoho_account_id: zohoAccountId,
  })

  if (inviteError) {
    throw new Error(inviteError.message)
  }

  const appUrl = Deno.env.get('AEGIS_APP_URL') ?? 'http://localhost:1420'
  const redirectTo = `${appUrl.replace(/\/$/, '')}/auth/callback`
  await sendMagicLinkEmail(email, redirectTo)

  await updateZohoAccountAegisStatus(zohoAccountId, email).catch((err) => {
    console.warn('Zoho write-back skipped:', err)
  })

  const syncedRisks = await syncPortalFromZoho(supabase, accountId, zohoAccountId).catch((err) => {
    console.warn('Risk sync from Zoho skipped:', err)
    return 0
  })

  return jsonResponse({
    ok: true,
    portal_account_id: accountId,
    invite_id: inviteId,
    account_name: provisionPayload.name,
    email,
    role,
    synced_risks: syncedRisks,
  })
}

async function handleStatus(req: Request) {
  const url = new URL(req.url)
  const zohoAccountId = url.searchParams.get('zoho_account_id')?.trim()
  if (!zohoAccountId) {
    return jsonResponse({ ok: false, error: 'zoho_account_id is required' }, 400)
  }

  const supabase = getServiceClient()
  const { data, error } = await supabase.rpc('get_portal_invite_status', {
    p_zoho_account_id: zohoAccountId,
  })

  if (error) {
    throw new Error(error.message)
  }

  return jsonResponse({ ok: true, status: data })
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    if (!requireSecret(req)) {
      return jsonResponse({ ok: false, error: 'Unauthorized' }, 401)
    }

    if (req.method === 'GET') {
      return await handleStatus(req)
    }

    if (req.method === 'POST') {
      return await handleInvite(req)
    }

    return jsonResponse({ ok: false, error: 'Method not allowed' }, 405)
  } catch (err) {
    console.error('aegis-invite error:', err)
    return jsonResponse(
      { ok: false, error: err instanceof Error ? err.message : 'Internal server error' },
      500,
    )
  }
})
