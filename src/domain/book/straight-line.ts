import { add, div, fromDb, minMoney, money, mul, sub, toDb, zero, type Money } from '../money'

export type FirstPeriodConvention = 'full_month' | 'pro_rata_days' | 'half_year'

export type StraightLinePolicyInput = {
  method: 'straight_line'
  usefulLifeMonths: number
  residualValue: Money
  firstPeriodConvention: FirstPeriodConvention
  currency?: string
}

export type PeriodBounds = {
  periodKey: string
  periodStart: Date
  periodEnd: Date
}

export type StraightLinePeriodInput = {
  policy: StraightLinePolicyInput
  policyVersion: number
  capitalisedCost: Money
  availableForUseDate: Date
  openingGrossCost: Money
  additions: Money
  disposals: Money
  openingAccumDep: Money
  impairment: Money
  period: PeriodBounds
  /** When true, asset is indefinite-life intangible — no amortisation. */
  indefiniteLife?: boolean
}

export type StraightLinePeriodResult = {
  openingGrossCost: Money
  additions: Money
  disposals: Money
  closingGrossCost: Money
  openingAccumDep: Money
  currentCharge: Money
  closingAccumDep: Money
  impairment: Money
  closingNbv: Money
  inputs: Record<string, string | number | boolean>
  calculationTrace: Record<string, string>
}

function daysInclusive(start: Date, end: Date): number {
  const ms = end.getTime() - start.getTime()
  return Math.floor(ms / 86400000) + 1
}

function monthsOverlapFactor(
  available: Date,
  period: PeriodBounds,
  convention: FirstPeriodConvention,
): { factor: string; note: string } {
  if (available > period.periodEnd) {
    return { factor: '0', note: 'Not yet available for use in this period' }
  }

  if (convention === 'half_year') {
    // Simple half-year: 50% in first year of use if available in period, else full
    const firstYear =
      available.getUTCFullYear() === period.periodStart.getUTCFullYear() ||
      available.getUTCFullYear() === period.periodEnd.getUTCFullYear()
    if (firstYear && available >= period.periodStart && available <= period.periodEnd) {
      return { factor: '0.5', note: 'Half-year convention in first period of use' }
    }
    return { factor: '1', note: 'Full period under half-year convention after first period' }
  }

  if (convention === 'full_month') {
    // Charge starts from month of available-for-use if within period
    const useStart = available > period.periodStart ? available : period.periodStart
    if (useStart > period.periodEnd) return { factor: '0', note: 'No overlap' }
    const startMonth =
      useStart.getUTCFullYear() * 12 + useStart.getUTCMonth()
    const endMonth =
      period.periodEnd.getUTCFullYear() * 12 + period.periodEnd.getUTCMonth()
    const months = endMonth - startMonth + 1
    const periodMonths =
      period.periodEnd.getUTCFullYear() * 12 +
      period.periodEnd.getUTCMonth() -
      (period.periodStart.getUTCFullYear() * 12 + period.periodStart.getUTCMonth()) +
      1
    const factor = periodMonths <= 0 ? '0' : String(months / periodMonths)
    return { factor, note: `Full-month convention: ${months}/${periodMonths} months` }
  }

  // pro_rata_days
  const useStart = available > period.periodStart ? available : period.periodStart
  if (useStart > period.periodEnd) return { factor: '0', note: 'No overlap' }
  const activeDays = daysInclusive(useStart, period.periodEnd)
  const periodDays = daysInclusive(period.periodStart, period.periodEnd)
  return {
    factor: String(activeDays / periodDays),
    note: `Pro-rata days: ${activeDays}/${periodDays}`,
  }
}

/**
 * Deterministic straight-line charge for one period.
 * Does not depreciate below residual carrying amount.
 * Insurance values are intentionally not inputs.
 */
