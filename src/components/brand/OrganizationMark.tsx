import { Building2 } from 'lucide-react'
import { cn } from '../../lib/utils'
import { useOrganization } from '../../context/OrganizationContext'

const MARK_CLASS = 'rounded-full object-cover aspect-square bg-accent-light'

interface OrganizationMarkProps {
  className?: string
  size?: 'sm' | 'md' | 'lg'
}

const sizeClass = {
  sm: 'h-10 w-10 text-xs',
  md: 'h-12 w-12 text-sm',
  lg: 'h-16 w-16 text-base',
}

function initialsFromName(name: string) {
  const parts = name.trim().split(/\s+/).filter(Boolean)
  if (parts.length >= 2) return `${parts[0][0]}${parts[1][0]}`.toUpperCase()
  return name.slice(0, 2).toUpperCase()
}

export function OrganizationMark({ className, size = 'md' }: OrganizationMarkProps) {
  const { organization, loading } = useOrganization()
  const sizeStyles = sizeClass[size]

  if (loading) {
    return (
      <div
        className={cn(MARK_CLASS, sizeStyles, 'animate-pulse bg-gray-200', className)}
        aria-hidden
      />
    )
  }

  if (organization?.logo_url) {
    return (
      <img
        src={organization.logo_url}
        alt={organization.name ? `${organization.name} logo` : 'Organization logo'}
        className={cn(MARK_CLASS, sizeStyles, 'ring-1 ring-black/5', className)}
        draggable={false}
      />
    )
  }

  const label = organization?.name?.trim() || 'Org'

  return (
    <div
      className={cn(
        MARK_CLASS,
        sizeStyles,
        'flex items-center justify-center font-semibold text-primary ring-1 ring-primary/10',
        className,
      )}
      title={organization?.name ?? 'Set up your organization'}
    >
      {label === 'Org' ? (
        <Building2 size={size === 'lg' ? 24 : size === 'md' ? 20 : 16} />
      ) : (
        initialsFromName(label)
      )}
    </div>
  )
}
