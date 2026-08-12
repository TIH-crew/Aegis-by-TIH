import { formatCurrency } from '../../lib/utils'
import type { CategoryTotal } from '../../lib/category-totals'

interface CategoryTotalsTableProps {
  totals: CategoryTotal[]
  valueLabel?: string
}

export function CategoryTotalsTable({ totals, valueLabel = 'Total value' }: CategoryTotalsTableProps) {
  if (totals.length === 0) return null

  const grandTotal = totals.reduce((sum, row) => sum + row.totalValue, 0)
  const itemCount = totals.reduce((sum, row) => sum + row.itemCount, 0)

  return (
    <div className="overflow-hidden rounded-lg border border-border bg-surface shadow-sm">
      <div className="border-b border-border px-4 py-3">
        <h2 className="font-semibold">Category totals</h2>
        <p className="text-xs text-muted">
          {itemCount} item{itemCount === 1 ? '' : 's'} across {totals.length}{' '}
          categor{totals.length === 1 ? 'y' : 'ies'}
        </p>
      </div>
      <table className="min-w-full text-sm">
        <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
          <tr>
            <th className="px-4 py-2">Category</th>
            <th className="px-4 py-2 text-right">Items</th>
            <th className="px-4 py-2 text-right">{valueLabel}</th>
          </tr>
        </thead>
        <tbody>
          {totals.map((row) => (
            <tr key={row.category} className="border-b border-border last:border-0">
              <td className="px-4 py-3 font-medium">{row.category}</td>
              <td className="px-4 py-3 text-right text-muted">{row.itemCount}</td>
              <td className="px-4 py-3 text-right">{formatCurrency(row.totalValue)}</td>
            </tr>
          ))}
        </tbody>
        <tfoot className="border-t border-border bg-page font-semibold">
          <tr>
            <td className="px-4 py-3">Grand total</td>
            <td className="px-4 py-3 text-right">{itemCount}</td>
            <td className="px-4 py-3 text-right">{formatCurrency(grandTotal)}</td>
          </tr>
        </tfoot>
      </table>
    </div>
  )
}
