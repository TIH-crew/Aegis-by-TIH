import { cn } from '../../lib/utils'

export function StatusBadge({ status }: { status: string }) {
  const normalized =
    status === 'Insured elsewhere' || status === 'Covered Elsewhere' ? 'Uninsured' : status

  const styles =
    normalized === 'Insured with us'
      ? 'bg-emerald-100 text-emerald-800'
      : normalized === 'Uninsured'
        ? 'bg-red-100 text-red-800'
        : normalized === 'Brand new'
          ? 'bg-blue-100 text-blue-800'
          : normalized === 'In acquisition'
            ? 'bg-yellow-100 text-yellow-800'
            : 'bg-gray-100 text-gray-800'

  return (
    <span className={cn('rounded-full px-2 py-1 text-xs font-medium', styles)}>{normalized}</span>
  )
}
