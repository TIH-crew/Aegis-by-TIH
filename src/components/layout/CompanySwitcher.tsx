import { Building2, ChevronDown } from 'lucide-react'
import { useAuth } from '../../context/AuthContext'
import { useOrganization } from '../../context/OrganizationContext'

export function CompanySwitcher() {
  const {
    accountId,
    homeAccountId,
    homeAccountName,
    subsidiaries,
    setActiveAccountId,
  } = useAuth()
  const { organization } = useOrganization()

  if (!homeAccountId || !accountId) return null

  if (subsidiaries.length === 0) {
    return (
      <div className="hidden items-center gap-2 rounded-lg border border-border bg-page px-3 py-1.5 text-xs text-muted lg:flex">
        <Building2 size={14} />
        <span className="max-w-40 truncate font-medium text-gray-900">
          {organization?.name ?? homeAccountName ?? 'Company'}
        </span>
      </div>
    )
  }

  return (
    <label className="relative flex items-center gap-1.5">
      <Building2 size={14} className="text-muted" />
      <select
        className="max-w-56 appearance-none rounded-lg border border-border bg-page py-1.5 pl-2 pr-7 text-xs font-medium text-gray-900 outline-none focus:ring-2 focus:ring-accent/30"
        value={accountId}
        onChange={(e) => setActiveAccountId(e.target.value)}
        aria-label="Switch company"
      >
        <option value={homeAccountId}>
          {homeAccountName ?? 'Parent company'} (parent)
        </option>
        {subsidiaries.map((sub) => (
          <option key={sub.id} value={sub.id}>
            {sub.name}
          </option>
        ))}
      </select>
      <ChevronDown size={12} className="pointer-events-none absolute right-2 text-muted" />
    </label>
  )
}
