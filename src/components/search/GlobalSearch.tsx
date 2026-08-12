import { useRef, useState } from 'react'
import { Loader2, Search } from 'lucide-react'
import { Link, useNavigate } from 'react-router-dom'
import { useSearch } from '../../context/SearchContext'
import { useClickOutside } from '../../hooks/useClickOutside'
import { cn } from '../../lib/utils'

export function GlobalSearch() {
  const navigate = useNavigate()
  const { query, setQuery, previewResults, filterRiskItems, loading } = useSearch()
  const [open, setOpen] = useState(false)
  const containerRef = useRef<HTMLDivElement>(null)

  useClickOutside(containerRef, () => setOpen(false), open)

  const totalMatches = query.trim() ? filterRiskItems(query).length : 0

  function goToAllResults() {
    const trimmed = query.trim()
    if (!trimmed) return
    setOpen(false)
    navigate(`/collections/risk-items?q=${encodeURIComponent(trimmed)}`)
  }

  function handleKeyDown(e: React.KeyboardEvent<HTMLInputElement>) {
    if (e.key === 'Enter') {
      e.preventDefault()
      goToAllResults()
    }
    if (e.key === 'Escape') {
      setOpen(false)
    }
  }

  return (
    <div ref={containerRef} className="relative mx-auto w-full max-w-xl">
      <Search className="absolute left-3 top-2.5 text-muted" size={16} />
      <input
        type="search"
        value={query}
        onChange={(e) => {
          setQuery(e.target.value)
          setOpen(true)
        }}
        onFocus={() => setOpen(true)}
        onKeyDown={handleKeyDown}
        placeholder="Search risk items, tags, branches..."
        className="w-full rounded-full border border-border bg-page py-2 pl-9 pr-4 text-sm outline-none focus:ring-2 focus:ring-accent/30"
        aria-label="Search"
        aria-expanded={open}
        aria-controls="global-search-results"
      />

      {open && query.trim() && (
        <div
          id="global-search-results"
          className="absolute left-0 right-0 top-full z-40 mt-2 overflow-hidden rounded-lg border border-border bg-surface shadow-lg"
        >
          {loading && (
            <div className="flex items-center gap-2 px-4 py-3 text-sm text-muted">
              <Loader2 size={14} className="animate-spin" />
              Loading records...
            </div>
          )}

          {!loading && previewResults.length === 0 && (
            <p className="px-4 py-3 text-sm text-muted">No matching risk items.</p>
          )}

          {!loading && previewResults.length > 0 && (
            <ul className="max-h-80 overflow-y-auto py-1">
              {previewResults.map((item) => (
                <li key={item.id}>
                  <Link
                    to={`/collections/risk-items/${item.id}`}
                    onClick={() => setOpen(false)}
                    className="block px-4 py-2.5 hover:bg-accent-light/50"
                  >
                    <p className="truncate text-sm font-medium text-burgundy">{item.name}</p>
                    <p className="truncate text-xs text-muted">
                      {item.asset_tag} · {item.category}
                      {item.branch ? ` · ${item.branch}` : ''}
                    </p>
                  </Link>
                </li>
              ))}
            </ul>
          )}

          {!loading && totalMatches > 0 && (
            <button
              type="button"
              onClick={goToAllResults}
              className={cn(
                'w-full border-t border-border px-4 py-2.5 text-left text-sm font-medium text-accent hover:bg-accent-light/40',
              )}
            >
              View all {totalMatches} result{totalMatches === 1 ? '' : 's'}
            </button>
          )}
        </div>
      )}
    </div>
  )
}
