import { formatCurrency } from '../../lib/utils'
import { grandTotals, type CategoryTotal } from '../../lib/category-totals'

interface CategoryTotalsTableProps {
  totals: CategoryTotal[]
  valueLabel?: string
  premiumLabel?: string
  /** When true, show a premium column (all sections accumulate). */
  showPremium?: boolean
}

export function CategoryTotalsTable({
  totals,
  valueLabel = 'Sum insured',
  premiumLabel = 'Premium',
  showPremium = false,
}: CategoryTotalsTableProps) {
  if (totals.length === 0) return null

  const grand = grandTotals(totals)

  return (
    <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
      <div className="border-b border-border px-4 py-3">
        <h2 className="font-semibold">Category totals</h2>
        <p className="text-xs text-muted">
          {grand.itemCount} item{grand.itemCount === 1 ? '' : 's'} across {totals.length}{' '}
          categor{totals.length === 1 ? 'y' : 'ies'} — all sections included
        </p>
      </div>
      <table className="min-w-full text-sm">
        <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
          <tr>
            <th className="px-4 py-2">Category / section</th>
            <th className="px-4 py-2 text-right">Items</th>
            <th className="px-4 py-2 text-right">{valueLabel}</th>
            {showPremium && <th className="px-4 py-2 text-right">{premiumLabel}</th>}
          </tr>
        </thead>
        <tbody>
          {totals.map((row) => (
            <tr key={row.category} className="border-b border-border last:border-0">
              <td className="px-4 py-3 font-medium">{row.category}</td>
              <td className="px-4 py-3 text-right text-muted">{row.itemCount}</td>
              <td className="px-4 py-3 text-right">{formatCurrency(row.totalValue)}</td>
              {showPremium && (
                <td className="px-4 py-3 text-right">{formatCurrency(row.totalPremium)}</td>
              )}
            </tr>
          ))}
        </tbody>
        <tfoot className="border-t border-border bg-page font-semibold">
          <tr>
            <td className="px-4 py-3">Grand total</td>
            <td className="px-4 py-3 text-right">{grand.itemCount}</td>
            <td className="px-4 py-3 text-right">{formatCurrency(grand.totalValue)}</td>
            {showPremium && (
              <td className="px-4 py-3 text-right">{formatCurrency(grand.totalPremium)}</td>
            )}
          </tr>
        </tfoot>
      </table>
    </div>
  )
}
