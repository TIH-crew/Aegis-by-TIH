let cachedAccessToken: { token: string; expiresAt: number } | null = null

export async function getZohoAccessToken(): Promise<string> {
  const now = Date.now()
  if (cachedAccessToken && cachedAccessToken.expiresAt > now + 60_000) {
    return cachedAccessToken.token
  }

  const clientId = Deno.env.get('ZOHO_CLIENT_ID')
  const clientSecret = Deno.env.get('ZOHO_CLIENT_SECRET')
  const refreshToken = Deno.env.get('ZOHO_REFRESH_TOKEN')
  const accountsUrl = Deno.env.get('ZOHO_ACCOUNTS_URL') ?? 'https://accounts.zoho.com'

  if (!clientId || !clientSecret || !refreshToken) {
    throw new Error('Zoho OAuth credentials are not configured')
  }

  const params = new URLSearchParams({
    refresh_token: refreshToken,
    client_id: clientId,
    client_secret: clientSecret,
    grant_type: 'refresh_token',
  })

  const res = await fetch(`${accountsUrl}/oauth/v2/token?${params}`, { method: 'POST' })
  const data = await res.json()

  if (!res.ok || !data.access_token) {
    throw new Error(data.error ?? 'Failed to refresh Zoho access token')
  }

  cachedAccessToken = {
    token: data.access_token,
    expiresAt: now + (data.expires_in ?? 3600) * 1000,
  }

  return data.access_token
}

function zohoApiBase(): string {
  const domain = Deno.env.get('ZOHO_API_DOMAIN') ?? 'www.zohoapis.com'
  return `https://${domain}/crm/v2`
}

export async function zohoCoql(query: string): Promise<Record<string, unknown>[]> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/coql`, {
    method: 'POST',
    headers: {
      Authorization: `Zoho-oauthtoken ${token}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ select_query: query }),
  })
  const data = await res.json()
  if (!res.ok) {
    throw new Error(data.message ?? data.code ?? 'Zoho COQL failed')
  }
  return (data.data ?? []) as Record<string, unknown>[]
}

export async function zohoGetRecord(
  module: string,
  recordId: string,
  fields?: string,
): Promise<Record<string, unknown>> {
  const token = await getZohoAccessToken()
  const url = fields
    ? `${zohoApiBase()}/${module}/${recordId}?fields=${encodeURIComponent(fields)}`
    : `${zohoApiBase()}/${module}/${recordId}`
  const res = await fetch(url, {
    headers: { Authorization: `Zoho-oauthtoken ${token}` },
  })
  const data = await res.json()
  if (!res.ok) throw new Error(data.message ?? 'Zoho get record failed')
  const row = data.data?.[0]
  if (!row) throw new Error('Record not found')
  return row as Record<string, unknown>
}

export async function zohoSearchRelated(
  module: string,
  recordId: string,
  relatedList: string,
): Promise<Record<string, unknown>[]> {
  const token = await getZohoAccessToken()
  const res = await fetch(
    `${zohoApiBase()}/${module}/${recordId}/${relatedList}?per_page=200&page=1`,
    { headers: { Authorization: `Zoho-oauthtoken ${token}` } },
  )
  const data = await res.json()
  if (!res.ok) return []
  return (data.data ?? []) as Record<string, unknown>[]
}

export async function zohoInsert(
  module: string,
  records: Record<string, unknown>[],
): Promise<Record<string, unknown>> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/${module}`, {
    method: 'POST',
    headers: {
      Authorization: `Zoho-oauthtoken ${token}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ data: records }),
  })
  const data = await res.json()
  if (!res.ok) throw new Error(data.message ?? data.data?.[0]?.message ?? 'Zoho insert failed')
  return data.data?.[0] ?? data
}

export async function zohoUpdate(
  module: string,
  records: Record<string, unknown>[],
): Promise<Record<string, unknown>> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/${module}`, {
    method: 'PUT',
    headers: {
      Authorization: `Zoho-oauthtoken ${token}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ data: records }),
  })
  const data = await res.json()
  if (!res.ok) throw new Error(data.message ?? data.data?.[0]?.message ?? 'Zoho update failed')
  return data.data?.[0] ?? data
}

