import { useMemo } from 'react'
import { useLocation } from 'react-router-dom'
import { AppShell } from './AppShell'

export function ShellLayout() {
  const { pathname } = useLocation()

  const breadcrumbs = useMemo(() => {
    if (pathname === '/') return [{ label: 'Dashboard' }]
    if (pathname.startsWith('/collections/risk-items/new'))
      return [{ label: 'Risk Items', to: '/collections/risk-items' }, { label: 'Add' }]
    if (pathname.match(/^\/collections\/risk-items\/[^/]+$/))
      return [{ label: 'Risk Items', to: '/collections/risk-items' }, { label: 'Record' }]
    if (pathname.startsWith('/collections/risk-items'))
      return [{ label: 'Risk Items' }]
    if (pathname.match(/^\/collections\/quotations\/[^/]+$/))
      return [{ label: 'Quotations', to: '/collections/quotations' }, { label: 'Detail' }]
    if (pathname.startsWith('/collections/quotations')) return [{ label: 'Quotations' }]
    if (pathname.match(/^\/collections\/policies\/[^/]+$/))
      return [{ label: 'Policies', to: '/collections/policies' }, { label: 'Detail' }]
    if (pathname.startsWith('/collections/policies')) return [{ label: 'Policies' }]
    if (pathname.startsWith('/collections/claims/new'))
      return [{ label: 'Claims', to: '/collections/claims' }, { label: 'New claim' }]
    if (pathname.startsWith('/collections/claims')) return [{ label: 'Claims' }]
    if (pathname.startsWith('/settings/organization'))
      return [{ label: 'Settings', to: '/settings/organization' }, { label: 'Organization' }]
    return [{ label: 'Home' }]
  }, [pathname])

  return <AppShell breadcrumbs={breadcrumbs} />
}
