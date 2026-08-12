import { Link } from 'react-router-dom'
import { BRAND } from '../../config/brand'
import { useOrganization } from '../../context/OrganizationContext'
import { OrganizationMark } from './OrganizationMark'

export function SidebarBrand() {
  const { organization } = useOrganization()

  return (
    <Link to="/settings/organization" className="mb-3 flex items-center gap-3 rounded-lg p-1 -m-1 hover:bg-accent-light/40 transition-colors">
      <OrganizationMark size="md" />
      <div className="min-w-0 flex-1">
        <p className="truncate text-base font-semibold text-burgundy">{BRAND.name}</p>
        <p className="text-[11px] font-medium uppercase tracking-[0.12em] text-burgundy-dark/75">
          {BRAND.tagline}
        </p>
        {organization?.name && organization.name !== 'TIH Commercial Demo' && (
          <p className="truncate text-[11px] text-muted mt-0.5">{organization.name}</p>
        )}
      </div>
    </Link>
  )
}
