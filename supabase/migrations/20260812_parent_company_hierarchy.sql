-- Parent / subsidiary company hierarchy for Aegis portal accounts

alter table public.portal_accounts
  add column if not exists parent_account_id uuid references public.portal_accounts(id) on delete set null;

create index if not exists portal_accounts_parent_account_id_idx
  on public.portal_accounts (parent_account_id);

alter table public.portal_accounts
  drop constraint if exists portal_accounts_parent_not_self;

alter table public.portal_accounts
  add constraint portal_accounts_parent_not_self
  check (parent_account_id is null or parent_account_id <> id);

-- Membership account + direct subsidiaries are visible to the signed-in user
create or replace function public.current_account_ids()
returns setof uuid
language sql
stable
security definer
set search_path = public
as $$
  select account_id
  from public.portal_users
  where user_id = auth.uid()
  union
  select child.id
  from public.portal_accounts child
  join public.portal_users pu on pu.account_id = child.parent_account_id
  where pu.user_id = auth.uid();
$$;

comment on column public.portal_accounts.parent_account_id is
  'Optional parent company (portal_accounts). Subsidiaries keep their own policies, quotes, claims, and risk items.';
