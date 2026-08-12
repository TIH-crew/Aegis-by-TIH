/** Sections that are cover-based (not scheduled physical assets). */
const NON_ASSET_PATTERNS = [
  /business\s*interruption/i,
  /\bbi\b/i,
  /liability/i,
  /\bmoney\b/i,
  /\bglass\b/i,
  /fidelity/i,
  /goods\s*in\s*transit/i,
  /accidental\s*damage/i,
  /public\s*liability/i,
  /employers?\s*liability/i,
  /personal\s*accident/i,
  /group\s*personal\s*accident/i,
  /sasria/i,
]

const ASSET_PATTERNS = [
  /\bmotor\b/i,
  /electronic/i,
  /plant/i,
  /machinery/i,
  /contents/i,
  /building/i,
  /\bfire\b/i,
  /all\s*risks/i,
]

export function isNonAssetScheduleSection(
  section: string | null | undefined,
  itemName?: string | null,
): boolean {
  const haystack = `${section ?? ''} ${itemName ?? ''}`.trim()
  if (!haystack) return false
  if (NON_ASSET_PATTERNS.some((re) => re.test(haystack))) return true
  // Explicit asset sections stay in the table even without a risk_item_id
  if (ASSET_PATTERNS.some((re) => re.test(haystack))) return false
  // Business-named covers without asset cues
  if (/^business\b/i.test(haystack) && !/vehicle|property|asset/i.test(haystack)) return true
  return false
}
