import { cn } from '../../lib/utils'

export function StatusBadge({ status }: { status: string }) {
  const styles =
    status === 'Insured with us'
      ? 'bg-emerald-100 text-emerald-800'
      : status === 'Insured elsewhere'
        ? 'bg-green-100 text-green-800'
        : status === 'Uninsured'
          ? 'bg-red-100 text-red-800'
          : status === 'Brand new'
            ? 'bg-blue-100 text-blue-800'
            : status === 'In acquisition'
              ? 'bg-yellow-100 text-yellow-800'
              : 'bg-gray-100 text-gray-800'

  return <span className={cn('rounded-full px-2 py-1 text-xs font-medium', styles)}>{status}</span>
}
