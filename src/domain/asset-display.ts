import { money, toDb, zero } from './money'

export type DisplayAmount = {
  label: string
  display: string
  hint?: string
  missing: boolean
}

export function labelledAmount(
  label: string,
  value: string | number | null | undefined,
  opts?: { currency?: string; hint?: string; emptyLabel?: string },
): DisplayAmount {
  if (value == null || value === '') {
    return {
      label,
      display: opts?.emptyLabel ?? 'Not supplied',
      hint: opts?.hint,
      missing: true,
    }
  }
  const m = money(value, opts?.currency ?? 'ZAR')
  return {
    label,
    display: new Intl.NumberFormat('en-ZA', {
      style: 'currency',
      currency: opts?.currency ?? 'ZAR',
      minimumFractionDigits: 2,
    }).format(Number(toDb(m))),
    hint: opts?.hint,
    missing: false,
  }
}

export function neverZeroUnknown(value: string | null | undefined): string | null {
  return value == null || value === '' ? null : value
}

export { zero }
