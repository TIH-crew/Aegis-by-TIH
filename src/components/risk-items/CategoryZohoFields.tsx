import { getEditableZohoFields, getCategoryZohoMapping, ZOHO_LAYOUTS } from '../../config/zoho-risk-field-mappings'
import type { ZohoFieldMapping } from '../../config/zoho-risk-field-mappings'

interface CategoryZohoFieldsProps {
  category: string
  values: Record<string, unknown>
  onChange: (next: Record<string, unknown>) => void
  disabled?: boolean
}

export function CategoryZohoFields({
  category,
  values,
  onChange,
  disabled,
}: CategoryZohoFieldsProps) {
  const mapping = getCategoryZohoMapping(category)
  const fields = getEditableZohoFields(category)

  if (!mapping || fields.length === 0) return null

  function updateField(key: string, value: unknown) {
    onChange({ ...values, [key]: value })
  }

  return (
    <div className="space-y-4 rounded-lg border border-border bg-page p-4">
      <div>
        <h3 className="text-sm font-semibold text-gray-900">Zoho CRM fields</h3>
        <p className="text-xs text-muted">
          Mapped to <span className="font-medium">Client_Risks</span> — {mapping.zohoRiskType} (
          {mapping.zohoRiskCategory}) · {ZOHO_LAYOUTS.clientRisksCommercialAssets.displayName} layout
        </p>
        {mapping.notes && <p className="mt-1 text-xs text-amber-800">{mapping.notes}</p>}
      </div>

      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        {fields.map((field) => (
          <ZohoFieldInput
            key={field.apiName}
            field={field}
            value={values[field.attributeKey ?? field.apiName]}
            onChange={(v) => updateField(field.attributeKey ?? field.apiName, v)}
            disabled={disabled}
          />
        ))}
      </div>
    </div>
  )
}

function ZohoFieldInput({
  field,
  value,
  onChange,
  disabled,
}: {
  field: ZohoFieldMapping
  value: unknown
  onChange: (value: unknown) => void
  disabled?: boolean
}) {
  const label = (
    <>
      {field.label}
      {field.required && <span className="text-red-600"> *</span>}
    </>
  )

  if (field.dataType === 'picklist' && field.picklistValues?.length) {
    return (
      <label className="block text-sm">
        <span className="mb-1 block font-medium">{label}</span>
        <select
          className="field-input"
          value={String(value ?? '')}
          onChange={(e) => onChange(e.target.value || null)}
          disabled={disabled}
        >
          <option value="">Select…</option>
          {field.picklistValues.map((opt) => (
            <option key={opt} value={opt}>
              {opt}
            </option>
          ))}
        </select>
        {field.helpText && <span className="mt-1 block text-xs text-muted">{field.helpText}</span>}
      </label>
    )
  }

  if (field.dataType === 'boolean') {
    return (
      <label className="flex items-center gap-2 text-sm">
        <input
          type="checkbox"
          checked={value === true || value === 'true'}
          onChange={(e) => onChange(e.target.checked)}
          disabled={disabled}
          className="rounded border-gray-300"
        />
        <span className="font-medium">{label}</span>
      </label>
    )
  }

  const inputType =
    field.dataType === 'currency' || field.dataType === 'number' ? 'number' : 'text'

  return (
    <label className="block text-sm">
      <span className="mb-1 block font-medium">{label}</span>
      <input
        type={inputType}
        className="field-input"
        value={value == null ? '' : String(value)}
        onChange={(e) => {
          if (inputType === 'number') {
            onChange(e.target.value === '' ? null : Number(e.target.value))
          } else {
            onChange(e.target.value)
          }
        }}
        disabled={disabled}
      />
      {field.helpText && <span className="mt-1 block text-xs text-muted">{field.helpText}</span>}
    </label>
  )
}
