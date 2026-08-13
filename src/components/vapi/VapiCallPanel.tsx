import { useEffect, useMemo, useRef, type ReactNode } from 'react'
import {
  Headphones,
  Mic,
  MicOff,
  Phone,
  PhoneOff,
  Loader2,
  Volume2,
} from 'lucide-react'
import { useVapiCall } from '../../hooks/useVapiCall'
import type { VapiCallerContext } from '../../lib/vapi-caller-context'
import { isVapiConfigured } from '../../lib/vapi-client'
import { cn } from '../../lib/utils'
import {
  formatCallDuration,
  statusLabel,
  type VapiCallSessionRecord,
} from '../../types/vapi-call'

type Props = {
  /** Verified staff member + optional claim context passed into Vapi. */
  callerContext: VapiCallerContext | null
  /** Visual theme — claim portal uses the dark employee claim surface. */
  theme?: 'default' | 'claim'
  className?: string
  title?: string
  subtitle?: string
  /** Fired once when a call transitions to ended (with session payload). */
  onCallEnded?: (session: VapiCallSessionRecord) => void
}

export function VapiCallPanel({
  callerContext,
  theme = 'default',
  className,
  title = 'Log claim by voice',
  subtitle = 'Speak with the claims assistant using your verified staff profile',
  onCallEnded,
}: Props) {
  const configured = isVapiConfigured()
  const {
    state,
    speaker,
    elapsedSeconds,
    errorMessage,
    micDenied,
    canStart,
    startCall,
    endCall,
    resetToIdle,
    getSessionRecord,
    session,
  } = useVapiCall()

  const endedHandledRef = useRef<string | null>(null)

  useEffect(() => {
    if (state !== 'ended' || !onCallEnded) return
    const callId = session.callId ?? `ended-${session.endedAt ?? 'unknown'}`
    if (endedHandledRef.current === callId) return
    endedHandledRef.current = callId
    onCallEnded(getSessionRecord())
  }, [state, session.callId, session.endedAt, onCallEnded, getSessionRecord])

  const label = statusLabel(state, speaker, errorMessage)
  const showError = state === 'error' && Boolean(errorMessage)
  const hasCaller = Boolean(callerContext?.employee?.id)
  const isClaimTheme = theme === 'claim'

  const callerSummary = useMemo(() => {
    if (!callerContext?.employee) return null
    const e = callerContext.employee
    return [e.full_name, e.job_title, e.branch_name, e.company_name].filter(Boolean).join(' · ')
  }, [callerContext])

  return (
    <div
      className={cn(
        'overflow-hidden rounded-2xl border shadow-xl',
        isClaimTheme
          ? 'border-white/15 bg-black/30 text-white backdrop-blur'
          : 'border-border bg-surface text-gray-900',
        className,
      )}
    >
      <div
        className={cn(
          'flex items-center gap-3 border-b px-4 py-3',
          isClaimTheme ? 'border-white/10 bg-white/5' : 'border-border bg-page',
        )}
      >
        <span
          className={cn(
            'flex h-9 w-9 items-center justify-center rounded-lg',
            isClaimTheme ? 'bg-white/15 text-rose-100' : 'bg-accent-light text-primary',
          )}
        >
          <Headphones size={16} />
        </span>
        <div className="min-w-0">
          <p className={cn('text-sm font-semibold', isClaimTheme ? 'text-white' : 'text-gray-900')}>
            {title}
          </p>
          <p className={cn('truncate text-xs', isClaimTheme ? 'text-rose-100/75' : 'text-muted')}>
            {subtitle}
          </p>
        </div>
      </div>

      <div className="space-y-4 p-4">
        {!configured ? (
          <p
            className={cn(
              'rounded-lg border px-3 py-2 text-xs',
              isClaimTheme
                ? 'border-amber-300/30 bg-amber-950/40 text-amber-100'
                : 'border-amber-200 bg-amber-50 text-amber-900',
            )}
          >
            Voice calling is not configured. Set{' '}
            <code className="rounded bg-black/20 px-1">VITE_VAPI_PUBLIC_KEY</code> and{' '}
            <code className="rounded bg-black/20 px-1">VITE_VAPI_ASSISTANT_ID</code> in the
            environment, then redeploy.
          </p>
        ) : !hasCaller ? (
          <p
            className={cn(
              'rounded-lg border px-3 py-2 text-xs',
              isClaimTheme
                ? 'border-white/15 bg-white/5 text-rose-100/85'
                : 'border-border bg-page text-muted',
            )}
          >
            Verify your WhatsApp code first. The assistant only starts after your staff identity is
            confirmed.
          </p>
        ) : (
          <>
            {callerSummary && (
              <p
                className={cn(
                  'rounded-lg px-3 py-2 text-xs',
                  isClaimTheme ? 'bg-white/5 text-rose-100/90' : 'bg-page text-muted',
                )}
              >
                Calling as <span className="font-medium text-inherit">{callerSummary}</span>
              </p>
            )}

            <div className="flex items-center justify-between gap-3">
              <div>
                <p
                  className={cn(
                    'text-sm font-medium',
                    isClaimTheme ? 'text-white' : 'text-gray-900',
                  )}
                >
                  {label}
                </p>
                <p
                  className={cn(
                    'mt-0.5 font-mono text-xs tabular-nums',
                    isClaimTheme ? 'text-rose-100/70' : 'text-muted',
                  )}
                >
                  {formatCallDuration(elapsedSeconds)}
                </p>
              </div>
              <CallPulse state={state} speaker={speaker} claimTheme={isClaimTheme} />
            </div>

            <div className="grid grid-cols-2 gap-2 text-xs">
              <SpeakerChip
                claimTheme={isClaimTheme}
                active={speaker === 'user' && state === 'active'}
                icon={micDenied ? <MicOff size={12} /> : <Mic size={12} />}
                label="You"
              />
              <SpeakerChip
                claimTheme={isClaimTheme}
                active={speaker === 'assistant' && state === 'active'}
                icon={<Volume2 size={12} />}
                label="Assistant"
              />
            </div>

            {showError && (
              <p
                className={cn(
                  'rounded-lg border px-3 py-2 text-xs',
                  isClaimTheme
                    ? 'border-red-300/40 bg-red-950/50 text-red-100'
                    : 'border-red-200 bg-red-50 text-red-700',
                )}
              >
                {errorMessage}
              </p>
            )}

            <div className="flex gap-2">
              {canStart ? (
                <button
                  type="button"
                  onClick={() => {
                    if (state === 'ended' || state === 'error') resetToIdle()
                    if (callerContext) void startCall(callerContext)
                  }}
                  disabled={!configured || !hasCaller}
                  className={cn(
                    'inline-flex flex-1 items-center justify-center gap-2 rounded-xl px-3 py-2.5 text-sm font-semibold disabled:opacity-60',
                    isClaimTheme
                      ? 'bg-white text-[#3d0a16]'
                      : 'bg-primary text-white hover:bg-burgundy-dark',
                  )}
                >
                  <Phone size={15} />
                  Start Call
                </button>
              ) : (
                <button
                  type="button"
                  onClick={() => void endCall()}
                  disabled={state === 'ending'}
                  className={cn(
                    'inline-flex flex-1 items-center justify-center gap-2 rounded-xl px-3 py-2.5 text-sm font-semibold disabled:opacity-60',
                    isClaimTheme
                      ? 'bg-rose-600 text-white hover:bg-rose-500'
                      : 'bg-accent text-white hover:bg-accent-hover',
                  )}
                >
                  {state === 'ending' ? (
                    <Loader2 size={15} className="animate-spin" />
                  ) : (
                    <PhoneOff size={15} />
                  )}
                  {state === 'ending' ? 'Ending…' : 'End Call'}
                </button>
              )}
            </div>

            {(state === 'ended' || state === 'error') && (
              <button
                type="button"
                onClick={resetToIdle}
                className={cn(
                  'w-full text-center text-xs',
                  isClaimTheme ? 'text-rose-100/70 hover:text-white' : 'text-muted hover:text-gray-900',
                )}
              >
                Dismiss
              </button>
            )}
          </>
        )}
      </div>
    </div>
  )
}

