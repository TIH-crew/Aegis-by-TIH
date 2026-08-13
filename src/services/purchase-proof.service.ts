import { supabase } from '../lib/supabase'
import { uploadClaimAttachment } from './crm.service'

/** Upload proof of purchase / invoice for a risk item (reuses claim-attachments bucket). */
export async function uploadPurchaseInvoice(
  accountId: string,
  file: File,
): Promise<{ name: string; url: string }> {
  const uploaded = await uploadClaimAttachment(accountId, file)
  return { name: uploaded.name, url: uploaded.url }
}

export function validateAssignmentPurchase(opts: {
  purchase_value: number | null | undefined
  purchase_invoice_url: string | null | undefined
  is_financed: boolean
  finance_house?: string | null
  finance_account_number?: string | null
  finance_amount?: number | null
}): string | null {
  if (opts.purchase_value == null || Number(opts.purchase_value) <= 0) {
    return 'Purchase value is required when assigning an item.'
  }
  if (!opts.purchase_invoice_url?.trim()) {
    return 'Upload proof of purchase / invoice before assigning.'
  }
  if (opts.is_financed) {
    if (!opts.finance_house?.trim()) return 'Select a finance house for financed items.'
    if (!opts.finance_account_number?.trim()) {
      return 'Enter the finance account / agreement number.'
    }
    if (opts.finance_amount == null || Number(opts.finance_amount) <= 0) {
      return 'Enter the outstanding finance amount.'
    }
  }
  return null
}

export async function patchRiskPurchaseFields(
  accountId: string,
  riskItemId: string,
  fields: {
    purchase_value?: number | null
    purchase_invoice_url?: string | null
    purchase_invoice_name?: string | null
    purchase_date?: string | null
    is_financed?: boolean
    finance_house?: string | null
    finance_account_number?: string | null
    finance_amount?: number | null
  },
) {
  const { error } = await supabase
    .from('portal_risk_items')
    .update({ ...fields, updated_at: new Date().toISOString() })
    .eq('id', riskItemId)
    .eq('account_id', accountId)
  if (error) throw error
}
