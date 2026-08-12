/**
 * Zoho CRM Client_Risks field mappings for Aegis risk categories.
 * Aegis is commercial-only: all portal assets sync to Commercial Lines / Commercial Assets.
 * Verified against live Zoho CRM via MCP (module: Client_Risks, layout: Commercial Assets).
 */
import { INSURANCE_STATUSES, RISK_CATEGORIES, type RiskCategory } from './collections'

export const ZOHO_CLIENT_RISKS_MODULE = 'Client_Risks' as const
export const ZOHO_QUOTATIONS_MODULE = 'Deals' as const

/** Every Aegis risk item maps to Commercial Lines in Zoho CRM. */
export const AEGIS_ZOHO_RISK_CATEGORY = 'Commercial Lines' as const

export const ZOHO_LAYOUTS = {
  clientRisksCommercialAssets: {
    id: '7351644000002766026',
    apiName: 'Commercial_Assets',
    displayName: 'Commercial Assets',
  },
  /** Reference only — Aegis does not use Personal Assets. Item_Owned_By is not on this layout. */
  clientRisksPersonalAssets: {
    id: '7351644000001352473',
    apiName: 'Personal_Assets',
    displayName: 'Personal Assets',
  },
  quotationsCommercialQuotes: {
    id: '7351644000002406145',
    apiName: 'Commercial_Quotes',
    displayName: 'Commercial Quotes',
  },
} as const

export type ZohoFieldDataType =
  | 'text'
  | 'number'
  | 'currency'
  | 'picklist'
  | 'multiselect'
  | 'boolean'
  | 'address'
  | 'lookup'

export interface ZohoFieldMapping {
  /** Zoho CRM API name on Client_Risks */
  apiName: string
  label: string
  dataType: ZohoFieldDataType
  /** Required for broker quoting / CRM completeness */
  required?: boolean
  picklistValues?: readonly string[]
  /** Portal RiskItem field or branch-derived value */
  portalSource?: 'name' | 'unit_cost' | 'serial_number' | 'description' | 'branch_address' | 'insurance_status'
  /** Stored in portal_risk_items.zoho_fields */
  attributeKey?: string
  helpText?: string
}

export interface CategoryZohoMapping {
  category: RiskCategory
  zohoRiskType: string
  zohoRiskCategory: string
  zohoItemType?: string
  zohoLayoutSections: readonly string[]
  fields: readonly ZohoFieldMapping[]
  notes?: string
}

/** Maps Aegis insurance status to Zoho Risk_Status + Currently_Insured */
export const INSURANCE_STATUS_TO_ZOHO: Record<
  (typeof INSURANCE_STATUSES)[number],
  { riskStatus: string; currentlyInsured: string }
> = {
  'Insured with us': { riskStatus: 'Covered With Us', currentlyInsured: 'Yes - With Us' },
  Uninsured: { riskStatus: 'Uncovered Gap', currentlyInsured: 'No' },
  'Brand new': { riskStatus: 'Identified', currentlyInsured: 'No' },
  'In acquisition': { riskStatus: 'Quote Required', currentlyInsured: 'Unknown' },
}

/**
 * Zoho Risk_Status → portal insurance_status.
 * "Covered Elsewhere" maps to Uninsured (portal no longer uses "Insured elsewhere").
 */
export const ZOHO_RISK_STATUS_TO_INSURANCE: Record<string, (typeof INSURANCE_STATUSES)[number]> = {
  'Covered With Us': 'Insured with us',
  'Policy Activated': 'Insured with us',
  'Covered Elsewhere': 'Uninsured',
  'Uncovered Gap': 'Uninsured',
  Identified: 'Brand new',
  'Quote Required': 'In acquisition',
  'Quote Sent': 'In acquisition',
}

