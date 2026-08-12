/**
 * Seed Smith and Sons policy B00000050:
 * - upsert portal account
 * - upsert portal_risk_items (with categories) keyed by deterministic id / zoho_risk_id
 * - upsert portal_policies with covered_items linked via risk_item_id
 *
 * Usage: node scripts/seed-smith-and-sons-B00000050.mjs
 * Then: npx supabase db query --linked -f data/smith-and-sons-B00000050-seed.sql
 */
import fs from 'node:fs'
import path from 'node:path'
import { createHash } from 'node:crypto'

const PARENT_ID = '2547f82f-725b-4cfb-8dab-28a9f9339bf2'
const ACCOUNT_ID = 'b1111111-1111-4111-8111-111111111150'
const POLICY_ROW_ID = 'c2222222-2222-4222-8222-222222222250'
const INPUT = path.resolve('data/smith-and-sons-B00000050.json')
const SQL_OUT = path.resolve('data/smith-and-sons-B00000050-seed.sql')

const SECTION_TO_CATEGORY = {
  'Motor Specified': 'Motor',
  'Electronic Equipment': 'Electronic Equipment',
  Fire: 'Building',
  'Office Contents': 'Contents',
  'Public Liability': 'Liability',
  'Accidental Damage': 'Miscellaneous',
  'Business All Risks': 'Miscellaneous',
}

