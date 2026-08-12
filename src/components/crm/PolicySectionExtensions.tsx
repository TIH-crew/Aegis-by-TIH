import { groupPolicyExtensionsBySection } from '../../lib/extensions'
import type { PolicySectionExtension } from '../../types/employee'
import { ExtensionsTable } from './ExtensionsTable'

interface PolicySectionExtensionsProps {
  sections: string[]
  stored: PolicySectionExtension[]
}

export function PolicySectionExtensions({ sections, stored }: PolicySectionExtensionsProps) {
  const groups = groupPolicyExtensionsBySection(sections, stored)
  if (groups.length === 0) return null

  return (
    <div className="space-y-4">
      <div>
        <h2 className="text-lg font-semibold">Section extensions</h2>
        <p className="text-sm text-muted">
          Product covers that apply to every item in a schedule section — for example Bryte Assist
          and car hire on Motor, SASRIA on Fire (Building) and Contents.
        </p>
      </div>
      {groups.map((group) => (
        <ExtensionsTable
          key={group.section}
          title={group.section}
          hint="Policy-level wording. Item-level options such as credit shortfall sit on each risk item."
          extensions={group.extensions}
        />
      ))}
    </div>
  )
}
