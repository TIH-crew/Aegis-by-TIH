import { Bell, ChevronRight, LogOut } from 'lucide-react'
import type { ReactNode } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { GlobalSearch } from '../search/GlobalSearch'
import { CompanySwitcher } from './CompanySwitcher'
import { useAuth } from '../../context/AuthContext'

interface AppHeaderProps {
  breadcrumbs: { label: string; to?: string }[]
  leading?: ReactNode
}

export function AppHeader({ breadcrumbs, leading }: AppHeaderProps) {
  const navigate = useNavigate()
  const { user, portalUser, signOut, appRole, isAdmin } = useAuth()

  async function handleSignOut() {
    await signOut()
    navigate('/login', { replace: true })
  }

  return (
    <header className="flex h-14 shrink-0 items-center gap-3 border-b border-border bg-surface px-3 sm:px-6">
      {leading}
      <nav className="hidden min-w-0 items-center gap-1 text-sm text-muted md:flex" aria-label="Breadcrumb">
        <Link
          to={isAdmin ? '/' : '/me/claim'}
          className="shrink-0 rounded px-1 hover:text-gray-900 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"
        >
          {isAdmin ? 'Overview' : 'Home'}
        </Link>
        {breadcrumbs.map((crumb) => (
          <span key={crumb.label} className="flex min-w-0 items-center gap-1">
            <ChevronRight size={14} className="shrink-0" aria-hidden />
            {crumb.to ? (
              <Link to={crumb.to} className="truncate hover:text-gray-900">
                {crumb.label}
              </Link>
            ) : (
              <span className="truncate font-medium text-gray-900">{crumb.label}</span>
            )}
          </span>
        ))}
      </nav>

      <GlobalSearch />

      <div className="ml-auto flex items-center gap-2 sm:gap-3">
        <CompanySwitcher />
        <button
          type="button"
          className="rounded-md p-2 text-muted hover:bg-page hover:text-gray-900"
          aria-label="Notifications"
          title="Notifications"
        >
          <Bell size={18} />
        </button>
        <div className="hidden text-right text-xs sm:block">
          <p className="max-w-[160px] truncate font-medium text-gray-900">
            {portalUser?.email ?? user?.email}
          </p>
          <p className="text-muted capitalize">{appRole}</p>
        </div>
        <button
          type="button"
          aria-label="Sign out"
          title="Sign out"
          onClick={() => void handleSignOut()}
          className="flex h-8 w-8 items-center justify-center rounded-md border border-border text-gray-700 hover:bg-page focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"
        >
          <LogOut size={14} />
        </button>
      </div>
    </header>
  )
}
