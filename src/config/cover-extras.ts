import type { RiskCategory } from './collections'

/** Cover type keys used by the extras questionnaire. */
export type CoverTypeKey =
  | 'comprehensive'
  | 'third_party_fire_theft'
  | 'third_party_only'
  | 'limited_cover'
  | 'standard'

export type ExtraGroupKey =
  | 'additional_perils'
  | 'liabilities'
  | 'excess_sure'
  | 'more_addons'
  | 'buildings'
  | 'contents'
  | 'electronic'
  | 'plant'
  | 'glass'
  | 'money'
  | 'bi'
  | 'liability_section'
  | 'portable'

export interface CoverTypeDefinition {
  key: CoverTypeKey
  label: string
  mandatoryCovers: string[]
  /** Codes of optional extras eligible under this cover type */
  optionalExtraCodes: string[]
}

export interface ExtraDefinition {
  code: string
  name: string
  description: string
  /** Categories this extra can apply to */
  categories: RiskCategory[]
  /** UI grouping (Bryte motor screens / section catalogs) */
  group?: ExtraGroupKey
  /**
   * When set, only offered if the matching underwriting answer is true.
   * Example: credit_shortfall requires is_financed.
   */
  requires?: 'is_financed' | 'has_tracker'
  /** Ask as a yes/no question (default) or chip */
  kind?: 'toggle' | 'info'
  /** Needs rate / sum insured capture in the questionnaire */
  asksSumInsured?: boolean
}

export interface CoverLibraryEntry {
  category: RiskCategory
  coverTypes: CoverTypeDefinition[]
}

export const EXTRA_GROUPS: { key: ExtraGroupKey; label: string }[] = [
  { key: 'additional_perils', label: 'Additional Perils / Extended Cover' },
  { key: 'liabilities', label: 'Liabilities' },
  { key: 'excess_sure', label: 'Excess Sure Add-Ons' },
  { key: 'more_addons', label: 'More add-ons' },
  { key: 'buildings', label: 'Buildings / Fire' },
  { key: 'contents', label: 'Office contents' },
  { key: 'electronic', label: 'Electronic equipment' },
  { key: 'plant', label: 'Plant & machinery' },
  { key: 'glass', label: 'Glass' },
  { key: 'money', label: 'Money' },
  { key: 'bi', label: 'Business interruption' },
  { key: 'liability_section', label: 'Public liability' },
  { key: 'portable', label: 'All risks / portable' },
]

