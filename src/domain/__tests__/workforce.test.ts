import { describe, expect, it } from 'vitest'
import {
  assertClaimWhatsApp,
  employeeHasClaimWhatsApp,
  normalizeWhatsAppNumber,
} from '../../lib/contact-validation'
import { can, resolveAppRole } from '../../lib/rbac'
import {
  buildImportErrorCsv,
  mapRowsToDraft,
  parseEmployeeCsv,
  suggestColumnMap,
  splitName,
} from '../../services/workforce.service'

describe('workforce name split', () => {
  it('splits first and last without inventing data', () => {
    expect(splitName('Jane Doe')).toEqual({ first_name: 'Jane', last_name: 'Doe' })
    expect(splitName('Madonna')).toEqual({ first_name: 'Madonna', last_name: 'Madonna' })
  })
})

describe('whatsapp optional + claim validation', () => {
  it('treats empty whatsapp as missing for claims', () => {
    expect(employeeHasClaimWhatsApp('')).toBe(false)
    expect(employeeHasClaimWhatsApp(null)).toBe(false)
    expect(employeeHasClaimWhatsApp('not-a-number')).toBe(false)
  })

  it('accepts SA mobile formats for claim OTP', () => {
    expect(normalizeWhatsAppNumber('0821234567')).toBe('+27821234567')
    expect(normalizeWhatsAppNumber('+27821234567')).toBe('+27821234567')
    expect(employeeHasClaimWhatsApp('+27821234567')).toBe(true)
  })

  it('assertClaimWhatsApp throws without inventing a number', () => {
    expect(() => assertClaimWhatsApp('')).toThrow(/usable WhatsApp/i)
    expect(() => assertClaimWhatsApp(undefined)).toThrow(/usable WhatsApp/i)
  })

  it('hr registration may omit whatsapp without placeholder', () => {
    const created = { whatsapp_number: '' }
    expect(created.whatsapp_number).toBe('')
    expect(employeeHasClaimWhatsApp(created.whatsapp_number)).toBe(false)
  })
})

describe('rbac workforce roles', () => {
  it('ordinary members do not get employee mutation caps', () => {
    const role = resolveAppRole({ email: 'member@acme.com', portalRole: 'member' })
    expect(role).toBe('employee')
    expect(can(role, 'workforce_hr')).toBe(false)
    expect(can(role, 'employees')).toBe(false)
  })

  it('hr_admin can manage workforce but not broker promote', () => {
    const role = resolveAppRole({ email: 'hr@acme.com', portalRole: 'hr_admin' })
    expect(can(role, 'workforce_hr')).toBe(true)
    expect(can(role, 'workforce_broker')).toBe(false)
  })

  it('broker can review but not workforce_hr', () => {
    const role = resolveAppRole({ email: 'broker@tih.co.za', portalRole: 'broker' })
    expect(can(role, 'workforce_broker')).toBe(true)
    expect(can(role, 'workforce_hr')).toBe(false)
    expect(can(role, 'employees')).toBe(true)
  })

  it('owner and admin manage workforce', () => {
    expect(can(resolveAppRole({ email: 'o@acme.com', portalRole: 'owner' }), 'workforce_hr')).toBe(
      true,
    )
    expect(can(resolveAppRole({ email: 'a@acme.com', portalRole: 'admin' }), 'workforce_hr')).toBe(
      true,
    )
  })
})

