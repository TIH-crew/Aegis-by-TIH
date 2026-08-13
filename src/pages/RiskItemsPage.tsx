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
  countActiveFilters,
  EMPTY_RISK_ITEMS_FILTERS,
  matchesFilters,
  matchesSearch,
  RISK_ITEMS_SORT_OPTIONS,
  sortRiskItems,
  type RiskItemsFilters,
  type RiskItemsSortField,
  type SortDirection,
} from '../lib/risk-items-view'

export function RiskItemsPage() {
  const { branches } = useBranches()
  const { query, setQuery, riskItems, loading, error, refreshRiskItems } = useSearch()
  const [searchParams, setSearchParams] = useSearchParams()
  const [viewMode, setViewMode] = useState<'list' | 'grid'>('list')
  const [filters, setFilters] = useState<RiskItemsFilters>(EMPTY_RISK_ITEMS_FILTERS)
  const [sortField, setSortField] = useState<RiskItemsSortField>('record_date')
  const [sortDirection, setSortDirection] = useState<SortDirection>('desc')
  const [visibleColumns, setVisibleColumns] = useState(defaultVisibleColumns)
  const [importOpen, setImportOpen] = useState(false)

  useEffect(() => {
    setQuery(searchParams.get('q') ?? '')
  }, [searchParams, setQuery])

  function updateSearch(next: string) {
    setQuery(next)
    if (next.trim()) {
      setSearchParams({ q: next }, { replace: true })
    } else {
      setSearchParams({}, { replace: true })
    }
  }

  const branchOptions = useMemo(() => {
    const fromItems = riskItems.map((i) => i.branch).filter(Boolean) as string[]
    const fromBranches = branches.map((b) => b.name)
    return [...new Set([...fromBranches, ...fromItems])].sort()
  }, [riskItems, branches])

  const assigneeOptions = useMemo(() => {
    return [...new Set(riskItems.map((i) => i.employee_name).filter(Boolean) as string[])].sort()
  }, [riskItems])

  const displayedItems = useMemo(() => {
    const filtered = riskItems.filter(
      (item) => matchesSearch(item, query) && matchesFilters(item, filters),
    )
    return sortRiskItems(filtered, sortField, sortDirection)
  }, [riskItems, query, filters, sortField, sortDirection])

  function toggleColumn(id: RiskItemsColumnId) {
    setVisibleColumns((prev) => {
      const visibleCount = Object.values(prev).filter(Boolean).length
      if (prev[id] && visibleCount <= 1) return prev
      return { ...prev, [id]: !prev[id] }
    })
  }

  return (
    <div>
      <CollectionToolbar
        title="Risk Items"
        recordCount={displayedItems.length}
        addPath="/collections/risk-items/new"
        toolbarActions={
          <button
            type="button"
            onClick={() => setImportOpen(true)}
            className="inline-flex items-center gap-1.5 rounded-lg border border-border bg-surface px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
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
            <FilterField label="Category">
              <select
                className="field-input"
                value={filters.category}
                onChange={(e) => setFilters((f) => ({ ...f, category: e.target.value }))}
              >
                <option value="">All categories</option>
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
            <FilterField label="Assigned to">
              <select
                className="field-input"
                value={filters.employee_name}
                onChange={(e) => setFilters((f) => ({ ...f, employee_name: e.target.value }))}
              >
                <option value="">All staff</option>
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
              className="text-sm text-accent hover:text-accent-hover"
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
                className="flex cursor-pointer items-center gap-2 rounded-md px-1 py-1.5 text-sm hover:bg-gray-50"
              >
                <input
                  type="checkbox"
                  checked={visibleColumns[col.id]}
                  onChange={() => toggleColumn(col.id)}
                  className="rounded border-gray-300 text-accent"
                />
                {col.label}
              </label>
            ))}
          </div>
        }
      />

      <div className="mb-4 rounded-lg border border-border bg-surface p-3">
        <input
          type="search"
          value={query}
          onChange={(e) => updateSearch(e.target.value)}
          placeholder="Search name, tag, category, branch, employee, serial no..."
          className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/30"
          aria-label="Search risk items"
        />
        {query.trim() && (
          <div className="mt-2 flex items-center justify-between text-xs text-muted">
            <span>
              {displayedItems.length} result{displayedItems.length === 1 ? '' : 's'} for &ldquo;
              {query}&rdquo;
            </span>
            <button
              type="button"
              onClick={() => updateSearch('')}
              className="text-accent hover:text-accent-hover"
            >
              Clear search
            </button>
          </div>
        )}
      </div>

      {loading && <p className="text-sm text-muted">Loading records...</p>}
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
        <RiskItemsTable items={displayedItems} visibleColumns={visibleColumns} />
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
