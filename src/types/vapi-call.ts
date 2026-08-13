/**
 * Typed models for in-app Vapi web calls.
 * Structured so a later phase can POST completed sessions to a backend/CRM.
 */

export type VapiCallState =
  | 'idle'
  | 'connecting'
  | 'active'
  | 'ending'
  | 'ended'
  | 'error'

export type VapiSpeaker = 'user' | 'assistant' | 'none'

export type VapiTranscriptRole = 'user' | 'assistant' | 'system' | 'tool' | string

export interface VapiConversationMessage {
  id: string
  at: string
  role: VapiTranscriptRole
  text: string
  /** Raw Vapi message type when known (e.g. transcript, speech-update). */
  sourceType?: string
  raw?: unknown
}

export interface VapiCallSessionRecord {
  callId: string | null
  messages: VapiConversationMessage[]
  startedAt: string | null
  endedAt: string | null
  /** Elapsed seconds when the call ended (or current elapsed while active). */
  duration: number
  status: VapiCallState
  errorMessage: string | null
  /** Verified staff / claim context supplied at call start (for later CRM). */
  caller: Record<string, unknown> | null
}

export function createEmptyCallSession(): VapiCallSessionRecord {
  return {
    callId: null,
    messages: [],
    startedAt: null,
    endedAt: null,
    duration: 0,
    status: 'idle',
    errorMessage: null,
    caller: null,
  }
}

export function formatCallDuration(totalSeconds: number): string {
  const safe = Math.max(0, Math.floor(totalSeconds))
  const minutes = Math.floor(safe / 60)
  const seconds = safe % 60
  return `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`
}

export function statusLabel(
  state: VapiCallState,
  speaker: VapiSpeaker,
  errorMessage?: string | null,
): string {
  if (state === 'error') {
    if (errorMessage?.toLowerCase().includes('microphone') || errorMessage?.toLowerCase().includes('permission')) {
      return 'Microphone access denied'
    }
    return errorMessage?.trim() ? 'Unable to connect' : 'Unable to connect'
  }
  if (state === 'connecting') return 'Connecting...'
  if (state === 'ending') return 'Ending call...'
  if (state === 'ended') return 'Call ended'
  if (state === 'idle') return 'Ready to call'
  if (state === 'active') {
    if (speaker === 'assistant') return 'Assistant speaking...'
    if (speaker === 'user') return 'Listening...'
    return 'Connected'
  }
  return 'Ready to call'
}
