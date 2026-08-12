/**
 * Reconcile Nimbis policy B00000048 schedule lines with Medipost Zoho Client_Risks.
 *
 * Usage:
 *   node scripts/reconcile-medipost-policy-risks.mjs [policy.json] [zoho-risks.json]
 *
 * Outputs:
 *   data/medipost-policy-risk-mapping.csv
 *   data/medipost-policy-risk-mapping.json
 */
import fs from 'node:fs'
import path from 'node:path'
import {
  buildMappingRows,
  csvEscape,
  toZohoCoveredItem,
} from './lib/medipost-risk-match.mjs'

const policyPath = path.resolve(process.argv[2] ?? 'data/trains-market-B00000048.json')
const zohoPath = path.resolve(process.argv[3] ?? 'data/medipost-zoho-risks.json')

if (!fs.existsSync(policyPath)) {
  console.error(`Policy file not found: ${policyPath}`)
  process.exit(1)
}
if (!fs.existsSync(zohoPath)) {
  console.error(`Zoho risks file not found: ${zohoPath}`)
  console.error('Export via COQL: select id, Name from Client_Risks where Item_Owned_By.id = ...')
  process.exit(1)
}

const policy = JSON.parse(fs.readFileSync(policyPath, 'utf8'))
const zohoRisks = JSON.parse(fs.readFileSync(zohoPath, 'utf8'))

const { rows, zohoOnly, summary } = buildMappingRows(policy, zohoRisks)

const coveredItems = rows.map(toZohoCoveredItem).filter(Boolean)

const out = {
  generated_at: new Date().toISOString(),
  policy_number: policy.policyNumber,
  policy_id_nimbis: policy.policyId,
  summary,
  rows,
  zoho_only: zohoOnly,
  zoho_covered_items: coveredItems,
}

const jsonOut = path.resolve('data/medipost-policy-risk-mapping.json')
const csvOut = path.resolve('data/medipost-policy-risk-mapping.csv')

fs.writeFileSync(jsonOut, JSON.stringify(out, null, 2))

const headers = [
  'nimbis_risk_id',
  'section',
  'description',
  'sum_insured',
  'premium_excl',
  'match_status',
  'zoho_risk_id',
  'zoho_risk_name',
  'portal_risk_id',
  'action',
]
const csvLines = [
  headers.join(','),
  ...rows.map((row) =>
    headers.map((h) => csvEscape(row[h])).join(','),
  ),
]
fs.writeFileSync(csvOut, csvLines.join('\n'))

console.log(`Wrote ${csvOut} (${rows.length} rows)`)
console.log(`Wrote ${jsonOut}`)
console.log('Summary:', summary)
console.log(`Zoho-only client risks (not on schedule): ${zohoOnly.length}`)
console.log(`Covered_Items payload rows: ${coveredItems.length}`)
