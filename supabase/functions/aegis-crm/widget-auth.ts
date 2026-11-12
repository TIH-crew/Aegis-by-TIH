import { createClient } from 'jsr:@supabase/supabase-js@2'
import { findZohoUserIdByEmail, zohoGetRecord } from './zoho.ts'

export type WidgetAuthContext = {
  kind: 'widget'
  accountId: string
  zohoAccountId: string
  orgName: string | null
  portalRole: string
  user: { id: string; email?: string }
  sessionId: string
  scopes: string[]
}

function getServiceClient() {
  const url = Deno.env.get('SUPABASE_URL')
  const key = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
  if (!url || !key) throw new Error('Supabase not configured')
  return createClient(url, key, { auth: { autoRefreshToken: false, persistSession: false } })
}

async function sha256Hex(value: string): Promise<string> {
  const data = new TextEncoder().encode(value)
  const hash = await crypto.subtle.digest('SHA-256', data)
  return [...new Uint8Array(hash)].map((b) => b.toString(16).padStart(2, '0')).join('')
}

function brokerDomains(): string[] {
  const raw =
    Deno.env.get('AEGIS_BROKER_EMAIL_DOMAINS') ?? 'theinsurancehub.co.za'
  return raw.split(',').map((d) => d.trim().toLowerCase()).filter(Boolean)
}

function isBrokerDomain(email: string): boolean {
  const at = email.lastIndexOf('@')
  if (at < 0) return false
  return brokerDomains().includes(email.slice(at + 1).toLowerCase())
}

function randomToken(): string {
  const bytes = crypto.getRandomValues(new Uint8Array(32))
  return [...bytes].map((b) => b.toString(16).padStart(2, '0')).join('')
}

/**
 * Mint a short-lived Account-scoped widget session.
 * Trust boundary: Zoho Account re-verification + portal_accounts link.
 * CRM user email is optional metadata only — widgets must work from Account context alone.
 */
export async function mintWidgetSession(input: {
  zohoAccountId: string
  zohoUserEmail?: string | null
  zohoUserId?: string | null
}): Promise<{
  session_token: string
  expires_at: string
  account_id: string
  zoho_account_id: string
  role: string
  scopes: string[]
}> {
  const zohoAccountId = String(input.zohoAccountId ?? '').trim()
  const email = String(input.zohoUserEmail ?? '').trim().toLowerCase()
  const requestedUserId = input.zohoUserId ? String(input.zohoUserId).trim() : null
  if (!zohoAccountId) {
    throw new Error('zoho_account_id is required')
  }

  // 1) Verify Account exists in Zoho (not client-trusted alone)
  const accountRecord = await zohoGetRecord(
    'Accounts',
    zohoAccountId,
    'id,Account_Name',
  )
  const verifiedAccountId = String(accountRecord.id ?? '')
  if (!verifiedAccountId || verifiedAccountId !== zohoAccountId) {
    throw new Error('Zoho Account verification failed')
  }

  // 2) Soft-resolve CRM user when email is present — never hard-fail widgets on Users API
  let verifiedUserId: string | null = null
  if (email) {
    verifiedUserId = await findZohoUserIdByEmail(email)
    if (
      requestedUserId &&
      verifiedUserId &&
      requestedUserId !== verifiedUserId
    ) {
      // Prefer Zoho Users API id when it conflicts; keep requested id if lookup missed
      verifiedUserId = verifiedUserId
    } else if (!verifiedUserId && requestedUserId) {
      verifiedUserId = requestedUserId
    }
  } else if (requestedUserId) {
    verifiedUserId = requestedUserId
  }

  const admin = getServiceClient()
  const { data: org, error: orgErr } = await admin
    .from('portal_accounts')
    .select('id, name, zoho_account_id, parent_account_id')
    .eq('zoho_account_id', zohoAccountId)
    .maybeSingle()
  if (orgErr) throw orgErr
  if (!org) {
    throw new Error('No AEGIS portal organisation linked to this Zoho Account')
  }

  // 3) Authorise from Account link; enrich role from portal membership / broker domain when known
  let role: string | null = null
  if (email) {
    const { data: memberships } = await admin
      .from('portal_users')
      .select('account_id, role, email')
      .ilike('email', email)

    const accountIds = new Set<string>([org.id])
    if (org.parent_account_id) accountIds.add(org.parent_account_id)

    for (const m of memberships ?? []) {
      if (!accountIds.has(m.account_id)) continue
      if (['owner', 'admin', 'broker', 'hr_admin'].includes(m.role)) {
        role = m.role
        break
      }
    }
    if (!role && isBrokerDomain(email)) {
      role = 'broker'
    }
  }

  // Account-verified CRM widgets are allowed with broker scope even without a CRM user match
  if (!role) {
    role = 'broker'
  }

  const ttlMs = Number(Deno.env.get('AEGIS_WIDGET_SESSION_TTL_MS') ?? 30 * 60 * 1000)
  const expiresAt = new Date(Date.now() + ttlMs).toISOString()
  const token = randomToken()
  const tokenHash = await sha256Hex(token)
  const scopes = ['workforce:read', 'workforce:write', 'crm:promote']
  const emailForStore = email || `account:${zohoAccountId}`

  const { data: session, error } = await admin
    .from('portal_workforce_widget_sessions')
    .insert({
      account_id: org.id,
      zoho_account_id: zohoAccountId,
      zoho_user_id: verifiedUserId,
      zoho_user_email: emailForStore,
      token_hash: tokenHash,
      role,
      scopes,
      expires_at: expiresAt,
    })
    .select('id')
    .single()
  if (error) throw error

  await admin.from('portal_workforce_audit_events').insert({
    account_id: org.id,
    event_type: 'widget_session_minted',
    summary: `Widget session for Account ${zohoAccountId}${email ? ` (${email})` : ''}`,
    detail: {
      zoho_account_id: zohoAccountId,
      zoho_user_id: verifiedUserId,
      zoho_user_email: email || null,
      role,
      session_id: session.id,
      auth_mode: 'account_context',
    },
    actor_label: email || `account:${zohoAccountId}`,
  })

  return {
    session_token: token,
    expires_at: expiresAt,
    account_id: org.id,
    zoho_account_id: zohoAccountId,
    role,
    scopes,
  }
}

