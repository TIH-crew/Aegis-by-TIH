import { Bell, ChevronRight, Home, LogOut, User } from 'lucide-react'
import { Link, useNavigate } from 'react-router-dom'
import { GlobalSearch } from '../search/GlobalSearch'
import { CompanySwitcher } from './CompanySwitcher'
import { useAuth } from '../../context/AuthContext'

interface AppHeaderProps {
  breadcrumbs: { label: string; to?: string }[]
}

export function AppHeader({ breadcrumbs }: AppHeaderProps) {
  const navigate = useNavigate()
  const { user, portalUser, signOut, appRole, isAdmin } = useAuth()

  async function handleSignOut() {
    await signOut()
    navigate('/login', { replace: true })
  }

  return (
    <header className="flex h-14 items-center gap-4 border-b border-border bg-surface px-6">
      <nav className="flex items-center gap-1 text-sm text-muted">
        <Link to={isAdmin ? '/' : '/me'} className="hover:text-gray-900">
          <Home size={16} />
        </Link>
        {breadcrumbs.map((crumb) => (
          <span key={crumb.label} className="flex items-center gap-1">
            <ChevronRight size={14} />
            {crumb.to ? (
              <Link to={crumb.to} className="hover:text-gray-900">
                {crumb.label}
              </Link>
            ) : (
              <span className="font-medium text-gray-900">{crumb.label}</span>
            )}
          </span>
        ))}
      </nav>

      <GlobalSearch />

      <div className="ml-auto flex items-center gap-3">
        <CompanySwitcher />
        <button type="button" className="relative rounded-full p-2 hover:bg-gray-100">
          <Bell size={18} />
          <span className="absolute right-1 top-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-[10px] text-white">
            12
          </span>
        </button>
        <div className="hidden text-right text-xs sm:block">
          <p className="font-medium text-gray-900">{portalUser?.email ?? user?.email}</p>
          <p className="text-muted capitalize">{appRole}</p>
        </div>
        <button
          type="button"
          title="Sign out"
          onClick={() => void handleSignOut()}
          className="flex h-8 w-8 items-center justify-center rounded-full bg-gray-200 hover:bg-gray-300"
        >
          <LogOut size={14} />
        </button>
        <button
          type="button"
          className="flex h-8 w-8 items-center justify-center rounded-full bg-gray-200"
        >
          <User size={16} />
        </button>
      </div>
    </header>
  )
}
