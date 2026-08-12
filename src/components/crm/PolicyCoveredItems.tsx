import { useMemo, useState, Fragment } from 'react'
import { Link } from 'react-router-dom'
import { ChevronDown, ChevronRight, Eye, FileWarning, Pencil, Trash2 } from 'lucide-react'
import { formatCurrency, formatDate } from '../../lib/utils'
import { splitScheduleExtensions } from '../../lib/schedule-extensions'
import { categoryForSection, sectionNoteForCategory } from '../../config/cover-extras'
import { useAuth } from '../../context/AuthContext'
import {
  adjustCoveredItemOnPolicy,
  removeRiskItemFromPolicy,
} from '../../services/crm.service'
import type { CoveredItem, PolicyDetail } from '../../types/crm'
import { ItemAttachmentsModal } from './ItemAttachmentsModal'

interface PolicyCoveredItemsProps {
  policy: PolicyDetail
  onPolicyChange?: () => void
}

function itemKey(item: CoveredItem, index: number): string {
  return (
    item.external_risk_id ||
    item.tracking_id ||
    item.risk_item_id ||
    `idx-${index}`
  )
}

function claimHref(policy: PolicyDetail, item: CoveredItem, index: number): string {
  const params = new URLSearchParams()
  params.set('policyId', policy.zoho_policy_id ?? policy.id)
  params.set('portalPolicyId', policy.id)
  params.set('itemKey', itemKey(item, index))
  params.set('itemName', item.risk_item_name ?? item.description ?? 'Schedule item')
  if (item.risk_item_id) params.set('riskItemId', item.risk_item_id)
  if (item.sum_insured != null) params.set('sumInsured', String(item.sum_insured))
  if (item.section) params.set('section', item.section)
  return `/collections/claims/new?${params.toString()}`
}

