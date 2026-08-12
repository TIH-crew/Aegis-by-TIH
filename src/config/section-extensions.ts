import type { RiskCategory } from './collections'
import {
  EXTRA_DEFINITIONS,
  categoryForSection as mapSection,
  coverTypesForCategory,
  eligibleExtrasForItem,
  type ExtraDefinition,
} from './cover-extras'

export type ExtensionScope = 'policy' | 'item'

export interface ExtensionDefinition {
  code: string
  name: string
  scope: ExtensionScope
  description: string
  /** Included on typical wording unless opted out — policy-level only */
  defaultIncluded?: boolean
}

export { categoryForSection } from './cover-extras'
export { SECTION_TO_CATEGORY } from './cover-extras'

/** Policy-level covers that typically sit on the schedule section (not item pickers). */
const POLICY_LEVEL: Partial<Record<RiskCategory, ExtensionDefinition[]>> = {
  Motor: [
    {
      code: 'sasria_motor',
      name: 'SASRIA',
      scope: 'policy',
      description: 'Riot, strike, and public disorder cover for motor (standalone coupon).',
      defaultIncluded: true,
    },
  ],
  Building: [
    {
      code: 'sasria_fire',
      name: 'SASRIA',
      scope: 'policy',
      description: 'Riot cover for buildings / fire section.',
      defaultIncluded: true,
    },
    {
      code: 'special_perils',
      name: 'Special perils',
      scope: 'policy',
      description: 'Storm, water, and related perils on the fire section.',
      defaultIncluded: true,
    },
  ],
  Contents: [
    {
      code: 'sasria_contents',
      name: 'SASRIA',
      scope: 'policy',
      description: 'Riot cover for office contents.',
      defaultIncluded: true,
    },
    {
      code: 'theft_forcible',
      name: 'Theft (forcible entry)',
      scope: 'policy',
      description: 'Theft following forcible and violent entry or exit.',
      defaultIncluded: true,
    },
  ],
  'Electronic Equipment': [
    {
      code: 'sasria_ee',
      name: 'SASRIA',
      scope: 'policy',
      description: 'Riot cover for electronic equipment.',
      defaultIncluded: true,
    },
  ],
  'Plant & Machinery': [
    {
      code: 'sasria_plant',
      name: 'SASRIA',
      scope: 'policy',
      description: 'Riot cover for plant and machinery.',
      defaultIncluded: true,
    },
  ],
  Miscellaneous: [
    {
      code: 'sasria_bar',
      name: 'SASRIA',
      scope: 'policy',
      description: 'Riot cover for portable / all-risk items.',
      defaultIncluded: true,
    },
  ],
  Money: [
    {
      code: 'seasonal_increase',
      name: 'Seasonal increase',
      scope: 'policy',
      description: 'Higher money limit over peak trading periods.',
    },
  ],
  'Business Interruption': [
    {
      code: 'additional_increased_cost',
      name: 'Additional increased cost of working',
      scope: 'policy',
      description: 'Extra expense beyond the standard BI formula to maintain turnover.',
    },
  ],
  Liability: [
    {
      code: 'territorial_limits',
      name: 'Territorial limits',
      scope: 'policy',
      description: 'Geographic scope of public liability cover.',
      defaultIncluded: true,
    },
  ],
}

function toItemDef(extra: ExtraDefinition): ExtensionDefinition {
  return {
    code: extra.code,
    name: extra.name,
    scope: 'item',
    description: extra.description,
  }
}

/** All known item extras for a category (union across cover types). */
function itemDefsForCategory(category: RiskCategory): ExtensionDefinition[] {
  const covers = coverTypesForCategory(category)
  const codes = new Set<string>()
  for (const cover of covers) {
    for (const code of cover.optionalExtraCodes) codes.add(code)
  }
  // Also include any EXTRA_DEFINITIONS tagged for the category
  for (const def of Object.values(EXTRA_DEFINITIONS)) {
    if (def.categories.includes(category)) codes.add(def.code)
  }
  return [...codes]
    .map((code) => EXTRA_DEFINITIONS[code])
    .filter((d): d is ExtraDefinition => Boolean(d))
    .map(toItemDef)
}

export const CATEGORY_EXTENSIONS: Record<RiskCategory, ExtensionDefinition[]> = {
  Motor: [...(POLICY_LEVEL.Motor ?? []), ...itemDefsForCategory('Motor')],
  Building: [...(POLICY_LEVEL.Building ?? []), ...itemDefsForCategory('Building')],
  Contents: [...(POLICY_LEVEL.Contents ?? []), ...itemDefsForCategory('Contents')],
  'Electronic Equipment': [
    ...(POLICY_LEVEL['Electronic Equipment'] ?? []),
    ...itemDefsForCategory('Electronic Equipment'),
  ],
  Liability: [...(POLICY_LEVEL.Liability ?? []), ...itemDefsForCategory('Liability')],
  Miscellaneous: [...(POLICY_LEVEL.Miscellaneous ?? []), ...itemDefsForCategory('Miscellaneous')],
  'Plant & Machinery': [
    ...(POLICY_LEVEL['Plant & Machinery'] ?? []),
    ...itemDefsForCategory('Plant & Machinery'),
  ],
  Glass: [...itemDefsForCategory('Glass')],
  Money: [...(POLICY_LEVEL.Money ?? []), ...itemDefsForCategory('Money')],
  'Business Interruption': [
    ...(POLICY_LEVEL['Business Interruption'] ?? []),
    ...itemDefsForCategory('Business Interruption'),
  ],
}

export function extensionsForSection(section: string | null | undefined): ExtensionDefinition[] {
  return CATEGORY_EXTENSIONS[mapSection(section)]
}

export function extensionsForCategory(category: string | null | undefined): ExtensionDefinition[] {
  if (category && category in CATEGORY_EXTENSIONS) {
    return CATEGORY_EXTENSIONS[category as RiskCategory]
  }
  return extensionsForSection(category)
}

export function policyExtensionsFor(section: string | null | undefined) {
  return extensionsForSection(section).filter((ext) => ext.scope === 'policy')
}

export function itemExtensionsFor(section: string | null | undefined) {
  return extensionsForSection(section).filter((ext) => ext.scope === 'item')
}

/** Eligible item extras for the add-item questionnaire. */
export function questionnaireExtras(
  category: string,
  coverTypeKey: string | null | undefined,
  ctx: { is_financed?: boolean | null; has_tracker?: boolean | null },
) {
  return eligibleExtrasForItem(category, coverTypeKey, ctx)
}
