-- Widget sessions + tighten benefit membership visibility.
-- Non-destructive. Apply to production only with explicit approval.
-- Safe to apply on Atlantis (dev) for integration readiness testing.

create table if not exists public.portal_workforce_widget_sessions (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  zoho_account_id text not null,
  zoho_user_id text,
  zoho_user_email text not null,
  token_hash text not null,
  role text not null default 'broker'
    check (role in ('broker', 'admin', 'hr_admin', 'owner')),
  scopes text[] not null default array['workforce:read','workforce:write','crm:promote'],
  expires_at timestamptz not null,
  revoked_at timestamptz,
  created_at timestamptz not null default now(),
  last_used_at timestamptz,
  unique (token_hash)
);

create index if not exists portal_workforce_widget_sessions_account_idx
  on public.portal_workforce_widget_sessions (account_id, expires_at desc);

alter table public.portal_workforce_widget_sessions enable row level security;

-- No direct client access — edge functions use service role
drop policy if exists portal_workforce_widget_sessions_deny on public.portal_workforce_widget_sessions;
create policy portal_workforce_widget_sessions_deny on public.portal_workforce_widget_sessions
  for all to authenticated
  using (false)
  with check (false);

grant select, insert, update, delete on public.portal_workforce_widget_sessions to service_role;

-- Benefit memberships: enrolment metadata only for HR/broker (no balances stored anyway)
drop policy if exists portal_employee_benefit_memberships_member_all on public.portal_employee_benefit_memberships;
drop policy if exists portal_employee_benefit_memberships_select on public.portal_employee_benefit_memberships;
drop policy if exists portal_employee_benefit_memberships_write on public.portal_employee_benefit_memberships;

create policy portal_employee_benefit_memberships_select on public.portal_employee_benefit_memberships
  for select to authenticated
  using (
    account_id in (select public.current_account_ids())
    and (
      public.can_manage_workforce(account_id)
      or public.can_broker_workforce(account_id)
    )
  );

create policy portal_employee_benefit_memberships_write on public.portal_employee_benefit_memberships
  for all to authenticated
  using (
    account_id in (select public.current_account_ids())
    and public.can_manage_workforce(account_id)
  )
  with check (
    account_id in (select public.current_account_ids())
    and public.can_manage_workforce(account_id)
  );
