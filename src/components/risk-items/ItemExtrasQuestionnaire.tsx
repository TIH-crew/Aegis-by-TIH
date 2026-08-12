import { useMemo, type ReactNode } from 'react'
import {
  coverTypesForCategory,
  groupExtrasByBryteGroup,
  sectionNoteForCategory,
  type CoverTypeKey,
  type ExtraDefinition,
} from '../../config/cover-extras'
import { questionnaireExtras } from '../../config/section-extensions'
import type { SelectedExtension } from '../../types/employee'

export interface ExtrasQuestionnaireAnswers {
  cover_type_key: CoverTypeKey | ''
  vehicle_use: '' | 'Private' | 'Business' | 'Both'
  is_financed: boolean | null
  finance_house: string
  has_tracker: boolean | null
  selected_codes: string[]
}

export const emptyExtrasAnswers = (): ExtrasQuestionnaireAnswers => ({
  cover_type_key: '',
  vehicle_use: '',
  is_financed: null,
  finance_house: '',
  has_tracker: null,
  selected_codes: [],
})

const FINANCE_HOUSES = ['WesBank', 'MFC', 'ABSA', 'FNB', 'Standard Bank', 'Nedbank', 'Other']

type Props = {
  category: string
  value: ExtrasQuestionnaireAnswers
  onChange: (next: ExtrasQuestionnaireAnswers) => void
}

function Chip({
  selected,
  children,
  onClick,
}: {
  selected: boolean
  children: ReactNode
  onClick: () => void
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`rounded-lg border px-3 py-2 text-sm ${
        selected
          ? 'border-accent bg-accent-light font-medium text-primary'
          : 'border-border bg-surface text-gray-800 hover:bg-page'
      }`}
    >
      {children}
    </button>
  )
}

function Question({
  label,
  hint,
  children,
}: {
  label: string
  hint?: string
  children: ReactNode
}) {
  return (
    <div className="space-y-2">
      <div>
        <p className="text-sm font-medium text-gray-900">{label}</p>
        {hint ? <p className="text-xs text-muted">{hint}</p> : null}
      </div>
      <div className="flex flex-wrap gap-2">{children}</div>
    </div>
  )
}

