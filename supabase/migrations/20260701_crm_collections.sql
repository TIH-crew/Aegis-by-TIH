-- CRM collections: policies, broker requests, Zoho linkage

create table if not exists public.portal_policies (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  zoho_policy_id text not null,
  policy_number text,
  status text,
  premium numeric(14,2),
  inception_date date,
  renewal_date date,
  insurer text,
  product_line text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (account_id, zoho_policy_id)
);

alter table public.portal_quotations
  add column if not exists zoho_deal_id text,
  add column if not exists stage text,
  add column if not exists quote_number text;

create unique index if not exists portal_quotations_account_zoho_deal_key
  on public.portal_quotations (account_id, zoho_deal_id)
  where zoho_deal_id is not null;

alter table public.portal_claims
  add column if not exists zoho_claim_id text,
  add column if not exists zoho_policy_id text,
  add column if not exists description text,
  add column if not exists attachments jsonb not null default '[]'::jsonb;

create unique index if not exists portal_claims_account_zoho_claim_key
  on public.portal_claims (account_id, zoho_claim_id)
  where zoho_claim_id is not null;

create table if not exists public.portal_broker_requests (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  request_type text not null default 'add_item' check (request_type in ('add_item')),
  context_type text not null check (context_type in ('quotation', 'policy')),
  context_zoho_id text not null,
  context_label text,
  risk_item_id uuid references public.portal_risk_items(id) on delete set null,
  draft_item jsonb,
  message text,
  zoho_task_id text,
  status text not null default 'sent' check (status in ('sent', 'acknowledged', 'completed', 'failed')),
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now()
);

alter table public.portal_policies enable row level security;
alter table public.portal_broker_requests enable row level security;

create policy portal_policies_account on public.portal_policies
  for all using (
    account_id in (select account_id from public.portal_users where user_id = auth.uid())
  );

create policy portal_broker_requests_account on public.portal_broker_requests
  for all using (
    account_id in (select account_id from public.portal_users where user_id = auth.uid())
  );

create policy portal_broker_requests_insert on public.portal_broker_requests
  for insert with check (
    account_id in (select account_id from public.portal_users where user_id = auth.uid())
  );
