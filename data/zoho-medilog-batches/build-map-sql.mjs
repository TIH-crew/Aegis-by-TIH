import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

/**
 * @param {string} chunkFile
 * @param {string[]} zohoIds
 * @param {string} outName
 */
export function buildMapSql(chunkFile, zohoIds, outName) {
  const chunk = JSON.parse(fs.readFileSync(path.join(__dirname, chunkFile), 'utf8'))
  if (zohoIds.length !== chunk.portal_ids.length) {
    throw new Error(`Length mismatch: ${zohoIds.length} vs ${chunk.portal_ids.length}`)
  }
  const values = chunk.portal_ids
    .map((pid, i) => {
      const iv = chunk.data[i].Item_Value
      const zid = zohoIds[i]
      const ivSql = iv === null || iv === undefined ? 'NULL' : Number(iv)
      return `('${pid}'::uuid, '${zid}'::text, ${ivSql}::numeric)`
    })
    .join(',\n')

  const sql = `WITH m(portal_id, zoho_id, item_value) AS (VALUES
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

  fs.writeFileSync(path.join(__dirname, outName), sql)
  return { count: chunk.portal_ids.length, sql }
}

const args = process.argv.slice(2)
if (args.length >= 3) {
  const [chunkFile, idsCsv, outName] = args
  const zohoIds = idsCsv.split(',')
  const r = buildMapSql(chunkFile, zohoIds, outName)
  console.log(JSON.stringify({ count: r.count, out: outName }))
}
