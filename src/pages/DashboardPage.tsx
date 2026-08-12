import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Building2, Shield, FileText, DollarSign, AlertTriangle } from 'lucide-react'
import { RenewalCountdown } from '../components/dashboard/RenewalCountdown'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { getNextPolicyRenewal } from '../services/account-hierarchy.service'
import type { DashboardStats } from '../types'
import { formatCurrency } from '../lib/utils'

export function DashboardPage() {
  const dataService = useDataService()
  const { accountId, homeAccountId, homeAccountName, subsidiaries, setActiveAccountId } =
    useAuth()
  const [stats, setStats] = useState<DashboardStats | null>(null)
  const [loading, setLoading] = useState(true)
  const [nextRenewal, setNextRenewal] = useState<{
    renewal_date: string
    policy_number: string
    insurer: string | null
  } | null>(null)

  useEffect(() => {
    if (!dataService || !accountId) return
    setLoading(true)
    void Promise.all([
      dataService.getDashboardStats(),
      getNextPolicyRenewal(accountId).catch(() => null),
    ])
      .then(([dashboardStats, renewal]) => {
        setStats(dashboardStats)
        setNextRenewal(renewal)
      })
      .finally(() => setLoading(false))
  }, [dataService, accountId])

  const isParentView = Boolean(
    homeAccountId && accountId === homeAccountId && subsidiaries.length > 0,
  )

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Dashboard</h1>
        <p className="text-sm text-muted">
          Manage your risks, assets and inventory in one place with Aegis by TIH.
        </p>
      </div>

      {loading && <p className="text-sm text-muted">Loading dashboard...</p>}

      {nextRenewal && (
        <RenewalCountdown
          renewalDate={nextRenewal.renewal_date}
          policyNumber={nextRenewal.policy_number}
          insurer={nextRenewal.insurer}
        />
      )}

      {stats && (
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6">
          <StatCard icon={Shield} label="Total Risk Items" value={String(stats.totalRecords)} />
          <StatCard
            icon={FileText}
            label="Insured with us"
            value={String(stats.insuredWithUsCount)}
          />
          <StatCard
            icon={FileText}
            label="Insured Elsewhere"
            value={String(stats.insuredElsewhereCount)}
          />
          <StatCard icon={AlertTriangle} label="In Pipeline" value={String(stats.pipelineCount)} />
          <StatCard icon={AlertTriangle} label="Uninsured" value={String(stats.uninsuredCount)} />
          <StatCard icon={DollarSign} label="Total Value" value={formatCurrency(stats.totalValue)} />
        </div>
      )}

      {isParentView && (
        <div className="rounded-lg border border-border bg-surface shadow-sm">
          <div className="border-b border-border px-4 py-3">
            <h2 className="font-semibold">Subsidiary companies</h2>
            <p className="text-xs text-muted">
              {homeAccountName ?? 'Parent'} — each company has its own policies, quotations, claims,
              and renewals.
            </p>
          </div>
          <ul className="divide-y divide-border">
            {subsidiaries.map((sub) => (
              <li
                key={sub.id}
                className="flex flex-wrap items-center justify-between gap-3 px-4 py-3"
              >
                <div className="flex items-center gap-3">
                  <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-accent-light text-primary">
                    <Building2 size={16} />
                  </div>
                  <div>
                    <p className="font-medium text-gray-900">{sub.name}</p>
                    <p className="text-xs text-muted">
                      {sub.industry ?? 'Subsidiary'}
                      {sub.aegis_status ? ` · ${sub.aegis_status}` : ''}
                    </p>
                  </div>
                </div>
                <button
                  type="button"
                  onClick={() => setActiveAccountId(sub.id)}
                  className="rounded-lg border border-border px-3 py-1.5 text-sm font-medium hover:bg-page"
                >
                  Open company
                </button>
              </li>
            ))}
          </ul>
        </div>
      )}

      <div className="rounded-lg border border-border bg-surface p-6 shadow-sm">
        <h2 className="mb-2 text-lg font-semibold">Quick actions</h2>
        <div className="flex flex-wrap gap-3">
          <Link
            to="/collections/risk-items"
            className="rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white hover:bg-burgundy-dark"
          >
            View Risk Items
          </Link>
          <Link
            to="/collections/risk-items/new"
            className="rounded-lg bg-accent px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-accent-hover"
          >
            Add Risk Item
          </Link>
          <Link
            to="/collections/policies"
            className="rounded-lg border border-border px-4 py-2 text-sm font-medium hover:bg-page"
          >
            Policies & renewals
          </Link>
        </div>
      </div>
    </div>
  )
}

function StatCard({
  icon: Icon,
  label,
  value,
}: {
  icon: React.ComponentType<{ size?: number }>
  label: string
  value: string
}) {
  return (
    <div className="rounded-lg border border-border bg-surface p-5 shadow-sm">
      <div className="mb-3 flex h-10 w-10 items-center justify-center rounded-lg bg-accent-light text-primary">
        <Icon size={20} />
      </div>
      <p className="text-sm text-muted">{label}</p>
      <p className="text-2xl font-semibold">{value}</p>
    </div>
  )
}
