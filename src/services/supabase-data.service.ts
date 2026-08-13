import { defaultInsuranceSection } from '../config/cover-extras'
import { supabase } from '../lib/supabase'
import { generateAssetTag } from '../lib/utils'
import type { DashboardStats, RiskItem } from '../types'
import type { DataService } from './data.service'
import { getBranches } from './branch.service'

function mapRow(row: RiskItem): RiskItem {
  return {
    ...row,
    unit_cost: Number(row.unit_cost),
    repair_cost: Number(row.repair_cost),
    latitude: row.latitude != null ? Number(row.latitude) : null,
    longitude: row.longitude != null ? Number(row.longitude) : null,
    zoho_fields: (row.zoho_fields as Record<string, unknown>) ?? {},
    zoho_risk_id: row.zoho_risk_id ?? null,
    item_extensions: row.item_extensions ?? [],
    employee_id: row.employee_id ?? null,
    employee_name: row.employee_name ?? null,
    assignment_status: row.assignment_status ?? 'unassigned',
    vehicle_verification: (row.vehicle_verification as Record<string, unknown>) ?? {},
    is_rental: Boolean(row.is_rental),
    rental_company: row.rental_company ?? null,
    rental_start_date: row.rental_start_date ?? null,
    rental_end_date: row.rental_end_date ?? null,
    purchase_value: row.purchase_value != null ? Number(row.purchase_value) : null,
    purchase_invoice_url: row.purchase_invoice_url ?? null,
    purchase_invoice_name: row.purchase_invoice_name ?? null,
    purchase_date: row.purchase_date ?? null,
    is_financed: Boolean(row.is_financed),
    finance_house: row.finance_house ?? null,
    finance_account_number: row.finance_account_number ?? null,
    finance_amount: row.finance_amount != null ? Number(row.finance_amount) : null,
  }
}

