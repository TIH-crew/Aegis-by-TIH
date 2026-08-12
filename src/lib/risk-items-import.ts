import { INSURANCE_STATUSES, RISK_CATEGORIES } from '../config/collections'
import type { RiskItemInput } from '../types'
import type { Branch } from '../types/branch'

export const RISK_ITEMS_IMPORT_HEADERS = [
  'Item Name',
  'Category',
  'Branch',
  'Unit Cost',
  'Repair Cost',
  'Insurance Status',
  'Employee',
  'Serial Number',
  'Description',
  'Record Date',
] as const

export const RISK_ITEMS_IMPORT_TEMPLATE = `${RISK_ITEMS_IMPORT_HEADERS.join(',')}
Office Laptop,Electronic Equipment,Head Office,18500,0,Brand new,Jane Doe,SN-001,Finance dept laptop,2026-01-15
Company Vehicle,Motor,Head Office,320000,15000,Uninsured,,ABC123GP,Fleet vehicle,2026-01-15`

const COLUMN_ALIASES: Record<string, keyof ParsedRowFields> = {
  'item name': 'name',
  name: 'name',
  item: 'name',
  category: 'category',
  branch: 'branch',
  'unit cost': 'unit_cost',
  unit_cost: 'unit_cost',
  value: 'unit_cost',
  'repair cost': 'repair_cost',
  repair_cost: 'repair_cost',
  'insurance status': 'insurance_status',
  insurance_status: 'insurance_status',
  status: 'insurance_status',
  employee: 'employee_name',
  employee_name: 'employee_name',
  'serial number': 'serial_number',
  serial_number: 'serial_number',
  serial: 'serial_number',
  description: 'description',
  'record date': 'record_date',
  record_date: 'record_date',
  date: 'record_date',
}

interface ParsedRowFields {
  name: string
  category: string
  branch: string
  unit_cost: string
  repair_cost: string
  insurance_status: string
  employee_name: string
  serial_number: string
  description: string
  record_date: string
}

export interface ImportRowResult {
  rowNumber: number
  input: RiskItemInput | null
  errors: string[]
  raw: Record<string, string>
}

function normalizeHeader(header: string): string {
  return header.trim().toLowerCase().replace(/\s+/g, ' ')
}

function parseNumber(value: string, field: string): { value: number; error?: string } {
  const trimmed = value.trim()
  if (!trimmed) return { value: 0 }
  const normalized = trimmed.replace(/[Rr]\s*/g, '').replace(/,/g, '').trim()
  const num = Number(normalized)
  if (Number.isNaN(num) || num < 0) {
    return { value: 0, error: `${field} must be a valid number` }
  }
  return { value: num }
}

function parseDate(value: string): { value?: string; error?: string } {
  const trimmed = value.trim()
  if (!trimmed) return {}
  if (/^\d{4}-\d{2}-\d{2}$/.test(trimmed)) return { value: trimmed }
  const dmy = trimmed.match(/^(\d{1,2})[/-](\d{1,2})[/-](\d{4})$/)
  if (dmy) {
    const [, d, m, y] = dmy
    return { value: `${y}-${m.padStart(2, '0')}-${d.padStart(2, '0')}` }
  }
  return { error: 'Record Date must be YYYY-MM-DD' }
}

function matchEnum<T extends string>(value: string, options: readonly T[]): T | null {
  const trimmed = value.trim()
  if (!trimmed) return null
  const exact = options.find((o) => o.toLowerCase() === trimmed.toLowerCase())
  return exact ?? null
}

function resolveBranchId(branchName: string, branches: Branch[]): string | null {
  const trimmed = branchName.trim()
  if (!trimmed) return null
  const match = branches.find((b) => b.name.toLowerCase() === trimmed.toLowerCase())
  return match?.id ?? null
}

export function parseCsvText(text: string): string[][] {
  const rows: string[][] = []
  let row: string[] = []
  let field = ''
  let inQuotes = false

  for (let i = 0; i < text.length; i++) {
    const char = text[i]
    const next = text[i + 1]

    if (inQuotes) {
      if (char === '"' && next === '"') {
        field += '"'
        i++
      } else if (char === '"') {
        inQuotes = false
      } else {
        field += char
      }
      continue
    }

    if (char === '"') {
      inQuotes = true
    } else if (char === ',') {
      row.push(field)
      field = ''
    } else if (char === '\r' && next === '\n') {
      row.push(field)
      rows.push(row)
      row = []
      field = ''
      i++
    } else if (char === '\n' || char === '\r') {
      row.push(field)
      rows.push(row)
      row = []
      field = ''
    } else {
      field += char
    }
  }

  if (field.length > 0 || row.length > 0) {
    row.push(field)
    rows.push(row)
  }

  return rows.filter((r) => r.some((cell) => cell.trim().length > 0))
}

