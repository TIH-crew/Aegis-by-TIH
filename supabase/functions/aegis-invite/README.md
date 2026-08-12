# aegis-invite Edge Function

Broker-initiated invite flow: provisions `portal_accounts` from Zoho CRM, creates `portal_invites`, sends magic link.

## Endpoint

`https://<project>.supabase.co/functions/v1/aegis-invite`

| Method | Purpose |
|--------|---------|
| `POST` | Send / resend invite |
| `GET ?zoho_account_id=` | Widget status panel |

When `AEGIS_REQUEST_SECRET` is set, all requests require header: `X-Aegis-Secret: <AEGIS_REQUEST_SECRET>`. If the secret is omitted, auth is disabled (dev only).

## Local dev (preferred first)

1. Copy `supabase/functions/.env.example` → `supabase/functions/.env` and fill in Zoho OAuth + `SUPABASE_*` keys.
2. From the repo root: `npm run dev:functions`
3. Functions run at `http://127.0.0.1:54321/functions/v1/` with secrets from that file (not the Dashboard).

For the portal, optionally set `VITE_SUPABASE_FUNCTIONS_URL=http://127.0.0.1:54321/functions/v1` in `.env` so CRM calls hit your local `aegis-crm` while auth/DB still use your Supabase project.

## Production secrets (Dashboard → Edge Functions → aegis-invite → Secrets)

| Secret | Description |
|--------|-------------|
| `AEGIS_REQUEST_SECRET` | Optional for dev. Shared with Zoho widget (`AEGIS_REQUEST_SECRET` in config.js). Set before production. |
| `AEGIS_APP_URL` | Aegis app URL for magic link redirect (e.g. `http://localhost:1420`) |
| `ZOHO_CLIENT_ID` | Zoho OAuth client ID |
| `ZOHO_CLIENT_SECRET` | Zoho OAuth client secret |
| `ZOHO_REFRESH_TOKEN` | Zoho refresh token with `ZohoCRM.modules.ALL` scope |
| `ZOHO_API_DOMAIN` | Optional, default `www.zohoapis.com` |
| `ZOHO_ACCOUNTS_URL` | Optional, default `https://accounts.zoho.com` |

`SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY` are available automatically in Edge Functions.

## Zoho widget

Host `CRM Widgets/aegisportal/aegis/app/widget.html` and register as an Accounts module button in Zoho Developer Space with sandbox URL **`/widget.html`**.

Set `inviteApiUrl` and optional `requestSecret` in `aegis/app/js/config.js`, then run `npm run pack` and re-upload `aegis/dist/aegis.zip`.
