import { importLibrary, setOptions } from '@googlemaps/js-api-loader'

const apiKey = import.meta.env.VITE_GOOGLE_MAPS_API_KEY as string | undefined

let configured = false
let readyPromise: Promise<void> | null = null

export function hasGoogleMapsKey() {
  return Boolean(apiKey?.trim())
}

export function loadGoogleMaps() {
  if (!hasGoogleMapsKey()) {
    return Promise.reject(new Error('Add VITE_GOOGLE_MAPS_API_KEY to your .env file'))
  }

  if (!readyPromise) {
    readyPromise = (async () => {
      if (!configured) {
        setOptions({
          key: apiKey!,
          v: 'weekly',
          libraries: ['places'],
        })
        configured = true
      }
      await importLibrary('maps')
      await importLibrary('places')
    })()
  }

  return readyPromise
}

export interface PlaceSelection {
  address: string
  latitude: number
  longitude: number
  placeId: string | null
}

export function parsePlaceResult(place: google.maps.places.PlaceResult): PlaceSelection | null {
  const location = place.geometry?.location
  if (!location || !place.formatted_address) return null

  return {
    address: place.formatted_address,
    latitude: location.lat(),
    longitude: location.lng(),
    placeId: place.place_id ?? null,
  }
}