export function ItemExtrasQuestionnaire({ category, value, onChange }: Props) {
  const coverTypes = useMemo(() => coverTypesForCategory(category), [category])
  const isMotor = category === 'Motor'
  const needsCoverPick = coverTypes.length > 1
  const effectiveCoverKey =
    value.cover_type_key ||
    (!needsCoverPick && coverTypes[0] ? coverTypes[0].key : '')
  const fireNote = sectionNoteForCategory(category)

  const eligible: ExtraDefinition[] = useMemo(
    () =>
      questionnaireExtras(category, effectiveCoverKey || null, {
        is_financed: value.is_financed,
        has_tracker: value.has_tracker,
      }),
    [category, effectiveCoverKey, value.is_financed, value.has_tracker],
  )

  const grouped = useMemo(() => groupExtrasByBryteGroup(eligible), [eligible])

  const selectedCover = coverTypes.find((c) => c.key === effectiveCoverKey)

  function setCover(key: CoverTypeKey) {
    onChange({
      ...value,
      cover_type_key: key,
      selected_codes: value.selected_codes.filter((code) =>
        questionnaireExtras(category, key, {
          is_financed: value.is_financed,
          has_tracker: value.has_tracker,
        }).some((e) => e.code === code),
      ),
    })
  }

  function toggleExtra(code: string) {
    const next = value.selected_codes.includes(code)
      ? value.selected_codes.filter((c) => c !== code)
      : [...value.selected_codes, code]
    onChange({ ...value, selected_codes: next })
  }

  if (coverTypes.length === 0) {
    return (
      <div className="rounded-lg border border-dashed border-border bg-page px-4 py-6 text-sm text-muted">
        No optional extras catalogued for this category yet.
      </div>
    )
  }

  return (
    <div className="space-y-5 rounded-lg border border-border bg-surface p-4 shadow-sm">
      <div>
        <h3 className="text-sm font-semibold text-gray-900">Cover &amp; extras questionnaire</h3>
        <p className="text-xs text-muted">
          {isMotor
            ? 'Bryte motor extensions and add-ons eligible for this cover type.'
            : `Only extras this ${category.toLowerCase()} item is eligible for are shown.`}
          {fireNote ? ` ${fireNote}.` : ''}
        </p>
      </div>

      {needsCoverPick ? (
        <Question label="Cover type *" hint="Determines which optional extras apply.">
          {coverTypes.map((cover) => (
            <Chip
              key={cover.key}
              selected={value.cover_type_key === cover.key}
              onClick={() => setCover(cover.key)}
            >
              {cover.label}
            </Chip>
          ))}
        </Question>
      ) : (
        <p className="text-sm text-muted">
          Cover: <span className="font-medium text-gray-900">{coverTypes[0]?.label}</span>
        </p>
      )}

      {selectedCover && (
        <div>
          <p className="mb-2 text-xs font-semibold uppercase tracking-wide text-muted">
            Mandatory covers
          </p>
          <ul className="flex flex-wrap gap-2">
            {selectedCover.mandatoryCovers.map((name) => (
              <li
                key={name}
                className="rounded-full border border-border bg-page px-2.5 py-1 text-xs text-gray-700"
              >
                {name}
              </li>
            ))}
          </ul>
        </div>
      )}

      {isMotor && (
        <>
          <Question label="Vehicle use">
            {(['Private', 'Business', 'Both'] as const).map((opt) => (
              <Chip
                key={opt}
                selected={value.vehicle_use === opt}
                onClick={() => onChange({ ...value, vehicle_use: opt })}
              >
                {opt}
              </Chip>
            ))}
          </Question>

          <Question
            label="Is the vehicle financed?"
            hint="Credit shortfall is only offered when the vehicle is financed."
          >
            <Chip
              selected={value.is_financed === false}
              onClick={() =>
                onChange({
                  ...value,
                  is_financed: false,
                  finance_house: '',
                  selected_codes: value.selected_codes.filter((c) => c !== 'credit_shortfall'),
                })
              }
            >
              Paid off
            </Chip>
            <Chip
              selected={value.is_financed === true}
              onClick={() => onChange({ ...value, is_financed: true })}
            >
              Financed
            </Chip>
          </Question>

          {value.is_financed === true && (
            <Question label="Finance house">
              {FINANCE_HOUSES.map((house) => (
                <Chip
                  key={house}
                  selected={value.finance_house === house}
                  onClick={() => onChange({ ...value, finance_house: house })}
                >
                  {house}
                </Chip>
              ))}
            </Question>
          )}

          <Question label="Tracking device fitted?">
            <Chip
              selected={value.has_tracker === true}
              onClick={() => onChange({ ...value, has_tracker: true })}
            >
              Yes
            </Chip>
            <Chip
              selected={value.has_tracker === false}
              onClick={() => onChange({ ...value, has_tracker: false })}
            >
              No
            </Chip>
          </Question>
        </>
      )}

      {category === 'Plant & Machinery' && (
        <Question
          label="Is this plant financed?"
          hint="Credit shortfall only applies when financed."
        >
          <Chip
            selected={value.is_financed === false}
            onClick={() =>
              onChange({
                ...value,
                is_financed: false,
                selected_codes: value.selected_codes.filter((c) => c !== 'credit_shortfall'),
              })
            }
          >
            No
          </Chip>
          <Chip
            selected={value.is_financed === true}
            onClick={() => onChange({ ...value, is_financed: true })}
          >
            Yes
          </Chip>
        </Question>
      )}

      {effectiveCoverKey ? (
        <div className="space-y-4">
          <div>
            <p className="text-sm font-medium text-gray-900">Optional extras</p>
            <p className="text-xs text-muted">
              Select the extras you want for this item
              {eligible.length === 0 ? ' — none eligible with the current answers.' : '.'}
            </p>
          </div>
          {grouped.map((group) => (
            <div key={group.key} className="space-y-2">
              <p className="text-xs font-semibold uppercase tracking-wide text-muted">
                {group.label}
              </p>
              <ul className="divide-y divide-border rounded-lg border border-border">
                {group.extras.map((extra) => {
                  const on = value.selected_codes.includes(extra.code)
                  return (
                    <li key={extra.code} className="flex items-start gap-3 px-3 py-3">
                      <input
                        type="checkbox"
                        className="mt-1"
                        checked={on}
                        onChange={() => toggleExtra(extra.code)}
                      />
                      <div>
                        <p className="text-sm font-medium text-gray-900">{extra.name}</p>
                        <p className="text-xs text-muted">{extra.description}</p>
                      </div>
                    </li>
                  )
                })}
              </ul>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-sm text-muted">Choose a cover type to see eligible extras.</p>
      )}
    </div>
  )
}

export function answersToSelectedExtensions(
  answers: ExtrasQuestionnaireAnswers,
  category: string,
): SelectedExtension[] {
  const eligible = questionnaireExtras(category, answers.cover_type_key || null, {
    is_financed: answers.is_financed,
    has_tracker: answers.has_tracker,
  })
  const byCode = new Map(eligible.map((e) => [e.code, e]))
  return answers.selected_codes
    .map((code) => byCode.get(code))
    .filter((e): e is ExtraDefinition => Boolean(e))
    .map((e) => ({
      code: e.code,
      name: e.name,
      included: true,
      sum_insured: null,
      premium_excl: null,
      notes: null,
    }))
}

export function validateExtrasQuestionnaire(
  category: string,
  answers: ExtrasQuestionnaireAnswers,
): string | null {
  const covers = coverTypesForCategory(category)
  if (covers.length > 1 && !answers.cover_type_key) {
    return 'Select a cover type for this item.'
  }
  if (category === 'Motor') {
    if (answers.is_financed === true && !answers.finance_house.trim()) {
      return 'Select the finance house for this financed vehicle.'
    }
  }
  return null
}