/** Bryte motor + commercial section extras catalog. */
export const EXTRA_DEFINITIONS: Record<string, ExtraDefinition> = {
  // —— Additional Perils / Extended Cover (Bryte motor) ——
  third_party_liability: {
    code: 'third_party_liability',
    name: 'Third Party Liability',
    description: 'Third party property damage and bodily injury liability extension.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  car_hire: {
    code: 'car_hire',
    name: 'Car hire',
    description: 'Courtesy / hire vehicle while this unit is off the road after an insured event.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  credit_shortfall: {
    code: 'credit_shortfall',
    name: 'Credit Shortfall',
    description:
      'Pays the gap between the settlement and outstanding finance after a total loss (financed vehicles only).',
    categories: ['Motor', 'Plant & Machinery'],
    group: 'additional_perils',
    requires: 'is_financed',
  },
  riot_strike_excl_rsa_namibia: {
    code: 'riot_strike_excl_rsa_namibia',
    name: 'Riot Strike excl. RSA & Namibia',
    description: 'Riot and strike cover excluding the Republic of South Africa and Namibia.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  additional_locks_keys: {
    code: 'additional_locks_keys',
    name: 'Additional Locks and Keys',
    description: 'Increased cover for locks, keys, and remotes after loss or theft.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  additional_passenger_liability: {
    code: 'additional_passenger_liability',
    name: 'Additional passenger / unauthorised passenger liability',
    description: 'Extended passenger and unauthorised passenger liability limits.',
    categories: ['Motor'],
    group: 'additional_perils',
    asksSumInsured: true,
  },
  third_party_only: {
    code: 'third_party_only',
    name: 'Third party only',
    description: 'Third party only cover option for this vehicle.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  third_party_fire_theft: {
    code: 'third_party_fire_theft',
    name: 'Third party fire and theft',
    description: 'Third party, fire and theft cover option for this vehicle.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  extras: {
    code: 'extras',
    name: 'Extras',
    description: 'Specified vehicle extras (canopy, accessories, etc.) above standard limits.',
    categories: ['Motor'],
    group: 'additional_perils',
    asksSumInsured: true,
  },
  voluntary_excess_waiver: {
    code: 'voluntary_excess_waiver',
    name: 'Voluntary excess / excess waiver',
    description: 'Voluntary excess selection or excess waiver buy-down.',
    categories: ['Motor'],
    group: 'additional_perils',
  },
  bryte_assist_service: {
    code: 'bryte_assist_service',
    name: 'Bryte Assist Service',
    description: 'Bryte roadside / assist service for the insured vehicle.',
    categories: ['Motor'],
    group: 'additional_perils',
  },

  // —— Liabilities ——
  passenger_liability: {
    code: 'passenger_liability',
    name: 'Passenger liability',
    description: 'Passenger liability with rate and sum insured.',
    categories: ['Motor'],
    group: 'liabilities',
    asksSumInsured: true,
  },
  unauthorised_passenger_liability: {
    code: 'unauthorised_passenger_liability',
    name: 'Unauthorised passenger liability',
    description: 'Unauthorised passenger liability with rate and sum insured.',
    categories: ['Motor'],
    group: 'liabilities',
    asksSumInsured: true,
  },

  // —— Excess Sure Add-Ons (Bryte) ——
  /** Generic Excess Sure — kept for existing selected_extensions references. */
  excess_sure: {
    code: 'excess_sure',
    name: 'Excess Sure (Rand Nil) - Max R6 000',
    description: 'Excess Sure Rand Nil buy-down, maximum R6 000.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  excess_sure_rand_nil_6k: {
    code: 'excess_sure_rand_nil_6k',
    name: 'Excess Sure (Rand Nil) - Max R6 000',
    description: 'Excess Sure Rand Nil buy-down, maximum R6 000.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  excess_sure_rand_nil_10k: {
    code: 'excess_sure_rand_nil_10k',
    name: 'Excess Sure (Rand Nil) - Max R10 000.00',
    description: 'Excess Sure Rand Nil buy-down, maximum R10 000.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  excess_sure_flat: {
    code: 'excess_sure_flat',
    name: 'Excess Sure (Flat excess structure)',
    description: 'Excess Sure with a flat excess structure.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  excess_sure_additional: {
    code: 'excess_sure_additional',
    name: 'Excess Sure Additional',
    description: 'Additional Excess Sure cover.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  excess_sure_additional_tracking: {
    code: 'excess_sure_additional_tracking',
    name: 'Excess Sure Additional Tracking Device - 5% - Max R50 000 Per Event / Claim',
    description:
      'Additional Excess Sure for tracking-device events: 5%, maximum R50 000 per event / claim.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  excess_sure_3_in_1: {
    code: 'excess_sure_3_in_1',
    name: '3 IN 1 (Excess Waiver, TyreSure and WindscreenSure)',
    description: 'Combined Excess Waiver, TyreSure, and WindscreenSure package.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  windscreen_sure: {
    code: 'windscreen_sure',
    name: 'Windscreen Sure',
    description: 'Windscreen / glass Sure cover with reduced excess.',
    categories: ['Motor'],
    group: 'excess_sure',
  },
  tyresure: {
    code: 'tyresure',
    name: 'TyreSure',
    description: 'TyreSure cover for road-hazard tyre damage.',
    categories: ['Motor'],
    group: 'excess_sure',
  },

  // —— More add-ons ——
  /** Kept code; label aligned to Bryte “TyreSure - Betterment Included”. */
  tyresure_variant: {
    code: 'tyresure_variant',
    name: 'TyreSure - Betterment Included',
    description: 'TyreSure with betterment included.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  rim_and_tyre: {
    code: 'rim_and_tyre',
    name: 'Rim&Tyre Solution - Betterment Included',
    description: 'Rim and tyre solution with betterment included.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  spare_wheel: {
    code: 'spare_wheel',
    name: 'Spare Wheel Insurance',
    description: 'Spare wheel insurance — only available with excess waiver.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  scratchsure: {
    code: 'scratchsure',
    name: 'ScratchSure',
    description: 'Cosmetic scratch and dent repair cover.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  loss_of_use: {
    code: 'loss_of_use',
    name: 'Loss of Use',
    description: 'Loss of use / downtime cover while the vehicle is repaired.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  insured_value_product: {
    code: 'insured_value_product',
    name: 'Insured Value Product',
    description: 'Insured value product / agreed value enhancement.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  bryte_car_hire: {
    code: 'bryte_car_hire',
    name: 'Bryte Car Hire',
    description: 'Bryte-branded car hire addon.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  commercial_vehicle_assist: {
    code: 'commercial_vehicle_assist',
    name: 'Commercial Vehicle Assist',
    description: 'Roadside assist for commercial vehicles.',
    categories: ['Motor'],
    group: 'more_addons',
  },
  hcv_assist: {
    code: 'hcv_assist',
    name: 'HCV Assist',
    description: 'Heavy commercial vehicle assist.',
    categories: ['Motor'],
    group: 'more_addons',
  },

  // —— Non-motor section extras (unchanged commercial catalog) ——
  reinstatement_data: {
    code: 'reinstatement_data',
    name: 'Reinstatement of data',
    description: 'Cost to restore programs and data after damage to hardware (not the information value).',
    categories: ['Electronic Equipment'],
    group: 'electronic',
  },
  increased_cost_working_ee: {
    code: 'increased_cost_working_ee',
    name: 'Increased cost of working',
    description: 'Extra expense to keep IT operations running after equipment damage.',
    categories: ['Electronic Equipment'],
    group: 'electronic',
  },
  incompatibility_software: {
    code: 'incompatibility_software',
    name: 'Incompatibility of software',
    description: 'Software or firmware that cannot run on replacement equipment.',
    categories: ['Electronic Equipment'],
    group: 'electronic',
  },
  portable_computers: {
    code: 'portable_computers',
    name: 'Portable computers / laptops',
    description: 'Laptops and tablets away from the insured premises (often all-risk sub-limit).',
    categories: ['Electronic Equipment'],
    group: 'electronic',
  },
  geyser: {
    code: 'geyser',
    name: 'Geyser',
    description: 'Geyser and water-heating replacement under the buildings / fire section.',
    categories: ['Building'],
    group: 'buildings',
  },
  subsidence: {
    code: 'subsidence',
    name: 'Subsidence and landslip',
    description: 'Optional ground-movement cover, usually underwritten separately.',
    categories: ['Building'],
    group: 'buildings',
  },
  escalation: {
    code: 'escalation',
    name: 'Escalation',
    description: 'Inflation loading on the building sum insured during the period of insurance.',
    categories: ['Building'],
    group: 'buildings',
  },
  documents: {
    code: 'documents',
    name: 'Documents',
    description: 'Cost of reinstating business documents and records.',
    categories: ['Contents'],
    group: 'contents',
  },
  locks_keys: {
    code: 'locks_keys',
    name: 'Locks and keys',
    description: 'Replacement of locks and keys after theft or attempted theft.',
    categories: ['Contents'],
    group: 'contents',
  },
  expediting_costs: {
    code: 'expediting_costs',
    name: 'Expediting costs',
    description: 'Air freight and overtime to speed up repair or replacement of plant.',
    categories: ['Plant & Machinery'],
    group: 'plant',
  },
  special_glass: {
    code: 'special_glass',
    name: 'Special glass / signage',
    description: 'Specified glass, mirrors, and signwriting beyond standard shopfront cover.',
    categories: ['Glass'],
    group: 'glass',
  },
  cash_in_transit: {
    code: 'cash_in_transit',
    name: 'Cash in transit',
    description: 'Money while being conveyed to or from the bank.',
    categories: ['Money'],
    group: 'money',
  },
  suppliers_extension: {
    code: 'suppliers_extension',
    name: 'Suppliers / customers extension',
    description: 'Business interruption following damage at a named supplier or customer.',
    categories: ['Business Interruption'],
    group: 'bi',
  },
  wrongful_arrest: {
    code: 'wrongful_arrest',
    name: 'Wrongful arrest',
    description: 'Liability arising from wrongful arrest or defamation in the course of business.',
    categories: ['Liability'],
    group: 'liability_section',
  },
  spread_of_fire: {
    code: 'spread_of_fire',
    name: 'Spread of fire',
    description: 'Liability for fire spreading from the insured premises.',
    categories: ['Liability'],
    group: 'liability_section',
  },
  worldwide: {
    code: 'worldwide',
    name: 'Worldwide cover',
    description: 'All-risk cover outside the Republic, subject to wording.',
    categories: ['Miscellaneous'],
    group: 'portable',
  },
}

