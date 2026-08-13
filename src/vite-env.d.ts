/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_SUPABASE_URL: string
  readonly VITE_SUPABASE_ANON_KEY: string
  readonly VITE_GOOGLE_MAPS_API_KEY?: string
  readonly VITE_SUPABASE_FUNCTIONS_URL?: string
  /** Vapi Web SDK public key only — never a private/server key */
  readonly VITE_VAPI_PUBLIC_KEY?: string
  /** Existing Vapi assistant ID for in-app web calling */
  readonly VITE_VAPI_ASSISTANT_ID?: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
