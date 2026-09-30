import type { AppCapability } from './rbac'

/**
 * Workspace roles (aligned with aam_portal_roles.role_key).
 * Server/RLS must enforce; UI uses this for progressive disclosure only.
 */
export type LedgerRoleKey =
  | 'client_viewer'
  | 'asset_manager'
  | 'finance_preparer'
  | 'finance_approver'
  | 'tax_reviewer'
  | 'insurance_broker'
  | 'auditor'
  | 'platform_admin'

export const LEDGER_ROLE_CAPABILITIES: Record<LedgerRoleKey, AppCapability[]> = {
  client_viewer: ['dashboard_full', 'risk_items', 'reports', 'my_profile'],
  asset_manager: ['dashboard_full', 'risk_items', 'forms_custody', 'asset_ledger', 'employees'],
  finance_preparer: [
    'dashboard_full',
    'risk_items',
    'asset_ledger',
    'finance_prepare',
    'policies_financials',
    'reports',
  ],
  finance_approver: [
    'dashboard_full',
    'risk_items',
    'asset_ledger',
    'finance_prepare',
    'finance_approve',
    'policies_financials',
    'reports',
  ],
  tax_reviewer: ['dashboard_full', 'asset_ledger', 'tax_review', 'policies_financials', 'reports'],
  insurance_broker: [
    'dashboard_full',
    'risk_items',
    'policies',
    'quotations',
    'claims',
    'reports',
  ],
  auditor: ['dashboard_full', 'risk_items', 'asset_ledger', 'reports', 'policies_financials'],
  platform_admin: [],
}
