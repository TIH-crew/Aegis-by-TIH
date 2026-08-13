import { getVapiClient, getVapiPublicConfig, VapiConfigError } from '../lib/vapi-client'
import {
  buildClaimAssistantOverrides,
  type VapiCallerContext,
} from '../lib/vapi-caller-context'
import type {
  VapiCallSessionRecord,
  VapiCallState,
  VapiConversationMessage,
  VapiSpeaker,
} from '../types/vapi-call'
import { createEmptyCallSession } from '../types/vapi-call'

const LOG_PREFIX = '[Vapi]'

export type VapiCallControllerListener = (snapshot: VapiCallControllerSnapshot) => void

export interface VapiCallControllerSnapshot {
  state: VapiCallState
  speaker: VapiSpeaker
  elapsedSeconds: number
  errorMessage: string | null
  session: VapiCallSessionRecord
  micDenied: boolean
}

function log(...args: unknown[]) {
  console.info(LOG_PREFIX, ...args)
}

function logError(...args: unknown[]) {
  console.error(LOG_PREFIX, ...args)
}

function newMessageId() {
  return `${Date.now()}-${Math.random().toString(36).slice(2, 9)}`
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null
}

function asString(value: unknown): string | null {
  return typeof value === 'string' && value.trim() ? value : null
}

/**
 * Imperative controller around the Vapi Web SDK singleton.
 * Keeps UI free of SDK wiring and builds a session record for a future CRM export.
 */
export class VapiCallController {
  private state: VapiCallState = 'idle'
  private speaker: VapiSpeaker = 'none'
  private errorMessage: string | null = null
  private micDenied = false
  private session: VapiCallSessionRecord = createEmptyCallSession()
  private elapsedSeconds = 0
  private startedAtMs: number | null = null
  private durationTimer: ReturnType<typeof setInterval> | null = null
  private listeners = new Set<VapiCallControllerListener>()
  private bound = false
  private userSpeechFromVolume = false

  private readonly onCallStart = () => {
    log('Call started')
    this.startedAtMs = Date.now()
    this.session = {
      ...this.session,
      startedAt: new Date(this.startedAtMs).toISOString(),
      endedAt: null,
      status: 'active',
      errorMessage: null,
    }
    this.setState('active')
    this.startDurationTimer()
    this.emit()
  }

  private readonly onCallStartSuccess = (event: { callId?: string }) => {
    if (event?.callId) {
      this.session = { ...this.session, callId: event.callId }
      log('Call start success', event.callId)
      this.emit()
    }
  }

  private readonly onCallEnd = () => {
    log('Call ended')
    this.finishSession('ended')
  }

  private readonly onSpeechStart = () => {
    log('Assistant speech started')
    this.speaker = 'assistant'
    this.emit()
  }

  private readonly onSpeechEnd = () => {
    log('Assistant speech ended')
    this.speaker = this.userSpeechFromVolume ? 'user' : 'none'
    this.emit()
  }

  private readonly onLocalVolume = (volume: number) => {
    const speaking = volume > 0.08
    if (speaking === this.userSpeechFromVolume) return
    this.userSpeechFromVolume = speaking
    if (this.speaker === 'assistant') {
      // Prefer assistant indicator while they speak
      return
    }
    if (speaking) {
      log('User speech started')
      this.speaker = 'user'
    } else {
      log('User speech ended')
      this.speaker = 'none'
    }
    this.emit()
  }

  private readonly onMessage = (message: unknown) => {
    log('Message received', isRecord(message) ? message.type : typeof message)
    this.captureMessage(message)

    if (!isRecord(message)) return

    if (message.type === 'speech-update') {
      const role = asString(message.role)
      const status = asString(message.status)
      if (role === 'user') {
        if (status === 'started') {
          this.userSpeechFromVolume = true
          if (this.speaker !== 'assistant') this.speaker = 'user'
          this.emit()
        } else if (status === 'stopped') {
          this.userSpeechFromVolume = false
          if (this.speaker === 'user') {
            this.speaker = 'none'
            this.emit()
          }
        }
      }
    }

    if (message.type === 'status-update' && asString(message.status) === 'ended') {
      // call-end should also fire; treat as soft signal
      log('Status update ended')
    }
  }

  private readonly onError = (error: unknown) => {
    logError('Error', error)
    const message = this.stringifyError(error)
    this.errorMessage = message
    this.session = { ...this.session, errorMessage: message, status: 'error' }
    this.stopDurationTimer()
    this.setState('error')
    this.speaker = 'none'
    this.emit()
  }

  private readonly onCallStartFailed = (event: { error?: string }) => {
    const message = event?.error || 'Unable to connect to the voice assistant.'
    logError('Call start failed', event)
    this.errorMessage = message
    this.session = { ...this.session, errorMessage: message, status: 'error' }
    this.stopDurationTimer()
    this.setState('error')
    this.speaker = 'none'
    this.emit()
  }

