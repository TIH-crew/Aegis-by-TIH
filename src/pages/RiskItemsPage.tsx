import { useEffect, useMemo, useState } from 'react'
import { FileSpreadsheet } from 'lucide-react'
import { useSearchParams } from 'react-router-dom'
import { CollectionToolbar } from '../components/collections/CollectionToolbar'
import { RiskItemsBulkImport } from '../components/collections/RiskItemsBulkImport'
import { RiskItemsGrid } from '../components/collections/RiskItemsGrid'
import { RiskItemsTable } from '../components/collections/RiskItemsTable'
import { INSURANCE_STATUSES, RISK_CATEGORIES } from '../config/collections'
import {
  defaultVisibleColumns,
  RISK_ITEMS_COLUMNS,
  type RiskItemsColumnId,
} from '../config/risk-items-columns'
import { useBranches } from '../context/BranchesContext'
import { useSearch } from '../context/SearchContext'
import {
  type AssetViewTab,
  countActiveFilters,
  EMPTY_RISK_ITEMS_FILTERS,
  matchesAssetView,
  matchesFilters,
  matchesSearch,
  RISK_ITEMS_SORT_OPTIONS,
  sortRiskItems,
  type RiskItemsFilters,
  type RiskItemsSortField,
  type SortDirection,
} from '../lib/risk-items-view'
import { cn } from '../lib/utils'

const VIEW_TABS: { id: AssetViewTab; label: string }[] = [
  { id: 'all', label: 'All' },
  { id: 'attention', label: 'Needs attention' },
  { id: 'acquisition', label: 'In acquisition' },
  { id: 'active', label: 'Active' },
  { id: 'disposed', label: 'Disposed' },
]

