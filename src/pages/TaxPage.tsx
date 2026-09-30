import { useCallback, useEffect, useState } from 'react'
import { useAuth } from '../context/AuthContext'
import { useOrganization } from '../context/OrganizationContext'
import {
  EntityScopeBanner,
  IntegrationState,
  PageHeader,
} from '../components/workspace/WorkspaceUi'
import { supabase } from '../lib/supabase'
import { listAssets } from '../services/asset-ledger.service'

type TaxRuleRow = {
  id: string
  legal_provision: string
  name: string
  status: string
  source_reference: string
  version: number
  effective_from: string
}

type TaxPosition = {
  asset_id: string
  classification_status: string
  tax_cost_base: string | null
  remaining_tax_value: string | null
  prior_allowances: string | null
}

export function TaxPage() {
  const { homeAccountName, subsidiaries, accountId, homeAccountId } = useAuth()
  const { organization } = useOrganization()
  const [rules, setRules] = useState<TaxRuleRow[]>([])
  const [positions, setPositions] = useState<TaxPosition[]>([])
  const [needsClass, setNeedsClass] = useState(0)
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)

  const isSub = Boolean(homeAccountId && accountId && accountId !== homeAccountId)
  const name =
    (isSub ? subsidiaries.find((s) => s.id === accountId)?.name : null) ??
    organization?.name ??
    homeAccountName ??
    'Legal entity'

  const refresh = useCallback(async () => {
    if (!accountId) return
    setLoading(true)
    setError(null)
    try {
      const [ruleRes, posRes, assets] = await Promise.all([
        supabase
          .from('aam_tax_rules')
          .select('id, legal_provision, name, status, source_reference, version, effective_from')
          .eq('jurisdiction', 'ZA')
          .order('legal_provision'),
        supabase
          .from('aam_tax_asset_positions')
          .select('asset_id, classification_status, tax_cost_base, remaining_tax_value, prior_allowances')
          .eq('account_id', accountId),
        listAssets(accountId),
      ])
      if (ruleRes.error) throw ruleRes.error
      if (posRes.error) throw posRes.error
      setRules(ruleRes.data ?? [])
      setPositions(posRes.data ?? [])
      setNeedsClass(
        (posRes.data ?? []).filter((p) => p.classification_status === 'needs_tax_classification')
          .length +
          assets.filter(
            (a) =>
              a.ownership_type !== 'insurance_only' &&
              a.capitalised_cost &&
              !(posRes.data ?? []).some((p) => p.asset_id === a.id),
          ).length,
      )
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load tax workspace')
      setRules([])
      setPositions([])
    } finally {
      setLoading(false)
    }
  }, [accountId])

  useEffect(() => {
    void refresh()
  }, [refresh])

  return (
    <div className="space-y-5">
      <PageHeader
        title="Tax"
        description="South African tax register and book-to-tax workpapers. Allowances are never copied from book depreciation. Unreviewed calculations remain provisional."
      />

      <EntityScopeBanner
        entityName={name}
        scopeLabel={isSub ? 'Subsidiary' : 'Legal entity'}
        note={
          organization?.vat_number
            ? `VAT number on file: ${organization.vat_number} (context only — not a calculation)`
            : 'Configure VAT / tax numbers on the legal entity profile when ready.'
        }
      />

      {loading && <p className="text-sm text-muted">Loading tax workspace…</p>}
      {error && (
        <p className="rounded-md border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-950">
          {error.includes('does not exist') || error.includes('schema cache')
            ? 'Apply migration 20260929_fixed_asset_accounting.sql to enable tax tables and ZA rule templates.'
            : error}
        </p>
      )}

      <div className="grid gap-3 sm:grid-cols-3">
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Needs tax classification</p>
          <p className="mt-1 text-lg font-semibold tabular-nums">{needsClass}</p>
        </div>
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Tax positions</p>
          <p className="mt-1 text-lg font-semibold tabular-nums">{positions.length}</p>
        </div>
        <div className="ws-panel px-3.5 py-3">
          <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">ZA rule templates</p>
          <p className="mt-1 text-lg font-semibold tabular-nums">{rules.length}</p>
          <p className="text-[11px] text-muted">Draft until Tax approves</p>
        </div>
      </div>

      <section className="ws-panel overflow-hidden">
        <div className="border-b border-border px-4 py-3">
          <h2 className="text-sm font-semibold">Tax rule catalogue (ZA)</h2>
          <p className="text-xs text-muted">
            Templates seed with SARS source URLs. Rates/lives live in config JSON — approve before claiming.
          </p>
        </div>
        <div className="overflow-x-auto">
          <table className="ws-table">
            <thead>
              <tr>
                <th>Provision</th>
                <th>Name</th>
                <th>Status</th>
                <th>Effective</th>
                <th>Source</th>
              </tr>
            </thead>
            <tbody>
              {rules.length === 0 && !loading ? (
                <tr>
                  <td colSpan={5} className="text-muted">
                    No rules loaded.
                  </td>
                </tr>
              ) : (
                rules.map((r) => (
                  <tr key={r.id}>
                    <td className="font-mono text-xs">{r.legal_provision}</td>
                    <td>{r.name}</td>
                    <td>
                      <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">
                        {r.status}
                      </span>
                    </td>
                    <td className="tabular-nums text-xs">{r.effective_from}</td>
                    <td className="max-w-[220px] truncate text-xs">
                      <a
                        href={r.source_reference}
                        target="_blank"
                        rel="noreferrer"
                        className="text-primary underline"
                      >
                        SARS reference
                      </a>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </section>

      <div className="grid gap-3 lg:grid-cols-2">
        <IntegrationState
          title="Book-to-tax bridge"
          description="Generated after approved book schedule lines and provisional/approved tax schedule lines exist for the same period/tax year. Provisional classifications stay visibly separate from approved workpapers."
          status="awaiting_mapping"
        />
        <IntegrationState
          title="Disposal & recoupment review"
          description="Sale, scrap, theft, and write-off movements open a Tax review for recoupment, loss relief, CGT and VAT — never an automatic final tax conclusion."
          status="not_connected"
        />
      </div>

      <section className="ws-panel p-4">
        <h2 className="mb-2 text-sm font-semibold text-ink">Approval policy</h2>
        <p className="text-sm text-muted">
          Proposed allowances default to{' '}
          <span className="ws-status bg-amber-50 text-amber-900 ring-1 ring-amber-200/80">
            Provisional — needs Tax review
          </span>
          . Overrides require reason, evidence and an immutable audit event. Do not claim ITR14/VAT201
          submission unless a supported integration exists.
        </p>
      </section>
    </div>
  )
}
