import { useMemo } from 'react'
import { useAuth } from '../context/AuthContext'
import { createSupabaseDataService } from '../services/supabase-data.service'

export function useDataService() {
  const { accountId, branchId } = useAuth()

  return useMemo(() => {
    if (!accountId) return null
    return createSupabaseDataService(accountId, branchId)
  }, [accountId, branchId])
}
