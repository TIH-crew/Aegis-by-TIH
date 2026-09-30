import type { LucideIcon } from 'lucide-react'
import {
  ArrowLeftRight,
  Building2,
  Calculator,
  ClipboardList,
  FileBarChart,
  LayoutDashboard,
  Package,
  Receipt,
  Settings,
  Shield,
  Users,
} from 'lucide-react'
import type { AppCapability } from '../lib/rbac'

export type NavItem = {
  id: string
  label: string
  path: string
  icon: LucideIcon
  capability?: AppCapability
  /** Match path prefixes for active state (in addition to `path`). */
  matchPaths?: string[]
  children?: { label: string; path: string; capability?: AppCapability; matchPaths?: string[] }[]
}

/** Primary application navigation — replaces Collections / Forms / icon rail. */
export const PRIMARY_NAV: NavItem[] = [
  {
    id: 'overview',
    label: 'Overview',
    path: '/',
    icon: LayoutDashboard,
    capability: 'dashboard_full',
  },
  {
    id: 'assets',
    label: 'Assets',
    path: '/assets',
    icon: Package,
    capability: 'risk_items',
    matchPaths: ['/assets', '/collections/risk-items'],
    children: [
      { label: 'Insurance schedule', path: '/assets', capability: 'risk_items' },
      { label: 'Ledger register', path: '/assets/ledger', capability: 'risk_items' },
      { label: 'Incidents & write-offs', path: '/assets/incidents', capability: 'risk_items' },
      { label: 'Bulk import', path: '/assets/import', capability: 'risk_items' },
      { label: 'Physical audits', path: '/assets/audits', capability: 'risk_items' },
    ],
  },
  {
    id: 'movements',
    label: 'Movements',
    path: '/movements',
    icon: ArrowLeftRight,
    capability: 'forms_custody',
    matchPaths: ['/movements', '/forms'],
  },
  {
    id: 'finance',
    label: 'Finance',
    path: '/finance',
    icon: Calculator,
    capability: 'policies_financials',
  },
  {
    id: 'tax',
    label: 'Tax',
    path: '/tax',
    icon: Receipt,
    capability: 'policies_financials',
  },
  {
    id: 'insurance',
    label: 'Insurance',
    path: '/insurance',
    icon: Shield,
    capability: 'policies',
    matchPaths: [
      '/insurance',
      '/collections/policies',
      '/collections/quotations',
      '/collections/claims',
      '/collections/pi-members',
      '/reports',
    ],
    children: [
      { label: 'Policies', path: '/insurance/policies', capability: 'policies', matchPaths: ['/collections/policies'] },
      {
        label: 'Quotations',
        path: '/insurance/quotations',
        capability: 'quotations',
        matchPaths: ['/collections/quotations'],
      },
      { label: 'Claims', path: '/insurance/claims', capability: 'claims', matchPaths: ['/collections/claims'] },
      {
        label: 'Endorsements',
        path: '/insurance/endorsements',
        capability: 'reports',
        matchPaths: ['/reports'],
      },
      {
        label: 'PI members',
        path: '/insurance/pi-members',
        capability: 'policies',
        matchPaths: ['/collections/pi-members'],
      },
    ],
  },
  {
    id: 'reports',
    label: 'Reports',
    path: '/reports',
    icon: FileBarChart,
    capability: 'reports',
  },
  {
    id: 'people',
    label: 'People',
    path: '/people',
    icon: Users,
    capability: 'employees',
    matchPaths: ['/people', '/collections/employees'],
  },
  {
    id: 'settings',
    label: 'Settings',
    path: '/settings/organization',
    icon: Settings,
    capability: 'settings',
    matchPaths: ['/settings'],
  },
]

export const EMPLOYEE_NAV: NavItem[] = [
  {
    id: 'claim',
    label: 'Submit claim',
    path: '/me/claim',
    icon: ClipboardList,
    capability: 'employee_claim',
  },
]

export function pathIsActive(pathname: string, item: { path: string; matchPaths?: string[] }): boolean {
  const candidates = [item.path, ...(item.matchPaths ?? [])]
  return candidates.some((p) => {
    if (p === '/') return pathname === '/'
    return pathname === p || pathname.startsWith(`${p}/`)
  })
}

export const ENTITY_SCOPE_ICON = Building2
