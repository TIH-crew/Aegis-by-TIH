import type { PolicySectionExtension, SelectedExtension } from './employee'

export interface QuotationSummary {
  id: string
  name: string
  stage: string
  quote_number: string | null
  /** Broker / deal owner display name */
  broker_name?: string | null
  /** ISO date — expected client response / closing */
  eta_date?: string | null
  created_time?: string | null
}

export interface QuotationRiskItem {
  id: string
  name: string
  item_type: string | null
  risk_type: string | null
  risk_category: string | null
  risk_status: string | null
  stage: string | null
  unit_cost?: number | null
  branch: string | null
  zoho_risk_id: string | null
  zoho_risk_name: string | null
}

export interface QuotationDetail extends QuotationSummary {
  risk_items: QuotationRiskItem[]
  amount?: number | null
}

export interface PolicySummary {
  id: string
  policy_number: string
  status: string | null
  premium: number | null
  inception_date: string | null
  renewal_date: string | null
  insurer: string | null
  product_line: string | null
  /** Zoho policy id — use for claims and broker requests when present */
  zoho_policy_id?: string
}

export interface CoveredItemExtension {
  id: string
  name: string
  sum_insured: number | null
  premium_excl: number | null
  premium_incl: number | null
  details?: Record<string, string>
}

export interface CoveredItemAttachment {
  id: string
  file_name: string
  url: string
  type?: string
}

export interface CoveredItem {
  risk_item_id: string | null
  risk_item_name: string | null
  section: string | null
  sum_insured: number | null
  premium_excl: number | null
  premium_incl: number | null
  cover_status: string | null
  description: string | null
  branch?: string | null
  /** When the item was added to the schedule (ISO date) */
  date_added?: string | null
  external_risk_id?: string | null
  tracking_id?: string | null
  extensions?: CoveredItemExtension[]
  selected_extensions?: SelectedExtension[]
  attachments?: CoveredItemAttachment[]
}

export interface PolicyAttachment {
  id: string
  file_name: string
  size: unknown
  created_time: unknown
}

export interface PolicyDetail extends PolicySummary {
  covered_items: CoveredItem[]
  attachments: PolicyAttachment[]
  insurer_policy_number?: string | null
  frequency?: string | null
  sasria_premium?: number | null
  fee_premium?: number | null
  section_extensions?: PolicySectionExtension[]
}

export interface ClaimSummary {
  id: string
  name: string
  status: string | null
  policy_id: string | null
  policy_name: string | null
  created_time: string | null
  /** Portal row id when known */
  portal_id?: string | null
  zoho_claim_id?: string | null
  claim_amount?: number | null
  schedule_item_name?: string | null
}

export interface ClaimDocument {
  id: string
  kind: 'invoice' | 'quote' | 'confirmation' | 'other' | string
  title: string
  status: string | null
  amount: number | null
  file_name: string | null
  file_url: string | null
  notes: string | null
  created_at: string | null
}

export interface ClaimActionItem {
  id: string
  title: string
  status: string | null
  due_date: string | null
  priority: string | null
  source: 'crm' | 'portal' | 'suggested'
}

export interface ClaimDetail extends ClaimSummary {
  description: string | null
  broker_message: string | null
  voice_note_url: string | null
  risk_item_id: string | null
  risk_item_name: string | null
  zoho_claim_id: string | null
  owner_name: string | null
  claim_address: string | null
  company_name: string | null
  modified_time: string | null
  attachments: { name: string; url: string; type?: string }[]
  documents: ClaimDocument[]
  next_actions: ClaimActionItem[]
  crm_notes: { id: string; title: string | null; content: string | null; created_time: string | null }[]
}

export interface BrokerRequestInput {
  context_type: 'quotation' | 'policy'
  context_zoho_id: string
  context_label?: string
  risk_item_id?: string
  draft_item?: { name: string; category: string; unit_cost?: number }
  message?: string
  /** Overrides default Zoho Task subject */
  task_subject?: string
  /** Broker email to notify (e.g. jananda@theinsurancehub.co.za) */
  notify_email?: string
  /** When true, task asks broker to add the item on Nimbis */
  nimbis_add?: boolean
  /** add_item | nimbis_add_item | remove_items */
  request_type?: 'add_item' | 'nimbis_add_item' | 'remove_items'
}

export interface CreateClaimInput {
  title: string
  description?: string
  risk_item_id?: string
  zoho_policy_id: string
  attachments?: { name: string; url: string; type?: string }[]
  broker_message?: string
  voice_note_url?: string
  schedule_item_key?: string
  schedule_item_name?: string
  claim_amount?: number
}

export interface ContactSummary {
  id: string
  name: string
  email: string | null
  phone: string | null
  title: string | null
}

export interface ZohoAccountSnapshot {
  id: string
  name: string
  phone: string | null
  website: string | null
  registration_number: string | null
  vat_number: string | null
  industry: string | null
  email: string | null
}
