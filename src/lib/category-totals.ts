export interface CategoryTotal {
  category: string
  itemCount: number
  totalValue: number
}

export function computeCategoryTotals(
  items: { category: string; value: number }[],
): CategoryTotal[] {
  const map = new Map<string, { itemCount: number; totalValue: number }>()

  for (const item of items) {
    const category = item.category.trim() || 'Uncategorised'
    const current = map.get(category) ?? { itemCount: 0, totalValue: 0 }
    map.set(category, {
      itemCount: current.itemCount + 1,
      totalValue: current.totalValue + item.value,
    })
  }

  return [...map.entries()]
    .map(([category, totals]) => ({ category, ...totals }))
    .sort((a, b) => a.category.localeCompare(b.category))
}
