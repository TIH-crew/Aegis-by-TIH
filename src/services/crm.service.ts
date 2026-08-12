import { supabase } from '../lib/supabase'
import { getStoredActiveAccountId } from '../lib/active-account'
import { parsePolicySectionExtensions, defaultPolicyExtensionsForSections } from '../lib/extensions'
import { getOrganization, updateOrganization } from './organization.service'
import type {
  BrokerRequestInput,
  ClaimSummary,
  ContactSummary,
  CoveredItem,
  CreateClaimInput,
  PolicyDetail,
  PolicySummary,
  QuotationDetail,
  QuotationSummary,
  ZohoAccountSnapshot,
} from '../types/crm'
import type { Organization } from '../types/organization'

function crmBaseUrl() {
  const functionsBase = import.meta.env.VITE_SUPABASE_FUNCTIONS_URL
  if (functionsBase) {
    return `${functionsBase.replace(/\/$/, '')}/aegis-crm`
  }
  const url = import.meta.env.VITE_SUPABASE_URL
  if (!url) throw new Error('Missing VITE_SUPABASE_URL')
  return `${url.replace(/\/$/, '')}/functions/v1/aegis-crm`
}

interface CrmContext {
  accountId: string
  zohoAccountId: string | null
}

async function getCrmContext(): Promise<CrmContext> {
  const {
    data: { session },
  } = await supabase.auth.getSession()
  if (!session?.user) throw new Error('Not signed in')

  const { data: membership, error: memberError } = await supabase
    .from('portal_users')
    .select('account_id')
    .eq('user_id', session.user.id)
    .maybeSingle()

  if (memberError || !membership?.account_id) throw new Error('No portal account')

  const storedActive = getStoredActiveAccountId()
  const accountId =
    storedActive && storedActive !== membership.account_id
      ? storedActive
      : membership.account_id

  // Ensure active account is home or a direct subsidiary of home
  if (accountId !== membership.account_id) {
    const { data: child, error: childError } = await supabase
      .from('portal_accounts')
      .select('id')
      .eq('id', accountId)
      .eq('parent_account_id', membership.account_id)
      .maybeSingle()
    if (childError || !child) {
      // Fall back to membership account if stored selection is invalid
      const { data: account, error: accountError } = await supabase
        .from('portal_accounts')
        .select('zoho_account_id')
        .eq('id', membership.account_id)
        .maybeSingle()
      if (accountError) throw accountError
      return {
        accountId: membership.account_id,
        zohoAccountId: account?.zoho_account_id ?? null,
      }
    }
  }

  const { data: account, error: accountError } = await supabase
    .from('portal_accounts')
    .select('zoho_account_id')
    .eq('id', accountId)
    .maybeSingle()

  if (accountError) throw accountError

  return {
    accountId,
    zohoAccountId: account?.zoho_account_id ?? null,
  }
}

async function crmFetch<T>(path: string, init?: RequestInit): Promise<T> {
  const {
    data: { session },
  } = await supabase.auth.getSession()
  if (!session?.access_token) throw new Error('Not signed in')

  const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY
  const res = await fetch(`${crmBaseUrl()}/${path.replace(/^\//, '')}`, {
    ...init,
    headers: {
      Authorization: `Bearer ${session.access_token}`,
      apikey: anonKey,
      'Content-Type': 'application/json',
      ...(init?.headers ?? {}),
    },
  })

  const data = await res.json().catch(() => ({}))
  if (!res.ok || data.ok === false) {
    throw new Error(data.error ?? `CRM request failed (${res.status})`)
  }
  return data as T
}

function isUuid(value: string) {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(value)
}

async function fetchPortalQuotations(accountId: string): Promise<QuotationSummary[]> {
  const { data, error } = await supabase
    .from('portal_quotations')
    .select('id, title, status, stage, quote_number, zoho_deal_id')
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })

  if (error) throw error

  return (data ?? []).map((row) => ({
    id: row.id,
    name: row.title,
    stage: row.stage ?? row.status ?? '—',
    quote_number: row.quote_number,
  }))
}

