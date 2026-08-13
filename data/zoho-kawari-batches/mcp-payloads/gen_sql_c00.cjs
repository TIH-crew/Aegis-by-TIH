const fs = require('fs')
const chunk = JSON.parse(
  fs.readFileSync(__dirname + '/chunks/batch_00_c00.json', 'utf8'),
)
const pairs = []
for (let i = 0; i < 17; i++) {
  pairs.push([
    chunk.portal_ids[i],
    '7351644000004002' + String(i + 1).padStart(3, '0'),
    chunk.item_values[i],
  ])
}
pairs.push([chunk.portal_ids[17], '7351644000003989002', chunk.item_values[17]])
pairs.push([chunk.portal_ids[18], '7351644000004002018', chunk.item_values[18]])
for (let i = 19; i <= 24; i++) {
  pairs.push([
    chunk.portal_ids[i],
    '7351644000004002' + String(i).padStart(3, '0'),
    chunk.item_values[i],
  ])
}
const values = pairs
  .map(
    ([pid, zid, iv]) =>
      `('${pid}'::uuid,'${zid}'::text,${Number(iv)}::numeric)`,
  )
  .join(',\n')
const idList = pairs.map((p) => `'${p[0]}'`).join(',')
const sql = `UPDATE portal_risk_items pri
SET zoho_risk_id = v.zoho_risk_id,
    zoho_fields = coalesce(pri.zoho_fields,'{}'::jsonb) || jsonb_build_object('Item_Value', v.item_value, 'Policy_Number', 'B00000047'),
    updated_at = now()
FROM (VALUES
${values}
) AS v(portal_id, zoho_risk_id, item_value)
WHERE pri.id = v.portal_id;
SELECT count(*)::int AS updated FROM portal_risk_items WHERE id IN (${idList}) AND zoho_risk_id ~ '^[0-9]+$';`
fs.writeFileSync(__dirname + '/sql_c00.sql', sql)
console.log('pairs', pairs.length)
