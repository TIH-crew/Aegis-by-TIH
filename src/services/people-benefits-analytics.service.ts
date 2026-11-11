import { supabase } from '../lib/supabase'

/** Metric availability — never treat missing provider data as zero. */
export type MetricAvailability =
  | 'available'
  | 'awaiting_provider'
  | 'not_connected'
  | 'derived'

export type MetricValue = {
  availability: MetricAvailability
  value: number | null
  unit?: 'count' | 'percent' | 'zar'
  note?: string
}

export type BenefitParticipation = {
  benefitType: string
  label: string
  enrolled: number
  hrDeclared: number
  providerConfirmed: number
  providers: { name: string; count: number }[]
}

export type WorkforceTrendPoint = {
  period: string
  joiners: number
  departures: number
  /** Closing headcount only when reconstructable from employment dates */
  headcount: number | null
}

export type PeopleBenefitsAnalytics = {
  reportingPeriod: { label: string; asOf: string }
  kpis: {
    totalEmployees: MetricValue
    activeEmployees: MetricValue
    inactiveEmployees: MetricValue
    pendingInvites: MetricValue
    openExceptions: MetricValue
    pensionParticipation: MetricValue
    medicalAidParticipation: MetricValue
    aggregateRetirementFundValue: MetricValue
  }
  retirement: {
    participation: BenefitParticipation | null
    fundValueSeries: null
    contributionSeries: null
    investmentPerformance: null
    disbursements: null
    note: string
  }
  medicalAid: {
    participation: BenefitParticipation | null
    schemeDistribution: { name: string; count: number }[]
    contributionTotals: null
    enrolmentTrend: null
    note: string
  }
  otherBenefits: BenefitParticipation[]
  workforceTrends: {
    series: WorkforceTrendPoint[]
    quality: 'derived_from_employment_dates' | 'insufficient_dates'
    employeesMissingStartDate: number
    note: string
  }
  dataFreshness: {
    provider: string
    lastSync: string | null
    reportingPeriod: string
    availability: MetricAvailability
    reconciliationStatus: string
  }[]
}

const RETIREMENT_TYPES = ['pension', 'provident'] as const
const MEDICAL_TYPES = ['medical_aid'] as const
const OTHER_TYPES = ['gap_cover', 'group_life', 'disability', 'funeral', 'other'] as const

