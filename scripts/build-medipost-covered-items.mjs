/**
 * Build Zoho Policies.Covered_Items payload from mapping JSON.
 * Usage: node scripts/build-medipost-covered-items.mjs > data/medipost-covered-items-payload.json
 */
import fs from 'node:fs'
import { toZohoCoveredItem } from './lib/medipost-risk-match.mjs'

const mapping = JSON.parse(fs.readFileSync('data/medipost-policy-risk-mapping.json', 'utf8'))
const covered = mapping.rows.map(toZohoCoveredItem).filter(Boolean)

if (covered.length > 100) {
  console.error(`Zoho Covered_Items capped at 100; got ${covered.length}`)
  process.exit(1)
}

const payload = {
  id: '7351644000001876587',
  Covered_Items: covered,
}

const outPath = 'data/medipost-covered-items-payload.json'
fs.writeFileSync(outPath, JSON.stringify(payload, null, 2))
console.log(`Wrote ${outPath} with ${covered.length} Covered_Items rows`)
