import { formatCurrency } from '../../lib/utils'
import type { ResolvedExtension } from '../../lib/extensions'

interface ExtensionsTableProps {
  title: string
  hint?: string
  extensions: ResolvedExtension[]
  emptyLabel?: string
}

export function ExtensionsTable({
  title,
  hint,
  extensions,
  emptyLabel = 'No extensions for this section.',
}: ExtensionsTableProps) {
  return (
    <div className="rounded-lg border border-border bg-surface shadow-sm">
      <div className="border-b border-border bg-page px-4 py-3">
        <h3 className="font-semibold text-gray-900">{title}</h3>
        {hint && <p className="text-xs text-muted">{hint}</p>}
      </div>
      {extensions.length === 0 ? (
        <p className="px-4 py-6 text-sm text-muted">{emptyLabel}</p>
      ) : (
        <div className="overflow-x-auto">
          <table className="min-w-full text-sm">
            <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
              <tr>
                <th className="px-4 py-2">Extension</th>
                <th className="px-4 py-2">Scope</th>
                <th className="px-4 py-2">Status</th>
                <th className="px-4 py-2 text-right">Sum insured</th>
                <th className="px-4 py-2 text-right">Premium</th>
              </tr>
            </thead>
            <tbody>
              {extensions.map((ext) => (
                <tr key={ext.code} className="border-b border-border last:border-0 align-top">
                  <td className="px-4 py-3">
                    <p className="font-medium text-gray-900">{ext.name}</p>
                    <p className="text-xs text-muted">{ext.description}</p>
                    {ext.notes && <p className="mt-1 text-xs text-muted">{ext.notes}</p>}
                  </td>
                  <td className="px-4 py-3 capitalize text-muted">{ext.scope}</td>
                  <td className="px-4 py-3">
                    <span
                      className={`rounded-full px-2 py-0.5 text-xs font-medium ${
                        ext.included
                          ? 'bg-emerald-50 text-emerald-800'
                          : 'bg-gray-100 text-muted'
                      }`}
                    >
                      {ext.included ? 'Included' : 'Available'}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-right tabular-nums">
                    {ext.sum_insured != null ? formatCurrency(ext.sum_insured) : '—'}
                  </td>
                  <td className="px-4 py-3 text-right tabular-nums">
                    {ext.premium_excl != null ? formatCurrency(ext.premium_excl) : '—'}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
