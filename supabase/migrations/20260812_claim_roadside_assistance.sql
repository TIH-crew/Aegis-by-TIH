-- Roadside assistance fields on employee/admin claims
alter table public.portal_claims
  add column if not exists roadside_needed boolean,
  add column if not exists roadside_call_preference text,
  add column if not exists roadside_provider jsonb;
