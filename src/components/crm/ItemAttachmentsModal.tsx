import { Eye, FileText, X } from 'lucide-react'
import type { CoveredItemAttachment } from '../../types/crm'

interface ItemAttachmentsModalProps {
  open: boolean
  itemName: string
  attachments: CoveredItemAttachment[]
  onClose: () => void
}

export function ItemAttachmentsModal({
  open,
  itemName,
  attachments,
  onClose,
}: ItemAttachmentsModalProps) {
  if (!open) return null

  const images = attachments.filter((a) => (a.type ?? '').startsWith('image/') || /\.(jpe?g|png|gif|webp)$/i.test(a.file_name) || a.url.includes('picsum'))
  const files = attachments.filter((a) => !images.includes(a))

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4" onClick={onClose}>
      <div
        className="max-h-[90vh] w-full max-w-3xl overflow-hidden rounded-xl border border-border bg-surface shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-start justify-between gap-3 border-b border-border px-5 py-4">
          <div>
            <p className="flex items-center gap-2 text-sm font-medium text-muted">
              <Eye size={14} /> Attachments
            </p>
            <h2 className="mt-1 text-lg font-semibold text-gray-900">{itemName}</h2>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="rounded-lg p-1.5 text-muted hover:bg-page hover:text-gray-900"
            aria-label="Close"
          >
            <X size={18} />
          </button>
        </div>

        <div className="max-h-[calc(90vh-5rem)] overflow-y-auto p-5">
          {attachments.length === 0 && (
            <p className="rounded-lg border border-dashed border-border bg-page px-4 py-8 text-center text-sm text-muted">
              No images or attachments linked to this schedule item yet.
            </p>
          )}

          {images.length > 0 && (
            <div className="grid gap-3 sm:grid-cols-2">
              {images.map((img) => (
                <a
                  key={img.id}
                  href={img.url}
                  target="_blank"
                  rel="noreferrer"
                  className="overflow-hidden rounded-lg border border-border bg-page"
                >
                  <img src={img.url} alt={img.file_name} className="aspect-[4/3] w-full object-cover" />
                  <p className="truncate px-3 py-2 text-xs text-muted">{img.file_name}</p>
                </a>
              ))}
            </div>
          )}

          {files.length > 0 && (
            <ul className={`space-y-2 ${images.length > 0 ? 'mt-4' : ''}`}>
              {files.map((file) => (
                <li key={file.id}>
                  <a
                    href={file.url}
                    target="_blank"
                    rel="noreferrer"
                    className="flex items-center gap-2 rounded-lg border border-border px-3 py-2 text-sm hover:bg-page"
                  >
                    <FileText size={14} className="text-muted" />
                    <span className="truncate">{file.file_name}</span>
                  </a>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
    </div>
  )
}
