import fs from 'node:fs'

const sql = fs.readFileSync(process.argv[2], 'utf8')
const b64 = Buffer.from(sql, 'utf8').toString('base64')
const chunkSize = 8000
const chunks = []
for (let i = 0; i < b64.length; i += chunkSize) chunks.push(b64.slice(i, i + chunkSize))

const concat = chunks.map((c, i) => (i === 0 ? `'${c}'` : `|| '${c}'`)).join('\n')
const wrapper = `DO $do$
BEGIN
  EXECUTE convert_from(decode(${concat}, 'base64'), 'UTF8');
END
$do$;`

fs.writeFileSync(process.argv[3], wrapper)
console.log('chunks', chunks.length, 'out', wrapper.length)
