import { Link } from 'react-router-dom'
import { BrandLogo } from '../components/brand/BrandLogo'
import { useAuth } from '../context/AuthContext'

export function NoAccessPage() {
  const { signOut, user } = useAuth()

  return (
    <div className="flex min-h-screen items-center justify-center bg-page px-4">
      <div className="w-full max-w-md rounded-xl border border-border bg-surface p-8 shadow-sm text-center">
        <div className="mb-6 flex flex-col items-center gap-3">
          <BrandLogo variant="full" />
          <h1 className="text-xl font-semibold">Access not available</h1>
        </div>

        <p className="text-sm text-muted">
          {user?.email ? (
            <>
              Signed in as <span className="font-medium text-gray-900">{user.email}</span>, but
              this account does not have an active Aegis invitation.
            </>
          ) : (
            'You need an invitation from your broker to access Aegis.'
          )}
        </p>

        <p className="mt-3 text-sm text-muted">
          Ask your TIH broker to send an invite for your organisation, then sign in with the invited
          email address.
        </p>

        <div className="mt-6 flex flex-col gap-2">
          <Link
            to="/login"
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-medium text-white hover:bg-burgundy-dark"
          >
            Back to sign in
          </Link>
          <button
            type="button"
            onClick={() => void signOut()}
            className="rounded-lg border border-border px-4 py-2.5 text-sm font-medium hover:bg-accent-light/50"
          >
            Sign out
          </button>
        </div>
      </div>
    </div>
  )
}
