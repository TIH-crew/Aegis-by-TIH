import { createClient } from 'jsr:@supabase/supabase-js@2'
import {
  lookupId,
  lookupName,
  fetchZohoAccount,
  findZohoUserIdByEmail,
  sendBrokerNotifyEmail,
  zohoCoql,
  zohoGetAttachments,
  zohoGetRecord,
  zohoInsert,
  zohoUpdate,
  zohoSearchRelated,
} from './zoho.ts'
import { syncPortalFromZoho } from './sync-portal.ts'
import { mapZohoAccountSnapshot, refreshPortalAccountFromZoho } from './zoho-account.ts'
import {
  mintWidgetSession,
  resolveWidgetSession,
  revokeWidgetSession,
} from './widget-auth.ts'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers':
    'authorization, x-client-info, apikey, content-type, x-aegis-secret, x-aegis-widget-session',
  'Access-Control-Allow-Methods': 'GET, POST, PATCH, OPTIONS',
}

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}

function getServiceClient() {
  const url = Deno.env.get('SUPABASE_URL')
  const key = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
  if (!url || !key) throw new Error('Supabase not configured')
  return createClient(url, key, { auth: { autoRefreshToken: false, persistSession: false } })
}

type RequestContext = {
  user: { id: string; email?: string | null }
  accountId: string
  portalRole: string
  zohoAccountId: string
  orgName: string | null
  kind: 'portal' | 'widget'
  scopes?: string[]
}

async function getPortalJwtContext(req: Request): Promise<RequestContext> {
  const authHeader = req.headers.get('Authorization')
  if (!authHeader?.startsWith('Bearer ')) throw new Error('Unauthorized')

  const url = Deno.env.get('SUPABASE_URL')!
  const anonKey = Deno.env.get('SUPABASE_ANON_KEY')!
  const userClient = createClient(url, anonKey, {
    global: { headers: { Authorization: authHeader } },
  })

  const {
    data: { user },
    error,
  } = await userClient.auth.getUser()
  if (error || !user) throw new Error('Unauthorized')

  const admin = getServiceClient()
  const { data, error: puError } = await admin
    .from('portal_users')
    .select('account_id, role')
    .eq('user_id', user.id)
    .maybeSingle()

  if (puError || !data?.account_id) throw new Error('No portal account')

  const { data: org, error: orgError } = await admin
    .from('portal_accounts')
    .select('id, name, zoho_account_id')
    .eq('id', data.account_id)
    .maybeSingle()

  if (orgError || !org) throw new Error('No portal account')
  if (!org.zoho_account_id) throw new Error('Organization is not linked to Zoho CRM')

  // Never trust a browser-supplied Zoho Account ID — resolve only from portal membership.
  return {
    kind: 'portal',
    user: { id: user.id, email: user.email },
    accountId: data.account_id as string,
    portalRole: (data.role as string) ?? 'member',
    zohoAccountId: org.zoho_account_id,
    orgName: org.name,
  }
}

/** Portal JWT or short-lived widget session (X-Aegis-Widget-Session). */
async function getRequestContext(req: Request): Promise<RequestContext> {
  const widgetToken = req.headers.get('x-aegis-widget-session')
  if (widgetToken) {
    const session = await resolveWidgetSession(widgetToken)
    return {
      kind: 'widget',
      user: session.user,
      accountId: session.accountId,
      portalRole: session.portalRole,
      zohoAccountId: session.zohoAccountId,
      orgName: session.orgName,
      scopes: session.scopes,
    }
  }
  return getPortalJwtContext(req)
}

async function sha256Hex(value: string): Promise<string> {
  const data = new TextEncoder().encode(value)
  const hash = await crypto.subtle.digest('SHA-256', data)
  return [...new Uint8Array(hash)].map((b) => b.toString(16).padStart(2, '0')).join('')
}

