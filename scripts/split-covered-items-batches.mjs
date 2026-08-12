/**
 * Split Covered_Items payload for Zoho's 100-row subform limit.
 * Usage:
 *   node scripts/split-covered-items-batches.mjs
 */
import fs from 'node:fs'

const payload = JSON.parse(fs.readFileSync('data/medipost-covered-items-payload.json', 'utf8'))
const items = payload.Covered_Items
const batch1 = items.slice(0, 100)
const batch2 = items.slice(100)

fs.writeFileSync(
  'data/medipost-covered-items-batch1.json',
  JSON.stringify({ data: [{ id: payload.id, Covered_Items: batch1 }] }, null, 2),
)
fs.writeFileSync(
  'data/medipost-covered-items-batch2-new.json',
  JSON.stringify(batch2, null, 2),
)
console.log(`Batch1: ${batch1.length}, Batch2 new rows: ${batch2.length}`)
