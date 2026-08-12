import { useMemo, useState, Fragment } from 'react'
import { Link } from 'react-router-dom'
import {
  Building2,
  ChevronDown,
  ChevronRight,
  Eye,
  FileWarning,
  Filter,
  Loader2,
  Trash2,
} from 'lucide-react'
import { formatCurrency, formatDate } from '../../lib/utils'
import { splitScheduleExtensions } from '../../lib/schedule-extensions'
import { categoryForSection, sectionNoteForCategory } from '../../config/cover-extras'
import { useAuth } from '../../context/AuthContext'
import { sendBrokerRequest } from '../../services/crm.service'
import type { CoveredItem, PolicyDetail } from '../../types/crm'
import { ItemAttachmentsModal } from './ItemAttachmentsModal'
import { isNonAssetScheduleSection } from '../../lib/policy-schedule-split'

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

export function PolicyCoveredItems({ policy }: PolicyCoveredItemsProps) {
  const { canSeeFinancials } = useAuth()
  const [expanded, setExpanded] = useState<string | null>(null)
  const [maxValueFilter, setMaxValueFilter] = useState<string>('')
  const [selected, setSelected] = useState<Set<string>>(new Set())
  const [requesting, setRequesting] = useState(false)
  const [actionMsg, setActionMsg] = useState<string | null>(null)
  const [actionError, setActionError] = useState<string | null>(null)
  const [attachmentsFor, setAttachmentsFor] = useState<{
    name: string
    attachments: CoveredItem['attachments']
  } | null>(null)

  const items = policy.covered_items

  const { assetItems, nonAssetItems } = useMemo(() => {
    const asset: { item: CoveredItem; index: number }[] = []
    const nonAsset: { item: CoveredItem; index: number }[] = []
    items.forEach((item, index) => {
      if (isNonAssetScheduleSection(item.section, item.risk_item_name)) {
        nonAsset.push({ item, index })
      } else {
        asset.push({ item, index })
      }
    })
    return { assetItems: asset, nonAssetItems: nonAsset }
  }, [items])

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

  const totalPolicyPremium =
    policy.premium != null && !Number.isNaN(Number(policy.premium))
      ? Number(policy.premium)
      : totals.premium

  const maxValue = maxValueFilter.trim() === '' ? null : Number(maxValueFilter.replace(/,/g, ''))

  const visibleAssets = useMemo(() => {
    if (maxValue == null || !Number.isFinite(maxValue)) return assetItems
    return assetItems.filter(({ item }) => (item.sum_insured ?? 0) < maxValue)
  }, [assetItems, maxValue])

  const allVisibleKeys = visibleAssets.map(({ item, index }) => itemKey(item, index))
  const allVisibleSelected =
    allVisibleKeys.length > 0 && allVisibleKeys.every((k) => selected.has(k))

  function toggleKey(key: string) {
    setSelected((prev) => {
      const next = new Set(prev)
      if (next.has(key)) next.delete(key)
      else next.add(key)
      return next
    })
  }

  function toggleSelectVisible() {
    setSelected((prev) => {
      const next = new Set(prev)
      if (allVisibleSelected) {
        for (const k of allVisibleKeys) next.delete(k)
      } else {
        for (const k of allVisibleKeys) next.add(k)
      }
      return next
    })
  }

  async function requestRemoval() {
    const chosen = visibleAssets.filter(({ item, index }) => selected.has(itemKey(item, index)))
    if (chosen.length === 0) {
      setActionError('Select at least one item to request removal.')
      return
    }

    setRequesting(true)
    setActionError(null)
    setActionMsg(null)
    try {
      const lines = chosen.map(
        ({ item }) =>
          `- ${item.risk_item_name ?? item.description ?? 'Item'} · ${item.section ?? '—'} · SI ${
            item.sum_insured != null ? formatCurrency(item.sum_insured) : '—'
          }${item.risk_item_id ? ` · id ${item.risk_item_id}` : ''}`,
      )
      const filterNote =
        maxValue != null && Number.isFinite(maxValue)
          ? `Filter applied: sum insured less than ${formatCurrency(maxValue)}.`
          : null

      await sendBrokerRequest({
        context_type: 'policy',
        context_zoho_id: policy.zoho_policy_id ?? policy.id,
        context_label: policy.policy_number,
        request_type: 'remove_items',
        task_subject: `Aegis: Request removal of ${chosen.length} item(s) — ${policy.policy_number}`,
        notify_email: 'jananda@theinsurancehub.co.za',
        message: [
          'Please remove the following items from the policy schedule / Nimbis.',
          filterNote,
          '',
          ...lines,
        ]
          .filter(Boolean)
          .join('\n'),
        draft_item: undefined,
      })
      setActionMsg(
        `Removal request sent for ${chosen.length} item${chosen.length === 1 ? '' : 's'}. Your broker will action this.`,
      )
      setSelected(new Set())
    } catch (err) {
      setActionError(err instanceof Error ? err.message : 'Failed to send removal request')
    } finally {
      setRequesting(false)
    }
  }

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
      {actionMsg && (
        <p className="rounded-md border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-900">
          {actionMsg}
        </p>
      )}

      {canSeeFinancials && (
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          <div className="rounded-lg border border-border bg-surface px-4 py-4 shadow-sm">
            <p className="text-xs font-medium uppercase tracking-wide text-muted">Sum insured</p>
            <p className="mt-1 text-2xl font-semibold tabular-nums text-gray-900">
              {formatCurrency(totals.sum)}
            </p>
            <p className="mt-1 text-xs text-muted">All sections combined</p>
          </div>
          <div className="rounded-lg border border-border bg-surface px-4 py-4 shadow-sm">
            <p className="text-xs font-medium uppercase tracking-wide text-muted">Premium</p>
            <p className="mt-1 text-2xl font-semibold tabular-nums text-gray-900">
              {formatCurrency(totalPolicyPremium)}
            </p>
            <p className="mt-1 text-xs text-muted">Total policy premium</p>
          </div>
        </div>
      )}

      {nonAssetItems.length > 0 && (
        <div className="space-y-3">
          <div>
            <h2 className="font-semibold">Cover sections</h2>
            <p className="text-xs text-muted">
              Non-asset covers such as Business Interruption and liability.
            </p>
          </div>
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {nonAssetItems.map(({ item, index }) => {
              const name = item.risk_item_name ?? item.description ?? item.section ?? 'Cover'
              const premium = item.premium_excl ?? item.premium_incl
              return (
                <div
                  key={itemKey(item, index)}
                  className="rounded-xl border border-border bg-surface p-4 shadow-sm"
                >
                  <p className="flex items-center gap-2 text-sm font-semibold text-gray-900">
                    <Building2 size={15} className="text-primary" />
                    {name}
                  </p>
                  <p className="mt-1 text-xs text-muted">{item.section ?? 'Section cover'}</p>
                  {canSeeFinancials && (
                    <div className="mt-3 flex flex-wrap gap-3 text-sm">
                      <span>
                        <span className="text-muted">SI </span>
                        <span className="font-medium tabular-nums">
                          {item.sum_insured != null ? formatCurrency(item.sum_insured) : '—'}
                        </span>
                      </span>
                      <span>
                        <span className="text-muted">Premium </span>
                        <span className="font-medium tabular-nums">
                          {premium != null ? formatCurrency(premium) : '—'}
                        </span>
                      </span>
                    </div>
                  )}
                </div>
              )
            })}
          </div>
        </div>
      )}

      <div className="rounded-lg border border-border bg-surface shadow-sm">
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-border bg-page px-4 py-3">
          <div>
            <h2 className="font-semibold">Scheduled assets</h2>
            <p className="text-xs text-muted">
              {visibleAssets.length} item{visibleAssets.length === 1 ? '' : 's'}
              {maxValue != null && Number.isFinite(maxValue)
                ? ` under ${formatCurrency(maxValue)}`
                : ''}{' '}
              · select to request removal
            </p>
          </div>
          <div className="flex flex-wrap items-center gap-2">
            <label className="inline-flex items-center gap-2 text-xs text-muted">
              <Filter size={14} />
              Value less than
              <input
                type="number"
                min={0}
                step={100}
                placeholder="e.g. 10000"
                className="field-input w-28 py-1.5 text-sm"
                value={maxValueFilter}
                onChange={(e) => setMaxValueFilter(e.target.value)}
              />
            </label>
            <button
              type="button"
              disabled={selected.size === 0 || requesting}
              onClick={() => void requestRemoval()}
              className="inline-flex items-center gap-1.5 rounded-lg border border-red-200 bg-red-50 px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-100 disabled:opacity-50"
            >
              {requesting ? <Loader2 size={14} className="animate-spin" /> : <Trash2 size={14} />}
              Request removal ({selected.size})
            </button>
          </div>
        </div>

        <div className="w-full overflow-x-auto">
          <table className="w-full min-w-[760px] table-fixed text-sm">
            <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
              <tr>
                <th className="w-10 px-2 py-2">
                  <input
                    type="checkbox"
                    checked={allVisibleSelected}
                    onChange={toggleSelectVisible}
                    aria-label="Select all visible"
                  />
                </th>
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
              {visibleAssets.map(({ item, index }) => {
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
                const colSpan = canSeeFinancials ? 7 : 5

                return (
                  <Fragment key={key}>
                    <tr className="border-b border-border hover:bg-page/60">
                      <td className="px-2 py-3 text-center">
                        <input
                          type="checkbox"
                          checked={selected.has(key)}
                          onChange={() => toggleKey(key)}
                          aria-label={`Select ${name}`}
                        />
                      </td>
                      <td
                        className="cursor-pointer px-2 py-3 text-center text-muted"
                        onClick={() => setExpanded(isOpen ? null : key)}
                      >
                        {isOpen ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
                      </td>
                      <td
                        className="cursor-pointer px-3 py-3 font-medium text-gray-900"
                        onClick={() => setExpanded(isOpen ? null : key)}
                      >
                        {name}
                      </td>
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
                              onClick={() => setAttachmentsFor({ name, attachments })}
                              className="inline-flex items-center gap-1.5 rounded-lg border border-border bg-surface px-3 py-1.5 text-xs font-medium hover:bg-page"
                            >
                              <Eye size={14} />
                              View attachments
                              {attachments.length > 0 ? ` (${attachments.length})` : ''}
                            </button>
                            {canSeeFinancials && (
                              <Link
                                to={claimHref(policy, item, index)}
                                className="inline-flex items-center gap-1.5 rounded-lg bg-primary px-3 py-1.5 text-xs font-medium text-white hover:opacity-90"
                              >
                                <FileWarning size={14} />
                                Create claim
                              </Link>
                            )}
                          </div>

                          <h3 className="mb-2 text-xs font-semibold uppercase tracking-wide text-muted">
                            Extensions / add-ons
                          </h3>
                          {addonChips.length === 0 ? (
                            <p className="text-sm text-muted">
                              No optional extensions selected for this item.
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

        {visibleAssets.length === 0 && (
          <p className="px-4 py-6 text-sm text-muted">
            No scheduled assets match this filter.
          </p>
        )}

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
