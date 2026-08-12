import type { RiskCategory } from './collections'

/** Mirrors quote-workspace-widget COVER_LIBRARY + motor underwriting extras. */
export type CoverTypeKey =
  | 'comprehensive'
  | 'third_party_fire_theft'
  | 'third_party_only'
  | 'limited_cover'
  | 'standard'

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
  /**
   * When set, only offered if the matching underwriting answer is true.
   * Example: credit_shortfall requires is_financed.
   */
  requires?: 'is_financed' | 'has_tracker'
  /** Ask as a yes/no question (default) or chip */
  kind?: 'toggle' | 'info'
}

export interface CoverLibraryEntry {
  category: RiskCategory
  coverTypes: CoverTypeDefinition[]
}

export const EXTRA_DEFINITIONS: Record<string, ExtraDefinition> = {
  windscreen: {
    code: 'windscreen',
    name: 'Windscreen Cover',
    description: 'Glass / windscreen replacement, often with a reduced excess.',
    categories: ['Motor'],
  },
  scratch_dent: {
    code: 'scratch_dent',
    name: 'Scratch & Dent',
    description: 'Cosmetic bodywork repair for minor scratches and dents.',
    categories: ['Motor'],
  },
  roadside_assist: {
    code: 'roadside_assist',
    name: 'Roadside Assistance',
    description: 'Breakdown, towing, and roadside support for this vehicle.',
    categories: ['Motor'],
  },
  tyre_rim: {
    code: 'tyre_rim',
    name: 'Tyre & Rim',
    description: 'Cover for damaged tyres and rims from road hazards.',
    categories: ['Motor'],
  },
  radio_sound: {
    code: 'radio_sound',
    name: 'Vehicle Sound Equipment',
    description: 'Audio / entertainment hardware above the standard accessory limit.',
    categories: ['Motor'],
  },
  tracking_recovery: {
    code: 'tracking_recovery',
    name: 'Tracking Device Recovery Support',
    description: 'Recovery assistance when a fitted tracker is used after theft or hijack.',
    categories: ['Motor'],
    requires: 'has_tracker',
  },
  emergency_accommodation: {
    code: 'emergency_accommodation',
    name: 'Emergency Accommodation',
    description: 'Overnight accommodation after an insured motor event away from home.',
    categories: ['Motor'],
  },
  locks_keys_remote: {
    code: 'locks_keys_remote',
    name: 'Keys, Locks & Remote Replacement',
    description: 'Replacement of keys, locks, and remotes after loss or theft.',
    categories: ['Motor', 'Contents'],
  },
  car_hire: {
    code: 'car_hire',
    name: 'Car hire',
    description: 'Courtesy / hire vehicle while this unit is off the road after an insured event.',
    categories: ['Motor'],
  },
  credit_shortfall: {
    code: 'credit_shortfall',
    name: 'Credit shortfall',
    description:
      'Pays the gap between the settlement and outstanding finance after a total loss (financed vehicles only).',
    categories: ['Motor', 'Plant & Machinery'],
    requires: 'is_financed',
  },
  // Electronic Equipment / IT (generic commercial EE section)
  reinstatement_data: {
    code: 'reinstatement_data',
    name: 'Reinstatement of data',
    description: 'Cost to restore programs and data after damage to hardware (not the information value).',
    categories: ['Electronic Equipment'],
  },
  increased_cost_working_ee: {
    code: 'increased_cost_working_ee',
    name: 'Increased cost of working',
    description: 'Extra expense to keep IT operations running after equipment damage.',
    categories: ['Electronic Equipment'],
  },
  incompatibility_software: {
    code: 'incompatibility_software',
    name: 'Incompatibility of software',
    description: 'Software or firmware that cannot run on replacement equipment.',
    categories: ['Electronic Equipment'],
  },
  portable_computers: {
    code: 'portable_computers',
    name: 'Portable computers / laptops',
    description: 'Laptops and tablets away from the insured premises (often all-risk sub-limit).',
    categories: ['Electronic Equipment'],
  },
  // Buildings / Fire
  geyser: {
    code: 'geyser',
    name: 'Geyser',
    description: 'Geyser and water-heating replacement under the buildings / fire section.',
    categories: ['Building'],
  },
  subsidence: {
    code: 'subsidence',
    name: 'Subsidence and landslip',
    description: 'Optional ground-movement cover, usually underwritten separately.',
    categories: ['Building'],
  },
  escalation: {
    code: 'escalation',
    name: 'Escalation',
    description: 'Inflation loading on the building sum insured during the period of insurance.',
    categories: ['Building'],
  },
  // Contents / Office
  documents: {
    code: 'documents',
    name: 'Documents',
    description: 'Cost of reinstating business documents and records.',
    categories: ['Contents'],
  },
  locks_keys: {
    code: 'locks_keys',
    name: 'Locks and keys',
    description: 'Replacement of locks and keys after theft or attempted theft.',
    categories: ['Contents'],
  },
  // Plant
  expediting_costs: {
    code: 'expediting_costs',
    name: 'Expediting costs',
    description: 'Air freight and overtime to speed up repair or replacement of plant.',
    categories: ['Plant & Machinery'],
  },
  // Glass
  special_glass: {
    code: 'special_glass',
    name: 'Special glass / signage',
    description: 'Specified glass, mirrors, and signwriting beyond standard shopfront cover.',
    categories: ['Glass'],
  },
  // Money
  cash_in_transit: {
    code: 'cash_in_transit',
    name: 'Cash in transit',
    description: 'Money while being conveyed to or from the bank.',
    categories: ['Money'],
  },
  // BI
  suppliers_extension: {
    code: 'suppliers_extension',
    name: 'Suppliers / customers extension',
    description: 'Business interruption following damage at a named supplier or customer.',
    categories: ['Business Interruption'],
  },
  // Liability
  wrongful_arrest: {
    code: 'wrongful_arrest',
    name: 'Wrongful arrest',
    description: 'Liability arising from wrongful arrest or defamation in the course of business.',
    categories: ['Liability'],
  },
  spread_of_fire: {
    code: 'spread_of_fire',
    name: 'Spread of fire',
    description: 'Liability for fire spreading from the insured premises.',
    categories: ['Liability'],
  },
  // Portable / BAR
  worldwide: {
    code: 'worldwide',
    name: 'Worldwide cover',
    description: 'All-risk cover outside the Republic, subject to wording.',
    categories: ['Miscellaneous'],
  },
}

