import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useParams } from 'react-router-dom'
import { Camera, Car, Loader2, MapPin, Mic, MicOff, PhoneCall, ShieldCheck } from 'lucide-react'
import { AegisSplashLoader } from '../components/brand/AegisSplashLoader'
import { VapiCallPanel } from '../components/vapi/VapiCallPanel'
import {
  ROADSIDE_PROVIDERS,
  type RoadsideCallPreference,
  type RoadsideProvider,
} from '../config/roadside-providers'
import type { VapiCallerContext } from '../lib/vapi-caller-context'
import {
  clearClaimSession,
  completeVapiClaim,
  fetchClaimProfile,
  listClaimItems,
  loadClaimSession,
  matchClaimVehicle,
  resolveClaimQr,
  saveClaimSession,
  sendClaimOtp,
  submitEmployeeClaim,
  uploadClaimMedia,
  verifyClaimOtp,
  type ClaimPhotoMeta,
  type ClaimRiskItem,
  type ClaimVerifiedEmployee,
} from '../services/employee-claim.service'
import type { VapiCallSessionRecord } from '../types/vapi-call'

type Step = 'loading' | 'otp' | 'form' | 'done' | 'error'

interface GeoFix {
  latitude: number
  longitude: number
  accuracy: number
  captured_at: string
}

function isMotorCategory(category: string) {
  return /motor|vehicle/i.test(category)
}

