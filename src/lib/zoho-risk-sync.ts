import {
  AEGIS_ZOHO_RISK_CATEGORY,
  CATEGORY_ZOHO_MAPPINGS,
  getCategoryZohoMapping,
  getRequiredZohoFields,
  INSURANCE_STATUS_TO_ZOHO,
  ZOHO_LAYOUTS,
  type ZohoFieldMapping,
} from '../config/zoho-risk-field-mappings'
import type { RiskItem, RiskItemInput } from '../types'

export interface ZohoSyncContext {
  branchAddress?: string | null
  /** Zoho CRM Accounts module record id for the tenant (portal_accounts.zoho_account_id). */
  zohoAccountId?: string | null
}

export interface ZohoValidationIssue {
  apiName: string
  label: string
  message: string
}

function resolvePortalValue(
  field: ZohoFieldMapping,
  item: Pick<RiskItem, 'name' | 'unit_cost' | 'serial_number' | 'description' | 'insurance_status' | 'asset_tag'>,
  context: ZohoSyncContext,
): unknown {
  if (field.apiName === 'Item_Owned_By') {
    return context.zohoAccountId ?? null
  }
  switch (field.portalSource) {
    case 'name':
      return item.name
    case 'unit_cost':
      return item.unit_cost
    case 'serial_number':
      return item.serial_number
    case 'description':
      return item.description
    case 'branch_address':
      return context.branchAddress ?? null
    case 'insurance_status': {
      const mapped = INSURANCE_STATUS_TO_ZOHO[item.insurance_status as keyof typeof INSURANCE_STATUS_TO_ZOHO]
      if (!mapped) return undefined
      if (field.apiName === 'Risk_Status') return mapped.riskStatus
      if (field.apiName === 'Currently_Insured') return mapped.currentlyInsured
      return undefined
    }
    default:
      if (field.apiName === 'Tag') return item.asset_tag
      return undefined
  }
}

export function buildZohoClientRiskPayload(
  item: RiskItem,
  context: ZohoSyncContext = {},
): Record<string, unknown> {
  const mapping = getCategoryZohoMapping(item.category)
  if (!mapping) return {}

  const payload: Record<string, unknown> = {
    Risk_Type: mapping.zohoRiskType,
    Risk_Category: AEGIS_ZOHO_RISK_CATEGORY,
    Layout: { id: ZOHO_LAYOUTS.clientRisksCommercialAssets.id },
  }

  if (context.zohoAccountId) {
    payload.Item_Owned_By = context.zohoAccountId
  }

  if (mapping.zohoItemType) {
    payload.Item_Type = mapping.zohoItemType
  }

  for (const field of mapping.fields) {
    let value: unknown

    if (field.portalSource) {
      value = resolvePortalValue(field, item, context)
    } else if (field.attributeKey) {
      value = item.zoho_fields?.[field.attributeKey] ?? item.zoho_fields?.[field.apiName]
    } else if (field.apiName === 'Risk_Category') {
      value = mapping.zohoRiskCategory
    } else if (field.apiName === 'Risk_Type') {
      value = mapping.zohoRiskType
    }

    if (value === undefined || value === null || value === '') continue

    if (field.dataType === 'boolean') {
      payload[field.apiName] = value === true || value === 'true' || value === 'Yes'
    } else if (field.dataType === 'number' || field.dataType === 'currency') {
      payload[field.apiName] = Number(value)
    } else {
      payload[field.apiName] = value
    }
  }

  // Contents: default total contents value from unit cost
  if (item.category === 'Contents' && !payload.Total_Contents_Value && item.unit_cost) {
    payload.Total_Contents_Value = item.unit_cost
  }

  // Plant / glass / money / BI / liability / misc: default sum insured
  if (
    !payload.Total_Sum_Insured &&
    !payload.Accidental_damage_sum_insured &&
    ['Plant & Machinery', 'Money', 'Business Interruption', 'Liability', 'Miscellaneous'].includes(
      item.category,
    ) &&
    item.unit_cost
  ) {
    payload.Total_Sum_Insured = item.unit_cost
  }

  if (item.category === 'Glass' && !payload.Accidental_damage_sum_insured && item.unit_cost) {
    payload.Accidental_damage_sum_insured = item.unit_cost
  }

  return payload
}

export function validateZohoFields(
  item: Pick<RiskItem, 'name' | 'category' | 'unit_cost' | 'serial_number' | 'description' | 'insurance_status' | 'asset_tag' | 'zoho_fields'>,
  context: ZohoSyncContext = {},
): ZohoValidationIssue[] {
  const issues: ZohoValidationIssue[] = []
  const required = getRequiredZohoFields(item.category)

  for (const field of required) {
    const fullItem = item as RiskItem
    let value: unknown

    if (field.portalSource) {
      value = resolvePortalValue(field, fullItem, context)
      if (field.portalSource === 'unit_cost') value = item.unit_cost
      if (field.portalSource === 'name') value = item.name?.trim()
      if (field.portalSource === 'branch_address') value = context.branchAddress
    } else if (field.attributeKey) {
      value = item.zoho_fields?.[field.attributeKey] ?? item.zoho_fields?.[field.apiName]
    }

    const empty =
      value === undefined ||
      value === null ||
      value === '' ||
      (typeof value === 'number' && Number.isNaN(value))

    if (empty) {
      issues.push({
        apiName: field.apiName,
        label: field.label,
        message: `${field.label} is required for Zoho CRM (${item.category})`,
      })
    }
  }

  return issues
}

export function mergeZohoFieldsFromInput(
  input: RiskItemInput,
  existing: Record<string, unknown> = {},
): Record<string, unknown> {
  return {
    ...existing,
    ...(input.zoho_fields ?? {}),
  }
}

export function listCategoryMappingsSummary() {
  return Object.values(CATEGORY_ZOHO_MAPPINGS).map((m) => ({
    category: m.category,
    zohoRiskType: m.zohoRiskType,
    requiredFieldCount: m.fields.filter((f) => f.required === true).length,
    editableFieldCount: m.fields.filter((f) => f.attributeKey).length,
  }))
}