export function createSupabaseDataService(
  accountId: string,
  branchId?: string | null,
): DataService {
  async function resolveBranchMeta(targetBranchId: string | null | undefined) {
    if (!targetBranchId) return { branch: null, latitude: null, longitude: null }
    const branches = await getBranches(accountId)
    const branch = branches.find((b) => b.id === targetBranchId)
    if (!branch) return { branch: null, latitude: null, longitude: null }
    return {
      branch: branch.name,
      latitude: branch.latitude,
      longitude: branch.longitude,
    }
  }

  return {
    async getRiskItems() {
      const pageSize = 1000
      const rows: RiskItem[] = []
      for (let from = 0; ; from += pageSize) {
        let q = supabase
          .from('portal_risk_items')
          .select('*')
          .eq('account_id', accountId)
          .order('record_date', { ascending: false })
          .range(from, from + pageSize - 1)
        if (branchId) q = q.eq('branch_id', branchId)

        const { data, error } = await q
        if (error) throw error
        const batch = (data ?? []).map(mapRow)
        rows.push(...batch)
        if (batch.length < pageSize) break
      }
      return rows
    },

    async getRiskItem(id) {
      const { data, error } = await supabase
        .from('portal_risk_items')
        .select('*')
        .eq('id', id)
        .eq('account_id', accountId)
        .maybeSingle()

      if (error) throw error
      return data ? mapRow(data as RiskItem) : null
    },

    async createRiskItem(input) {
      const branchMeta = await resolveBranchMeta(input.branch_id)
      const payload = {
        account_id: accountId,
        asset_tag: generateAssetTag(input.name),
        name: input.name,
        category: input.category,
        insurance_section: defaultInsuranceSection(input.category),
        unit_cost: input.unit_cost,
        repair_cost: input.repair_cost ?? 0,
        record_date: input.record_date ?? new Date().toISOString().slice(0, 10),
        image_url: input.image_url ?? null,
        employee_name: input.employee_name ?? null,
        employee_id: input.employee_id ?? null,
        item_extensions: input.item_extensions ?? [],
        assignment_status: input.assignment_status ?? (input.employee_id ? 'assigned' : 'unassigned'),
        vehicle_verification: input.vehicle_verification ?? {},
        is_rental: input.is_rental ?? false,
        rental_company: input.is_rental ? (input.rental_company ?? null) : null,
        rental_start_date: input.is_rental ? (input.rental_start_date ?? null) : null,
        rental_end_date: input.is_rental ? (input.rental_end_date ?? null) : null,
        insurance_status: input.insurance_status ?? 'Uninsured',
        description: input.description ?? null,
        serial_number: input.serial_number ?? null,
        branch_id: input.branch_id ?? null,
        branch: branchMeta.branch,
        latitude: branchMeta.latitude,
        longitude: branchMeta.longitude,
        zoho_fields: input.zoho_fields ?? {},
        purchase_value: input.purchase_value ?? null,
        purchase_invoice_url: input.purchase_invoice_url ?? null,
        purchase_invoice_name: input.purchase_invoice_name ?? null,
        purchase_date: input.purchase_date ?? null,
        is_financed: input.is_financed ?? false,
        finance_house: input.is_financed ? (input.finance_house ?? null) : null,
        finance_account_number: input.is_financed ? (input.finance_account_number ?? null) : null,
        finance_amount: input.is_financed ? (input.finance_amount ?? null) : null,
        updated_at: new Date().toISOString(),
      }

      const { data, error } = await supabase
        .from('portal_risk_items')
        .insert(payload)
        .select('*')
        .single()

      if (error) throw error
      return mapRow(data as RiskItem)
    },

    async createRiskItemsBulk(inputs) {
      if (inputs.length === 0) return []

      const branches = await getBranches(accountId)
      const branchById = new Map(branches.map((b) => [b.id, b]))
      const now = new Date().toISOString()
      const today = now.slice(0, 10)

      const payloads = inputs.map((input) => {
        const branch = input.branch_id ? branchById.get(input.branch_id) : undefined
        return {
          account_id: accountId,
          asset_tag: generateAssetTag(input.name),
          name: input.name,
          category: input.category,
          insurance_section: defaultInsuranceSection(input.category),
          unit_cost: input.unit_cost,
          repair_cost: input.repair_cost ?? 0,
          record_date: input.record_date ?? today,
          image_url: input.image_url ?? null,
          employee_name: input.employee_name ?? null,
          employee_id: input.employee_id ?? null,
          item_extensions: input.item_extensions ?? [],
          assignment_status: input.assignment_status ?? (input.employee_id ? 'assigned' : 'unassigned'),
          vehicle_verification: input.vehicle_verification ?? {},
          is_rental: input.is_rental ?? false,
          rental_company: input.is_rental ? (input.rental_company ?? null) : null,
          rental_start_date: input.is_rental ? (input.rental_start_date ?? null) : null,
          rental_end_date: input.is_rental ? (input.rental_end_date ?? null) : null,
          insurance_status: input.insurance_status ?? 'Uninsured',
          description: input.description ?? null,
          serial_number: input.serial_number ?? null,
          branch_id: input.branch_id ?? null,
          branch: branch?.name ?? null,
          latitude: branch?.latitude ?? null,
          longitude: branch?.longitude ?? null,
          zoho_fields: input.zoho_fields ?? {},
          updated_at: now,
        }
      })

      const { data, error } = await supabase
        .from('portal_risk_items')
        .insert(payloads)
        .select('*')

      if (error) throw error
      return (data ?? []).map((row) => mapRow(row as RiskItem))
    },

    async updateRiskItem(id, input) {
      const patch: Record<string, unknown> = { updated_at: new Date().toISOString() }

      if (input.name !== undefined) patch.name = input.name
      if (input.category !== undefined) {
        patch.category = input.category
        patch.insurance_section = defaultInsuranceSection(input.category)
      }
      if (input.unit_cost !== undefined) patch.unit_cost = input.unit_cost
      if (input.repair_cost !== undefined) patch.repair_cost = input.repair_cost
      if (input.record_date !== undefined) patch.record_date = input.record_date
      if (input.image_url !== undefined) patch.image_url = input.image_url
      if (input.employee_name !== undefined) patch.employee_name = input.employee_name
      if (input.employee_id !== undefined) {
        patch.employee_id = input.employee_id
        patch.assignment_status = input.employee_id ? 'assigned' : 'unassigned'
      }
      if (input.item_extensions !== undefined) patch.item_extensions = input.item_extensions
      if (input.vehicle_verification !== undefined) {
        patch.vehicle_verification = input.vehicle_verification
      }
      if (input.is_rental !== undefined) {
        patch.is_rental = input.is_rental
        if (!input.is_rental) {
          patch.rental_company = null
          patch.rental_start_date = null
          patch.rental_end_date = null
        }
      }
      if (input.rental_company !== undefined) patch.rental_company = input.rental_company
      if (input.rental_start_date !== undefined) patch.rental_start_date = input.rental_start_date
      if (input.rental_end_date !== undefined) patch.rental_end_date = input.rental_end_date
      if (input.assignment_status !== undefined) patch.assignment_status = input.assignment_status
      if (input.insurance_status !== undefined) patch.insurance_status = input.insurance_status
      if (input.description !== undefined) patch.description = input.description
      if (input.serial_number !== undefined) patch.serial_number = input.serial_number
      if (input.zoho_fields !== undefined) patch.zoho_fields = input.zoho_fields
      if (input.purchase_value !== undefined) patch.purchase_value = input.purchase_value
      if (input.purchase_invoice_url !== undefined) patch.purchase_invoice_url = input.purchase_invoice_url
      if (input.purchase_invoice_name !== undefined) patch.purchase_invoice_name = input.purchase_invoice_name
      if (input.purchase_date !== undefined) patch.purchase_date = input.purchase_date
      if (input.is_financed !== undefined) {
        patch.is_financed = input.is_financed
        if (!input.is_financed) {
          patch.finance_house = null
          patch.finance_account_number = null
          patch.finance_amount = null
        }
      }
      if (input.finance_house !== undefined) patch.finance_house = input.finance_house
      if (input.finance_account_number !== undefined) {
        patch.finance_account_number = input.finance_account_number
      }
      if (input.finance_amount !== undefined) patch.finance_amount = input.finance_amount

      if (input.branch_id !== undefined) {
        patch.branch_id = input.branch_id
        const branchMeta = await resolveBranchMeta(input.branch_id)
        patch.branch = branchMeta.branch
        patch.latitude = branchMeta.latitude
        patch.longitude = branchMeta.longitude
      }

      const { data, error } = await supabase
        .from('portal_risk_items')
        .update(patch)
        .eq('id', id)
        .eq('account_id', accountId)
        .select('*')
        .single()

      if (error) throw error
      return mapRow(data as RiskItem)
    },

    async deleteRiskItem(id) {
      const { error } = await supabase
        .from('portal_risk_items')
        .delete()
        .eq('id', id)
        .eq('account_id', accountId)

      if (error) throw error
    },

    async getDashboardStats() {
      let q = supabase
        .from('portal_risk_items')
        .select('unit_cost, insurance_status')
        .eq('account_id', accountId)
      if (branchId) q = q.eq('branch_id', branchId)

      const { data, error } = await q

      if (error) throw error

      const rows = data ?? []
      const isUninsured = (status: string | null) =>
        status === 'Uninsured' ||
        status === 'Insured elsewhere' ||
        status === 'Covered Elsewhere'

      return {
        totalRecords: rows.length,
        insuredWithUsCount: rows.filter((r) => r.insurance_status === 'Insured with us').length,
        pipelineCount: rows.filter(
          (r) =>
            r.insurance_status === 'Brand new' || r.insurance_status === 'In acquisition',
        ).length,
        // Legacy "Insured elsewhere" rows count as Uninsured until migration runs.
        uninsuredCount: rows.filter((r) => isUninsured(r.insurance_status)).length,
        totalValue: rows.reduce((sum, r) => sum + Number(r.unit_cost), 0),
      } satisfies DashboardStats
    },
  }
}
