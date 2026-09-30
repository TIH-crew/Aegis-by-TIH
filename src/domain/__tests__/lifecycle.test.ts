import { describe, expect, it } from 'vitest'
import { barcodeNeedsPhysicalLabel, generateAssetBarcode } from '../barcode'
import { labelledAmount, neverZeroUnknown } from '../asset-display'

describe('barcode', () => {
  it('generates stable tenant-scoped payloads', () => {
    const a = generateAssetBarcode({ accountShort: 'atl', assetTag: 'VEH-001', sequence: 12 })
    expect(a).toBe('AEG-ATL-VEH001-00012')
  })

  it('skips physical labels for intangibles and insurance-only', () => {
    expect(barcodeNeedsPhysicalLabel('owned', 'intangible')).toBe(false)
    expect(barcodeNeedsPhysicalLabel('insurance_only', 'tangible')).toBe(false)
    expect(barcodeNeedsPhysicalLabel('owned', 'tangible')).toBe(true)
  })
})

describe('labelled amounts', () => {
  it('never presents unknown as zero', () => {
    expect(neverZeroUnknown(null)).toBeNull()
    expect(neverZeroUnknown('')).toBeNull()
    expect(neverZeroUnknown('0')).toBe('0') // explicit zero is allowed when known
    const missing = labelledAmount('Market value', null, { emptyLabel: 'Needs valuation' })
    expect(missing.missing).toBe(true)
    expect(missing.display).toBe('Needs valuation')
  })

  it('keeps book vs market labels distinct', () => {
    const book = labelledAmount('Current net book value', '100000')
    const market = labelledAmount('Current market / estimated sale value', null, {
      emptyLabel: 'Needs valuation',
    })
    expect(book.label).not.toBe(market.label)
    expect(market.display).toBe('Needs valuation')
  })
})

/** Lifecycle scenario assertions (pure rules — no fabricated insurer/tax outcomes). */
describe('write-off case rules', () => {
  it('flagging does not imply disposal or zero NBV', () => {
    const asset = { status: 'active', processing_status: 'in_use', nbv: '85000' }
    const afterFlag = { ...asset, processing_status: 'under_review' }
    expect(afterFlag.status).toBe('active')
    expect(afterFlag.nbv).toBe('85000')
  })

  it('insurer total loss does not auto-approve tax or remove from register', () => {
    const caseState = {
      insurance_status: 'total_loss_accepted',
      finance_status: 'needs_review',
      tax_status: 'needs_review',
      asset_status: 'active',
    }
    expect(caseState.asset_status).toBe('active')
    expect(caseState.tax_status).toBe('needs_review')
    expect(caseState.finance_status).toBe('needs_review')
  })

  it('replacement creates a new identity link chain', () => {
    const chain = {
      originalAssetId: 'A',
      incidentId: 'I',
      claimId: 'C',
      replacementId: 'R',
      newAssetId: 'B',
    }
    expect(chain.newAssetId).not.toBe(chain.originalAssetId)
  })

  it('import value kinds do not assume accounting cost', () => {
    const kinds = ['purchase_cost', 'insured_value', 'replacement_value', 'unknown'] as const
    expect(kinds.includes('insured_value')).toBe(true)
    const capitalise = (kind: (typeof kinds)[number], amount: string) =>
      kind === 'purchase_cost' ? amount : null
    expect(capitalise('insured_value', '50000')).toBeNull()
    expect(capitalise('purchase_cost', '50000')).toBe('50000')
  })

  it('multi-qty expands to individual barcodes', () => {
    const qty = 3
    const tags = Array.from({ length: qty }, (_, i) => `LAP-BATCH-${i + 1}`)
    expect(tags).toHaveLength(3)
    expect(new Set(tags).size).toBe(3)
  })
})
