import { useMemo } from 'react'
import type { SelectedExtension } from '../../types/employee'
import { resolveItemExtensions } from '../../lib/extensions'
import { ExtensionsTable } from '../crm/ExtensionsTable'

interface ItemExtensionsPanelProps {
  category: string
  stored: unknown
  onChange?: (next: SelectedExtension[]) => void
  editable?: boolean
}

export function ItemExtensionsPanel({
  category,
  stored,
  onChange,
  editable = false,
}: ItemExtensionsPanelProps) {
  const extensions = useMemo(
    () => resolveItemExtensions(category, stored),
    [category, stored],
  )

  if (!editable || !onChange) {
    return (
      <ExtensionsTable
        title="Item extensions"
        hint="Optional covers for this asset only. Policy-level covers such as car hire still apply from the schedule."
        extensions={extensions}
        emptyLabel="No item-level extensions for this category."
      />
    )
  }

  return (
    <div className="rounded-lg border border-border bg-surface shadow-sm">
      <div className="border-b border-border bg-page px-4 py-3">
        <h3 className="font-semibold text-gray-900">Item extensions</h3>
        <p className="text-xs text-muted">
          Tick covers that apply to this item. Motor examples: Excess Sure, TyreSure, car hire,
          credit shortfall.
        </p>
      </div>
      {extensions.length === 0 ? (
        <p className="px-4 py-6 text-sm text-muted">No item-level extensions for this category.</p>
      ) : (
        <ul className="divide-y divide-border">
          {extensions.map((ext) => (
            <li key={ext.code} className="flex items-start gap-3 px-4 py-3">
              <input
                type="checkbox"
                className="mt-1"
                checked={ext.included}
                onChange={(e) => {
                  const next = extensions.map((row) =>
                    row.code === ext.code
                      ? {
                          code: row.code,
                          name: row.name,
                          included: e.target.checked,
                          sum_insured: row.sum_insured,
                          premium_excl: row.premium_excl,
                          notes: row.notes,
                        }
                      : {
                          code: row.code,
                          name: row.name,
                          included: row.included,
                          sum_insured: row.sum_insured,
                          premium_excl: row.premium_excl,
                          notes: row.notes,
                        },
                  )
                  onChange(next)
                }}
              />
              <div>
                <p className="text-sm font-medium text-gray-900">{ext.name}</p>
                <p className="text-xs text-muted">{ext.description}</p>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