async function findPortalQuotation(accountId: string, id: string) {
  if (isUuid(id)) {
    const { data, error } = await supabase
      .from('portal_quotations')
      .select('id, title, status, stage, quote_number, zoho_deal_id, total_value')
      .eq('account_id', accountId)
      .eq('id', id)
      .maybeSingle()
    if (error) throw error
    if (data) return data
  }

  const { data, error } = await supabase
    .from('portal_quotations')
    .select('id, title, status, stage, quote_number, zoho_deal_id, total_value')
    .eq('account_id', accountId)
    .eq('zoho_deal_id', id)
    .maybeSingle()

  if (error) throw error
  return data
}

async function fetchPortalQuotation(accountId: string, id: string): Promise<QuotationDetail> {
  const row = await findPortalQuotation(accountId, id)
  if (!row) throw new Error('Quotation not found')

  const { data: risks, error: risksError } = await supabase
    .from('portal_risk_items')
    .select(
      'id, name, category, unit_cost, branch, insurance_status, insurance_section, zoho_risk_id',
    )
    .eq('account_id', accountId)
    .order('category', { ascending: true })
    .order('name', { ascending: true })

  if (risksError) throw risksError

  return {
    id: row.zoho_deal_id ?? row.id,
    name: row.title,
    stage: row.stage ?? row.status ?? '—',
    quote_number: row.quote_number,
    risk_items: (risks ?? []).map((risk) => ({
      id: risk.id,
      name: risk.name,
      item_type: null,
      risk_type: risk.category,
      risk_category: risk.insurance_section ?? risk.category,
      risk_status: risk.insurance_status,
      stage: null,
      unit_cost: risk.unit_cost != null ? Number(risk.unit_cost) : null,
      branch: risk.branch,
      zoho_risk_id: risk.zoho_risk_id,
      zoho_risk_name: risk.name,
    })),
  }
}

async function fetchPortalPolicies(accountId: string): Promise<PolicySummary[]> {
  const { data, error } = await supabase
    .from('portal_policies')
    .select(
      'id, zoho_policy_id, policy_number, status, premium, inception_date, renewal_date, insurer, product_line',
    )
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })

  if (error) throw error

  return (data ?? []).map((row) => ({
    id: row.id,
    policy_number: row.policy_number ?? 'Policy',
    status: row.status,
    premium: row.premium != null ? Number(row.premium) : null,
    inception_date: row.inception_date,
    renewal_date: row.renewal_date,
    insurer: row.insurer,
    product_line: row.product_line,
    zoho_policy_id: row.zoho_policy_id,
  }))
}

async function findPortalPolicy(accountId: string, id: string) {
  if (isUuid(id)) {
    const { data, error } = await supabase
      .from('portal_policies')
      .select(
        'id, zoho_policy_id, policy_number, insurer_policy_number, status, premium, sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line, frequency, covered_items, section_extensions',
      )
      .eq('account_id', accountId)
      .eq('id', id)
      .maybeSingle()
    if (error) throw error
    if (data) return data
  }

  const { data, error } = await supabase
    .from('portal_policies')
    .select(
      'id, zoho_policy_id, policy_number, insurer_policy_number, status, premium, sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line, frequency, covered_items, section_extensions',
    )
    .eq('account_id', accountId)
    .eq('zoho_policy_id', id)
    .maybeSingle()

  if (error) throw error
  return data
}

