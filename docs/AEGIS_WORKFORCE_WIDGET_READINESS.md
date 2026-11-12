# AEGIS Workforce — Zoho Widget Readiness

Date: 2026-11-11  
Scope: Phase C integration readiness for an Account-level Zoho CRM workforce widget  
Dev project verified: Atlantis (`egemzmclxcrbgzovcyku`)

## 1. Verified implementation status

| Claim in `AEGIS_WORKFORCE_IMPLEMENTATION.md` | Verified in repo / Atlantis |
|-----------------------------------------------|-----------------------------|
| `portal_employees` HR columns | Yes (`first_name`, `department`, `invitation_status`, `zoho_contact_id`, …) |
| Satellite tables | Yes: invites, import batches/rows, exceptions, CRM links, benefit memberships, audit |
| Bulk import CSV/XLSX + soft deactivate | Yes (`workforce.service`, People UI) |
| Idempotent Contact promote | Yes (`portal_employee_crm_links.idempotency_key` + edge promote) |
| Workforce endpoints on `aegis-crm` | Yes (extended this phase) |
| WhatsApp optional; claim OTP gated | Yes |
| Activation email + accept page | **Completed this phase** (`/activate-employee`) |
| Widget auth bridge | **Completed this phase** |
| `20261112` permissions | Applied on **Atlantis (dev)** for verification; **not** approved for production |
| `20261113` widget sessions | Applied on **Atlantis (dev)**; **not** approved for production |

### Discrepancies addressed

- Report said activation email / accept UI deferred → now implemented.
- Report said widget consumes portal JWT only → brokers in CRM often lack portal JWT; short-lived widget sessions added.
- Report said `20261112` not applied → applied on Atlantis for readiness testing only.

Custody / claim QR paths remain separate from activation tokens.

## 2. Database and permissions readiness

### Migrations

| File | Atlantis | Production |
|------|----------|------------|
| `20261111_workforce_extensions.sql` | Applied | Needs explicit approval if not present |
| `20261112_workforce_permissions.sql` | Applied (dev test) | **Do not apply without approval** |
| `20261113_workforce_widget_sessions.sql` | Applied (dev test) | **Do not apply without approval** |

### Permission model (after 20261112)

- **HR (`owner`/`admin`/`hr_admin`)**: insert/update/delete employees in authorised org(s); manage invites/imports.
- **Ordinary `member`**: SELECT employees only — cannot mutate.
- **Broker**: update employees (servicing), exceptions, CRM links; no unrestricted insert via RLS (API create remains HR/admin unless role elevated).
- **Benefit memberships**: SELECT/write limited to HR/broker (no balances/claims stored).
- **Widget sessions**: no authenticated client RLS access (service role / edge only).

### Breaking change note

Applying `20261112` removes the previous “any account member can mutate `portal_employees`” policy. Asset custody FKs and claim OTP continue to work (claims use service role / claim tokens). Portal UI HR actions already require `workforce_hr`.

### Missing / residual

- Brokers authorised only via TIH email domain (when not in `portal_users`) cannot use portal JWT path — they must use widget sessions.
- Parent/child hierarchy relies on `portal_accounts.parent_account_id`.

## 3. Zoho authentication architecture

### Problem

Zoho CRM Account widgets do **not** automatically possess an AEGIS portal Supabase JWT. Workforce sessions are minted after server-side Zoho Account + user verification (no shared widget secret).

### Chosen flow

```
Zoho CRM Account widget
  │  ZOHO.embeddedApp PageLoad → EntityId (Account)
  │  ZOHO.CRM.CONFIG.getCurrentUser() → email + id
  ▼
POST /aegis-crm/workforce/widget-session
  Body: { zoho_account_id, zoho_user_email, zoho_user_id? }
  │
  ├─ 1. Re-fetch Account from Zoho API (must match id)
  ├─ 2. Resolve Zoho user by email via Users API (must exist; id must match if supplied)
  ├─ 3. Resolve portal_accounts by zoho_account_id
  ├─ 4. Authorise: portal_users membership (broker/admin/owner/hr_admin) OR AEGIS_BROKER_EMAIL_DOMAINS
  └─ 5. Issue opaque session token (hash stored); TTL default 30m
  ▼
Subsequent workforce calls
  Headers: X-Aegis-Widget-Session: <token>
  (Account scope fixed to session.account_id — client Account ID ignored)
```

### Trust boundaries

| Trusted | Not trusted |
|---------|-------------|
| Server Zoho OAuth (refresh token) | Client-supplied Account ID alone |
| Session token hash in DB | Client-supplied Zoho user id alone |
| Portal membership / broker domain allowlist | Browser possession of service role / Zoho client secret |
| | Unverified email claims |

### Session expiry / revocation

- `expires_at` enforced on every resolve.
- `POST /workforce/widget-session` with `{ action: "revoke", session_token }` or header.
- `revoked_at` blocks reuse.

### Portal JWT path (unchanged)

AEGIS web app continues to use `Authorization: Bearer <supabase_jwt>` → `portal_users` → account. Widget session is an additional auth mode for CRM-embedded brokers.

## 4. API endpoint contracts

Base: `/functions/v1/aegis-crm`

