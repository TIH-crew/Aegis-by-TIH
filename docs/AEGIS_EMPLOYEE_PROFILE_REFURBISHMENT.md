# AEGIS Employee Profile Refurbishment

Date: 2026-11-11  
Scope: Frontend UI/UX only — no data-model replacement

## Existing components reused

- `EmployeesPage` route `/people` (directory)
- `EmployeeDetailPage` route `/people/:id` and `/people/new`
- `employee.service` CRUD, photo upload, claim token rotation
- `workforce.service` invite/resend/revoke, deactivate, benefits, audit list
- `crm.service` Contact search/promote (broker)
- `StatusBadge`, `EmptyState`, `ws-panel` / `field-input` / burgundy tokens
- `BrandLogo` / `SidebarBrand` / `BRAND` config
- Asset custody via `SearchContext.riskItems` + assign-to link
- Claim QR via `employeeClaimUrl` + existing OTP WhatsApp rules

## Components / files changed

| File | Change |
|------|--------|
| `src/pages/EmployeeDetailPage.tsx` | Tabbed profile: Overview, Employment, Benefits, Assets & Claims, Activity |
| `src/config/brand.ts` | Platform name **AEGIS** / tagline **by The Insurance Advisors Hub** |
| `src/components/brand/BrandLogo.tsx` | Two-line brand mark |
| `src/components/brand/SidebarBrand.tsx` | Tagline rendering |
| `src/config/navigation.ts` | People moved after Movements (no empty Benefits nav) |
| `src/services/workforce.service.ts` | `listEmployeeAuditEvents` |
| `src/pages/EmployeesPage.tsx` | Directory copy consistency |
| `src/pages/OrganizationSettingsPage.tsx` | Brand copy |

## New components created

None as separate packages — profile sections use local helpers (`InfoCard`, `Dl`, `Field`) inside `EmployeeDetailPage`.

## Updated profile layout

1. **Header** — photo/initials, name, title · department · organisation, employment + invite badges, Edit/Save, unsaved indicator  
2. **Overview** — employment summary, AEGIS access + invite actions, benefits snapshot, CRM (broker-only), quick actions  
3. **Employment** — personal/contact, employment fields, soft End employment with confirm  
4. **Benefits** — grouped memberships; HR enrolment ≠ provider confirmed; empty state when none  
5. **Assets & Claims** — claim QR (print/rotate/WhatsApp gate) + assigned assets table  
6. **Activity** — `portal_workforce_audit_events` for this employee  

New employee flow stays on the Employment form (create), then navigates to the full profile.

## Role-aware visibility

| Role capability | Visible |
|-----------------|---------|
| `workforce_hr` | Invite/resend/revoke, end employment, edit |
| `workforce_broker` | CRM status + promote/link; no invite as primary HR control |
| Neither | Read-oriented; save/edit only if `employees`/`workforce_hr` |

CRM promotion controls are not shown without `workforce_broker`.

## Existing functionality preserved

- Create / edit / save employee  
- Photo upload  
- Soft deactivate  
- Invite / resend / revoke  
- CRM promote (idempotent)  
- Claim QR display, print, rotate, WhatsApp requirement  
- Assigned assets + assign link  
- Licence fields  
- Directory search, filters, bulk import, metrics  

## Tests executed

```
npm test -- --run src/domain/__tests__/workforce.test.ts src/domain/__tests__/lifecycle.test.ts src/domain/__tests__/widget-auth.test.ts
npm run build
```

**Actual results:** 37 tests passed; `tsc -b && vite build` passed.

## Remaining limitations

- No standalone Employee Benefits navigation page (intentionally omitted — no empty destination).
- Benefit membership create/edit UI not added (no fabricating admin APIs).
- Activity depends on workforce audit events already written by services.
- Browser screenshots not captured unless preview tooling is available in-session.
- Unsaved-changes protection uses `window.confirm` when leaving Employment with dirty form.
