import { supabase } from '../lib/supabase'
import { formatCurrency } from '../lib/utils'

export interface ClientSheetPolicy {
  id: string
  account_id: string
  insured_name: string | null
  cover_type: string | null
  policy_number: string
  insurer: string | null
  frequency: string | null
  debit_details: string | null
  renewal_month: string | null
  monthly_premium: number | null
  annual_once_off: number | null
  sort_order: number
}

export interface ClientSheetMonthLog {
  id: string
  sheet_policy_id: string
  period_month: string
  log_text: string
}

export interface ClientSheetRow extends ClientSheetPolicy {
  months: Record<string, string>
}

export async function fetchClientSheet(accountId: string): Promise<{
  rows: ClientSheetRow[]
  periods: string[]
}> {
  const [{ data: policies, error: pErr }, { data: logs, error: lErr }] = await Promise.all([
    supabase
      .from('portal_client_sheet_policies')
      .select('*')
      .eq('account_id', accountId)
      .order('sort_order', { ascending: true }),
    supabase
      .from('portal_client_sheet_month_logs')
      .select('id, sheet_policy_id, period_month, log_text')
      .eq('account_id', accountId)
      .order('period_month', { ascending: true }),
  ])

  if (pErr) throw pErr
  if (lErr) throw lErr

  const periodSet = new Set<string>()
  const byPolicy = new Map<string, Record<string, string>>()
  for (const log of logs ?? []) {
    const period = String(log.period_month).slice(0, 10)
    periodSet.add(period)
    const cur = byPolicy.get(log.sheet_policy_id) ?? {}
    cur[period] = log.log_text
    byPolicy.set(log.sheet_policy_id, cur)
  }

  const periods = [...periodSet].sort()
  const rows: ClientSheetRow[] = (policies ?? []).map((p) => ({
    ...(p as ClientSheetPolicy),
    monthly_premium: p.monthly_premium != null ? Number(p.monthly_premium) : null,
    annual_once_off: p.annual_once_off != null ? Number(p.annual_once_off) : null,
    months: byPolicy.get(p.id) ?? {},
  }))

  return { rows, periods }
}

export function formatPeriodLabel(isoDate: string): string {
  const d = new Date(`${isoDate}T00:00:00`)
  return d.toLocaleDateString('en-ZA', { month: 'short', year: 'numeric' })
}

export function formatSheetPremium(value: number | null | undefined): string {
  if (value == null || Number.isNaN(value)) return '—'
  return formatCurrency(value)
}

/** Highlight cells that contain real changes vs “no changes”. */
export function monthHasChanges(logText: string | undefined): boolean {
  if (!logText) return false
  const t = logText.toLowerCase()
  if (t.includes('item cancelled') || t.includes('item canceled')) return true
  if (t.includes('added') || t.includes('removed') || t.includes('amended')) return true
  if (t.includes('credit') || t.includes('renewal') || t.includes('debit')) return true
  if (t.includes('no change')) return false
  return t.length > 40
}

export interface ParsedMonthLog {
  hasChanges: boolean
  cancelled: string[]
  added: string[]
  premiumNotes: string[]
  otherNotes: string[]
}

/** Split free-text client-sheet month notes into readable change groups. */
export function parseMonthLog(logText: string | undefined): ParsedMonthLog {
  const empty: ParsedMonthLog = {
    hasChanges: false,
    cancelled: [],
    added: [],
    premiumNotes: [],
    otherNotes: [],
  }
  if (!logText?.trim()) return empty

  const cancelled: string[] = []
  const added: string[] = []
  const premiumNotes: string[] = []
  const otherNotes: string[] = []

  const lines = logText
    .split(/\r?\n/)
    .map((l) => l.replace(/^[\s•\-\*]+/, '').trim())
    .filter(Boolean)

  for (const line of lines) {
    const lower = line.toLowerCase()
    if (/item\s+cancell?ed/i.test(line)) {
      cancelled.push(line.replace(/\s*[-–—]?\s*item\s+cancell?ed\.?/i, '').trim() || line)
      continue
    }
    if (/\b(added|new item|item added)\b/i.test(line) && !/no change/i.test(line)) {
      added.push(line)
      continue
    }
    if (
      /premium|credit|collection|debit|invoice|declared amount|await/i.test(lower) ||
      /^r[\s\d]/i.test(line) ||
      /new monthly|previous premium|premium prior|premium after/i.test(lower)
    ) {
      premiumNotes.push(line)
      continue
    }
    if (/^no changes?\b/i.test(line) && lines.length <= 3) {
      otherNotes.push(line)
      continue
    }
    if (/assist amended|move assist|pharmacists?|phamasicts|pharmasicts/i.test(lower)) {
      otherNotes.push(line)
      continue
    }
    if (line.length > 2) otherNotes.push(line)
  }

  return {
    hasChanges: monthHasChanges(logText),
    cancelled,
    added,
    premiumNotes,
    otherNotes,
  }
}
