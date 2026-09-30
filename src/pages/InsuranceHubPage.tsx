import { Link } from 'react-router-dom'
import { FileBarChart, FileText, Shield, Users } from 'lucide-react'
import { PageHeader } from '../components/workspace/WorkspaceUi'
import { useAuth } from '../context/AuthContext'

const LINKS = [
  {
    title: 'Policies',
    description: 'Active covers, renewals, and schedule documents.',
    path: '/insurance/policies',
    icon: Shield,
    capability: 'policies' as const,
  },
  {
    title: 'Quotations',
    description: 'Pipeline quotes and broker hand-offs.',
    path: '/insurance/quotations',
    icon: FileText,
    capability: 'quotations' as const,
  },
  {
    title: 'Claims',
    description: 'Open and historical claims against policies.',
    path: '/insurance/claims',
    icon: FileText,
    capability: 'claims' as const,
  },
  {
    title: 'Endorsements',
    description: 'Monthly change timeline with original endorsement evidence.',
    path: '/insurance/endorsements',
    icon: FileBarChart,
    capability: 'reports' as const,
  },
  {
    title: 'PI members',
    description: 'Professional indemnity membership register.',
    path: '/insurance/pi-members',
    icon: Users,
    capability: 'policies' as const,
  },
]

export function InsuranceHubPage() {
  const { can } = useAuth()

  return (
    <div className="space-y-5">
      <PageHeader
        title="Insurance"
        description="Policies, quotations, claims, and endorsement reporting — linked to the asset register where a reliable match exists."
      />

      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {LINKS.filter((l) => can(l.capability)).map(({ title, description, path, icon: Icon }) => (
          <Link key={path} to={path} className="ws-panel flex flex-col gap-2 p-4 hover:bg-page">
            <div className="flex h-9 w-9 items-center justify-center rounded-md bg-accent-light text-primary">
              <Icon size={18} />
            </div>
            <h2 className="text-sm font-semibold text-ink">{title}</h2>
            <p className="text-sm text-muted">{description}</p>
          </Link>
        ))}
      </div>

      <section className="ws-panel p-4">
        <h2 className="mb-1 text-sm font-semibold text-ink">Register ↔ schedule matching</h2>
        <p className="text-sm text-muted">
          Assets with a Zoho risk link or matching schedule item appear as matched on the asset
          detail Insurance tab. Unmatched and uncertain matches will surface here for review once
          the match confidence service is wired — until then, treat schedule alignment as a manual
          broker process.
        </p>
      </section>
    </div>
  )
}
