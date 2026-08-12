import { Navigate, Outlet } from 'react-router-dom'
import { AegisSplashLoader } from '../brand/AegisSplashLoader'
import { useAuth } from '../../context/AuthContext'
import type { AppCapability } from '../../lib/rbac'

export function RequireCapability({ capability }: { capability: AppCapability }) {
  const { loading, can, isAdmin } = useAuth()

  if (loading) {
    return <AegisSplashLoader />
  }

  if (!can(capability) && !isAdmin) {
    return <Navigate to="/me/claim" replace />
  }

  return <Outlet />
}
