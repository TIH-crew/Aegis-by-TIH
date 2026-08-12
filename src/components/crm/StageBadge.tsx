import { cn } from '../../lib/utils'

export function StageBadge({ stage }: { stage: string }) {
  const normalized = stage.toLowerCase()
  const styles = normalized.includes('won') || normalized.includes('active') || normalized.includes('bound')
    ? 'bg-green-100 text-green-800'
    : normalized.includes('lost') || normalized.includes('declin')
      ? 'bg-red-100 text-red-800'
      : normalized.includes('quote') || normalized.includes('present')
        ? 'bg-blue-100 text-blue-800'
        : 'bg-gray-100 text-gray-800'

  return (
    <span className={cn('rounded-full px-2 py-1 text-xs font-medium', styles)}>{stage}</span>
  )
}
