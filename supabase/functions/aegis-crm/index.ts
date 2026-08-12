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

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
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

async function getAccountContext(req: Request) {
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
    .select('account_id')
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

  return {
    user,
    accountId: data.account_id as string,
    zohoAccountId: org.zoho_account_id,
    orgName: org.name,
  }
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
    rows = await zohoCoql(
      `select id, Name, Policy_Status, Policy_Premium, Inception_Date, Renewal_Date, Product_Line from Policies where Policy_Holder1.id = '${zohoAccountId}' order by Created_Time desc`,
    )
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
  }))
}

async function listContacts(zohoAccountId: string) {
  try {
    let rows: Record<string, unknown>[] = []

    const coqlQueries = [
      `select id, Full_Name, Email, Phone, Title from Contacts where Account_Name.id = '${zohoAccountId}' order by Created_Time desc`,
      `select id, Full_Name, Email, Phone, Title from Contacts where Account_Name = '${zohoAccountId}' order by Created_Time desc`,
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
    }))
  } catch (err) {
    console.error('listContacts failed:', err)
    return []
  }
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
    'Client request from Aegis portal',
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
      ? `Aegis: Remove items from policy${contextLabel ? ` — ${contextLabel}` : ''}`
      : nimbisAdd
        ? `Aegis: Add item to Nimbis${contextLabel ? ` — ${contextLabel}` : ''}`
        : `Aegis: Add risk item${contextLabel ? ` — ${contextLabel}` : ''}`)

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
      created_by: ctx.user.id,
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
    const ctx = await getAccountContext(req)
    const segments = routePath(new URL(req.url))
    const resource = segments[0] ?? ''
    const id = segments[1]

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
    const status = message === 'Unauthorized' || message === 'No portal account' ? 401 : 500
    console.error('aegis-crm:', err)
    return json({ ok: false, error: message }, status)
  }
})
