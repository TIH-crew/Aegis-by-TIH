import { Building2, MapPin, Users, Package, ChevronRight } from 'lucide-react'
import type { OrgMapCompanyNode, OrgMapData } from '../../services/organization-map.service'
import { formatOrgValue } from '../../services/organization-map.service'

interface OrganizationOrganogramProps {
  data: OrgMapData
  activeAccountId: string | null
  onSelectCompany: (accountId: string) => void
  selectedBranchId: string | null
  onSelectBranch: (branchId: string | null) => void
}

export function OrganizationOrganogram({
  data,
  activeAccountId,
  onSelectCompany,
  selectedBranchId,
  onSelectBranch,
}: OrganizationOrganogramProps) {
  const companies = [data.home, ...data.subsidiaries]
  const active = companies.find((c) => c.id === activeAccountId) ?? data.home

  return (
    <div className="flex h-full min-h-0 flex-col gap-4">
      <div>
        <p className="mb-2 text-xs font-semibold uppercase tracking-wide text-muted">Companies</p>
        <div className="space-y-2">
          <CompanyRow
            company={data.home}
            active={activeAccountId === data.home.id}
            onSelect={() => onSelectCompany(data.home.id)}
            depth={0}
          />
          {data.subsidiaries.map((sub) => (
            <CompanyRow
              key={sub.id}
              company={sub}
              active={activeAccountId === sub.id}
              onSelect={() => onSelectCompany(sub.id)}
              depth={1}
            />
          ))}
        </div>
      </div>

      <div className="min-h-0 flex-1 overflow-y-auto rounded-lg border border-border bg-page/60 p-3">
        <h3 className="mb-2 text-sm font-semibold text-gray-900">
          Locations — {active.name}
        </h3>
        {active.branches.length === 0 ? (
          <p className="text-xs text-muted">No branches with coordinates yet.</p>
        ) : (
          <div className="space-y-2">
            {active.branches.map((branch) => {
              const selected = selectedBranchId === branch.id
              return (
                <button
                  key={branch.id}
                  type="button"
                  onClick={() => onSelectBranch(selected ? null : branch.id)}
                  className={`w-full rounded-lg border px-3 py-2.5 text-left transition-colors ${
                    selected
                      ? 'border-primary bg-accent-light'
                      : 'border-border bg-surface hover:bg-page'
                  }`}
                >
                  <p className="flex items-center gap-1.5 text-sm font-medium text-gray-900">
                    <MapPin size={14} className="shrink-0 text-primary" />
                    <span className="truncate">{branch.name}</span>
                  </p>
                  {branch.address && (
                    <p className="mt-1 line-clamp-2 pl-5 text-xs text-muted">{branch.address}</p>
                  )}
                  <div className="mt-2 flex flex-wrap gap-3 pl-5 text-xs text-muted">
                    <span className="inline-flex items-center gap-1">
                      <Users size={12} /> {branch.employeeCount}
                    </span>
                    <span className="inline-flex items-center gap-1">
                      <Package size={12} /> {branch.itemCount}
                    </span>
                    <span className="font-medium text-gray-800">
                      {formatOrgValue(branch.totalValue)}
                    </span>
                  </div>
                </button>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}

function CompanyRow({
  company,
  active,
  onSelect,
  depth,
}: {
  company: OrgMapCompanyNode
  active: boolean
  onSelect: () => void
  depth: number
}) {
  return (
    <button
      type="button"
      onClick={onSelect}
      className={`w-full rounded-xl border px-3 py-2.5 text-left shadow-sm transition-colors ${
        active ? 'border-primary bg-accent-light' : 'border-border bg-surface hover:bg-page'
      }`}
      style={{ marginLeft: depth ? 12 : 0, width: depth ? 'calc(100% - 12px)' : '100%' }}
    >
      <p className="flex items-start gap-2 font-semibold text-gray-900">
        <Building2 size={15} className="mt-0.5 shrink-0 text-primary" />
        <span className="min-w-0 flex-1 leading-snug">{company.name}</span>
        {active && <ChevronRight size={14} className="mt-0.5 shrink-0 text-primary" />}
      </p>
      <p className="mt-1 pl-6 text-xs text-muted">
        {company.isHome ? 'Parent' : 'Subsidiary'}
        {company.industry ? ` · ${company.industry}` : ''}
      </p>
      <div className="mt-1.5 flex flex-wrap gap-x-3 gap-y-1 pl-6 text-xs text-muted">
        <span>{company.employeeCount} staff</span>
        <span>{company.itemCount} items</span>
        <span className="font-medium text-gray-800">{formatOrgValue(company.totalValue)}</span>
      </div>
    </button>
  )
}