/** Cover types + eligible extra codes — aligned to zohowidget COVER_LIBRARY. */
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
        optionalExtraCodes: [
          'windscreen',
          'scratch_dent',
          'roadside_assist',
          'tyre_rim',
          'radio_sound',
          'tracking_recovery',
          'emergency_accommodation',
          'locks_keys_remote',
          'car_hire',
          'credit_shortfall',
        ],
      },
      {
        key: 'third_party_fire_theft',
        label: 'Third Party, Fire & Theft',
        mandatoryCovers: [
          'Third Party Liability',
          'Theft & Hijacking',
          'Fire, Explosion & Lightning',
        ],
        optionalExtraCodes: ['roadside_assist', 'windscreen', 'locks_keys_remote', 'car_hire', 'credit_shortfall'],
      },
      {
        key: 'third_party_only',
        label: 'Third Party Only',
        mandatoryCovers: ['Third Party Liability'],
        optionalExtraCodes: ['roadside_assist'],
      },
      {
        key: 'limited_cover',
        label: 'Limited Cover / Total Loss Only',
        mandatoryCovers: ['Total Loss', 'Theft & Hijacking', 'Third Party Liability'],
        optionalExtraCodes: ['roadside_assist', 'tracking_recovery', 'credit_shortfall'],
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
        label: 'Buildings / Fire',
        mandatoryCovers: ['Buildings'],
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
        optionalExtraCodes: ['documents', 'locks_keys', 'locks_keys_remote'],
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
    // Categories with a single standard cover still use library; otherwise empty.
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

/** Nimbis / schedule section name → Aegis category */
export const SECTION_TO_CATEGORY: Record<string, RiskCategory> = {
  'Motor Specified': 'Motor',
  Motor: 'Motor',
  'Electronic Equipment': 'Electronic Equipment',
  Fire: 'Building',
  Building: 'Building',
  Buildings: 'Building',
  'Office Contents': 'Contents',
  Contents: 'Contents',
  'Public Liability': 'Liability',
  Liability: 'Liability',
  'Accidental Damage': 'Miscellaneous',
  'Business All Risks': 'Miscellaneous',
  'All Risks': 'Miscellaneous',
  'Plant & Machinery': 'Plant & Machinery',
  Glass: 'Glass',
  Money: 'Money',
  'Business Interruption': 'Business Interruption',
}

export function categoryForSection(section: string | null | undefined): RiskCategory {
  const key = (section ?? '').trim()
  if (SECTION_TO_CATEGORY[key]) return SECTION_TO_CATEGORY[key]
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
