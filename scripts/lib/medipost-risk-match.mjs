export const MEDIPOST_ZOHO_ACCOUNT = '7351644000001876029'
export const MEDIPOST_PORTAL_ACCOUNT = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
export const MEDIPOST_POLICY_ZOHO_ID = '7351644000001876587'
export const MEDIPOST_POLICY_PORTAL_ID = 'c2222222-2222-4222-8222-222222222248'
export const MEDIPOST_POLICY_CODE = 'B00000048'

/** Schedule lines omitted from Zoho Covered_Items (CRM subform max 100 rows; portal keeps all 106) */
export const ZOHO_OMIT_NIMBIS_IDS = new Set([
  59211, // duplicate MS Office line
  59212, // duplicate SSD Steyn line
  59249, // 21x Ulefone (16x line retained)
  59174, // accidental damage duplicate @ Gezina premises
  59244, // RAM line — duplicate zoho match with laptop row
  59208, // duplicate MS Office premium split line
])

/** Zoho ids created during linkage (nimbis riskId -> zoho id) */
export const CREATED_ZOHO_RISK_IDS = {
  59177: '7351644000003957001',
  59186: '7351644000003957002',
  59258: '7351644000003957003',
}

/** Manual overrides for ambiguous schedule lines (nimbis riskId -> zoho risk id) */
export const MANUAL_ZOHO_MATCHES = {
  59174: '7351644000001857129', // Accidental damage @ Gezina — same premises risk
  59211: '7351644000001857079', // duplicate MS Office line
  59212: '7351644000001857080', // second SSD Steyn record
  59249: '7351644000001857119', // 21x Ulefone -> closest 16x record (review)
  62530: '7351644000001857133',
  62531: '7351644000001857134',
}

export function normName(value) {
  return String(value ?? '')
    .trim()
    .toLowerCase()
    .replace(/\s+/g, ' ')
    .replace(/\s*@\s*r[\d,\.]+.*$/i, '')
    .replace(/\s*@\s*[\d,\.]+.*$/i, '')
}

function tokenSet(value) {
  return new Set([...String(value ?? '').toLowerCase().matchAll(/[a-z0-9]+/g)].map((m) => m[0]))
}

export function buildZohoIndex(zohoRisks) {
  const byExact = new Map()
  const byNorm = new Map()
  const byId = new Map()
  const lists = { byExact, byNorm, byId, all: zohoRisks }

  for (const risk of zohoRisks) {
    const id = String(risk.id)
    const name = String(risk.Name ?? '').trim()
    byId.set(id, { ...risk, id, name })
    byExact.set(name, id)
    const n = normName(name)
    if (!byNorm.has(n)) byNorm.set(n, [])
    byNorm.get(n).push(id)
  }

  return lists
}

export function matchRiskToZoho(risk, index, usedZohoIds = new Set()) {
  const riskId = risk.riskId
  const desc = String(risk.description ?? '').trim()

  if (CREATED_ZOHO_RISK_IDS[riskId]) {
    const manual = CREATED_ZOHO_RISK_IDS[riskId]
    const row = index.byId.get(manual)
    return {
      zohoId: manual,
      zohoName: row?.name ?? desc,
      matchStatus: 'created',
      action: 'link',
    }
  }

  if (MANUAL_ZOHO_MATCHES[riskId] !== undefined) {
    const manual = MANUAL_ZOHO_MATCHES[riskId]
    if (manual === null) {
      return { zohoId: null, zohoName: null, matchStatus: 'new', action: 'create' }
    }
    const row = index.byId.get(manual)
    return {
      zohoId: manual,
      zohoName: row?.name ?? null,
      matchStatus: 'manual',
      action: 'review',
    }
  }

  if (index.byExact.has(desc)) {
    const zohoId = pickAvailable(index.byExact.get(desc), usedZohoIds, index)
    const row = index.byId.get(zohoId)
    return { zohoId, zohoName: row?.name ?? desc, matchStatus: 'exact', action: 'link' }
  }

  const normalized = normName(desc)
  const normHits = index.byNorm.get(normalized) ?? []
  if (normHits.length > 0) {
    const zohoId = pickAvailable(normHits[0], usedZohoIds, index, normHits)
    const row = index.byId.get(zohoId)
    return { zohoId, zohoName: row?.name ?? desc, matchStatus: 'normalized', action: 'link' }
  }

  const ref = desc.toLowerCase().match(/in\d+/)
  if (ref) {
    for (const [id, row] of index.byId) {
      if (row.name.toLowerCase().includes(ref[0]) && !usedZohoIds.has(id)) {
        return { zohoId: id, zohoName: row.name, matchStatus: 'ref', action: 'review' }
      }
    }
  }

  const descTokens = tokenSet(desc)
  let best = null
  let bestScore = 0
  for (const [id, row] of index.byId) {
    if (usedZohoIds.has(id)) continue
    const zt = tokenSet(row.name)
    const inter = [...descTokens].filter((t) => zt.has(t)).length
    if (inter > bestScore && inter >= 3) {
      bestScore = inter
      best = { zohoId: id, zohoName: row.name, matchStatus: 'token', action: 'review' }
    }
  }
  if (best) return best

  return { zohoId: null, zohoName: null, matchStatus: 'new', action: 'create' }
}

