/**
 * Generate SQL to sync Medipost portal risks + link covered_items (for MCP apply).
 * Usage: node scripts/generate-medipost-portal-sync-sql.mjs > data/medipost-portal-sync.sql
 */
import fs from 'node:fs'
import {
  MEDIPOST_PORTAL_ACCOUNT,
  MEDIPOST_POLICY_PORTAL_ID,
  MEDIPOST_POLICY_ZOHO_ID,
} from './lib/medipost-risk-match.mjs'

function sqlLit(value) {
  if (value === null || value === undefined) return 'NULL'
  if (typeof value === 'number') return String(value)
  if (typeof value === 'boolean') return value ? 'TRUE' : 'FALSE'
  return `'${String(value).replace(/'/g, "''")}'`
}

const RISK_TYPE_TO_CATEGORY = {
  Building: 'Building',
  'Electronic Equipment': 'Electronic Equipment',
  'Office Contents': 'Contents',
  'All Risk / Portable Item': 'Miscellaneous',
  'Business Vehicle': 'Miscellaneous',
}

const zohoRisks = JSON.parse(fs.readFileSync('data/medipost-zoho-risks.json', 'utf8'))
const mapping = JSON.parse(fs.readFileSync('data/medipost-policy-risk-mapping.json', 'utf8'))
const policy = JSON.parse(fs.readFileSync('data/trains-market-B00000048.json', 'utf8'))

const zohoByNimbis = new Map(mapping.rows.map((r) => [String(r.nimbis_risk_id), String(r.zoho_risk_id)]))

const lines = ['BEGIN;']

for (const record of zohoRisks) {
  const zohoId = String(record.id)
  const name = String(record.Name ?? 'Risk item').trim()
  const category = RISK_TYPE_TO_CATEGORY[record.Risk_Type] ?? 'Miscellaneous'
  const unitCost = record.Total_Sum_Insured != null ? Number(record.Total_Sum_Insured) : 0
  const tag = name.replace(/[^a-zA-Z0-9]/g, '').slice(0, 6).toUpperCase() || 'ASSET'

  lines.push(`INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  ${sqlLit(MEDIPOST_PORTAL_ACCOUNT)},
  ${sqlLit(zohoId)},
  ${sqlLit(name)},
  ${sqlLit(category)},
  ${sqlLit(category)},
  ${sqlLit(unitCost)},
  0,
  CURRENT_DATE,
  'Insured with us',
  ${sqlLit(`${tag}-${zohoId.slice(-4)}`)},
  ${sqlLit(JSON.stringify({ Risk_Type: record.Risk_Type, Risk_Category: record.Risk_Category }))}::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = ${sqlLit(MEDIPOST_PORTAL_ACCOUNT)} AND zoho_risk_id = ${sqlLit(zohoId)}
);`)

  lines.push(`UPDATE public.portal_risk_items SET
  name = ${sqlLit(name)},
  category = ${sqlLit(category)},
  insurance_section = ${sqlLit(category)},
  unit_cost = ${sqlLit(unitCost)},
  zoho_fields = ${sqlLit(JSON.stringify({ Risk_Type: record.Risk_Type, Risk_Category: record.Risk_Category }))}::jsonb,
  updated_at = now()
WHERE account_id = ${sqlLit(MEDIPOST_PORTAL_ACCOUNT)} AND zoho_risk_id = ${sqlLit(zohoId)};`)
}

// Build covered items from existing portal structure in seed file logic
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
      premium_incl: premium_excl != null ? Math.round(premium_excl * 1.15 * 100) / 100 : null,
      details: Object.fromEntries(Object.entries(qa).map(([k, v]) => [k, String(v ?? '')])),
    }
  })
}

const coveredTemplate = (policy.risks || []).map((risk, idx) => {
  const key = String(risk.riskId ?? risk.trackingId ?? idx)
  const zohoId = zohoByNimbis.get(String(risk.riskId))
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
    zoho_risk_id: zohoId ?? null,
    tracking_id: risk.trackingId ? String(risk.trackingId) : null,
    date_added: risk.inceptionDate ? String(risk.inceptionDate).slice(0, 10) : null,
    extensions: mapExtensions(risk),
    attachments: [],
    _zoho_link: zohoId,
  }
})

lines.push(`CREATE TEMP TABLE medipost_cov_link (
  external_risk_id text PRIMARY KEY,
  zoho_risk_id text NOT NULL
) ON COMMIT DROP;`)

for (const row of coveredTemplate) {
  if (!row._zoho_link) continue
  lines.push(
    `INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES (${sqlLit(row.external_risk_id)}, ${sqlLit(row._zoho_link)}) ON CONFLICT DO NOTHING;`,
  )
}

const coveredJson = coveredTemplate.map(({ _zoho_link, ...rest }) => rest)

lines.push(`UPDATE public.portal_policies p SET
  zoho_policy_id = ${sqlLit(MEDIPOST_POLICY_ZOHO_ID)},
  covered_items = (
    SELECT COALESCE(jsonb_agg(
      item || jsonb_build_object(
        'risk_item_id', pri.id::text,
        'zoho_risk_id', l.zoho_risk_id
      )
    ), '[]'::jsonb)
    FROM jsonb_array_elements(${sqlLit(JSON.stringify(coveredJson))}::jsonb) AS item
    LEFT JOIN medipost_cov_link l ON l.external_risk_id = item->>'external_risk_id'
    LEFT JOIN public.portal_risk_items pri
      ON pri.account_id = ${sqlLit(MEDIPOST_PORTAL_ACCOUNT)}
     AND pri.zoho_risk_id = l.zoho_risk_id
  ),
  updated_at = now()
WHERE p.id = ${sqlLit(MEDIPOST_POLICY_PORTAL_ID)};`)

lines.push(`COMMIT;`)

process.stdout.write(lines.join('\n'))