function mapStoredCoveredItems(raw: unknown): CoveredItem[] {
  if (!Array.isArray(raw)) return []
  return raw.map((item) => {
    const row = item as Record<string, unknown>
    const extensionsRaw = Array.isArray(row.extensions) ? row.extensions : []
    const attachmentsRaw = Array.isArray(row.attachments) ? row.attachments : []
    const selectedRaw = Array.isArray(row.selected_extensions) ? row.selected_extensions : []
    return {
      risk_item_id: row.risk_item_id != null ? String(row.risk_item_id) : null,
      risk_item_name: row.risk_item_name != null ? String(row.risk_item_name) : null,
      section: row.section != null ? String(row.section) : null,
      sum_insured: row.sum_insured != null ? Number(row.sum_insured) : null,
      premium_excl: row.premium_excl != null ? Number(row.premium_excl) : null,
      premium_incl: row.premium_incl != null ? Number(row.premium_incl) : null,
      cover_status: row.cover_status != null ? String(row.cover_status) : null,
      description: row.description != null ? String(row.description) : null,
      branch: row.branch != null ? String(row.branch) : null,
      date_added:
        row.date_added != null
          ? String(row.date_added).slice(0, 10)
          : row.inception_date != null
            ? String(row.inception_date).slice(0, 10)
            : null,
      external_risk_id: row.external_risk_id != null ? String(row.external_risk_id) : null,
      tracking_id: row.tracking_id != null ? String(row.tracking_id) : null,
      selected_extensions: selectedRaw.map((ext, index) => {
        const e = ext as Record<string, unknown>
        return {
          code: e.code != null ? String(e.code) : `sel-${index}`,
          name: e.name != null ? String(e.name) : 'Extra',
          included: e.included !== false,
          sum_insured: e.sum_insured != null ? Number(e.sum_insured) : null,
          premium_excl: e.premium_excl != null ? Number(e.premium_excl) : null,
          notes: e.notes != null ? String(e.notes) : null,
        }
      }),
      extensions: extensionsRaw.map((ext, index) => {
        const e = ext as Record<string, unknown>
        const detailsRaw =
          e.details && typeof e.details === 'object' && !Array.isArray(e.details)
            ? (e.details as Record<string, unknown>)
            : {}
        return {
          id: e.id != null ? String(e.id) : `ext-${index}`,
          name: e.name != null ? String(e.name) : 'Extension',
          sum_insured: e.sum_insured != null ? Number(e.sum_insured) : null,
          premium_excl: e.premium_excl != null ? Number(e.premium_excl) : null,
          premium_incl: e.premium_incl != null ? Number(e.premium_incl) : null,
          details: Object.fromEntries(
            Object.entries(detailsRaw).map(([k, v]) => [k, String(v ?? '')]),
          ),
        }
      }),
      attachments: attachmentsRaw.map((att, index) => {
        const a = att as Record<string, unknown>
        return {
          id: a.id != null ? String(a.id) : `att-${index}`,
          file_name: a.file_name != null ? String(a.file_name) : 'Attachment',
          url: a.url != null ? String(a.url) : '',
          type: a.type != null ? String(a.type) : undefined,
        }
      }),
    }
  })
}

async function enrichCoveredItemsFromScheduleBundle(
  policyNumber: string | null,
  items: CoveredItem[],
): Promise<CoveredItem[]> {
  if (!policyNumber || items.length === 0) return items
  const needsEnrichment = items.some(
    (item) => (item.extensions?.length ?? 0) === 0 || !item.date_added,
  )
  if (!needsEnrichment) return items

  try {
    const res = await fetch(`/policy-schedules/${encodeURIComponent(policyNumber)}-covered-items.json`)
    if (!res.ok) return items
    const enriched = mapStoredCoveredItems(await res.json())
    const byExternal = new Map(
      enriched
        .filter((item) => item.external_risk_id)
        .map((item) => [item.external_risk_id as string, item]),
    )
    const byName = new Map(
      enriched
        .filter((item) => item.risk_item_name)
        .map((item) => [item.risk_item_name as string, item]),
    )

    return items.map((item) => {
      const match =
        (item.external_risk_id && byExternal.get(item.external_risk_id)) ||
        (item.risk_item_name && byName.get(item.risk_item_name)) ||
        null
      if (!match) return item
      return {
        ...item,
        date_added: item.date_added ?? match.date_added,
        external_risk_id: item.external_risk_id ?? match.external_risk_id,
        tracking_id: item.tracking_id ?? match.tracking_id,
        extensions: (item.extensions?.length ? item.extensions : match.extensions) ?? [],
        attachments: (item.attachments?.length ? item.attachments : match.attachments) ?? [],
      }
    })
  } catch {
    return items
  }
}

