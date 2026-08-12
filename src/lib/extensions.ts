import type { CoveredItemExtension } from '../types/crm'
import type { PolicySectionExtension, SelectedExtension } from '../types/employee'
import {
  itemExtensionsFor,
  policyExtensionsFor,
  type ExtensionDefinition,
} from '../config/section-extensions'

export interface ResolvedExtension {
  code: string
  name: string
  scope: 'policy' | 'item'
  description: string
  included: boolean
  source: 'catalog' | 'policy' | 'item'
  sum_insured: number | null
  premium_excl: number | null
  notes: string | null
}

function asSelected(raw: unknown): SelectedExtension[] {
  if (!Array.isArray(raw)) return []
  const rows: SelectedExtension[] = []
  for (const row of raw) {
    const item = row as Record<string, unknown>
    const code = item.code != null ? String(item.code) : ''
    const name = item.name != null ? String(item.name) : code
    if (!code && !name) continue
    rows.push({
      code: code || name.toLowerCase().replace(/\s+/g, '_'),
      name,
      included: item.included !== false,
      sum_insured: item.sum_insured != null ? Number(item.sum_insured) : null,
      premium_excl: item.premium_excl != null ? Number(item.premium_excl) : null,
      notes: item.notes != null ? String(item.notes) : null,
    })
  }
  return rows
}

export function parsePolicySectionExtensions(raw: unknown): PolicySectionExtension[] {
  if (!Array.isArray(raw)) return []
  return raw
    .map((row) => {
      const item = row as Record<string, unknown>
      const section = item.section != null ? String(item.section) : ''
      const parsed = asSelected([item])[0]
      if (!section || !parsed) return null
      return { ...parsed, section }
    })
    .filter((row): row is PolicySectionExtension => row != null)
}

function overlay(
  defs: ExtensionDefinition[],
  stored: SelectedExtension[],
  source: ResolvedExtension['source'],
): ResolvedExtension[] {
  const byCode = new Map(stored.map((row) => [row.code, row]))
  const byName = new Map(stored.map((row) => [row.name.toLowerCase(), row]))

  return defs.map((def) => {
    const match = byCode.get(def.code) ?? byName.get(def.name.toLowerCase())
    return {
      code: def.code,
      name: def.name,
      scope: def.scope,
      description: def.description,
      included: match ? match.included : Boolean(def.defaultIncluded),
      source: match ? source : 'catalog',
      sum_insured: match?.sum_insured ?? null,
      premium_excl: match?.premium_excl ?? null,
      notes: match?.notes ?? null,
    }
  })
}

export function resolvePolicySectionExtensions(
  section: string,
  stored: PolicySectionExtension[],
): ResolvedExtension[] {
  const forSection = stored.filter((row) => row.section === section)
  return overlay(policyExtensionsFor(section), forSection, 'policy')
}

export function resolveItemExtensions(
  sectionOrCategory: string | null | undefined,
  stored: unknown,
): ResolvedExtension[] {
  return overlay(itemExtensionsFor(sectionOrCategory), asSelected(stored), 'item')
}

export function groupPolicyExtensionsBySection(
  sections: string[],
  stored: PolicySectionExtension[],
) {
  const unique = [...new Set(sections.filter(Boolean))]
  return unique.map((section) => ({
    section,
    extensions: resolvePolicySectionExtensions(section, stored),
  }))
}

export function defaultPolicyExtensionsForSections(sections: string[]): PolicySectionExtension[] {
  const unique = [...new Set(sections.filter(Boolean))]
  return unique.flatMap((section) =>
    policyExtensionsFor(section)
      .filter((ext) => ext.defaultIncluded)
      .map((ext) => ({
        section,
        code: ext.code,
        name: ext.name,
        included: true,
        sum_insured: null,
        premium_excl: null,
        notes: null,
      })),
  )
}

export function isRatingFactorExtension(ext: CoveredItemExtension) {
  // Prefer schedule-extensions helper (cover terms / finance / vehicle ≠ add-ons)
  return (
    !ext.name?.trim() ||
    /^(cover terms|cover options?|finance|security|situation|vehicle)$/i.test(ext.name.trim())
  )
}

export { whatsappHref } from './schedule-extensions'