const MOTOR_COMPREHENSIVE_EXTRAS = [
  'third_party_liability',
  'car_hire',
  'credit_shortfall',
  'riot_strike_excl_rsa_namibia',
  'additional_locks_keys',
  'additional_passenger_liability',
  'extras',
  'voluntary_excess_waiver',
  'bryte_assist_service',
  'passenger_liability',
  'unauthorised_passenger_liability',
  'excess_sure',
  'excess_sure_rand_nil_10k',
  'excess_sure_flat',
  'excess_sure_additional',
  'excess_sure_additional_tracking',
  'excess_sure_3_in_1',
  'windscreen_sure',
  'tyresure',
  'tyresure_variant',
  'rim_and_tyre',
  'spare_wheel',
  'scratchsure',
  'loss_of_use',
  'insured_value_product',
  'bryte_car_hire',
  'commercial_vehicle_assist',
  'hcv_assist',
]

/** Cover types + eligible extra codes — Bryte motor list + commercial sections. */
export const COVER_LIBRARY: Partial<Record<RiskCategory, CoverLibraryEntry>> = {
  Motor: {
    category: 'Motor',
    coverTypes: [
      {
        key: 'comprehensive',
        label: 'Comprehensive',
        mandatoryCovers: [
          'Own Damage',
          'Theft & Hijacking',
          'Fire, Explosion & Lightning',
          'Third Party Liability',
        ],
        optionalExtraCodes: MOTOR_COMPREHENSIVE_EXTRAS,
      },
      {
        key: 'third_party_fire_theft',
        label: 'Third Party, Fire & Theft',
        mandatoryCovers: [
          'Third Party Liability',
          'Theft & Hijacking',
          'Fire, Explosion & Lightning',
        ],
        optionalExtraCodes: [
          'car_hire',
          'credit_shortfall',
          'additional_locks_keys',
          'bryte_assist_service',
          'windscreen_sure',
          'tyresure',
          'bryte_car_hire',
          'commercial_vehicle_assist',
          'hcv_assist',
          'voluntary_excess_waiver',
        ],
      },
      {
        key: 'third_party_only',
        label: 'Third Party Only',
        mandatoryCovers: ['Third Party Liability'],
        optionalExtraCodes: [
          'bryte_assist_service',
          'passenger_liability',
          'unauthorised_passenger_liability',
          'commercial_vehicle_assist',
          'hcv_assist',
        ],
      },
      {
        key: 'limited_cover',
        label: 'Limited Cover / Total Loss Only',
        mandatoryCovers: ['Total Loss', 'Theft & Hijacking', 'Third Party Liability'],
        optionalExtraCodes: [
          'credit_shortfall',
          'bryte_assist_service',
          'bryte_car_hire',
          'loss_of_use',
          'insured_value_product',
        ],
      },
    ],
  },
  'Electronic Equipment': {
    category: 'Electronic Equipment',
    coverTypes: [
      {
        key: 'standard',
        label: 'Electronic equipment',
        mandatoryCovers: ['Material damage to insured equipment'],
        optionalExtraCodes: [
          'reinstatement_data',
          'increased_cost_working_ee',
          'incompatibility_software',
          'portable_computers',
        ],
      },
    ],
  },
  Building: {
    category: 'Building',
    coverTypes: [
      {
        key: 'standard',
        label: 'Buildings (Fire section)',
        mandatoryCovers: ['Buildings — insured under Fire section'],
        optionalExtraCodes: ['geyser', 'subsidence', 'escalation'],
      },
    ],
  },
  Contents: {
    category: 'Contents',
    coverTypes: [
      {
        key: 'standard',
        label: 'Office / household contents',
        mandatoryCovers: ['Contents'],
        optionalExtraCodes: ['documents', 'locks_keys'],
      },
    ],
  },
  'Plant & Machinery': {
    category: 'Plant & Machinery',
    coverTypes: [
      {
        key: 'standard',
        label: 'Plant & machinery',
        mandatoryCovers: ['Plant & machinery'],
        optionalExtraCodes: ['expediting_costs', 'credit_shortfall'],
      },
    ],
  },
  Glass: {
    category: 'Glass',
    coverTypes: [
      {
        key: 'standard',
        label: 'Glass',
        mandatoryCovers: ['Glass'],
        optionalExtraCodes: ['special_glass'],
      },
    ],
  },
  Money: {
    category: 'Money',
    coverTypes: [
      {
        key: 'standard',
        label: 'Money',
        mandatoryCovers: ['Money'],
        optionalExtraCodes: ['cash_in_transit'],
      },
    ],
  },
  'Business Interruption': {
    category: 'Business Interruption',
    coverTypes: [
      {
        key: 'standard',
        label: 'Business interruption',
        mandatoryCovers: ['Business interruption'],
        optionalExtraCodes: ['suppliers_extension'],
      },
    ],
  },
  Liability: {
    category: 'Liability',
    coverTypes: [
      {
        key: 'standard',
        label: 'Public liability',
        mandatoryCovers: ['Public liability'],
        optionalExtraCodes: ['wrongful_arrest', 'spread_of_fire'],
      },
    ],
  },
  Miscellaneous: {
    category: 'Miscellaneous',
    coverTypes: [
      {
        key: 'standard',
        label: 'All risks / portable',
        mandatoryCovers: ['All risks'],
        optionalExtraCodes: ['worldwide'],
      },
    ],
  },
}

