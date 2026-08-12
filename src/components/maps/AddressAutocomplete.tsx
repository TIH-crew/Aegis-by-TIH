import { useEffect, useRef, useState } from 'react'
import { hasGoogleMapsKey, loadGoogleMaps, parsePlaceResult, type PlaceSelection } from '../../lib/google-maps'

interface AddressAutocompleteProps {
  onPlaceSelect: (place: PlaceSelection) => void
  onInputChange?: () => void
  /** Change to clear the field after a successful submit. */
  resetToken?: number
  placeholder?: string
  disabled?: boolean
  required?: boolean
}

export function AddressAutocomplete({
  onPlaceSelect,
  onInputChange,
  resetToken = 0,
  placeholder = 'Start typing an address…',
  disabled,
  required,
}: AddressAutocompleteProps) {
  const inputRef = useRef<HTMLInputElement>(null)
  const autocompleteRef = useRef<google.maps.places.Autocomplete | null>(null)
  const onPlaceSelectRef = useRef(onPlaceSelect)
  const onInputChangeRef = useRef(onInputChange)
  const [ready, setReady] = useState(false)
  const [initError, setInitError] = useState<string | null>(null)

  onPlaceSelectRef.current = onPlaceSelect
  onInputChangeRef.current = onInputChange

  useEffect(() => {
    if (inputRef.current) inputRef.current.value = ''
    setReady(false)
    setInitError(null)
  }, [resetToken])

  useEffect(() => {
    if (!hasGoogleMapsKey()) return

    let listener: google.maps.MapsEventListener | null = null
    let cancelled = false

    loadGoogleMaps()
      .then(() => {
        if (cancelled || !inputRef.current) return

        autocompleteRef.current?.unbindAll()
        autocompleteRef.current = new google.maps.places.Autocomplete(inputRef.current, {
          fields: ['formatted_address', 'geometry', 'place_id', 'name'],
          componentRestrictions: { country: 'za' },
        })

        listener = autocompleteRef.current.addListener('place_changed', () => {
          const place = autocompleteRef.current?.getPlace()
          if (!place) return
          const parsed = parsePlaceResult(place)
          if (!parsed) return
          if (inputRef.current) inputRef.current.value = parsed.address
          onPlaceSelectRef.current(parsed)
        })

        setReady(true)
      })
      .catch((err) => {
        if (!cancelled) {
          setInitError(err instanceof Error ? err.message : 'Failed to load Google Maps')
        }
      })

    return () => {
      cancelled = true
      listener?.remove()
    }
  }, [resetToken])

  if (!hasGoogleMapsKey()) {
    return (
      <div className="rounded-md border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-900">
        Google Maps key missing. Add <code className="rounded bg-white px-1">VITE_GOOGLE_MAPS_API_KEY</code> to{' '}
        <code className="rounded bg-white px-1">.env</code> and restart <code className="rounded bg-white px-1">npm run dev</code>.
      </div>
    )
  }

  return (
    <div>
      <input
        ref={inputRef}
        className="field-input"
        type="text"
        placeholder={ready ? placeholder : 'Loading Google Maps…'}
        disabled={disabled}
        required={required}
        autoComplete="off"
        onChange={() => onInputChangeRef.current?.()}
      />
      {initError && (
        <p className="mt-1 text-xs text-red-600">
          {initError}. Check that Maps JavaScript API and Places API are enabled, billing is on, and your key allows{' '}
          <code className="rounded bg-red-50 px-1">localhost:1420</code>.
        </p>
      )}
      {ready && !initError && (
        <p className="mt-1 text-xs text-muted">Pick an address from the dropdown suggestions.</p>
      )}
    </div>
  )
}
