import { useState } from 'react'
import { Outlet } from 'react-router-dom'
import { SearchProvider } from '../../context/SearchContext'
import { AppHeader } from './AppHeader'
import { AppSidebar, MobileNavButton } from './AppSidebar'

interface AppShellProps {
  breadcrumbs?: { label: string; to?: string }[]
}

export function AppShell({ breadcrumbs = [] }: AppShellProps) {
  const [mobileNavOpen, setMobileNavOpen] = useState(false)

  return (
    <SearchProvider>
      <div className="flex h-screen overflow-hidden bg-page">
        <AppSidebar mobileOpen={mobileNavOpen} onCloseMobile={() => setMobileNavOpen(false)} />
        <div className="flex min-w-0 flex-1 flex-col">
          <AppHeader
            breadcrumbs={breadcrumbs}
            leading={<MobileNavButton onClick={() => setMobileNavOpen(true)} />}
          />
          <main className="flex-1 overflow-auto">
            <div className="mx-auto w-full max-w-[1400px] px-4 py-5 sm:px-6 lg:px-8">
              <Outlet />
            </div>
          </main>
        </div>
      </div>
    </SearchProvider>
  )
}
