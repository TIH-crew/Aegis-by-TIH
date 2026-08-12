import { useMemo } from 'react'
import { useAuth } from '../context/AuthContext'
import { createSupabaseDataService } from '../services/supabase-data.service'

export function useDataService() {
  const { accountId } = useAuth()

  return useMemo(() => {
    if (!accountId) return null
    return createSupabaseDataService(accountId)
  }, [accountId])
}
