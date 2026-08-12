import { supabase } from '../lib/supabase'
import type { PortalUser } from '../types/auth'

export function getAuthRedirectUrl() {
  return `${window.location.origin}/auth/callback`
}

export async function signInWithMagicLink(email: string) {
  const { error } = await supabase.auth.signInWithOtp({
    email: email.trim(),
    options: {
      emailRedirectTo: getAuthRedirectUrl(),
    },
  })
  if (error) throw error
}

export async function signInWithGoogle() {
  const { error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      redirectTo: getAuthRedirectUrl(),
      queryParams: {
        access_type: 'offline',
        prompt: 'select_account',
      },
    },
  })
  if (error) throw error
}

export async function signOut() {
  const { error } = await supabase.auth.signOut()
  if (error) throw error
}

export async function getPortalUser(): Promise<PortalUser | null> {
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return null

  const { data, error } = await supabase
    .from('portal_users')
    .select('id, user_id, account_id, role, email, full_name, created_at')
    .eq('user_id', user.id)
    .maybeSingle()

  if (error) throw error
  return data as PortalUser | null
}

export async function acceptInviteForCurrentUser(): Promise<string | null> {
  const { data, error } = await supabase.rpc('accept_portal_invite_for_current_user')
  if (error) throw error
  return data as string | null
}
