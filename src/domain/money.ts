import Decimal from 'decimal.js'

/** Financial arithmetic — never use JS number floats for money. */
Decimal.set({ precision: 28, rounding: Decimal.ROUND_HALF_UP })

export type CurrencyCode = string

export type Money = {
  readonly amount: Decimal
  readonly currency: CurrencyCode
}

export function money(value: string | number | Decimal, currency: CurrencyCode = 'ZAR'): Money {
  return { amount: new Decimal(value), currency }
}

export function assertSameCurrency(a: Money, b: Money) {
  if (a.currency !== b.currency) {
    throw new Error(`Currency mismatch: ${a.currency} vs ${b.currency}`)
  }
}

export function add(a: Money, b: Money): Money {
  assertSameCurrency(a, b)
  return { amount: a.amount.plus(b.amount), currency: a.currency }
}

export function sub(a: Money, b: Money): Money {
  assertSameCurrency(a, b)
  return { amount: a.amount.minus(b.amount), currency: a.currency }
}

export function mul(a: Money, factor: string | number | Decimal): Money {
  return { amount: a.amount.times(factor), currency: a.currency }
}

export function div(a: Money, divisor: string | number | Decimal): Money {
  return { amount: a.amount.div(divisor), currency: a.currency }
}

export function minMoney(a: Money, b: Money): Money {
  assertSameCurrency(a, b)
  return a.amount.lte(b.amount) ? a : b
}

export function maxMoney(a: Money, b: Money): Money {
  assertSameCurrency(a, b)
  return a.amount.gte(b.amount) ? a : b
}

export function zero(currency: CurrencyCode = 'ZAR'): Money {
  return money(0, currency)
}

export function isZero(m: Money): boolean {
  return m.amount.isZero()
}

export function cmp(a: Money, b: Money): number {
  assertSameCurrency(a, b)
  return a.amount.cmp(b.amount)
}

/** Fixed 4dp string for DB numeric(18,4) storage. */
export function toDb(m: Money): string {
  return m.amount.toFixed(4)
}

export function fromDb(value: string | number | null | undefined, currency: CurrencyCode = 'ZAR'): Money {
  if (value == null || value === '') return zero(currency)
  return money(value, currency)
}

export function formatZar(m: Money): string {
  const n = Number(m.amount.toFixed(2))
  return new Intl.NumberFormat('en-ZA', {
    style: 'currency',
    currency: m.currency || 'ZAR',
    minimumFractionDigits: 2,
  }).format(n)
}

export { Decimal }
