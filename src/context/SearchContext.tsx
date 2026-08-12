import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react'
import { useAuth } from './AuthContext'
import { useOrganization } from './OrganizationContext'
import { createSupabaseDataService } from '../services/supabase-data.service'
import { syncPortalFromZoho } from '../services/crm.service'
import { matchesSearch } from '../lib/risk-items-view'
import type { RiskItem } from '../types'

const PREVIEW_LIMIT = 8

interface SearchContextValue {
  query: string
  setQuery: (query: string) => void
  clearQuery: () => void
  riskItems: RiskItem[]
  loading: boolean
  error: string | null
  refreshRiskItems: () => Promise<void>
  previewResults: RiskItem[]
  filterRiskItems: (query?: string) => RiskItem[]
}

const SearchContext = createContext<SearchContextValue | null>(null)

export function SearchProvider({ children }: { children: ReactNode }) {
  const { accountId } = useAuth()
  const { organization } = useOrganization()
  const [query, setQueryState] = useState('')
  const [riskItems, setRiskItems] = useState<RiskItem[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const refreshRiskItems = useCallback(async () => {
    if (!accountId) {
      setRiskItems([])
      setLoading(false)
      return
    }

    setLoading(true)
    setError(null)
    try {
      const service = createSupabaseDataService(accountId)
      let data = await service.getRiskItems()

      if (organization?.zoho_account_id) {
        try {
          await syncPortalFromZoho()
          data = await service.getRiskItems()
        } catch (syncErr) {
          console.warn('Zoho risk sync failed:', syncErr)
        }
      }

      setRiskItems(data)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load records for search')
    } finally {
      setLoading(false)
    }
  }, [accountId, organization?.zoho_account_id])

  useEffect(() => {
    void refreshRiskItems()
  }, [refreshRiskItems])

  const filterRiskItems = useCallback(
    (searchQuery = query) => riskItems.filter((item) => matchesSearch(item, searchQuery)),
    [riskItems, query],
  )

  const previewResults = useMemo(
    () => filterRiskItems(query).slice(0, PREVIEW_LIMIT),
    [filterRiskItems, query],
  )

  const setQuery = useCallback((next: string) => {
    setQueryState(next)
  }, [])

  const clearQuery = useCallback(() => {
    setQueryState('')
  }, [])

  const value = useMemo(
    () => ({
      query,
      setQuery,
      clearQuery,
      riskItems,
      loading,
      error,
      refreshRiskItems,
      previewResults,
      filterRiskItems,
    }),
    [
      query,
      setQuery,
      clearQuery,
      riskItems,
      loading,
      error,
      refreshRiskItems,
      previewResults,
      filterRiskItems,
    ],
  )

  return <SearchContext.Provider value={value}>{children}</SearchContext.Provider>
}

export function useSearch() {
  const ctx = useContext(SearchContext)
  if (!ctx) throw new Error('useSearch must be used within SearchProvider')
  return ctx
}
