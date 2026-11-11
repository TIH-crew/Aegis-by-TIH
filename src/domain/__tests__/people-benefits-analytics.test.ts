import { describe, expect, it } from 'vitest'
import type { MetricValue } from '../../services/people-benefits-analytics.service'

function formatKpi(m: MetricValue): string {
  if (m.availability !== 'available' || m.value == null) {
    if (m.availability === 'not_connected') return 'Not connected'
    if (m.availability === 'awaiting_provider') return 'Awaiting data'
    return '—'
  }
  if (m.unit === 'percent') return `${m.value}%`
  return String(m.value)
}

describe('people benefits analytics contracts', () => {
  it('does not treat missing fund value as zero', () => {
    const fund: MetricValue = {
      availability: 'not_connected',
      value: null,
      unit: 'zar',
    }
    expect(formatKpi(fund)).toBe('Not connected')
    expect(fund.value).toBeNull()
  })

  it('shows participation only when memberships exist', () => {
    const awaiting: MetricValue = {
      availability: 'awaiting_provider',
      value: null,
      unit: 'percent',
      note: 'No retirement fund memberships registered',
    }
    expect(formatKpi(awaiting)).toBe('Awaiting data')
  })

  it('formats available participation percent', () => {
    const pct: MetricValue = { availability: 'available', value: 42.5, unit: 'percent' }
    expect(formatKpi(pct)).toBe('42.5%')
  })

  it('distinguishes contributions from investment return in contract shape', () => {
    const retirement = {
      fundValueSeries: null as null,
      contributionSeries: null as null,
      investmentPerformance: null as null,
      note: 'Must not label total fund growth as investment return without provider data',
    }
    expect(retirement.fundValueSeries).toBeNull()
    expect(retirement.investmentPerformance).toBeNull()
    expect(retirement.note).toMatch(/investment return/i)
  })
})
