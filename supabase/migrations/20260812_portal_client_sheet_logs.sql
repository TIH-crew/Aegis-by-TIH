-- Client sheet style monthly endorsement / change logs (broker narrative, not system audit)

create table if not exists public.portal_client_sheet_policies (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  insured_name text,
  cover_type text,
  policy_number text not null,
  insurer text,
  frequency text,
  debit_details text,
  renewal_month text,
  monthly_premium numeric,
  annual_once_off numeric,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists portal_client_sheet_policies_account_policy_uidx
  on public.portal_client_sheet_policies (account_id, policy_number);

create table if not exists public.portal_client_sheet_month_logs (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  sheet_policy_id uuid not null references public.portal_client_sheet_policies(id) on delete cascade,
  period_month date not null,
  log_text text not null,
  created_at timestamptz not null default now(),
  unique (sheet_policy_id, period_month)
);

create index if not exists portal_client_sheet_month_logs_account_period_idx
  on public.portal_client_sheet_month_logs (account_id, period_month desc);

alter table public.portal_client_sheet_policies enable row level security;
alter table public.portal_client_sheet_month_logs enable row level security;

drop policy if exists portal_client_sheet_policies_select on public.portal_client_sheet_policies;
create policy portal_client_sheet_policies_select
  on public.portal_client_sheet_policies for select to authenticated
  using (account_id in (select public.current_account_ids()));

drop policy if exists portal_client_sheet_policies_write on public.portal_client_sheet_policies;
create policy portal_client_sheet_policies_write
  on public.portal_client_sheet_policies for all to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

drop policy if exists portal_client_sheet_month_logs_select on public.portal_client_sheet_month_logs;
create policy portal_client_sheet_month_logs_select
  on public.portal_client_sheet_month_logs for select to authenticated
  using (account_id in (select public.current_account_ids()));

drop policy if exists portal_client_sheet_month_logs_write on public.portal_client_sheet_month_logs;
create policy portal_client_sheet_month_logs_write
  on public.portal_client_sheet_month_logs for all to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

comment on table public.portal_client_sheet_policies is
  'Client sheet rows: policies tracked for monthly endorsement / premium change reporting.';
comment on table public.portal_client_sheet_month_logs is
  'Monthly narrative change log per policy (items added/cancelled, premium, credits) as on the broker client sheet.';
