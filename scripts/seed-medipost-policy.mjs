/**
 * Enrich Trains Market covered_items + copy policy B00000048 onto Medipost.
 * Writes data/seed-medipost-policy.sql for MCP / psql apply.
 */
import fs from 'node:fs'
import path from 'node:path'

const MEDIPOST = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
const MEDI_POL = 'c2222222-2222-4222-8222-222222222248'
const TRAINS_POL = 'b2222222-2222-4222-8222-222222222248'

function toDate(value) {
  if (!value) return null
  return String(value).slice(0, 10)
}

function lit(value) {
  if (value === null || value === undefined) return 'NULL'
  if (typeof value === 'number') return Number.isFinite(value) ? String(value) : 'NULL'
  if (typeof value === 'boolean') return value ? 'TRUE' : 'FALSE'
  if (typeof value === 'object') {
    return `'${JSON.stringify(value).replace(/'/g, "''")}'::jsonb`
  }
  return `'${String(value).replace(/'/g, "''")}'`
}

function mapExtensions(risk) {
  return (risk.ratingFactors || []).map((rf, i) => {
    const qa = rf.questionAnswer || {}
    const rate = qa.rate != null ? parseFloat(String(qa.rate)) : NaN
    const sum = risk.insuredAmount != null ? Number(risk.insuredAmount) : null
    let premium_excl = null
    if (Number.isFinite(rate) && sum != null) {
      premium_excl = Math.round(((sum * rate) / 100) * 100) / 100
    }
    return {
      id: `ext-${risk.riskId ?? 'x'}-${i}`,
      name: (rf.group && String(rf.group).trim()) || 'Cover terms',
      sum_insured: sum,
      premium_excl,
      premium_incl:
        premium_excl != null ? Math.round(premium_excl * 1.15 * 100) / 100 : null,
      details: Object.fromEntries(
        Object.entries(qa).map(([k, v]) => [k, String(v ?? '')]),
      ),
    }
  })
}

function mapRisk(risk, idx) {
  const key = String(risk.riskId ?? risk.trackingId ?? idx)
  const attachments =
    idx % 17 === 0
      ? [
          {
            id: `att-${key}-1`,
            file_name: 'Item photo.jpg',
            url: `https://picsum.photos/seed/${key}/800/600`,
            type: 'image/jpeg',
          },
          {
            id: `att-${key}-2`,
            file_name: 'Serial plate.jpg',
            url: `https://picsum.photos/seed/${key}b/800/600`,
            type: 'image/jpeg',
          },
        ]
      : []

  return {
    risk_item_id: null,
    risk_item_name: String(risk.description ?? 'Risk item').trim(),
    section: String(risk.section ?? 'Uncategorised').trim(),
    sum_insured: risk.insuredAmount != null ? Number(risk.insuredAmount) : null,
    premium_excl: risk.premium != null ? Number(risk.premium) : null,
    premium_incl: risk.premiumIncl != null ? Number(risk.premiumIncl) : null,
    cover_status: risk.status ? String(risk.status) : null,
    description: String(risk.description ?? '').trim(),
    branch: null,
    external_risk_id: risk.riskId != null ? String(risk.riskId) : null,
    tracking_id: risk.trackingId ? String(risk.trackingId) : null,
    date_added: toDate(risk.inceptionDate),
    extensions: mapExtensions(risk),
    attachments,
  }
}

const policy = JSON.parse(
  fs.readFileSync(path.resolve('data/trains-market-B00000048.json'), 'utf8'),
)
const items = (policy.risks || []).map(mapRisk)

const sql = `BEGIN;
UPDATE public.portal_policies
SET covered_items = ${lit(items)}, updated_at = now()
WHERE id = ${lit(TRAINS_POL)};

INSERT INTO public.portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
) VALUES (
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
  ${lit(items)}
)
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
COMMIT;
`

const out = path.resolve('data/seed-medipost-policy.sql')
fs.writeFileSync(out, sql)
fs.writeFileSync(path.resolve('data/medipost-covered-items.json'), JSON.stringify(items))
console.log(`Wrote ${out} (${sql.length} bytes), items=${items.length}`)