async function attachItemExtensions(
  accountId: string,
  items: CoveredItem[],
): Promise<CoveredItem[]> {
  const riskIds = items
    .map((item) => item.risk_item_id)
    .filter((id): id is string => Boolean(id))
  if (riskIds.length === 0) return items

  const { data: riskRows } = await supabase
    .from('portal_risk_items')
    .select('id, item_extensions')
    .eq('account_id', accountId)
    .in('id', riskIds)
  const byId = new Map((riskRows ?? []).map((risk) => [risk.id, risk.item_extensions]))
  return items.map((item) => ({
    ...item,
    selected_extensions: item.risk_item_id
      ? ((byId.get(item.risk_item_id) as CoveredItem['selected_extensions']) ??
        item.selected_extensions)
      : item.selected_extensions,
  }))
}

function sectionExtensionsForPolicy(
  row: { section_extensions?: unknown; covered_items?: unknown },
  items: CoveredItem[],
) {
  const sections = [...new Set(items.map((item) => item.section).filter(Boolean) as string[])]
  const stored = parsePolicySectionExtensions(row.section_extensions)
  return stored.length > 0 ? stored : defaultPolicyExtensionsForSections(sections)
}

async function fetchPortalPolicy(accountId: string, id: string): Promise<PolicyDetail> {
  const row = await findPortalPolicy(accountId, id)
  if (!row) throw new Error('Policy not found')

  const storedItems = mapStoredCoveredItems(row.covered_items)
  let covered_items = storedItems

  if (covered_items.length === 0) {
    const { data: risks, error: risksError } = await supabase
      .from('portal_risk_items')
      .select(
        'id, name, category, unit_cost, branch, insurance_status, insurance_section, description',
      )
      .eq('account_id', accountId)
      .order('category', { ascending: true })
      .order('name', { ascending: true })

    if (risksError) throw risksError

    covered_items = (risks ?? []).map((risk) => ({
      risk_item_id: risk.id,
      risk_item_name: risk.name,
      section: risk.insurance_section ?? risk.category,
      sum_insured: Number(risk.unit_cost),
      premium_excl: null,
      premium_incl: null,
      cover_status: risk.insurance_status,
      description: risk.description,
      branch: risk.branch,
    }))
  } else {
    covered_items = await enrichCoveredItemsFromScheduleBundle(row.policy_number, covered_items)
  }

  covered_items = await attachItemExtensions(accountId, covered_items)

  return {
    id: row.id,
    zoho_policy_id: row.zoho_policy_id ?? undefined,
    policy_number: row.policy_number ?? 'Policy',
    insurer_policy_number: row.insurer_policy_number ?? null,
    status: row.status,
    premium: row.premium != null ? Number(row.premium) : null,
    sasria_premium: row.sasria_premium != null ? Number(row.sasria_premium) : null,
    fee_premium: row.fee_premium != null ? Number(row.fee_premium) : null,
    inception_date: row.inception_date,
    renewal_date: row.renewal_date,
    insurer: row.insurer,
    product_line: row.product_line,
    frequency: row.frequency ?? null,
    covered_items,
    attachments: [],
    section_extensions: sectionExtensionsForPolicy(row, covered_items),
  }
}

async function fetchPortalClaims(accountId: string): Promise<ClaimSummary[]> {
  const { data, error } = await supabase
    .from('portal_claims')
    .select('id, title, status, zoho_claim_id, zoho_policy_id, created_at')
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })

  if (error) throw error

  const policyIds = [
    ...new Set((data ?? []).map((row) => row.zoho_policy_id).filter(Boolean)),
  ] as string[]

  let policyMap: Record<string, string> = {}
  if (policyIds.length > 0) {
    const { data: policies } = await supabase
      .from('portal_policies')
      .select('zoho_policy_id, policy_number')
      .eq('account_id', accountId)
      .in('zoho_policy_id', policyIds)

    policyMap = Object.fromEntries(
      (policies ?? []).map((policy) => [policy.zoho_policy_id, policy.policy_number ?? 'Policy']),
    )
  }

  return (data ?? []).map((row) => ({
    id: row.zoho_claim_id ?? row.id,
    name: row.title,
    status: row.status,
    policy_id: row.zoho_policy_id,
    policy_name: row.zoho_policy_id ? (policyMap[row.zoho_policy_id] ?? null) : null,
    created_time: row.created_at,
  }))
}

