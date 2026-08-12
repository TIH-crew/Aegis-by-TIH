import { RENTAL_COMPANIES } from '../../config/motor-rental'

export type MotorRentalValue = {
  is_rental: boolean
  rental_company: string
  rental_company_other: string
  rental_start_date: string
  rental_end_date: string
}

type Props = {
  value: MotorRentalValue
  onChange: (next: MotorRentalValue) => void
}

export function MotorRentalPanel({ value, onChange }: Props) {
  const companySelect =
    value.rental_company &&
    !(RENTAL_COMPANIES as readonly string[]).includes(value.rental_company) &&
    value.rental_company !== 'Other'
      ? 'Other'
      : value.rental_company || ''

  return (
    <div className="space-y-3 rounded-lg border border-border bg-gray-50/80 p-4">
      <h3 className="text-sm font-semibold text-gray-900">Rental vehicle</h3>
      <p className="text-xs text-muted">
        Indicate whether this vehicle is hired. If rental, the broker needs the lessor and hire period.
      </p>

      <label className="block text-sm">
        <span className="mb-1 block font-medium">Is this a rental vehicle? *</span>
        <select
          className="field-input"
          value={value.is_rental ? 'yes' : 'no'}
          onChange={(e) => {
            const is_rental = e.target.value === 'yes'
            onChange({
              ...value,
              is_rental,
              ...(is_rental
                ? {}
                : {
                    rental_company: '',
                    rental_company_other: '',
                    rental_start_date: '',
                    rental_end_date: '',
                  }),
            })
          }}
        >
          <option value="no">No — owned / fleet vehicle</option>
          <option value="yes">Yes — rental / hire vehicle</option>
        </select>
      </label>

      {value.is_rental && (
        <div className="grid grid-cols-1 gap-3 md:grid-cols-2">
          <label className="block text-sm md:col-span-2">
            <span className="mb-1 block font-medium">Renting from *</span>
            <select
              className="field-input"
              value={companySelect}
              onChange={(e) => {
                const next = e.target.value
                onChange({
                  ...value,
                  rental_company: next === 'Other' ? value.rental_company_other || 'Other' : next,
                  rental_company_other: next === 'Other' ? value.rental_company_other : '',
                })
              }}
            >
              <option value="">Select rental company</option>
              {RENTAL_COMPANIES.map((name) => (
                <option key={name} value={name}>
                  {name}
                </option>
              ))}
            </select>
          </label>

          {(companySelect === 'Other' ||
            (value.rental_company &&
              !(RENTAL_COMPANIES as readonly string[]).includes(value.rental_company))) && (
            <label className="block text-sm md:col-span-2">
              <span className="mb-1 block font-medium">Company name *</span>
              <input
                className="field-input"
                value={
                  companySelect === 'Other' &&
                  !(RENTAL_COMPANIES as readonly string[]).includes(value.rental_company)
                    ? value.rental_company_other || value.rental_company
                    : value.rental_company_other
                }
                onChange={(e) =>
                  onChange({
                    ...value,
                    rental_company_other: e.target.value,
                    rental_company: e.target.value.trim() || 'Other',
                  })
                }
                placeholder="Name of rental company"
              />
            </label>
          )}

          <label className="block text-sm">
            <span className="mb-1 block font-medium">Rental start date *</span>
            <input
              className="field-input"
              type="date"
              value={value.rental_start_date}
              onChange={(e) => onChange({ ...value, rental_start_date: e.target.value })}
            />
          </label>
          <label className="block text-sm">
            <span className="mb-1 block font-medium">Rental end date *</span>
            <input
              className="field-input"
              type="date"
              value={value.rental_end_date}
              min={value.rental_start_date || undefined}
              onChange={(e) => onChange({ ...value, rental_end_date: e.target.value })}
            />
          </label>
        </div>
      )}
    </div>
  )
}

export function resolveRentalCompany(value: MotorRentalValue): string | null {
  if (!value.is_rental) return null
  if (value.rental_company === 'Other' || value.rental_company_other.trim()) {
    return value.rental_company_other.trim() || value.rental_company.trim() || null
  }
  return value.rental_company.trim() || null
}

export function validateMotorRental(value: MotorRentalValue): string | null {
  if (!value.is_rental) return null
  const company = resolveRentalCompany(value)
  if (!company || company === 'Other') return 'Select or enter where the vehicle is rented from.'
  if (!value.rental_start_date || !value.rental_end_date) {
    return 'Enter the rental start and end dates.'
  }
  if (value.rental_end_date < value.rental_start_date) {
    return 'Rental end date must be on or after the start date.'
  }
  return null
}
