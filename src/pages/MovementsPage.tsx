import { Link } from 'react-router-dom'
import { ArrowLeftRight, ClipboardCheck, LogIn, UserPlus } from 'lucide-react'
import { PageHeader } from '../components/workspace/WorkspaceUi'

const ACTIONS = [
  {
    title: 'Assign to custodian',
    description: 'Place an asset under an employee’s custody without checking it out.',
    path: '/movements/assign',
    icon: UserPlus,
  },
  {
    title: 'Check out',
    description: 'Issue an asset for temporary use with optional due date.',
    path: '/movements/check-out',
    icon: LogIn,
  },
  {
    title: 'Check in',
    description: 'Return a checked-out asset to available / assigned status.',
    path: '/movements/check-in',
    icon: ClipboardCheck,
  },
]

export function MovementsPage() {
  return (
    <div className="space-y-5">
      <PageHeader
        title="Movements"
        description="Asset lifecycle events. Custody workflows below are live; acquisition, transfer, impairment, and disposal history will extend this ledger as integrations land."
      />

      <div className="grid gap-3 md:grid-cols-3">
        {ACTIONS.map(({ title, description, path, icon: Icon }) => (
          <Link
            key={path}
            to={path}
            className="ws-panel flex flex-col gap-2 p-4 transition-colors hover:bg-page"
          >
            <div className="flex h-9 w-9 items-center justify-center rounded-md bg-accent-light text-primary">
              <Icon size={18} />
            </div>
            <h2 className="text-sm font-semibold text-ink">{title}</h2>
            <p className="text-sm text-muted">{description}</p>
            <span className="mt-auto text-xs font-medium text-primary">Open workflow →</span>
          </Link>
        ))}
      </div>

      <section className="ws-panel p-4">
        <h2 className="mb-2 flex items-center gap-2 text-sm font-semibold text-ink">
          <ArrowLeftRight size={15} className="text-primary" />
          Lifecycle event types
        </h2>
        <ul className="grid gap-2 text-sm text-muted sm:grid-cols-2 lg:grid-cols-3">
          {[
            'Acquisition',
            'Assignment',
            'Check-out / check-in',
            'Transfer',
            'Maintenance',
            'Improvement',
            'Impairment',
            'Write-off',
            'Disposal',
          ].map((label) => (
            <li key={label} className="rounded-md border border-border bg-page px-3 py-2">
              <span className="font-medium text-ink">{label}</span>
              {['Assignment', 'Check-out / check-in'].includes(label) ? (
                <span className="ml-2 text-xs text-emerald-700">Available</span>
              ) : (
                <span className="ml-2 text-xs text-amber-800">Ledger pending</span>
              )}
            </li>
          ))}
        </ul>
        <p className="mt-3 text-xs text-muted">
          Each future movement will record initiator, approver, effective date, and supporting documents.
        </p>
      </section>
    </div>
  )
}
