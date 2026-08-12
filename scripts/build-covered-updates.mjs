import fs from 'node:fs'

function esc(j) {
  return JSON.stringify(j).replace(/'/g, "''")
}

const p1 = JSON.parse(fs.readFileSync('data/covered-part1.json', 'utf8'))
const p2 = JSON.parse(fs.readFileSync('data/covered-part2.json', 'utf8'))

const sql1 = `UPDATE portal_policies SET covered_items = '${esc(p1)}'::jsonb, updated_at = now() WHERE id = 'b2222222-2222-4222-8222-222222222248';`
const sql2 = `UPDATE portal_policies SET covered_items = covered_items || '${esc(p2)}'::jsonb, updated_at = now() WHERE id = 'b2222222-2222-4222-8222-222222222248';`

fs.writeFileSync('data/upd1.sql', sql1)
fs.writeFileSync('data/upd2.sql', sql2)
console.log(sql1.length, sql2.length)