function uuidFromKey(key) {
  const hash = createHash('sha1').update(String(key)).digest()
  const bytes = Buffer.from(hash.subarray(0, 16))
  bytes[6] = (bytes[6] & 0x0f) | 0x50
  bytes[8] = (bytes[8] & 0x3f) | 0x80
  const hex = bytes.toString('hex')
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20, 32)}`
}

function sqlLit(value) {
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

function mapCategory(section) {
  return SECTION_TO_CATEGORY[String(section ?? '').trim()] ?? 'Miscellaneous'
}

function mapExtensions(risk) {
  return (risk.ratingFactors || []).map((rf, i) => {
    const qa = rf.questionAnswer || {}
    const rate = qa.rate != null ? parseFloat(String(qa.rate).replace(',', '.')) : NaN
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

function assetTag(name, riskId) {
  const base = String(name).replace(/[^a-zA-Z0-9]/g, '').slice(0, 6).toUpperCase() || 'ASSET'
  return `${base}-${String(riskId).slice(-4)}`
}

function extractSerial(risk) {
  const add = risk.additionalInformation || {}
  if (add.vehicleRegistration) return String(add.vehicleRegistration).trim()
  for (const rf of risk.ratingFactors || []) {
    const qa = rf.questionAnswer || {}
    for (const key of ['serial number', 'vin', 'registration Number']) {
      if (qa[key] && String(qa[key]).trim()) return String(qa[key]).trim()
    }
  }
  return null
}

const policy = JSON.parse(fs.readFileSync(INPUT, 'utf8'))
const holder = policy.policyHolder ?? {}
const risks = policy.risks ?? []

const lines = []
lines.push('-- Smith and Sons B00000050 seed')
lines.push('BEGIN;')

lines.push(`
INSERT INTO portal_accounts (
  id, name, parent_account_id, industry, registration_number, vat_number, phone, aegis_status
) VALUES (
  ${sqlLit(ACCOUNT_ID)},
  ${sqlLit(holder.Name || holder.TradingAs || 'Smith and Sons')},
  ${sqlLit(PARENT_ID)},
  ${sqlLit('Commercial')},
  ${sqlLit(holder.RegNumber || null)},
  ${sqlLit(holder.VATNumber || null)},
  ${sqlLit(
    (holder.Contacts ?? []).find((c) => c.contactType === 'Phone')?.contactDetail ?? null,
  )},
  ${sqlLit('active')}
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  parent_account_id = EXCLUDED.parent_account_id,
  industry = EXCLUDED.industry,
  registration_number = EXCLUDED.registration_number,
  vat_number = EXCLUDED.vat_number,
  phone = EXCLUDED.phone,
  aegis_status = EXCLUDED.aegis_status;
`.trim())

const coveredItems = []

for (const risk of risks) {
  const riskId = String(risk.riskId)
  const zohoRiskId = `nimbis-risk-${riskId}`
  const itemId = uuidFromKey(`smith-sons:${zohoRiskId}`)
  const name = String(risk.description ?? 'Risk item').trim()
  const section = String(risk.section ?? 'Uncategorised').trim()
  const category = mapCategory(section)
  const unitCost = risk.insuredAmount != null ? Number(risk.insuredAmount) : 0
  const serial = extractSerial(risk)
  const zohoFields = {
    nimbis_risk_id: riskId,
    nimbis_tracking_id: risk.trackingId ?? null,
    nimbis_section: section,
    nimbis_section_type: risk.sectionType ?? null,
    cover_type: risk.coverType ?? null,
    policy_number: policy.policyNumber,
  }

  lines.push(`
UPDATE portal_risk_items SET
  name = ${sqlLit(name)},
  category = ${sqlLit(category)},
  insurance_section = ${sqlLit(section)},
  unit_cost = ${sqlLit(unitCost)},
  serial_number = COALESCE(${sqlLit(serial)}, serial_number),
  description = ${sqlLit(name)},
  zoho_fields = ${sqlLit(zohoFields)},
  insurance_status = ${sqlLit('Insured with us')},
  updated_at = now()
WHERE account_id = ${sqlLit(ACCOUNT_ID)}
  AND zoho_risk_id = ${sqlLit(zohoRiskId)};

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
SELECT
  ${sqlLit(itemId)},
  ${sqlLit(ACCOUNT_ID)},
  ${sqlLit(zohoRiskId)},
  ${sqlLit(name)},
  ${sqlLit(category)},
  ${sqlLit(section)},
  ${sqlLit(unitCost)},
  0,
  ${sqlLit(toDate(risk.inceptionDate) || new Date().toISOString().slice(0, 10))},
  ${sqlLit('Insured with us')},
  ${sqlLit(assetTag(name, riskId))},
  ${sqlLit(serial)},
  ${sqlLit(name)},
  ${sqlLit(zohoFields)}
WHERE NOT EXISTS (
  SELECT 1 FROM portal_risk_items
  WHERE account_id = ${sqlLit(ACCOUNT_ID)}
    AND zoho_risk_id = ${sqlLit(zohoRiskId)}
);
`.trim())

  coveredItems.push({
    risk_item_id: itemId,
    risk_item_name: name,
    section,
    sum_insured: risk.insuredAmount != null ? Number(risk.insuredAmount) : null,
    premium_excl: risk.premium != null ? Number(risk.premium) : null,
    premium_incl: risk.premiumIncl != null ? Number(risk.premiumIncl) : null,
    cover_status: risk.status ? String(risk.status) : null,
    description: name,
    branch: null,
    external_risk_id: riskId,
    tracking_id: risk.trackingId ? String(risk.trackingId) : null,
    date_added: toDate(risk.inceptionDate),
    inception_date: toDate(risk.inceptionDate),
    extensions: mapExtensions(risk),
    attachments: [],
  })
}

lines.push(`
INSERT INTO portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
) VALUES (
  ${sqlLit(POLICY_ROW_ID)},
  ${sqlLit(ACCOUNT_ID)},
  ${sqlLit(`nimbis-policy-${policy.policyId}`)},
  ${sqlLit(policy.policyNumber)},
  ${sqlLit(policy.insurerPolicyNumber ?? null)},
  ${sqlLit(policy.status ?? 'Active')},
  ${sqlLit(policy.totalPremium != null ? Number(policy.totalPremium) : null)},
  ${sqlLit(policy.totalSasriaPremium != null ? Number(policy.totalSasriaPremium) : null)},
  ${sqlLit(policy.totalFeePremium != null ? Number(policy.totalFeePremium) : null)},
  ${sqlLit(toDate(policy.inceptionDate))},
  ${sqlLit(toDate(policy.renewalDate))},
  ${sqlLit(policy.insurer ?? null)},
  ${sqlLit(policy.product ?? null)},
  ${sqlLit(policy.frequency ?? null)},
  ${sqlLit(coveredItems)}
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
`.trim())

// Ensure covered_items risk_item_id points at the live portal_risk_items row
// (handles pre-existing rows that matched by zoho_risk_id with a different id)
lines.push(`
UPDATE portal_policies p
SET covered_items = (
  SELECT COALESCE(jsonb_agg(
    CASE
      WHEN ri.id IS NOT NULL THEN
        item || jsonb_build_object(
          'risk_item_id', ri.id::text
        )
      ELSE item
    END
    ORDER BY ord
  ), '[]'::jsonb)
  FROM jsonb_array_elements(p.covered_items) WITH ORDINALITY AS t(item, ord)
  LEFT JOIN portal_risk_items ri
    ON ri.account_id = p.account_id
   AND ri.zoho_risk_id = 'nimbis-risk-' || (item->>'external_risk_id')
),
updated_at = now()
WHERE p.id = ${sqlLit(POLICY_ROW_ID)};
`.trim())

lines.push('COMMIT;')

fs.writeFileSync(SQL_OUT, lines.join('\n\n') + '\n', 'utf8')

const byCat = {}
for (const r of risks) {
  const c = mapCategory(r.section)
  byCat[c] = (byCat[c] || 0) + 1
}

console.log(`Wrote ${SQL_OUT}`)
console.log(`Account: ${ACCOUNT_ID}`)
console.log(`Policy: ${POLICY_ROW_ID} / ${policy.policyNumber}`)
console.log(`Risks: ${risks.length}`)
console.log('Categories:', byCat)
