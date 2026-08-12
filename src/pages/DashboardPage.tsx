import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Building2, Shield, FileText, DollarSign, AlertTriangle, Network } from 'lucide-react'
import { RenewalCountdown } from '../components/dashboard/RenewalCountdown'
import { OrganizationOrganogram } from '../components/dashboard/OrganizationOrganogram'
import { LocationsMap } from '../components/maps/LocationsMap'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { getNextPolicyRenewal } from '../services/account-hierarchy.service'
import {
  fetchOrganizationMap,
  fetchOrgMapItems,
  type OrgMapData,
  type OrgMapItemMarker,
} from '../services/organization-map.service'
import type { DashboardStats } from '../types'
import { formatCurrency } from '../lib/utils'

export function DashboardPage() {
  const dataService = useDataService()
  const { accountId, homeAccountId, homeAccountName, subsidiaries, setActiveAccountId, branchId, isBranchScoped } =
    useAuth()
  const [stats, setStats] = useState<DashboardStats | null>(null)
  const [loading, setLoading] = useState(true)
  const [nextRenewal, setNextRenewal] = useState<{
    renewal_date: string
    policy_number: string
    insurer: string | null
  } | null>(null)
  const [orgMap, setOrgMap] = useState<OrgMapData | null>(null)
  const [mapItems, setMapItems] = useState<OrgMapItemMarker[]>([])
  const [mapCompanyId, setMapCompanyId] = useState<string | null>(null)
  const [selectedBranchId, setSelectedBranchId] = useState<string | null>(null)
  const [orgMapLoading, setOrgMapLoading] = useState(false)

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

  useEffect(() => {
    if (!homeAccountId) return
    setOrgMapLoading(true)
    void fetchOrganizationMap({
      homeAccountId,
      homeAccountName,
    })
      .then((data) => {
        setOrgMap(data)
        setMapCompanyId((prev) => prev ?? accountId ?? data.home.id)
        if (branchId) setSelectedBranchId(branchId)
      })
      .catch(() => setOrgMap(null))
      .finally(() => setOrgMapLoading(false))
  }, [homeAccountId, homeAccountName, accountId, branchId])

  useEffect(() => {
    if (!mapCompanyId) return
    void fetchOrgMapItems(mapCompanyId)
      .then(setMapItems)
      .catch(() => setMapItems([]))
  }, [mapCompanyId])

  const mapCompany = useMemo(() => {
    if (!orgMap || !mapCompanyId) return null
    if (orgMap.home.id === mapCompanyId) return orgMap.home
    return orgMap.subsidiaries.find((s) => s.id === mapCompanyId) ?? orgMap.home
  }, [orgMap, mapCompanyId])

  const mapBranches = useMemo(() => {
    if (!mapCompany) return []
    const list = mapCompany.branches
      .filter((b) => b.latitude || b.longitude)
      .map((b) => ({
        id: b.id,
        name: b.name,
        address: b.address ?? '',
        latitude: b.latitude,
        longitude: b.longitude,
        employeeCount: b.employeeCount,
        itemCount: b.itemCount,
        totalValue: b.totalValue,
      }))
    if (isBranchScoped && branchId) return list.filter((b) => b.id === branchId)
    return list
  }, [mapCompany, isBranchScoped, branchId])

  const visibleMapItems = useMemo(() => {
    if (!selectedBranchId) return mapItems
    return mapItems.filter((i) => i.branch_id === selectedBranchId)
  }, [mapItems, selectedBranchId])

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
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5">
          <StatCard icon={Shield} label="Total Assets" value={String(stats.totalRecords)} />
          <StatCard
            icon={FileText}
            label="Insured with us"
            value={String(stats.insuredWithUsCount)}
          />
          <StatCard icon={AlertTriangle} label="In Pipeline" value={String(stats.pipelineCount)} />
          <StatCard icon={AlertTriangle} label="Uninsured" value={String(stats.uninsuredCount)} />
          <StatCard icon={DollarSign} label="Total Value" value={formatCurrency(stats.totalValue)} />
        </div>
      )}

      <div className="rounded-xl border border-border bg-surface shadow-sm">
        <div className="border-b border-border px-4 py-3">
          <h2 className="flex items-center gap-2 font-semibold">
            <Network size={16} className="text-primary" />
            Organization map
          </h2>
          <p className="text-xs text-muted">
            {isBranchScoped
              ? 'Your access is limited to your company branch — parent group companies are hidden.'
              : 'South Africa locations — select a company, then a branch, to focus staff and assets.'}
          </p>
        </div>
        <div className="grid min-h-[560px] gap-0 lg:grid-cols-[minmax(300px,360px)_minmax(0,1fr)]">
          <div className="flex min-h-0 flex-col overflow-hidden border-b border-border p-4 lg:border-b-0 lg:border-r">
            {orgMapLoading && <p className="text-sm text-muted">Loading organization…</p>}
            {orgMap && mapCompanyId && (
              <OrganizationOrganogram
                data={orgMap}
                activeAccountId={mapCompanyId}
                onSelectCompany={(id) => {
                  if (isBranchScoped) return
                  setMapCompanyId(id)
                  setSelectedBranchId(null)
                  setActiveAccountId(id)
                }}
                selectedBranchId={selectedBranchId}
                onSelectBranch={setSelectedBranchId}
              />
            )}
          </div>
          <div className="min-w-0 p-4">
            <div className="mb-2 flex flex-wrap items-end justify-between gap-2">
              <div>
                <h3 className="text-sm font-semibold text-gray-900">Locations & asset values</h3>
                <p className="text-xs text-muted">
                  {mapCompany?.name ?? 'Company'}
                  {selectedBranchId
                    ? ` · ${mapBranches.find((b) => b.id === selectedBranchId)?.name ?? 'Branch'}`
                    : ' · all branches'}
                </p>
              </div>
            </div>
            <LocationsMap
              className="h-[min(520px,65vh)] w-full rounded-xl border border-border"
              branches={mapBranches}
              items={visibleMapItems}
              highlightBranchId={selectedBranchId}
              lockToSouthAfrica
              resolveItemPosition={(item) => {
                if (item.latitude != null && item.longitude != null) {
                  return { lat: item.latitude, lng: item.longitude }
                }
                const branch = mapBranches.find((b) => b.id === item.branch_id)
                if (!branch) return null
                return { lat: branch.latitude, lng: branch.longitude }
              }}
            />
          </div>
        </div>
      </div>

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
          <Link
            to="/collections/pi-members"
            className="rounded-lg border border-border px-4 py-2 text-sm font-medium hover:bg-page"
          >
            PI members
          </Link>
          <Link
            to="/reports"
            className="rounded-lg border border-border px-4 py-2 text-sm font-medium hover:bg-page"
          >
            Policy activity reports
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
