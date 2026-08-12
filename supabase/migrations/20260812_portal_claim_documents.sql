-- Claim supporting documents (invoices, quotes, confirmation docs) for portal claim breakdown

create table if not exists public.portal_claim_documents (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  claim_id uuid not null references public.portal_claims(id) on delete cascade,
  kind text not null check (kind in ('invoice', 'quote', 'confirmation', 'other')),
  title text not null,
  status text,
  amount numeric,
  file_name text,
  file_url text,
  notes text,
  zoho_id text,
  created_at timestamptz not null default now()
);

create index if not exists portal_claim_documents_claim_idx
  on public.portal_claim_documents (claim_id, kind);

create index if not exists portal_claim_documents_account_idx
  on public.portal_claim_documents (account_id);

alter table public.portal_claim_documents enable row level security;

drop policy if exists portal_claim_documents_select on public.portal_claim_documents;
create policy portal_claim_documents_select
  on public.portal_claim_documents
  for select
  to authenticated
  using (account_id in (select public.current_account_ids()));

drop policy if exists portal_claim_documents_insert on public.portal_claim_documents;
create policy portal_claim_documents_insert
  on public.portal_claim_documents
  for insert
  to authenticated
  with check (account_id in (select public.current_account_ids()));

drop policy if exists portal_claim_documents_update on public.portal_claim_documents;
create policy portal_claim_documents_update
  on public.portal_claim_documents
  for update
  to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

comment on table public.portal_claim_documents is
  'Invoices, repair quotes, settlement confirmations and other docs linked to a portal claim.';
