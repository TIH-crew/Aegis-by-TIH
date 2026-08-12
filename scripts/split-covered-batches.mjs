import fs from 'node:fs'

const items = [
  ...JSON.parse(fs.readFileSync('data/covered-part1.json', 'utf8')),
  ...JSON.parse(fs.readFileSync('data/covered-part2.json', 'utf8')),
]

const size = 10
const batches = []
for (let i = 0; i < items.length; i += size) {
  batches.push(items.slice(i, i + size))
}

function esc(j) {
  return JSON.stringify(j).replace(/'/g, "''")
}

const stmts = [
  `UPDATE portal_policies SET covered_items = '[]'::jsonb WHERE id = 'b2222222-2222-4222-8222-222222222248';`,
]
for (const batch of batches) {
  stmts.push(
    `UPDATE portal_policies SET covered_items = covered_items || '${esc(batch)}'::jsonb WHERE id = 'b2222222-2222-4222-8222-222222222248';`,
  )
}
stmts.push(
  `UPDATE portal_policies SET updated_at = now() WHERE id = 'b2222222-2222-4222-8222-222222222248';`,
)

fs.mkdirSync('data/batches', { recursive: true })
stmts.forEach((sql, i) => {
  fs.writeFileSync(`data/batches/b${String(i).padStart(2, '0')}.sql`, sql)
})
console.log('batches', stmts.length, 'avg', Math.round(stmts.slice(1, -1).reduce((s, x) => s + x.length, 0) / (stmts.length - 2)))
