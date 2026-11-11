# AEGIS Workforce Implementation

Date: 2026-11-11 (updated Phase B)  
Project: AssetManagement System (ASSETS / AEGIS by TIH)  
Supabase project (dev): Atlantis (`egemzmclxcrbgzovcyku`)

## Completed functionality

| Area | Status |
|------|--------|
| Extend `portal_employees` (names, dept, dates, invite/CRM status) | Done |
| Satellite tables (invites, imports, exceptions, CRM links, benefits, audit) | Done |
| WhatsApp optional for HR; claim OTP requires usable number | Done |
| HR / broker / admin / employee RBAC capabilities | Done |
| People UI overview, search, filters, import, invite, deactivate, CRM promote | Done |
| CSV + XLSX bulk import with preview, errors CSV, idempotent re-import | Done |
| Activation invites (hash, expiry, resend, revoke, accept-by-hash) | Done (email send deferred) |
| Review-by-exception queue | Done |
| Broker CRM Contact search + idempotent promote | Done (standard Zoho fields) |
| Widget API foundation on `aegis-crm` `/workforce/*` | Done |
| Benefit membership skeleton (no balances/claims) | Done |
| Permissions migration (role + RLS split) | Applied on Atlantis **dev** for Phase C; production still needs approval |
| Widget session auth + activation page | Phase C — see `AEGIS_WORKFORCE_WIDGET_READINESS.md` |

## Reused components

- `portal_employees` UUIDs and custody FKs (`portal_risk_items`, `portal_item_assignments`)
- Claim QR/OTP (`claim_access_token`, `aegis-employee-claim`) — separate from activation
- `portal_accounts.zoho_account_id`
- `EmployeesPage` / `EmployeeDetailPage` routes `/people`
- `aegis-crm` JWT membership context (Zoho Account resolved from portal, never trusted from browser)
- Existing design tokens / workspace UI

## Database migrations

| File | Purpose | Applied? |
|------|---------|----------|
| `supabase/migrations/20261111_workforce_extensions.sql` | Columns + satellite tables + account RLS | Applied on Atlantis (dev) earlier |
| `supabase/migrations/20261112_workforce_permissions.sql` | `hr_admin`/`broker` roles; `can_manage_workforce` / `can_broker_workforce`; split SELECT vs write RLS | **Not applied** — awaiting explicit production/dev approval |

## API endpoints (`aegis-crm`)

Auth: Bearer JWT → `portal_users` → account → `zoho_account_id` (server-side only).

| Method | Path | Authz |
|--------|------|-------|
| GET | `/workforce/overview` | Account member |
| GET | `/workforce` or `/workforce/employees` | Account member (paginated + `q`) |
| GET | `/workforce/employees/:id` | Account member |
| GET | `/workforce/exceptions` | Account member |
| POST | `/workforce` or `/workforce/employees` | owner/admin/hr_admin |
| POST | `/workforce/contact-search` | HR or broker |
| POST | `/workforce/contact-promote` | broker/owner/admin; idempotent |

No automatic Zoho Contact on create/import.

## Permission changes

- App roles: `admin` \| `hr_admin` \| `broker` \| `employee`
- Caps: `workforce_hr`, `workforce_broker` (+ existing `employees`)
- Portal `owner`/`admin` → app admin (workforce manage)
- Portal `member` → employee (no People mutation; no `employees` capability)
- UI: HR actions gated on `workforce_hr` only (not broker `employees` read)
- RLS hardening in `20261112_…` (pending apply): members SELECT; HR write; brokers write exceptions + CRM links

## Test results (executed)

```
npm test -- --run src/domain/__tests__/workforce.test.ts src/domain/__tests__/lifecycle.test.ts
npm run build
```

- Workforce unit tests: claim WhatsApp, RBAC isolation, CSV/mapping, no auto-Contact, deactivate preserves CRM, etc.
- Lifecycle tests retained.
- Production build (`tsc -b && vite build`) must pass in verification run below.

Live Zoho promote E2E and full RLS integration against Atlantis after `20261112` apply are **not** claimed passed.

## Remaining limitations

- Invite **email delivery** not wired (token returned once; hash stored).
- Zoho **custom AEGIS field** API names not written (await live CRM config).
- No fund/medical scheme administrator integrations.
- XLSX uses first sheet only; very large imports still run in-browser (exception flagged at ≥100 rows).
- Activation accept page/edge route for end-user magic link not shipped (service helper `acceptEmployeeInviteByHash` ready).
- `20261112_workforce_permissions.sql` not applied yet.

## Required environment variables

Existing:

- `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`
- `VITE_SUPABASE_FUNCTIONS_URL` (optional)
- Edge: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`
- Zoho OAuth secrets used by `aegis-crm` (existing)
- Claim OTP: `TWILIO_*` / Verify (existing)

No new secrets introduced for Phase B.

## Zoho CRM configuration dependencies

1. Confirm custom Contact field API names for AEGIS employee/person reference before write-back.
2. Deploy updated `aegis-crm` and `aegis-employee-claim` functions.
3. Optionally map Account widget to `/workforce/*` with the caller's portal JWT.

## Production deployment steps

1. Review `20261111_workforce_extensions.sql` (if not already on target).
2. **Obtain explicit approval**, then apply `20261112_workforce_permissions.sql`.
3. Assign `hr_admin` / `broker` in `portal_users.role` for the right users.
4. Deploy edge functions `aegis-crm`, `aegis-employee-claim`.
5. Smoke-test: create employee without WhatsApp; claim OTP blocked; invite requires email; import preview; promote idempotent.
6. Build Zoho Account widget against workforce API.

## Architectural decisions (Phase B approval)

- No separate `people` table.
- No second employee registry.
- Soft deactivate only for ordinary HR leave.
- Routine HR does not need broker approval.
- WhatsApp optional for registry; required for claim OTP; never invent placeholders.
