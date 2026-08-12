export interface ZohoAccountRecord {
  id: string
  Account_Name?: string
  Phone?: string
  Website?: string
  Company_Registration_Number?: string
  Vat_Number?: string
  Industry?: string
  Default_Email_Address?: string
  Record_Image?: string | null
}

export function mapZohoAccountToProvisionPayload(
  account: ZohoAccountRecord,
): Record<string, string | null> {
  return {
    zoho_account_id: String(account.id),
    name: account.Account_Name?.trim() || 'Unnamed Account',
    phone: account.Phone?.trim() || null,
    website: account.Website?.trim() || null,
    registration_number: account.Company_Registration_Number?.trim() || null,
    vat_number: account.Vat_Number?.trim() || null,
    industry: account.Industry?.trim() || null,
    logo_url: null,
    aegis_status: 'invited',
  }
}

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

export async function downloadZohoAccountPhoto(accountId: string): Promise<Blob | null> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/Accounts/${accountId}/photo`, {
    headers: { Authorization: `Zoho-oauthtoken ${token}` },
  })

  if (res.status === 204 || res.status === 404) return null
  if (!res.ok) return null

  const contentType = res.headers.get('content-type') ?? ''
  if (!contentType.startsWith('image/')) return null

  return await res.blob()
}

export async function updateZohoAccountAegisStatus(
  accountId: string,
  email: string,
): Promise<void> {
  const token = await getZohoAccessToken()
  const res = await fetch(`${zohoApiBase()}/Accounts`, {
    method: 'PUT',
    headers: {
      Authorization: `Zoho-oauthtoken ${token}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      data: [
        {
          id: accountId,
          Aegis_Portal_Status: 'Invited',
          Aegis_Last_Invited_At: new Date().toISOString(),
          Aegis_Last_Invited_Email: email,
        },
      ],
    }),
  })

  if (!res.ok) {
    const data = await res.json().catch(() => ({}))
    console.warn('Zoho status update failed:', data)
  }
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

export function lookupId(value: unknown): string | null {
  if (!value) return null
  if (typeof value === 'string') return value
  if (typeof value === 'object' && value !== null && 'id' in value) {
    return String((value as { id: string }).id)
  }
  return null
}
