import type { CoveredItem, PolicyDetail } from '../types/crm'

/** Standard commercial schedule section order (TIH policy schedule layout). */
export const POLICY_SECTION_ORDER = [
  'Fire',
  'Office Contents',
  'Theft',
  'Goods in Transit',
  'Business All Risks',
  'Electronic Equipment',
  'Accidental Damage',
  'Public Liability',
  'Machinery Insurance',
  'Buildings (home)',
  'Household Contents',
  'Specific items all risks',
  'Personal legal responsibility',
  'Extended personal legal responsibility',
  'Motor Specified',
  'Bryte Farming Assist',
  'Bryte Car Hire',
  'Roadside Assist',
  'Commercial Office Assist',
  'SASRIA security cost (protection of property prior to loss)',
  'SASRIA',
] as const

export interface ScheduleLine {
  section: string
  description: string
  insuredAmount: number
  premium: number
}

export interface SectionSummary {
  section: string
  items: ScheduleLine[]
  insuredValue: number
  premium: number
}

export interface PolicyScheduleModel {
  clientName: string
  policyNumber: string
  insurer: string | null
  productLine: string | null
  status: string | null
  inceptionDate: string | null
  renewalDate: string | null
  lines: ScheduleLine[]
  basePremium: number
  totalMonthlyPremium: number
  otherCharges: number
  totalInsuredValue: number
  totalItems: number
}

function linePremium(item: CoveredItem): number {
  if (item.premium_incl != null && !Number.isNaN(Number(item.premium_incl))) {
    return Number(item.premium_incl)
  }
  if (item.premium_excl != null && !Number.isNaN(Number(item.premium_excl))) {
    return Number(item.premium_excl)
  }
  return 0
}

function lineDescription(item: CoveredItem): string {
  return (item.risk_item_name ?? item.description ?? 'Risk item').trim()
}

function lineSection(item: CoveredItem): string {
  const section = item.section?.trim()
  return section || 'Uncategorised'
}

export function coveredItemToScheduleLine(item: CoveredItem): ScheduleLine {
  return {
    section: lineSection(item),
    description: lineDescription(item),
    insuredAmount: item.sum_insured != null ? Number(item.sum_insured) : 0,
    premium: linePremium(item),
  }
}

export function buildPolicyScheduleModel(
  policy: PolicyDetail,
  clientName: string,
): PolicyScheduleModel {
  const lines = policy.covered_items.map(coveredItemToScheduleLine)
  const basePremium = lines.reduce((sum, row) => sum + row.premium, 0)
  const sasria = policy.sasria_premium != null ? Number(policy.sasria_premium) : 0
  const fees = policy.fee_premium != null ? Number(policy.fee_premium) : 0
  const otherCharges =
    sasria + fees > 0
      ? sasria + fees
      : Math.max(0, (policy.premium != null ? Number(policy.premium) : basePremium) - basePremium)
  const totalMonthlyPremium =
    policy.premium != null ? Number(policy.premium) : basePremium + otherCharges
  const totalInsuredValue = lines.reduce((sum, row) => sum + row.insuredAmount, 0)

  return {
    clientName,
    policyNumber: policy.policy_number,
    insurer: policy.insurer,
    productLine: policy.product_line,
    status: policy.status,
    inceptionDate: policy.inception_date,
    renewalDate: policy.renewal_date,
    lines,
    basePremium,
    totalMonthlyPremium,
    otherCharges,
    totalInsuredValue,
    totalItems: lines.length,
  }
}

const SECTION_ORDER_SET = new Set<string>(POLICY_SECTION_ORDER)

export function orderScheduleSections(sections: string[]): string[] {
  const unique = [...new Set(sections)]
  const ordered = POLICY_SECTION_ORDER.filter((s) => unique.includes(s))
  const remainder = unique.filter((s) => !SECTION_ORDER_SET.has(s))
  remainder.sort((a, b) => a.localeCompare(b))
  return [...ordered, ...remainder]
}

export function groupLinesBySection(lines: ScheduleLine[]): SectionSummary[] {
  const bySection = new Map<string, ScheduleLine[]>()
  for (const line of lines) {
    const bucket = bySection.get(line.section) ?? []
    bucket.push(line)
    bySection.set(line.section, bucket)
  }

  return orderScheduleSections([...bySection.keys()]).map((section) => {
    const items = bySection.get(section) ?? []
    return {
      section,
      items,
      insuredValue: items.reduce((sum, row) => sum + row.insuredAmount, 0),
      premium: items.reduce((sum, row) => sum + row.premium, 0),
    }
  })
}

export function formatScheduleMoney(value: number): string {
  return `R ${value.toLocaleString('en-ZA', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`
}

export function formatScheduleDate(value: string | null): string {
  if (!value) return '—'
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return value
  return date.toLocaleDateString('en-ZA', { day: '2-digit', month: 'long', year: 'numeric' })
}

export function isActivePolicyStatus(status: string | null): boolean {
  if (!status) return true
  const normalized = status.toLowerCase()
  return !normalized.includes('cancel') && !normalized.includes('lapse') && !normalized.includes('expir')
}
