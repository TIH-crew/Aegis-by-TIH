import { Outlet } from 'react-router-dom'
import { SearchProvider } from '../../context/SearchContext'
import { AppHeader } from './AppHeader'
import { CollectionsSidebar } from './CollectionsSidebar'
import { IconRail } from './IconRail'

interface AppShellProps {
  breadcrumbs?: { label: string; to?: string }[]
}

export function AppShell({ breadcrumbs = [] }: AppShellProps) {
  return (
    <SearchProvider>
      <div className="flex h-screen overflow-hidden bg-page">
        <IconRail />
        <CollectionsSidebar />
        <div className="flex min-w-0 flex-1 flex-col">
          <AppHeader breadcrumbs={breadcrumbs} />
          <main className="flex-1 overflow-auto p-6">
            <Outlet />
          </main>
        </div>
      </div>
    </SearchProvider>
  )
}