  subscribe(listener: VapiCallControllerListener): () => void {
    this.listeners.add(listener)
    listener(this.getSnapshot())
    return () => {
      this.listeners.delete(listener)
    }
  }

  getSnapshot(): VapiCallControllerSnapshot {
    return {
      state: this.state,
      speaker: this.speaker,
      elapsedSeconds: this.elapsedSeconds,
      errorMessage: this.errorMessage,
      session: this.session,
      micDenied: this.micDenied,
    }
  }

  /** Structured session payload for a future backend/CRM phase. */
  getSessionRecord(): VapiCallSessionRecord {
    return {
      ...this.session,
      duration: this.elapsedSeconds,
      status: this.state,
      errorMessage: this.errorMessage,
      messages: [...this.session.messages],
    }
  }

  canStart(): boolean {
    return this.state === 'idle' || this.state === 'ended' || this.state === 'error'
  }

  async startCall(callerContext?: VapiCallerContext): Promise<void> {
    if (!this.canStart()) {
      log('Start ignored — call already in progress')
      return
    }

    if (!callerContext?.employee?.id) {
      this.fail('Verified staff details are required before starting a claim call.')
      return
    }

    this.errorMessage = null
    this.micDenied = false
    this.speaker = 'none'
    this.elapsedSeconds = 0
    this.startedAtMs = null
    this.session = {
      ...createEmptyCallSession(),
      status: 'connecting',
      caller: {
        employee: callerContext.employee,
        claim: callerContext.claim ?? null,
      },
    }
    this.setState('connecting')
    this.emit()
    log('Connecting', {
      employeeId: callerContext.employee.id,
      name: callerContext.employee.full_name,
    })

    try {
      await this.ensureMicrophone()
      const { assistantId } = getVapiPublicConfig()
      const vapi = getVapiClient()
      this.bindEvents(vapi)
      const overrides = buildClaimAssistantOverrides(callerContext)
      const call = await vapi.start(assistantId, overrides)
      if (call && typeof call === 'object' && 'id' in call && typeof call.id === 'string') {
        this.session = { ...this.session, callId: call.id }
      }
      this.emit()
    } catch (error) {
      if (error instanceof VapiConfigError) {
        this.fail(error.message)
        return
      }
      if (this.isPermissionError(error)) {
        this.micDenied = true
        this.fail('Microphone access denied. Allow the microphone in your browser settings and try again.')
        return
      }
      this.fail(this.stringifyError(error))
    }
  }

  async endCall(): Promise<void> {
    if (this.state !== 'connecting' && this.state !== 'active') return
    log('Ending call')
    this.setState('ending')
    this.emit()
    try {
      const vapi = getVapiClient()
      await vapi.stop()
    } catch (error) {
      logError('Error while stopping', error)
      this.finishSession('ended')
    }
  }

  /** Reset UI back to idle after a completed/errored call. */
  resetToIdle(): void {
    if (this.state === 'connecting' || this.state === 'active' || this.state === 'ending') return
    this.stopDurationTimer()
    this.speaker = 'none'
    this.errorMessage = null
    this.micDenied = false
    this.elapsedSeconds = 0
    this.session = createEmptyCallSession()
    this.setState('idle')
    this.emit()
  }

  /** Tear down listeners and stop any active call (component unmount). */
  async dispose(): Promise<void> {
    try {
      if (this.state === 'connecting' || this.state === 'active' || this.state === 'ending') {
        try {
          const vapi = getVapiClient()
          await vapi.stop()
        } catch (error) {
          logError('Dispose stop failed', error)
        }
      }
    } finally {
      this.unbindEvents()
      this.stopDurationTimer()
      this.listeners.clear()
    }
  }

  private bindEvents(vapi: ReturnType<typeof getVapiClient>) {
    if (this.bound) return
    vapi.on('call-start', this.onCallStart)
    vapi.on('call-start-success', this.onCallStartSuccess)
    vapi.on('call-end', this.onCallEnd)
    vapi.on('speech-start', this.onSpeechStart)
    vapi.on('speech-end', this.onSpeechEnd)
    vapi.on('local-volume-level', this.onLocalVolume)
    vapi.on('message', this.onMessage)
    vapi.on('error', this.onError)
    vapi.on('call-start-failed', this.onCallStartFailed)
    this.bound = true
  }

  private unbindEvents() {
    if (!this.bound) return
    try {
      const vapi = getVapiClient()
      vapi.removeListener('call-start', this.onCallStart)
      vapi.removeListener('call-start-success', this.onCallStartSuccess)
      vapi.removeListener('call-end', this.onCallEnd)
      vapi.removeListener('speech-start', this.onSpeechStart)
      vapi.removeListener('speech-end', this.onSpeechEnd)
      vapi.removeListener('local-volume-level', this.onLocalVolume)
      vapi.removeListener('message', this.onMessage)
      vapi.removeListener('error', this.onError)
      vapi.removeListener('call-start-failed', this.onCallStartFailed)
    } catch (error) {
      // Client may be unavailable if public key was never configured
      logError('Unbind failed', error)
    }
    this.bound = false
  }

