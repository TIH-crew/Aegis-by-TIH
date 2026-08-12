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

const values = items.map((item, i) => `(${i}, ${lit(item)})`).join(',\n')

const sql = `
BEGIN;

CREATE TABLE IF NOT EXISTS public._seed_covered_items (
  ord int primary key,
  payload jsonb not null
);
TRUNCATE public._seed_covered_items;

INSERT INTO public._seed_covered_items (ord, payload) VALUES
${values};

WITH aggregated AS (
  SELECT jsonb_agg(payload ORDER BY ord) AS items FROM public._seed_covered_items
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
  SELECT jsonb_agg(payload ORDER BY ord) AS items FROM public._seed_covered_items
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

DROP TABLE IF EXISTS public._seed_covered_items;

COMMIT;
`.trim()

fs.writeFileSync(path.resolve('data/seed-medipost-one-shot.sql'), sql)
console.log('bytes', sql.length)