function labelFor(type: string) {
  return type.replace(/_/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
}

function isEnrolled(status: string) {
  return status === 'enrolled' || status === 'hr_declared' || status === 'pending'
}

function monthKey(d: Date) {
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`
}

function buildParticipation(
  typeFilter: readonly string[],
  rows: {
    benefit_type: string
    enrolment_status: string
    provider_confirmation_status: string
    provider_name: string | null
  }[],
): BenefitParticipation | null {
  const filtered = rows.filter((r) => typeFilter.includes(r.benefit_type))
  if (filtered.length === 0) return null
  const enrolled = filtered.filter((r) => isEnrolled(r.enrolment_status)).length
  const hrDeclared = filtered.filter((r) => r.enrolment_status === 'hr_declared').length
  const providerConfirmed = filtered.filter(
    (r) => r.provider_confirmation_status === 'confirmed',
  ).length
  const providerMap = new Map<string, number>()
  for (const r of filtered) {
    const name = r.provider_name?.trim() || 'Unspecified provider'
    providerMap.set(name, (providerMap.get(name) ?? 0) + 1)
  }
  return {
    benefitType: typeFilter[0]!,
    label: typeFilter.map(labelFor).join(' / '),
    enrolled,
    hrDeclared,
    providerConfirmed,
    providers: [...providerMap.entries()].map(([name, count]) => ({ name, count })),
  }
}

function participationPercent(enrolled: number, active: number): MetricValue {
  if (active <= 0) {
    return {
      availability: 'available',
      value: 0,
      unit: 'percent',
      note: 'No active employees',
    }
  }
  return {
    availability: 'available',
    value: Math.round((enrolled / active) * 1000) / 10,
    unit: 'percent',
  }
}

/**
 * Organisation-scoped people & benefits analytics.
 * Financial fund values / contributions remain unavailable until provider feeds exist.
 */
export async function getPeopleBenefitsAnalytics(
  accountId: string,
): Promise<PeopleBenefitsAnalytics> {
  const asOf = new Date().toISOString()

  const [
    { count: total },
    { count: active },
    { count: inactive },
    { count: pendingInvites },
    { count: openExceptions },
    { data: memberships, error: memErr },
    { data: employmentRows, error: empErr },
  ] = await Promise.all([
    supabase
      .from('portal_employees')
      .select('*', { count: 'exact', head: true })
      .eq('account_id', accountId),
    supabase
      .from('portal_employees')
      .select('*', { count: 'exact', head: true })
      .eq('account_id', accountId)
      .eq('status', 'active'),
    supabase
      .from('portal_employees')
      .select('*', { count: 'exact', head: true })
      .eq('account_id', accountId)
      .eq('status', 'inactive'),
    supabase
      .from('portal_employees')
      .select('*', { count: 'exact', head: true })
      .eq('account_id', accountId)
      .eq('invitation_status', 'pending'),
    supabase
      .from('portal_workforce_exceptions')
      .select('*', { count: 'exact', head: true })
      .eq('account_id', accountId)
      .eq('status', 'open'),
    supabase
      .from('portal_employee_benefit_memberships')
      .select(
        'benefit_type, enrolment_status, provider_confirmation_status, provider_name',
      )
      .eq('account_id', accountId),
    supabase
      .from('portal_employees')
      .select('id, status, employment_start_date, employment_end_date, deactivated_at')
      .eq('account_id', accountId),
  ])

  if (memErr) throw memErr
  if (empErr) throw empErr

  const memRows = memberships ?? []
  const employees = employmentRows ?? []
  const activeCount = active ?? 0

  const retirement = buildParticipation(RETIREMENT_TYPES, memRows)
  const medical = buildParticipation(MEDICAL_TYPES, memRows)
  const otherBenefits = OTHER_TYPES.map((t) => buildParticipation([t], memRows)).filter(
    (x): x is BenefitParticipation => x != null,
  )

  const missingStart = employees.filter((e) => !e.employment_start_date).length
  const series = deriveWorkforceSeries(employees)

  return {
    reportingPeriod: {
      label: new Intl.DateTimeFormat('en-ZA', { month: 'long', year: 'numeric' }).format(
        new Date(),
      ),
      asOf,
    },
    kpis: {
      totalEmployees: {
        availability: 'available',
        value: total ?? 0,
        unit: 'count',
      },
      activeEmployees: {
        availability: 'available',
        value: activeCount,
        unit: 'count',
      },
      inactiveEmployees: {
        availability: 'available',
        value: inactive ?? 0,
        unit: 'count',
      },
      pendingInvites: {
        availability: 'available',
        value: pendingInvites ?? 0,
        unit: 'count',
      },
      openExceptions: {
        availability: 'available',
        value: openExceptions ?? 0,
        unit: 'count',
      },
      pensionParticipation: retirement
        ? participationPercent(retirement.enrolled, activeCount)
        : {
            availability: 'awaiting_provider',
            value: null,
            unit: 'percent',
            note: 'No retirement fund memberships registered',
          },
      medicalAidParticipation: medical
        ? participationPercent(medical.enrolled, activeCount)
        : {
            availability: 'awaiting_provider',
            value: null,
            unit: 'percent',
            note: 'No medical aid memberships registered',
          },
      aggregateRetirementFundValue: {
        availability: 'not_connected',
        value: null,
        unit: 'zar',
        note: 'Fund administrator balances are not connected',
      },
    },
    retirement: {
      participation: retirement,
      fundValueSeries: null,
      contributionSeries: null,
      investmentPerformance: null,
      disbursements: null,
      note: 'Contribution, investment and closing-value series require fund administrator feeds. Membership counts use AEGIS benefit records only.',
    },
    medicalAid: {
      participation: medical,
      schemeDistribution: medical?.providers ?? [],
      contributionTotals: null,
      enrolmentTrend: null,
      note: 'Medical scheme contribution totals and claims analytics are not connected. Individual diagnoses are never shown here.',
    },
    otherBenefits,
    workforceTrends: {
      series,
      quality:
        missingStart > employees.length * 0.5
          ? 'insufficient_dates'
          : 'derived_from_employment_dates',
      employeesMissingStartDate: missingStart,
      note:
        missingStart > 0
          ? `Headcount series is reconstructed from employment start/end dates. ${missingStart} employee(s) lack a start date.`
          : 'Headcount series reconstructed from employment start and end dates (not a provider payroll feed).',
    },
    dataFreshness: [
      {
        provider: 'AEGIS employee registry',
        lastSync: asOf,
        reportingPeriod: 'Live organisational membership',
        availability: 'available',
        reconciliationStatus: 'n/a',
      },
      {
        provider: 'Retirement fund administrator',
        lastSync: null,
        reportingPeriod: '—',
        availability: 'not_connected',
        reconciliationStatus: 'awaiting integration',
      },
      {
        provider: 'Medical scheme',
        lastSync: null,
        reportingPeriod: '—',
        availability: 'not_connected',
        reconciliationStatus: 'awaiting integration',
      },
    ],
  }
}

function deriveWorkforceSeries(
  employees: {
    status: string
    employment_start_date: string | null
    employment_end_date: string | null
    deactivated_at: string | null
  }[],
): WorkforceTrendPoint[] {
  const now = new Date()
  const points: WorkforceTrendPoint[] = []
  for (let i = 11; i >= 0; i--) {
    const d = new Date(now.getFullYear(), now.getMonth() - i, 1)
    const key = monthKey(d)
    const periodEnd = new Date(d.getFullYear(), d.getMonth() + 1, 0, 23, 59, 59)
    const joiners = employees.filter((e) => {
      if (!e.employment_start_date) return false
      return monthKey(new Date(e.employment_start_date)) === key
    }).length
    const departures = employees.filter((e) => {
      const end = e.employment_end_date || (e.deactivated_at ? e.deactivated_at.slice(0, 10) : null)
      if (!end) return false
      return monthKey(new Date(end)) === key
    }).length
    // Reconstruct active headcount at month end from known dates only
    let known = 0
    let withDates = 0
    for (const e of employees) {
      if (!e.employment_start_date) continue
      withDates += 1
      const start = new Date(e.employment_start_date)
      const endRaw =
        e.employment_end_date || (e.deactivated_at ? e.deactivated_at.slice(0, 10) : null)
      const end = endRaw ? new Date(endRaw) : null
      if (start <= periodEnd && (!end || end > periodEnd)) known += 1
    }
    points.push({
      period: key,
      joiners,
      departures,
      headcount: withDates === 0 ? null : known,
    })
  }
  return points
}
