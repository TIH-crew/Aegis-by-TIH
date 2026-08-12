import { useEffect, useRef, useState } from 'react'
import { hasGoogleMapsKey, loadGoogleMaps } from '../../lib/google-maps'
import type { Branch } from '../../types/branch'
import type { RiskItem } from '../../types'
import { formatCurrency } from '../../lib/utils'

export interface MapBranch extends Pick<
  Branch,
  'id' | 'name' | 'address' | 'latitude' | 'longitude'
> {
  employeeCount?: number
  itemCount?: number
  totalValue?: number
}

export interface MapRiskItem
  extends Pick<RiskItem, 'id' | 'name' | 'latitude' | 'longitude' | 'branch_id'> {
  unit_cost?: number | null
}

interface LocationsMapProps {
  branches: MapBranch[]
  items: MapRiskItem[]
  className?: string
  resolveItemPosition?: (item: MapRiskItem) => { lat: number; lng: number } | null
  highlightBranchId?: string | null
}

export function LocationsMap({
  branches,
  items,
  className = 'h-[420px] w-full rounded-lg border border-border',
  resolveItemPosition,
  highlightBranchId,
}: LocationsMapProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const mapRef = useRef<google.maps.Map | null>(null)
  const markersRef = useRef<google.maps.Marker[]>([])
  const infoRef = useRef<google.maps.InfoWindow | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!hasGoogleMapsKey() || !containerRef.current) return

    let cancelled = false

    loadGoogleMaps()
      .then(() => {
        if (cancelled || !containerRef.current) return

        if (!mapRef.current) {
          mapRef.current = new google.maps.Map(containerRef.current, {
            center: { lat: -28.4793, lng: 24.6727 },
            zoom: 5,
            mapTypeControl: false,
            streetViewControl: false,
            fullscreenControl: true,
          })
        }

        if (!infoRef.current) {
          infoRef.current = new google.maps.InfoWindow()
        }

        markersRef.current.forEach((m) => m.setMap(null))
        markersRef.current = []

        const bounds = new google.maps.LatLngBounds()
        let hasMarkers = false

        for (const branch of branches) {
          if (!branch.latitude && !branch.longitude) continue
          const pos = { lat: branch.latitude, lng: branch.longitude }
          const highlighted = highlightBranchId === branch.id
          const marker = new google.maps.Marker({
            map: mapRef.current,
            position: pos,
            title: `${branch.name} (branch)`,
            label: { text: 'B', color: '#ffffff', fontWeight: '700' },
            zIndex: highlighted ? 1000 : 100,
            opacity: highlightBranchId && !highlighted ? 0.45 : 1,
          })
          const valueLine =
            branch.totalValue != null
              ? `<div><strong>Value:</strong> ${formatCurrency(branch.totalValue)}</div>`
              : ''
          const staffLine =
            branch.employeeCount != null
              ? `<div><strong>Staff:</strong> ${branch.employeeCount}</div>`
              : ''
          const itemsLine =
            branch.itemCount != null ? `<div><strong>Items:</strong> ${branch.itemCount}</div>` : ''
          marker.addListener('click', () => {
            infoRef.current?.setContent(
              `<div style="max-width:220px;font-size:13px;line-height:1.4">
                <strong>${escapeHtml(branch.name)}</strong>
                ${branch.address ? `<div style="color:#666;margin-top:4px">${escapeHtml(branch.address)}</div>` : ''}
                <div style="margin-top:6px">${staffLine}${itemsLine}${valueLine}</div>
              </div>`,
            )
            infoRef.current?.open({ map: mapRef.current!, anchor: marker })
          })
          markersRef.current.push(marker)
          bounds.extend(pos)
          hasMarkers = true
        }

        for (const item of items) {
          const pos =
            resolveItemPosition?.(item) ??
            (item.latitude != null && item.longitude != null
              ? { lat: item.latitude, lng: item.longitude }
              : null)
          if (!pos) continue

          const dimmed =
            highlightBranchId != null &&
            item.branch_id != null &&
            item.branch_id !== highlightBranchId

          const marker = new google.maps.Marker({
            map: mapRef.current,
            position: pos,
            title: item.name,
            opacity: dimmed ? 0.35 : 1,
            icon: {
              path: google.maps.SymbolPath.CIRCLE,
              scale: 8,
              fillColor: '#d31124',
              fillOpacity: 1,
              strokeColor: '#630d16',
              strokeWeight: 2,
            },
          })
          const cost =
            item.unit_cost != null ? formatCurrency(Number(item.unit_cost)) : '—'
          marker.addListener('click', () => {
            infoRef.current?.setContent(
              `<div style="max-width:220px;font-size:13px;line-height:1.4">
                <strong>${escapeHtml(item.name)}</strong>
                <div style="margin-top:6px"><strong>Value:</strong> ${cost}</div>
              </div>`,
            )
            infoRef.current?.open({ map: mapRef.current!, anchor: marker })
          })
          markersRef.current.push(marker)
          bounds.extend(pos)
          hasMarkers = true
        }

        if (hasMarkers) {
          mapRef.current.fitBounds(bounds, 48)
        }
      })
      .catch((err) => {
        setError(err instanceof Error ? err.message : 'Failed to load map')
      })

    return () => {
      cancelled = true
    }
  }, [branches, items, resolveItemPosition, highlightBranchId])

  if (!hasGoogleMapsKey()) {
    return (
      <div
        className={`flex items-center justify-center bg-gray-50 p-6 text-center text-sm text-muted ${className}`}
      >
        Add <code className="mx-1 rounded bg-gray-100 px-1">VITE_GOOGLE_MAPS_API_KEY</code> to your
        .env file to display the locations map.
      </div>
    )
  }

  if (error) {
    return (
      <div
        className={`flex items-center justify-center bg-red-50 p-6 text-center text-sm text-red-700 ${className}`}
      >
        {error}
      </div>
    )
  }

  return (
    <div className="space-y-2">
      <div ref={containerRef} className={className} />
      <div className="flex flex-wrap gap-4 text-xs text-muted">
        <span className="inline-flex items-center gap-1.5">
          <span className="flex h-5 w-5 items-center justify-center rounded-full bg-burgundy text-[10px] font-bold text-white">
            B
          </span>
          Branch (staff · items · value)
        </span>
        <span className="inline-flex items-center gap-1.5">
          <span className="h-3 w-3 rounded-full bg-accent ring-2 ring-burgundy" />
          Risk item (value)
        </span>
      </div>
    </div>
  )
}

function escapeHtml(value: string) {
  return value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}
