import type { CoveredItemExtension } from '../types/crm'
import { EXTRA_DEFINITIONS } from '../config/cover-extras'
import { extensionsForCategory, extensionsForSection } from '../config/section-extensions'

const RATING_FACTOR_NAMES = new Set([
  'cover terms',
  'cover options',
  'cover option',
  'finance',
  'security',
  'situation',
  'vehicle',
  'building',
  'contents',
  'risk address',
  'occupancy',
  'construction',
])

function catalogAddonNames(section: string | null | undefined): Set<string> {
  const names = new Set<string>()
  for (const def of Object.values(EXTRA_DEFINITIONS)) {
    names.add(def.name.toLowerCase())
  }
  for (const def of [
    ...extensionsForSection(section),
    ...extensionsForCategory('Motor'),
    ...extensionsForCategory(section ?? ''),
  ]) {
    if (def.scope === 'item' || def.scope === 'policy') {
      names.add(def.name.toLowerCase())
    }
  }
  return names
}

/** Schedule rating / underwriting blocks — NOT product add-ons. */
export function isRatingFactorExtension(ext: CoveredItemExtension): boolean {
  const name = ext.name.trim().toLowerCase()
  if (!name) return true
  if (RATING_FACTOR_NAMES.has(name)) return true
  const catalog = catalogAddonNames(null)
  if (catalog.has(name)) return false
  // Rows that are mostly detail bags without matching an addon name
  return Object.keys(ext.details ?? {}).length > 0
}

/** True product extensions / add-ons (windscreen, car hire, credit shortfall, …). */
export function isAddonExtension(ext: CoveredItemExtension): boolean {
  const name = ext.name.trim().toLowerCase()
  if (!name || RATING_FACTOR_NAMES.has(name)) return false
  const catalog = catalogAddonNames(null)
  if (catalog.has(name)) return true
  // Explicit addon-like names from schedules
  return /hire|shortfall|windscreen|roadside|sasria|tyre|hail|excess|tracker|keys|locks|geyser|subsidence/i.test(
    name,
  )
}

export function splitScheduleExtensions(extensions: CoveredItemExtension[] | undefined) {
  const rows = extensions ?? []
  return {
    addons: rows.filter(isAddonExtension),
    underwriting: rows.filter(isRatingFactorExtension),
  }
}

export function flattenUnderwritingDetails(
  underwriting: CoveredItemExtension[],
): { group: string; label: string; value: string }[] {
  const out: { group: string; label: string; value: string }[] = []
  for (const row of underwriting) {
    const details = row.details ?? {}
    const entries = Object.entries(details).filter(([, v]) => String(v).trim() !== '')
    if (entries.length === 0) continue
    for (const [k, v] of entries) {
      out.push({
        group: row.name,
        label: k.replace(/([A-Z])/g, ' $1').replace(/^./, (c) => c.toUpperCase()),
        value: String(v),
      })
    }
  }
  return out
}

export function whatsappHref(number: string) {
  const digits = number.replace(/[^\d]/g, '')
  return digits ? `https://wa.me/${digits}` : null
}
