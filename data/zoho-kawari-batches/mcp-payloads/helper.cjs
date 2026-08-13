/**
 * Helper: load a chunk, emit create args path, and after Zoho response,
 * build remap SQL from ordered ids.
 *
 * Usage:
 *   node build_remap_sql.cjs <chunkFile> <zohoIdsCsv>
 *   node load_create_body.cjs <chunkFile>   # writes body to stdout size info
 */
const fs = require('fs')
const path = require('path')

const cmd = process.argv[2]
const chunkPath = process.argv[3]

if (cmd === 'sql') {
  const idsCsv = process.argv[4]
  const chunk = JSON.parse(fs.readFileSync(chunkPath, 'utf8'))
  const ids = idsCsv.split(',').map((s) => s.trim()).filter(Boolean)
  if (ids.length !== chunk.portal_ids.length) {
    console.error(
      `ID count mismatch: zoho=${ids.length} portals=${chunk.portal_ids.length}`,
    )
    process.exit(1)
  }
  const pairs = chunk.portal_ids.map((pid, i) => [
    pid,
    ids[i],
    chunk.item_values[i],
  ])
  const values = pairs
    .map(
      ([pid, zid, iv]) =>
        `('${pid}'::uuid,'${zid}'::text,${Number(iv)}::numeric)`,
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
  const out =
    path.dirname(chunkPath) +
    '/../sql_' +
    path.basename(chunkPath, '.json') +
    '.sql'
  fs.writeFileSync(out, sql)
  console.log(out)
  console.log('rows', pairs.length)
} else if (cmd === 'info') {
  const chunk = JSON.parse(fs.readFileSync(chunkPath, 'utf8'))
  console.log(
    JSON.stringify({
      count: chunk.data.length,
      first: chunk.data[0]?.Name,
      last: chunk.data[chunk.data.length - 1]?.Name,
      bytes: JSON.stringify(chunk.data).length,
    }),
  )
} else {
  console.error('Usage: node helper.cjs sql|info <chunk> [idsCsv]')
  process.exit(1)
}
