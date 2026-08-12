import { useEffect, useState } from 'react'
import { Link, Navigate } from 'react-router-dom'
import { QrCode } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { supabase } from '../lib/supabase'

/** Logged-in employees land here and are sent to their personal claim QR URL. */
export function EmployeeClaimEntryPage() {
  const { portalUser, accountId } = useAuth()
  const [token, setToken] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!accountId || !portalUser?.email) {
      setLoading(false)
      return
    }
    void (async () => {
      try {
        const email = portalUser.email.toLowerCase()
        const { data, error: qError } = await supabase
          .from('portal_employees')
          .select('claim_access_token, full_name, status')
          .eq('account_id', accountId)
          .ilike('email', email)
          .eq('status', 'active')
          .maybeSingle()
        if (qError) throw qError
        if (!data?.claim_access_token) {
          setError(
            'No employee claim QR is linked to your login email. Ask your broker to add your WhatsApp employee record and print your QR.',
          )
          return
        }
        setToken(data.claim_access_token)
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Could not load claim access')
      } finally {
        setLoading(false)
      }
    })()
  }, [accountId, portalUser?.email])

  if (loading) {
    return <p className="p-6 text-sm text-muted">Opening your claim portal…</p>
  }

  if (token) {
    return <Navigate to={`/claim/${token}`} replace />
  }

  return (
    <div className="mx-auto max-w-lg space-y-4 p-6">
      <div className="flex items-center gap-3">
        <QrCode className="text-primary" />
        <h1 className="text-xl font-semibold">Employee claims</h1>
      </div>
      <p className="text-sm text-muted">
        {error ??
          'Scan the printed QR code on your employee card to open the claim form. You will verify with a WhatsApp one-time code first.'}
      </p>
      <Link to="/login" className="text-sm text-primary underline">
        Sign out / switch account
      </Link>
    </div>
  )
}