function CallPulse({
  state,
  speaker,
  claimTheme,
}: {
  state: ReturnType<typeof useVapiCall>['state']
  speaker: ReturnType<typeof useVapiCall>['speaker']
  claimTheme: boolean
}) {
  const active = state === 'active'
  const color =
    speaker === 'assistant'
      ? 'bg-rose-400'
      : speaker === 'user'
        ? 'bg-emerald-400'
        : state === 'connecting' || state === 'ending'
          ? 'bg-amber-400'
          : claimTheme
            ? 'bg-white/40'
            : 'bg-gray-300'

  return (
    <div
      className={cn(
        'flex h-12 w-12 items-center justify-center rounded-full',
        claimTheme ? 'bg-white/10' : 'bg-page',
      )}
    >
      <span
        className={cn(
          'h-3.5 w-3.5 rounded-full',
          color,
          active && speaker !== 'none' && 'animate-pulse',
          (state === 'connecting' || state === 'ending') && 'animate-pulse',
        )}
      />
    </div>
  )
}

function SpeakerChip({
  active,
  icon,
  label,
  claimTheme,
}: {
  active: boolean
  icon: ReactNode
  label: string
  claimTheme: boolean
}) {
  return (
    <div
      className={cn(
        'flex items-center gap-1.5 rounded-lg border px-2.5 py-2',
        claimTheme
          ? active
            ? 'border-white/40 bg-white/15 text-white'
            : 'border-white/10 bg-black/20 text-rose-100/75'
          : active
            ? 'border-accent/40 bg-accent-light text-primary'
            : 'border-border bg-page text-muted',
      )}
    >
      {icon}
      <span className="font-medium">{label}</span>
      {active && <span className="ml-auto text-[10px] uppercase tracking-wide">Live</span>}
    </div>
  )
}