export function calculateStraightLinePeriod(input: StraightLinePeriodInput): StraightLinePeriodResult {
  const currency = input.capitalisedCost.currency
  const z = () => zero(currency)

  if (input.indefiniteLife) {
    const closingGross = sub(add(input.openingGrossCost, input.additions), input.disposals)
    const closingNbv = sub(sub(closingGross, input.openingAccumDep), input.impairment)
    return {
      openingGrossCost: input.openingGrossCost,
      additions: input.additions,
      disposals: input.disposals,
      closingGrossCost: closingGross,
      openingAccumDep: input.openingAccumDep,
      currentCharge: z(),
      closingAccumDep: input.openingAccumDep,
      impairment: input.impairment,
      closingNbv,
      inputs: { indefiniteLife: true },
      calculationTrace: {
        rule: 'Indefinite-life intangible — no amortisation; route for impairment review',
      },
    }
  }

  if (input.policy.usefulLifeMonths <= 0) {
    throw new Error('usefulLifeMonths must be positive for straight-line')
  }

  const closingGross = sub(add(input.openingGrossCost, input.additions), input.disposals)
  const depreciableBase = sub(input.capitalisedCost, input.policy.residualValue)
  if (depreciableBase.amount.isNeg()) {
    throw new Error('Residual value cannot exceed capitalised cost')
  }

  const monthlyCharge = div(depreciableBase, input.policy.usefulLifeMonths)
  // Scale monthly charge to period length assuming monthly periods by default
  const periodMonthsHint =
    input.period.periodEnd.getUTCFullYear() * 12 +
    input.period.periodEnd.getUTCMonth() -
    (input.period.periodStart.getUTCFullYear() * 12 + input.period.periodStart.getUTCMonth()) +
    1
  const basePeriodCharge = mul(monthlyCharge, Math.max(periodMonthsHint, 1))

  const { factor, note } = monthsOverlapFactor(
    input.availableForUseDate,
    input.period,
    input.policy.firstPeriodConvention,
  )
  let currentCharge = mul(basePeriodCharge, factor)

  // Floor at residual: max accum = capitalised - residual (adjusted for disposals simply on gross)
  const maxAccum = sub(closingGross, input.policy.residualValue)
  const remainingBefore = sub(maxAccum, input.openingAccumDep)
  if (remainingBefore.amount.lte(0)) {
    currentCharge = z()
  } else {
    currentCharge = minMoney(currentCharge, remainingBefore)
  }

  // Impairment reduces NBV but charge already floored against residual on gross
  const closingAccum = add(input.openingAccumDep, currentCharge)
  const closingNbv = sub(sub(closingGross, closingAccum), input.impairment)

  return {
    openingGrossCost: input.openingGrossCost,
    additions: input.additions,
    disposals: input.disposals,
    closingGrossCost: closingGross,
    openingAccumDep: input.openingAccumDep,
    currentCharge,
    closingAccumDep: closingAccum,
    impairment: input.impairment,
    closingNbv: closingNbv.amount.isNeg() ? z() : closingNbv,
    inputs: {
      usefulLifeMonths: input.policy.usefulLifeMonths,
      residualValue: toDb(input.policy.residualValue),
      capitalisedCost: toDb(input.capitalisedCost),
      convention: input.policy.firstPeriodConvention,
      periodMonths: periodMonthsHint,
      factor,
      policyVersion: input.policyVersion,
    },
    calculationTrace: {
      method: 'straight_line',
      monthlyCharge: toDb(monthlyCharge),
      basePeriodCharge: toDb(basePeriodCharge),
      conventionNote: note,
      maxAccum: toDb(maxAccum),
      currentCharge: toDb(currentCharge),
      closingNbv: toDb(closingNbv.amount.isNeg() ? z() : closingNbv),
    },
  }
}

export function parsePeriodKeyYm(periodKey: string): PeriodBounds {
  // YYYY-MM
  const m = /^(\d{4})-(\d{2})$/.exec(periodKey)
  if (!m) throw new Error(`Invalid period key: ${periodKey}`)
  const year = Number(m[1])
  const month = Number(m[2]) - 1
  const periodStart = new Date(Date.UTC(year, month, 1))
  const periodEnd = new Date(Date.UTC(year, month + 1, 0))
  return { periodKey, periodStart, periodEnd }
}

export function serialiseScheduleLine(result: StraightLinePeriodResult) {
  return {
    opening_gross_cost: toDb(result.openingGrossCost),
    additions: toDb(result.additions),
    disposals: toDb(result.disposals),
    closing_gross_cost: toDb(result.closingGrossCost),
    opening_accum_dep: toDb(result.openingAccumDep),
    current_charge: toDb(result.currentCharge),
    closing_accum_dep: toDb(result.closingAccumDep),
    impairment: toDb(result.impairment),
    closing_nbv: toDb(result.closingNbv),
    inputs: result.inputs,
    calculation_trace: result.calculationTrace,
  }
}

export function moneyOrZero(v: string | null | undefined, currency = 'ZAR'): Money {
  return v == null ? zero(currency) : fromDb(v, currency)
}

export { money }
