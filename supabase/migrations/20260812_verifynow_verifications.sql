-- VerifyNow verification payloads on employees and motor risk items

alter table public.portal_employees
  add column if not exists id_number text,
  add column if not exists licence_number text,
  add column if not exists licence_valid_to date,
  add column if not exists licence_categories text[],
  add column if not exists drivers_licence_verified_at timestamptz,
  add column if not exists drivers_licence_verification jsonb not null default '{}'::jsonb;

comment on column public.portal_employees.drivers_licence_verification is
  'Latest VerifyNow drivers licence barcode verification payload.';

alter table public.portal_risk_items
  add column if not exists vehicle_verification jsonb not null default '{}'::jsonb;

comment on column public.portal_risk_items.vehicle_verification is
  'Latest VerifyNow vehicle licence disc / number plate lookup payloads.';
