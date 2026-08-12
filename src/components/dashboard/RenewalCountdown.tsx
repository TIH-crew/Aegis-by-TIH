import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { CalendarClock } from 'lucide-react'

interface RenewalCountdownProps {
  renewalDate: string
  policyNumber: string
  insurer?: string | null
}

function diffParts(target: Date, now: Date) {
  const ms = Math.max(0, target.getTime() - now.getTime())
  const totalSeconds = Math.floor(ms / 1000)
  const days = Math.floor(totalSeconds / 86400)
  const hours = Math.floor((totalSeconds % 86400) / 3600)
  const minutes = Math.floor((totalSeconds % 3600) / 60)
  const seconds = totalSeconds % 60
  return { days, hours, minutes, seconds, ms }
}

export function RenewalCountdown({ renewalDate, policyNumber, insurer }: RenewalCountdownProps) {
  const target = useMemo(() => {
    // Treat renewal as end of that calendar day in local time
    const [y, m, d] = renewalDate.split('-').map(Number)
    return new Date(y, (m ?? 1) - 1, d ?? 1, 23, 59, 59)
  }, [renewalDate])

  const [now, setNow] = useState(() => new Date())

  useEffect(() => {
    const id = window.setInterval(() => setNow(new Date()), 1000)
    return () => window.clearInterval(id)
  }, [])

  const parts = diffParts(target, now)
  const overdue = parts.ms === 0 && target.getTime() < now.getTime()

  return (
    <div className="rounded-lg border border-border bg-surface p-5 shadow-sm">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div>
          <p className="text-sm font-medium text-gray-900">Next policy renewal</p>
          <p className="mt-0.5 text-xs text-muted">
            {policyNumber}
            {insurer ? ` · ${insurer}` : ''} · {renewalDate}
          </p>
        </div>
        <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-accent-light text-primary">
          <CalendarClock size={20} />
        </div>
      </div>

      {overdue ? (
        <p className="text-lg font-semibold text-red-700">Renewal due</p>
      ) : (
        <div className="grid grid-cols-4 gap-2 text-center">
          <TimeBlock label="Days" value={parts.days} />
          <TimeBlock label="Hours" value={parts.hours} />
          <TimeBlock label="Mins" value={parts.minutes} />
          <TimeBlock label="Secs" value={parts.seconds} />
        </div>
      )}

      <Link
        to="/collections/policies"
        className="mt-4 inline-block text-sm font-medium text-primary hover:underline"
      >
        View policies
      </Link>
    </div>
  )
}

function TimeBlock({ label, value }: { label: string; value: number }) {
  return (
    <div className="rounded-md bg-page px-2 py-3">
      <p className="text-xl font-semibold tabular-nums text-gray-900">
        {String(value).padStart(2, '0')}
      </p>
      <p className="text-[10px] uppercase tracking-wide text-muted">{label}</p>
    </div>
  )
}
