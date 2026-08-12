import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react'
import type { Session, User } from '@supabase/supabase-js'
import { getStoredActiveAccountId, setStoredActiveAccountId } from '../lib/active-account'
import { supabase } from '../lib/supabase'
import {
  acceptInviteForCurrentUser,
  getPortalUser,
  signInWithMagicLink,
  signInWithGoogle,
  signOut as authSignOut,
} from '../services/auth.service'
import {
  listSubsidiaryAccounts,
  type SubsidiarySummary,
} from '../services/account-hierarchy.service'
import { getOrganization } from '../services/organization.service'
import type { PortalUser } from '../types/auth'
import {
  can as hasCapability,
  canViewQuoteFinancials,
  quoteIsAcceptable,
  resolveAppRole,
  type AppCapability,
  type PortalAppRole,
} from '../lib/rbac'

interface AuthContextValue {
  session: Session | null
  user: User | null
  portalUser: PortalUser | null
  /** Membership / home company account id */
  homeAccountId: string | null
  homeAccountName: string | null
  /** Active company context (home or a subsidiary) */
  accountId: string | null
  subsidiaries: SubsidiarySummary[]
  setActiveAccountId: (accountId: string) => void
  /** admin = full portal; employee = self-service only */
  appRole: PortalAppRole
  isAdmin: boolean
  can: (capability: AppCapability) => boolean
  canSeeFinancials: boolean
  canViewQuoteMoney: (stage: string | null | undefined) => boolean
  canAcceptQuoteStage: (stage: string | null | undefined) => boolean
  loading: boolean
  sendMagicLink: (email: string) => Promise<void>
  signInWithGoogle: () => Promise<void>
  signOut: () => Promise<void>
  refreshPortalUser: () => Promise<PortalUser | null>
}

const AuthContext = createContext<AuthContextValue | null>(null)

function resolveActiveAccountId(
  homeAccountId: string,
  subsidiaries: SubsidiarySummary[],
  stored: string | null,
): string {
  const allowed = new Set([homeAccountId, ...subsidiaries.map((s) => s.id)])
  if (stored && allowed.has(stored)) return stored
  return homeAccountId
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [portalUser, setPortalUser] = useState<PortalUser | null>(null)
  const [homeAccountName, setHomeAccountName] = useState<string | null>(null)
  const [subsidiaries, setSubsidiaries] = useState<SubsidiarySummary[]>([])
  const [activeAccountId, setActiveAccountIdState] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)

  const refreshPortalUser = useCallback(async () => {
    await acceptInviteForCurrentUser().catch(() => null)
    const profile = await getPortalUser()
    setPortalUser(profile)

    if (profile?.account_id) {
      const [children, homeOrg] = await Promise.all([
        listSubsidiaryAccounts(profile.account_id).catch(() => [] as SubsidiarySummary[]),
        getOrganization(profile.account_id).catch(() => null),
      ])
      setSubsidiaries(children)
      setHomeAccountName(homeOrg?.name ?? null)
      const next = resolveActiveAccountId(
        profile.account_id,
        children,
        getStoredActiveAccountId(),
      )
      setActiveAccountIdState(next)
      setStoredActiveAccountId(next)
    } else {
      setSubsidiaries([])
      setHomeAccountName(null)
      setActiveAccountIdState(null)
      setStoredActiveAccountId(null)
    }

    return profile
  }, [])

  useEffect(() => {
    let cancelled = false

    async function init() {
      const { data } = await supabase.auth.getSession()
      if (cancelled) return
      setSession(data.session)

      if (data.session) {
        await refreshPortalUser()
      } else {
        setPortalUser(null)
        setSubsidiaries([])
        setHomeAccountName(null)
        setActiveAccountIdState(null)
      }

      if (!cancelled) setLoading(false)
    }

    void init()

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(async (_event, nextSession) => {
      setSession(nextSession)
      if (nextSession) {
        await refreshPortalUser()
      } else {
        setPortalUser(null)
        setSubsidiaries([])
        setHomeAccountName(null)
        setActiveAccountIdState(null)
        setStoredActiveAccountId(null)
      }
      setLoading(false)
    })

    return () => {
      cancelled = true
      subscription.unsubscribe()
    }
  }, [refreshPortalUser])

  const setActiveAccountId = useCallback(
    (accountId: string) => {
      const homeId = portalUser?.account_id
      if (!homeId) return
      const allowed = new Set([homeId, ...subsidiaries.map((s) => s.id)])
      if (!allowed.has(accountId)) return
      setActiveAccountIdState(accountId)
      setStoredActiveAccountId(accountId)
    },
    [portalUser?.account_id, subsidiaries],
  )

  const sendMagicLink = useCallback(async (email: string) => {
    await signInWithMagicLink(email)
  }, [])

  const signInWithGoogleHandler = useCallback(async () => {
    await signInWithGoogle()
  }, [])

  const signOut = useCallback(async () => {
    await authSignOut()
    setPortalUser(null)
    setSubsidiaries([])
    setHomeAccountName(null)
    setActiveAccountIdState(null)
    setStoredActiveAccountId(null)
    setSession(null)
  }, [])

  const appRole = useMemo(
    () =>
      resolveAppRole({
        email: portalUser?.email ?? session?.user?.email,
        portalRole: portalUser?.role,
      }),
    [portalUser?.email, portalUser?.role, session?.user?.email],
  )
  const isAdmin = appRole === 'admin'
  const canSeeFinancials = hasCapability(appRole, 'policies_financials')

  const value = useMemo(
    () => ({
      session,
      user: session?.user ?? null,
      portalUser,
      homeAccountId: portalUser?.account_id ?? null,
      homeAccountName,
      accountId: activeAccountId,
      subsidiaries,
      setActiveAccountId,
      appRole,
      isAdmin,
      can: (capability: AppCapability) => hasCapability(appRole, capability),
      canSeeFinancials,
      canViewQuoteMoney: (stage: string | null | undefined) =>
        canViewQuoteFinancials(appRole, stage),
      canAcceptQuoteStage: (stage: string | null | undefined) =>
        isAdmin && quoteIsAcceptable(stage),
      loading,
      sendMagicLink,
      signInWithGoogle: signInWithGoogleHandler,
      signOut,
      refreshPortalUser,
    }),
    [
      session,
      portalUser,
      activeAccountId,
      homeAccountName,
      subsidiaries,
      setActiveAccountId,
      appRole,
      isAdmin,
      canSeeFinancials,
      loading,
      sendMagicLink,
      signInWithGoogleHandler,
      signOut,
      refreshPortalUser,
    ],
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth must be used within AuthProvider')
  return ctx
}

export function useRequireAccountId() {
  const { accountId, loading, portalUser } = useAuth()
  if (loading) return { accountId: null, loading: true as const }
  if (!accountId || !portalUser) return { accountId: null, loading: false as const }
  return { accountId, loading: false as const }
}
