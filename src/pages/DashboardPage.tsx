import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Building2, ChevronDown, ChevronRight, Network } from 'lucide-react'
import { RenewalCountdown } from '../components/dashboard/RenewalCountdown'
import { OrganizationOrganogram } from '../components/dashboard/OrganizationOrganogram'
import { LocationsMap } from '../components/maps/LocationsMap'
import {
  EntityScopeBanner,
  MetricTile,
  PageHeader,
} from '../components/workspace/WorkspaceUi'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { useSearch } from '../context/SearchContext'
import { assetNeedsAttention } from '../lib/risk-items-view'
import { formatCurrency } from '../lib/utils'
import { getNextPolicyRenewal } from '../services/account-hierarchy.service'
import {
  fetchOrganizationMap,
  fetchOrgMapItems,
  type OrgMapData,
  type OrgMapItemMarker,
} from '../services/organization-map.service'
import type { DashboardStats } from '../types'

export function DashboardPage() {
  const dataService = useDataService()
  const { riskItems } = useSearch()
  const {
    accountId,
    homeAccountId,
    homeAccountName,
    subsidiaries,
    setActiveAccountId,
    branchId,
    isBranchScoped,
  } = useAuth()
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
  const [mapOpen, setMapOpen] = useState(false)

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
    if (!mapCompanyId || !selectedBranchId || !mapOpen) {
      setMapItems([])
      return
    }
    void fetchOrgMapItems(mapCompanyId)
      .then(setMapItems)
      .catch(() => setMapItems([]))
  }, [mapCompanyId, selectedBranchId, mapOpen])

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
    if (!selectedBranchId) return []
    return mapItems.filter((i) => i.branch_id === selectedBranchId)
  }, [mapItems, selectedBranchId])

  const isParentView = Boolean(
    homeAccountId && accountId === homeAccountId && subsidiaries.length > 0,
  )
  const isSubsidiaryView = Boolean(
    homeAccountId && accountId && accountId !== homeAccountId,
  )

  const entityName =
    isSubsidiaryView
      ? subsidiaries.find((s) => s.id === accountId)?.name ?? 'Subsidiary'
      : homeAccountName ?? mapCompany?.name ?? 'Legal entity'

  const scopeLabel = isBranchScoped
    ? 'Branch scope'
    : isSubsidiaryView
      ? 'Subsidiary'
      : isParentView
        ? 'Parent group entity'
        : 'Legal entity'

  const attention = useMemo(() => {
    const rows: { id: string; name: string; tag: string; issue: string }[] = []
    for (const item of riskItems) {
      const issue = assetNeedsAttention(item)
      if (!issue) continue
      rows.push({ id: item.id, name: item.name, tag: item.asset_tag, issue })
      if (rows.length >= 12) break
    }
    return rows
  }, [riskItems])

  const movementsPreview = useMemo(() => {
    return [...riskItems]
      .filter((i) => i.assignment_status === 'checked_out' || i.assignment_status === 'assigned')
      .sort((a, b) => b.updated_at.localeCompare(a.updated_at))
      .slice(0, 6)
  }, [riskItems])

  return (
    <div className="space-y-5">
      <PageHeader
        title="Overview"
        description="Operational summary for the selected legal entity. Figures are never rolled up across parent and subsidiaries."
      />

      <EntityScopeBanner
        entityName={entityName}
        scopeLabel={scopeLabel}
        note={
          isParentView
            ? 'Showing this entity only — switch company to view a subsidiary without double-counting.'
            : isBranchScoped
              ? 'Your access is limited to your branch.'
              : undefined
        }
      />

      {loading && <p className="text-sm text-muted">Loading overview…</p>}

      {stats && (
        <div className="grid grid-cols-2 gap-3 md:grid-cols-3 xl:grid-cols-6">
          <MetricTile label="Asset count" value={String(stats.totalRecords)} hint="Register rows in scope" />
          <MetricTile
            label="Acquisition cost"
            value={
              stats.acquisitionCostCount > 0
                ? formatCurrency(stats.acquisitionCost)
                : '—'
            }
            hint={
              stats.acquisitionCostCount > 0
                ? `From purchase value · ${stats.acquisitionCostCount} of ${stats.totalRecords} assets`
                : 'No purchase values captured yet'
            }
          />
          <MetricTile
            label="Net book value"
            value="Not connected"
            unavailable
            hint="Requires GL / depreciation integration"
          />
          <MetricTile
            label="Insured / declared value"
            value={
              stats.insuredWithUsCount > 0
                ? formatCurrency(stats.insuredDeclaredValue)
                : '—'
            }
            hint="Schedule unit cost for items insured with us — not book value"
          />
          <MetricTile
            label="Reconciliation exceptions"
            value="Not connected"
            unavailable
            hint="GL ↔ register reconciliation pending"
          />
          <MetricTile
            label="Period-close status"
            value="Not connected"
            unavailable
            hint="Monthly close workflow pending"
          />
        </div>
      )}

      {nextRenewal && (
        <RenewalCountdown
          renewalDate={nextRenewal.renewal_date}
          policyNumber={nextRenewal.policy_number}
          insurer={nextRenewal.insurer}
        />
      )}

      <div className="grid gap-4 lg:grid-cols-5">
        <section className="ws-panel lg:col-span-3">
          <div className="flex items-center justify-between border-b border-border px-4 py-3">
            <div>
              <h2 className="text-sm font-semibold text-ink">Needs attention</h2>
              <p className="text-xs text-muted">Prioritised exceptions from the live register</p>
            </div>
            <Link to="/assets?view=attention" className="text-xs font-medium text-primary hover:underline">
              View all
            </Link>
          </div>
          {attention.length === 0 ? (
            <p className="px-4 py-8 text-sm text-muted">No open exceptions in the current scope.</p>
          ) : (
            <ul className="divide-y divide-border">
              {attention.map((row) => (
                <li key={row.id}>
                  <Link
                    to={`/assets/${row.id}`}
                    className="flex flex-wrap items-center justify-between gap-2 px-4 py-2.5 text-sm hover:bg-page"
                  >
                    <div className="min-w-0">
                      <p className="truncate font-medium text-ink">{row.name}</p>
                      <p className="font-mono text-[11px] text-muted">{row.tag}</p>
                    </div>
                    <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">
                      {row.issue}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </section>

        <section className="ws-panel lg:col-span-2">
          <div className="border-b border-border px-4 py-3">
            <h2 className="text-sm font-semibold text-ink">Recent custody activity</h2>
            <p className="text-xs text-muted">Assignments and check-outs in this entity</p>
          </div>
          {movementsPreview.length === 0 ? (
            <p className="px-4 py-8 text-sm text-muted">No recent custody movements.</p>
          ) : (
            <ul className="divide-y divide-border">
              {movementsPreview.map((item) => (
                <li key={item.id} className="px-4 py-2.5 text-sm">
                  <Link to={`/assets/${item.id}`} className="font-medium text-ink hover:underline">
                    {item.name}
                  </Link>
                  <p className="text-xs text-muted">
                    {item.assignment_status.replace('_', ' ')}
                    {item.employee_name ? ` · ${item.employee_name}` : ''}
                  </p>
                </li>
              ))}
            </ul>
          )}
          <div className="border-t border-border px-4 py-2.5">
            <Link to="/movements" className="text-xs font-medium text-primary hover:underline">
              Open movements
            </Link>
          </div>
        </section>
      </div>

      {isParentView && (
        <section className="ws-panel">
          <div className="border-b border-border px-4 py-3">
            <h2 className="text-sm font-semibold">Subsidiary companies</h2>
            <p className="text-xs text-muted">
              Open a subsidiary to work in its register — totals are never combined with the parent.
            </p>
          </div>
          <ul className="divide-y divide-border">
            {subsidiaries.map((sub) => (
              <li key={sub.id} className="flex flex-wrap items-center justify-between gap-3 px-4 py-3">
                <div className="flex items-center gap-3">
                  <div className="flex h-8 w-8 items-center justify-center rounded-md bg-accent-light text-primary">
                    <Building2 size={15} />
                  </div>
                  <div>
                    <p className="text-sm font-medium text-ink">{sub.name}</p>
                    <p className="text-xs text-muted">{sub.industry ?? 'Subsidiary'}</p>
                  </div>
                </div>
                <button
                  type="button"
                  onClick={() => setActiveAccountId(sub.id)}
                  className="rounded-md border border-border px-3 py-1.5 text-sm font-medium hover:bg-page"
                >
                  Open entity
                </button>
              </li>
            ))}
          </ul>
        </section>
      )}

      <section className="ws-panel">
        <button
          type="button"
          className="flex w-full items-center justify-between px-4 py-3 text-left"
          onClick={() => setMapOpen((o) => !o)}
          aria-expanded={mapOpen}
        >
          <div>
            <h2 className="flex items-center gap-2 text-sm font-semibold text-ink">
              <Network size={15} className="text-primary" />
              Organisation map
            </h2>
            <p className="text-xs text-muted">Secondary view — locations and branch focus</p>
          </div>
          {mapOpen ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
        </button>
        {mapOpen && (
          <div className="grid min-h-[420px] gap-0 border-t border-border lg:grid-cols-[minmax(280px,320px)_minmax(0,1fr)]">
            <div className="flex min-h-0 flex-col overflow-hidden border-b border-border p-4 lg:border-b-0 lg:border-r">
              {orgMapLoading && <p className="text-sm text-muted">Loading organisation…</p>}
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
              <LocationsMap
                className="h-[min(420px,55vh)] w-full rounded-lg border border-border"
                branches={mapBranches}
                items={visibleMapItems}
                highlightBranchId={selectedBranchId}
                showAssetMarkers={Boolean(selectedBranchId)}
                maxAssetMarkers={40}
                lockToSouthAfrica
                resolveItemPosition={(item) => {
                  const branch = mapBranches.find((b) => b.id === item.branch_id)
                  if (item.latitude != null && item.longitude != null) {
                    return { lat: item.latitude, lng: item.longitude }
                  }
                  if (!branch?.latitude || !branch?.longitude) return null
                  const hash = Array.from(item.id).reduce((n, ch) => n + ch.charCodeAt(0), 0)
                  const angle = (hash % 360) * (Math.PI / 180)
                  const radius = 0.0008 + (hash % 7) * 0.00015
                  return {
                    lat: branch.latitude + Math.sin(angle) * radius,
                    lng: branch.longitude + Math.cos(angle) * radius,
                  }
                }}
              />
            </div>
          </div>
        )}
      </section>
    </div>
  )
}