  private captureMessage(message: unknown) {
    if (!isRecord(message)) {
      this.session = {
        ...this.session,
        messages: [
          ...this.session.messages,
          {
            id: newMessageId(),
            at: new Date().toISOString(),
            role: 'system',
            text: String(message),
            raw: message,
          },
        ],
      }
      this.emit()
      return
    }

    const type = asString(message.type) ?? 'unknown'
    let entry: VapiConversationMessage | null = null

    if (type === 'transcript') {
      const role = asString(message.role) ?? 'assistant'
      const text =
        asString(message.transcript) ??
        asString(message.text) ??
        ''
      if (text) {
        entry = {
          id: newMessageId(),
          at: new Date().toISOString(),
          role,
          text,
          sourceType: type,
          raw: message,
        }
      }
    } else if (type === 'conversation-update' && Array.isArray(message.messages)) {
      // Keep last assistant/user content snippets for later CRM extraction
      const last = message.messages[message.messages.length - 1]
      if (isRecord(last)) {
        const role = asString(last.role) ?? 'assistant'
        const text = asString(last.content) ?? asString(last.message) ?? ''
        if (text) {
          entry = {
            id: newMessageId(),
            at: new Date().toISOString(),
            role,
            text,
            sourceType: type,
            raw: message,
          }
        }
      }
    } else {
      // Structured log without dumping huge payloads into the UI transcript
      entry = {
        id: newMessageId(),
        at: new Date().toISOString(),
        role: 'system',
        text: `[${type}]`,
        sourceType: type,
        raw: message,
      }
    }

    if (!entry) return
    // Avoid flooding session with pure system noise except transcripts / speech
    if (entry.role === 'system' && entry.sourceType !== 'transcript') {
      // Still keep for future CRM — but cap system noise
      const systemCount = this.session.messages.filter((m) => m.role === 'system').length
      if (systemCount > 80) return
    }

    this.session = {
      ...this.session,
      messages: [...this.session.messages, entry],
    }
    this.emit()
  }

  private async ensureMicrophone(): Promise<void> {
    if (!navigator.mediaDevices?.getUserMedia) {
      throw new Error('This browser does not support microphone access for web calling.')
    }
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      stream.getTracks().forEach((track) => track.stop())
    } catch (error) {
      if (this.isPermissionError(error)) {
        this.micDenied = true
      }
      throw error
    }
  }

  private finishSession(next: 'ended' | 'error') {
    this.stopDurationTimer()
    this.speaker = 'none'
    this.userSpeechFromVolume = false
    const endedAt = new Date().toISOString()
    this.session = {
      ...this.session,
      endedAt,
      duration: this.elapsedSeconds,
      status: next,
    }
    // Future phase: POST this.session to backend/webhook/CRM
    log('Session ready for export', {
      callId: this.session.callId,
      duration: this.session.duration,
      messageCount: this.session.messages.length,
    })
    this.setState(next)
    this.emit()
  }

  private fail(message: string) {
    logError(message)
    this.errorMessage = message
    this.session = { ...this.session, errorMessage: message, status: 'error' }
    this.stopDurationTimer()
    this.unbindEvents()
    this.setState('error')
    this.speaker = 'none'
    this.emit()
  }

  private setState(state: VapiCallState) {
    this.state = state
  }

  private startDurationTimer() {
    this.stopDurationTimer()
    this.durationTimer = setInterval(() => {
      if (this.startedAtMs == null) return
      this.elapsedSeconds = Math.floor((Date.now() - this.startedAtMs) / 1000)
      this.session = { ...this.session, duration: this.elapsedSeconds }
      this.emit()
    }, 1000)
  }

  private stopDurationTimer() {
    if (this.durationTimer) {
      clearInterval(this.durationTimer)
      this.durationTimer = null
    }
  }

  private emit() {
    const snapshot = this.getSnapshot()
    for (const listener of this.listeners) listener(snapshot)
  }

  private isPermissionError(error: unknown): boolean {
    if (!isRecord(error)) return false
    const name = asString(error.name)?.toLowerCase() ?? ''
    const message = this.stringifyError(error).toLowerCase()
    return (
      name.includes('notallowed') ||
      name.includes('permission') ||
      message.includes('permission') ||
      message.includes('not allowed') ||
      message.includes('microphone')
    )
  }

  private stringifyError(error: unknown): string {
    if (typeof error === 'string') return error
    if (error instanceof Error) return error.message
    if (isRecord(error)) {
      return asString(error.message) ?? asString(error.errorMsg) ?? 'Unexpected voice call error.'
    }
    return 'Unexpected voice call error.'
  }
}