const COMMON_FIELDS: ZohoFieldMapping[] = [
  {
    apiName: 'Name',
    label: 'Risk Name',
    dataType: 'text',
    required: true,
    portalSource: 'name',
  },
  {
    apiName: 'Risk_Category',
    label: 'Risk Category',
    dataType: 'picklist',
    required: true,
    picklistValues: [AEGIS_ZOHO_RISK_CATEGORY],
  },
  {
    apiName: 'Risk_Type',
    label: 'Risk Type',
    dataType: 'picklist',
    required: true,
    picklistValues: [
      'Motor Vehicle',
      'Building',
      'Household Contents',
      'All Risk / Portable Item',
      'Electronic Equipment',
      'Business Vehicle',
      'Caravan/Trailer',
      'Office Contents',
      'Accidental Damage',
      'Business Property',
      'Life Cover',
      'Medical Aid',
      'Other',
    ],
  },
  {
    apiName: 'Item_Owned_By',
    label: 'Item Owned By',
    dataType: 'lookup',
    required: true,
    helpText: 'Required on Commercial Assets layout. Set from organization Zoho Account ID.',
  },
  {
    apiName: 'Item_Value',
    label: 'Item Value',
    dataType: 'currency',
    required: true,
    portalSource: 'unit_cost',
  },
  {
    apiName: 'Tag',
    label: 'Tag',
    dataType: 'text',
    helpText: 'Synced from portal asset tag',
  },
  {
    apiName: 'Risk_Status',
    label: 'Risk Status',
    dataType: 'picklist',
    required: false,
    portalSource: 'insurance_status',
    picklistValues: [
      'Identified',
      'Covered With Us',
      'Covered Elsewhere',
      'Uncovered Gap',
      'Quote Required',
      'Quote Sent',
      'Policy Activated',
      'Not Interested',
      'Needs Review',
    ],
    helpText:
      'Portal maps Covered Elsewhere → Uninsured (removed-from-policy / not covered with us).',
  },
  {
    apiName: 'Currently_Insured',
    label: 'Currently Insured',
    dataType: 'picklist',
    portalSource: 'insurance_status',
    picklistValues: ['Yes - With Us', 'Yes - Elsewhere', 'No', 'Unknown'],
  },
  {
    apiName: 'Broker_Notes',
    label: 'Broker Notes',
    dataType: 'text',
    portalSource: 'description',
  },
]

const LOCATION_FIELDS: ZohoFieldMapping[] = [
  {
    apiName: 'Property_Location',
    label: 'Property Location',
    dataType: 'address',
    required: true,
    portalSource: 'branch_address',
    helpText: 'Defaults to the selected branch address',
  },
]

