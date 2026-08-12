/** Portal RBAC — admin sees full ops; employees see a simplified self-service view. */

export const PORTAL_ADMIN_EMAILS = ['liyema@theinsurancehub.co.za'] as const

export type AppCapability =
  | 'dashboard_full'
  | 'risk_items'
  | 'quotations'
  | 'quotations_accept'
  | 'quotations_financials'
  | 'policies'
  | 'policies_financials'
  | 'claims'
  | 'employees'
  | 'forms_custody'
  | 'settings'
  | 'reports'
  | 'my_profile'
  | 'my_assets'
  | 'employee_claim'

export type PortalAppRole = 'admin' | 'employee'

export function normalizeEmail(email: string | null | undefined): string {
  return (email ?? '').trim().toLowerCase()
}

export function isPortalAdminEmail(email: string | null | undefined): boolean {
  const normalized = normalizeEmail(email)
  return (PORTAL_ADMIN_EMAILS as readonly string[]).includes(normalized)
}

/** Resolve app role from hard-coded admin emails (portal_users.role is secondary). */
export function resolveAppRole(opts: {
  email: string | null | undefined
  portalRole?: string | null
}): PortalAppRole {
  if (isPortalAdminEmail(opts.email)) return 'admin'
  // Explicit portal admin role only — owner is not automatically full admin
  if (opts.portalRole === 'admin') return 'admin'
  return 'employee'
}

const ADMIN_CAPS: AppCapability[] = [
  'dashboard_full',
  'risk_items',
  'quotations',
  'quotations_accept',
  'quotations_financials',
  'policies',
  'policies_financials',
  'claims',
  'employees',
  'forms_custody',
  'settings',
  'reports',
  'my_profile',
  'my_assets',
]

const EMPLOYEE_CAPS: AppCapability[] = ['employee_claim']

export function capabilitiesForRole(role: PortalAppRole): Set<AppCapability> {
  return new Set(role === 'admin' ? ADMIN_CAPS : EMPLOYEE_CAPS)
}

export function can(role: PortalAppRole, capability: AppCapability): boolean {
  return capabilitiesForRole(role).has(capability)
}

/** Quote stages where the client may view premiums and accept. */
export function isAwaitingClientFeedbackStage(stage: string | null | undefined): boolean {
  const s = (stage ?? '').toLowerCase()
  return (
    s.includes('awaiting client') ||
    s.includes('awaiting feedback') ||
    s.includes('client feedback') ||
    s.includes('presented') ||
    s.includes('proposal sent') ||
    s.includes('quote sent') ||
    s.includes('customer review')
  )
}

export function canViewQuoteFinancials(
  role: PortalAppRole,
  stage: string | null | undefined,
): boolean {
  if (role === 'admin') return true
  return isAwaitingClientFeedbackStage(stage)
}

export function canAcceptQuote(role: PortalAppRole, stage: string | null | undefined): boolean {
  if (!can(role, 'quotations_accept') && role !== 'admin') {
    // Employees with quotations_accept would use this; currently only admin has accept.
    // User said client can accept when awaiting feedback — admin org users who are "clients" of the broker.
    // Treat: anyone with quotations access who is admin, OR when stage is awaiting feedback allow admin to accept on behalf.
  }
  return role === 'admin' && isAwaitingClientFeedbackStage(stage)
}

/** Client-facing accept: admin users of the insured org when stage is awaiting feedback. */
export function quoteIsAcceptable(stage: string | null | undefined): boolean {
  return isAwaitingClientFeedbackStage(stage)
}