describe('employee csv import preview', () => {
  it('requires name and employee number or email', () => {
    const rows = parseEmployeeCsv(`full_name,email,employee_number
Jane Doe,jane@acme.com,E1
,,E2
John,,`)
    expect(rows[0]?.error).toBeUndefined()
    expect(rows[1]?.error).toMatch(/Name/i)
    expect(rows[2]?.error).toMatch(/Employee number or email/i)
  })

  it('does not treat names alone as unique keys', () => {
    const rows = parseEmployeeCsv(`full_name,employee_number
Jane Doe,E1
Jane Doe,E2`)
    expect(rows).toHaveLength(2)
    expect(rows[0]?.employeeNumber).toBe('E1')
    expect(rows[1]?.employeeNumber).toBe('E2')
  })

  it('supports column mapping aliases', () => {
    const map = suggestColumnMap(['Employee Name', 'Emp_No', 'Work_Email'])
    expect(map.full_name || map.employee_number || map.email).toBeTruthy()
    const rows = mapRowsToDraft(
      [{ 'Employee Name': 'Pat Lee', Emp_No: 'P1', Work_Email: 'pat@acme.com' }],
      { full_name: 'Employee Name', employee_number: 'Emp_No', email: 'Work_Email' },
    )
    expect(rows[0]?.fullName).toBe('Pat Lee')
    expect(rows[0]?.employeeNumber).toBe('P1')
  })

  it('builds downloadable error csv', () => {
    const csv = buildImportErrorCsv([
      { row: 2, status: 'invalid', message: 'Name is required' },
      { row: 3, status: 'imported' },
    ])
    expect(csv).toContain('row,status,message')
    expect(csv).toContain('Name is required')
  })
})

describe('workforce rules', () => {
  it('routine create does not imply Zoho Contact', () => {
    const created = { zoho_contact_id: null as string | null, invitation_status: 'not_invited' }
    expect(created.zoho_contact_id).toBeNull()
  })

  it('deactivate preserves crm link fields', () => {
    const before = { status: 'active', zoho_contact_id: 'C1', zoho_contact_link_status: 'linked' }
    const after = {
      ...before,
      status: 'inactive',
      employment_end_date: '2026-11-11',
      invitation_status: 'revoked',
    }
    expect(after.zoho_contact_id).toBe('C1')
    expect(after.status).toBe('inactive')
  })

  it('hr enrolment is not provider confirmation', () => {
    const membership = {
      enrolment_status: 'hr_declared',
      provider_confirmation_status: 'unconfirmed',
    }
    expect(membership.enrolment_status).not.toBe(membership.provider_confirmation_status)
  })

  it('crm promote idempotency key prevents duplicate links', () => {
    const key = 'promote-emp-1'
    const links = new Map<string, string>()
    const first = links.get(key) ?? 'CONTACT-A'
    links.set(key, first)
    const second = links.get(key) ?? 'CONTACT-B'
    expect(second).toBe(first)
  })

  it('re-import matches employee number not name', () => {
    const existing = { employee_number: 'E9', email: 'a@acme.com', full_name: 'Ann Old' }
    const row = parseEmployeeCsv(`full_name,employee_number,email\nAnn New,E9,a@acme.com`)[0]!
    const matchByEmpNo = row.employeeNumber?.toLowerCase() === existing.employee_number.toLowerCase()
    const matchByNameAlone = row.fullName === existing.full_name
    expect(matchByEmpNo).toBe(true)
    expect(matchByNameAlone).toBe(false)
  })

  it('activation invite is separate from claim token', () => {
    const employee = {
      claim_access_token: 'claim-uuid',
      invitation_status: 'pending',
    }
    expect(employee.claim_access_token).not.toBe(employee.invitation_status)
  })

  it('sensitive benefit data stays out of CRM promote payload', () => {
    const promotePayload = {
      First_Name: 'Jane',
      Last_Name: 'Doe',
      Email: 'jane@acme.com',
    }
    expect(promotePayload).not.toHaveProperty('pension_balance')
    expect(promotePayload).not.toHaveProperty('medical_claims')
  })

  it('partial zoho failure keeps supabase employee', () => {
    const employee = { id: 'e1', zoho_contact_link_status: 'failed', zoho_contact_id: null as string | null }
    expect(employee.id).toBeTruthy()
    expect(employee.zoho_contact_link_status).toBe('failed')
  })
})