function pickAvailable(preferredId, usedZohoIds, index, alternates = []) {
  const candidates = [preferredId, ...alternates.filter((id) => id !== preferredId)]
  for (const id of candidates) {
    if (!usedZohoIds.has(id)) return id
  }
  return preferredId
}

export function buildMappingRows(policy, zohoRisks) {
  const index = buildZohoIndex(zohoRisks)
  const usedZohoIds = new Set()
  const rows = []

  for (const risk of policy.risks ?? []) {
    let match = matchRiskToZoho(risk, index, usedZohoIds)
    if (match.zohoId) usedZohoIds.add(match.zohoId)

    rows.push({
      nimbis_risk_id: risk.riskId,
      tracking_id: risk.trackingId ?? null,
      section: risk.section ?? null,
      description: String(risk.description ?? '').trim(),
      sum_insured: risk.insuredAmount != null ? Number(risk.insuredAmount) : null,
      premium_excl: risk.premium != null ? Number(risk.premium) : null,
      premium_incl: risk.premiumIncl != null ? Number(risk.premiumIncl) : null,
      cover_status: risk.status ?? null,
      inception_date: risk.inceptionDate ? String(risk.inceptionDate).slice(0, 10) : null,
      match_status: match.matchStatus,
      zoho_risk_id: match.zohoId,
      zoho_risk_name: match.zohoName,
      portal_risk_id: null,
      action: match.action,
    })
  }

  const matchedZoho = new Set(rows.map((r) => r.zoho_risk_id).filter(Boolean))
  const zohoOnly = zohoRisks
    .filter((z) => !matchedZoho.has(String(z.id)))
    .map((z) => ({
      zoho_risk_id: String(z.id),
      zoho_risk_name: String(z.Name ?? ''),
      action: 'zoho_only',
    }))

  return { rows, zohoOnly, summary: summarize(rows) }
}

function summarize(rows) {
  const counts = {}
  for (const row of rows) {
    counts[row.action] = (counts[row.action] ?? 0) + 1
  }
  return {
    total: rows.length,
    link: counts.link ?? 0,
    review: counts.review ?? 0,
    create: counts.create ?? 0,
  }
}

export function toZohoCoveredItem(row) {
  if (!row.zoho_risk_id) return null
  if (ZOHO_OMIT_NIMBIS_IDS.has(row.nimbis_risk_id)) return null
  const round2 = (n) => (n == null ? null : Math.round(Number(n) * 100) / 100)
  return {
    Risk_Item: { id: row.zoho_risk_id },
    Section: row.section,
    Sum_Insured: row.sum_insured,
    Premium_Excl: round2(row.premium_excl),
    Premium_Incl: round2(row.premium_incl),
    Cover_Status: row.cover_status,
    Description: row.description,
  }
}

export function csvEscape(value) {
  const s = value == null ? '' : String(value)
  if (s.includes(',') || s.includes('"') || s.includes('\n')) {
    return `"${s.replace(/"/g, '""')}"`
  }
  return s
}
