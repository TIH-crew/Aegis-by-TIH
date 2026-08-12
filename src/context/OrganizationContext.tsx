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
import {
  getOrganization,
  updateOrganization,
  uploadOrganizationLogo,
} from '../services/organization.service'
import { refreshOrganizationProfileFromZoho } from '../services/crm.service'
import type { Organization, OrganizationInput } from '../types/organization'

interface OrganizationContextValue {
  organization: Organization | null
  loading: boolean
  error: string | null
  refresh: () => Promise<void>
  saveOrganization: (input: Partial<OrganizationInput>) => Promise<Organization>
  uploadLogo: (file: File) => Promise<string>
}

const OrganizationContext = createContext<OrganizationContextValue | null>(null)

export function OrganizationProvider({ children }: { children: ReactNode }) {
  const { accountId } = useAuth()
  const [organization, setOrganization] = useState<Organization | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const refresh = useCallback(async () => {
    if (!accountId) {
      setOrganization(null)
      setLoading(false)
      return
    }

    setLoading(true)
    setError(null)
    try {
      let org = await getOrganization(accountId)
      if (org?.zoho_account_id) {
        try {
          org = (await refreshOrganizationProfileFromZoho(accountId)) ?? org
        } catch (syncErr) {
          console.warn('Zoho organization refresh failed:', syncErr)
        }
      }
      setOrganization(org)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load organization')
    } finally {
      setLoading(false)
    }
  }, [accountId])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const saveOrganization = useCallback(
    async (input: Partial<OrganizationInput>) => {
      if (!accountId) throw new Error('No organization account')
      const org = await updateOrganization(accountId, input)
      setOrganization(org)
      return org
    },
    [accountId],
  )

  const uploadLogo = useCallback(
    async (file: File) => {
      if (!accountId) throw new Error('No organization account')
      const url = await uploadOrganizationLogo(accountId, file)
      setOrganization((prev) => (prev ? { ...prev, logo_url: url } : prev))
      await refresh()
      return url
    },
    [accountId, refresh],
  )

  const value = useMemo(
    () => ({
      organization,
      loading,
      error,
      refresh,
      saveOrganization,
      uploadLogo,
    }),
    [organization, loading, error, refresh, saveOrganization, uploadLogo],
  )

  return (
    <OrganizationContext.Provider value={value}>{children}</OrganizationContext.Provider>
  )
}

export function useOrganization() {
  const ctx = useContext(OrganizationContext)
  if (!ctx) {
    throw new Error('useOrganization must be used within OrganizationProvider')
  }
  return ctx
}
