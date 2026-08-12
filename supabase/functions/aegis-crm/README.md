# aegis-crm Edge Function

Client-facing Zoho CRM proxy for Aegis (authenticated via Supabase JWT).

## Endpoint base

`https://<project>.supabase.co/functions/v1/aegis-crm`

Requires `Authorization: Bearer <user_access_token>` and `apikey` header.

| Method | Path | Description |
|--------|------|-------------|
| GET | `/quotations` | List quotations (Deals) for the org's Zoho Account |
| GET | `/quotations/:id` | Quotation detail + Quote Items (risk name/status) |
| GET | `/policies` | List policies (`Policy_Holder1` = Account) |
| GET | `/policies/:id` | Policy schedule (covered items, premiums) + attachments |
| GET | `/account` | Live Zoho Account snapshot (also refreshes portal_accounts on sync) |
| GET | `/contacts` | Contacts linked to the org's Zoho Account |
| POST | `/broker-request` | Send to Broker — creates Zoho Task (+ optional Nimbis task / email notify) on Deal/Policy |
| POST | `/claims` | Create claim in Zoho + `portal_claims` |

## Zoho modules

- Quotations: `Deals`, `Quote_Items`
- Policies: `Policies`, `Covered_Items` (subform)
- Claims: `Claims` (module under construction in CRM)
- Broker tasks: `Tasks` related to `Deals` or `Policies`

Uses the same OAuth secrets as `aegis-invite`.

## Local dev

See `aegis-invite/README.md` — run `npm run dev:functions` with `supabase/functions/.env`, then set `VITE_SUPABASE_FUNCTIONS_URL=http://127.0.0.1:54321/functions/v1` in the portal `.env`.
