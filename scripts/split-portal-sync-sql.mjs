import fs from 'node:fs'

const sql = fs.readFileSync('data/medipost-portal-sync.sql', 'utf8')
const idx = sql.indexOf('CREATE TEMP TABLE')
fs.writeFileSync('data/medipost-portal-sync-risks.sql', sql.slice(0, idx) + 'COMMIT;\n')
fs.writeFileSync('data/medipost-portal-sync-policy.sql', 'BEGIN;\n' + sql.slice(idx))
console.log('split ok')
