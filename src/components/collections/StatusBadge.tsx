import { cn } from '../../lib/utils'

const STATUS_STYLES: Record<string, string> = {
  'Insured with us': 'bg-emerald-50 text-emerald-800 ring-1 ring-emerald-200/70',
  Uninsured: 'bg-rose-50 text-rose-800 ring-1 ring-rose-200/70',
  'Brand new': 'bg-sky-50 text-sky-800 ring-1 ring-sky-200/70',
  'In acquisition': 'bg-amber-50 text-amber-900 ring-1 ring-amber-200/70',
  assigned: 'bg-slate-100 text-slate-700 ring-1 ring-slate-200/80',
  checked_out: 'bg-violet-50 text-violet-800 ring-1 ring-violet-200/70',
  unassigned: 'bg-stone-100 text-stone-700 ring-1 ring-stone-200/80',
  active: 'bg-emerald-50 text-emerald-800 ring-1 ring-emerald-200/70',
  inactive: 'bg-stone-100 text-stone-600 ring-1 ring-stone-200/80',
}

export function StatusBadge({ status }: { status: string }) {
  const normalized =
    status === 'Insured elsewhere' || status === 'Covered Elsewhere' ? 'Uninsured' : status

  const styles = STATUS_STYLES[normalized] ?? 'bg-stone-100 text-stone-700 ring-1 ring-stone-200/80'
  const label = normalized.replace(/_/g, ' ')

  return <span className={cn('ws-status', styles)}>{label}</span>
}