async function sendActivationMagicLink(email: string, redirectTo: string) {
  const url = Deno.env.get('SUPABASE_URL')
  const key = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
  if (!url || !key) throw new Error('Supabase credentials missing')
  const res = await fetch(`${url}/auth/v1/otp`, {
    method: 'POST',
    headers: {
      apikey: key,
      Authorization: `Bearer ${key}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      email: email.toLowerCase().trim(),
      create_user: true,
      options: { email_redirect_to: redirectTo },
    }),
  })
  if (!res.ok) {
    const data = await res.json().catch(() => ({}))
    throw new Error(data.msg ?? data.error_description ?? 'Failed to send activation email')
  }
}

function canManageWorkforce(role: string) {
  return role === 'owner' || role === 'admin' || role === 'hr_admin'
}

function canBrokerWorkforce(role: string) {
  return role === 'owner' || role === 'admin' || role === 'broker'
}

/** Widget actors are Zoho users, not auth.users — never write fake UUIDs into FK columns. */
function actorUserId(ctx: RequestContext): string | null {
  return ctx.kind === 'portal' ? ctx.user.id : null
}

function actorLabel(ctx: RequestContext): string | null {
  return ctx.user.email ?? (ctx.kind === 'widget' ? ctx.user.id : null)
}

async function searchAccountRelatedLists(
  zohoAccountId: string,
  relatedLists: string[],
): Promise<Record<string, unknown>[]> {
  for (const relatedList of relatedLists) {
    const rows = await zohoSearchRelated('Accounts', zohoAccountId, relatedList)
    if (rows.length > 0) return rows
  }
  return []
}

async function listQuotations(zohoAccountId: string, orgName?: string | null) {
  try {
    let rows: Record<string, unknown>[] = []

    const safeName = (orgName ?? '').replace(/'/g, "''").trim()
    // Prefer linked Account; many commercial quotes leave Account_Name blank and only name the deal.
    const nameToken = safeName.split(/\s+/)[0] // e.g. "Medipost"
    const coqlQueries = [
      `select id, Deal_Name, Stage, Quote_Number, Closing_Date, Created_Time, Owner from Deals where Account_Name.id = '${zohoAccountId}' order by Created_Time desc`,
      `select id, Deal_Name, Stage, Quote_Number, Closing_Date, Created_Time, Owner from Deals where Contact_Name.Account_Name.id = '${zohoAccountId}' order by Created_Time desc`,
      ...(nameToken
        ? [
            `select id, Deal_Name, Stage, Quote_Number, Closing_Date, Created_Time, Owner from Deals where Deal_Name like '%${nameToken}%' order by Created_Time desc`,
          ]
        : []),
    ]

    for (const query of coqlQueries) {
      try {
        rows = await zohoCoql(query)
        if (rows.length > 0) break
      } catch (err) {
        console.warn('Quotations COQL attempt failed:', err)
      }
    }

    if (rows.length === 0) {
      rows = await searchAccountRelatedLists(zohoAccountId, ['Deals', 'Quotations'])
    }

    return rows.map((r) => {
      const created = r.Created_Time ? String(r.Created_Time).slice(0, 10) : null
      const closing = r.Closing_Date ? String(r.Closing_Date).slice(0, 10) : null
      let eta = closing
      if (!eta && created) {
        const d = new Date(created)
        d.setDate(d.getDate() + 14)
        eta = d.toISOString().slice(0, 10)
      }
      return {
        id: String(r.id),
        name: String(r.Deal_Name ?? r.Name ?? 'Quotation'),
        stage: String(r.Stage ?? '—'),
        quote_number: r.Quote_Number != null ? String(r.Quote_Number) : null,
        broker_name: lookupName(r.Owner) ?? 'The Insurance Hub',
        eta_date: eta,
        created_time: created,
      }
    })
  } catch (err) {
    console.error('listQuotations failed:', err)
    return []
  }
}

async function getQuotationDetail(dealId: string) {
  const deal = await zohoGetRecord(
    'Deals',
    dealId,
    'Deal_Name,Stage,Quote_Number,Closing_Date,Created_Time,Owner,Amount',
  )
  let riskItems: Record<string, unknown>[] = []
  try {
    riskItems = await zohoCoql(
      `select id, Name, Item_Type, Risk_Type, Risk_Category, Risk_Status, Stage, Quote_Risk_Items from Quote_Items where Linked_Quotations.id = '${dealId}'`,
    )
  } catch {
    riskItems = []
  }

  const created = deal.Created_Time ? String(deal.Created_Time).slice(0, 10) : null
  const closing = deal.Closing_Date ? String(deal.Closing_Date).slice(0, 10) : null
  let eta = closing
  if (!eta && created) {
    const d = new Date(created)
    d.setDate(d.getDate() + 14)
    eta = d.toISOString().slice(0, 10)
  }

  return {
    id: dealId,
    name: String(deal.Deal_Name ?? 'Quotation'),
    stage: String(deal.Stage ?? '—'),
    quote_number: deal.Quote_Number != null ? String(deal.Quote_Number) : null,
    broker_name: lookupName(deal.Owner) ?? 'The Insurance Hub',
    eta_date: eta,
    created_time: created,
    amount: deal.Amount != null ? Number(deal.Amount) : null,
    risk_items: riskItems.map((item) => ({
      id: String(item.id),
      name: String(item.Name ?? lookupName(item.Quote_Risk_Items) ?? 'Risk item'),
      item_type: item.Item_Type ? String(item.Item_Type) : null,
      risk_type: item.Risk_Type ? String(item.Risk_Type) : null,
      risk_category: item.Risk_Category ? String(item.Risk_Category) : null,
      risk_status: item.Risk_Status ? String(item.Risk_Status) : null,
      stage: item.Stage ? String(item.Stage) : null,
      zoho_risk_id: lookupId(item.Quote_Risk_Items),
      zoho_risk_name: lookupName(item.Quote_Risk_Items),
    })),
  }
}

async function acceptQuotation(dealId: string) {
  await zohoUpdate('Deals', [
    {
      id: dealId,
      Stage: 'Closed Won',
    },
  ])
  return { id: dealId, stage: 'Closed Won' }
}

async function listPolicies(zohoAccountId: string) {
  let rows: Record<string, unknown>[] = []

  try {
    try {
      rows = await zohoCoql(
        `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line, Product_Name from Policies where Policy_Holder1.id = '${zohoAccountId}' order by Created_Time desc`,
      )
    } catch {
      rows = await zohoCoql(
        `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line from Policies where Policy_Holder1.id = '${zohoAccountId}' order by Created_Time desc`,
      )
    }
  } catch (err) {
    console.warn('Policies COQL failed, using related list:', err)
    rows = await searchAccountRelatedLists(zohoAccountId, ['Policies'])
  }

  return rows.map((r) => ({
    id: String(r.id),
    policy_number: String(r.Name ?? 'Policy'),
    status: r.Policy_Status ? String(r.Policy_Status) : null,
    premium: r.Policy_Premium != null ? Number(r.Policy_Premium) : null,
    inception_date: r.Inception_Date ?? null,
    renewal_date: r.Renewal_Date ?? null,
    insurer: lookupName(r.Insurer),
    product_line: r.Product_Line ? String(r.Product_Line) : null,
    product_name: r.Product_Name ? String(r.Product_Name) : null,
  }))
}

function zohoCreatedId(result: Record<string, unknown>): string | null {
  const details = result.details as { id?: string } | undefined
  if (details?.id != null) return String(details.id)
  if (result.id != null) return String(result.id)
  return null
}

function escapeCoql(value: string) {
  return value.replace(/\\/g, '\\\\').replace(/'/g, "\\'")
}

async function listContacts(zohoAccountId: string) {
  try {
    let rows: Record<string, unknown>[] = []

    const coqlQueries = [
      `select id, Full_Name, Email, Phone, Title, Occupation from Contacts where Account_Name.id = '${zohoAccountId}' order by Created_Time desc`,
      `select id, Full_Name, Email, Phone, Title, Occupation from Contacts where Account_Name = '${zohoAccountId}' order by Created_Time desc`,
      `select id, Full_Name, Email, Phone, Title from Contacts where Account_Name.id = '${zohoAccountId}' order by Created_Time desc`,
    ]

    for (const query of coqlQueries) {
      try {
        rows = await zohoCoql(query)
        if (rows.length > 0) break
      } catch (err) {
        console.warn('Contacts COQL attempt failed:', err)
      }
    }

    if (rows.length === 0) {
      rows = await searchAccountRelatedLists(zohoAccountId, ['Contacts'])
    }

    return rows.map((r) => ({
      id: String(r.id),
      name: String(r.Full_Name ?? r.Last_Name ?? r.First_Name ?? 'Contact'),
      email: r.Email ? String(r.Email) : null,
      phone: r.Phone ? String(r.Phone) : null,
      title: r.Title ? String(r.Title) : null,
      occupation: r.Occupation ? String(r.Occupation) : null,
    }))
  } catch (err) {
    console.error('listContacts failed:', err)
    return []
  }
}

const CLIENT_RISK_SELECT =
  'id, Name, Risk_Type, Risk_Status, Risk_Category, Item_Type, Tag, Total_Sum_Insured, Total_Contents_Value, Accidental_damage_sum_insured, Item_Value, Description, Currently_Insured'

async function listClientRisks(zohoAccountId: string) {
  try {
    let rows: Record<string, unknown>[] = []
    try {
      rows = await zohoCoql(
        `select ${CLIENT_RISK_SELECT} from Client_Risks where Item_Owned_By.id = '${zohoAccountId}' order by Created_Time desc`,
      )
    } catch (err) {
      console.warn('Client_Risks COQL failed, using related list:', err)
      rows = await searchAccountRelatedLists(zohoAccountId, ['Client_Risks', 'Risks'])
    }

    return rows.map((r) => {
      const sumInsured = r.Total_Sum_Insured != null ? Number(r.Total_Sum_Insured) : null
      const itemValue = r.Item_Value != null ? Number(r.Item_Value) : null
      const contents = r.Total_Contents_Value != null ? Number(r.Total_Contents_Value) : null
      return {
        id: String(r.id),
        name: String(r.Name ?? 'Risk'),
        risk_type: r.Risk_Type ? String(r.Risk_Type) : null,
        risk_status: r.Risk_Status ? String(r.Risk_Status) : null,
        risk_category: r.Risk_Category ? String(r.Risk_Category) : null,
        item_type: r.Item_Type ? String(r.Item_Type) : null,
        tag: r.Tag ? String(r.Tag) : null,
        total_sum_insured: Number.isFinite(sumInsured as number) ? sumInsured : null,
        item_value: Number.isFinite(itemValue as number) ? itemValue : null,
        contents_value: Number.isFinite(contents as number) ? contents : null,
        description: r.Description ? String(r.Description) : null,
        currently_insured: r.Currently_Insured != null ? Boolean(r.Currently_Insured) : null,
      }
    })
  } catch (err) {
    console.error('listClientRisks failed:', err)
    return []
  }
}

async function listContactPolicies(contactId: string) {
  const safeId = escapeCoql(contactId)
  let rows: Record<string, unknown>[] = []
  const queries = [
    `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line, Product_Name from Policies where Policy_Holder.id = '${safeId}' order by Created_Time desc`,
    `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line, Product_Name from Policies where Primary_Contact.id = '${safeId}' order by Created_Time desc`,
    `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line from Policies where Policy_Holder.id = '${safeId}' order by Created_Time desc`,
    `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line from Policies where Primary_Contact.id = '${safeId}' order by Created_Time desc`,
  ]

  const seen = new Set<string>()
  for (const query of queries) {
    try {
      const batch = await zohoCoql(query)
      for (const r of batch) {
        const id = String(r.id ?? '')
        if (!id || seen.has(id)) continue
        seen.add(id)
        rows.push(r)
      }
    } catch (err) {
      console.warn('Contact policies COQL attempt failed:', err)
    }
  }

  return rows.map((r) => ({
    id: String(r.id),
    policy_number: String(r.Name ?? 'Policy'),
    status: r.Policy_Status ? String(r.Policy_Status) : null,
    premium: r.Policy_Premium != null ? Number(r.Policy_Premium) : null,
    inception_date: r.Inception_Date ?? null,
    renewal_date: r.Renewal_Date ?? null,
    product_line: r.Product_Line ? String(r.Product_Line) : null,
    product_name: r.Product_Name ? String(r.Product_Name) : null,
  }))
}

async function getPortfolioBundle(zohoAccountId: string) {
  const dataAvailability: {
    account: boolean
    policies: boolean
    risks: boolean
    contacts: boolean
    quotations: boolean
    contact_policies: boolean
    partialFailure: string | null
  } = {
    account: true,
    policies: true,
    risks: true,
    contacts: true,
    quotations: true,
    contact_policies: true,
    partialFailure: null,
  }

  const failures: string[] = []

  const settled = await Promise.allSettled([
    fetchZohoAccount(zohoAccountId),
    listClientRisks(zohoAccountId),
    listPolicies(zohoAccountId),
    listContacts(zohoAccountId),
    listQuotations(zohoAccountId),
  ])

  const accountRaw =
    settled[0].status === 'fulfilled' ? settled[0].value : null
  if (settled[0].status === 'rejected') {
    dataAvailability.account = false
    failures.push('Account fetch failed')
    throw settled[0].reason instanceof Error
      ? settled[0].reason
      : new Error('Failed to load Zoho Account for portfolio')
  }

  const risks = settled[1].status === 'fulfilled' ? settled[1].value : []
  if (settled[1].status === 'rejected') {
    dataAvailability.risks = false
    failures.push('Client_Risks unavailable')
  }

  const policies = settled[2].status === 'fulfilled' ? settled[2].value : []
  if (settled[2].status === 'rejected') {
    dataAvailability.policies = false
    failures.push('Policies unavailable')
  }

  const contacts = settled[3].status === 'fulfilled' ? settled[3].value : []
  if (settled[3].status === 'rejected') {
    dataAvailability.contacts = false
    failures.push('Contacts unavailable')
  }

  const quotations = settled[4].status === 'fulfilled' ? settled[4].value : []
  if (settled[4].status === 'rejected') {
    dataAvailability.quotations = false
    failures.push('Quotations/Deals unavailable')
  }

  const keyContacts = contacts.filter((c) => {
    const occ = (c.occupation ?? '').toLowerCase()
    const title = (c.title ?? '').toLowerCase()
    return (
      occ === 'director' ||
      /director|owner|ceo|managing/.test(title)
    )
  })

  const contactPolicies: Record<string, Awaited<ReturnType<typeof listContactPolicies>>> = {}
  try {
    await Promise.all(
      keyContacts.slice(0, 25).map(async (c) => {
        contactPolicies[c.id] = await listContactPolicies(c.id)
      }),
    )
  } catch (err) {
    dataAvailability.contact_policies = false
    failures.push('Contact-linked policies partially unavailable')
    console.warn('contact policies aggregation failed:', err)
  }

  if (failures.length) {
    dataAvailability.partialFailure =
      failures.join('; ') +
      ' — failed sources are not empty results.'
  }

  return {
    account: mapZohoAccountSnapshot(accountRaw!),
    risks,
    policies,
    contacts,
    quotations,
    contact_policies: contactPolicies,
    data_availability: dataAvailability,
  }
}

async function searchLeadsByIdentity(email: string, phone: string) {
  const rows: Record<string, unknown>[] = []
  const seen = new Set<string>()

  const pushRows = (batch: Record<string, unknown>[]) => {
    for (const r of batch) {
      const id = String(r.id ?? '')
      if (!id || seen.has(id)) continue
      seen.add(id)
      rows.push(r)
    }
  }

  if (email) {
    try {
      pushRows(
        await zohoCoql(
          `select id, Full_Name, First_Name, Last_Name, Email, Phone, Company, Lead_Status from Leads where Email = '${escapeCoql(email)}' limit 20`,
        ),
      )
    } catch (err) {
      console.warn('Leads email COQL failed:', err)
    }
  }

  if (phone) {
    const digits = phone.replace(/\D/g, '').slice(-9)
    if (digits.length >= 7) {
      try {
        pushRows(
          await zohoCoql(
            `select id, Full_Name, First_Name, Last_Name, Email, Phone, Company, Lead_Status from Leads where Phone like '%${escapeCoql(digits)}%' limit 20`,
          ),
        )
      } catch (err) {
        console.warn('Leads phone COQL failed:', err)
      }
    }
  }

  return rows.map((r) => ({
    id: String(r.id),
    name: String(r.Full_Name ?? r.Last_Name ?? r.First_Name ?? 'Lead'),
    email: r.Email ? String(r.Email) : null,
    phone: r.Phone ? String(r.Phone) : null,
    company: r.Company ? String(r.Company) : null,
    status: r.Lead_Status ? String(r.Lead_Status) : null,
  }))
}

async function getAccountSnapshot(zohoAccountId: string) {
  const record = await fetchZohoAccount(zohoAccountId)
  return mapZohoAccountSnapshot(record)
}

async function getPolicyDetail(policyId: string) {
  const policy = await zohoGetRecord(
    'Policies',
    policyId,
    'Name,Policy_Status,Policy_Premium,Inception_Date,Renewal_Date,Insurer,Product_Line,Covered_Items',
  )

  const coveredRaw = (policy.Covered_Items as Record<string, unknown>[]) ?? []
  const covered_items = coveredRaw.map((row) => ({
    risk_item_id: lookupId(row.Risk_Item),
    risk_item_name: lookupName(row.Risk_Item),
    section: row.Section ? String(row.Section) : null,
    sum_insured: row.Sum_Insured != null ? Number(row.Sum_Insured) : null,
    premium_excl: row.Premium_Excl != null ? Number(row.Premium_Excl) : null,
    premium_incl: row.Premium_Incl != null ? Number(row.Premium_Incl) : null,
    cover_status: row.Cover_Status ? String(row.Cover_Status) : null,
    description: row.Description ? String(row.Description) : null,
  }))

  const attachments = await zohoGetAttachments('Policies', policyId)

  return {
    id: policyId,
    policy_number: String(policy.Name ?? 'Policy'),
    status: policy.Policy_Status ? String(policy.Policy_Status) : null,
    premium: policy.Policy_Premium != null ? Number(policy.Policy_Premium) : null,
    inception_date: policy.Inception_Date ?? null,
    renewal_date: policy.Renewal_Date ?? null,
    insurer: lookupName(policy.Insurer),
    product_line: policy.Product_Line ? String(policy.Product_Line) : null,
    covered_items,
    attachments: attachments.map((a) => ({
      id: String(a.id),
      file_name: String(a.File_Name ?? a.file_name ?? 'Attachment'),
      size: a.Size ?? a.size ?? null,
      created_time: a.Created_Time ?? null,
    })),
  }
}

async function listClaims(zohoAccountId: string) {
  try {
    let rows: Record<string, unknown>[] = []
    try {
      rows = await zohoCoql(
        `select id, Name, Claim_Status, Client_Name, Company, Created_Time, Modified_Time from Claims where Company.id = '${zohoAccountId}' order by Created_Time desc`,
      )
    } catch {
      rows = await zohoCoql(
        `select id, Name, Claim_Status, Client_Name, Created_Time from Claims where Client_Name.Policy_Holder1.id = '${zohoAccountId}' order by Created_Time desc`,
      )
    }
    return rows.map((r) => ({
      id: String(r.id),
      name: String(r.Name ?? 'Claim'),
      status: r.Claim_Status ? String(r.Claim_Status) : null,
      policy_id: lookupId(r.Client_Name),
      policy_name: lookupName(r.Client_Name),
      created_time: r.Created_Time ?? null,
      modified_time: r.Modified_Time ?? null,
      company_name: lookupName(r.Company),
    }))
  } catch {
    return []
  }
}

async function getClaimDetail(zohoClaimId: string) {
  const claim = await zohoGetRecord(
    'Claims',
    zohoClaimId,
    'Name,Claim_Status,Client_Name,Company,Claim_Address,Owner,Created_Time,Modified_Time,Email,Policy_Contact',
  )

  const [attachments, tasks, notes] = await Promise.all([
    zohoGetAttachments('Claims', zohoClaimId),
    zohoSearchRelated('Claims', zohoClaimId, 'Tasks'),
    zohoSearchRelated('Claims', zohoClaimId, 'Notes'),
  ])

  return {
    id: zohoClaimId,
    name: String(claim.Name ?? 'Claim'),
    status: claim.Claim_Status ? String(claim.Claim_Status) : null,
    policy_id: lookupId(claim.Client_Name),
    policy_name: lookupName(claim.Client_Name),
    company_name: lookupName(claim.Company),
    owner_name: lookupName(claim.Owner),
    claim_address: claim.Claim_Address ? String(claim.Claim_Address) : null,
    email: claim.Email ? String(claim.Email) : null,
    policy_contact: lookupName(claim.Policy_Contact),
    created_time: claim.Created_Time ? String(claim.Created_Time) : null,
    modified_time: claim.Modified_Time ? String(claim.Modified_Time) : null,
    attachments: attachments.map((a) => ({
      id: String(a.id),
      file_name: String(a.File_Name ?? a.file_name ?? 'Attachment'),
      size: a.Size ?? a.size ?? null,
      created_time: a.Created_Time ?? null,
    })),
    tasks: tasks.map((t) => ({
      id: String(t.id),
      title: String(t.Subject ?? 'Task'),
      status: t.Status ? String(t.Status) : null,
      due_date: t.Due_Date ? String(t.Due_Date) : null,
      priority: t.Priority ? String(t.Priority) : null,
    })),
    notes: notes.map((n) => ({
      id: String(n.id),
      title: n.Note_Title ? String(n.Note_Title) : null,
      content: n.Note_Content ? String(n.Note_Content) : null,
      created_time: n.Created_Time ? String(n.Created_Time) : null,
    })),
  }
}

async function createBrokerRequest(
  ctx: { user: { id: string }; accountId: string; orgName?: string },
  body: Record<string, unknown>,
) {
  const contextType = String(body.context_type ?? '')
  const contextZohoId = String(body.context_zoho_id ?? '')
  const contextLabel = String(body.context_label ?? '')
  const message = String(body.message ?? '').trim()
  const riskItemId = body.risk_item_id ? String(body.risk_item_id) : null
  const draftItem = body.draft_item ?? null
  const taskSubjectOverride = body.task_subject ? String(body.task_subject).trim() : ''
  const notifyEmail = body.notify_email
    ? String(body.notify_email).trim()
    : body.nimbis_add || body.request_type === 'remove_items'
      ? 'jananda@theinsurancehub.co.za'
      : ''
  const nimbisAdd = Boolean(body.nimbis_add)
  const requestTypeRaw = body.request_type ? String(body.request_type) : ''
  const isRemoveRequest = requestTypeRaw === 'remove_items'

  if (!contextType || !contextZohoId) {
    throw new Error('context_type and context_zoho_id are required')
  }
  if (!['quotation', 'policy'].includes(contextType)) {
    throw new Error('Invalid context_type')
  }

  const admin = getServiceClient()
  let riskSummary = ''
  let riskDetailLines: string[] = []
  if (!isRemoveRequest && riskItemId) {
    const { data: risk } = await admin
      .from('portal_risk_items')
      .select(
        'name, category, unit_cost, asset_tag, serial_number, branch, is_rental, rental_company, rental_start_date, rental_end_date, zoho_risk_id, zoho_fields',
      )
      .eq('id', riskItemId)
      .eq('account_id', ctx.accountId)
      .maybeSingle()
    if (risk) {
      riskSummary = `Existing risk item: ${risk.name} (${risk.category}) — ref ${risk.zoho_risk_id ?? risk.asset_tag ?? '—'}`
      const zohoFields = (risk.zoho_fields as Record<string, unknown>) ?? {}
      const reg =
        zohoFields.Registration_Number != null ? String(zohoFields.Registration_Number) : null
      riskDetailLines = [
        `Asset tag: ${risk.asset_tag ?? '—'}`,
        `Sum insured / unit cost: R ${Number(risk.unit_cost ?? 0).toLocaleString('en-ZA')}`,
        risk.serial_number ? `VIN / serial: ${risk.serial_number}` : '',
        reg ? `Registration: ${reg}` : '',
        risk.branch ? `Branch: ${risk.branch}` : '',
        risk.is_rental
          ? `Rental vehicle: Yes — ${risk.rental_company ?? '—'} (${risk.rental_start_date ?? '?'} to ${risk.rental_end_date ?? '?'})`
          : risk.category === 'Motor'
            ? 'Rental vehicle: No'
            : '',
      ].filter(Boolean)
    }
  } else if (!isRemoveRequest && draftItem && typeof draftItem === 'object') {
    const d = draftItem as Record<string, unknown>
    riskSummary = `New item request: ${d.name ?? 'Unnamed'} (${d.category ?? '—'})`
  }

  const nimbisInstruction = isRemoveRequest
    ? [
        'ACTION REQUIRED: Remove the listed item(s) from the policy schedule / Nimbis.',
        notifyEmail ? `Notify / action owner: ${notifyEmail}` : '',
      ]
        .filter(Boolean)
        .join('\n')
    : nimbisAdd
      ? [
          'ACTION REQUIRED: Add this item to the policy on Nimbis.',
          notifyEmail ? `Notify / action owner: ${notifyEmail}` : '',
        ]
          .filter(Boolean)
          .join('\n')
      : ''

  const description = [
    'Client request from ASSETS portal',
    ctx.orgName ? `Organisation: ${ctx.orgName}` : '',
    contextLabel ? `Context: ${contextLabel}` : '',
    riskSummary,
    ...riskDetailLines,
    nimbisInstruction,
    message ? (isRemoveRequest ? message : `Note: ${message}`) : '',
  ]
    .filter(Boolean)
    .join('\n')

  const zohoModule = contextType === 'quotation' ? 'Deals' : 'Policies'
  const subject =
    taskSubjectOverride ||
    (isRemoveRequest
      ? `ASSETS: Remove items from policy${contextLabel ? ` — ${contextLabel}` : ''}`
      : nimbisAdd
        ? `ASSETS: Add item to Nimbis${contextLabel ? ` — ${contextLabel}` : ''}`
        : `ASSETS: Add risk item${contextLabel ? ` — ${contextLabel}` : ''}`)

  const taskPayload: Record<string, unknown> = {
    Subject: subject,
    Description: description,
    Status: 'Not Started',
    Priority: 'High',
    What_Id: contextZohoId,
    $se_module: zohoModule,
    Due_Date: new Date().toISOString().slice(0, 10),
  }

  if (notifyEmail) {
    const ownerId = await findZohoUserIdByEmail(notifyEmail)
    if (ownerId) {
      taskPayload.Owner = { id: ownerId }
    }
  }

  const taskResult = await zohoInsert('Tasks', [taskPayload])

  const zohoTaskId =
    taskResult.details?.id != null
      ? String(taskResult.details.id)
      : taskResult.id != null
        ? String(taskResult.id)
        : null

  // Activity note on the policy/deal so it appears in the record timeline.
  if (zohoTaskId && contextType === 'policy') {
    try {
      await zohoInsert('Notes', [
        {
          Note_Title: subject.slice(0, 100),
          Note_Content: description,
          Parent_Id: contextZohoId,
          $se_module: 'Policies',
        },
      ])
    } catch (err) {
      console.warn('aegis-crm: failed to create policy note', err)
    }
  }

  let emailSent = false
  let emailMeta: Record<string, unknown> = {}
  if (notifyEmail) {
    const emailResult = await sendBrokerNotifyEmail({
      to: notifyEmail,
      subject,
      text: [
        description,
        '',
        `Portal account: ${ctx.accountId}`,
        zohoTaskId ? `Zoho Task ID: ${zohoTaskId}` : '',
      ]
        .filter(Boolean)
        .join('\n'),
    })
    emailSent = emailResult.sent
    emailMeta = emailResult
    if (!emailResult.sent) {
      console.warn('aegis-crm: broker email not sent', emailResult)
    }
  }

  const { data: requestRow, error } = await admin
    .from('portal_broker_requests')
    .insert({
      account_id: ctx.accountId,
      request_type: isRemoveRequest
        ? 'remove_items'
        : nimbisAdd
          ? 'nimbis_add_item'
          : 'add_item',
      context_type: contextType,
      context_zoho_id: contextZohoId,
      context_label: contextLabel || null,
      risk_item_id: riskItemId,
      draft_item: draftItem,
      message: [
        message,
        notifyEmail ? `Notify: ${notifyEmail}` : '',
        emailSent ? 'Email: sent' : notifyEmail ? `Email: not sent (${emailMeta.error ?? 'n/a'})` : '',
      ]
        .filter(Boolean)
        .join('\n') || null,
      zoho_task_id: zohoTaskId,
      status: zohoTaskId ? 'sent' : 'failed',
      created_by: actorUserId(ctx),
    })
    .select('id, zoho_task_id, status, created_at')
    .single()

  if (error) throw error
  return { ...requestRow, email_sent: emailSent, notify_email: notifyEmail || null }
}

async function createClaim(
  ctx: { user: { id: string }; accountId: string },
  body: Record<string, unknown>,
) {
  const title = String(body.title ?? '').trim() || 'New claim'
  const description = String(body.description ?? '').trim()
  const riskItemId = body.risk_item_id ? String(body.risk_item_id) : null
  const zohoPolicyId = body.zoho_policy_id ? String(body.zoho_policy_id) : null

  if (!riskItemId) throw new Error('risk_item_id is required')
  if (!zohoPolicyId) throw new Error('zoho_policy_id is required')

  const admin = getServiceClient()
  const { data: risk } = await admin
    .from('portal_risk_items')
    .select('name, category, zoho_risk_id')
    .eq('id', riskItemId)
    .eq('account_id', ctx.accountId)
    .maybeSingle()

  if (!risk) throw new Error('Risk item not found')

  const claimPayload: Record<string, unknown> = {
    Name: title,
    Claim_Status: 'Submitted',
    Client_Name: zohoPolicyId,
    Claim_Address: [
      description,
      `Risk item: ${risk.name} (${risk.category})`,
      risk.zoho_risk_id ? `Zoho risk: ${risk.zoho_risk_id}` : '',
    ]
      .filter(Boolean)
      .join('\n'),
  }

  const zohoResult = await zohoInsert('Claims', [claimPayload])
  const zohoClaimId =
    zohoResult.details?.id != null
      ? String(zohoResult.details.id)
      : zohoResult.id != null
        ? String(zohoResult.id)
        : null

  const attachments = Array.isArray(body.attachments) ? body.attachments : []

  const { data: claimRow, error } = await admin
    .from('portal_claims')
    .insert({
      account_id: ctx.accountId,
      risk_item_id: riskItemId,
      title,
      status: 'Submitted',
      description,
      zoho_claim_id: zohoClaimId,
      zoho_policy_id: zohoPolicyId,
      attachments,
    })
    .select('id, title, status, zoho_claim_id, created_at')
    .single()

  if (error) throw error
  return claimRow
}

function routePath(url: URL): string[] {
  const parts = url.pathname.split('/').filter(Boolean)
  const idx = parts.indexOf('aegis-crm')
  return idx >= 0 ? parts.slice(idx + 1) : parts
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })

  try {
    const segments = routePath(new URL(req.url))
    const resource = segments[0] ?? ''
    const id = segments[1]
    const action = segments[2]

    // --- Widget session mint / revoke (Zoho Account + user re-verified server-side; no shared secret) ---
    if (req.method === 'POST' && resource === 'workforce' && id === 'widget-session') {
      const body = await req.json()
      if (body.action === 'revoke') {
        const token = String(body.session_token ?? req.headers.get('x-aegis-widget-session') ?? '')
        if (!token) return json({ ok: false, error: 'session_token required' }, 400)
        await revokeWidgetSession(token)
        return json({ ok: true, revoked: true })
      }
      const session = await mintWidgetSession({
        zohoAccountId: String(body.zoho_account_id ?? ''),
        zohoUserEmail: String(body.zoho_user_email ?? ''),
        zohoUserId: body.zoho_user_id ? String(body.zoho_user_id) : null,
      })
      return json({
        ok: true,
        ...session,
        trust: {
          account_verified_via: 'zoho_api',
          user_verified_via: 'zoho_users_api',
          authorisation: 'portal_membership_or_broker_domain',
        },
      })
    }

    // --- Employee activation (public token; not claim QR) ---
    if (req.method === 'POST' && resource === 'workforce' && id === 'activation') {
      const body = await req.json()
      const plainToken = String(body.token ?? '').trim()
      if (!plainToken) return json({ ok: false, error: 'token required' }, 400)
      const tokenHash = await sha256Hex(plainToken)
      const admin = getServiceClient()
      const { data: invite } = await admin
        .from('portal_employee_invites')
        .select('*, portal_employees(id, full_name, status)')
        .eq('token_hash', tokenHash)
        .maybeSingle()
      if (!invite) return json({ ok: false, error: 'Invalid invitation' }, 404)
      if (invite.status === 'revoked') return json({ ok: false, error: 'Invitation revoked' }, 410)
      if (invite.status === 'accepted') return json({ ok: false, error: 'Invitation already accepted' }, 409)
      if (new Date(invite.expires_at).getTime() < Date.now()) {
        await admin.from('portal_employee_invites').update({ status: 'expired' }).eq('id', invite.id)
        return json({ ok: false, error: 'Invitation expired' }, 410)
      }

      if (body.action === 'validate') {
        return json({
          ok: true,
          email: invite.email,
          employee_name: (invite as { portal_employees?: { full_name?: string } }).portal_employees
            ?.full_name,
          expires_at: invite.expires_at,
        })
      }

      if (body.action === 'send_magic_link') {
        const appUrl = Deno.env.get('AEGIS_APP_URL') ?? 'http://localhost:1420'
        const redirectTo = `${appUrl.replace(/\/$/, '')}/activate-employee?token=${encodeURIComponent(plainToken)}`
        await sendActivationMagicLink(invite.email, redirectTo)
        await sendBrokerNotifyEmail({
          to: invite.email,
          subject: 'Activate your AEGIS employee account',
          text: `You have been invited to activate your AEGIS account.\n\nOpen: ${redirectTo}\n\nThis link expires at ${invite.expires_at}.`,
        }).catch(() => ({ sent: false }))
        return json({ ok: true, email: invite.email, magic_link_sent: true })
      }

      if (body.action === 'accept') {
        const authHeader = req.headers.get('Authorization')
        if (!authHeader?.startsWith('Bearer ')) {
          return json({ ok: false, error: 'Sign in required to accept invitation' }, 401)
        }
        const url = Deno.env.get('SUPABASE_URL')!
        const anonKey = Deno.env.get('SUPABASE_ANON_KEY')!
        const userClient = createClient(url, anonKey, {
          global: { headers: { Authorization: authHeader } },
        })
        const {
          data: { user },
        } = await userClient.auth.getUser()
        if (!user) return json({ ok: false, error: 'Sign in required' }, 401)
        if (user.email && user.email.toLowerCase() !== String(invite.email).toLowerCase()) {
          return json({ ok: false, error: 'Signed-in email does not match invitation' }, 403)
        }

        await admin
          .from('portal_employee_invites')
          .update({ status: 'accepted', accepted_at: new Date().toISOString() })
          .eq('id', invite.id)
        await admin
          .from('portal_employees')
          .update({
            invitation_status: 'accepted',
            activated_at: new Date().toISOString(),
            user_id: user.id,
            updated_at: new Date().toISOString(),
          })
          .eq('id', invite.employee_id)
          .eq('account_id', invite.account_id)
        await admin.from('portal_workforce_audit_events').insert({
          account_id: invite.account_id,
          employee_id: invite.employee_id,
          event_type: 'employee_activated',
          summary: 'Employee accepted activation invitation',
          actor_user_id: user.id,
        })
        return json({ ok: true, employee_id: invite.employee_id, activated: true })
      }

      return json({ ok: false, error: 'Unknown activation action' }, 400)
    }

    const ctx = await getRequestContext(req)

    if (req.method === 'GET' && resource === 'quotations' && !id) {
      const items = await listQuotations(ctx.zohoAccountId, ctx.orgName)
      return json({ ok: true, quotations: items })
    }

    if (req.method === 'GET' && resource === 'quotations' && id) {
      const detail = await getQuotationDetail(id)
      return json({ ok: true, quotation: detail })
    }

    if (req.method === 'POST' && resource === 'quotations' && id && segments[2] === 'accept') {
      const row = await acceptQuotation(id)
      return json({ ok: true, quotation: row })
    }

    if (req.method === 'GET' && resource === 'policies' && !id) {
      const items = await listPolicies(ctx.zohoAccountId)
      return json({ ok: true, policies: items })
    }

    if (req.method === 'GET' && resource === 'policies' && id) {
      const detail = await getPolicyDetail(id)
      return json({ ok: true, policy: detail })
    }

    if (req.method === 'GET' && resource === 'claims' && !id) {
      const items = await listClaims(ctx.zohoAccountId)
      return json({ ok: true, claims: items })
    }

    if (req.method === 'GET' && resource === 'claims' && id) {
      const detail = await getClaimDetail(id)
      return json({ ok: true, claim: detail })
    }

    if (req.method === 'GET' && resource === 'contacts') {
      const items = await listContacts(ctx.zohoAccountId)
      return json({ ok: true, contacts: items })
    }

    if (req.method === 'GET' && resource === 'client-risks') {
      const items = await listClientRisks(ctx.zohoAccountId)
      return json({ ok: true, risks: items })
    }

    if (req.method === 'GET' && resource === 'portfolio') {
      const portfolio = await getPortfolioBundle(ctx.zohoAccountId)
      return json({ ok: true, portfolio })
    }

    // Workforce API for Zoho Account widget / broker tools (Supabase remains employee SoT)
    if (req.method === 'GET' && resource === 'workforce' && id === 'overview') {
      const admin = getServiceClient()
      const { count: total } = await admin
        .from('portal_employees')
        .select('*', { count: 'exact', head: true })
        .eq('account_id', ctx.accountId)
      const { count: active } = await admin
        .from('portal_employees')
        .select('*', { count: 'exact', head: true })
        .eq('account_id', ctx.accountId)
        .eq('status', 'active')
      const { count: exceptions } = await admin
        .from('portal_workforce_exceptions')
        .select('*', { count: 'exact', head: true })
        .eq('account_id', ctx.accountId)
        .eq('status', 'open')
      return json({
        ok: true,
        overview: {
          account_id: ctx.accountId,
          zoho_account_id: ctx.zohoAccountId,
          total_employees: total ?? 0,
          active_employees: active ?? 0,
          open_exceptions: exceptions ?? 0,
        },
      })
    }

    if (req.method === 'GET' && resource === 'workforce' && id === 'exceptions') {
      const admin = getServiceClient()
      const { data, error } = await admin
        .from('portal_workforce_exceptions')
        .select(
          'id, exception_type, severity, status, title, employee_id, import_batch_id, created_at, assigned_to, resolution_notes',
        )
        .eq('account_id', ctx.accountId)
        .order('created_at', { ascending: false })
        .limit(100)
      if (error) throw error
      return json({ ok: true, exceptions: data ?? [] })
    }

    if (req.method === 'GET' && resource === 'workforce' && id === 'employees' && action) {
      // GET /workforce/employees/:employeeId
      const admin = getServiceClient()
      const { data, error } = await admin
        .from('portal_employees')
        .select(
          'id, full_name, first_name, last_name, email, phone, whatsapp_number, employee_number, department, job_title, status, invitation_status, employment_start_date, employment_end_date, deactivated_at, deactivation_reason, zoho_contact_id, zoho_contact_link_status, zoho_contact_linked_at, zoho_lead_id, zoho_lead_link_status, zoho_lead_linked_at, created_at, updated_at',
        )
        .eq('account_id', ctx.accountId)
        .eq('id', action)
        .maybeSingle()
      if (error) throw error
      if (!data) return json({ ok: false, error: 'Employee not found' }, 404)

      const [{ data: memberships }, { data: crmLinks }, { data: audit }] = await Promise.all([
        admin
          .from('portal_employee_benefit_memberships')
          .select(
            'id, benefit_type, enrolment_status, provider_confirmation_status, provider_name, membership_number, employment_verified, aegis_activation_status, notes, updated_at',
          )
          .eq('account_id', ctx.accountId)
          .eq('employee_id', action)
          .order('benefit_type'),
        admin
          .from('portal_employee_crm_links')
          .select(
            'id, zoho_contact_id, zoho_lead_id, crm_module, link_status, link_method, linked_at, sync_meta',
          )
          .eq('account_id', ctx.accountId)
          .eq('employee_id', action)
          .order('linked_at', { ascending: false }),
        admin
          .from('portal_workforce_audit_events')
          .select('id, event_type, summary, actor_label, created_at')
          .eq('account_id', ctx.accountId)
          .eq('employee_id', action)
          .order('created_at', { ascending: false })
          .limit(20),
      ])

      // Sensitive benefit balances / claims are never returned here
      return json({
        ok: true,
        employee: data,
        memberships: memberships ?? [],
        crm_links: crmLinks ?? [],
        recent_audit: audit ?? [],
      })
    }

    if (req.method === 'GET' && resource === 'workforce' && (!id || id === 'employees')) {
      const admin = getServiceClient()
      const url = new URL(req.url)
      const q = (url.searchParams.get('q') ?? '').trim()
      const status = (url.searchParams.get('status') ?? '').trim()
      const limit = Math.min(Number(url.searchParams.get('limit') ?? 50), 200)
      const offset = Math.max(Number(url.searchParams.get('offset') ?? 0), 0)
      let query = admin
        .from('portal_employees')
        .select(
          'id, full_name, first_name, last_name, email, phone, employee_number, department, job_title, status, invitation_status, zoho_contact_id, zoho_contact_link_status, zoho_lead_id, zoho_lead_link_status, created_at',
        )
        .eq('account_id', ctx.accountId)
        .order('full_name')
        .range(offset, offset + limit - 1)
      if (status === 'active' || status === 'inactive') {
        query = query.eq('status', status)
      }
      if (q) {
        query = query.or(
          `full_name.ilike.%${q}%,email.ilike.%${q}%,employee_number.ilike.%${q}%`,
        )
      }
      const { data, error } = await query
      if (error) throw error
      return json({ ok: true, employees: data ?? [], offset, limit })
    }

    if (req.method === 'POST' && resource === 'workforce' && (id === 'employees' || !id)) {
      if (!canManageWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden: HR role required' }, 403)
      }
      const body = await req.json()
      const fullName = String(body.full_name ?? '').trim()
      if (!fullName) return json({ ok: false, error: 'full_name required' }, 400)
      const empNo = body.employee_number ? String(body.employee_number).trim() : null
      const email = body.email ? String(body.email).trim().toLowerCase() : null
      if (!empNo && !email) {
        return json({ ok: false, error: 'employee_number or email required' }, 400)
      }

      const admin = getServiceClient()
      if (empNo) {
        const { data: dup } = await admin
          .from('portal_employees')
          .select('id, full_name')
          .eq('account_id', ctx.accountId)
          .ilike('employee_number', empNo)
          .maybeSingle()
        if (dup) {
          await admin.from('portal_workforce_exceptions').insert({
            account_id: ctx.accountId,
            exception_type: 'suspected_duplicate',
            severity: 'high',
            status: 'open',
            employee_id: dup.id,
            title: `Duplicate employee number ${empNo}`,
            details: { attempted: body, existing_id: dup.id },
            created_by: actorUserId(ctx),
          })
          return json({ ok: false, error: `Duplicate employee number matches ${dup.full_name}` }, 409)
        }
      }

      const { data: employee, error } = await admin
        .from('portal_employees')
        .insert({
          account_id: ctx.accountId,
          full_name: fullName,
          first_name: body.first_name ?? null,
          last_name: body.last_name ?? null,
          email,
          phone: body.phone ?? null,
          whatsapp_number: body.whatsapp_number ?? '',
          employee_number: empNo,
          department: body.department ?? null,
          job_title: body.job_title ?? null,
          employment_start_date: body.employment_start_date ?? null,
          status: 'active',
          invitation_status: 'not_invited',
          zoho_contact_link_status: 'none',
        })
        .select('*')
        .single()
      if (error) throw error

      await admin.from('portal_workforce_audit_events').insert({
        account_id: ctx.accountId,
        employee_id: employee.id,
        event_type: 'employee_created',
        summary: `Employee created via workforce API: ${fullName}`,
        detail: { source: 'aegis-crm', zoho_contact_created: false },
        actor_user_id: actorUserId(ctx),
      })

      return json({ ok: true, employee, zoho_contact_created: false })
    }

    // PATCH /workforce/employees/:id — broker/HR edit (no sensitive benefit fields)
    if (req.method === 'PATCH' && resource === 'workforce' && id === 'employees' && action) {
      if (!canManageWorkforce(ctx.portalRole) && !canBrokerWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden' }, 403)
      }
      const body = await req.json()
      const patch: Record<string, unknown> = { updated_at: new Date().toISOString() }
      const allowed = [
        'full_name',
        'first_name',
        'last_name',
        'email',
        'phone',
        'whatsapp_number',
        'employee_number',
        'department',
        'job_title',
        'employment_start_date',
        'employment_end_date',
      ] as const
      for (const key of allowed) {
        if (body[key] !== undefined) patch[key] = body[key]
      }
      // Never accept pension/medical payloads
      delete (patch as { pension_balance?: unknown }).pension_balance
      delete (patch as { medical_claims?: unknown }).medical_claims

      const admin = getServiceClient()
      const { data: employee, error } = await admin
        .from('portal_employees')
        .update(patch)
        .eq('id', action)
        .eq('account_id', ctx.accountId)
        .select(
          'id, full_name, first_name, last_name, email, phone, employee_number, department, job_title, status, invitation_status, zoho_contact_id, zoho_contact_link_status',
        )
        .maybeSingle()
      if (error) throw error
      if (!employee) return json({ ok: false, error: 'Employee not found' }, 404)
      await admin.from('portal_workforce_audit_events').insert({
        account_id: ctx.accountId,
        employee_id: action,
        event_type: 'employee_updated',
        summary: 'Employee updated via workforce API',
        detail: { fields: Object.keys(patch) },
        actor_user_id: actorUserId(ctx),
        actor_label: ctx.user.email ?? null,
      })
      return json({ ok: true, employee })
    }

    // POST /workforce/employees/:id/deactivate
    if (
      req.method === 'POST' &&
      resource === 'workforce' &&
      id === 'employees' &&
      action &&
      segments[3] === 'deactivate'
    ) {
      if (!canManageWorkforce(ctx.portalRole) && !canBrokerWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden' }, 403)
      }
      const body = await req.json().catch(() => ({}))
      const reason = String((body as { reason?: string }).reason ?? 'Employment ended')
      const endDate = new Date().toISOString().slice(0, 10)
      const admin = getServiceClient()
      const { data: employee, error } = await admin
        .from('portal_employees')
        .update({
          status: 'inactive',
          employment_end_date: endDate,
          deactivated_at: new Date().toISOString(),
          deactivation_reason: reason,
          invitation_status: 'revoked',
          updated_at: new Date().toISOString(),
        })
        .eq('id', action)
        .eq('account_id', ctx.accountId)
        .select('id, full_name, status, employment_end_date, zoho_contact_id, zoho_contact_link_status')
        .maybeSingle()
      if (error) throw error
      if (!employee) return json({ ok: false, error: 'Employee not found' }, 404)
      await admin
        .from('portal_employee_invites')
        .update({ status: 'revoked' })
        .eq('employee_id', action)
        .eq('status', 'pending')
      await admin.from('portal_workforce_audit_events').insert({
        account_id: ctx.accountId,
        employee_id: action,
        event_type: 'employee_deactivated',
        summary: `Employment ended: ${reason}`,
        detail: { zoho_contact_preserved: Boolean(employee.zoho_contact_id) },
        actor_user_id: actorUserId(ctx),
        actor_label: ctx.user.email ?? null,
      })
      return json({ ok: true, employee })
    }

    if (req.method === 'POST' && resource === 'workforce' && id === 'contact-search') {
      if (!canBrokerWorkforce(ctx.portalRole) && !canManageWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden' }, 403)
      }
      const body = await req.json()
      const email = String(body.email ?? '').trim()
      const phone = String(body.phone ?? '').trim()
      const contacts = await listContacts(ctx.zohoAccountId)
      const matches = contacts.filter((c) => {
        const emailHit = email && c.email && c.email.toLowerCase() === email.toLowerCase()
        const phoneHit =
          phone &&
          c.phone &&
          c.phone.replace(/\D/g, '').endsWith(phone.replace(/\D/g, '').slice(-9))
        return Boolean(emailHit || phoneHit)
      })
      return json({ ok: true, matches, searched: { email: email || null, phone: phone || null } })
    }

    if (req.method === 'POST' && resource === 'workforce' && id === 'contact-promote') {
      if (!canBrokerWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden: broker role required' }, 403)
      }
      const body = await req.json()
      const employeeId = String(body.employee_id ?? '')
      const existingContactId = body.zoho_contact_id ? String(body.zoho_contact_id) : null
      const idempotencyKey = String(body.idempotency_key ?? `promote-${employeeId}`)
      if (!employeeId) return json({ ok: false, error: 'employee_id required' }, 400)

      const admin = getServiceClient()
      const { data: prior } = await admin
        .from('portal_employee_crm_links')
        .select('*')
        .eq('account_id', ctx.accountId)
        .eq('idempotency_key', idempotencyKey)
        .maybeSingle()
      if (prior) {
        return json({ ok: true, duplicated: true, zoho_contact_id: prior.zoho_contact_id, link: prior })
      }

      const { data: employee, error: empErr } = await admin
        .from('portal_employees')
        .select('*')
        .eq('id', employeeId)
        .eq('account_id', ctx.accountId)
        .maybeSingle()
      if (empErr) throw empErr
      if (!employee) return json({ ok: false, error: 'Employee not found' }, 404)
      if (employee.zoho_contact_id) {
        return json({
          ok: true,
          duplicated: true,
          zoho_contact_id: employee.zoho_contact_id,
          message: 'Employee already linked',
        })
      }

      let contactId = existingContactId
      if (!contactId) {
        const nameParts = String(employee.full_name ?? '').trim().split(/\s+/)
        const first = employee.first_name || nameParts[0] || 'Unknown'
        const last = employee.last_name || nameParts.slice(1).join(' ') || first
        // Only standard Contacts fields — do not invent custom AEGIS API names
        const payload: Record<string, unknown> = {
          First_Name: first,
          Last_Name: last,
          Email: employee.email || undefined,
          Phone: employee.phone || employee.whatsapp_number || undefined,
          Account_Name: { id: ctx.zohoAccountId },
        }
        let result: Record<string, unknown>
        try {
          result = await zohoInsert('Contacts', [payload])
        } catch (err) {
          await admin
            .from('portal_employees')
            .update({
              zoho_contact_link_status: 'failed',
              updated_at: new Date().toISOString(),
            })
            .eq('id', employeeId)
          await admin.from('portal_workforce_audit_events').insert({
            account_id: ctx.accountId,
            employee_id: employeeId,
            event_type: 'crm_contact_promote_failed',
            summary: 'Zoho Contact create failed — employee retained in Supabase',
            detail: { error: err instanceof Error ? err.message : String(err) },
            actor_user_id: actorUserId(ctx),
          })
          return json({ ok: false, error: 'Zoho Contact create failed', employee_retained: true }, 502)
        }
        contactId = zohoCreatedId(result)
        if (!contactId) {
          await admin
            .from('portal_employees')
            .update({ zoho_contact_link_status: 'failed', updated_at: new Date().toISOString() })
            .eq('id', employeeId)
          return json({ ok: false, error: 'Zoho Contact create failed', result, employee_retained: true }, 502)
        }
      }

      const { data: link, error: linkErr } = await admin
        .from('portal_employee_crm_links')
        .insert({
          account_id: ctx.accountId,
          employee_id: employeeId,
          zoho_contact_id: contactId,
          crm_module: 'Contacts',
          link_status: 'linked',
          link_method: 'broker_promote',
          idempotency_key: idempotencyKey,
          linked_by: actorUserId(ctx),
        })
        .select('*')
        .single()
      if (linkErr) throw linkErr

      await admin
        .from('portal_employees')
        .update({
          zoho_contact_id: contactId,
          zoho_contact_link_status: 'linked',
          zoho_contact_linked_at: new Date().toISOString(),
          zoho_contact_linked_by: actorUserId(ctx),
          updated_at: new Date().toISOString(),
        })
        .eq('id', employeeId)

      await admin.from('portal_workforce_audit_events').insert({
        account_id: ctx.accountId,
        employee_id: employeeId,
        event_type: 'crm_contact_promoted',
        summary: `Broker promoted employee to Zoho Contact ${contactId}`,
        detail: { zoho_contact_id: contactId, idempotency_key: idempotencyKey },
        actor_user_id: actorUserId(ctx),
        actor_label: actorLabel(ctx),
      })

      return json({ ok: true, duplicated: false, zoho_contact_id: contactId, link })
    }

    if (req.method === 'POST' && resource === 'workforce' && id === 'lead-search') {
      if (!canBrokerWorkforce(ctx.portalRole) && !canManageWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden' }, 403)
      }
      const body = await req.json()
      const email = String(body.email ?? '').trim()
      const phone = String(body.phone ?? '').trim()
      if (!email && !phone) {
        return json({ ok: false, error: 'email or phone required' }, 400)
      }
      const matches = await searchLeadsByIdentity(email, phone)
      return json({ ok: true, matches, searched: { email: email || null, phone: phone || null } })
    }

    if (req.method === 'POST' && resource === 'workforce' && id === 'lead-promote') {
      if (!canBrokerWorkforce(ctx.portalRole)) {
        return json({ ok: false, error: 'Forbidden: broker role required' }, 403)
      }
      const body = await req.json()
      const employeeId = String(body.employee_id ?? '')
      const existingLeadId = body.zoho_lead_id ? String(body.zoho_lead_id) : null
      const idempotencyKey = String(body.idempotency_key ?? `lead-promote-${employeeId}`)
      if (!employeeId) return json({ ok: false, error: 'employee_id required' }, 400)

      const admin = getServiceClient()
      const { data: prior } = await admin
        .from('portal_employee_crm_links')
        .select('*')
        .eq('account_id', ctx.accountId)
        .eq('idempotency_key', idempotencyKey)
        .maybeSingle()
      if (prior) {
        return json({
          ok: true,
          duplicated: true,
          zoho_lead_id: prior.zoho_lead_id,
          link: prior,
        })
      }

      const { data: employee, error: empErr } = await admin
        .from('portal_employees')
        .select('*')
        .eq('id', employeeId)
        .eq('account_id', ctx.accountId)
        .maybeSingle()
      if (empErr) throw empErr
      if (!employee) return json({ ok: false, error: 'Employee not found' }, 404)
      if (employee.zoho_lead_id) {
        return json({
          ok: true,
          duplicated: true,
          zoho_lead_id: employee.zoho_lead_id,
          message: 'Employee already linked to a Lead',
        })
      }

      let leadId = existingLeadId
      if (!leadId) {
        const nameParts = String(employee.full_name ?? '').trim().split(/\s+/)
        const first = employee.first_name || nameParts[0] || 'Unknown'
        const last = employee.last_name || nameParts.slice(1).join(' ') || first
        // Standard Leads fields only — no invented custom AEGIS API names
        const payload: Record<string, unknown> = {
          First_Name: first,
          Last_Name: last,
          Email: employee.email || undefined,
          Phone: employee.phone || employee.whatsapp_number || undefined,
          Company: ctx.orgName || undefined,
          Lead_Source: 'AEGIS Workforce',
        }
        let result: Record<string, unknown>
        try {
          result = await zohoInsert('Leads', [payload])
        } catch (err) {
          await admin
            .from('portal_employees')
            .update({
              zoho_lead_link_status: 'failed',
              updated_at: new Date().toISOString(),
            })
            .eq('id', employeeId)
          await admin.from('portal_workforce_audit_events').insert({
            account_id: ctx.accountId,
            employee_id: employeeId,
            event_type: 'crm_lead_promote_failed',
            summary: 'Zoho Lead create failed — employee retained in Supabase',
            detail: { error: err instanceof Error ? err.message : String(err) },
            actor_user_id: actorUserId(ctx),
          })
          return json({ ok: false, error: 'Zoho Lead create failed', employee_retained: true }, 502)
        }
        leadId = zohoCreatedId(result)
        if (!leadId) {
          await admin
            .from('portal_employees')
            .update({ zoho_lead_link_status: 'failed', updated_at: new Date().toISOString() })
            .eq('id', employeeId)
          return json({ ok: false, error: 'Zoho Lead create failed', result, employee_retained: true }, 502)
        }
      }

      const { data: link, error: linkErr } = await admin
        .from('portal_employee_crm_links')
        .insert({
          account_id: ctx.accountId,
          employee_id: employeeId,
          zoho_lead_id: leadId,
          crm_module: 'Leads',
          link_status: 'linked',
          link_method: 'broker_promote',
          idempotency_key: idempotencyKey,
          linked_by: actorUserId(ctx),
          sync_meta: { module: 'Leads' },
        })
        .select('*')
        .single()
      if (linkErr) throw linkErr

      await admin
        .from('portal_employees')
        .update({
          zoho_lead_id: leadId,
          zoho_lead_link_status: 'linked',
          zoho_lead_linked_at: new Date().toISOString(),
          zoho_lead_linked_by: actorUserId(ctx),
          updated_at: new Date().toISOString(),
        })
        .eq('id', employeeId)

      await admin.from('portal_workforce_audit_events').insert({
        account_id: ctx.accountId,
        employee_id: employeeId,
        event_type: 'crm_lead_promoted',
        summary: `Broker promoted employee to Zoho Lead ${leadId}`,
        detail: { zoho_lead_id: leadId, idempotency_key: idempotencyKey },
        actor_user_id: actorUserId(ctx),
        actor_label: actorLabel(ctx),
      })

      return json({ ok: true, duplicated: false, zoho_lead_id: leadId, link })
    }

    if (req.method === 'GET' && resource === 'account') {
      const account = await getAccountSnapshot(ctx.zohoAccountId)
      return json({ ok: true, account })
    }

    if (req.method === 'POST' && resource === 'broker-request') {
      const body = await req.json()
      const row = await createBrokerRequest(ctx, body)
      return json({ ok: true, request: row })
    }

    if (req.method === 'POST' && resource === 'claims') {
      const body = await req.json()
      const row = await createClaim(ctx, body)
      return json({ ok: true, claim: row })
    }

    if (req.method === 'POST' && resource === 'sync') {
      const admin = getServiceClient()
      const account = await refreshPortalAccountFromZoho(admin, ctx.accountId, ctx.zohoAccountId)
      const synced = await syncPortalFromZoho(admin, ctx.accountId, ctx.zohoAccountId)
      return json({ ok: true, synced, account })
    }

    return json({ ok: false, error: 'Not found' }, 404)
  } catch (err) {
    const message = err instanceof Error ? err.message : 'Internal server error'
    let status = 500
    if (
      message === 'Unauthorized' ||
      message === 'No portal account' ||
      message === 'Widget session expired' ||
      message === 'Widget session revoked'
    ) {
      status = 401
    } else if (message.includes('Not authorised') || message.includes('Forbidden')) {
      status = 403
    } else if (message.includes('verification failed') || message.includes('not found for email')) {
      status = 403
    }
    console.error('aegis-crm:', err)
    return json({ ok: false, error: message }, status)
  }
})
