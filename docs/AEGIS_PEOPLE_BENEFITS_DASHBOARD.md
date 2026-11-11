# AEGIS People & Benefits Dashboard

Date: 2026-11-11  
Scope: Analytics-first People overview; employee directory as secondary route

## Updated routes

| Path | Page | Notes |
|------|------|-------|
| `/people` | `PeopleBenefitsOverviewPage` | KPI + charts overview |
| `/people/employees` | `EmployeesPage` | Existing directory (search, import, reviews) |
| `/people/new` | `EmployeeDetailPage` | Create employee (static before `:id`) |
| `/people/:id` | `EmployeeDetailPage` | Existing profile |
| `/collections/employees*` | Legacy aliases | Unchanged |

Navigation: People → Overview / Employees children. Breadcrumbs updated.

## Reused components

- `EmployeesPage` (moved route only; functionality preserved)
- `EmployeeDetailPage`, workforce services, benefit memberships
- `PageHeader`, `EmptyState`, `ws-panel`, burgundy tokens
- `formatCurrency` (en-ZA / ZAR)
- Supabase RLS via `account_id` filters + existing membership

## New components / modules

| File | Role |
|------|------|
| `src/pages/PeopleBenefitsOverviewPage.tsx` | Dashboard UI |
| `src/services/people-benefits-analytics.service.ts` | Aggregated metrics + typed contracts |
| `src/domain/__tests__/people-benefits-analytics.test.ts` | Empty/not-connected contract tests |

Charting: **recharts** (line / bar / donut).

## Analytics data sources

| Metric | Source | Availability |
|--------|--------|--------------|
| Total / active / inactive employees | `portal_employees` count queries | Available |
| Pending invites / open exceptions | employees + `portal_workforce_exceptions` | Available |
| Pension / medical participation % | `portal_employee_benefit_memberships` vs active headcount | Available when memberships exist; else awaiting |
| Scheme / provider distribution | membership `provider_name` | Available when present |
| Aggregate retirement fund value | — | **not_connected** |
| Contributions, investment performance, disbursements | — | **not_connected** |
| Medical contribution totals / enrolment trend series | — | **not_connected** |
| Joiners / departures / reconstructed headcount | `employment_start_date`, `employment_end_date`, `deactivated_at` | Derived; quality flagged when dates missing |

**Never displays invented balances, returns or contributions as live data.**

## Chart data contracts

- `MetricValue`: `{ availability, value, unit?, note? }` — missing ≠ zero.
- `BenefitParticipation`: enrolled / hrDeclared / providerConfirmed / providers[].
- `WorkforceTrendPoint`: `{ period, joiners, departures, headcount }` — headcount null when unrecomputable.
- Retirement/medical financial series typed as `null` until provider feeds exist.

## Permissions

- Requires `employees` capability (same gate as previous People page) via `RequireCapability`.
- Dashboard also checks `employees` \| `workforce_hr` \| `workforce_broker` for analytics view.
- Employees without those caps do not reach `/people` routes.
- Queries are always scoped by `account_id` (RLS + explicit filters).
- No individual medical claims or diagnoses on the dashboard.

## Available vs unavailable metrics

**Available now:** headcount KPIs, invite/exception counts, benefit membership participation and provider distribution, dated joiner/departure activity.

**Unavailable (honest empty / not connected):** fund AUM, contribution series, investment performance, benefit payments, medical contribution totals, provider sync timestamps for schemes/funds.

## Remaining provider integration requirements

1. Retirement fund administrator API or statement import → fund value, contributions, gains/losses, disbursements, reporting period.
2. Medical scheme feeds → contributions (employer/employee), plan codes, enrolment trend (still no claims/diagnoses in employer analytics).
3. Optional payroll reconciliation for headcount validation.
4. Persist last-successful-sync metadata per provider.

## Test results

```
npm test -- --run src/domain/__tests__/people-benefits-analytics.test.ts src/domain/__tests__/workforce.test.ts src/domain/__tests__/lifecycle.test.ts src/domain/__tests__/widget-auth.test.ts
npm run build
```

**Actual results:** 41 tests passed; `tsc -b && vite build` passed.
