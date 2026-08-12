const ACTIVE_ACCOUNT_KEY = 'aegis.activeAccountId'

export function getStoredActiveAccountId(): string | null {
  try {
    return localStorage.getItem(ACTIVE_ACCOUNT_KEY)
  } catch {
    return null
  }
}

export function setStoredActiveAccountId(accountId: string | null) {
  try {
    if (!accountId) localStorage.removeItem(ACTIVE_ACCOUNT_KEY)
    else localStorage.setItem(ACTIVE_ACCOUNT_KEY, accountId)
  } catch {
    // ignore storage failures
  }
}
