/**
 * Pure helpers for Zoho CRM widget session trust checks (unit-testable).
 * Server still must re-verify Zoho Account + User via API before issuing a session.
 */

export type WidgetSessionClaims = {
  accountId: string
  zohoAccountId: string
  zohoUserId: string | null
  zohoUserEmail: string
  role: 'broker' | 'admin' | 'hr_admin' | 'owner'
  expiresAt: number
  scopes: string[]
}

export function normalizeEmail(email: string | null | undefined): string {
  return (email ?? '').trim().toLowerCase()
}

export function isBrokerEmailDomain(
  email: string,
  allowedDomains: string[],
): boolean {
  const normalized = normalizeEmail(email)
  const at = normalized.lastIndexOf('@')
  if (at < 0) return false
  const domain = normalized.slice(at + 1)
  return allowedDomains.map((d) => d.trim().toLowerCase()).includes(domain)
}

/** Client may suggest Account ID / user id — never authorize from these alone. */
export function assertServerVerifiedIds(opts: {
  requestedZohoAccountId: string
  verifiedZohoAccountId: string
  requestedZohoUserId?: string | null
  verifiedZohoUserId: string | null
  requestedEmail: string
  verifiedEmail: string
}): void {
  if (
    !opts.requestedZohoAccountId ||
    opts.requestedZohoAccountId !== opts.verifiedZohoAccountId
  ) {
    throw new Error('Zoho Account verification failed')
  }
  if (normalizeEmail(opts.requestedEmail) !== normalizeEmail(opts.verifiedEmail)) {
    throw new Error('Zoho user email verification failed')
  }
  if (
    opts.requestedZohoUserId &&
    opts.verifiedZohoUserId &&
    opts.requestedZohoUserId !== opts.verifiedZohoUserId
  ) {
    throw new Error('Zoho user id verification failed')
  }
}

export function resolveWidgetRole(opts: {
  portalRole: string | null
  email: string
  brokerDomains: string[]
}): 'broker' | 'admin' | 'hr_admin' | 'owner' | null {
  if (opts.portalRole === 'owner') return 'owner'
  if (opts.portalRole === 'admin') return 'admin'
  if (opts.portalRole === 'hr_admin') return 'hr_admin'
  if (opts.portalRole === 'broker') return 'broker'
  if (isBrokerEmailDomain(opts.email, opts.brokerDomains)) return 'broker'
  return null
}

export function isWidgetSessionActive(opts: {
  expiresAt: string | number | Date
  revokedAt?: string | null
  now?: number
}): boolean {
  if (opts.revokedAt) return false
  const exp =
    typeof opts.expiresAt === 'number'
      ? opts.expiresAt
      : new Date(opts.expiresAt).getTime()
  return exp > (opts.now ?? Date.now())
}

export function widgetSessionAllows(
  claims: Pick<WidgetSessionClaims, 'scopes' | 'role'>,
  need: 'read' | 'hr_write' | 'broker_write' | 'crm_promote',
): boolean {
  if (need === 'read') {
    return claims.scopes.includes('workforce:read') || claims.scopes.includes('workforce:write')
  }
  if (need === 'hr_write') {
    return (
      (claims.role === 'owner' || claims.role === 'admin' || claims.role === 'hr_admin') &&
      claims.scopes.includes('workforce:write')
    )
  }
  if (need === 'broker_write' || need === 'crm_promote') {
    return (
      (claims.role === 'owner' ||
        claims.role === 'admin' ||
        claims.role === 'broker') &&
      (claims.scopes.includes('crm:promote') || claims.scopes.includes('workforce:write'))
    )
  }
  return false
}

export const DEFAULT_WIDGET_SCOPES = [
  'workforce:read',
  'workforce:write',
  'crm:promote',
] as const

export const DEFAULT_SESSION_TTL_MS = 30 * 60 * 1000
