import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import {
  ArrowLeft,
  CheckCircle2,
  ClipboardList,
  ExternalLink,
  FileText,
  Loader2,
  Mic,
  Receipt,
} from 'lucide-react'
import { StageBadge } from '../components/crm/StageBadge'
import { formatCurrency, formatDate } from '../lib/utils'
import { fetchClaim } from '../services/crm.service'
import type { ClaimDetail, ClaimDocument } from '../types/crm'

export function ClaimDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [claim, setClaim] = useState<ClaimDetail | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!id) return
    setLoading(true)
    setError(null)
    void fetchClaim(id)
      .then(setClaim)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load claim'))
      .finally(() => setLoading(false))
  }, [id])

  const invoices = useMemo(
    () => claim?.documents.filter((d) => d.kind === 'invoice') ?? [],
    [claim],
  )
  const quotes = useMemo(
    () => claim?.documents.filter((d) => d.kind === 'quote') ?? [],
    [claim],
  )
  const confirmations = useMemo(
    () =>
      claim?.documents.filter((d) => d.kind === 'confirmation' || d.kind === 'other') ?? [],
    [claim],
  )

  if (loading) {
    return (
      <p className="flex items-center gap-2 text-sm text-muted">
        <Loader2 size={14} className="animate-spin" /> Loading claim…
      </p>
    )
  }
  if (error) return <p className="text-sm text-red-600">{error}</p>
  if (!claim) return <p className="text-sm text-muted">Claim not found.</p>

  return (
    <div className="space-y-6">
      <div>
        <Link
          to="/collections/claims"
          className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
        >
          <ArrowLeft size={14} /> Back to claims
        </Link>
        <div className="mt-2 flex flex-wrap items-start justify-between gap-3">
          <div>
            <h1 className="text-2xl font-semibold">{claim.name}</h1>
            <p className="mt-1 text-sm text-muted">
              {claim.policy_name ? `Policy ${claim.policy_name}` : 'No policy linked'}
              {claim.schedule_item_name ? ` · ${claim.schedule_item_name}` : ''}
              {claim.risk_item_name ? ` · ${claim.risk_item_name}` : ''}
            </p>
          </div>
          {claim.status && <StageBadge stage={claim.status} />}
        </div>
      </div>

      <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
        <MetaCard label="Status" value={claim.status ?? '—'} />
        <MetaCard
          label="Claim amount"
          value={claim.claim_amount != null ? formatCurrency(claim.claim_amount) : '—'}
        />
        <MetaCard
          label="Lodged"
          value={claim.created_time ? formatDate(claim.created_time.slice(0, 10)) : '—'}
        />
        <MetaCard label="Handler" value={claim.owner_name ?? '—'} />
      </div>

      <section className="rounded-lg border border-border bg-surface p-5 shadow-sm">
        <h2 className="mb-3 flex items-center gap-2 font-semibold">
          <ClipboardList size={16} className="text-primary" />
          Claim details
        </h2>
        <dl className="grid gap-3 sm:grid-cols-2">
          <Detail label="Company" value={claim.company_name} />
          <Detail label="Policy" value={claim.policy_name} />
          <Detail label="Item claimed" value={claim.schedule_item_name || claim.risk_item_name} />
          <Detail label="Claim reference" value={claim.zoho_claim_id} />
          <Detail label="Location / address notes" value={claim.claim_address} />
          <Detail
            label="Last updated"
            value={
              claim.modified_time ? formatDate(claim.modified_time.slice(0, 10)) : null
            }
          />
        </dl>
        {claim.description && (
          <div className="mt-4 rounded-lg border border-border bg-page px-4 py-3">
            <p className="text-xs font-medium uppercase tracking-wide text-muted">Description</p>
            <p className="mt-1 whitespace-pre-wrap text-sm text-gray-900">{claim.description}</p>
          </div>
        )}
        {claim.broker_message && (
          <div className="mt-3 rounded-lg border border-amber-200 bg-amber-50 px-4 py-3">
            <p className="text-xs font-medium uppercase tracking-wide text-amber-800">
              Broker message
            </p>
            <p className="mt-1 whitespace-pre-wrap text-sm text-amber-950">
              {claim.broker_message}
            </p>
          </div>
        )}
        {(claim.vapi_recording_url || claim.voice_note_url) && (
          <div className="mt-4 rounded-lg border border-border bg-page px-4 py-3">
            <p className="mb-2 flex items-center gap-2 text-xs font-medium uppercase tracking-wide text-muted">
              <Mic size={12} />
              {claim.vapi_call_id ? 'Vapi call recording' : 'Voice note'}
            </p>
            {claim.vapi_recording_url ? (
              <audio controls src={claim.vapi_recording_url} className="w-full" />
            ) : claim.voice_note_url ? (
              claim.voice_note_url.match(/\.(wav|mp3|webm|ogg|m4a)(\?|$)/i) ? (
                <audio controls src={claim.voice_note_url} className="w-full" />
              ) : (
                <a
                  href={claim.voice_note_url}
                  target="_blank"
                  rel="noreferrer"
                  className="inline-flex items-center gap-2 text-sm font-medium text-primary hover:underline"
                >
                  <Mic size={14} /> Open voice file
                </a>
              )
            ) : null}
            {claim.vapi_call_id && (
              <p className="mt-2 text-xs text-muted">Call id: {claim.vapi_call_id}</p>
            )}
          </div>
        )}
        {claim.vapi_transcript && (
          <div className="mt-3 rounded-lg border border-border bg-page px-4 py-3">
            <p className="text-xs font-medium uppercase tracking-wide text-muted">Call transcript</p>
            <pre className="mt-2 max-h-64 overflow-auto whitespace-pre-wrap font-sans text-sm text-gray-900">
              {claim.vapi_transcript}
            </pre>
          </div>
        )}
      </section>

      <section className="rounded-lg border border-border bg-surface p-5 shadow-sm">
        <h2 className="mb-3 flex items-center gap-2 font-semibold">
          <CheckCircle2 size={16} className="text-primary" />
          Next actions
        </h2>
        {claim.next_actions.length === 0 ? (
          <p className="text-sm text-muted">No outstanding actions right now.</p>
        ) : (
          <ul className="space-y-2">
            {claim.next_actions.map((action) => (
              <li
                key={action.id}
                className="flex flex-wrap items-start justify-between gap-2 rounded-lg border border-border bg-page px-3 py-3"
              >
                <div>
                  <p className="font-medium text-gray-900">{action.title}</p>
                  <p className="mt-0.5 text-xs text-muted">
                    {action.source === 'crm' ? 'Broker task' : 'Suggested'}
                    {action.priority ? ` · ${action.priority}` : ''}
                    {action.due_date ? ` · Due ${formatDate(action.due_date.slice(0, 10))}` : ''}
                  </p>
                </div>
                {action.status && <StageBadge stage={action.status} />}
              </li>
            ))}
          </ul>
        )}
      </section>

      <div className="grid gap-4 lg:grid-cols-3">
        <DocPanel
          title="Invoices"
          icon={Receipt}
          empty="No invoices uploaded for this claim yet."
          docs={invoices}
        />
        <DocPanel
          title="Quotes"
          icon={FileText}
          empty="No repair / replacement quotes on this claim yet."
          docs={quotes}
        />
        <DocPanel
          title="Confirmations & docs"
          icon={FileText}
          empty="No confirmation documents yet."
          docs={confirmations}
        />
      </div>

      {claim.crm_notes.length > 0 && (
        <section className="rounded-lg border border-border bg-surface p-5 shadow-sm">
          <h2 className="mb-3 font-semibold">Broker notes</h2>
          <ul className="space-y-3">
            {claim.crm_notes.map((note) => (
              <li key={note.id} className="rounded-lg border border-border bg-page px-3 py-3">
                <p className="text-sm font-medium text-gray-900">
                  {note.title || 'Note'}
                  {note.created_time && (
                    <span className="ml-2 text-xs font-normal text-muted">
                      {formatDate(note.created_time.slice(0, 10))}
                    </span>
                  )}
                </p>
                {note.content && (
                  <p className="mt-1 whitespace-pre-wrap text-sm text-muted">{note.content}</p>
                )}
              </li>
            ))}
          </ul>
        </section>
      )}

      {claim.attachments.length > 0 && (
        <section className="rounded-lg border border-border bg-surface p-5 shadow-sm">
          <h2 className="mb-3 font-semibold">Submitted media</h2>
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {claim.attachments.map((file, idx) => {
              const isImage =
                file.type?.startsWith('image/') ||
                /\.(jpe?g|png|gif|webp)(\?|$)/i.test(file.name) ||
                /\.(jpe?g|png|gif|webp)(\?|$)/i.test(file.url)
              if (isImage) {
                return (
                  <a
                    key={`${file.url}-${idx}`}
                    href={file.url}
                    target="_blank"
                    rel="noreferrer"
                    className="group overflow-hidden rounded-lg border border-border bg-page"
                  >
                    <img
                      src={file.url}
                      alt={file.name}
                      className="aspect-[4/3] w-full object-cover transition group-hover:opacity-90"
                    />
                    <p className="truncate px-2 py-1.5 text-xs text-muted">{file.name}</p>
                  </a>
                )
              }
              return (
                <a
                  key={`${file.url}-${idx}`}
                  href={file.url}
                  target="_blank"
                  rel="noreferrer"
                  className="flex items-center gap-2 rounded-lg border border-border bg-page px-3 py-3 text-sm text-primary hover:underline"
                >
                  <ExternalLink size={14} />
                  {file.name}
                </a>
              )
            })}
          </div>
        </section>
      )}
    </div>
  )
}

