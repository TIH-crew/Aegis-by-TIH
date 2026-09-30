import { useMemo, useState } from 'react'
import { ChevronDown, Menu, Plus, Search, X } from 'lucide-react'
import { Link, NavLink, useLocation } from 'react-router-dom'
import { SidebarBrand } from '../brand/SidebarBrand'
import { EMPLOYEE_NAV, PRIMARY_NAV, pathIsActive, type NavItem } from '../../config/navigation'
import { useAuth } from '../../context/AuthContext'
import { cn } from '../../lib/utils'

function matchesNavLabel(label: string, query: string) {
  if (!query.trim()) return true
  return label.toLowerCase().includes(query.toLowerCase().trim())
}

function filterNav(items: NavItem[], query: string, can: (cap: Parameters<ReturnType<typeof useAuth>['can']>[0]) => boolean) {
  return items
    .filter((item) => !item.capability || can(item.capability))
    .map((item) => {
      const children = item.children?.filter(
        (c) => (!c.capability || can(c.capability)) && matchesNavLabel(c.label, query),
      )
      const selfMatch = matchesNavLabel(item.label, query)
      if (!selfMatch && (!children || children.length === 0) && query.trim()) return null
      return { ...item, children }
    })
    .filter(Boolean) as NavItem[]
}

export function AppSidebar({
  mobileOpen,
  onCloseMobile,
}: {
  mobileOpen?: boolean
  onCloseMobile?: () => void
}) {
  const location = useLocation()
  const { can, isAdmin, appRole } = useAuth()
  const [navQuery, setNavQuery] = useState('')
  const [expanded, setExpanded] = useState<Record<string, boolean>>({ insurance: true })

  const items = useMemo(() => {
    const source = appRole === 'employee' ? EMPLOYEE_NAV : PRIMARY_NAV
    return filterNav(source, navQuery, can)
  }, [appRole, navQuery, can])

  const aside = (
    <aside className="flex h-full w-64 shrink-0 flex-col border-r border-border bg-surface">
      <div className="border-b border-border px-4 pb-3 pt-4">
        <div className="mb-3 flex items-start justify-between gap-2">
          <SidebarBrand />
          {onCloseMobile && (
            <button
              type="button"
              className="mt-1 rounded-md p-1.5 text-muted hover:bg-page lg:hidden"
              onClick={onCloseMobile}
              aria-label="Close navigation"
            >
              <X size={18} />
            </button>
          )}
        </div>
        <div className="relative">
          <Search className="pointer-events-none absolute left-2.5 top-2.5 text-muted" size={15} aria-hidden />
          <input
            type="search"
            value={navQuery}
            onChange={(e) => setNavQuery(e.target.value)}
            placeholder="Find a section…"
            className="field-input py-2 pl-8 pr-3"
            aria-label="Search navigation"
          />
        </div>
      </div>

      <nav className="flex-1 overflow-y-auto px-2 py-3 text-sm" aria-label="Primary">
        {items.length === 0 && navQuery.trim() && (
          <p className="px-3 py-6 text-center text-xs text-muted">No matching sections.</p>
        )}

        <ul className="space-y-0.5">
          {items.map((item) => {
            const Icon = item.icon
            const active = pathIsActive(location.pathname, item)
            const hasChildren = Boolean(item.children?.length)
            const isOpen = expanded[item.id] ?? active

            return (
              <li key={item.id}>
                <div className="flex items-center gap-0.5">
                  <NavLink
                    to={item.path}
                    end={item.path === '/'}
                    onClick={onCloseMobile}
                    className={cn(
                      'flex min-w-0 flex-1 items-center gap-2.5 rounded-md px-3 py-2 transition-colors',
                      active && !hasChildren
                        ? 'bg-primary text-white'
                        : active
                          ? 'bg-accent-light font-medium text-primary'
                          : 'text-gray-700 hover:bg-page',
                    )}
                  >
                    <Icon size={17} className="shrink-0 opacity-90" aria-hidden />
                    <span className="truncate">{item.label}</span>
                  </NavLink>
                  {hasChildren && (
                    <button
                      type="button"
                      className="rounded-md p-2 text-muted hover:bg-page hover:text-gray-900"
                      aria-expanded={isOpen}
                      aria-label={`${isOpen ? 'Collapse' : 'Expand'} ${item.label}`}
                      onClick={() => setExpanded((e) => ({ ...e, [item.id]: !isOpen }))}
                    >
                      <ChevronDown
                        size={14}
                        className={cn('transition-transform', isOpen && 'rotate-180')}
                      />
                    </button>
                  )}
                </div>
                {hasChildren && isOpen && (
                  <ul className="mb-1 ml-3 mt-0.5 space-y-0.5 border-l border-border pl-2">
                    {item.children!.map((child) => {
                      const childActive = pathIsActive(location.pathname, child)
                      return (
                        <li key={child.path}>
                          <Link
                            to={child.path}
                            onClick={onCloseMobile}
                            className={cn(
                              'block rounded-md px-2.5 py-1.5 text-[13px] transition-colors',
                              childActive
                                ? 'bg-accent-light font-medium text-primary'
                                : 'text-gray-600 hover:bg-page hover:text-gray-900',
                            )}
                          >
                            {child.label}
                          </Link>
                        </li>
                      )
                    })}
                  </ul>
                )}
              </li>
            )
          })}
        </ul>
      </nav>

      {isAdmin && (
        <div className="border-t border-border p-3">
          <Link
            to="/assets/new"
            onClick={onCloseMobile}
            className="flex w-full items-center justify-center gap-2 rounded-md bg-primary px-3 py-2.5 text-sm font-medium text-white hover:bg-burgundy-dark focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"
          >
            <Plus size={16} aria-hidden />
            Add asset
          </Link>
        </div>
      )}
    </aside>
  )

  return (
    <>
      {/* Desktop */}
      <div className="hidden h-full lg:flex">{aside}</div>
      {/* Mobile drawer */}
      {mobileOpen && (
        <div className="fixed inset-0 z-40 flex lg:hidden">
          <button
            type="button"
            className="absolute inset-0 bg-black/40"
            aria-label="Close navigation overlay"
            onClick={onCloseMobile}
          />
          <div className="relative z-10 h-full shadow-xl">{aside}</div>
        </div>
      )}
    </>
  )
}

export function MobileNavButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="rounded-md p-2 text-gray-700 hover:bg-page lg:hidden"
      aria-label="Open navigation"
    >
      <Menu size={20} />
    </button>
  )
}
