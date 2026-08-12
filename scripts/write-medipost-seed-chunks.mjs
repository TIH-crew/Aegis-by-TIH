/**
 * Writes chunked SQL files to apply enriched covered_items via MCP execute_sql.
 */
import fs from 'node:fs'
import path from 'node:path'

const MEDIPOST = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
const MEDI_POL = 'c2222222-2222-4222-8222-222222222248'
const TRAINS_POL = 'b2222222-2222-4222-8222-222222222248'

const items = JSON.parse(fs.readFileSync(path.resolve('data/medipost-covered-items.json'), 'utf8'))
const policy = JSON.parse(
  fs.readFileSync(path.resolve('data/trains-market-B00000048.json'), 'utf8'),
)

function lit(value) {
  if (value === null || value === undefined) return 'NULL'
  if (typeof value === 'number') return Number.isFinite(value) ? String(value) : 'NULL'
  if (typeof value === 'boolean') return value ? 'TRUE' : 'FALSE'
  if (typeof value === 'object') {
    return `'${JSON.stringify(value).replace(/'/g, "''")}'::jsonb`
  }
  return `'${String(value).replace(/'/g, "''")}'`
}

function toDate(value) {
  if (!value) return null
  return String(value).slice(0, 10)
}

const outDir = path.resolve('data/seed-chunks')
fs.rmSync(outDir, { recursive: true, force: true })
fs.mkdirSync(outDir, { recursive: true })

const chunks = []
const size = 15
for (let i = 0; i < items.length; i += size) {
  chunks.push(items.slice(i, i + size))
}

const files = []
files.push({
  name: '00-setup.sql',
  sql: `CREATE TEMP TABLE IF NOT EXISTS tmp_covered_seed (
  ord int primary key,
  payload jsonb not null
);
TRUNCATE tmp_covered_seed;`,
})

chunks.forEach((chunk, ci) => {
  const values = chunk
    .map((item, j) => `(${ci * size + j}, ${lit(item)})`)
    .join(',\n')
  files.push({
    name: `01-chunk-${String(ci).padStart(2, '0')}.sql`,
    sql: `INSERT INTO tmp_covered_seed (ord, payload) VALUES\n${values};`,
  })
})

files.push({
  name: '02-apply.sql',
  sql: `
WITH aggregated AS (
  SELECT jsonb_agg(payload ORDER BY ord) AS items FROM tmp_covered_seed
)
UPDATE public.portal_policies p
SET covered_items = aggregated.items, updated_at = now()
FROM aggregated
WHERE p.id = ${lit(TRAINS_POL)};

INSERT INTO public.portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
)
SELECT
  ${lit(MEDI_POL)},
  ${lit(MEDIPOST)},
  ${lit(`nimbis-policy-${policy.policyId}-medipost`)},
  ${lit(policy.policyNumber)},
  ${lit(policy.insurerPolicyNumber ?? null)},
  ${lit(policy.status ?? 'Active')},
  ${lit(policy.totalPremium != null ? Number(policy.totalPremium) : null)},
  ${lit(policy.totalSasriaPremium != null ? Number(policy.totalSasriaPremium) : null)},
  ${lit(policy.totalFeePremium != null ? Number(policy.totalFeePremium) : null)},
  ${lit(toDate(policy.inceptionDate))},
  ${lit(toDate(policy.renewalDate))},
  ${lit(policy.insurer ?? null)},
  ${lit(policy.product ?? null)},
  ${lit(policy.frequency ?? null)},
  aggregated.items
FROM (
  SELECT jsonb_agg(payload ORDER BY ord) AS items FROM tmp_covered_seed
) aggregated
ON CONFLICT (id) DO UPDATE SET
  account_id = EXCLUDED.account_id,
  zoho_policy_id = EXCLUDED.zoho_policy_id,
  policy_number = EXCLUDED.policy_number,
  insurer_policy_number = EXCLUDED.insurer_policy_number,
  status = EXCLUDED.status,
  premium = EXCLUDED.premium,
  sasria_premium = EXCLUDED.sasria_premium,
  fee_premium = EXCLUDED.fee_premium,
  inception_date = EXCLUDED.inception_date,
  renewal_date = EXCLUDED.renewal_date,
  insurer = EXCLUDED.insurer,
  product_line = EXCLUDED.product_line,
  frequency = EXCLUDED.frequency,
  covered_items = EXCLUDED.covered_items,
  updated_at = now();
`.trim(),
})

for (const file of files) {
  const p = path.join(outDir, file.name)
  fs.writeFileSync(p, file.sql)
  console.log(file.name, file.sql.length)
}

fs.writeFileSync(
  path.join(outDir, 'manifest.json'),
  JSON.stringify(
    files.map((f) => f.name),
    null,
    2,
  ),
)
console.log('chunks', chunks.length)
