/**
 * Seeds Trains Market (Nimbis) policy B00000048 into portal_policies.covered_items.
 * Usage: node scripts/seed-trains-market-policy.mjs path/to/policy.json
 *
 * Expects SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY, or falls back to writing SQL for MCP.
 */
import fs from 'node:fs'
import path from 'node:path'
import { createClient } from '@supabase/supabase-js'

const PARENT_ID = '2547f82f-725b-4cfb-8dab-28a9f9339bf2'
const TRAINS_ACCOUNT_ID = 'b1111111-1111-4111-8111-111111111101'
const POLICY_ROW_ID = 'b2222222-2222-4222-8222-222222222248'

function toDate(value) {
  if (!value) return null
  return String(value).slice(0, 10)
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

function mapRisk(risk, idx = 0) {
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

function buildSeed(policy) {
  const holder = policy.policyHolder ?? {}
  const covered_items = (policy.risks ?? []).map((risk, idx) => mapRisk(risk, idx))
  return {
    account: {
      id: TRAINS_ACCOUNT_ID,
      name: holder.Name || holder.TradingAs || 'Trains Market',
      parent_account_id: PARENT_ID,
      industry: 'Retail',
      registration_number: holder.RegNumber || null,
      vat_number: holder.VATNumber || null,
      phone:
        (holder.Contacts ?? []).find((c) => c.contactType === 'Phone')?.contactDetail ?? null,
      website: null,
      aegis_status: 'active',
    },
    policy: {
      id: POLICY_ROW_ID,
      account_id: TRAINS_ACCOUNT_ID,
      zoho_policy_id: `nimbis-policy-${policy.policyId}`,
      policy_number: policy.policyNumber,
      insurer_policy_number: policy.insurerPolicyNumber ?? null,
      status: policy.status ?? 'Active',
      premium: policy.totalPremium != null ? Number(policy.totalPremium) : null,
      sasria_premium:
        policy.totalSasriaPremium != null ? Number(policy.totalSasriaPremium) : null,
      fee_premium: policy.totalFeePremium != null ? Number(policy.totalFeePremium) : null,
      inception_date: toDate(policy.inceptionDate),
      renewal_date: toDate(policy.renewalDate),
      insurer: policy.insurer ?? null,
      product_line: policy.product ?? null,
      frequency: policy.frequency ?? null,
      covered_items,
    },
  }
}

function sqlLiteral(value) {
  if (value === null || value === undefined) return 'NULL'
  if (typeof value === 'number') return Number.isFinite(value) ? String(value) : 'NULL'
  if (typeof value === 'boolean') return value ? 'TRUE' : 'FALSE'
  if (typeof value === 'object') {
    return `'${JSON.stringify(value).replace(/'/g, "''")}'::jsonb`
  }
  return `'${String(value).replace(/'/g, "''")}'`
}

function toSql(seed) {
  const a = seed.account
  const p = seed.policy
  return `
BEGIN;

INSERT INTO portal_accounts (
  id, name, parent_account_id, industry, registration_number, vat_number, phone, aegis_status
) VALUES (
  ${sqlLiteral(a.id)},
  ${sqlLiteral(a.name)},
  ${sqlLiteral(a.parent_account_id)},
  ${sqlLiteral(a.industry)},
  ${sqlLiteral(a.registration_number)},
  ${sqlLiteral(a.vat_number)},
  ${sqlLiteral(a.phone)},
  ${sqlLiteral(a.aegis_status)}
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  parent_account_id = EXCLUDED.parent_account_id,
  industry = EXCLUDED.industry,
  registration_number = EXCLUDED.registration_number,
  vat_number = EXCLUDED.vat_number,
  phone = EXCLUDED.phone,
  aegis_status = EXCLUDED.aegis_status;

INSERT INTO portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
) VALUES (
  ${sqlLiteral(p.id)},
  ${sqlLiteral(p.account_id)},
  ${sqlLiteral(p.zoho_policy_id)},
  ${sqlLiteral(p.policy_number)},
  ${sqlLiteral(p.insurer_policy_number)},
  ${sqlLiteral(p.status)},
  ${sqlLiteral(p.premium)},
  ${sqlLiteral(p.sasria_premium)},
  ${sqlLiteral(p.fee_premium)},
  ${sqlLiteral(p.inception_date)},
  ${sqlLiteral(p.renewal_date)},
  ${sqlLiteral(p.insurer)},
  ${sqlLiteral(p.product_line)},
  ${sqlLiteral(p.frequency)},
  ${sqlLiteral(p.covered_items)}
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
`.trim()
}

const inputPath = process.argv[2]
if (!inputPath) {
  console.error('Usage: node scripts/seed-trains-market-policy.mjs <policy.json>')
  process.exit(1)
}

const raw = JSON.parse(fs.readFileSync(path.resolve(inputPath), 'utf8'))
const seed = buildSeed(raw)
const sqlPath = path.resolve('data/trains-market-policy-seed.sql')
fs.mkdirSync(path.dirname(sqlPath), { recursive: true })
fs.writeFileSync(sqlPath, toSql(seed), 'utf8')
console.log(`Wrote ${sqlPath}`)
console.log(`Covered items: ${seed.policy.covered_items.length}`)
console.log(`Premium: ${seed.policy.premium}`)

const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
const key = process.env.SUPABASE_SERVICE_ROLE_KEY
if (url && key) {
  const admin = createClient(url, key, { auth: { persistSession: false } })
  const { error: accErr } = await admin.from('portal_accounts').upsert(seed.account)
  if (accErr) throw accErr
  const { error: polErr } = await admin.from('portal_policies').upsert(seed.policy)
  if (polErr) throw polErr
  console.log('Seeded via Supabase service role')
} else {
  console.log('No SUPABASE_SERVICE_ROLE_KEY — SQL file ready for MCP execute_sql')
}
