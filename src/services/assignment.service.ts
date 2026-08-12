import { supabase } from '../lib/supabase'
import type { CustodyAction, ItemAssignment } from '../types/employee'

async function closeOpenActions(accountId: string, riskItemId: string, action: CustodyAction) {
  await supabase
    .from('portal_item_assignments')
    .update({ status: 'closed', closed_at: new Date().toISOString() })
    .eq('account_id', accountId)
    .eq('risk_item_id', riskItemId)
    .eq('action', action)
    .eq('status', 'open')
}

export async function recordCustody(input: {
  accountId: string
  riskItemIds: string[]
  employeeId: string | null
  action: CustodyAction
  notes?: string
  dueAt?: string | null
  keepAssignment?: boolean
}) {
  const {
    data: { user },
  } = await supabase.auth.getUser()

  for (const riskItemId of input.riskItemIds) {
    if (input.action === 'assign') {
      await closeOpenActions(input.accountId, riskItemId, 'assign')
    }
    if (input.action === 'check_out') {
      await closeOpenActions(input.accountId, riskItemId, 'check_out')
    }
    if (input.action === 'check_in') {
      await closeOpenActions(input.accountId, riskItemId, 'check_out')
    }

    const { error: insertError } = await supabase.from('portal_item_assignments').insert({
      account_id: input.accountId,
      risk_item_id: riskItemId,
      employee_id: input.employeeId,
      action: input.action,
      status: input.action === 'check_in' ? 'closed' : 'open',
      notes: input.notes?.trim() || null,
      due_at: input.dueAt || null,
      created_by: user?.id ?? null,
      closed_at: input.action === 'check_in' ? new Date().toISOString() : null,
    })
    if (insertError) throw insertError

    const employeeName = input.employeeId
      ? (
          await supabase
            .from('portal_employees')
            .select('full_name')
            .eq('id', input.employeeId)
            .maybeSingle()
        ).data?.full_name ?? null
      : null

    const patch: Record<string, unknown> = {
      updated_at: new Date().toISOString(),
    }

    if (input.action === 'assign') {
      patch.employee_id = input.employeeId
      patch.employee_name = employeeName
      patch.assignment_status = 'assigned'
    } else if (input.action === 'check_out') {
      patch.employee_id = input.employeeId
      patch.employee_name = employeeName
      patch.assignment_status = 'checked_out'
    } else {
      if (input.keepAssignment) {
        patch.assignment_status = 'assigned'
        if (input.employeeId) {
          patch.employee_id = input.employeeId
          patch.employee_name = employeeName
        }
      } else {
        patch.assignment_status = 'unassigned'
        patch.employee_id = null
        patch.employee_name = null
      }
    }

    const { error: updateError } = await supabase
      .from('portal_risk_items')
      .update(patch)
      .eq('id', riskItemId)
      .eq('account_id', input.accountId)
    if (updateError) throw updateError
  }
}

export async function listItemAssignments(
  accountId: string,
  riskItemId: string,
): Promise<ItemAssignment[]> {
  const { data, error } = await supabase
    .from('portal_item_assignments')
    .select('*, portal_employees(full_name), portal_risk_items(name)')
    .eq('account_id', accountId)
    .eq('risk_item_id', riskItemId)
    .order('created_at', { ascending: false })
    .limit(20)

  if (error) throw error
  return (data ?? []).map((row) => {
    const rec = row as ItemAssignment & {
      portal_employees?: { full_name: string } | null
      portal_risk_items?: { name: string } | null
    }
    return {
      ...rec,
      employee_name: rec.portal_employees?.full_name ?? null,
      item_name: rec.portal_risk_items?.name ?? null,
    }
  })
}

export async function listAssignmentsForEmployee(
  accountId: string,
  employeeId: string,
): Promise<ItemAssignment[]> {
  const { data, error } = await supabase
    .from('portal_item_assignments')
    .select('*, portal_employees(full_name), portal_risk_items(name)')
    .eq('account_id', accountId)
    .eq('employee_id', employeeId)
    .order('created_at', { ascending: false })
    .limit(50)

  if (error) throw error
  return (data ?? []).map((row) => {
    const rec = row as ItemAssignment & {
      portal_employees?: { full_name: string } | null
      portal_risk_items?: { name: string } | null
    }
    return {
      ...rec,
      employee_name: rec.portal_employees?.full_name ?? null,
      item_name: rec.portal_risk_items?.name ?? null,
    }
  })
}
