# AEGIS Workforce Audit

Date: 2026-11-11  
Scope: Existing employee management in AssetManagement System (ASSETS / AEGIS by TIH)

## 1. Current architecture

Employees today are **asset custodians**, not a full HR workforce registry.

| Layer | What exists |
|-------|-------------|
| UI | `EmployeesPage` (`/people`), `EmployeeDetailPage` (`/people/:id`, `/people/new`) |
| Service | `src/services/employee.service.ts` — list / get / create / update / photo / claim token |
| Types | `src/types/employee.ts` — `Employee`, `EmployeeInput`, custody types |
| Auth | `portal_users` + magic-link invites; app roles `admin` \| `employee` via `src/lib/rbac.ts` |
| Tenant | `portal_accounts` with `zoho_account_id`; RLS via `current_account_ids()` |
| CRM | `aegis-invite` provisions accounts from Zoho; `aegis-crm` lists Contacts for an Account |
| Claims | Separate employee claim QR/OTP flow (`claim_access_token`, `aegis-employee-claim`) |

There is **no** separate People/Person table. One row in `portal_employees` is both identity and employment under one `account_id`.

## 2. Existing database structure

### `portal_employees` (from `20260812_employees_extensions_assignments.sql` + later alters)

- `id`, `account_id` → `portal_accounts`
- `full_name`, `job_title`, `email`, `phone`, `whatsapp_number` (required)
- `employee_number`, `branch_id`, `image_url`
- `status` ∈ `active` \| `inactive`
- Drivers-licence fields; `claim_access_token`
- RLS: account-scoped for authenticated members

### Related

- `portal_risk_items.employee_id` — custody
- `portal_item_assignments` — assign / check-out / check-in
- `portal_accounts.zoho_account_id` — unique external Zoho Account reference
- `portal_invites` / `portal_users` — **portal login** invites (owner/admin/member), not employee activation
- `aam_portal_roles` / ledger roles — finance/tax/broker keys; **not wired** to employee HR

### Missing (for this brief)

- Person identity separable from employment membership
- Department, employment start/end dates
- Employee invitation / AEGIS activation status
- Bulk employee import batches
- Workforce exception / review queue
- Zoho Contact link table (idempotent promotion)
- Benefit membership skeleton with separate enrolment vs provider confirmation
- HR administrator role distinct from broker/platform admin

## 3. Existing employee workflows

1. **Create** — HR/admin fills form (name + WhatsApp required) → `createEmployee` → row in `portal_employees`. No Zoho Contact. No invite email for AEGIS login as that employee.
2. **Edit** — `updateEmployee` patches permitted fields including `status`.
3. **Deactivate** — set `status = 'inactive'` (hard delete not used in UI).
4. **Custody** — Movements assign risk items to `employee_id`.
5. **Claim access** — rotate `claim_access_token`, QR for employee claim portal (insurance claim, not HR invite).
6. **Bulk import** — **risk items** only (`RiskItemsBulkImport`). **No employee CSV/XLSX import.**
7. **CRM** — Account linked via Zoho invite widget. Contacts can be **listed** for an account; employees are **not** promoted to Contacts.

## 4. Reusable components and services

- Keep `portal_employees` as employment records (FKs from assets/assignments/audits).
- Reuse `EmployeesPage` / `EmployeeDetailPage` shell and workspace UI.
- Reuse `portal_accounts.zoho_account_id` mapping (already correct: UUID PK, Zoho ID external).
- Reuse `aegis-crm` JWT auth + Contacts list; extend for search/create Contact.
- Reuse invite patterns from `portal_invites` / `aegis-invite` for **employee activation**, as a new table (do not overload CRM portal invites).
- Reuse RLS `current_account_ids()` for tenant isolation.
- Reuse import UX patterns from risk-item / ledger import (preview → confirm → results).

## 5. Missing functionality (gap list)

| Requirement | Gap |
|-------------|-----|
| HR self-service | Only admin capability `employees`; no `hr_admin` |
| Bulk import | Missing |
| Employee AEGIS invite | Missing (claim QR ≠ account activation) |
| Soft leave with history | Partial (`inactive` only; no end date / history events) |
| Duplicate detection | Missing |
| Broker exception queue | Missing |
| Zoho Contact promotion | Missing |
| Workforce API for Zoho widget | Missing dedicated endpoints |
| Benefit enrolment statuses | Missing |
| Audit log for HR actions | No dedicated workforce audit trail |

## 6. Data migration requirements

**Non-destructive extend** — do **not** split into person + employment tables in Phase B (would break FKs and require dual-write). Instead:

1. Add columns on `portal_employees` for HR fields + CRM link + invitation status.
2. Add satellite tables: invites, import batches/rows, exceptions, CRM links, benefit memberships, audit events.
3. Backfill `first_name` / `last_name` from `full_name` where possible.
4. Make `whatsapp_number` optional for HR registry/imports; claim OTP must validate a usable number and must not invent placeholders.

**Destructive risk avoided:** No drop of `portal_employees`; no change of PK; Zoho Account ID remains non-PK.

## 7. Security concerns

- RLS is account-scoped but **any** authenticated member of the account can mutate employees (no HR-only policy).
- App RBAC is binary admin/employee; brokers and HR are not separated.
- ID numbers and licence data stored on employee row — minimise display to HR vs broker.
- Claim tokens are UUID-based; employee activation invites need hashed tokens + expiry.
- No export controls on employee directory.

## 8. Proposed implementation changes

1. Migration `20261111_workforce_extensions.sql` — columns + new tables + RLS.
2. Extend `employee.service.ts` + new `workforce.service.ts` (import, invite, exceptions, CRM promote).
3. Extend RBAC: capability `workforce_hr`, `workforce_broker`; map portal roles.
4. Refurbish People UI: overview metrics, import, invite status, deactivate, exception badge.
5. Edge routes under `aegis-crm` or new `aegis-workforce`: list/search employees, promote Contact.
6. Vitest for domain rules (duplicates, deactivate, import idempotency, no auto-Contact).
7. Docs: this audit + `AEGIS_WORKFORCE_IMPLEMENTATION.md`.

## 9. Unresolved / stop conditions

- **WhatsApp** — Phase B approval: optional for registry; required only for claim OTP (validated, never invented).
- **Zoho Contact field API names** for AEGIS person reference must come from live CRM config — promotion will store Contact ID + search by email/phone; custom AEGIS fields only when confirmed (do not invent).
- Production migrations require explicit approval before apply beyond development project.
