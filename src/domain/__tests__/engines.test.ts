import { describe, expect, it } from 'vitest'
import {
  calculateStraightLinePeriod,
  parsePeriodKeyYm,
} from '../book/straight-line'
import { money, toDb, zero } from '../money'
import {
  assertNoDoubleClaim,
  proposeTaxAllowance,
  suggestVatMotorCarDecision,
  type TaxRuleSnapshot,
} from '../tax/tax-engine'
import {
  computeDifference,
  glDedupeKey,
  rankInsuranceMatches,
  reconcileSubledgerToGl,
} from '../reconciliation/engines'

const zar = (n: string) => money(n, 'ZAR')

describe('money', () => {
  it('does not use floating error for 0.1+0.2 style sums via Decimal', () => {
    const a = zar('0.1')
    const b = zar('0.2')
    expect(toDb({ amount: a.amount.plus(b.amount), currency: 'ZAR' })).toBe('0.3000')
  })
})

describe('straight-line depreciation', () => {
  const period = parsePeriodKeyYm('2026-03')

  it('charges full month when available from period start', () => {
    const result = calculateStraightLinePeriod({
      policy: {
        method: 'straight_line',
        usefulLifeMonths: 60,
        residualValue: zar('0'),
        firstPeriodConvention: 'full_month',
      },
      policyVersion: 1,
      capitalisedCost: zar('120000'),
      availableForUseDate: new Date('2026-03-01T00:00:00Z'),
      openingGrossCost: zar('120000'),
      additions: zero('ZAR'),
      disposals: zero('ZAR'),
      openingAccumDep: zero('ZAR'),
      impairment: zero('ZAR'),
      period,
    })
    // 120000/60 = 2000 per month
    expect(toDb(result.currentCharge)).toBe('2000.0000')
    expect(toDb(result.closingNbv)).toBe('118000.0000')
  })

  it('does not depreciate below residual', () => {
    const result = calculateStraightLinePeriod({
      policy: {
        method: 'straight_line',
        usefulLifeMonths: 12,
        residualValue: zar('1000'),
        firstPeriodConvention: 'full_month',
      },
      policyVersion: 1,
      capitalisedCost: zar('13000'),
      availableForUseDate: new Date('2020-01-01T00:00:00Z'),
      openingGrossCost: zar('13000'),
      additions: zero('ZAR'),
      disposals: zero('ZAR'),
      openingAccumDep: zar('11900'),
      impairment: zero('ZAR'),
      period,
    })
    // max accum = 12000, remaining = 100 → charge capped
    expect(toDb(result.currentCharge)).toBe('100.0000')
    expect(toDb(result.closingAccumDep)).toBe('12000.0000')
  })

  it('skips amortisation for indefinite-life intangibles', () => {
    const result = calculateStraightLinePeriod({
      policy: {
        method: 'straight_line',
        usefulLifeMonths: 60,
        residualValue: zar('0'),
        firstPeriodConvention: 'full_month',
      },
      policyVersion: 1,
      capitalisedCost: zar('50000'),
      availableForUseDate: new Date('2026-01-01T00:00:00Z'),
      openingGrossCost: zar('50000'),
      additions: zero('ZAR'),
      disposals: zero('ZAR'),
      openingAccumDep: zero('ZAR'),
      impairment: zero('ZAR'),
      period,
      indefiniteLife: true,
    })
    expect(toDb(result.currentCharge)).toBe('0.0000')
    expect(result.calculationTrace.rule).toMatch(/impairment review/i)
  })

  it('returns zero charge before available-for-use', () => {
    const result = calculateStraightLinePeriod({
      policy: {
        method: 'straight_line',
        usefulLifeMonths: 36,
        residualValue: zar('0'),
        firstPeriodConvention: 'full_month',
      },
      policyVersion: 1,
      capitalisedCost: zar('36000'),
      availableForUseDate: new Date('2026-06-01T00:00:00Z'),
      openingGrossCost: zar('36000'),
      additions: zero('ZAR'),
      disposals: zero('ZAR'),
      openingAccumDep: zero('ZAR'),
      impairment: zero('ZAR'),
      period,
    })
    expect(toDb(result.currentCharge)).toBe('0.0000')
  })
})

