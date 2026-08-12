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
import { createBranch, deleteBranch, getBranches } from '../services/branch.service'
import type { Branch, BranchInput } from '../types/branch'

interface BranchesContextValue {
  branches: Branch[]
  loading: boolean
  error: string | null
  refresh: () => Promise<void>
  addBranch: (input: BranchInput) => Promise<Branch>
  removeBranch: (id: string) => Promise<void>
  getBranchById: (id: string | null | undefined) => Branch | undefined
}

const BranchesContext = createContext<BranchesContextValue | null>(null)

export function BranchesProvider({ children }: { children: ReactNode }) {
  const { accountId } = useAuth()
  const [branches, setBranches] = useState<Branch[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const refresh = useCallback(async () => {
    if (!accountId) {
      setBranches([])
      setLoading(false)
      return
    }

    setLoading(true)
    setError(null)
    try {
      const data = await getBranches(accountId)
      setBranches(data)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load branches')
    } finally {
      setLoading(false)
    }
  }, [accountId])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const addBranch = useCallback(
    async (input: BranchInput) => {
      if (!accountId) throw new Error('No organization account')
      const branch = await createBranch(accountId, input)
      setBranches((prev) => [...prev, branch].sort((a, b) => a.name.localeCompare(b.name)))
      return branch
    },
    [accountId],
  )

  const removeBranch = useCallback(
    async (id: string) => {
      if (!accountId) throw new Error('No organization account')
      await deleteBranch(accountId, id)
      setBranches((prev) => prev.filter((b) => b.id !== id))
    },
    [accountId],
  )

  const getBranchById = useCallback(
    (id: string | null | undefined) => branches.find((b) => b.id === id),
    [branches],
  )

  const value = useMemo(
    () => ({
      branches,
      loading,
      error,
      refresh,
      addBranch,
      removeBranch,
      getBranchById,
    }),
    [branches, loading, error, refresh, addBranch, removeBranch, getBranchById],
  )

  return <BranchesContext.Provider value={value}>{children}</BranchesContext.Provider>
}

export function useBranches() {
  const ctx = useContext(BranchesContext)
  if (!ctx) throw new Error('useBranches must be used within BranchesProvider')
  return ctx
}
