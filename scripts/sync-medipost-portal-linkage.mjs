/**
 * Sync Medipost portal_risk_items from Zoho export and link portal_policies.covered_items.
 *
 * Requires supabase/functions/.env with SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY
 *
 * Usage: node scripts/sync-medipost-portal-linkage.mjs
 */
import fs from 'node:fs'
import path from 'node:path'
import { createClient } from '@supabase/supabase-js'
import {
  MEDIPOST_PORTAL_ACCOUNT,
  MEDIPOST_POLICY_PORTAL_ID,
  MEDIPOST_POLICY_ZOHO_ID,
  MEDIPOST_ZOHO_ACCOUNT,
} from './lib/medipost-risk-match.mjs'

function loadEnv(filePath) {
  if (!fs.existsSync(filePath)) return {}
  const out = {}
  for (const line of fs.readFileSync(filePath, 'utf8').split(/\r?\n/)) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('#')) continue
    const eq = trimmed.indexOf('=')
    if (eq === -1) continue
    out[trimmed.slice(0, eq).trim()] = trimmed.slice(eq + 1).trim()
  }
  return out
}

const env = {
  ...loadEnv(path.resolve('supabase/functions/.env')),
  ...loadEnv(path.resolve('.env')),
}

const url = env.SUPABASE_URL || env.VITE_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) {
  console.error('Missing SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY in supabase/functions/.env')
  process.exit(1)
}

const supabase = createClient(url, key)

const RISK_TYPE_TO_CATEGORY = {
  Building: 'Building',
  Buildings: 'Building',
  'Motor Vehicle': 'Motor',
  'Household Contents': 'Contents',
  'Office Contents': 'Contents',
  'Electronic Equipment': 'Electronic Equipment',
  'Plant & Machinery': 'Plant & Machinery',
  'Business Property': 'Miscellaneous',
  Other: 'Miscellaneous',
}

function mapCategory(riskType) {
  return RISK_TYPE_TO_CATEGORY[riskType] ?? 'Miscellaneous'
}

function assetTagFromName(name) {
  const base = name.replace(/[^a-zA-Z0-9]/g, '').slice(0, 6).toUpperCase() || 'ASSET'
  const suffix = Math.random().toString(36).slice(2, 6).toUpperCase()
  return `${base}-${suffix}`
}

const zohoRisks = JSON.parse(fs.readFileSync('data/medipost-zoho-risks.json', 'utf8'))
const mapping = JSON.parse(fs.readFileSync('data/medipost-policy-risk-mapping.json', 'utf8'))
const zohoByNimbis = new Map(mapping.rows.map((r) => [String(r.nimbis_risk_id), r.zoho_risk_id]))

let synced = 0
const today = new Date().toISOString().slice(0, 10)

for (const record of zohoRisks) {
  const zohoRiskId = String(record.id)
  const name = String(record.Name ?? 'Risk item').trim()

  const { data: existing } = await supabase
    .from('portal_risk_items')
    .select('id')
    .eq('account_id', MEDIPOST_PORTAL_ACCOUNT)
    .eq('zoho_risk_id', zohoRiskId)
    .maybeSingle()

  const payload = {
    account_id: MEDIPOST_PORTAL_ACCOUNT,
    zoho_risk_id: zohoRiskId,
    name,
    category: mapCategory(record.Risk_Type),
    insurance_section: mapCategory(record.Risk_Type),
    unit_cost: record.Total_Sum_Insured != null ? Number(record.Total_Sum_Insured) : 0,
    repair_cost: 0,
    record_date: today,
    insurance_status: 'Insured with us',
    description: null,
    serial_number: null,
    zoho_fields: {
      Risk_Type: record.Risk_Type ?? null,
      Risk_Category: record.Risk_Category ?? null,
    },
    updated_at: new Date().toISOString(),
  }

  if (existing?.id) {
    const { error } = await supabase.from('portal_risk_items').update(payload).eq('id', existing.id)
    if (error) console.error('update risk', zohoRiskId, error.message)
    else synced++
  } else {
    const { error } = await supabase.from('portal_risk_items').insert({
      ...payload,
      asset_tag: assetTagFromName(name),
    })
    if (error) console.error('insert risk', zohoRiskId, error.message)
    else synced++
  }
}

console.log(`Upserted ${synced} portal_risk_items`)

const { data: riskRows, error: riskErr } = await supabase
  .from('portal_risk_items')
  .select('id, zoho_risk_id')
  .eq('account_id', MEDIPOST_PORTAL_ACCOUNT)

if (riskErr) {
  console.error(riskErr.message)
  process.exit(1)
}

const portalByZoho = new Map((riskRows ?? []).map((r) => [String(r.zoho_risk_id), r.id]))

const { data: policyRow, error: polErr } = await supabase
  .from('portal_policies')
  .select('covered_items')
  .eq('id', MEDIPOST_POLICY_PORTAL_ID)
  .single()

if (polErr || !policyRow) {
  console.error('Policy not found', polErr?.message)
  process.exit(1)
}

const covered = (policyRow.covered_items ?? []).map((item) => {
  const nimbisId = item.external_risk_id ?? item.nimbis_risk_id
  const zohoId = nimbisId != null ? zohoByNimbis.get(String(nimbisId)) : null
  const portalRiskId = zohoId ? portalByZoho.get(String(zohoId)) : null
  return {
    ...item,
    risk_item_id: portalRiskId ?? item.risk_item_id ?? null,
    zoho_risk_id: zohoId ?? item.zoho_risk_id ?? null,
    external_risk_id: nimbisId != null ? String(nimbisId) : item.external_risk_id ?? null,
  }
})

const linked = covered.filter((c) => c.risk_item_id).length

const { error: updateErr } = await supabase
  .from('portal_policies')
  .update({
    zoho_policy_id: MEDIPOST_POLICY_ZOHO_ID,
    covered_items: covered,
    updated_at: new Date().toISOString(),
  })
  .eq('id', MEDIPOST_POLICY_PORTAL_ID)

if (updateErr) {
  console.error('policy update failed', updateErr.message)
  process.exit(1)
}

console.log(`Policy ${MEDIPOST_POLICY_PORTAL_ID}: zoho_policy_id=${MEDIPOST_POLICY_ZOHO_ID}`)
console.log(`Linked covered_items: ${linked}/${covered.length}`)
console.log(`Total portal_risk_items for account: ${riskRows?.length ?? 0}`)
