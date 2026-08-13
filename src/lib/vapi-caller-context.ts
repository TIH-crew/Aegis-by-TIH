import type { ClaimVerifiedEmployee } from '../services/employee-claim.service'

/** Context sent to Vapi when an employee starts a claim-logging web call. */
export interface VapiCallerContext {
  employee: ClaimVerifiedEmployee
  claim?: {
    selected_item_id?: string | null
    selected_item_name?: string | null
    selected_item_category?: string | null
    latitude?: number | null
    longitude?: number | null
  }
}

export type VapiAssistantOverrides = {
  firstMessage?: string
  variableValues?: Record<string, string | number | boolean | null>
  metadata?: Record<string, unknown>
}

/**
 * Build assistant overrides so the existing Vapi assistant receives verified
 * staff identity via Liquid `{{ variable }}` placeholders + call metadata.
 *
 * Configure your assistant prompt to reference variables such as:
 * `{{ employee_name }}`, `{{ company_name }}`, `{{ branch_name }}`, etc.
 */
export function buildClaimAssistantOverrides(
  context: VapiCallerContext,
): VapiAssistantOverrides {
  const { employee, claim } = context
  const firstName = employee.first_name || employee.full_name.split(/\s+/)[0] || 'there'

  const variableValues: Record<string, string | number | boolean | null> = {
    name: employee.full_name,
    employee_name: employee.full_name,
    first_name: firstName,
    employee_id: employee.id,
    account_id: employee.account_id,
    company_name: employee.company_name,
    branch_name: employee.branch_name,
    branch_id: employee.branch_id,
    job_title: employee.job_title,
    employee_number: employee.employee_number,
    email: employee.email,
    phone: employee.phone ?? employee.whatsapp_number,
    whatsapp_number: employee.whatsapp_number,
    id_number: employee.id_number,
    verified_staff: true,
    call_purpose: 'employee_claim_logging',
    selected_item_id: claim?.selected_item_id ?? null,
    selected_item_name: claim?.selected_item_name ?? null,
    selected_item_category: claim?.selected_item_category ?? null,
    claim_latitude: claim?.latitude ?? null,
    claim_longitude: claim?.longitude ?? null,
  }

  return {
    firstMessage: `Hi ${firstName}, I can see you're a verified ${
      employee.company_name ? `${employee.company_name} ` : ''
    }staff member. I'm here to help you log your insurance claim — what happened?`,
    variableValues,
    metadata: {
      source: 'aegis_employee_claim',
      employeeId: employee.id,
      accountId: employee.account_id,
      companyName: employee.company_name,
      branchId: employee.branch_id,
      branchName: employee.branch_name,
      employeeNumber: employee.employee_number,
      verified: true,
      callPurpose: 'employee_claim_logging',
      selectedItemId: claim?.selected_item_id ?? null,
    },
  }
}
