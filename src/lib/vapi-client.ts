import Vapi from '@vapi-ai/web'

export type VapiPublicConfig = {
  publicKey: string
  assistantId: string
}

export class VapiConfigError extends Error {
  constructor(message: string) {
    super(message)
    this.name = 'VapiConfigError'
  }
}

/** Vite public env (never put a Vapi private/server key here). */
export function getVapiPublicConfig(): VapiPublicConfig {
  const publicKey = import.meta.env.VITE_VAPI_PUBLIC_KEY?.trim() ?? ''
  const assistantId = import.meta.env.VITE_VAPI_ASSISTANT_ID?.trim() ?? ''

  if (!publicKey) {
    throw new VapiConfigError(
      'Missing VITE_VAPI_PUBLIC_KEY. Add your Vapi public web key to the project .env file.',
    )
  }
  if (!assistantId) {
    throw new VapiConfigError(
      'Missing VITE_VAPI_ASSISTANT_ID. Add your existing Vapi assistant ID to the project .env file.',
    )
  }

  return { publicKey, assistantId }
}

export function isVapiConfigured(): boolean {
  try {
    getVapiPublicConfig()
    return true
  } catch {
    return false
  }
}

let client: Vapi | null = null
let clientKey: string | null = null

/**
 * Singleton Vapi Web client. Uses the public key only.
 * Safe to call repeatedly; recreates only if the public key changes.
 */
export function getVapiClient(): Vapi {
  const { publicKey } = getVapiPublicConfig()
  if (client && clientKey === publicKey) return client

  client = new Vapi(publicKey)
  clientKey = publicKey
  return client
}

export function resetVapiClientForTests(): void {
  client = null
  clientKey = null
}
