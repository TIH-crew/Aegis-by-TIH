import { useRef, useState, type ReactNode } from 'react'
import {
  ArrowDownUp,
  Eye,
  Filter,
  Grid3x3,
  List,
  Plus,
} from 'lucide-react'
import { Link } from 'react-router-dom'
import { useClickOutside } from '../../hooks/useClickOutside'
import { cn } from '../../lib/utils'

type ToolbarPanel = 'filter' | 'sort' | 'columns'

interface CollectionToolbarProps {
  title: string
  recordCount: number
  addPath?: string
  toolbarActions?: ReactNode
  viewMode: 'list' | 'grid'
  onViewModeChange: (mode: 'list' | 'grid') => void
  activeFilterCount?: number
  filterPanel: ReactNode
  sortPanel: ReactNode
  columnsPanel: ReactNode
}

export function CollectionToolbar({
  title,
  recordCount,
  addPath,
  toolbarActions,
  viewMode,
  onViewModeChange,
  activeFilterCount = 0,
  filterPanel,
  sortPanel,
  columnsPanel,
}: CollectionToolbarProps) {
  const [openPanel, setOpenPanel] = useState<ToolbarPanel | null>(null)
  const toolbarRef = useRef<HTMLDivElement>(null)

  useClickOutside(toolbarRef, () => setOpenPanel(null), openPanel !== null)

  function togglePanel(panel: ToolbarPanel) {
    setOpenPanel((current) => (current === panel ? null : panel))
  }

  return (
    <div ref={toolbarRef} className="relative mb-4">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-semibold text-gray-900">{title}</h1>
          <p className="text-sm text-muted">
            {recordCount.toLocaleString()} Records in collection
          </p>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <ToolbarToggle
            icon={Filter}
            label="Filter"
            active={openPanel === 'filter'}
            badge={activeFilterCount > 0 ? activeFilterCount : undefined}
            onClick={() => togglePanel('filter')}
          />
          <ToolbarToggle
            icon={ArrowDownUp}
            label="Sort"
            active={openPanel === 'sort'}
            onClick={() => togglePanel('sort')}
          />
          <ToolbarToggle
            icon={List}
            label="List view"
            active={viewMode === 'list'}
            onClick={() => onViewModeChange('list')}
          />
          <ToolbarToggle
            icon={Grid3x3}
            label="Grid view"
            active={viewMode === 'grid'}
            onClick={() => onViewModeChange('grid')}
          />
          <ToolbarToggle
            icon={Eye}
            label="Columns"
            active={openPanel === 'columns'}
            onClick={() => togglePanel('columns')}
          />
          {toolbarActions}
          {addPath && (
            <Link
              to={addPath}
              className="inline-flex items-center gap-1.5 rounded-lg bg-accent px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-accent-hover"
            >
              <Plus size={16} />
              Add +
            </Link>
          )}
        </div>
      </div>

      {openPanel === 'filter' && (
        <ToolbarPanel title="Filter records" onClose={() => setOpenPanel(null)}>
          {filterPanel}
        </ToolbarPanel>
      )}
      {openPanel === 'sort' && (
        <ToolbarPanel title="Sort records" onClose={() => setOpenPanel(null)}>
          {sortPanel}
        </ToolbarPanel>
      )}
      {openPanel === 'columns' && (
        <ToolbarPanel title="Show columns" onClose={() => setOpenPanel(null)}>
          {columnsPanel}
        </ToolbarPanel>
      )}
    </div>
  )
}

function ToolbarToggle({
  icon: Icon,
  label,
  active,
  badge,
  onClick,
}: {
  icon: React.ComponentType<{ size?: number }>
  label: string
  active?: boolean
  badge?: number
  onClick: () => void
}) {
  return (
    <button
      type="button"
      title={label}
      onClick={onClick}
      className={cn(
        'relative rounded-lg border p-2 transition-colors',
        active
          ? 'border-accent bg-accent-light text-primary'
          : 'border-border bg-surface text-gray-600 hover:bg-gray-50',
      )}
    >
      <Icon size={18} />
      {badge != null && badge > 0 && (
        <span className="absolute -right-1 -top-1 flex h-4 min-w-4 items-center justify-center rounded-full bg-accent px-1 text-[10px] font-semibold text-white">
          {badge}
        </span>
      )}
    </button>
  )
}

function ToolbarPanel({
  title,
  children,
  onClose,
}: {
  title: string
  children: ReactNode
  onClose: () => void
}) {
  return (
    <div className="absolute right-0 top-full z-30 mt-2 w-full max-w-sm rounded-lg border border-border bg-surface p-4 shadow-lg">
      <div className="mb-3 flex items-center justify-between">
        <h2 className="text-sm font-semibold text-gray-900">{title}</h2>
        <button
          type="button"
          onClick={onClose}
          className="text-xs text-muted hover:text-gray-900"
        >
          Close
        </button>
      </div>
      {children}
    </div>
  )
}
