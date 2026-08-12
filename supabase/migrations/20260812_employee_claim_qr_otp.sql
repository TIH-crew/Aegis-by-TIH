-- Employee claim QR portal: access token + OTP sessions + geo/photo metadata on claims
-- Applied remotely as employee_claim_qr_otp

alter table public.portal_employees
  add column if not exists claim_access_token uuid not null default gen_random_uuid();

create unique index if not exists portal_employees_claim_access_token_uidx
  on public.portal_employees (claim_access_token);

create table if not exists public.portal_claim_otp_sessions (
  id uuid primary key default gen_random_uuid(),
  employee_id uuid not null references public.portal_employees(id) on delete cascade,
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  whatsapp_number text not null,
  code_hash text not null,
  attempts int not null default 0,
  verified_at timestamptz,
  session_token text,
  expires_at timestamptz not null,
  created_at timestamptz not null default now()
);

create index if not exists portal_claim_otp_sessions_employee_idx
  on public.portal_claim_otp_sessions (employee_id, created_at desc);

alter table public.portal_claims
  add column if not exists employee_id uuid references public.portal_employees(id) on delete set null,
  add column if not exists latitude double precision,
  add column if not exists longitude double precision,
  add column if not exists location_accuracy double precision,
  add column if not exists photo_meta jsonb not null default '[]'::jsonb,
  add column if not exists submitted_via text;

alter table public.portal_claim_otp_sessions enable row level security;
