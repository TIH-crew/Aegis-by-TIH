import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

function buildSql(chunkFile, zohoIds) {
  const chunk = JSON.parse(fs.readFileSync(path.join(__dirname, chunkFile), 'utf8'))
  if (zohoIds.length !== chunk.portal_ids.length) {
    throw new Error(`Length mismatch: ${zohoIds.length} vs ${chunk.portal_ids.length}`)
  }
  const values = chunk.portal_ids
    .map((pid, i) => {
      const iv = chunk.data[i].Item_Value
      const ivSql = iv === null || iv === undefined ? 'NULL' : Number(iv)
      return `('${pid}'::uuid, '${zohoIds[i]}'::text, ${ivSql}::numeric)`
    })
    .join(',\n')

  return `WITH m(portal_id, zoho_id, item_value) AS (VALUES
${values}
)
UPDATE portal_risk_items pri
SET zoho_risk_id = m.zoho_id,
    zoho_fields = COALESCE(pri.zoho_fields, '{}'::jsonb)
      || jsonb_build_object(
           'Item_Value', to_jsonb(m.item_value),
           'Policy_Number', to_jsonb('B00000050'::text)
         )
FROM m
WHERE pri.id = m.portal_id
RETURNING pri.id, pri.zoho_risk_id;`
}

const chunkKey = process.argv[2]
const ids = process.argv[3].split(',')
const sql = buildSql(`_chunk_${chunkKey}.json`, ids)
const out = `_sql_${chunkKey}.sql`
fs.writeFileSync(path.join(__dirname, out), sql)
console.log(JSON.stringify({ out, count: ids.length, first: ids[0], last: ids[ids.length - 1] }))
