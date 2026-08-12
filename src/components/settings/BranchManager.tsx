import { useState } from 'react'
import { Loader2, MapPin, Plus, Trash2 } from 'lucide-react'
import { AddressAutocomplete } from '../maps/AddressAutocomplete'
import { useBranches } from '../../context/BranchesContext'
import type { PlaceSelection } from '../../lib/google-maps'

export function BranchManager() {
  const { branches, loading, error, addBranch, removeBranch } = useBranches()
  const [name, setName] = useState('')
  const [coords, setCoords] = useState<PlaceSelection | null>(null)
  const [addressReset, setAddressReset] = useState(0)
  const [saving, setSaving] = useState(false)
  const [message, setMessage] = useState<string | null>(null)

  async function handleAdd(e: React.FormEvent) {
    e.preventDefault()
    if (!name.trim() || !coords) {
      setMessage('Select a branch name and pick an address from Google Maps suggestions.')
      return
    }

    setSaving(true)
    setMessage(null)
    try {
      await addBranch({
        name: name.trim(),
        address: coords.address,
        latitude: coords.latitude,
        longitude: coords.longitude,
        place_id: coords.placeId,
      })
      setName('')
      setCoords(null)
      setAddressReset((n) => n + 1)
      setMessage('Branch added.')
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Failed to add branch')
    } finally {
      setSaving(false)
    }
  }

  async function handleRemove(id: string) {
    setSaving(true)
    setMessage(null)
    try {
      await removeBranch(id)
      setMessage('Branch removed.')
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Failed to remove branch')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="space-y-4 rounded-lg border border-border bg-surface p-6 shadow-sm">
      <div>
        <h2 className="text-lg font-semibold">Branches</h2>
        <p className="text-sm text-muted">
          Add company branches with a verified address. Risk items can be assigned to these branches.
        </p>
      </div>

      {loading && <p className="text-sm text-muted">Loading branches...</p>}
      {error && <p className="text-sm text-red-600">{error}</p>}

      <form onSubmit={handleAdd} className="grid grid-cols-1 gap-4 md:grid-cols-2">
        <label className="block text-sm">
          <span className="mb-1 block font-medium">Branch name *</span>
          <input
            className="field-input"
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Johannesburg HQ"
            required
          />
        </label>
        <label className="block text-sm md:col-span-2">
          <span className="mb-1 block font-medium">Address *</span>
          <AddressAutocomplete
            resetToken={addressReset}
            onPlaceSelect={setCoords}
            onInputChange={() => setCoords(null)}
            required
          />
          {coords && (
            <p className="mt-1 text-xs text-green-700">
              <MapPin size={12} className="mr-1 inline" />
              {coords.latitude.toFixed(5)}, {coords.longitude.toFixed(5)}
            </p>
          )}
        </label>
        <div className="md:col-span-2 flex items-center gap-3">
          <button
            type="submit"
            disabled={saving || !coords}
            className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white hover:bg-burgundy-dark disabled:opacity-50"
          >
            {saving ? <Loader2 size={14} className="animate-spin" /> : <Plus size={14} />}
            Add branch
          </button>
          {message && <p className="text-sm text-muted">{message}</p>}
        </div>
      </form>

      {branches.length > 0 && (
        <ul className="divide-y divide-border rounded-lg border border-border">
          {branches.map((branch) => (
            <li key={branch.id} className="flex items-start justify-between gap-3 px-4 py-3 text-sm">
              <div className="min-w-0">
                <p className="font-medium text-gray-900">{branch.name}</p>
                <p className="text-muted">{branch.address}</p>
              </div>
              <button
                type="button"
                onClick={() => handleRemove(branch.id)}
                disabled={saving}
                className="shrink-0 rounded-lg border border-border p-2 text-muted hover:bg-red-50 hover:text-red-600 disabled:opacity-50"
                title="Remove branch"
              >
                <Trash2 size={14} />
              </button>
            </li>
          ))}
        </ul>
      )}

      {!loading && branches.length === 0 && (
        <p className="rounded-lg border border-dashed border-border px-4 py-6 text-center text-sm text-muted">
          No branches yet. Add your first branch above.
        </p>
      )}
    </div>
  )
}