export function PolicyCoveredItems({ policy, onPolicyChange }: PolicyCoveredItemsProps) {
  const { canSeeFinancials, isAdmin } = useAuth()
  const [expanded, setExpanded] = useState<string | null>(null)
  const [busyKey, setBusyKey] = useState<string | null>(null)
  const [actionError, setActionError] = useState<string | null>(null)
  const [attachmentsFor, setAttachmentsFor] = useState<{
    name: string
    attachments: CoveredItem['attachments']
  } | null>(null)

  const items = policy.covered_items
  const totals = useMemo(() => {
    return items.reduce(
      (acc, item) => {
        acc.sum += item.sum_insured ?? 0
        acc.premium += item.premium_excl ?? item.premium_incl ?? 0
        return acc
      },
      { sum: 0, premium: 0 },
    )
  }, [items])

  const totalPolicyCost =
    policy.premium != null && !Number.isNaN(Number(policy.premium))
      ? Number(policy.premium)
      : totals.premium

  if (items.length === 0) {
    return (
      <p className="rounded-lg border border-dashed border-border bg-surface px-4 py-8 text-center text-sm text-muted">
        No covered items on this policy yet.
      </p>
    )
  }

  return (
    <div className="space-y-4">
      {actionError && <p className="text-sm text-red-600">{actionError}</p>}
      {canSeeFinancials && (
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          <div className="rounded-lg border border-border bg-surface px-4 py-3 shadow-sm">
            <p className="text-xs font-medium uppercase tracking-wide text-muted">
              Total sum insured
            </p>
            <p className="mt-1 text-xl font-semibold tabular-nums text-gray-900">
              {formatCurrency(totals.sum)}
            </p>
            <p className="mt-1 text-xs text-muted">All sections combined</p>
          </div>
          <div className="rounded-lg border border-border bg-surface px-4 py-3 shadow-sm">
            <p className="text-xs font-medium uppercase tracking-wide text-muted">
              Total policy cost
            </p>
            <p className="mt-1 text-xl font-semibold tabular-nums text-gray-900">
              {formatCurrency(totalPolicyCost)}
            </p>
            <p className="mt-1 text-xs text-muted">All sections combined</p>
          </div>
        </div>
      )}

      <div className="rounded-lg border border-border bg-surface shadow-sm">
        <div className="flex flex-wrap items-center justify-between gap-2 border-b border-border bg-page px-4 py-3">
          <div>
            <h2 className="font-semibold">Covered items</h2>
            <p className="text-xs text-muted">
              {items.length} item{items.length === 1 ? '' : 's'} · expand a row for extensions &amp;
              add-ons only
            </p>
          </div>
        </div>

        <div className="w-full overflow-x-auto">
          <table className="w-full min-w-[720px] table-fixed text-sm">
            <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
              <tr>
                <th className="w-10 px-2 py-2" />
                <th className="px-3 py-2">Item</th>
                <th className="w-40 px-3 py-2">Section</th>
                {canSeeFinancials && (
                  <>
                    <th className="w-32 px-3 py-2 text-right">Sum insured</th>
                    <th className="w-28 px-3 py-2 text-right">Premium</th>
                  </>
                )}
                <th className="w-28 px-3 py-2">Date added</th>
              </tr>
            </thead>
            <tbody>
              {items.map((item, index) => {
                const key = itemKey(item, index)
                const isOpen = expanded === key
                const { addons: scheduleAddons } = splitScheduleExtensions(item.extensions)
                const selectedAddons = (item.selected_extensions ?? []).filter((e) => e.included)
                const addonChips = [
                  ...selectedAddons.map((e) => e.name),
                  ...scheduleAddons.map((e) => e.name),
                ].filter(
                  (name, i, arr) =>
                    arr.findIndex((n) => n.toLowerCase() === name.toLowerCase()) === i,
                )
                const attachments = item.attachments ?? []
                const premium = item.premium_excl ?? item.premium_incl
                const name = item.risk_item_name ?? item.description ?? 'Item'
                const portalCategory = categoryForSection(item.section)
                const sectionNote = sectionNoteForCategory(portalCategory)
                const colSpan = canSeeFinancials ? 6 : 4

                return (
                  <Fragment key={key}>
                    <tr
                      className="cursor-pointer border-b border-border hover:bg-page/60"
                      onClick={() => setExpanded(isOpen ? null : key)}
                      aria-expanded={isOpen}
                    >
                      <td className="px-2 py-3 text-center text-muted">
                        {isOpen ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
                      </td>
                      <td className="px-3 py-3 font-medium text-gray-900">{name}</td>
                      <td className="px-3 py-3 text-muted">
                        <div>{item.section ?? '—'}</div>
                        {sectionNote && <div className="text-xs text-muted">{sectionNote}</div>}
                      </td>
                      {canSeeFinancials && (
                        <>
                          <td className="px-3 py-3 text-right tabular-nums">
                            {item.sum_insured != null ? formatCurrency(item.sum_insured) : '—'}
                          </td>
                          <td className="px-3 py-3 text-right tabular-nums">
                            {premium != null ? formatCurrency(premium) : '—'}
                          </td>
                        </>
                      )}
                      <td className="px-3 py-3 text-muted">
                        {item.date_added ? formatDate(item.date_added) : '—'}
                      </td>
                    </tr>
                    {isOpen && (
                      <tr className="border-b border-border bg-page/40">
                        <td colSpan={colSpan} className="px-4 py-4 sm:pl-12">
                          <div className="mb-3 flex flex-wrap items-center gap-2">
                            <button
                              type="button"
                              onClick={(e) => {
                                e.stopPropagation()
                                setAttachmentsFor({ name, attachments })
                              }}
                              className="inline-flex items-center gap-1.5 rounded-lg border border-border bg-surface px-3 py-1.5 text-xs font-medium hover:bg-page"
                            >
                              <Eye size={14} />
                              View attachments
                              {attachments.length > 0 ? ` (${attachments.length})` : ''}
                            </button>
                            {canSeeFinancials && (
                              <Link
                                to={claimHref(policy, item, index)}
                                onClick={(e) => e.stopPropagation()}
                                className="inline-flex items-center gap-1.5 rounded-lg bg-primary px-3 py-1.5 text-xs font-medium text-white hover:opacity-90"
                              >
                                <FileWarning size={14} />
                                Create claim
                              </Link>
                            )}
                            {isAdmin && item.risk_item_id && (
                              <>
                                <button
                                  type="button"
                                  disabled={busyKey === key}
                                  onClick={async (e) => {
                                    e.stopPropagation()
                                    const raw = window.prompt(
                                      'New sum insured (ZAR)',
                                      String(item.sum_insured ?? ''),
                                    )
                                    if (raw == null) return
                                    const next = Number(raw.replace(/,/g, ''))
                                    if (!Number.isFinite(next) || next < 0) {
                                      setActionError('Enter a valid sum insured amount')
                                      return
                                    }
                                    setBusyKey(key)
                                    setActionError(null)
                                    try {
                                      await adjustCoveredItemOnPolicy({
                                        policyId: policy.id,
                                        riskItemId: item.risk_item_id!,
                                        sumInsured: next,
                                      })
                                      onPolicyChange?.()
                                    } catch (err) {
                                      setActionError(
                                        err instanceof Error ? err.message : 'Adjust failed',
                                      )
                                    } finally {
                                      setBusyKey(null)
                                    }
                                  }}
                                  className="inline-flex items-center gap-1.5 rounded-lg border border-border bg-surface px-3 py-1.5 text-xs font-medium hover:bg-page disabled:opacity-50"
                                >
                                  <Pencil size={14} />
                                  Adjust value
                                </button>
                                <button
                                  type="button"
                                  disabled={busyKey === key}
                                  onClick={async (e) => {
                                    e.stopPropagation()
                                    if (
                                      !window.confirm(
                                        `Remove “${name}” from this policy schedule?`,
                                      )
                                    ) {
                                      return
                                    }
                                    setBusyKey(key)
                                    setActionError(null)
                                    try {
                                      await removeRiskItemFromPolicy({
                                        policyId: policy.id,
                                        riskItemId: item.risk_item_id!,
                                      })
                                      onPolicyChange?.()
                                    } catch (err) {
                                      setActionError(
                                        err instanceof Error ? err.message : 'Remove failed',
                                      )
                                    } finally {
                                      setBusyKey(null)
                                    }
                                  }}
                                  className="inline-flex items-center gap-1.5 rounded-lg border border-red-200 bg-red-50 px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-100 disabled:opacity-50"
                                >
                                  <Trash2 size={14} />
                                  Remove
                                </button>
                              </>
                            )}
                          </div>

                          <h3 className="mb-2 text-xs font-semibold uppercase tracking-wide text-muted">
                            Extensions / add-ons
                          </h3>
                          {addonChips.length === 0 ? (
                            <p className="text-sm text-muted">
                              No optional extensions selected for this item (e.g. car hire, TyreSure,
                              Excess Sure, credit shortfall).
                            </p>
                          ) : (
                            <ul className="flex flex-wrap gap-2">
                              {addonChips.map((label) => (
                                <li
                                  key={label}
                                  className="rounded-full bg-accent-light px-2.5 py-1 text-xs font-medium text-primary"
                                >
                                  {label}
                                </li>
                              ))}
                            </ul>
                          )}
                        </td>
                      </tr>
                    )}
                  </Fragment>
                )
              })}
            </tbody>
          </table>
        </div>

        <ItemAttachmentsModal
          open={attachmentsFor != null}
          itemName={attachmentsFor?.name ?? ''}
          attachments={attachmentsFor?.attachments ?? []}
          onClose={() => setAttachmentsFor(null)}
        />
      </div>
    </div>
  )
}