export async function zohoGetAttachments(
  module: string,
  recordId: string,
): Promise<Record<string, unknown>[]> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/${module}/${recordId}/Attachments`, {
    headers: { Authorization: `Zoho-oauthtoken ${token}` },
  })
  const data = await res.json()
  if (!res.ok) return []
  return (data.data ?? []) as Record<string, unknown>[]
}

export function lookupId(value: unknown): string | null {
  if (!value) return null
  if (typeof value === 'string') return value
  if (typeof value === 'object' && value !== null && 'id' in value) {
    return String((value as { id: string }).id)
  }
  return null
}

export function lookupName(value: unknown): string | null {
  if (!value) return null
  if (typeof value === 'object' && value !== null && 'name' in value) {
    return String((value as { name: string }).name)
  }
  return null
}

/** Resolve a Zoho CRM user id by email (for Task Owner / notifications). */
export async function findZohoUserIdByEmail(email: string): Promise<string | null> {
  const normalized = email.trim().toLowerCase()
  if (!normalized) return null
  try {
    const token = await getZohoAccessToken()
    const res = await fetch(`${zohoApiBase()}/users?type=AllUsers`, {
      headers: { Authorization: `Zoho-oauthtoken ${token}` },
    })
    const data = await res.json()
    if (!res.ok) return null
    const users = (data.users ?? []) as Record<string, unknown>[]
    const match = users.find((u) => String(u.email ?? '').trim().toLowerCase() === normalized)
    return match?.id != null ? String(match.id) : null
  } catch {
    return null
  }
}

/**
 * Best-effort email to the broker. Uses Resend or SendGrid when a secret is configured.
 * Returns whether a provider accepted the message (false = skipped / failed).
 */
export async function sendBrokerNotifyEmail(opts: {
  to: string
  subject: string
  text: string
}): Promise<{ sent: boolean; provider?: string; error?: string }> {
  const resendKey = Deno.env.get('RESEND_API_KEY')
  const sendgridKey = Deno.env.get('SENDGRID_API_KEY')
  const from =
    Deno.env.get('BROKER_NOTIFY_FROM') ??
    Deno.env.get('RESEND_FROM') ??
    'Aegis Portal <noreply@theinsurancehub.co.za>'

  if (resendKey) {
    try {
      const res = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${resendKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          from,
          to: [opts.to],
          subject: opts.subject,
          text: opts.text,
        }),
      })
      if (!res.ok) {
        const body = await res.text()
        return { sent: false, provider: 'resend', error: body.slice(0, 300) }
      }
      return { sent: true, provider: 'resend' }
    } catch (err) {
      return {
        sent: false,
        provider: 'resend',
        error: err instanceof Error ? err.message : 'Resend failed',
      }
    }
  }

  if (sendgridKey) {
    try {
      const fromMatch = from.match(/^(.*?)\s*<([^>]+)>$/)
      const fromEmail = fromMatch?.[2] ?? from
      const fromName = fromMatch?.[1]?.trim()
      const res = await fetch('https://api.sendgrid.com/v3/mail/send', {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${sendgridKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          personalizations: [{ to: [{ email: opts.to }] }],
          from: fromName ? { email: fromEmail, name: fromName } : { email: fromEmail },
          subject: opts.subject,
          content: [{ type: 'text/plain', value: opts.text }],
        }),
      })
      if (!res.ok) {
        const body = await res.text()
        return { sent: false, provider: 'sendgrid', error: body.slice(0, 300) }
      }
      return { sent: true, provider: 'sendgrid' }
    } catch (err) {
      return {
        sent: false,
        provider: 'sendgrid',
        error: err instanceof Error ? err.message : 'SendGrid failed',
      }
    }
  }

  return { sent: false, error: 'No RESEND_API_KEY or SENDGRID_API_KEY configured' }
}

export interface ZohoAccountRecord {
  id: string
  Account_Name?: string
  Phone?: string
  Website?: string
  Company_Registration_Number?: string
  Vat_Number?: string
  Industry?: string
  Default_Email_Address?: string
}

export async function fetchZohoAccount(accountId: string): Promise<ZohoAccountRecord> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/Accounts/${accountId}`, {
    headers: { Authorization: `Zoho-oauthtoken ${token}` },
  })
  const data = await res.json()

  if (!res.ok) {
    throw new Error(data.message ?? data.code ?? 'Failed to fetch Zoho Account')
  }

  const record = data.data?.[0]
  if (!record?.id) {
    throw new Error('Zoho Account not found')
  }

  return record as ZohoAccountRecord
}