export async function resolveWidgetSession(
  rawToken: string,
): Promise<WidgetAuthContext> {
  const token = rawToken.trim()
  if (!token) throw new Error('Unauthorized')
  const tokenHash = await sha256Hex(token)
  const admin = getServiceClient()
  const { data: session, error } = await admin
    .from('portal_workforce_widget_sessions')
    .select('*')
    .eq('token_hash', tokenHash)
    .maybeSingle()
  if (error) throw error
  if (!session) throw new Error('Unauthorized')
  if (session.revoked_at) throw new Error('Widget session revoked')
  if (new Date(session.expires_at).getTime() <= Date.now()) {
    throw new Error('Widget session expired')
  }

  const { data: org } = await admin
    .from('portal_accounts')
    .select('id, name, zoho_account_id')
    .eq('id', session.account_id)
    .maybeSingle()
  if (!org?.zoho_account_id) throw new Error('No portal account')

  await admin
    .from('portal_workforce_widget_sessions')
    .update({ last_used_at: new Date().toISOString() })
    .eq('id', session.id)

  const storedEmail = String(session.zoho_user_email ?? '')
  const email =
    storedEmail.startsWith('account:') ? undefined : (storedEmail || undefined)

  return {
    kind: 'widget',
    accountId: session.account_id,
    zohoAccountId: org.zoho_account_id,
    orgName: org.name,
    portalRole: session.role,
    user: {
      id: `zoho:${session.zoho_user_id ?? session.zoho_user_email}`,
      email,
    },
    sessionId: session.id,
    scopes: session.scopes ?? [],
  }
}

export async function revokeWidgetSession(rawToken: string): Promise<void> {
  const tokenHash = await sha256Hex(rawToken.trim())
  const admin = getServiceClient()
  await admin
    .from('portal_workforce_widget_sessions')
    .update({ revoked_at: new Date().toISOString() })
    .eq('token_hash', tokenHash)
    .is('revoked_at', null)
}
