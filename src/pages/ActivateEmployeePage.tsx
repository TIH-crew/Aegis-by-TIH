import { useEffect, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { supabase } from '../lib/supabase'
import { useAuth } from '../context/AuthContext'

function functionsBase() {
  const override = import.meta.env.VITE_SUPABASE_FUNCTIONS_URL
  if (override) return override.replace(/\/$/, '')
  const url = import.meta.env.VITE_SUPABASE_URL
  if (!url) throw new Error('Missing VITE_SUPABASE_URL')
  return `${url.replace(/\/$/, '')}/functions/v1`
}

async function activationFetch(body: Record<string, unknown>, bearer?: string | null) {
  const anon = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
    ...(anon ? { apikey: anon, Authorization: `Bearer ${bearer || anon}` } : {}),
  }
  const res = await fetch(`${functionsBase()}/aegis-crm/workforce/activation`, {
    method: 'POST',
    headers,
    body: JSON.stringify(body),
  })
  const data = await res.json().catch(() => ({}))
  if (!res.ok || data.ok === false) {
    throw new Error(data.error ?? `Activation failed (${res.status})`)
  }
  return data as {
    ok: true
    email?: string
    employee_name?: string
    expires_at?: string
    activated?: boolean
    magic_link_sent?: boolean
  }
}

/**
 * Employee AEGIS activation — separate from insurance claim QR tokens.
 */
export function ActivateEmployeePage() {
  const [params] = useSearchParams()
  const token = params.get('token')?.trim() ?? ''
  const { session, refreshPortalUser } = useAuth()
  const [status, setStatus] = useState<'loading' | 'ready' | 'done' | 'error'>('loading')
  const [meta, setMeta] = useState<{ email?: string; name?: string; expiresAt?: string }>({})
  const [message, setMessage] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  useEffect(() => {
    if (!token) {
      setStatus('error')
      setError('Missing invitation token.')
      return
    }
    void activationFetch({ action: 'validate', token })
      .then((data) => {
        setMeta({
          email: data.email,
          name: data.employee_name,
          expiresAt: data.expires_at,
        })
        setStatus('ready')
      })
      .catch((err) => {
        setStatus('error')
        setError(err instanceof Error ? err.message : 'Invalid invitation')
      })
  }, [token])

  async function sendMagicLink() {
    if (!token) return
    setBusy(true)
    setError(null)
    try {
      const data = await activationFetch({ action: 'send_magic_link', token })
      setMessage(
        data.magic_link_sent
          ? `Sign-in link sent to ${data.email}. Open it on this device to finish activation.`
          : 'Could not send email — try again or contact HR.',
      )
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to send link')
    } finally {
      setBusy(false)
    }
  }

  async function acceptInvite() {
    if (!token || !session?.access_token) return
    setBusy(true)
    setError(null)
    try {
      await activationFetch({ action: 'accept', token }, session.access_token)
      await refreshPortalUser()
      setStatus('done')
      setMessage('Your AEGIS employee account is activated. This does not enrol you in pension or medical aid.')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Activation failed')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="flex min-h-screen items-center justify-center bg-page px-4">
      <div className="w-full max-w-md rounded-lg border border-border bg-surface p-6 shadow-sm">
        <h1 className="text-xl font-semibold text-ink">Activate AEGIS account</h1>
        <p className="mt-2 text-sm text-muted">
          Employee activation uses a secure invitation — not the insurance claim QR.
        </p>

        {status === 'loading' && <p className="mt-4 text-sm text-muted">Validating invitation…</p>}

        {status === 'error' && (
          <p className="mt-4 rounded border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">
            {error}
          </p>
        )}

        {status === 'ready' && (
          <div className="mt-4 space-y-3 text-sm">
            {meta.name && <p className="font-medium">{meta.name}</p>}
            {meta.email && <p className="text-muted">Invited email: {meta.email}</p>}
            {meta.expiresAt && (
              <p className="text-xs text-muted">Expires {new Date(meta.expiresAt).toLocaleString()}</p>
            )}
            {message && (
              <p className="rounded border border-emerald-200 bg-emerald-50 px-3 py-2 text-emerald-900">
                {message}
              </p>
            )}
            {error && (
              <p className="rounded border border-red-200 bg-red-50 px-3 py-2 text-red-700">{error}</p>
            )}

            {!session ? (
              <button
                type="button"
                className="ws-btn-primary w-full"
                disabled={busy}
                onClick={() => void sendMagicLink()}
              >
                {busy ? 'Sending…' : 'Email me a sign-in link'}
              </button>
            ) : (
              <button
                type="button"
                className="ws-btn-primary w-full"
                disabled={busy}
                onClick={() => void acceptInvite()}
              >
                {busy ? 'Activating…' : 'Complete activation'}
              </button>
            )}
          </div>
        )}

        {status === 'done' && (
          <div className="mt-4 space-y-3 text-sm">
            <p className="rounded border border-emerald-200 bg-emerald-50 px-3 py-2 text-emerald-900">
              {message}
            </p>
            <Link to="/" className="inline-block text-primary underline">
              Continue to AEGIS
            </Link>
          </div>
        )}

        <p className="mt-6 text-xs text-muted">
          Already signed in as {session?.user?.email ?? '—'} ·{' '}
          <button
            type="button"
            className="underline"
            onClick={() => void supabase.auth.signOut()}
          >
            Sign out
          </button>
        </p>
      </div>
    </div>
  )
}