Auth modes: `Authorization: Bearer <portal JWT>` **or** `X-Aegis-Widget-Session: <token>`  
(Exception: widget-session mint is unauthenticated then Zoho-verified; activation validate/send use invite token.)

| Method | Path | Authz | Notes |
|--------|------|-------|-------|
| POST | `/workforce/widget-session` | Shared secret | Mint / revoke |
| GET | `/workforce/overview` | Member / widget | Metrics |
| GET | `/workforce/employees?q&limit&offset` | Member / widget | Paginated list |
| GET | `/workforce/employees/:id` | Member / widget | Detail (no benefit balances) |
| GET | `/workforce/exceptions` | Member / widget | Review queue |
| POST | `/workforce/employees` | HR roles | Create; never creates Zoho Contact |
| PATCH | `/workforce/employees/:id` | HR or broker | Safe field patch |
| POST | `/workforce/employees/:id/deactivate` | HR or broker | Soft end; preserves CRM link |
| POST | `/workforce/contact-search` | HR or broker | Candidate Contacts |
| POST | `/workforce/contact-promote` | Broker+ | Idempotent create/link |
| POST | `/workforce/lead-search` | HR or broker | Candidate Leads |
| POST | `/workforce/lead-promote` | Broker+ | Idempotent create/link Lead |
| POST | `/workforce/activation` | Invite token (+ JWT for accept) | validate / send_magic_link / accept |

### Contact promotion

1. Search existing Contacts (email/phone) before create.
2. Broker supplies `zoho_contact_id` to link **or** omits to create.
3. Idempotency via `idempotency_key` / existing `zoho_contact_id`.
4. Zoho failure → `zoho_contact_link_status=failed`, employee retained.
5. Standard Contact fields only — **no** invented custom AEGIS API names; **no** pension/medical payloads.

## 5. Required Zoho configuration

1. Account-level widget (Developer Space) pointing at future workforce widget HTML.
2. Widget must call `ZOHO.embeddedApp.init` + `PageLoad` + `CONFIG.getCurrentUser`.
3. Widget config: `workforceApiUrl` → `…/functions/v1/aegis-crm` (plus publishable anon key for the gateway).
4. Optional later: custom Contact fields for AEGIS employee UUID (API names TBD — do not invent).

## 6. Required Supabase configuration

| Secret / env | Purpose |
|--------------|---------|
| `AEGIS_APP_URL` | Activation / magic-link redirects |
| `AEGIS_BROKER_EMAIL_DOMAINS` | Default `theinsurancehub.co.za` |
| `AEGIS_WIDGET_SESSION_TTL_MS` | Default `1800000` (30m) |
| `ZOHO_CLIENT_ID` / `SECRET` / `REFRESH_TOKEN` | Account + user verification |
| `SUPABASE_*` | Edge runtime |
| `RESEND_API_KEY` or `SENDGRID_API_KEY` | Optional activation notify email |
| Portal: `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, optional `VITE_SUPABASE_FUNCTIONS_URL` |

Deploy edge function `aegis-crm` (includes `widget-auth.ts`).

## 7. Tests executed and results

Commands:

```
npm test -- --run src/domain/__tests__/workforce.test.ts src/domain/__tests__/lifecycle.test.ts src/domain/__tests__/widget-auth.test.ts
npm run build
```

**Actual results (2026-11-11):**

- Test files: **3 passed**
- Tests: **37 passed**
- `tsc -b && vite build`: **passed**

Coverage: widget verification mismatches, expiry/revocation, broker domains, HR vs promote scopes, cross-tenant session binding principle, workforce/claim/RBAC/lifecycle suites.

Live Zoho mint E2E against production CRM is **not** claimed in this document.

## 8. Outstanding blockers

1. **Production migration approval** for `20261112` + `20261113`.
2. **Deploy** updated `aegis-crm` to the target Supabase project.
3. Host/pack the Zoho CRM widget at `CRM Widgets/Employees-AEGIS/EmployeeManagement` (list, profile, Contact/Lead convert).
4. Confirm Zoho custom field API names if AEGIS IDs must be written onto Contacts/Leads.
5. Assign `broker` / `hr_admin` portal roles where domain allowlist is insufficient.
6. Apply `20261114_workforce_lead_links.sql` on any non-Atlantis target before Lead promote.

## 9. Deployment instructions

1. Approve and apply `20261112_workforce_permissions.sql` then `20261113_workforce_widget_sessions.sql` on the target project.
2. `supabase functions deploy aegis-crm` (with secrets above).
3. Smoke:
   - Mint widget session with secret + real Zoho Account/user → 200.
   - Mint with wrong Account id → 403.
   - Call overview with session → metrics for that account only.
   - Expired/revoked session → 401.
   - Promote twice with same idempotency key → `duplicated: true`.
   - Activate employee via `/activate-employee?token=…`.
4. Ship CRM widget against the contracts in §4.

## 10. Ready for Zoho CRM widget?

**Backend: ready for widget development against Atlantis (dev), with conditions.**

- Auth bridge, workforce CRUD/deactivate, exceptions, Contact search/promote, activation, and RLS are in place on the development project.
- **Not production-ready** until migrations are explicitly approved on production, `aegis-crm` is deployed, and the CRM widget is hosted in Zoho.

Do not treat this as a production go-live approval.