export function RiskItemsPage() {
  const { branches } = useBranches()
  const { query, setQuery, riskItems, loading, error, refreshRiskItems } = useSearch()
  const [searchParams, setSearchParams] = useSearchParams()
  const [viewMode, setViewMode] = useState<'list' | 'grid'>('list')
  const [filters, setFilters] = useState<RiskItemsFilters>(EMPTY_RISK_ITEMS_FILTERS)
  const [sortField, setSortField] = useState<RiskItemsSortField>('name')
  const [sortDirection, setSortDirection] = useState<SortDirection>('asc')
  const [visibleColumns, setVisibleColumns] = useState(defaultVisibleColumns)
  const [importOpen, setImportOpen] = useState(false)
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set())

  const viewTab = (searchParams.get('view') as AssetViewTab | null) ?? 'all'

  useEffect(() => {
    setQuery(searchParams.get('q') ?? '')
  }, [searchParams, setQuery])

  function updateSearch(next: string) {
    setQuery(next)
    const params = new URLSearchParams(searchParams)
    if (next.trim()) params.set('q', next)
    else params.delete('q')
    setSearchParams(params, { replace: true })
  }

  function setView(tab: AssetViewTab) {
    const params = new URLSearchParams(searchParams)
    if (tab === 'all') params.delete('view')
    else params.set('view', tab)
    setSearchParams(params, { replace: true })
    setSelectedIds(new Set())
  }

  const branchOptions = useMemo(() => {
    const fromItems = riskItems.map((i) => i.branch).filter(Boolean) as string[]
    const fromBranches = branches.map((b) => b.name)
    return [...new Set([...fromBranches, ...fromItems])].sort()
  }, [riskItems, branches])

  const assigneeOptions = useMemo(() => {
    return [...new Set(riskItems.map((i) => i.employee_name).filter(Boolean) as string[])].sort()
  }, [riskItems])

  const tabCounts = useMemo(() => {
    const counts: Record<AssetViewTab, number> = {
      all: riskItems.length,
      attention: 0,
      acquisition: 0,
      active: 0,
      disposed: 0,
    }
    for (const item of riskItems) {
      if (matchesAssetView(item, 'attention')) counts.attention += 1
      if (matchesAssetView(item, 'acquisition')) counts.acquisition += 1
      if (matchesAssetView(item, 'active')) counts.active += 1
      if (matchesAssetView(item, 'disposed')) counts.disposed += 1
    }
    return counts
  }, [riskItems])

  const displayedItems = useMemo(() => {
    const filtered = riskItems.filter(
      (item) =>
        matchesAssetView(item, viewTab) &&
        matchesSearch(item, query) &&
        matchesFilters(item, filters),
    )
    return sortRiskItems(filtered, sortField, sortDirection)
  }, [riskItems, query, filters, sortField, sortDirection, viewTab])

  function toggleColumn(id: RiskItemsColumnId) {
    setVisibleColumns((prev) => {
      const visibleCount = Object.values(prev).filter(Boolean).length
      if (prev[id] && visibleCount <= 1) return prev
      return { ...prev, [id]: !prev[id] }
    })
  }

  function toggleSelect(id: string) {
    setSelectedIds((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }

  function toggleSelectAll() {
    setSelectedIds((prev) => {
      const allSelected = displayedItems.every((i) => prev.has(i.id))
      if (allSelected) return new Set()
      return new Set(displayedItems.map((i) => i.id))
    })
  }

  return (
    <div>
      <CollectionToolbar
        title="Assets"
        subtitle={`${displayedItems.length.toLocaleString()} of ${riskItems.length.toLocaleString()} in register · insurance schedule items may include third-party owned assets`}
        recordCount={displayedItems.length}
        addPath="/assets/new"
        addLabel="Add asset"
        toolbarActions={
          <button
            type="button"
            onClick={() => setImportOpen(true)}
            className="inline-flex items-center gap-1.5 rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium text-gray-700 hover:bg-page"
          >
            <FileSpreadsheet size={16} />
            Import
          </button>
        }
        viewMode={viewMode}
        onViewModeChange={setViewMode}
        activeFilterCount={countActiveFilters(filters)}
        filterPanel={
          <div className="space-y-3">
            <FilterField label="Asset class">
              <select
                className="field-input"
                value={filters.category}
                onChange={(e) => setFilters((f) => ({ ...f, category: e.target.value }))}
              >
                <option value="">All classes</option>
                {RISK_CATEGORIES.map((c) => (
                  <option key={c} value={c}>
                    {c}
                  </option>
                ))}
              </select>
            </FilterField>
            <FilterField label="Branch">
              <select
                className="field-input"
                value={filters.branch}
                onChange={(e) => setFilters((f) => ({ ...f, branch: e.target.value }))}
              >
                <option value="">All branches</option>
                {branchOptions.map((b) => (
                  <option key={b} value={b}>
                    {b}
                  </option>
                ))}
              </select>
            </FilterField>
            <FilterField label="Custodian">
              <select
                className="field-input"
                value={filters.employee_name}
                onChange={(e) => setFilters((f) => ({ ...f, employee_name: e.target.value }))}
              >
                <option value="">All custodians</option>
                {assigneeOptions.map((name) => (
                  <option key={name} value={name}>
                    {name}
                  </option>
                ))}
              </select>
            </FilterField>
            <FilterField label="Insurance status">
              <select
                className="field-input"
                value={filters.insurance_status}
                onChange={(e) =>
                  setFilters((f) => ({ ...f, insurance_status: e.target.value }))
                }
              >
                <option value="">All statuses</option>
                {INSURANCE_STATUSES.map((s) => (
                  <option key={s} value={s}>
                    {s}
                  </option>
                ))}
              </select>
            </FilterField>
            <button
              type="button"
              onClick={() => setFilters(EMPTY_RISK_ITEMS_FILTERS)}
              className="text-sm text-primary hover:underline"
            >
              Clear filters
            </button>
          </div>
        }
        sortPanel={
          <div className="space-y-3">
            <FilterField label="Sort by">
              <select
                className="field-input"
                value={sortField}
                onChange={(e) => setSortField(e.target.value as RiskItemsSortField)}
              >
                {RISK_ITEMS_SORT_OPTIONS.map((opt) => (
                  <option key={opt.value} value={opt.value}>
                    {opt.label}
                  </option>
                ))}
              </select>
            </FilterField>
            <FilterField label="Direction">
              <select
                className="field-input"
                value={sortDirection}
                onChange={(e) => setSortDirection(e.target.value as SortDirection)}
              >
                <option value="asc">Ascending</option>
                <option value="desc">Descending</option>
              </select>
            </FilterField>
          </div>
        }
        columnsPanel={
          <div className="space-y-2">
            {RISK_ITEMS_COLUMNS.map((col) => (
              <label
                key={col.id}
                className="flex cursor-pointer items-center gap-2 rounded-md px-1 py-1.5 text-sm hover:bg-page"
              >
                <input
                  type="checkbox"
                  checked={visibleColumns[col.id]}
                  onChange={() => toggleColumn(col.id)}
                  className="rounded border-gray-300 text-primary"
                />
                {col.label}
              </label>
            ))}
          </div>
        }
      />

      <div className="mb-3 flex flex-wrap gap-1 border-b border-border pb-0">
        {VIEW_TABS.map((tab) => (
          <button
            key={tab.id}
            type="button"
            onClick={() => setView(tab.id)}
            className={cn(
              '-mb-px border-b-2 px-3 py-2 text-sm font-medium transition-colors',
              viewTab === tab.id
                ? 'border-primary text-primary'
                : 'border-transparent text-muted hover:text-ink',
            )}
          >
            {tab.label}
            <span className="ml-1.5 tabular-nums text-xs text-muted">{tabCounts[tab.id]}</span>
          </button>
        ))}
      </div>

      {selectedIds.size > 0 && (
        <div className="mb-3 flex flex-wrap items-center gap-3 rounded-md border border-border bg-surface px-3 py-2 text-sm">
          <span className="font-medium">{selectedIds.size} selected</span>
          <span className="text-muted">Bulk actions:</span>
          <button
            type="button"
            className="rounded-md border border-border px-2.5 py-1 text-xs font-medium hover:bg-page"
            onClick={() => setSelectedIds(new Set())}
          >
            Clear selection
          </button>
          <span className="text-xs text-muted">
            Export / custody bulk actions will use this selection (explicit — no silent changes).
          </span>
        </div>
      )}

      <div className="mb-4">
        <input
          type="search"
          value={query}
          onChange={(e) => updateSearch(e.target.value)}
          placeholder="Search tag, name, class, branch, custodian, serial…"
          className="field-input max-w-xl"
          aria-label="Search assets"
        />
      </div>

      {viewTab === 'disposed' && (
        <p className="mb-3 rounded-md border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-950">
          Disposal lifecycle is not yet recorded on the register. This view will populate once
          write-off / disposal movements are enabled.
        </p>
      )}

      {loading && <p className="text-sm text-muted">Loading assets…</p>}
      {error && (
        <div className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          <p>{error}</p>
          <button
            type="button"
            onClick={() => void refreshRiskItems()}
            className="mt-2 font-medium underline"
          >
            Retry
          </button>
        </div>
      )}
      {!loading && !error && viewMode === 'list' && (
        <RiskItemsTable
          items={displayedItems}
          visibleColumns={visibleColumns}
          selectedIds={selectedIds}
          onToggleSelect={toggleSelect}
          onToggleSelectAll={toggleSelectAll}
        />
      )}
      {!loading && !error && viewMode === 'grid' && (
        <RiskItemsGrid items={displayedItems} visibleColumns={visibleColumns} />
      )}

      <RiskItemsBulkImport open={importOpen} onClose={() => setImportOpen(false)} />
    </div>
  )
}

function FilterField({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <label className="block text-sm">
      <span className="mb-1 block font-medium text-gray-700">{label}</span>
      {children}
    </label>
  )
}
