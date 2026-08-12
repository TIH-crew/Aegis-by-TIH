import { supabase } from '../lib/supabase'

export type PolicyActivityEventType =
  | 'item_added'
  | 'item_removed'
  | 'item_adjusted'
  | 'premium_changed'
  | 'status_changed'
  | 'claim_lodged'
  | 'note'

export interface PolicyActivityRow {
  id: string
  account_id: string
  policy_id: string | null
  zoho_policy_id: string | null
  policy_number: string | null
  event_type: PolicyActivityEventType | string
  summary: string
  details: Record<string, unknown>
  actor_user_id: string | null
  actor_email: string | null
  actor_name: string | null
  created_at: string
}

export async function logPolicyActivity(input: {
  accountId: string
  policyId?: string | null
  zohoPolicyId?: string | null
  policyNumber?: string | null
  eventType: PolicyActivityEventType
  summary: string
  details?: Record<string, unknown>
  actorEmail?: string | null
  actorName?: string | null
}): Promise<void> {
  const {
    data: { user },
  } = await supabase.auth.getUser()

  const { error } = await supabase.from('portal_policy_activity').insert({
    account_id: input.accountId,
    policy_id: input.policyId ?? null,
    zoho_policy_id: input.zohoPolicyId ?? null,
    policy_number: input.policyNumber ?? null,
    event_type: input.eventType,
    summary: input.summary,
    details: input.details ?? {},
    actor_user_id: user?.id ?? null,
    actor_email: input.actorEmail ?? user?.email ?? null,
    actor_name: input.actorName ?? null,
  })
  if (error) {
    console.warn('Failed to log policy activity:', error.message)
  }
}

export async function listPolicyActivity(
  accountId: string,
  opts: { limit?: number; eventType?: string | null; policyId?: string | null } = {},
): Promise<PolicyActivityRow[]> {
  let query = supabase
    .from('portal_policy_activity')
    .select('*')
    .eq('account_id', accountId)
    .order('created_at', { ascending: false })
    .limit(opts.limit ?? 200)

  if (opts.eventType) query = query.eq('event_type', opts.eventType)
  if (opts.policyId) query = query.eq('policy_id', opts.policyId)

  const { data, error } = await query
  if (error) throw error
  return (data ?? []) as PolicyActivityRow[]
}

export function activityEventLabel(type: string): string {
  switch (type) {
    case 'item_added':
      return 'Item added'
    case 'item_removed':
      return 'Item removed'
    case 'item_adjusted':
      return 'Item adjusted'
    case 'premium_changed':
      return 'Premium changed'
    case 'status_changed':
      return 'Status changed'
    case 'claim_lodged':
      return 'Claim lodged'
    default:
      return 'Note'
  }
}
