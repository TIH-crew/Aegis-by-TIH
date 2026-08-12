import { Navigate, Outlet } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'

export function RequireOrganization() {
  const { portalUser, loading } = useAuth()

  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-page text-sm text-muted">
        Loading organization...
      </div>
    )
  }

  if (!portalUser) {
    return <Navigate to="/no-access" replace />
  }

  return <Outlet />
}
