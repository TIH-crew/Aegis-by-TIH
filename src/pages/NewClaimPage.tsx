import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { ArrowLeft, Loader2, Mic, MicOff, Square, Upload } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useDataService } from '../hooks/useDataService'
import { createClaim, fetchPolicies, uploadClaimAttachment } from '../services/crm.service'
import { formatCurrency } from '../lib/utils'
import type { PolicySummary } from '../types/crm'
import type { RiskItem } from '../types'

export function NewClaimPage() {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const { accountId } = useAuth()
  const dataService = useDataService()
  const [policies, setPolicies] = useState<PolicySummary[]>([])
  const [riskItems, setRiskItems] = useState<RiskItem[]>([])
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [brokerMessage, setBrokerMessage] = useState('')
  const [policyId, setPolicyId] = useState('')
  const [riskItemId, setRiskItemId] = useState('')
  const [scheduleItemKey, setScheduleItemKey] = useState('')
  const [scheduleItemName, setScheduleItemName] = useState('')
  const [sumInsured, setSumInsured] = useState<number | null>(null)
  const [claimAmount, setClaimAmount] = useState('')
  const [files, setFiles] = useState<File[]>([])
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const [recording, setRecording] = useState(false)
  const [voiceBlob, setVoiceBlob] = useState<Blob | null>(null)
  const [voiceUrl, setVoiceUrl] = useState<string | null>(null)
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const chunksRef = useRef<BlobPart[]>([])

  const prefilled = useMemo(() => {
    return {
      policyId: searchParams.get('policyId') ?? '',
      portalPolicyId: searchParams.get('portalPolicyId') ?? '',
      riskItemId: searchParams.get('riskItemId') ?? '',
      itemKey: searchParams.get('itemKey') ?? '',
      itemName: searchParams.get('itemName') ?? '',
      sumInsured: searchParams.get('sumInsured'),
      section: searchParams.get('section') ?? '',
    }
  }, [searchParams])

  useEffect(() => {
    void fetchPolicies().then(setPolicies).catch(() => setPolicies([]))
    if (dataService) void dataService.getRiskItems().then(setRiskItems)
  }, [dataService])

  useEffect(() => {
    if (prefilled.policyId) setPolicyId(prefilled.policyId)
    else if (prefilled.portalPolicyId) setPolicyId(prefilled.portalPolicyId)

    if (prefilled.riskItemId) setRiskItemId(prefilled.riskItemId)
    if (prefilled.itemKey) setScheduleItemKey(prefilled.itemKey)
    if (prefilled.itemName) {
      setScheduleItemName(prefilled.itemName)
      setTitle(`Claim — ${prefilled.itemName}`)
      setDescription(
        [
          `Claim against schedule item: ${prefilled.itemName}`,
          prefilled.section ? `Section: ${prefilled.section}` : null,
          prefilled.sumInsured
            ? `Sum insured: ${formatCurrency(Number(prefilled.sumInsured))}`
            : null,
        ]
          .filter(Boolean)
          .join('\n'),
      )
    }
    if (prefilled.sumInsured) {
      const n = Number(prefilled.sumInsured)
      if (Number.isFinite(n)) {
        setSumInsured(n)
        setClaimAmount(String(n))
      }
    }
  }, [prefilled])

  useEffect(() => {
    return () => {
      if (voiceUrl) URL.revokeObjectURL(voiceUrl)
    }
  }, [voiceUrl])

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
        const blob = new Blob(chunksRef.current, { type: recorder.mimeType || 'audio/webm' })
        setVoiceBlob(blob)
        setVoiceUrl((prev) => {
          if (prev) URL.revokeObjectURL(prev)
          return URL.createObjectURL(blob)
        })
      }
      mediaRecorderRef.current = recorder
      recorder.start()
      setRecording(true)
    } catch {
      setError('Microphone access is required to record a voice message.')
    }
  }

  function stopRecording() {
    mediaRecorderRef.current?.stop()
    setRecording(false)
  }

  function clearVoice() {
    setVoiceBlob(null)
    setVoiceUrl((prev) => {
      if (prev) URL.revokeObjectURL(prev)
      return null
    })
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    const hasItem = Boolean(riskItemId || scheduleItemKey)
    if (!accountId || !policyId || !title.trim() || !hasItem) {
      setError('Complete all required fields (policy and item).')
      return
    }

    setSaving(true)
    setError(null)
    try {
      const attachments = []
      for (const file of files) {
        attachments.push(await uploadClaimAttachment(accountId, file))
      }

      let voice_note_url: string | undefined
      if (voiceBlob) {
        const voiceFile = new File([voiceBlob], `broker-voice-${Date.now()}.webm`, {
          type: voiceBlob.type || 'audio/webm',
        })
        const uploaded = await uploadClaimAttachment(accountId, voiceFile)
        voice_note_url = uploaded.url
      }

      await createClaim({
        title: title.trim(),
        description: description.trim() || undefined,
        risk_item_id: riskItemId || undefined,
        zoho_policy_id: policyId,
        attachments,
        broker_message: brokerMessage.trim() || undefined,
        voice_note_url,
        schedule_item_key: scheduleItemKey || undefined,
        schedule_item_name: scheduleItemName || undefined,
        claim_amount: claimAmount ? Number(claimAmount) : undefined,
      })

      navigate('/collections/claims', { replace: true })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to submit claim')
    } finally {
      setSaving(false)
    }
  }

  const selectedRisk = riskItems.find((r) => r.id === riskItemId)

  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <Link
        to="/collections/claims"
        className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
      >
        <ArrowLeft size={14} /> Back to claims
      </Link>

      <div>
        <h1 className="text-2xl font-semibold">New claim</h1>
        <p className="text-sm text-muted">
          Lodge a claim against a policy item. Add a voice note or message for your broker, then
          fill in the claim details.
        </p>
      </div>

      <form onSubmit={handleSubmit} className="space-y-4 rounded-lg border border-border bg-surface p-6 shadow-sm">
        {(scheduleItemName || selectedRisk) && (
          <div className="rounded-lg border border-border bg-page px-3 py-2 text-sm">
            <p className="text-xs font-medium uppercase text-muted">Claiming against</p>
            <p className="font-medium text-gray-900">
              {scheduleItemName || selectedRisk?.name}
            </p>
            {sumInsured != null && (
              <p className="text-xs text-muted">Sum insured {formatCurrency(sumInsured)}</p>
            )}
          </div>
        )}

        <fieldset className="space-y-3 rounded-lg border border-border p-4">
          <legend className="px-1 text-sm font-medium">Message to broker</legend>
          <p className="text-xs text-muted">
            Record a short voice note and/or type a message. Both are optional but recommended.
          </p>

          <div className="flex flex-wrap items-center gap-2">
            {!recording ? (
              <button
                type="button"
                onClick={() => void startRecording()}
                className="inline-flex items-center gap-1.5 rounded-lg border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-page"
              >
                <Mic size={14} />
                Record voice message
              </button>
            ) : (
              <button
                type="button"
                onClick={stopRecording}
                className="inline-flex items-center gap-1.5 rounded-lg bg-red-600 px-3 py-2 text-sm font-medium text-white"
              >
                <Square size={14} />
                Stop recording
              </button>
            )}
            {voiceUrl && (
              <>
                <audio controls src={voiceUrl} className="h-9 max-w-full" />
                <button
                  type="button"
                  onClick={clearVoice}
                  className="inline-flex items-center gap-1 text-xs text-muted hover:text-gray-900"
                >
                  <MicOff size={12} /> Clear
                </button>
              </>
            )}
          </div>

          <label className="block text-sm">
            <span className="mb-1 block font-medium">Written message</span>
            <textarea
              className="field-input min-h-20"
              value={brokerMessage}
              onChange={(e) => setBrokerMessage(e.target.value)}
              placeholder="Notes for the broker about this claim…"
            />
          </label>
        </fieldset>

        <label className="block text-sm">
          <span className="mb-1 block font-medium">Claim title *</span>
          <input className="field-input" value={title} onChange={(e) => setTitle(e.target.value)} required />
        </label>

        <label className="block text-sm">
          <span className="mb-1 block font-medium">Policy *</span>
          <select
            className="field-input"
            value={policyId}
            onChange={(e) => setPolicyId(e.target.value)}
            required
          >
            <option value="">Select policy…</option>
            {policies.map((p) => (
              <option key={p.id} value={p.zoho_policy_id ?? p.id}>
                {p.policy_number} {p.insurer ? `(${p.insurer})` : ''}
              </option>
            ))}
          </select>
        </label>

        {!scheduleItemKey && (
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Risk item *</span>
            <select
              className="field-input"
              value={riskItemId}
              onChange={(e) => setRiskItemId(e.target.value)}
              required={!scheduleItemKey}
            >
              <option value="">Select risk item…</option>
              {riskItems.map((item) => (
                <option key={item.id} value={item.id}>
                  {item.name} ({item.category})
                </option>
              ))}
            </select>
          </label>
        )}

        <label className="block text-sm">
          <span className="mb-1 block font-medium">Estimated claim amount</span>
          <input
            type="number"
            min="0"
            step="0.01"
            className="field-input"
            value={claimAmount}
            onChange={(e) => setClaimAmount(e.target.value)}
            placeholder="0.00"
          />
        </label>

        <label className="block text-sm">
          <span className="mb-1 block font-medium">What happened *</span>
          <textarea
            className="field-input min-h-24"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            placeholder="Describe the incident, date/time, and damage…"
            required
          />
        </label>

        <label className="block text-sm">
          <span className="mb-1 block font-medium">Photos / attachments</span>
          <input
            type="file"
            multiple
            accept="image/*,.pdf,audio/*"
            onChange={(e) => setFiles(Array.from(e.target.files ?? []))}
            className="block w-full text-sm"
          />
          {files.length > 0 && (
            <span className="mt-1 flex items-center gap-1 text-xs text-muted">
              <Upload size={12} /> {files.length} file(s) selected
            </span>
          )}
        </label>

        {error && <p className="text-sm text-red-600">{error}</p>}

        <button
          type="submit"
          disabled={saving}
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white disabled:opacity-60"
        >
          {saving && <Loader2 size={14} className="animate-spin" />}
          Submit claim
        </button>
      </form>
    </div>
  )
}
