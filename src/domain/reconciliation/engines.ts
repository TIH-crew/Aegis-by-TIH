import { cmp, fromDb, money, sub, toDb, type Money } from '../money'

export type ReconType =
  | 'physical_to_register'
  | 'subledger_to_gl'
  | 'book_to_tax'
  | 'assets_to_insurance'

export type Tolerance = Money

export type AmountPair = {
  registerAmount: Money
  externalAmount: Money
  tolerance: Money
}

export type DifferenceResult = {
  difference: Money
  withinTolerance: boolean
  registerAmount: string
  externalAmount: string
  tolerance: string
}

/** Never hide a difference by rounding — compare at stored precision. */
export function computeDifference(pair: AmountPair): DifferenceResult {
  const difference = sub(pair.registerAmount, pair.externalAmount)
  const abs = money(difference.amount.abs(), difference.currency)
  const withinTolerance = abs.amount.lte(pair.tolerance.amount)
  return {
    difference,
    withinTolerance,
    registerAmount: toDb(pair.registerAmount),
    externalAmount: toDb(pair.externalAmount),
    tolerance: toDb(pair.tolerance),
  }
}

export type GlRollForward = {
  openingCost: Money
  additions: Money
  disposals: Money
  closingCost: Money
  depreciationExpense: Money
  openingAccumDep: Money
  closingAccumDep: Money
}

export type GlBalances = {
  costAccount: Money
  accumDepAccount: Money
  depExpenseAccount: Money
}

export type SubledgerToGlException = {
  account: 'cost' | 'accum_dep' | 'dep_expense'
  registerAmount: Money
  glAmount: Money
  difference: Money
  withinTolerance: boolean
}

export function reconcileSubledgerToGl(
  register: GlRollForward,
  gl: GlBalances,
  tolerance: Money,
): SubledgerToGlException[] {
  const checks: { account: SubledgerToGlException['account']; reg: Money; glAmt: Money }[] = [
    { account: 'cost', reg: register.closingCost, glAmt: gl.costAccount },
    { account: 'accum_dep', reg: register.closingAccumDep, glAmt: gl.accumDepAccount },
    { account: 'dep_expense', reg: register.depreciationExpense, glAmt: gl.depExpenseAccount },
  ]
  return checks.map((c) => {
    const d = computeDifference({
      registerAmount: c.reg,
      externalAmount: c.glAmt,
      tolerance,
    })
    return {
      account: c.account,
      registerAmount: c.reg,
      glAmount: c.glAmt,
      difference: d.difference,
      withinTolerance: d.withinTolerance,
    }
  })
}

export type BookToTaxBridgeLine = {
  assetId: string
  bookDepreciation: Money
  taxAllowanceApproved: Money
  taxAllowanceProvisional: Money
  bookNbv: Money
  taxValue: Money
  provisional: boolean
}

export function buildBookToTaxBridge(lines: BookToTaxBridgeLine[]) {
  return lines.map((line) => ({
    ...line,
    addBack: sub(line.bookDepreciation, line.taxAllowanceApproved),
    nbvVsTax: sub(line.bookNbv, line.taxValue),
    provisionalFlag: line.provisional,
  }))
}

export type InsuranceMatchMethod = 'asset_tag' | 'vin' | 'serial' | 'policy_item_id' | 'fuzzy_name'

export type InsuranceMatchCandidate = {
  assetId: string
  riskItemId: string
  method: InsuranceMatchMethod
  confidence: 'exact' | 'high' | 'proposed'
}

/**
 * Deterministic identifiers first. Fuzzy name matches are proposed only — never auto-merge.
 */
export function rankInsuranceMatches(opts: {
  assets: { id: string; assetTag: string; vin?: string | null; serial?: string | null; name: string }[]
  riskItems: {
    id: string
    assetTag?: string | null
    vin?: string | null
    serial?: string | null
    name: string
    scheduleItemId?: string | null
  }[]
}): InsuranceMatchCandidate[] {
  const out: InsuranceMatchCandidate[] = []
  const usedRisk = new Set<string>()

  for (const asset of opts.assets) {
    for (const risk of opts.riskItems) {
      if (usedRisk.has(risk.id)) continue
      if (risk.assetTag && risk.assetTag === asset.assetTag) {
        out.push({ assetId: asset.id, riskItemId: risk.id, method: 'asset_tag', confidence: 'exact' })
        usedRisk.add(risk.id)
        break
      }
      if (asset.vin && risk.vin && asset.vin === risk.vin) {
        out.push({ assetId: asset.id, riskItemId: risk.id, method: 'vin', confidence: 'exact' })
        usedRisk.add(risk.id)
        break
      }
      if (asset.serial && risk.serial && asset.serial === risk.serial) {
        out.push({ assetId: asset.id, riskItemId: risk.id, method: 'serial', confidence: 'exact' })
        usedRisk.add(risk.id)
        break
      }
    }
  }

  // Proposed fuzzy — only if still unmatched
  const matchedAssets = new Set(out.map((o) => o.assetId))
  for (const asset of opts.assets) {
    if (matchedAssets.has(asset.id)) continue
    const norm = asset.name.trim().toLowerCase()
    if (norm.length < 4) continue
    for (const risk of opts.riskItems) {
      if (usedRisk.has(risk.id)) continue
      if (risk.name.trim().toLowerCase() === norm) {
        out.push({
          assetId: asset.id,
          riskItemId: risk.id,
          method: 'fuzzy_name',
          confidence: 'proposed',
        })
        usedRisk.add(risk.id)
        break
      }
    }
  }

  return out
}

export function glDedupeKey(parts: {
  accountId: string
  periodKey: string
  glAccount: string
  sourceIdentifier: string
}): string {
  return [parts.accountId, parts.periodKey, parts.glAccount, parts.sourceIdentifier].join('|')
}

export { fromDb, money, cmp, toDb }
