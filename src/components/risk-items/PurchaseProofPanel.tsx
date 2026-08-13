import { useRef, useState } from 'react'
import { FileText, Loader2, Upload } from 'lucide-react'
import { uploadPurchaseInvoice } from '../../services/purchase-proof.service'

const FINANCE_HOUSES = ['WesBank', 'MFC', 'ABSA', 'FNB', 'Standard Bank', 'Nedbank', 'Other']

export interface PurchaseProofValue {
  purchase_value: number
  purchase_date: string
  purchase_invoice_url: string
  purchase_invoice_name: string
  is_financed: boolean
  finance_house: string
  finance_account_number: string
  finance_amount: number
}

export const emptyPurchaseProof = (): PurchaseProofValue => ({
  purchase_value: 0,
  purchase_date: new Date().toISOString().slice(0, 10),
  purchase_invoice_url: '',
  purchase_invoice_name: '',
  is_financed: false,
  finance_house: '',
  finance_account_number: '',
  finance_amount: 0,
})

type Props = {
  accountId: string
  value: PurchaseProofValue
  onChange: (next: PurchaseProofValue) => void
  required?: boolean
  title?: string
}

export function PurchaseProofPanel({
  accountId,
  value,
  onChange,
  required = false,
  title = 'Purchase proof',
}: Props) {
  const inputRef = useRef<HTMLInputElement>(null)
  const [uploading, setUploading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function handleFile(file: File) {
    setUploading(true)
    setError(null)
    try {
      const uploaded = await uploadPurchaseInvoice(accountId, file)
      onChange({
        ...value,
        purchase_invoice_url: uploaded.url,
        purchase_invoice_name: uploaded.name,
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Upload failed')
    } finally {
      setUploading(false)
    }
  }

  return (
    <div className="space-y-3 rounded-lg border border-border bg-page/60 p-4">
      <h3 className="flex items-center gap-2 text-sm font-semibold text-gray-900">
        <FileText size={16} />
        {title}
        {required ? <span className="text-accent">*</span> : null}
      </h3>
      <p className="text-xs text-muted">
        Required when the item is assigned to an employee. Include invoice / proof of purchase and
        finance details if applicable.
      </p>

      {error && (
        <p className="rounded-md border border-red-200 bg-red-50 px-3 py-2 text-xs text-red-700">
          {error}
        </p>
      )}

      <div className="grid gap-3 md:grid-cols-2">
        <label className="block text-sm">
          <span className="mb-1 block font-medium">Purchase value (R) *</span>
          <input
            type="number"
            className="field-input"
            min={0}
            value={value.purchase_value || ''}
            onChange={(e) => onChange({ ...value, purchase_value: Number(e.target.value) })}
          />
        </label>
        <label className="block text-sm">
          <span className="mb-1 block font-medium">Purchase date</span>
          <input
            type="date"
            className="field-input"
            value={value.purchase_date}
            onChange={(e) => onChange({ ...value, purchase_date: e.target.value })}
          />
        </label>
      </div>

      <div>
        <input
          ref={inputRef}
          type="file"
          accept="image/*,application/pdf"
          className="hidden"
          onChange={(e) => {
            const file = e.target.files?.[0]
            if (file) void handleFile(file)
            e.target.value = ''
          }}
        />
        <button
          type="button"
          disabled={uploading || !accountId}
          onClick={() => inputRef.current?.click()}
          className="inline-flex items-center gap-2 rounded-lg border border-border bg-surface px-3 py-2 text-sm hover:bg-white disabled:opacity-60"
        >
          {uploading ? <Loader2 size={14} className="animate-spin" /> : <Upload size={14} />}
          {uploading ? 'Uploading…' : 'Upload invoice / proof of purchase'}
        </button>
        {value.purchase_invoice_url ? (
          <p className="mt-2 text-xs text-emerald-800">
            Attached:{' '}
            <a
              href={value.purchase_invoice_url}
              target="_blank"
              rel="noreferrer"
              className="underline"
            >
              {value.purchase_invoice_name || 'View document'}
            </a>
          </p>
        ) : (
          <p className="mt-2 text-xs text-muted">No document uploaded yet.</p>
        )}
      </div>

      <label className="flex items-center gap-2 text-sm">
        <input
          type="checkbox"
          checked={value.is_financed}
          onChange={(e) => onChange({ ...value, is_financed: e.target.checked })}
        />
        This item is financed
      </label>

      {value.is_financed && (
        <div className="grid gap-3 md:grid-cols-3">
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Finance house *</span>
            <select
              className="field-input"
              value={value.finance_house}
              onChange={(e) => onChange({ ...value, finance_house: e.target.value })}
            >
              <option value="">Select</option>
              {FINANCE_HOUSES.map((house) => (
                <option key={house} value={house}>
                  {house}
                </option>
              ))}
            </select>
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Agreement / account no. *</span>
            <input
              className="field-input"
              value={value.finance_account_number}
              onChange={(e) => onChange({ ...value, finance_account_number: e.target.value })}
            />
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Outstanding amount (R) *</span>
            <input
              type="number"
              className="field-input"
              min={0}
              value={value.finance_amount || ''}
              onChange={(e) => onChange({ ...value, finance_amount: Number(e.target.value) })}
            />
          </label>
        </div>
      )}
    </div>
  )
}
