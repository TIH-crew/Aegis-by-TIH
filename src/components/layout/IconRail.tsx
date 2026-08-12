import {
  BarChart3,
  LayoutGrid,
  Settings,
  User,
  Wrench,
} from 'lucide-react'
import { NavLink } from 'react-router-dom'
import { BrandLogo } from '../brand/BrandLogo'
import { useAuth } from '../../context/AuthContext'
import { cn } from '../../lib/utils'

export function IconRail() {
  const { isAdmin } = useAuth()

  const items = isAdmin
    ? [
        { icon: LayoutGrid, label: 'Dashboard', to: '/' },
        { icon: BarChart3, label: 'Reports' },
        { icon: Wrench, label: 'Tools' },
        { icon: Settings, label: 'Settings', to: '/settings/organization' },
      ]
    : [{ icon: User, label: 'My profile', to: '/me' }]

  return (
    <aside className="flex w-14 shrink-0 flex-col items-center gap-2 bg-burgundy-dark py-4 text-white">
      <div className="mb-4 flex justify-center">
        <BrandLogo variant="mark" className="h-11 w-11" />
      </div>
      {items.map(({ icon: Icon, label, to }) =>
        to ? (
          <NavLink
            key={label}
            to={to}
            end={to === '/' || to === '/me'}
            title={label}
            className={({ isActive }) =>
              cn(
                'flex h-10 w-10 items-center justify-center rounded-lg transition-colors',
                isActive
                  ? 'bg-accent text-white shadow-sm'
                  : 'text-white/70 hover:bg-white/10 hover:text-white',
              )
            }
          >
            <Icon size={20} />
          </NavLink>
        ) : (
          <button
            key={label}
            type="button"
            title={label}
            className="flex h-10 w-10 items-center justify-center rounded-lg text-white/70 hover:bg-white/10 hover:text-white"
          >
            <Icon size={20} />
          </button>
        ),
      )}
    </aside>
  )
}