export interface ExtrasEligibilityContext {
  is_financed?: boolean | null
  has_tracker?: boolean | null
}

export function coverTypesForCategory(category: string): CoverTypeDefinition[] {
  const entry = COVER_LIBRARY[category as RiskCategory]
  return entry?.coverTypes ?? []
}

export function coverTypeByKey(
  category: string,
  key: string | null | undefined,
): CoverTypeDefinition | null {
  if (!key) return null
  return coverTypesForCategory(category).find((row) => row.key === key) ?? null
}

/** Item extras eligible for this category + cover type + underwriting answers. */
export function eligibleExtrasForItem(
  category: string,
  coverTypeKey: string | null | undefined,
  ctx: ExtrasEligibilityContext = {},
): ExtraDefinition[] {
  const cover = coverTypeByKey(category, coverTypeKey)
  const codes = cover?.optionalExtraCodes
  if (!codes?.length) {
    const fallback = COVER_LIBRARY[category as RiskCategory]?.coverTypes[0]
    if (!fallback) return []
    return eligibleFromCodes(fallback.optionalExtraCodes, category, ctx)
  }
  return eligibleFromCodes(codes, category, ctx)
}

function eligibleFromCodes(
  codes: string[],
  category: string,
  ctx: ExtrasEligibilityContext,
): ExtraDefinition[] {
  return codes
    .map((code) => EXTRA_DEFINITIONS[code])
    .filter((def): def is ExtraDefinition => {
      if (!def) return false
      if (!def.categories.includes(category as RiskCategory)) return false
      if (def.requires === 'is_financed' && ctx.is_financed !== true) return false
      if (def.requires === 'has_tracker' && ctx.has_tracker !== true) return false
      return true
    })
}

