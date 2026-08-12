import { useEffect, useRef, useState } from 'react'
import { Building2, ImagePlus, Loader2 } from 'lucide-react'
import { OrganizationMark } from '../components/brand/OrganizationMark'
import { BranchManager } from '../components/settings/BranchManager'
import { useAuth } from '../context/AuthContext'
import { useOrganization } from '../context/OrganizationContext'
import { fetchContacts } from '../services/crm.service'
import type { ContactSummary } from '../types/crm'

export function OrganizationSettingsPage() {
  const { organization, loading, error, saveOrganization, uploadLogo } = useOrganization()
  const { homeAccountId, accountId, subsidiaries, setActiveAccountId } = useAuth()
  const [contacts, setContacts] = useState<ContactSummary[]>([])
  const [contactsLoading, setContactsLoading] = useState(false)
  const [contactsError, setContactsError] = useState<string | null>(null)
  const [name, setName] = useState('')
  const [phone, setPhone] = useState('')
  const [website, setWebsite] = useState('')
  const [registrationNumber, setRegistrationNumber] = useState('')
  const [vatNumber, setVatNumber] = useState('')
  const [industry, setIndustry] = useState('')
  const [saving, setSaving] = useState(false)
  const [message, setMessage] = useState<string | null>(null)
  const fileRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    if (!organization) return
    setName(organization.name)
    setPhone(organization.phone ?? '')
    setWebsite(organization.website ?? '')
    setRegistrationNumber(organization.registration_number ?? '')
    setVatNumber(organization.vat_number ?? '')
    setIndustry(organization.industry ?? '')
  }, [organization])

  useEffect(() => {
    if (!organization?.zoho_account_id) {
      setContacts([])
      return
    }

    setContactsLoading(true)
    setContactsError(null)
    void fetchContacts()
      .then(setContacts)
      .catch((err) =>
        setContactsError(err instanceof Error ? err.message : 'Failed to load contacts'),
      )
      .finally(() => setContactsLoading(false))
  }, [organization?.zoho_account_id])

  async function handleSave(e: React.FormEvent) {
    e.preventDefault()
    if (!name.trim()) return

    setSaving(true)
    setMessage(null)
    try {
      await saveOrganization({
        name: name.trim(),
        phone: phone.trim() || null,
        website: website.trim() || null,
        registration_number: registrationNumber.trim() || null,
        vat_number: vatNumber.trim() || null,
        industry: industry.trim() || null,
      })
      setMessage('Organization saved.')
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Failed to save organization')
    } finally {
      setSaving(false)
    }
  }

  async function handleLogoChange(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return

    setSaving(true)
    setMessage(null)
    try {
      if (name.trim()) {
        await saveOrganization({
          name: name.trim(),
          phone: phone.trim() || null,
          website: website.trim() || null,
          registration_number: registrationNumber.trim() || null,
          vat_number: vatNumber.trim() || null,
          industry: industry.trim() || null,
        })
      }
      await uploadLogo(file)
      setMessage('Logo uploaded.')
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Failed to upload logo')
    } finally {
      setSaving(false)
      if (fileRef.current) fileRef.current.value = ''
    }
  }

  return (
    <div className="mx-auto max-w-3xl space-y-8">
      <div>
        <h1 className="text-2xl font-semibold">Organization settings</h1>
        <p className="text-sm text-muted">
          Manage your company profile and branches.
        </p>
        {organization?.zoho_account_id && (
          <p className="mt-2 text-xs text-muted">
            Company details, contacts, policies, and quotations are synced for your linked account.
          </p>
        )}
      </div>

      {loading && <p className="text-sm text-muted">Loading organization...</p>}
      {error && <p className="text-sm text-red-600">{error}</p>}

      <form onSubmit={handleSave} className="space-y-6 rounded-lg border border-border bg-surface p-6 shadow-sm">
        <div>
          <h2 className="text-lg font-semibold">Company profile</h2>
          <p className="text-sm text-muted">
            Your logo appears in the sidebar next to Aegis by TIH.
          </p>
        </div>

        <div className="flex items-center gap-4">
          <OrganizationMark size="lg" />
          <div>
            <p className="text-sm font-medium">Organization logo</p>
            <p className="text-xs text-muted">PNG, JPG, WebP or SVG. Max 2 MB.</p>
            <button
              type="button"
              onClick={() => fileRef.current?.click()}
              disabled={saving}
              className="mt-2 inline-flex items-center gap-2 rounded-lg border border-border px-3 py-1.5 text-sm hover:bg-accent-light/50 disabled:opacity-50"
            >
              {saving ? <Loader2 size={14} className="animate-spin" /> : <ImagePlus size={14} />}
              Upload logo
            </button>
            <input
              ref={fileRef}
              type="file"
              accept="image/png,image/jpeg,image/webp,image/gif,image/svg+xml"
              className="hidden"
              onChange={handleLogoChange}
            />
          </div>
        </div>

        <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
          <div className="md:col-span-2">
            <label htmlFor="org-name" className="mb-1 block text-sm font-medium">
              Organization name
            </label>
            <input
              id="org-name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="Acme Logistics (Pty) Ltd"
              className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/25"
              required
            />
          </div>

          <div>
            <label htmlFor="org-phone" className="mb-1 block text-sm font-medium">
              Phone
            </label>
            <input
              id="org-phone"
              type="text"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/25"
            />
          </div>

          <div>
            <label htmlFor="org-website" className="mb-1 block text-sm font-medium">
              Website
            </label>
            <input
              id="org-website"
              type="url"
              value={website}
              onChange={(e) => setWebsite(e.target.value)}
              placeholder="https://"
              className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/25"
            />
          </div>

          <div>
            <label htmlFor="org-reg" className="mb-1 block text-sm font-medium">
              Company registration number
            </label>
            <input
              id="org-reg"
              type="text"
              value={registrationNumber}
              onChange={(e) => setRegistrationNumber(e.target.value)}
              className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/25"
            />
          </div>

          <div>
            <label htmlFor="org-vat" className="mb-1 block text-sm font-medium">
              VAT number
            </label>
            <input
              id="org-vat"
              type="text"
              value={vatNumber}
              onChange={(e) => setVatNumber(e.target.value)}
              className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/25"
            />
          </div>

          <div className="md:col-span-2">
            <label htmlFor="org-industry" className="mb-1 block text-sm font-medium">
              Industry
            </label>
            <input
              id="org-industry"
              type="text"
              value={industry}
              onChange={(e) => setIndustry(e.target.value)}
              className="w-full rounded-md border border-border px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-accent/25"
            />
          </div>
        </div>

        <div className="flex items-center gap-3">
          <button
            type="submit"
            disabled={saving || !name.trim()}
            className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white hover:bg-burgundy-dark disabled:opacity-50"
          >
            {saving && <Loader2 size={14} className="animate-spin" />}
            Save organization
          </button>
          {message && <p className="text-sm text-muted">{message}</p>}
        </div>
      </form>

      {homeAccountId === accountId && subsidiaries.length > 0 && (
        <section className="rounded-lg border border-border bg-surface p-6 shadow-sm">
          <h2 className="text-lg font-semibold">Subsidiary companies</h2>
          <p className="mt-1 text-sm text-muted">
            Child companies under this parent. Each keeps its own policies, quotations, claims, and
            renewals.
          </p>
          <ul className="mt-4 divide-y divide-border rounded-lg border border-border">
            {subsidiaries.map((sub) => (
              <li key={sub.id} className="flex items-center justify-between gap-3 px-4 py-3">
                <div className="flex items-center gap-3">
                  <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-accent-light text-primary">
                    <Building2 size={16} />
                  </div>
                  <div>
                    <p className="font-medium">{sub.name}</p>
                    <p className="text-xs text-muted">{sub.industry ?? 'Subsidiary'}</p>
                  </div>
                </div>
                <button
                  type="button"
                  onClick={() => setActiveAccountId(sub.id)}
                  className="rounded-lg border border-border px-3 py-1.5 text-sm font-medium hover:bg-page"
                >
                  Switch to company
                </button>
              </li>
            ))}
          </ul>
        </section>
      )}

      {organization?.zoho_account_id && (
        <section className="rounded-lg border border-border bg-surface p-6 shadow-sm">
          <h2 className="text-lg font-semibold">Contacts</h2>
          <p className="mt-1 text-sm text-muted">Contacts linked to your account.</p>

          {contactsLoading && (
            <p className="mt-4 flex items-center gap-2 text-sm text-muted">
              <Loader2 size={14} className="animate-spin" /> Loading contacts…
            </p>
          )}
          {contactsError && <p className="mt-4 text-sm text-red-600">{contactsError}</p>}

          {!contactsLoading && !contactsError && contacts.length === 0 && (
            <p className="mt-4 text-sm text-muted">No contacts found for this account.</p>
          )}

          {contacts.length > 0 && (
            <div className="mt-4 overflow-hidden rounded-lg border border-border">
              <table className="min-w-full text-sm">
                <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
                  <tr>
                    <th className="px-4 py-2">Name</th>
                    <th className="px-4 py-2">Email</th>
                    <th className="px-4 py-2">Phone</th>
                    <th className="px-4 py-2">Title</th>
                  </tr>
                </thead>
                <tbody>
                  {contacts.map((contact) => (
                    <tr key={contact.id} className="border-b border-border last:border-0">
                      <td className="px-4 py-3 font-medium">{contact.name}</td>
                      <td className="px-4 py-3 text-muted">{contact.email ?? '—'}</td>
                      <td className="px-4 py-3 text-muted">{contact.phone ?? '—'}</td>
                      <td className="px-4 py-3 text-muted">{contact.title ?? '—'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </section>
      )}

      <BranchManager />
    </div>
  )
}
