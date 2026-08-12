import { Building2, MapPin, Users, Package } from 'lucide-react'
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

  return (
    <div className="space-y-4">
      <div className="overflow-x-auto pb-2">
        <div className="mx-auto flex min-w-[640px] flex-col items-center gap-4">
          <CompanyCard
            company={data.home}
            active={activeAccountId === data.home.id}
            onSelect={() => onSelectCompany(data.home.id)}
          />

          {data.subsidiaries.length > 0 && (
            <>
              <div className="h-6 w-px bg-border" />
              <div className="flex flex-wrap justify-center gap-4">
                {data.subsidiaries.map((sub) => (
                  <div key={sub.id} className="flex flex-col items-center gap-2">
                    <div className="h-4 w-px bg-border" />
                    <CompanyCard
                      company={sub}
                      active={activeAccountId === sub.id}
                      onSelect={() => onSelectCompany(sub.id)}
                    />
                  </div>
                ))}
              </div>
            </>
          )}
        </div>
      </div>

      <div className="rounded-lg border border-border bg-page/60 p-4">
        <h3 className="mb-3 text-sm font-semibold text-gray-900">
          Locations
          {activeAccountId
            ? ` — ${companies.find((c) => c.id === activeAccountId)?.name ?? 'Company'}`
            : ''}
        </h3>
        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {(companies.find((c) => c.id === activeAccountId) ?? data.home).branches.map((branch) => {
            const selected = selectedBranchId === branch.id
            return (
              <button
                key={branch.id}
                type="button"
                onClick={() => onSelectBranch(selected ? null : branch.id)}
                className={`rounded-lg border px-3 py-3 text-left transition-colors ${
                  selected
                    ? 'border-primary bg-accent-light'
                    : 'border-border bg-surface hover:bg-page'
                }`}
              >
                <p className="flex items-center gap-1.5 font-medium text-gray-900">
                  <MapPin size={14} className="text-primary" />
                  {branch.name}
                </p>
                {branch.address && (
                  <p className="mt-1 line-clamp-2 text-xs text-muted">{branch.address}</p>
                )}
                <div className="mt-2 flex flex-wrap gap-3 text-xs text-muted">
                  <span className="inline-flex items-center gap-1">
                    <Users size={12} /> {branch.employeeCount} staff
                  </span>
                  <span className="inline-flex items-center gap-1">
                    <Package size={12} /> {branch.itemCount} items
                  </span>
                  <span className="font-medium text-gray-800">
                    {formatOrgValue(branch.totalValue)}
                  </span>
                </div>
              </button>
            )
          })}
        </div>
      </div>
    </div>
  )
}

function CompanyCard({
  company,
  active,
  onSelect,
}: {
  company: OrgMapCompanyNode
  active: boolean
  onSelect: () => void
}) {
  return (
    <button
      type="button"
      onClick={onSelect}
      className={`w-64 rounded-xl border px-4 py-3 text-left shadow-sm transition-colors ${
        active ? 'border-primary bg-accent-light' : 'border-border bg-surface hover:bg-page'
      }`}
    >
      <p className="flex items-center gap-2 font-semibold text-gray-900">
        <Building2 size={16} className="text-primary" />
        {company.name}
      </p>
      <p className="mt-1 text-xs text-muted">
        {company.isHome ? 'Parent / home' : 'Subsidiary'}
        {company.industry ? ` · ${company.industry}` : ''}
      </p>
      <div className="mt-2 flex flex-wrap gap-3 text-xs text-muted">
        <span>{company.employeeCount} staff</span>
        <span>{company.itemCount} items</span>
        <span className="font-medium text-gray-800">{formatOrgValue(company.totalValue)}</span>
      </div>
    </button>
  )
}
