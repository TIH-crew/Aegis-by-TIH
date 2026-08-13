const fs = require('fs')
const chunkPath = process.argv[2]
const respPath = process.argv[3]
const chunk = JSON.parse(fs.readFileSync(chunkPath, 'utf8'))
const resp = JSON.parse(fs.readFileSync(respPath, 'utf8'))
const rows = resp.data || resp
const ids = []
const fails = []
for (let i = 0; i < rows.length; i++) {
  const r = rows[i]
  if (r.status === 'success' || r.code === 'SUCCESS') {
    ids.push(r.details.id)
  } else {
    fails.push({
      i,
      name: chunk.data[i]?.Name,
      portal_id: chunk.portal_ids[i],
      code: r.code,
      message: r.message,
    })
  }
}
if (fails.length) {
  console.error(JSON.stringify(fails, null, 2))
}
if (ids.length !== chunk.portal_ids.length) {
  console.error('count mismatch', ids.length, chunk.portal_ids.length)
  process.exit(1)
}
const values = chunk.portal_ids
  .map(
    (pid, i) =>
      `('${pid}'::uuid,'${ids[i]}'::text,${Number(chunk.item_values[i])}::numeric)`,
  )
  .join(',\n')
const sql = `UPDATE portal_risk_items pri
SET zoho_risk_id = v.zoho_risk_id,
    zoho_fields = coalesce(pri.zoho_fields,'{}'::jsonb) || jsonb_build_object('Item_Value', v.item_value, 'Policy_Number', 'B00000047'),
    updated_at = now()
FROM (VALUES
${values}
) AS v(portal_id, zoho_risk_id, item_value)
WHERE pri.id = v.portal_id
RETURNING pri.id;`
const out = respPath.replace(/\.json$/, '.sql')
fs.writeFileSync(out, sql)
fs.writeFileSync(respPath.replace(/\.json$/, '_ids.txt'), ids.join(','))
console.log(JSON.stringify({ ok: ids.length, sql: out, fails: fails.length }))
