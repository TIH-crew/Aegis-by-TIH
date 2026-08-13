import VapiImport from '@vapi-ai/web'

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

type VapiInstance = InstanceType<typeof VapiImport>
type VapiCtor = new (publicKey: string) => VapiInstance

/**
 * Vite/Rollup can double-wrap the CJS default export from `@vapi-ai/web`
 * (`{ default: { default: Vapi } }`), which surfaces as
 * "X.default is not a constructor" when calling `new Vapi(...)`.
 */
function resolveVapiConstructor(): VapiCtor {
  let current: unknown = VapiImport
  for (let i = 0; i < 3; i += 1) {
    if (typeof current === 'function') return current as VapiCtor
    if (current && typeof current === 'object' && 'default' in current) {
      current = (current as { default: unknown }).default
      continue
    }
    break
  }
  throw new VapiConfigError(
    'Failed to load the Vapi Web SDK constructor. Try clearing node_modules/.vite and restarting the dev server.',
  )
}

const Vapi = resolveVapiConstructor()

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

let client: VapiInstance | null = null
let clientKey: string | null = null

/**
 * Singleton Vapi Web client. Uses the public key only.
 * Safe to call repeatedly; recreates only if the public key changes.
 */
export function getVapiClient(): VapiInstance {
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
