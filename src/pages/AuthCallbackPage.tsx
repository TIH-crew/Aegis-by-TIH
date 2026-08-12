import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'
import { useAuth } from '../context/AuthContext'

export function AuthCallbackPage() {
  const navigate = useNavigate()
  const { refreshPortalUser } = useAuth()
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let cancelled = false

    async function finishAuth() {
      try {
        const params = new URLSearchParams(window.location.search)
        const code = params.get('code')

        if (code) {
          const { error: exchangeError } = await supabase.auth.exchangeCodeForSession(code)
          if (exchangeError) throw exchangeError
        }

        const { error: sessionError } = await supabase.auth.getSession()
        if (sessionError) throw sessionError

        const profile = await refreshPortalUser()
        if (cancelled) return

        navigate(profile ? '/' : '/no-access', { replace: true })
      } catch (err) {
        if (!cancelled) {
          setError(err instanceof Error ? err.message : 'Sign-in failed')
        }
      }
    }

    void finishAuth()

    return () => {
      cancelled = true
    }
  }, [navigate, refreshPortalUser])

  if (error) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-page px-4">
        <div className="max-w-md rounded-lg border border-red-200 bg-red-50 p-6 text-sm text-red-700">
          <p className="font-medium">Could not complete sign-in</p>
          <p className="mt-2">{error}</p>
        </div>
      </div>
    )
  }

  return (
    <div className="flex min-h-screen items-center justify-center bg-page text-sm text-muted">
      Completing sign-in...
    </div>
  )
}
