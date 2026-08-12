const fs = require('fs');
const path = require('path');

const input = path.join(__dirname, 'medipost-portal-sync-risks.sql');
const sql = fs.readFileSync(input, 'utf8');
const parts = 3;
const stmts = sql
  .replace(/^BEGIN;\s*/, '')
  .replace(/\s*COMMIT;\s*$/, '')
  .split(/;\s*\n/)
  .filter(Boolean);

const chunkSize = Math.ceil(stmts.length / parts);
for (let i = 0; i < parts; i++) {
  const slice = stmts.slice(i * chunkSize, (i + 1) * chunkSize);
  let chunkSql = slice.join(';\n') + ';';
  if (i === 0) chunkSql = 'BEGIN;\n' + chunkSql;
  if (i === parts - 1) chunkSql = chunkSql + '\nCOMMIT;';
  const out = path.join(__dirname, `medipost-portal-sync-risks-part${i + 1}.sql`);
  fs.writeFileSync(out, chunkSql);
  console.log(out, chunkSql.length);
}
