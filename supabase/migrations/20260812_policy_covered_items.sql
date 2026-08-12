alter table public.portal_policies
  add column if not exists covered_items jsonb not null default '[]'::jsonb,
  add column if not exists insurer_policy_number text,
  add column if not exists frequency text,
  add column if not exists sasria_premium numeric(14,2),
  add column if not exists fee_premium numeric(14,2);

comment on column public.portal_policies.covered_items is
  'Policy schedule lines (section, description, sum insured, premiums). Source of truth for on-screen schedule breakdown.';