/** Group eligible extras in Bryte catalog order for the questionnaire UI. */
export function groupExtrasByBryteGroup(extras: ExtraDefinition[]): {
  key: ExtraGroupKey | 'other'
  label: string
  extras: ExtraDefinition[]
}[] {
  const byGroup = new Map<string, ExtraDefinition[]>()
  for (const extra of extras) {
    const key = extra.group ?? 'other'
    const list = byGroup.get(key) ?? []
    list.push(extra)
    byGroup.set(key, list)
  }
  const ordered: { key: ExtraGroupKey | 'other'; label: string; extras: ExtraDefinition[] }[] = []
  for (const group of EXTRA_GROUPS) {
    const rows = byGroup.get(group.key)
    if (rows?.length) ordered.push({ key: group.key, label: group.label, extras: rows })
  }
  const other = byGroup.get('other')
  if (other?.length) ordered.push({ key: 'other', label: 'Other extras', extras: other })
  return ordered
}

/**
 * Nimbis / schedule section name → Aegis portal category.
 * Fire section items map to Building (still noted as Fire via insurance_section).
 */
export const SECTION_TO_CATEGORY: Record<string, RiskCategory> = {
  'Motor Specified': 'Motor',
  'Motor Fleet': 'Motor',
  Motor: 'Motor',
  'Electronic Equipment': 'Electronic Equipment',
  Fire: 'Building',
  'Buildings Combined': 'Building',
  Building: 'Building',
  Buildings: 'Building',
  'Buildings (home)': 'Building',
  'Office Contents': 'Contents',
  Contents: 'Contents',
  'Household Contents': 'Contents',
  'Public Liability': 'Liability',
  Liability: 'Liability',
  'Accidental Damage': 'Miscellaneous',
  'Business All Risks': 'Miscellaneous',
  'All Risks': 'Miscellaneous',
  'Specific items all risks': 'Miscellaneous',
  'Plant & Machinery': 'Plant & Machinery',
  'Machinery Insurance': 'Plant & Machinery',
  Glass: 'Glass',
  Money: 'Money',
  'Business Interruption': 'Business Interruption',
  Theft: 'Miscellaneous',
  'Goods in Transit': 'Miscellaneous',
}

