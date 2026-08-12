-- Policy activity / audit log for schedule and premium changes

create table if not exists public.portal_policy_activity (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  policy_id uuid references public.portal_policies(id) on delete set null,
  zoho_policy_id text,
  policy_number text,
  event_type text not null,
  summary text not null,
  details jsonb not null default '{}'::jsonb,
  actor_user_id uuid,
  actor_email text,
  actor_name text,
  created_at timestamptz not null default now()
);

create index if not exists portal_policy_activity_account_created_idx
  on public.portal_policy_activity (account_id, created_at desc);

create index if not exists portal_policy_activity_policy_idx
  on public.portal_policy_activity (policy_id);

create index if not exists portal_policy_activity_event_type_idx
  on public.portal_policy_activity (account_id, event_type);

alter table public.portal_policy_activity enable row level security;

drop policy if exists portal_policy_activity_select on public.portal_policy_activity;
create policy portal_policy_activity_select
  on public.portal_policy_activity
  for select
  to authenticated
  using (account_id in (select public.current_account_ids()));

drop policy if exists portal_policy_activity_insert on public.portal_policy_activity;
create policy portal_policy_activity_insert
  on public.portal_policy_activity
  for insert
  to authenticated
  with check (account_id in (select public.current_account_ids()));

comment on table public.portal_policy_activity is
  'Audit log of policy schedule changes: items added/removed/adjusted, premium and status changes, claims.';