export function parseRiskItemsCsv(
  csvText: string,
  branches: Branch[],
): { rows: ImportRowResult[]; parseError?: string } {
  const table = parseCsvText(csvText.trim())
  if (table.length === 0) {
    return { rows: [], parseError: 'The file is empty.' }
  }

  const headerRow = table[0].map(normalizeHeader)
  const columnMap = new Map<number, keyof ParsedRowFields>()

  headerRow.forEach((header, index) => {
    const key = COLUMN_ALIASES[header]
    if (key) columnMap.set(index, key)
  })

  if (![...columnMap.values()].includes('name')) {
    return {
      rows: [],
      parseError: 'Missing required column: Item Name',
    }
  }
  if (![...columnMap.values()].includes('category')) {
    return {
      rows: [],
      parseError: 'Missing required column: Category',
    }
  }
  if (![...columnMap.values()].includes('branch')) {
    return {
      rows: [],
      parseError: 'Missing required column: Branch',
    }
  }

  const results: ImportRowResult[] = []

  for (let i = 1; i < table.length; i++) {
    const cells = table[i]
    const raw: Record<string, string> = {}
    const fields: Partial<ParsedRowFields> = {}

    columnMap.forEach((key, colIndex) => {
      const value = (cells[colIndex] ?? '').trim()
      fields[key] = value
      raw[key] = value
    })

    const errors: string[] = []
    const name = (fields.name ?? '').trim()
    if (!name) errors.push('Item Name is required')

    const categoryRaw = (fields.category ?? '').trim()
    const category = matchEnum(categoryRaw, RISK_CATEGORIES)
    if (!categoryRaw) errors.push('Category is required')
    else if (!category) errors.push(`Unknown category "${categoryRaw}"`)

    const branchRaw = (fields.branch ?? '').trim()
    const branchId = resolveBranchId(branchRaw, branches)
    if (!branchRaw) errors.push('Branch is required')
    else if (!branchId) errors.push(`Unknown branch "${branchRaw}"`)

    const unitCost = parseNumber(fields.unit_cost ?? '', 'Unit Cost')
    if (unitCost.error) errors.push(unitCost.error)

    const repairCost = parseNumber(fields.repair_cost ?? '', 'Repair Cost')
    if (repairCost.error) errors.push(repairCost.error)

    const statusRaw = (fields.insurance_status ?? '').trim()
    // Legacy CSV values "Insured elsewhere" / "Covered Elsewhere" → Uninsured
    const legacyUninsured =
      /^insured\s+elsewhere$/i.test(statusRaw) || /^covered\s+elsewhere$/i.test(statusRaw)
    const insuranceStatus = legacyUninsured
      ? ('Uninsured' as (typeof INSURANCE_STATUSES)[number])
      : statusRaw
        ? matchEnum(statusRaw, INSURANCE_STATUSES)
        : ('Uninsured' as (typeof INSURANCE_STATUSES)[number])
    if (statusRaw && !insuranceStatus && !legacyUninsured) {
      errors.push(`Unknown insurance status "${statusRaw}"`)
    }

    const recordDate = parseDate(fields.record_date ?? '')
    if (recordDate.error) errors.push(recordDate.error)

    const input: RiskItemInput | null =
      errors.length === 0 && category && branchId
        ? {
            name,
            category,
            branch_id: branchId,
            unit_cost: unitCost.value,
            repair_cost: repairCost.value,
            insurance_status: insuranceStatus ?? 'Uninsured',
            employee_name: (fields.employee_name ?? '').trim() || null,
            serial_number: (fields.serial_number ?? '').trim() || null,
            description: (fields.description ?? '').trim() || null,
            record_date: recordDate.value,
          }
        : null

    results.push({
      rowNumber: i + 1,
      input,
      errors,
      raw,
    })
  }

  return { rows: results }
}

export function downloadImportTemplate() {
  const blob = new Blob([RISK_ITEMS_IMPORT_TEMPLATE], { type: 'text/csv;charset=utf-8' })
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.href = url
  link.download = 'risk-items-import-template.csv'
  link.click()
  URL.revokeObjectURL(url)
}