/** Default schedule section label stored on portal_risk_items.insurance_section. */
export const CATEGORY_TO_INSURANCE_SECTION: Partial<Record<RiskCategory, string>> = {
  Building: 'Fire',
  Motor: 'Motor Specified',
  Contents: 'Office Contents',
  'Electronic Equipment': 'Electronic Equipment',
  'Plant & Machinery': 'Plant & Machinery',
  Glass: 'Glass',
  Money: 'Money',
  'Business Interruption': 'Business Interruption',
  Liability: 'Public Liability',
  Miscellaneous: 'Business All Risks',
}

export function defaultInsuranceSection(category: string): string {
  const mapped = CATEGORY_TO_INSURANCE_SECTION[category as RiskCategory]
  return mapped ?? category
}

export function categoryForSection(section: string | null | undefined): RiskCategory {
  const key = (section ?? '').trim()
  if (SECTION_TO_CATEGORY[key]) return SECTION_TO_CATEGORY[key]
  const lower = key.toLowerCase()
  for (const [sectionName, category] of Object.entries(SECTION_TO_CATEGORY)) {
    if (sectionName.toLowerCase() === lower) return category
  }
  const asCategory = key as RiskCategory
  if (
    [
      'Building',
      'Motor',
      'Contents',
      'Electronic Equipment',
      'Plant & Machinery',
      'Glass',
      'Money',
      'Business Interruption',
      'Liability',
      'Miscellaneous',
    ].includes(key)
  ) {
    return asCategory
  }
  return 'Miscellaneous'
}

/** Display helper: Building items are insured under the Fire schedule section. */
export function sectionNoteForCategory(category: string): string | null {
  if (category === 'Building') return 'Insured under Fire section'
  return null
}
