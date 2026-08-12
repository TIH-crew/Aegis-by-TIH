import { supabase } from '../lib/supabase'
import type { Employee, EmployeeInput } from '../types/employee'

function mapEmployee(row: Employee): Employee {
  return {
    ...row,
    branch_name: row.branch_name ?? null,
  }
}

export async function listEmployees(accountId: string): Promise<Employee[]> {
  const { data, error } = await supabase
    .from('portal_employees')
    .select('*')
    .eq('account_id', accountId)
    .order('full_name')

  if (error) throw error

  const { data: branches } = await supabase
    .from('portal_branches')
    .select('id, name')
    .eq('account_id', accountId)

  const branchName = new Map((branches ?? []).map((row) => [row.id, row.name]))
  const employees = (data ?? []).map((row) =>
    mapEmployee({
      ...(row as Employee),
      branch_name: row.branch_id ? branchName.get(row.branch_id) ?? null : null,
    }),
  )
  if (employees.length === 0) return employees

  const { data: counts, error: countError } = await supabase
    .from('portal_risk_items')
    .select('employee_id')
    .eq('account_id', accountId)
    .not('employee_id', 'is', null)

  if (countError) throw countError

  const tally = new Map<string, number>()
  for (const row of counts ?? []) {
    if (!row.employee_id) continue
    tally.set(row.employee_id, (tally.get(row.employee_id) ?? 0) + 1)
  }

  return employees.map((employee) => ({
    ...employee,
    item_count: tally.get(employee.id) ?? 0,
  }))
}

export async function getEmployee(accountId: string, id: string): Promise<Employee | null> {
  const { data, error } = await supabase
    .from('portal_employees')
    .select('*')
    .eq('account_id', accountId)
    .eq('id', id)
    .maybeSingle()

  if (error) throw error
  if (!data) return null

  let branch_name: string | null = null
  if (data.branch_id) {
    const { data: branch } = await supabase
      .from('portal_branches')
      .select('name')
      .eq('id', data.branch_id)
      .maybeSingle()
    branch_name = branch?.name ?? null
  }
  return mapEmployee({ ...(data as Employee), branch_name })
}

export async function createEmployee(accountId: string, input: EmployeeInput): Promise<Employee> {
  const { data, error } = await supabase
    .from('portal_employees')
    .insert({
      account_id: accountId,
      full_name: input.full_name.trim(),
      job_title: input.job_title?.trim() || null,
      email: input.email?.trim() || null,
      phone: input.phone?.trim() || null,
      whatsapp_number: input.whatsapp_number.trim(),
      employee_number: input.employee_number?.trim() || null,
      branch_id: input.branch_id || null,
      image_url: input.image_url ?? null,
      status: input.status ?? 'active',
      id_number: input.id_number?.trim() || null,
      licence_number: input.licence_number?.trim() || null,
      licence_valid_to: input.licence_valid_to || null,
      licence_categories: input.licence_categories ?? null,
      drivers_licence_verified_at: input.drivers_licence_verified_at ?? null,
      drivers_licence_verification: input.drivers_licence_verification ?? {},
      updated_at: new Date().toISOString(),
    })
    .select('*')
    .single()

  if (error) throw error
  return mapEmployee(data as Employee)
}

export async function updateEmployee(
  accountId: string,
  id: string,
  input: Partial<EmployeeInput>,
): Promise<Employee> {
  const patch: Record<string, unknown> = { updated_at: new Date().toISOString() }
  if (input.full_name !== undefined) patch.full_name = input.full_name.trim()
  if (input.job_title !== undefined) patch.job_title = input.job_title?.trim() || null
  if (input.email !== undefined) patch.email = input.email?.trim() || null
  if (input.phone !== undefined) patch.phone = input.phone?.trim() || null
  if (input.whatsapp_number !== undefined) patch.whatsapp_number = input.whatsapp_number.trim()
  if (input.employee_number !== undefined) patch.employee_number = input.employee_number?.trim() || null
  if (input.branch_id !== undefined) patch.branch_id = input.branch_id || null
  if (input.image_url !== undefined) patch.image_url = input.image_url
  if (input.status !== undefined) patch.status = input.status
  if (input.id_number !== undefined) patch.id_number = input.id_number?.trim() || null
  if (input.licence_number !== undefined) patch.licence_number = input.licence_number?.trim() || null
  if (input.licence_valid_to !== undefined) patch.licence_valid_to = input.licence_valid_to || null
  if (input.licence_categories !== undefined) patch.licence_categories = input.licence_categories
  if (input.drivers_licence_verified_at !== undefined) {
    patch.drivers_licence_verified_at = input.drivers_licence_verified_at
  }
  if (input.drivers_licence_verification !== undefined) {
    patch.drivers_licence_verification = input.drivers_licence_verification
  }

  const { data, error } = await supabase
    .from('portal_employees')
    .update(patch)
    .eq('id', id)
    .eq('account_id', accountId)
    .select('*')
    .single()

  if (error) throw error
  return mapEmployee(data as Employee)
}

export async function uploadEmployeePhoto(
  accountId: string,
  employeeId: string,
  file: File,
): Promise<string> {
  const ext = file.name.split('.').pop()?.toLowerCase() || 'jpg'
  const path = `${accountId}/employees/${employeeId}.${ext}`

  const { error } = await supabase.storage.from('claim-attachments').upload(path, file, {
    upsert: true,
    contentType: file.type,
  })
  if (error) throw error

  const { data } = supabase.storage.from('claim-attachments').getPublicUrl(path)
  const publicUrl = `${data.publicUrl}?t=${Date.now()}`
  await updateEmployee(accountId, employeeId, { image_url: publicUrl })
  return publicUrl
}
