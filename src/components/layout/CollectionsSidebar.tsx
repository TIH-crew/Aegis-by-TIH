import { useMemo, useState, type ReactNode } from 'react'
import { ChevronDown, Plus, Search } from 'lucide-react'
import { Link, useLocation } from 'react-router-dom'
import { SidebarBrand } from '../brand/SidebarBrand'
import { COLLECTIONS } from '../../config/collections'
import { useAuth } from '../../context/AuthContext'
import type { AppCapability } from '../../lib/rbac'
import { cn } from '../../lib/utils'

const forms = [
  { label: 'Assign to', path: '/forms/assign-to', capability: 'forms_custody' as AppCapability },
  { label: 'Check out', path: '/forms/check-out', capability: 'forms_custody' as AppCapability },
  { label: 'Check in', path: '/forms/check-in', capability: 'forms_custody' as AppCapability },
]

const collectionCapability: Record<string, AppCapability> = {
  risk_items: 'risk_items',
  quotations: 'quotations',
  policies: 'policies',
  claims: 'claims',
  employees: 'employees',
}

function matchesNavLabel(label: string, query: string) {
  if (!query.trim()) return true
  return label.toLowerCase().includes(query.toLowerCase().trim())
}

export function CollectionsSidebar() {
  const location = useLocation()
  const { can, isAdmin, appRole } = useAuth()
  const [navQuery, setNavQuery] = useState('')

  const filteredCollections = useMemo(
    () =>
      COLLECTIONS.filter((item) => {
        if (!matchesNavLabel(item.label, navQuery)) return false
        const cap = collectionCapability[item.key]
        return !cap || can(cap)
      }),
    [navQuery, can],
  )
  const filteredForms = useMemo(
    () =>
      forms.filter((form) => matchesNavLabel(form.label, navQuery) && can(form.capability)),
    [navQuery, can],
  )

  const employeeLinks = [
    { label: 'My profile', path: '/me' },
    { label: 'My linked items', path: '/me/assets' },
  ].filter((item) => matchesNavLabel(item.label, navQuery))

  const hasNavResults =
    filteredCollections.length > 0 ||
    filteredForms.length > 0 ||
    (!isAdmin && employeeLinks.length > 0)

  return (
    <aside className="flex w-64 shrink-0 flex-col border-r border-border bg-surface">
      <div className="border-b border-border p-4">
        <SidebarBrand />
        <div className="relative">
          <Search className="absolute left-2.5 top-2.5 text-muted" size={16} />
          <input
            type="search"
            value={navQuery}
            onChange={(e) => setNavQuery(e.target.value)}
            placeholder="Search side nav"
            className="w-full rounded-md border border-border py-2 pl-8 pr-3 text-sm outline-none focus:ring-2 focus:ring-accent/25"
            aria-label="Search side navigation"
          />
        </div>
      </div>

      <nav className="flex-1 overflow-y-auto p-3 text-sm">
        {!hasNavResults && navQuery.trim() && (
          <p className="px-2 py-4 text-center text-xs text-muted">No navigation matches.</p>
        )}

        {appRole === 'employee' && employeeLinks.length > 0 && (
          <Section title="My workspace">
            {employeeLinks.map((item) => {
              const active =
                item.path === '/me'
                  ? location.pathname === '/me'
                  : location.pathname.startsWith(item.path)
              return (
                <Link
                  key={item.path}
                  to={item.path}
                  className={cn(
                    'mb-0.5 flex items-center rounded-md px-3 py-2 transition-colors',
                    active
                      ? 'bg-accent-light font-medium text-primary'
                      : 'text-gray-700 hover:bg-accent-light/50',
                  )}
                >
                  {item.label}
                </Link>
              )
            })}
          </Section>
        )}

        {filteredCollections.length > 0 && (
          <Section title={`Collections (${filteredCollections.length})`}>
            {filteredCollections.map((item) => {
              const active = location.pathname.startsWith(item.path)
              return (
                <Link
                  key={item.key}
                  to={item.path}
                  className={cn(
                    'mb-0.5 flex items-center rounded-md px-3 py-2 transition-colors',
                    active
                      ? 'bg-accent-light font-medium text-primary'
                      : 'text-gray-700 hover:bg-accent-light/50',
                  )}
                >
                  {item.label}
                </Link>
              )
            })}
          </Section>
        )}

        {filteredForms.length > 0 && (
          <Section title={`Forms (${filteredForms.length})`}>
            {filteredForms.map((form) => {
              const active = location.pathname.startsWith(form.path)
              return (
                <Link
                  key={form.path}
                  to={form.path}
                  className={cn(
                    'mb-0.5 flex w-full items-center rounded-md px-3 py-2 text-left transition-colors',
                    active
                      ? 'bg-accent-light font-medium text-primary'
                      : 'text-gray-700 hover:bg-accent-light/50',
                  )}
                >
                  {form.label}
                </Link>
              )
            })}
          </Section>
        )}
      </nav>

      {isAdmin && (
        <div className="border-t border-border p-4">
          <Link
            to="/collections/risk-items/new"
            className="flex w-full items-center justify-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-medium text-white shadow-sm hover:bg-burgundy-dark"
          >
            <Plus size={16} />
            Create +
          </Link>
        </div>
      )}
    </aside>
  )
}

function Section({ title, children }: { title: string; children: ReactNode }) {
  return (
    <div className="mb-4">
      <button
        type="button"
        className="mb-1 flex w-full items-center justify-between px-2 py-1 text-xs font-semibold uppercase tracking-wide text-muted"
      >
        {title}
        <ChevronDown size={14} />
      </button>
      {children}
    </div>
  )
}