export const CATEGORY_ZOHO_MAPPINGS: Record<RiskCategory, CategoryZohoMapping> = {
  Building: {
    category: 'Building',
    zohoRiskType: 'Building',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'Risk Location', 'Building Breakdown', 'Building Construction', 'Property Cover'],
    fields: [
      ...COMMON_FIELDS,
      ...LOCATION_FIELDS,
      {
        apiName: 'Property_Type',
        label: 'Property Type',
        dataType: 'picklist',
        required: true,
        attributeKey: 'Property_Type',
        picklistValues: [
          'Free-standing House',
          'Townhouse',
          'Flat / Apartment',
          'Sectional Title',
          'Farm',
          'Smallholding',
          'Commercial Property',
          'Other',
        ],
      },
      {
        apiName: 'Occupancy_Type',
        label: 'Occupancy Type',
        dataType: 'picklist',
        required: true,
        attributeKey: 'Occupancy_Type',
        picklistValues: [
          'Owner Occupied',
          'Tenant Occupied',
          'Holiday Home',
          'Vacant',
          'Mixed Use',
          'Commercial Property',
          'Owner',
          'Tenant',
        ],
      },
      {
        apiName: 'Roof_Type',
        label: 'Roof Type',
        dataType: 'picklist',
        attributeKey: 'Roof_Type',
        picklistValues: ['Tile', 'Thatch', 'Metal', 'Concrete', 'Slate', 'Asbestos', 'Other'],
      },
      {
        apiName: 'Wall_Type',
        label: 'Wall Type',
        dataType: 'picklist',
        attributeKey: 'Wall_Type',
        picklistValues: ['Brick', 'Plaster', 'Wood', 'Stone', 'Prefab', 'Mixed', 'Other'],
      },
      {
        apiName: 'Total_Sum_Insured',
        label: 'Total Sum Insured',
        dataType: 'currency',
        attributeKey: 'Total_Sum_Insured',
      },
    ],
  },
  Motor: {
    category: 'Motor',
    zohoRiskType: 'Motor Vehicle',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'Motor Details', 'Claims History'],
    fields: [
      ...COMMON_FIELDS,
      {
        apiName: 'Vehicle_Make',
        label: 'Vehicle Make',
        dataType: 'text',
        required: true,
        attributeKey: 'Vehicle_Make',
      },
      {
        apiName: 'Vehicle_Model',
        label: 'Vehicle Model',
        dataType: 'text',
        required: true,
        attributeKey: 'Vehicle_Model',
      },
      {
        apiName: 'Vehicle_Year',
        label: 'Vehicle Year',
        dataType: 'picklist',
        required: true,
        attributeKey: 'Vehicle_Year',
      },
      {
        apiName: 'MMCode',
        label: 'MM Code',
        dataType: 'text',
        required: true,
        attributeKey: 'MMCode',
        helpText: 'Required for motor quoting (Nimbis / insurer integration)',
      },
      {
        apiName: 'Registration_Number',
        label: 'Registration Number',
        dataType: 'text',
        required: true,
        attributeKey: 'Registration_Number',
      },
      {
        apiName: 'Vehicle_Use',
        label: 'Vehicle Use',
        dataType: 'picklist',
        required: true,
        attributeKey: 'Vehicle_Use',
        picklistValues: [
          'Private',
          'Commercial/Business',
          'Business',
          'Delivery',
          'Farming',
          'Other',
          'Private and Work',
          'Ride Hailing',
        ],
      },
      {
        apiName: 'Overnight_Parking',
        label: 'Overnight Parking',
        dataType: 'picklist',
        required: true,
        attributeKey: 'Overnight_Parking',
        picklistValues: [
          'Locked Garage',
          'Behind Locked Gate',
          'Complex Parking',
          'Street Parking',
          'Carport',
          'Secured Yard',
        ],
      },
      {
        apiName: 'VIN_Number',
        label: 'VIN Number',
        dataType: 'text',
        attributeKey: 'VIN_Number',
      },
      {
        apiName: 'Alarm_Immobiliser',
        label: 'Alarm / Immobiliser',
        dataType: 'picklist',
        attributeKey: 'Alarm_Immobiliser',
      },
    ],
  },
  Contents: {
    category: 'Contents',
    zohoRiskType: 'Office Contents',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'Risk Location', 'Household Contents Details', 'Property Cover'],
    fields: [
      ...COMMON_FIELDS,
      ...LOCATION_FIELDS,
      {
        apiName: 'Total_Contents_Value',
        label: 'Total Contents Value',
        dataType: 'currency',
        required: true,
        attributeKey: 'Total_Contents_Value',
        helpText: 'Defaults to item value if not set separately',
      },
      {
        apiName: 'Contents_Cover_Type',
        label: 'Contents Cover Type',
        dataType: 'picklist',
        attributeKey: 'Contents_Cover_Type',
        picklistValues: ['Comprehensive', 'FireAndFury'],
      },
      {
        apiName: 'Alarm_Installed',
        label: 'Alarm Installed',
        dataType: 'boolean',
        attributeKey: 'Alarm_Installed',
      },
      {
        apiName: 'Portable_Items_Required',
        label: 'Portable Items Required',
        dataType: 'boolean',
        attributeKey: 'Portable_Items_Required',
      },
    ],
  },
  'Electronic Equipment': {
    category: 'Electronic Equipment',
    zohoRiskType: 'Electronic Equipment',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'All Risk / Portable Item Details'],
    fields: [
      ...COMMON_FIELDS,
      ...LOCATION_FIELDS,
      {
        apiName: 'Portable_Item_Type',
        label: 'Portable Item Type',
        dataType: 'picklist',
        required: true,
        attributeKey: 'Portable_Item_Type',
        picklistValues: [
          'Cellphone',
          'Laptop',
          'Camera',
          'Tools',
          'Sporting Equipment',
          'Unspecified',
        ],
      },
      {
        apiName: 'Portable_Item_Make',
        label: 'Portable Item Make',
        dataType: 'text',
        required: true,
        attributeKey: 'Portable_Item_Make',
      },
      {
        apiName: 'Portable_Item_Model',
        label: 'Portable Item Model',
        dataType: 'text',
        attributeKey: 'Portable_Item_Model',
      },
      {
        apiName: 'Serial_Number',
        label: 'Serial Number',
        dataType: 'text',
        required: true,
        portalSource: 'serial_number',
      },
      {
        apiName: 'IMEI_Number',
        label: 'IMEI Number',
        dataType: 'text',
        attributeKey: 'IMEI_Number',
      },
    ],
  },
  'Plant & Machinery': {
    category: 'Plant & Machinery',
    zohoRiskType: 'Business Property',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'Risk Location', 'Property Cover'],
    fields: [
      ...COMMON_FIELDS,
      ...LOCATION_FIELDS,
      {
        apiName: 'Property_Use',
        label: 'Property Use',
        dataType: 'multiselect',
        required: true,
        attributeKey: 'Property_Use',
      },
      {
        apiName: 'Total_Sum_Insured',
        label: 'Total Sum Insured',
        dataType: 'currency',
        required: true,
        attributeKey: 'Total_Sum_Insured',
      },
      {
        apiName: 'Serial_Number',
        label: 'Serial / Asset Number',
        dataType: 'text',
        portalSource: 'serial_number',
      },
    ],
    notes: 'Mapped to Zoho Business Property for commercial plant & machinery.',
  },
  Glass: {
    category: 'Glass',
    zohoRiskType: 'Other',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'Risk Location'],
    notes: 'No dedicated Glass risk type in Zoho — stored as Other with glass details in broker notes.',
    fields: [
      ...COMMON_FIELDS,
      ...LOCATION_FIELDS,
      {
        apiName: 'Accidental_damage_sum_insured',
        label: 'Glass / Accidental Damage Sum Insured',
        dataType: 'currency',
        required: true,
        attributeKey: 'Accidental_damage_sum_insured',
      },
    ],
  },
  Money: {
    category: 'Money',
    zohoRiskType: 'Other',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview'],
    fields: [
      ...COMMON_FIELDS,
      {
        apiName: 'Total_Sum_Insured',
        label: 'Money Sum Insured',
        dataType: 'currency',
        required: true,
        attributeKey: 'Total_Sum_Insured',
      },
    ],
    notes: 'Money risks use Zoho Other type; specify limits in Total Sum Insured.',
  },
  'Business Interruption': {
    category: 'Business Interruption',
    zohoRiskType: 'Other',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview', 'Risk Location'],
    fields: [
      ...COMMON_FIELDS,
      ...LOCATION_FIELDS,
      {
        apiName: 'Total_Sum_Insured',
        label: 'BI Sum Insured',
        dataType: 'currency',
        required: true,
        attributeKey: 'Total_Sum_Insured',
      },
      {
        apiName: 'Property_Use',
        label: 'Property Use',
        dataType: 'multiselect',
        attributeKey: 'Property_Use',
      },
    ],
  },
  Liability: {
    category: 'Liability',
    zohoRiskType: 'Other',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview'],
    fields: [
      ...COMMON_FIELDS,
      {
        apiName: 'Total_Sum_Insured',
        label: 'Limit of Indemnity',
        dataType: 'currency',
        required: true,
        attributeKey: 'Total_Sum_Insured',
      },
    ],
  },
  Miscellaneous: {
    category: 'Miscellaneous',
    zohoRiskType: 'Other',
    zohoRiskCategory: AEGIS_ZOHO_RISK_CATEGORY,
    zohoLayoutSections: ['Risk Overview'],
    fields: [
      ...COMMON_FIELDS,
      {
        apiName: 'Total_Sum_Insured',
        label: 'Sum Insured',
        dataType: 'currency',
        required: true,
        attributeKey: 'Total_Sum_Insured',
      },
    ],
  },
}

export function getCategoryZohoMapping(category: string): CategoryZohoMapping | null {
  if ((RISK_CATEGORIES as readonly string[]).includes(category)) {
    return CATEGORY_ZOHO_MAPPINGS[category as RiskCategory]
  }
  return null
}

export function getEditableZohoFields(category: string): ZohoFieldMapping[] {
  const mapping = getCategoryZohoMapping(category)
  if (!mapping) return []
  return mapping.fields.filter((f) => f.attributeKey && !f.portalSource)
}

export function getRequiredZohoFields(category: string): ZohoFieldMapping[] {
  const mapping = getCategoryZohoMapping(category)
  if (!mapping) return []
  return mapping.fields.filter((f) => f.required === true)
}