export function EmployeeClaimPortalPage() {
  const { token = '' } = useParams<{ token: string }>()
  const [step, setStep] = useState<Step>('loading')
  const [error, setError] = useState<string | null>(null)
  const [firstName, setFirstName] = useState('')
  const [waMasked, setWaMasked] = useState('')
  const [otpCode, setOtpCode] = useState('')
  const [sendingOtp, setSendingOtp] = useState(false)
  const [verifying, setVerifying] = useState(false)
  const [devCode, setDevCode] = useState<string | null>(null)
  const [otpChannel, setOtpChannel] = useState<string | null>(null)
  const [sessionToken, setSessionToken] = useState<string | null>(null)
  const [employeeName, setEmployeeName] = useState('')
  const [verifiedEmployee, setVerifiedEmployee] = useState<ClaimVerifiedEmployee | null>(null)
  const [completingVoice, setCompletingVoice] = useState(false)
  const [voiceNotice, setVoiceNotice] = useState<string | null>(null)
  const [stagedVapi, setStagedVapi] = useState<{
    callId: string
    recordingPath: string | null
    transcriptPath: string | null
    transcript: string | null
  } | null>(null)

  const [items, setItems] = useState<ClaimRiskItem[]>([])
  const [loadingItems, setLoadingItems] = useState(false)
  const [selectedItemId, setSelectedItemId] = useState<string | null>(null)
  const [zohoPolicyId, setZohoPolicyId] = useState<string | null>(null)
  const [identifyVehicle, setIdentifyVehicle] = useState(false)
  const [plateText, setPlateText] = useState('')
  const [matchingVehicle, setMatchingVehicle] = useState(false)
  const [matchMessage, setMatchMessage] = useState<string | null>(null)
  const [extensionHints, setExtensionHints] = useState<string[]>([])

  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [brokerMessage, setBrokerMessage] = useState('')
  const [geo, setGeo] = useState<GeoFix | null>(null)
  const [geoError, setGeoError] = useState<string | null>(null)
  const [photos, setPhotos] = useState<ClaimPhotoMeta[]>([])
  const [uploadingPhoto, setUploadingPhoto] = useState(false)
  const [recording, setRecording] = useState(false)
  const [voiceBlob, setVoiceBlob] = useState<Blob | null>(null)
  const [voiceUrl, setVoiceUrl] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)
  const [roadsideNeeded, setRoadsideNeeded] = useState(false)
  const [roadsidePref, setRoadsidePref] = useState<RoadsideCallPreference | null>(null)
  const [selectedProvider, setSelectedProvider] = useState<RoadsideProvider | null>(null)
  const [shownProviders, setShownProviders] = useState<RoadsideProvider[]>([])
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const chunksRef = useRef<BlobPart[]>([])
  const fileInputRef = useRef<HTMLInputElement | null>(null)
  const discInputRef = useRef<HTMLInputElement | null>(null)

  const selectedItem = items.find((i) => i.id === selectedItemId) ?? null
  const showVehicleId =
    identifyVehicle || (selectedItem != null && isMotorCategory(selectedItem.category))

  const callerContext = useMemo<VapiCallerContext | null>(() => {
    if (!verifiedEmployee) return null
    return {
      employee: verifiedEmployee,
      claim: {
        selected_item_id: selectedItem?.id ?? null,
        selected_item_name: selectedItem?.name ?? null,
        selected_item_category: selectedItem?.category ?? null,
        latitude: geo?.latitude ?? null,
        longitude: geo?.longitude ?? null,
      },
    }
  }, [verifiedEmployee, selectedItem, geo])

  const watchGeo = useCallback(() => {
    if (!navigator.geolocation) {
      setGeoError('Geolocation is not supported on this device.')
      return
    }
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setGeo({
          latitude: pos.coords.latitude,
          longitude: pos.coords.longitude,
          accuracy: pos.coords.accuracy,
          captured_at: new Date().toISOString(),
        })
        setGeoError(null)
      },
      (err) => setGeoError(err.message || 'Unable to get location'),
      { enableHighAccuracy: true, timeout: 15000, maximumAge: 0 },
    )
  }, [])

  const loadItems = useCallback(async (session: string) => {
    setLoadingItems(true)
    try {
      const result = await listClaimItems(session)
      setItems(result.items)
      if (result.items.length === 1) {
        setSelectedItemId(result.items[0]!.id)
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load risk items')
    } finally {
      setLoadingItems(false)
    }
  }, [])

  useEffect(() => {
    if (!token) {
      setStep('error')
      setError('Missing claim QR token.')
      return
    }
    let cancelled = false
    void (async () => {
      try {
        const resolved = await resolveClaimQr(token)
        if (cancelled) return
        setFirstName(resolved.employee.first_name)
        setWaMasked(resolved.employee.whatsapp_masked)
        const existing = loadClaimSession()
        if (existing) {
          setSessionToken(existing.token)
          setStep('form')
          watchGeo()
          try {
            const profile = await fetchClaimProfile(existing.token)
            if (!cancelled) {
              setVerifiedEmployee(profile.employee)
              setEmployeeName(profile.employee.full_name)
            }
          } catch {
            // Session may be stale — fall through to OTP
            if (!cancelled) {
              clearClaimSession()
              setSessionToken(null)
              setStep('otp')
              return
            }
          }
          await loadItems(existing.token)
        } else {
          setStep('otp')
        }
      } catch (err) {
        if (cancelled) return
        setStep('error')
        setError(err instanceof Error ? err.message : 'Invalid QR code')
      }
    })()
    return () => {
      cancelled = true
    }
  }, [token, watchGeo, loadItems])

  useEffect(() => {
    return () => {
      if (voiceUrl) URL.revokeObjectURL(voiceUrl)
    }
  }, [voiceUrl])

  async function handleSendOtp() {
    setSendingOtp(true)
    setError(null)
    setDevCode(null)
    try {
      const result = await sendClaimOtp(token)
      setWaMasked(result.whatsapp_masked)
      setOtpChannel(result.channel)
      if (result.dev_code) setDevCode(result.dev_code)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to send OTP')
    } finally {
      setSendingOtp(false)
    }
  }

  async function handleVerifyOtp(e: React.FormEvent) {
    e.preventDefault()
    setVerifying(true)
    setError(null)
    try {
      const result = await verifyClaimOtp(token, otpCode)
      saveClaimSession(result.session_token, result.expires_at)
      setSessionToken(result.session_token)
      setVerifiedEmployee(result.employee)
      setEmployeeName(result.employee.full_name)
      setStep('form')
      watchGeo()
      await loadItems(result.session_token)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Verification failed')
    } finally {
      setVerifying(false)
    }
  }

  async function runVehicleMatch(opts: { plateText?: string; discFile?: File | null }) {
    if (!sessionToken) return
    setMatchingVehicle(true)
    setMatchMessage(null)
    setError(null)
    try {
      const result = await matchClaimVehicle(sessionToken, opts)
      if (result.matched && result.item) {
        setSelectedItemId(result.item.id)
        setZohoPolicyId(result.policy?.zoho_policy_id ?? null)
        setExtensionHints(result.extension_notes ?? [])
        setMatchMessage(`Matched ${result.item.name}${result.plate ? ` (${result.plate})` : ''}`)
        if (!items.some((i) => i.id === result.item!.id)) {
          setItems((prev) => [...prev, result.item!])
        }
      } else {
        setMatchMessage(
          `No insured vehicle matched plate ${result.plate || opts.plateText || ''}. Select an item manually.`,
        )
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Vehicle match failed')
    } finally {
      setMatchingVehicle(false)
    }
  }

  async function onPhotoSelected(fileList: FileList | null) {
    if (!fileList?.length || !sessionToken) return
    setUploadingPhoto(true)
    setError(null)
    try {
      const fix = await new Promise<GeoFix | null>((resolve) => {
        if (!navigator.geolocation) {
          resolve(geo)
          return
        }
        navigator.geolocation.getCurrentPosition(
          (pos) =>
            resolve({
              latitude: pos.coords.latitude,
              longitude: pos.coords.longitude,
              accuracy: pos.coords.accuracy,
              captured_at: new Date().toISOString(),
            }),
          () => resolve(geo),
          { enableHighAccuracy: true, timeout: 8000 },
        )
      })
      if (fix) setGeo(fix)

      const next: ClaimPhotoMeta[] = [...photos]
      for (const file of Array.from(fileList)) {
        const url = await uploadClaimMedia(sessionToken, file, file.name, file.type || 'image/jpeg')
        next.push({
          url,
          captured_at: fix?.captured_at ?? new Date().toISOString(),
          latitude: fix?.latitude ?? null,
          longitude: fix?.longitude ?? null,
          accuracy: fix?.accuracy ?? null,
        })
      }
      setPhotos(next)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Photo upload failed')
    } finally {
      setUploadingPhoto(false)
      if (fileInputRef.current) fileInputRef.current.value = ''
    }
  }

  async function startRecording() {
    setError(null)
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      const recorder = new MediaRecorder(stream)
      chunksRef.current = []
      recorder.ondataavailable = (e) => {
        if (e.data.size > 0) chunksRef.current.push(e.data)
      }
      recorder.onstop = () => {
        stream.getTracks().forEach((t) => t.stop())
        const blob = new Blob(chunksRef.current, { type: 'audio/webm' })
        setVoiceBlob(blob)
        setVoiceUrl(URL.createObjectURL(blob))
      }
      mediaRecorderRef.current = recorder
      recorder.start()
      setRecording(true)
    } catch {
      setError('Microphone permission is required to record a message.')
    }
  }

  function stopRecording() {
    mediaRecorderRef.current?.stop()
    setRecording(false)
  }

  async function handleVapiCallEnded(session: VapiCallSessionRecord) {
    if (!sessionToken || !session.callId) {
      setVoiceNotice('Call ended, but no call id was available to lodge the claim.')
      return
    }
    setCompletingVoice(true)
    setError(null)
    setVoiceNotice('Saving call recording and lodging your claim…')
    try {
      const result = await completeVapiClaim(sessionToken, {
        vapi_call_id: session.callId,
        risk_item_id: selectedItemId,
        latitude: geo?.latitude ?? null,
        longitude: geo?.longitude ?? null,
        location_accuracy: geo?.accuracy ?? null,
        transcript_fallback: session.messages
          .filter((m) => m.role === 'user' || m.role === 'assistant')
          .map((m) => ({ role: String(m.role), text: m.text })),
      })

      if (result.status === 'submitted') {
        clearClaimSession()
        setShownProviders([])
        setVoiceNotice('Voice claim submitted. Recording and transcript were saved.')
        setStep('done')
        return
      }

      const draft = result.draft
      if (draft?.title) setTitle(draft.title)
      if (draft?.description) setDescription(draft.description)
      if (draft?.broker_message) setBrokerMessage(draft.broker_message)
      if (draft?.roadside_needed) setRoadsideNeeded(true)
      if (draft?.risk_item_id) setSelectedItemId(draft.risk_item_id)
      setStagedVapi({
        callId: result.vapi_call_id ?? session.callId,
        recordingPath: result.vapi_recording_path ?? null,
        transcriptPath: result.vapi_transcript_path ?? null,
        transcript: result.vapi_transcript ?? null,
      })
      setVoiceNotice(
        'We saved the call recording and transcript. Please confirm the claim details below and submit.',
      )
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to complete voice claim')
      setVoiceNotice(null)
    } finally {
      setCompletingVoice(false)
    }
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!sessionToken) return
    if (!selectedItemId) {
      setError('Select a risk item to claim against.')
      return
    }
    setSubmitting(true)
    setError(null)
    try {
      let voice_note_url: string | null = null
      if (voiceBlob) {
        voice_note_url = await uploadClaimMedia(
          sessionToken,
          voiceBlob,
          `voice-${Date.now()}.webm`,
          voiceBlob.type || 'audio/webm',
        )
      }
      const brokerParts = [brokerMessage.trim(), ...extensionHints].filter(Boolean)
      await submitEmployeeClaim(sessionToken, {
        title: title.trim() || `Claim from ${employeeName || firstName}`,
        description: description.trim(),
        broker_message: brokerParts.join('\n') || undefined,
        risk_item_id: selectedItemId,
        zoho_policy_id: zohoPolicyId,
        latitude: geo?.latitude ?? null,
        longitude: geo?.longitude ?? null,
        location_accuracy: geo?.accuracy ?? null,
        photo_meta: photos,
        attachments: [
          ...photos.map((p) => p.url),
          ...(stagedVapi?.transcriptPath ? [stagedVapi.transcriptPath] : []),
          ...(stagedVapi?.recordingPath ? [stagedVapi.recordingPath] : []),
        ],
        voice_note_url: stagedVapi?.recordingPath ?? voice_note_url,
        roadside_needed: roadsideNeeded,
        roadside_call_preference: roadsideNeeded ? roadsidePref : null,
        roadside_provider:
          roadsideNeeded && roadsidePref === 'broker' && selectedProvider
            ? { ...selectedProvider }
            : null,
        vapi_call_id: stagedVapi?.callId ?? null,
        vapi_transcript: stagedVapi?.transcript ?? null,
        vapi_recording_path: stagedVapi?.recordingPath ?? null,
        vapi_transcript_path: stagedVapi?.transcriptPath ?? null,
        submitted_via: stagedVapi ? 'employee_vapi' : 'employee_qr',
      })
      clearClaimSession()
      setStagedVapi(null)
      if (roadsideNeeded && roadsidePref === 'broker') {
        setShownProviders(ROADSIDE_PROVIDERS)
      } else {
        setShownProviders([])
      }
      setStep('done')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to submit claim')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-[#3d0a16] via-[#5a1224] to-[#1a050a] px-4 py-8 text-white">
      <div className="mx-auto w-full max-w-lg space-y-6">
        <header className="text-center">
          <p className="text-xs font-semibold uppercase tracking-[0.2em] text-rose-200/80">
            Aegis by TIH
          </p>
          <h1 className="mt-2 text-2xl font-semibold">Employee claim</h1>
          <p className="mt-1 text-sm text-rose-100/80">
            Verify via WhatsApp, then log your claim by voice with the assistant or complete the
            form with photos, location and a voice note.
          </p>
        </header>

        {error && (
          <p className="rounded-lg border border-red-300/40 bg-red-950/40 px-4 py-3 text-sm text-red-100">
            {error}
          </p>
        )}

        {step === 'loading' && <AegisSplashLoader />}

        {step === 'error' && (
          <p className="rounded-lg border border-white/10 bg-black/20 p-6 text-center text-sm">
            This QR code is invalid or expired. Ask your broker for a new employee claim QR.
          </p>
        )}

        {step === 'otp' && (
          <div className="space-y-4 rounded-2xl border border-white/10 bg-black/25 p-5 shadow-xl backdrop-blur">
            <div className="flex items-start gap-3">
              <ShieldCheck className="mt-0.5 shrink-0 text-rose-200" size={20} />
              <div>
                <p className="font-medium">Hi {firstName || 'there'}</p>
                <p className="mt-1 text-sm text-rose-100/80">
                  We will send a one-time code to {waMasked}. Enter it to open the claim form.
                </p>
              </div>
            </div>

            <button
              type="button"
              onClick={handleSendOtp}
              disabled={sendingOtp}
              className="w-full rounded-xl bg-white px-4 py-3 text-sm font-semibold text-[#3d0a16] disabled:opacity-60"
            >
              {sendingOtp ? 'Sending…' : 'Send verification code'}
            </button>

            {otpChannel === 'twilio_sms' && (
              <p className="rounded-lg bg-white/10 px-3 py-2 text-xs text-rose-100/85">
                Code sent by SMS (this Twilio number is not WhatsApp-enabled yet).
              </p>
            )}
            {otpChannel?.includes('whatsapp') && (
              <p className="rounded-lg bg-white/10 px-3 py-2 text-xs text-rose-100/85">
                Code sent on WhatsApp.
              </p>
            )}

            {devCode && (
              <p className="rounded-lg bg-amber-500/20 px-3 py-2 text-xs text-amber-100">
                Dev mode (Twilio not configured): code is <strong>{devCode}</strong>
              </p>
            )}

            <form onSubmit={handleVerifyOtp} className="space-y-3">
              <label className="block text-sm">
                <span className="mb-1 block text-rose-100/90">Verification code</span>
                <input
                  inputMode="numeric"
                  autoComplete="one-time-code"
                  className="w-full rounded-xl border border-white/20 bg-white/10 px-3 py-3 text-lg tracking-widest text-white placeholder:text-white/40"
                  placeholder="6-digit code"
                  value={otpCode}
                  onChange={(e) => setOtpCode(e.target.value.replace(/\D/g, '').slice(0, 6))}
                  required
                />
              </label>
              <button
                type="submit"
                disabled={verifying || otpCode.length < 4}
                className="w-full rounded-xl border border-white/30 px-4 py-3 text-sm font-semibold disabled:opacity-60"
              >
                {verifying ? 'Verifying…' : 'Verify & continue'}
              </button>
            </form>
          </div>
        )}

        {step === 'form' && (
          <div className="space-y-5">
            <VapiCallPanel
              theme="claim"
              callerContext={callerContext}
              onCallEnded={(session) => void handleVapiCallEnded(session)}
            />
            {(completingVoice || voiceNotice) && (
              <p className="rounded-xl border border-white/15 bg-white/5 px-3 py-2 text-xs text-rose-100/90">
                {completingVoice ? (
                  <span className="inline-flex items-center gap-2">
                    <Loader2 size={12} className="animate-spin" /> Saving recording & lodging claim…
                  </span>
                ) : (
                  voiceNotice
                )}
              </p>
            )}
            {stagedVapi?.transcript && (
              <details className="rounded-xl border border-white/15 bg-black/20 px-3 py-2 text-xs text-rose-100/85">
                <summary className="cursor-pointer font-medium text-white">Call transcript</summary>
                <pre className="mt-2 max-h-40 overflow-auto whitespace-pre-wrap font-sans">
                  {stagedVapi.transcript}
                </pre>
              </details>
            )}

            <form
              onSubmit={handleSubmit}
              className="space-y-5 rounded-2xl border border-white/10 bg-black/25 p-5 shadow-xl backdrop-blur"
            >
            <p className="text-sm text-rose-100/80">
              Signed in as <span className="font-medium text-white">{employeeName || firstName}</span>
              {verifiedEmployee?.company_name ? (
                <span className="text-rose-100/70"> · {verifiedEmployee.company_name}</span>
              ) : null}
            </p>

            {selectedItem && (
              <p className="rounded-xl border border-emerald-300/30 bg-emerald-950/40 px-3 py-2 text-sm text-emerald-50">
                Claiming against: <span className="font-semibold">{selectedItem.name}</span>
              </p>
            )}

            <div className="space-y-2">
              <p className="text-sm font-medium">Select insured item *</p>
              {loadingItems ? (
                <p className="flex items-center gap-2 text-xs text-rose-100/80">
                  <Loader2 size={12} className="animate-spin" /> Loading your items…
                </p>
              ) : items.length === 0 ? (
                <p className="text-xs text-rose-100/75">
                  No items are assigned to you yet. Ask your broker to assign risk items, or identify
                  a vehicle below.
                </p>
              ) : (
                <div className="max-h-56 space-y-2 overflow-y-auto">
                  {items.map((item) => (
                    <label
                      key={item.id}
                      className={`block cursor-pointer rounded-lg border px-3 py-2 text-xs ${
                        selectedItemId === item.id
                          ? 'border-white bg-white/15'
                          : 'border-white/15 bg-black/20'
                      }`}
                    >
                      <input
                        type="radio"
                        name="riskItem"
                        className="sr-only"
                        checked={selectedItemId === item.id}
                        onChange={() => {
                          setSelectedItemId(item.id)
                          setZohoPolicyId(null)
                        }}
                      />
                      <span className="font-medium text-white">{item.name}</span>
                      <span className="mt-0.5 block text-rose-100/75">
                        {item.category}
                        {item.branch ? ` · ${item.branch}` : ''}
                      </span>
                    </label>
                  ))}
                </div>
              )}
              <label className="flex items-center gap-2 text-xs text-rose-100/85">
                <input
                  type="checkbox"
                  checked={identifyVehicle}
                  onChange={(e) => setIdentifyVehicle(e.target.checked)}
                  className="rounded border-white/30"
                />
                Identify vehicle by number plate / licence disc
              </label>
            </div>

            {showVehicleId && (
              <div className="space-y-3 rounded-xl border border-white/15 bg-white/5 p-3">
                <p className="flex items-center gap-2 text-sm font-medium">
                  <Car size={16} /> Vehicle identification
                </p>
                <label className="block text-sm">
                  <span className="mb-1 block text-xs text-rose-100/80">Number plate</span>
                  <div className="flex gap-2">
                    <input
                      className="w-full rounded-xl border border-white/20 bg-white/10 px-3 py-2 text-white uppercase tracking-wide"
                      value={plateText}
                      onChange={(e) => setPlateText(e.target.value.toUpperCase())}
                      placeholder="e.g. CA123456"
                    />
                    <button
                      type="button"
                      disabled={matchingVehicle || !plateText.trim()}
                      onClick={() => void runVehicleMatch({ plateText })}
                      className="shrink-0 rounded-xl bg-white/15 px-3 py-2 text-xs font-semibold disabled:opacity-60"
                    >
                      Match
                    </button>
                  </div>
                </label>
                <div>
                  <p className="mb-1 text-xs text-rose-100/80">Or upload licence disc / plate photo</p>
                  <input
                    ref={discInputRef}
                    type="file"
                    accept="image/*"
                    capture="environment"
                    className="block w-full text-xs text-rose-100/80 file:mr-3 file:rounded-lg file:border-0 file:bg-white file:px-3 file:py-2 file:text-xs file:font-semibold file:text-[#3d0a16]"
                    onChange={(e) => {
                      const file = e.target.files?.[0]
                      if (file) void runVehicleMatch({ discFile: file, plateText: plateText || undefined })
                      e.target.value = ''
                    }}
                  />
                </div>
                {matchingVehicle && (
                  <p className="flex items-center gap-2 text-xs text-rose-100/80">
                    <Loader2 size={12} className="animate-spin" /> Matching against schedule…
                  </p>
                )}
                {matchMessage && <p className="text-xs text-rose-100/90">{matchMessage}</p>}
                {extensionHints.length > 0 && (
                  <ul className="space-y-1 text-xs text-amber-100/90">
                    {extensionHints.map((n) => (
                      <li key={n}>• {n}</li>
                    ))}
                  </ul>
                )}
              </div>
            )}

            <label className="block text-sm">
              <span className="mb-1 block">What happened? *</span>
              <input
                className="w-full rounded-xl border border-white/20 bg-white/10 px-3 py-2.5 text-white"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="Short claim title"
                required
              />
            </label>

            <label className="block text-sm">
              <span className="mb-1 block">Details</span>
              <textarea
                className="min-h-28 w-full rounded-xl border border-white/20 bg-white/10 px-3 py-2.5 text-white"
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                placeholder="Describe the incident, damage, and when it happened"
              />
            </label>

            <label className="block text-sm">
              <span className="mb-1 block">Message for the broker</span>
              <textarea
                className="min-h-20 w-full rounded-xl border border-white/20 bg-white/10 px-3 py-2.5 text-white"
                value={brokerMessage}
                onChange={(e) => setBrokerMessage(e.target.value)}
              />
            </label>

            <div className="space-y-3 rounded-xl border border-white/15 bg-white/5 p-3">
              <p className="flex items-center gap-2 text-sm font-medium">
                <PhoneCall size={16} /> Emergency roadside assistance
              </p>
              <label className="flex items-center gap-2 text-sm">
                <input
                  type="checkbox"
                  checked={roadsideNeeded}
                  onChange={(e) => {
                    setRoadsideNeeded(e.target.checked)
                    if (!e.target.checked) {
                      setRoadsidePref(null)
                      setSelectedProvider(null)
                    }
                  }}
                  className="rounded border-white/30"
                />
                I need emergency roadside assistance
              </label>
              {roadsideNeeded && (
                <div className="space-y-2 pl-1">
                  <p className="text-xs text-rose-100/80">Who should call the assist provider?</p>
                  <label className="flex items-start gap-2 text-sm">
                    <input
                      type="radio"
                      name="roadsidePref"
                      checked={roadsidePref === 'self'}
                      onChange={() => {
                        setRoadsidePref('self')
                        setSelectedProvider(null)
                      }}
                      className="mt-1"
                    />
                    <span>I will call them myself</span>
                  </label>
                  <label className="flex items-start gap-2 text-sm">
                    <input
                      type="radio"
                      name="roadsidePref"
                      checked={roadsidePref === 'broker'}
                      onChange={() => setRoadsidePref('broker')}
                      className="mt-1"
                    />
                    <span>Ask the broker / administrator to call on my behalf</span>
                  </label>
                  {roadsidePref === 'broker' && (
                    <div className="space-y-2 pt-1">
                      <p className="text-xs text-rose-100/80">
                        Choose the assist provider for your area (shown again after you submit):
                      </p>
                      <div className="max-h-48 space-y-2 overflow-y-auto">
                        {ROADSIDE_PROVIDERS.map((p) => (
                          <label
                            key={p.id}
                            className={`block cursor-pointer rounded-lg border px-3 py-2 text-xs ${
                              selectedProvider?.id === p.id
                                ? 'border-white bg-white/15'
                                : 'border-white/15 bg-black/20'
                            }`}
                          >
                            <input
                              type="radio"
                              name="provider"
                              className="sr-only"
                              checked={selectedProvider?.id === p.id}
                              onChange={() => setSelectedProvider(p)}
                            />
                            <span className="font-medium text-white">{p.name}</span>
                            <span className="mt-0.5 block text-rose-100/75">{p.area}</span>
                            <span className="mt-0.5 block text-rose-100/60">
                              {p.phone} · {p.hours}
                            </span>
                          </label>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              )}
            </div>

            <div className="rounded-xl border border-white/15 bg-white/5 p-3">
              <div className="mb-2 flex items-center justify-between gap-2">
                <p className="flex items-center gap-2 text-sm font-medium">
                  <MapPin size={16} /> Location
                </p>
                <button
                  type="button"
                  onClick={watchGeo}
                  className="text-xs underline text-rose-100/90"
                >
                  Refresh
                </button>
              </div>
              {geo ? (
                <p className="text-xs text-rose-100/80">
                  {geo.latitude.toFixed(5)}, {geo.longitude.toFixed(5)}
                  {geo.accuracy ? ` (±${Math.round(geo.accuracy)}m)` : ''} ·{' '}
                  {new Date(geo.captured_at).toLocaleString()}
                </p>
              ) : (
                <p className="text-xs text-rose-100/70">
                  {geoError ?? 'Fetching GPS… allow location access when prompted.'}
                </p>
              )}
            </div>

            <div className="space-y-2">
              <p className="flex items-center gap-2 text-sm font-medium">
                <Camera size={16} /> Photos (timestamp + GPS stamped)
              </p>
              <input
                ref={fileInputRef}
                type="file"
                accept="image/*"
                capture="environment"
                multiple
                className="block w-full text-sm text-rose-100/80 file:mr-3 file:rounded-lg file:border-0 file:bg-white file:px-3 file:py-2 file:text-sm file:font-semibold file:text-[#3d0a16]"
                onChange={(e) => void onPhotoSelected(e.target.files)}
              />
              {uploadingPhoto && (
                <p className="flex items-center gap-2 text-xs text-rose-100/80">
                  <Loader2 size={12} className="animate-spin" /> Uploading…
                </p>
              )}
              {photos.length > 0 && (
                <ul className="space-y-2 text-xs text-rose-100/85">
                  {photos.map((p) => (
                    <li key={p.url} className="rounded-lg bg-black/20 px-3 py-2">
                      <span className="underline">Photo</span>{' '}
                      · {new Date(p.captured_at).toLocaleString()}
                      {p.latitude != null && p.longitude != null
                        ? ` · ${p.latitude.toFixed(5)}, ${p.longitude.toFixed(5)}`
                        : ''}
                    </li>
                  ))}
                </ul>
              )}
            </div>

            <div className="space-y-2">
              <p className="flex items-center gap-2 text-sm font-medium">
                <Mic size={16} /> Voice message
              </p>
              <div className="flex flex-wrap gap-2">
                {!recording ? (
                  <button
                    type="button"
                    onClick={startRecording}
                    className="inline-flex items-center gap-2 rounded-xl bg-white/15 px-3 py-2 text-sm"
                  >
                    <Mic size={14} /> Record
                  </button>
                ) : (
                  <button
                    type="button"
                    onClick={stopRecording}
                    className="inline-flex items-center gap-2 rounded-xl bg-red-600/80 px-3 py-2 text-sm"
                  >
                    <MicOff size={14} /> Stop
                  </button>
                )}
              </div>
              {voiceUrl && <audio controls src={voiceUrl} className="w-full" />}
            </div>

            <button
              type="submit"
              disabled={
                submitting ||
                !selectedItemId ||
                (roadsideNeeded && !roadsidePref) ||
                (roadsideNeeded && roadsidePref === 'broker' && !selectedProvider)
              }
              className="w-full rounded-xl bg-white px-4 py-3 text-sm font-semibold text-[#3d0a16] disabled:opacity-60"
            >
              {submitting ? 'Submitting…' : 'Submit claim'}
            </button>
          </form>
          </div>
        )}

        {step === 'done' && (
          <div className="space-y-4 rounded-2xl border border-emerald-300/30 bg-emerald-950/40 p-6">
            <div className="text-center">
              <p className="text-lg font-semibold text-emerald-100">Claim submitted</p>
              <p className="mt-2 text-sm text-emerald-100/80">
                Your broker has received the details
                {stagedVapi || voiceNotice?.includes('Voice claim')
                  ? ', call recording and transcript'
                  : ', photos, location and voice note'}
                .
              </p>
            </div>
            {shownProviders.length > 0 && (
              <div className="space-y-3 border-t border-emerald-300/20 pt-4 text-left">
                <p className="text-sm font-medium text-emerald-50">
                  Emergency assist providers (broker will call on your behalf)
                </p>
                <p className="text-xs text-emerald-100/70">
                  Keep these details handy. Your selected provider was saved on the claim for the
                  administrator.
                </p>
                <ul className="space-y-2">
                  {shownProviders.map((p) => (
                    <li
                      key={p.id}
                      className={`rounded-xl border px-3 py-3 text-xs ${
                        selectedProvider?.id === p.id
                          ? 'border-white/50 bg-white/10'
                          : 'border-emerald-300/20 bg-black/20'
                      }`}
                    >
                      <p className="font-semibold text-white">
                        {p.name}
                        {selectedProvider?.id === p.id ? ' · selected' : ''}
                      </p>
                      <p className="mt-0.5 text-emerald-100/80">{p.area}</p>
                      <p className="mt-1 text-emerald-100/90">
                        {p.phone} · {p.hours}
                      </p>
                      <p className="mt-1 text-emerald-100/65">{p.notes}</p>
                    </li>
                  ))}
                </ul>
              </div>
            )}
            {roadsideNeeded && roadsidePref === 'self' && (
              <p className="text-center text-xs text-emerald-100/75">
                You chose to call roadside assistance yourself. Use your assist product number when
                you dial.
              </p>
            )}
          </div>
        )}
      </div>
    </div>
  )
}
