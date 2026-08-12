import { Navigate, Outlet } from 'react-router-dom'
import { AegisSplashLoader } from '../brand/AegisSplashLoader'
import { useAuth } from '../../context/AuthContext'

export function RequireOrganization() {
  const { portalUser, loading } = useAuth()

  if (loading) {
    return <AegisSplashLoader />
  }

  if (!portalUser) {
    return <Navigate to="/no-access" replace />
  }

  return <Outlet />
}
