import type { SupabaseClient } from 'jsr:@supabase/supabase-js@2'
import { lookupId, zohoCoql, zohoGetRecord, zohoSearchRelated } from './zoho.ts'

const CLIENT_RISK_FIELDS =
  'Name,Risk_Type,Risk_Status,Risk_Category,Item_Type,Tag,Total_Sum_Insured,Total_Contents_Value,Accidental_damage_sum_insured,Serial_Number,Description,Currently_Insured'

const RISK_TYPE_TO_CATEGORY: Record<string, string> = {
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

const RISK_STATUS_TO_INSURANCE: Record<string, string> = {
  'Covered With Us': 'Insured with us',
  'Policy Activated': 'Insured with us',
  'Covered Elsewhere': 'Insured elsewhere',
  Identified: 'Brand new',
  'Quote Required': 'In acquisition',
  'Quote Sent': 'In acquisition',
  'Uncovered Gap': 'Uninsured',
}

function mapCategory(riskType: unknown, itemType: unknown): string {
  const risk = riskType ? String(riskType) : ''
  const item = itemType ? String(itemType) : ''
  return RISK_TYPE_TO_CATEGORY[risk] ?? RISK_TYPE_TO_CATEGORY[item] ?? 'Miscellaneous'
}

function mapInsuranceStatus(status: unknown): string {
  if (!status) return 'Uninsured'
  return RISK_STATUS_TO_INSURANCE[String(status)] ?? 'Uninsured'
}

function assetTagFromName(name: string): string {
  const base = name.replace(/[^a-zA-Z0-9]/g, '').slice(0, 6).toUpperCase() || 'ASSET'
  const suffix = Math.random().toString(36).slice(2, 6).toUpperCase()
  return `${base}-${suffix}`
}

function unitCostFromRecord(record: Record<string, unknown>): number {
  for (const key of [
    'Total_Sum_Insured',
    'Total_Contents_Value',
    'Accidental_damage_sum_insured',
  ]) {
    const value = record[key]
    if (value != null && !Number.isNaN(Number(value))) return Number(value)
  }
  return 0
}

async function collectZohoRiskRecords(zohoAccountId: string): Promise<Record<string, unknown>[]> {
  const byId = new Map<string, Record<string, unknown>>()

  const add = (row: Record<string, unknown>) => {
    const id = String(row.id)
    if (!byId.has(id)) byId.set(id, row)
  }

  try {
    const owned = await zohoCoql(
      `select id, ${CLIENT_RISK_FIELDS} from Client_Risks where Item_Owned_By.id = '${zohoAccountId}'`,
    )
    for (const row of owned) add(row)
  } catch (err) {
    console.warn('Client_Risks COQL failed:', err)
  }

  const policies = await zohoSearchRelated('Accounts', zohoAccountId, 'Policies')
  for (const policy of policies) {
    try {
      const detail = await zohoGetRecord('Policies', String(policy.id), 'Covered_Items')
      const covered = (detail.Covered_Items as Record<string, unknown>[]) ?? []
      for (const row of covered) {
        const riskId = lookupId(row.Risk_Item)
        if (!riskId || byId.has(riskId)) continue
        const risk = await zohoGetRecord('Client_Risks', riskId, CLIENT_RISK_FIELDS)
        add(risk)
      }
    } catch (err) {
      console.warn('Policy covered-item sync skipped:', policy.id, err)
    }
  }

  return [...byId.values()]
}

export async function syncPortalFromZoho(
  supabase: SupabaseClient,
  accountId: string,
  zohoAccountId: string,
): Promise<number> {
  const records = await collectZohoRiskRecords(zohoAccountId)
  let synced = 0
  const today = new Date().toISOString().slice(0, 10)

  for (const record of records) {
    const zohoRiskId = String(record.id)
    const name = String(record.Name ?? 'Risk item').trim()

    const { data: existing } = await supabase
      .from('portal_risk_items')
      .select('id')
      .eq('account_id', accountId)
      .eq('zoho_risk_id', zohoRiskId)
      .maybeSingle()

    const payload = {
      account_id: accountId,
      zoho_risk_id: zohoRiskId,
      name,
      category: mapCategory(record.Risk_Type, record.Item_Type),
      insurance_section: mapCategory(record.Risk_Type, record.Item_Type),
      unit_cost: unitCostFromRecord(record),
      repair_cost: 0,
      record_date: today,
      insurance_status: mapInsuranceStatus(record.Risk_Status),
      description: record.Description ? String(record.Description) : null,
      serial_number: record.Serial_Number ? String(record.Serial_Number) : null,
      zoho_fields: {
        Risk_Type: record.Risk_Type ?? null,
        Risk_Status: record.Risk_Status ?? null,
        Risk_Category: record.Risk_Category ?? null,
        Item_Type: record.Item_Type ?? null,
        Currently_Insured: record.Currently_Insured ?? null,
        Tag: record.Tag ?? null,
      },
      updated_at: new Date().toISOString(),
    }

    if (existing?.id) {
      const { error } = await supabase
        .from('portal_risk_items')
        .update(payload)
        .eq('id', existing.id)
      if (!error) synced++
    } else {
      const { error } = await supabase.from('portal_risk_items').insert({
        ...payload,
        asset_tag: assetTagFromName(name),
      })
      if (!error) synced++
    }
  }

  return synced
}
