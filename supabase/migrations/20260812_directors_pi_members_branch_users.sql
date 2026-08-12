-- Directors, PI members, branch-scoped portal users
-- Medipost group structure support

-- 1) Directors (people; not employees)
create table if not exists public.portal_directors (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  id_number text,
  email text,
  phone text,
  notes text,
  user_id uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists portal_directors_email_uidx
  on public.portal_directors (lower(email))
  where email is not null;

create index if not exists portal_directors_name_idx
  on public.portal_directors (full_name);

-- Directors ↔ accounts (a director can sit on multiple companies)
create table if not exists public.portal_director_accounts (
  id uuid primary key default gen_random_uuid(),
  director_id uuid not null references public.portal_directors(id) on delete cascade,
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  title text,
  is_primary boolean not null default false,
  created_at timestamptz not null default now(),
  unique (director_id, account_id)
);

create index if not exists portal_director_accounts_account_idx
  on public.portal_director_accounts (account_id);

-- 2) PI covered individuals (NOT staff / employees)
create table if not exists public.portal_pi_members (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  policy_id uuid references public.portal_policies(id) on delete set null,
  policy_number text,
  full_name text not null,
  entity_name text,
  id_number text,
  email text,
  phone text,
  council_number text,
  vat_amount numeric(14, 2),
  premium numeric(14, 2),
  payment_status text,
  cover_year int,
  cover_month date,
  comments text,
  source_row int,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists portal_pi_members_account_idx
  on public.portal_pi_members (account_id);

create index if not exists portal_pi_members_policy_idx
  on public.portal_pi_members (policy_id);

create index if not exists portal_pi_members_policy_number_idx
  on public.portal_pi_members (policy_number);

create unique index if not exists portal_pi_members_dedupe_uidx
  on public.portal_pi_members (
    account_id,
    coalesce(policy_number, ''),
    coalesce(id_number, ''),
    lower(full_name),
    coalesce(cover_month, '1900-01-01'::date)
  );

-- 3) Branch scoping on users + invites
alter table public.portal_users
  add column if not exists branch_id uuid references public.portal_branches(id) on delete set null;

alter table public.portal_users
  add column if not exists director_id uuid references public.portal_directors(id) on delete set null;

alter table public.portal_invites
  add column if not exists branch_id uuid references public.portal_branches(id) on delete set null;

alter table public.portal_invites
  add column if not exists director_id uuid references public.portal_directors(id) on delete set null;

create index if not exists portal_users_branch_id_idx
  on public.portal_users (branch_id);

-- Helper: current user's branch (null = whole account)
create or replace function public.current_branch_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select branch_id
  from public.portal_users
  where user_id = auth.uid()
  limit 1;
$$;

grant execute on function public.current_branch_id() to authenticated;

-- Accept invite: copy branch_id + director_id
create or replace function public.accept_portal_invite_for_current_user()
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  user_email text;
  invite_record public.portal_invites%rowtype;
  existing_account uuid;
begin
  if auth.uid() is null then
    return null;
  end if;

  select account_id into existing_account
  from public.portal_users
  where user_id = auth.uid()
  limit 1;

  if existing_account is not null then
    return existing_account;
  end if;

  user_email := lower(coalesce(auth.jwt() ->> 'email', ''));
  if user_email = '' then
    return null;
  end if;

  select * into invite_record
  from public.portal_invites
  where lower(email) = user_email
    and accepted_at is null
  order by created_at asc
  limit 1;

  if invite_record.id is null then
    return null;
  end if;

  insert into public.portal_users (user_id, account_id, role, email, branch_id, director_id)
  values (
    auth.uid(),
    invite_record.account_id,
    invite_record.role,
    invite_record.email,
    invite_record.branch_id,
    invite_record.director_id
  );

  update public.portal_invites
  set accepted_at = now()
  where id = invite_record.id;

  update public.portal_accounts
  set aegis_status = 'active'
  where id = invite_record.account_id;

  if invite_record.director_id is not null then
    update public.portal_directors
    set user_id = auth.uid(), updated_at = now()
    where id = invite_record.director_id;
  end if;

  return invite_record.account_id;
end;
$$;

grant execute on function public.accept_portal_invite_for_current_user() to authenticated;

-- Branch-scoped users only see their membership account (not parent-group subsidiaries)
create or replace function public.current_account_ids()
returns setof uuid
language sql
stable
security definer
set search_path = public
as $$
  with me as (
    select account_id, branch_id
    from public.portal_users
    where user_id = auth.uid()
    limit 1
  )
  select account_id from me
  union
  select child.id
  from public.portal_accounts child
  join me on child.parent_account_id = me.account_id
  where me.branch_id is null;
$$;

grant execute on function public.current_account_ids() to authenticated;

-- RLS
alter table public.portal_directors enable row level security;
alter table public.portal_director_accounts enable row level security;
alter table public.portal_pi_members enable row level security;

drop policy if exists portal_directors_select on public.portal_directors;
create policy portal_directors_select on public.portal_directors
  for select to authenticated
  using (
    id in (
      select da.director_id
      from public.portal_director_accounts da
      where da.account_id in (select public.current_account_ids())
    )
    or user_id = auth.uid()
  );

drop policy if exists portal_directors_write on public.portal_directors;
create policy portal_directors_write on public.portal_directors
  for all to authenticated
  using (
    id in (
      select da.director_id
      from public.portal_director_accounts da
      where da.account_id in (select public.current_account_ids())
    )
  )
  with check (
    id in (
      select da.director_id
      from public.portal_director_accounts da
      where da.account_id in (select public.current_account_ids())
    )
    or not exists (select 1 from public.portal_director_accounts where director_id = id)
  );

drop policy if exists portal_director_accounts_select on public.portal_director_accounts;
create policy portal_director_accounts_select on public.portal_director_accounts
  for select to authenticated
  using (account_id in (select public.current_account_ids()));

drop policy if exists portal_director_accounts_write on public.portal_director_accounts;
create policy portal_director_accounts_write on public.portal_director_accounts
  for all to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

drop policy if exists portal_pi_members_select on public.portal_pi_members;
create policy portal_pi_members_select on public.portal_pi_members
  for select to authenticated
  using (account_id in (select public.current_account_ids()));

drop policy if exists portal_pi_members_write on public.portal_pi_members;
create policy portal_pi_members_write on public.portal_pi_members
  for all to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

grant select, insert, update, delete on public.portal_directors to authenticated;
grant select, insert, update, delete on public.portal_director_accounts to authenticated;
grant select, insert, update, delete on public.portal_pi_members to authenticated;