async function createPortalClaim(accountId: string, input: CreateClaimInput) {
  const riskItemId =
    input.risk_item_id && /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(
      input.risk_item_id,
    )
      ? input.risk_item_id
      : null

  const { data, error } = await supabase
    .from('portal_claims')
    .insert({
      account_id: accountId,
      risk_item_id: riskItemId,
      title: input.title.trim(),
      description: input.description?.trim() || null,
      zoho_policy_id: input.zoho_policy_id,
      status: 'Submitted',
      attachments: input.attachments ?? [],
      broker_message: input.broker_message?.trim() || null,
      voice_note_url: input.voice_note_url || null,
      schedule_item_key: input.schedule_item_key || null,
      schedule_item_name: input.schedule_item_name || null,
      claim_amount: input.claim_amount ?? null,
    })
    .select('id, title, status')
    .single()

  if (error) throw error
  return {
    claim: {
      id: data.id,
      title: data.title,
      status: data.status,
      zoho_claim_id: null,
    },
  }
}

async function sendPortalBrokerRequest(accountId: string, input: BrokerRequestInput) {
  const {
    data: { user },
  } = await supabase.auth.getUser()

  const { data, error } = await supabase
    .from('portal_broker_requests')
    .insert({
      account_id: accountId,
      request_type: 'add_item',
      context_type: input.context_type,
      context_zoho_id: input.context_zoho_id,
      context_label: input.context_label ?? null,
      risk_item_id: input.risk_item_id ?? null,
      draft_item: input.draft_item ?? null,
      message: input.message ?? null,
      status: 'sent',
      created_by: user?.id ?? null,
    })
    .select('id, status')
    .single()

  if (error) throw error
  return {
    request: {
      id: data.id,
      zoho_task_id: null,
      status: data.status,
    },
  }
}

export async function fetchQuotations(): Promise<QuotationSummary[]> {
  const { accountId, zohoAccountId } = await getCrmContext()
  const portal = () => fetchPortalQuotations(accountId)
  if (!zohoAccountId) return portal()
  try {
    const data = await crmFetch<{ quotations: QuotationSummary[] }>('quotations')
    const items = data.quotations ?? []
    if (items.length > 0) return items
    return portal()
  } catch {
    return portal()
  }
}

