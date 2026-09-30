import { useMemo } from 'react'
import { useLocation } from 'react-router-dom'
import { AppShell } from './AppShell'

function crumbsFor(pathname: string): { label: string; to?: string }[] {
  if (pathname === '/') return [{ label: 'Overview' }]

  if (pathname.includes('/risk-items/new') || pathname.endsWith('/assets/new'))
    return [{ label: 'Assets', to: '/assets' }, { label: 'Add asset' }]
  if (/\/(assets|collections\/risk-items)\/[^/]+$/.test(pathname))
    return [{ label: 'Assets', to: '/assets' }, { label: 'Asset detail' }]
  if (pathname.startsWith('/assets') || pathname.startsWith('/collections/risk-items'))
    return [{ label: 'Assets' }]

  if (pathname.startsWith('/movements') || pathname.startsWith('/forms/'))
    return [{ label: 'Movements' }]

  if (pathname.startsWith('/finance')) return [{ label: 'Finance' }]
  if (pathname.startsWith('/tax')) return [{ label: 'Tax' }]

  if (pathname.startsWith('/insurance/policies') || pathname.startsWith('/collections/policies'))
    return [{ label: 'Insurance', to: '/insurance' }, { label: 'Policies' }]
  if (pathname.startsWith('/insurance/quotations') || pathname.startsWith('/collections/quotations'))
    return [{ label: 'Insurance', to: '/insurance' }, { label: 'Quotations' }]
  if (pathname.startsWith('/insurance/claims') || pathname.startsWith('/collections/claims'))
    return [{ label: 'Insurance', to: '/insurance' }, { label: 'Claims' }]
  if (pathname.startsWith('/insurance/endorsements') || pathname === '/reports')
    return [{ label: 'Reports' }]
  if (pathname.startsWith('/insurance/pi-members') || pathname.startsWith('/collections/pi-members'))
    return [{ label: 'Insurance', to: '/insurance' }, { label: 'PI members' }]
  if (pathname.startsWith('/insurance')) return [{ label: 'Insurance' }]

  if (pathname.startsWith('/people') || pathname.startsWith('/collections/employees')) {
    if (pathname === '/people' || pathname === '/collections/employees') return [{ label: 'People' }]
    return [{ label: 'People', to: '/people' }, { label: 'Profile' }]
  }

  if (pathname.startsWith('/settings')) return [{ label: 'Settings' }]
  if (pathname.startsWith('/me/claim')) return [{ label: 'Submit claim' }]
  if (pathname.startsWith('/me/assets')) return [{ label: 'My assets' }]
  if (pathname.startsWith('/me')) return [{ label: 'My profile' }]

  return [{ label: 'Workspace' }]
}

export function ShellLayout() {
  const { pathname } = useLocation()
  const breadcrumbs = useMemo(() => crumbsFor(pathname), [pathname])
  return <AppShell breadcrumbs={breadcrumbs} />
}
