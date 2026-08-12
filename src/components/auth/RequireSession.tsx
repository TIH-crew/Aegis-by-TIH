import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { AegisSplashLoader } from '../brand/AegisSplashLoader'
import { useAuth } from '../../context/AuthContext'

export function RequireSession() {
  const { session, loading } = useAuth()
  const location = useLocation()

  if (loading) {
    return <AegisSplashLoader />
  }

  if (!session) {
    return <Navigate to="/login" replace state={{ from: location.pathname }} />
  }

  return <Outlet />
}