export async function fetchQuotation(id: string): Promise<QuotationDetail> {
  const { accountId, zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return fetchPortalQuotation(accountId, id)
  try {
    const data = await crmFetch<{ quotation: QuotationDetail }>(`quotations/${id}`)
    return data.quotation
  } catch {
    return fetchPortalQuotation(accountId, id)
  }
}

export async function acceptQuotation(id: string): Promise<{ id: string; stage: string }> {
  const data = await crmFetch<{ quotation: { id: string; stage: string } }>(
    `quotations/${id}/accept`,
    { method: 'POST', body: '{}' },
  )
  return data.quotation
}

function mergePolicyLists(portal: PolicySummary[], zoho: PolicySummary[]): PolicySummary[] {
  const portalByZohoId = new Map(
    portal
      .filter((row) => row.zoho_policy_id)
      .map((row) => [row.zoho_policy_id as string, row]),
  )
  const usedPortalIds = new Set<string>()

  const merged = zoho.map((item) => {
    const portalRow = portalByZohoId.get(item.id) ?? portalByZohoId.get(item.zoho_policy_id ?? '')
    if (!portalRow) return item
    usedPortalIds.add(portalRow.id)
    return {
      ...item,
      id: portalRow.id,
      zoho_policy_id: item.zoho_policy_id ?? item.id,
      policy_number: portalRow.policy_number || item.policy_number,
      status: portalRow.status ?? item.status,
      premium: portalRow.premium ?? item.premium,
      inception_date: portalRow.inception_date ?? item.inception_date,
      renewal_date: portalRow.renewal_date ?? item.renewal_date,
      insurer: portalRow.insurer ?? item.insurer,
      product_line: portalRow.product_line ?? item.product_line,
    }
  })

  for (const row of portal) {
    if (!usedPortalIds.has(row.id)) merged.unshift(row)
  }
  return merged
}

export async function fetchPolicies(): Promise<PolicySummary[]> {
  const { accountId, zohoAccountId } = await getCrmContext()
  const portal = () => fetchPortalPolicies(accountId)
  if (!zohoAccountId) return portal()
  try {
    const [zohoData, portalItems] = await Promise.all([
      crmFetch<{ policies: PolicySummary[] }>('policies'),
      portal(),
    ])
    return mergePolicyLists(portalItems, zohoData.policies ?? [])
  } catch {
    return portal()
  }
}

export async function fetchPolicy(id: string): Promise<PolicyDetail> {
  const { accountId, zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return fetchPortalPolicy(accountId, id)

  const portalRow = await findPortalPolicy(accountId, id).catch(() => null)
  const zohoPolicyId =
    portalRow?.zoho_policy_id && /^\d{10,}$/.test(String(portalRow.zoho_policy_id))
      ? String(portalRow.zoho_policy_id)
      : id

  try {
    const data = await crmFetch<{ policy: PolicyDetail }>(`policies/${zohoPolicyId}`)
    const zohoPolicy = data.policy

    if (portalRow) {
      const portalItems = mapStoredCoveredItems(portalRow.covered_items)
      const enriched = await attachItemExtensions(
        accountId,
        await enrichCoveredItemsFromScheduleBundle(portalRow.policy_number, portalItems),
      )
      if (enriched.length >= (zohoPolicy.covered_items?.length ?? 0)) {
        return {
          ...zohoPolicy,
          id: portalRow.id,
          zoho_policy_id: portalRow.zoho_policy_id ?? zohoPolicy.zoho_policy_id,
          policy_number: portalRow.policy_number ?? zohoPolicy.policy_number,
          insurer_policy_number:
            portalRow.insurer_policy_number ?? zohoPolicy.insurer_policy_number,
          covered_items: enriched,
          section_extensions: sectionExtensionsForPolicy(portalRow, enriched),
        }
      }
      if ((zohoPolicy.covered_items?.length ?? 0) > 0) {
        return { ...zohoPolicy, id: portalRow.id, zoho_policy_id: portalRow.zoho_policy_id ?? undefined }
      }
    }

    if ((zohoPolicy.covered_items?.length ?? 0) > 0) return zohoPolicy
    return fetchPortalPolicy(accountId, id)
  } catch {
    return fetchPortalPolicy(accountId, id)
  }
}

export async function fetchClaims(): Promise<ClaimSummary[]> {
  const { accountId, zohoAccountId } = await getCrmContext()
  const portal = () => fetchPortalClaims(accountId)
  if (!zohoAccountId) return portal()
  try {
    const data = await crmFetch<{ claims: ClaimSummary[] }>('claims')
    const items = data.claims ?? []
    if (items.length > 0) return items
    return portal()
  } catch {
    return portal()
  }
}

export async function sendBrokerRequest(input: BrokerRequestInput) {
  const { accountId, zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return sendPortalBrokerRequest(accountId, input)
  try {
    return await crmFetch<{
      request: {
        id: string
        zoho_task_id: string | null
        status: string
        email_sent?: boolean
        notify_email?: string | null
      }
    }>('broker-request', { method: 'POST', body: JSON.stringify(input) })
  } catch {
    return sendPortalBrokerRequest(accountId, input)
  }
}

/** Append a risk item to a portal policy's covered_items schedule. */
export async function attachRiskItemToPolicy(opts: {
  policyId: string
  riskItem: {
    id: string
    name: string
    category: string
    unit_cost: number
    branch?: string | null
    description?: string | null
    is_rental?: boolean
    rental_company?: string | null
    rental_start_date?: string | null
    rental_end_date?: string | null
    item_extensions?: CoveredItem['selected_extensions']
  }
}): Promise<void> {
  const { accountId } = await getCrmContext()
  const { data: policy, error } = await supabase
    .from('portal_policies')
    .select('id, covered_items')
    .eq('id', opts.policyId)
    .eq('account_id', accountId)
    .maybeSingle()

  if (error) throw error
  if (!policy) throw new Error('Policy not found')

  const existing = mapStoredCoveredItems(policy.covered_items)
  if (existing.some((item) => item.risk_item_id === opts.riskItem.id)) return

  const rentalNote = opts.riskItem.is_rental
    ? `Rental: ${opts.riskItem.rental_company ?? '—'} (${opts.riskItem.rental_start_date ?? '?'} – ${opts.riskItem.rental_end_date ?? '?'})`
    : null

  const nextItem: CoveredItem = {
    risk_item_id: opts.riskItem.id,
    risk_item_name: opts.riskItem.name,
    section: opts.riskItem.category || 'Motor',
    sum_insured: opts.riskItem.unit_cost,
    premium_excl: null,
    premium_incl: null,
    cover_status: 'Pending Nimbis',
    description: [opts.riskItem.description, rentalNote].filter(Boolean).join(' · ') || null,
    branch: opts.riskItem.branch ?? null,
    date_added: new Date().toISOString().slice(0, 10),
    selected_extensions: opts.riskItem.item_extensions ?? [],
  }

  const { error: updateError } = await supabase
    .from('portal_policies')
    .update({
      covered_items: [...existing, nextItem],
      updated_at: new Date().toISOString(),
    })
    .eq('id', opts.policyId)
    .eq('account_id', accountId)

  if (updateError) throw updateError
}

export async function createClaim(input: CreateClaimInput) {
  const { accountId, zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return createPortalClaim(accountId, input)
  try {
    return await crmFetch<{ claim: { id: string; title: string; status: string; zoho_claim_id: string | null } }>(
      'claims',
      { method: 'POST', body: JSON.stringify(input) },
    )
  } catch {
    return createPortalClaim(accountId, input)
  }
}

export async function syncPortalFromZoho(): Promise<number> {
  const { zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return 0
  const data = await crmFetch<{ synced: number }>('sync', { method: 'POST', body: '{}' })
  return data.synced ?? 0
}

export async function fetchContacts(): Promise<ContactSummary[]> {
  const { zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return []
  const data = await crmFetch<{ contacts: ContactSummary[] }>('contacts')
  return data.contacts ?? []
}

export async function fetchZohoAccountSnapshot(): Promise<ZohoAccountSnapshot | null> {
  const { zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return null
  const data = await crmFetch<{ account: ZohoAccountSnapshot }>('account')
  return data.account ?? null
}

export async function refreshOrganizationProfileFromZoho(
  accountId: string,
): Promise<Organization | null> {
  const snapshot = await fetchZohoAccountSnapshot()
  if (!snapshot) return getOrganization(accountId)

  await updateOrganization(accountId, {
    name: snapshot.name,
    phone: snapshot.phone,
    website: snapshot.website,
    registration_number: snapshot.registration_number,
    vat_number: snapshot.vat_number,
    industry: snapshot.industry,
  })

  return getOrganization(accountId)
}

export async function refreshOrganizationFromZoho(accountId: string): Promise<Organization | null> {
  const { zohoAccountId } = await getCrmContext()
  if (!zohoAccountId) return getOrganization(accountId)

  const data = await crmFetch<{ account: ZohoAccountSnapshot; synced: number }>('sync', {
    method: 'POST',
    body: '{}',
  })

  const account = data.account
  if (account) {
    await updateOrganization(accountId, {
      name: account.name,
      phone: account.phone,
      website: account.website,
      registration_number: account.registration_number,
      vat_number: account.vat_number,
      industry: account.industry,
    })
  }

  return getOrganization(accountId)
}

export async function uploadClaimAttachment(
  accountId: string,
  file: File,
): Promise<{ name: string; url: string; type: string }> {
  const ext = file.name.split('.').pop()?.toLowerCase() || 'bin'
  const path = `${accountId}/${crypto.randomUUID()}.${ext}`

  const { error } = await supabase.storage.from('claim-attachments').upload(path, file, {
    upsert: false,
    contentType: file.type,
  })
  if (error) throw error

  const { data } = supabase.storage.from('claim-attachments').getPublicUrl(path)
  return { name: file.name, url: data.publicUrl, type: file.type }
}
