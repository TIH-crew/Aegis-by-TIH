import { useEffect, useState } from 'react'
import { Loader2, Send } from 'lucide-react'
import { RISK_CATEGORIES } from '../../config/collections'
import { useDataService } from '../../hooks/useDataService'
import { sendBrokerRequest } from '../../services/crm.service'
import type { RiskItem } from '../../types'
import type { BrokerRequestInput } from '../../types/crm'

interface SendToBrokerModalProps {
  open: boolean
  onClose: () => void
  contextType: 'quotation' | 'policy'
  contextZohoId: string
  contextLabel: string
  onSent?: () => void
}

type Mode = 'existing' | 'new'

export function SendToBrokerModal({
  open,
  onClose,
  contextType,
  contextZohoId,
  contextLabel,
  onSent,
}: SendToBrokerModalProps) {
  const dataService = useDataService()
  const [mode, setMode] = useState<Mode>('existing')
  const [riskItems, setRiskItems] = useState<RiskItem[]>([])
  const [riskItemId, setRiskItemId] = useState('')
  const [draftName, setDraftName] = useState('')
  const [draftCategory, setDraftCategory] = useState<string>(RISK_CATEGORIES[0])
  const [draftCost, setDraftCost] = useState(0)
  const [message, setMessage] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState(false)

  useEffect(() => {
    if (!open || !dataService) return
    void dataService.getRiskItems().then(setRiskItems).catch(() => setRiskItems([]))
    setSuccess(false)
    setError(null)
  }, [open, dataService])

  if (!open) return null

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)
    try {
      const payload: BrokerRequestInput = {
        context_type: contextType,
        context_zoho_id: contextZohoId,
        context_label: contextLabel,
        message: message.trim() || undefined,
      }

      if (mode === 'existing') {
        if (!riskItemId) {
          setError('Select a risk item.')
          setLoading(false)
          return
        }
        payload.risk_item_id = riskItemId
      } else {
        if (!draftName.trim()) {
          setError('Enter a name for the new item.')
          setLoading(false)
          return
        }
        payload.draft_item = {
          name: draftName.trim(),
          category: draftCategory,
          unit_cost: draftCost,
        }
      }

      await sendBrokerRequest(payload)
      setSuccess(true)
      onSent?.()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to send request')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4">
      <div className="w-full max-w-lg rounded-xl border border-border bg-surface p-6 shadow-lg">
        <h2 className="text-lg font-semibold">Send to Broker</h2>
        <p className="mt-1 text-sm text-muted">
          Request your broker to add a risk item to{' '}
          <span className="font-medium">{contextLabel}</span>.
        </p>

        {success ? (
          <div className="mt-4 rounded-lg border border-green-200 bg-green-50 p-4 text-sm text-green-800">
            Request sent. Your broker will follow up shortly.
            <button
              type="button"
              onClick={onClose}
              className="mt-3 block rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white"
            >
              Close
            </button>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="mt-4 space-y-4">
            <div className="flex gap-2">
              <button
                type="button"
                onClick={() => setMode('existing')}
                className={`rounded-lg px-3 py-1.5 text-sm ${mode === 'existing' ? 'bg-primary text-white' : 'border border-border'}`}
              >
                Existing item
              </button>
              <button
                type="button"
                onClick={() => setMode('new')}
                className={`rounded-lg px-3 py-1.5 text-sm ${mode === 'new' ? 'bg-primary text-white' : 'border border-border'}`}
              >
                New item
              </button>
            </div>

            {mode === 'existing' ? (
              <label className="block text-sm">
                <span className="mb-1 block font-medium">Risk item</span>
                <select
                  className="field-input"
                  value={riskItemId}
                  onChange={(e) => setRiskItemId(e.target.value)}
                >
                  <option value="">Select…</option>
                  {riskItems.map((item) => (
                    <option key={item.id} value={item.id}>
                      {item.name} ({item.category})
                    </option>
                  ))}
                </select>
              </label>
            ) : (
              <div className="grid grid-cols-1 gap-3">
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">Item name</span>
                  <input
                    className="field-input"
                    value={draftName}
                    onChange={(e) => setDraftName(e.target.value)}
                    required
                  />
                </label>
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">Category</span>
                  <select
                    className="field-input"
                    value={draftCategory}
                    onChange={(e) => setDraftCategory(e.target.value)}
                  >
                    {RISK_CATEGORIES.map((c) => (
                      <option key={c} value={c}>
                        {c}
                      </option>
                    ))}
                  </select>
                </label>
                <label className="block text-sm">
                  <span className="mb-1 block font-medium">Estimated value</span>
                  <input
                    type="number"
                    min={0}
                    className="field-input"
                    value={draftCost}
                    onChange={(e) => setDraftCost(Number(e.target.value))}
                  />
                </label>
              </div>
            )}

            <label className="block text-sm">
              <span className="mb-1 block font-medium">Note to broker (optional)</span>
              <textarea
                className="field-input min-h-20"
                value={message}
                onChange={(e) => setMessage(e.target.value)}
                placeholder="Any details your broker should know…"
              />
            </label>

            {error && <p className="text-sm text-red-600">{error}</p>}

            <div className="flex justify-end gap-2">
              <button
                type="button"
                onClick={onClose}
                className="rounded-lg border border-border px-4 py-2 text-sm"
              >
                Cancel
              </button>
              <button
                type="submit"
                disabled={loading}
                className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white disabled:opacity-60"
              >
                {loading ? <Loader2 size={14} className="animate-spin" /> : <Send size={14} />}
                Send to Broker
              </button>
            </div>
          </form>
        )}
      </div>
    </div>
  )
}
