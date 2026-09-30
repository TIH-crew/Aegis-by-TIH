import type { CollectionConfig } from '../types'

export const COLLECTIONS: CollectionConfig[] = [
  { key: 'risk_items', label: 'Assets', path: '/assets', table: 'portal_risk_items' },
  { key: 'quotations', label: 'Quotations', path: '/insurance/quotations', table: 'portal_quotations' },
  { key: 'policies', label: 'Policies', path: '/insurance/policies', table: 'portal_policies' },
  { key: 'claims', label: 'Claims', path: '/insurance/claims', table: 'portal_claims' },
  { key: 'employees', label: 'People', path: '/people', table: 'portal_employees' },
]

/** Single insurance category per risk item (section + category combined). */
export const RISK_CATEGORIES = [
  'Building',
  'Motor',
  'Contents',
  'Electronic Equipment',
  'Plant & Machinery',
  'Glass',
  'Money',
  'Business Interruption',
  'Liability',
  'Miscellaneous',
] as const

export type RiskCategory = (typeof RISK_CATEGORIES)[number]

export const INSURANCE_STATUSES = [
  'Insured with us',
  'Uninsured',
  'Brand new',
  'In acquisition',
] as const

export type InsuranceStatus = (typeof INSURANCE_STATUSES)[number]
