# Aegis by TIH

Client-facing asset and risk management portal — **Aegis by TIH** (Hartbeespoort Insurance Hub). Burgundy branding, Supabase backend, Asset Panda-style UI.

## Phase 2 — Authentication

- **Magic link sign-in** via Supabase Auth (no passwords)
- **`portal_users`** links each auth user to one `portal_accounts` tenant
- **`portal_invites`** for inviting teammates to an existing organization
- **Row Level Security** scoped to the signed-in user's account (anon access removed)

## Tables

- `portal_accounts` — commercial client tenants
- `portal_users` — auth user ↔ account membership
- `portal_invites` — pending email invites
- `portal_branches` — branch locations per account
- `portal_risk_items` — asset / risk item records
- `portal_quotations`, `portal_claims`, `portal_renewals`

## Environment

Copy `.env.example` to `.env` and set:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`
- `VITE_GOOGLE_MAPS_API_KEY` (optional, for branch address search)

## Supabase Auth setup

1. In **Supabase Dashboard → Authentication → URL Configuration**, add:
   - Site URL: `http://localhost:1420`
   - Redirect URLs: `http://localhost:1420/auth/callback`
2. Enable **Email** provider (magic link / OTP).
3. Enable **Google** provider (see below).
4. For production, add your deployed domain to redirect URLs.

## Google sign-in setup

Google OAuth is configured in **two places**: Google Cloud Console and Supabase.

### 1. Google Cloud Console

1. Open [Google Cloud Console](https://console.cloud.google.com/) → **APIs & Services → Credentials**.
2. **Create credentials → OAuth client ID** (type: **Web application**).
3. Set:
   - **Authorized JavaScript origins:** `http://localhost:1420` (and your production URL later)
   - **Authorized redirect URIs:** your Supabase auth callback:
     ```
     https://YOUR_PROJECT_REF.supabase.co/auth/v1/callback
     ```
     Find `YOUR_PROJECT_REF` in your Supabase project URL (`https://xxxx.supabase.co`).
4. Copy the **Client ID** and **Client secret**.

### 2. Supabase Dashboard

1. **Authentication → Providers → Google** → Enable.
2. Paste the Google **Client ID** and **Client secret**.
3. Under **Authentication → URL Configuration**, ensure redirect URLs include:
   - `http://localhost:1420/auth/callback`

## Broker invite flow (Zoho CRM)

Organizations are **provisioned from Zoho Accounts** when a broker sends an invite — clients do not create orgs themselves.

1. Broker opens an **Account** in Zoho CRM → **Invite to Aegis** widget
2. Edge function `aegis-invite` provisions `portal_accounts` from Zoho data and sends a magic link
3. Client signs in → `accept_portal_invite_for_current_user()` links them to the org
4. Company profile is prefilled in **Organization settings** (editable)

See [supabase/functions/aegis-invite/README.md](supabase/functions/aegis-invite/README.md) and `CRM Widgets/zohowidget/app/aegis-invite-widget.html`.

## Client sign-in flow

1. Broker sends invite from Zoho (or manual `portal_invites` row for dev)
2. Client opens **Login** → magic link or Google (must match invited email)
3. Lands on dashboard with Zoho-imported organization profile
4. Without a pending invite → **No access** page

## Run locally

```bash
npm install
npm run dev
```

Open http://localhost:1420

## Tauri desktop (requires Rust)

Install [Rust](https://rustup.rs/) then:

```bash
npm run tauri dev
```
