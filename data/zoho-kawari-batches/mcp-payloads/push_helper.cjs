/**
 * Push one Kawari chunk via stdin protocol:
 * Reads chunk JSON path from argv, writes create body to a response file path.
 * Also builds remap SQL given a response JSON from Zoho.
 *
 * Commands:
 *   extract-ids <zohoResponse.json>  -> prints comma-separated ids
 *   remap-sql <chunk.json> <ids.csv> -> writes SQL file, prints path
 *   create-body <chunk.json> <out.json> -> writes {path_variables, body}
 */
const fs = require('fs')

const cmd = process.argv[2]

function loadChunk(p) {
  return JSON.parse(fs.readFileSync(p, 'utf8'))
}

if (cmd === 'extract-ids') {
  const resp = JSON.parse(fs.readFileSync(process.argv[3], 'utf8'))
  const rows = resp.data || resp
  const ids = []
  const fails = []
  for (let i = 0; i < rows.length; i++) {
    const r = rows[i]
    if (r.status === 'success' || r.code === 'SUCCESS') {
      ids.push(r.details.id)
    } else {
      fails.push({ index: i, code: r.code, message: r.message, details: r.details })
    }
  }
  console.log(JSON.stringify({ ids, fails, count: ids.length }))
} else if (cmd === 'remap-sql') {
  const chunk = loadChunk(process.argv[3])
  const ids = process.argv[4].split(',').map((s) => s.trim()).filter(Boolean)
  if (ids.length !== chunk.portal_ids.length) {
    console.error(`Mismatch ids=${ids.length} portals=${chunk.portal_ids.length}`)
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
  const out = process.argv[5] || process.argv[3].replace(/\.json$/, '.sql')
  fs.writeFileSync(out, sql)
  console.log(out)
} else if (cmd === 'create-body') {
  const chunk = loadChunk(process.argv[3])
  const out = process.argv[4]
  fs.writeFileSync(
    out,
    JSON.stringify({
      path_variables: { module: 'Client_Risks' },
      body: { data: chunk.data, trigger: [] },
    }),
  )
  console.log(out, chunk.data.length)
} else {
  console.error('unknown cmd')
  process.exit(1)
}
