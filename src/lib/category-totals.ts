export interface CategoryTotal {
  category: string
  itemCount: number
  /** Sum insured / quoted value */
  totalValue: number
  /** Premium when available (quotes / schedules) */
  totalPremium: number
}

export function computeCategoryTotals(
  items: { category: string; value: number; premium?: number }[],
): CategoryTotal[] {
  const map = new Map<string, { itemCount: number; totalValue: number; totalPremium: number }>()

  for (const item of items) {
    const category = item.category.trim() || 'Uncategorised'
    const current = map.get(category) ?? { itemCount: 0, totalValue: 0, totalPremium: 0 }
    map.set(category, {
      itemCount: current.itemCount + 1,
      totalValue: current.totalValue + (item.value || 0),
      totalPremium: current.totalPremium + (item.premium || 0),
    })
  }

  return [...map.entries()]
    .map(([category, totals]) => ({ category, ...totals }))
    .sort((a, b) => a.category.localeCompare(b.category))
}

export function grandTotals(rows: CategoryTotal[]): {
  itemCount: number
  totalValue: number
  totalPremium: number
} {
  return rows.reduce(
    (acc, row) => ({
      itemCount: acc.itemCount + row.itemCount,
      totalValue: acc.totalValue + row.totalValue,
      totalPremium: acc.totalPremium + row.totalPremium,
    }),
    { itemCount: 0, totalValue: 0, totalPremium: 0 },
  )
}
