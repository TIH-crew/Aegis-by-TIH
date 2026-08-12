import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { ArrowLeft, FileText, Plus, Printer } from 'lucide-react'
import { PolicyCoveredItems } from '../components/crm/PolicyCoveredItems'
import { PolicyScheduleDocument } from '../components/crm/PolicyScheduleDocument'
import { SendToBrokerModal } from '../components/crm/SendToBrokerModal'
import { useOrganization } from '../context/OrganizationContext'
import { fetchPolicy } from '../services/crm.service'
import type { PolicyDetail } from '../types/crm'

export function PolicyDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { organization } = useOrganization()
  const [policy, setPolicy] = useState<PolicyDetail | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [brokerOpen, setBrokerOpen] = useState(false)

  useEffect(() => {
    if (!id) return
    setLoading(true)
    setError(null)
    void fetchPolicy(id)
      .then(setPolicy)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load policy'))
      .finally(() => setLoading(false))
  }, [id])

  if (loading) return <p className="text-sm text-muted">Loading policy…</p>
  if (error) return <p className="text-sm text-red-600">{error}</p>
  if (!policy) return <p className="text-sm text-muted">Policy not found.</p>

  const clientName = organization?.name ?? 'Policy holder'
  const brokerContextId = policy.zoho_policy_id ?? policy.id

  return (
    <div className="space-y-4">
      <div className="policy-schedule-no-print flex flex-wrap items-start justify-between gap-3">
        <div>
          <Link
            to="/collections/policies"
            className="inline-flex items-center gap-1 text-sm text-muted hover:text-gray-900"
          >
            <ArrowLeft size={14} /> Back to policies
          </Link>
          <h1 className="mt-2 text-2xl font-semibold">{policy.policy_number}</h1>
          <p className="mt-1 text-sm text-muted">
            Expand any item for extensions, attachments, and claim actions.
            {policy.insurer_policy_number ? ` Insurer ref ${policy.insurer_policy_number}.` : ''}
          </p>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <button
            type="button"
            onClick={() => window.print()}
            className="inline-flex items-center gap-2 rounded-lg border border-border bg-surface px-4 py-2 text-sm font-medium hover:bg-page"
          >
            <Printer size={14} />
            Print view
          </button>
          <button
            type="button"
            onClick={() => setBrokerOpen(true)}
            className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white"
          >
            <Plus size={14} />
            Request add item
          </button>
        </div>
      </div>

      <div className="policy-schedule-no-print">
        <PolicyCoveredItems policy={policy} />
      </div>

      <div className="policy-schedule-print-only policy-schedule-print-area -mx-6 -mb-6 overflow-x-auto px-0 pb-6 sm:mx-0">
        <PolicyScheduleDocument policy={policy} clientName={clientName} />
      </div>

      {policy.attachments.length > 0 && (
        <div className="policy-schedule-no-print rounded-lg border border-border bg-surface p-4 shadow-sm">
          <h2 className="font-semibold">Policy attachments</h2>
          <ul className="mt-3 space-y-2">
            {policy.attachments.map((file) => (
              <li key={file.id} className="flex items-center gap-2 text-sm">
                <FileText size={14} className="text-muted" />
                <span>{file.file_name}</span>
              </li>
            ))}
          </ul>
        </div>
      )}

      <SendToBrokerModal
        open={brokerOpen}
        onClose={() => setBrokerOpen(false)}
        contextType="policy"
        contextZohoId={brokerContextId}
        contextLabel={policy.policy_number}
      />
    </div>
  )
}