describe('tax engine', () => {
  const approvedRule: TaxRuleSnapshot = {
    id: 'rule-1',
    version: 1,
    legalProvision: 's11(e)',
    status: 'approved',
    effectiveFrom: '2020-01-01',
    effectiveTo: null,
    taxYearFrom: 2020,
    taxYearTo: null,
    config: { method: 'straight_line_write_off', requires_approved_life_table: true },
    sourceReference: 'https://www.sars.gov.za/lapd-intr-in-2012-47-wear-and-tear-depreciation-allowance/',
    qualificationCriteria: {},
  }

  it('refuses draft rules', () => {
    const r = proposeTaxAllowance({
      rule: { ...approvedRule, status: 'draft' },
      taxYear: 2026,
      taxCostBase: zar('100000'),
      priorAllowances: zero('ZAR'),
      broughtIntoUseDate: new Date('2025-03-01'),
      approvedWriteOffYears: 5,
      approvedAnnualPct: null,
    })
    expect(r.ok).toBe(false)
  })

  it('refuses expired incentives for new claims', () => {
    const r = proposeTaxAllowance({
      rule: { ...approvedRule, status: 'expired' },
      taxYear: 2026,
      taxCostBase: zar('100000'),
      priorAllowances: zero('ZAR'),
      broughtIntoUseDate: new Date('2025-03-01'),
      approvedWriteOffYears: 5,
      approvedAnnualPct: null,
    })
    expect(r.ok).toBe(false)
    if (!r.ok) expect(r.reason).toMatch(/expired/i)
  })

  it('requires life table years when configured', () => {
    const r = proposeTaxAllowance({
      rule: approvedRule,
      taxYear: 2026,
      taxCostBase: zar('100000'),
      priorAllowances: zero('ZAR'),
      broughtIntoUseDate: new Date('2025-03-01'),
      approvedWriteOffYears: null,
      approvedAnnualPct: null,
    })
    expect(r.ok).toBe(false)
    if (!r.ok) expect(r.needsClassification).toBe(true)
  })

  it('proposes provisional allowance with approved years', () => {
    const r = proposeTaxAllowance({
      rule: approvedRule,
      taxYear: 2026,
      taxCostBase: zar('100000'),
      priorAllowances: zero('ZAR'),
      broughtIntoUseDate: new Date('2025-03-01'),
      approvedWriteOffYears: 5,
      approvedAnnualPct: null,
    })
    expect(r.ok).toBe(true)
    if (r.ok) {
      expect(r.status).toBe('provisional')
      expect(toDb(r.proposedAllowance)).toBe('20000.0000')
      expect(r.calculationTrace.status).toMatch(/provisional/i)
    }
  })

  it('blocks incompatible double claims', () => {
    const r = assertNoDoubleClaim({
      existingApprovedProvisions: ['s12B'],
      proposedProvision: 's11(e)',
    })
    expect(r.ok).toBe(false)
  })

  it('flags motor car VAT restriction', () => {
    const s = suggestVatMotorCarDecision(
      {
        ...approvedRule,
        legalProvision: 'vat_motor_car_restriction',
        config: { suggested_decision_if_motor_car: 'motor_car_restriction' },
      },
      true,
    )
    expect(s.decision).toBe('motor_car_restriction')
  })
})

describe('reconciliation', () => {
  it('surfaces differences outside tolerance', () => {
    const d = computeDifference({
      registerAmount: zar('1000.00'),
      externalAmount: zar('999.50'),
      tolerance: zar('0.01'),
    })
    expect(d.withinTolerance).toBe(false)
    expect(toDb(d.difference)).toBe('0.5000')
  })

  it('does not hide differences within zero tolerance', () => {
    const exceptions = reconcileSubledgerToGl(
      {
        openingCost: zar('0'),
        additions: zar('0'),
        disposals: zar('0'),
        closingCost: zar('100'),
        depreciationExpense: zar('10'),
        openingAccumDep: zar('0'),
        closingAccumDep: zar('10'),
      },
      {
        costAccount: zar('100'),
        accumDepAccount: zar('10'),
        depExpenseAccount: zar('9.99'),
      },
      zar('0'),
    )
    expect(exceptions.find((e) => e.account === 'dep_expense')?.withinTolerance).toBe(false)
  })

  it('ranks exact VIN before fuzzy name and never auto-merges fuzzy as exact', () => {
    const matches = rankInsuranceMatches({
      assets: [
        { id: 'a1', assetTag: 'T1', vin: 'VIN123', serial: null, name: 'Bakkie' },
        { id: 'a2', assetTag: 'T2', vin: null, serial: null, name: 'Office Chair' },
      ],
      riskItems: [
        { id: 'r1', assetTag: null, vin: 'VIN123', serial: null, name: 'Other' },
        { id: 'r2', assetTag: null, vin: null, serial: null, name: 'Office Chair' },
      ],
    })
    expect(matches.find((m) => m.assetId === 'a1')?.confidence).toBe('exact')
    expect(matches.find((m) => m.assetId === 'a2')?.confidence).toBe('proposed')
  })

  it('builds idempotent GL dedupe keys', () => {
    expect(
      glDedupeKey({
        accountId: 'acc',
        periodKey: '2026-03',
        glAccount: '1600',
        sourceIdentifier: 'row-1',
      }),
    ).toBe('acc|2026-03|1600|row-1')
  })
})