function MetaCard({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg border border-border bg-surface px-4 py-3 shadow-sm">
      <p className="text-xs uppercase tracking-wide text-muted">{label}</p>
      <p className="mt-1 text-lg font-semibold text-gray-900">{value}</p>
    </div>
  )
}

function Detail({ label, value }: { label: string; value: string | null | undefined }) {
  return (
    <div>
      <dt className="text-xs uppercase tracking-wide text-muted">{label}</dt>
      <dd className="mt-0.5 text-sm text-gray-900">{value || '—'}</dd>
    </div>
  )
}

function DocPanel({
  title,
  icon: Icon,
  empty,
  docs,
}: {
  title: string
  icon: React.ComponentType<{ size?: number; className?: string }>
  empty: string
  docs: ClaimDocument[]
}) {
  return (
    <section className="rounded-lg border border-border bg-surface p-4 shadow-sm">
      <h3 className="mb-3 flex items-center gap-2 text-sm font-semibold">
        <Icon size={15} className="text-primary" />
        {title}
      </h3>
      {docs.length === 0 ? (
        <p className="text-sm text-muted">{empty}</p>
      ) : (
        <ul className="space-y-2">
          {docs.map((doc) => (
            <li key={doc.id} className="rounded-lg border border-border bg-page px-3 py-2">
              <p className="text-sm font-medium text-gray-900">{doc.title}</p>
              <p className="mt-0.5 text-xs text-muted">
                {doc.status ?? '—'}
                {doc.amount != null ? ` · ${formatCurrency(doc.amount)}` : ''}
              </p>
              {doc.notes && <p className="mt-1 text-xs text-muted">{doc.notes}</p>}
              {doc.file_url && (
                <>
                  {/\.(jpe?g|png|gif|webp)(\?|$)/i.test(doc.file_url) ||
                  doc.file_name?.match(/\.(jpe?g|png|gif|webp)$/i) ? (
                    <a href={doc.file_url} target="_blank" rel="noreferrer" className="mt-2 block">
                      <img
                        src={doc.file_url}
                        alt={doc.title}
                        className="max-h-48 rounded-lg border border-border object-cover"
                      />
                    </a>
                  ) : (
                    <a
                      href={doc.file_url}
                      target="_blank"
                      rel="noreferrer"
                      className="mt-1 inline-flex items-center gap-1 text-xs font-medium text-primary hover:underline"
                    >
                      <ExternalLink size={12} /> Open
                    </a>
                  )}
                </>
              )}
            </li>
          ))}
        </ul>
      )}
    </section>
  )
}
