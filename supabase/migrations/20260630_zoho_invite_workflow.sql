-- Zoho-to-Aegis invite workflow: extend portal_accounts, invites, provision RPC

alter table public.portal_accounts
  add column if not exists phone text,
  add column if not exists website text,
  add column if not exists registration_number text,
  add column if not exists vat_number text,
  add column if not exists industry text,
  add column if not exists zoho_synced_at timestamptz,
  add column if not exists aegis_status text not null default 'invited';

alter table public.portal_invites
  add column if not exists invited_by_email text,
  add column if not exists zoho_account_id text;

create unique index if not exists portal_accounts_zoho_account_id_key
  on public.portal_accounts (zoho_account_id)
  where zoho_account_id is not null;

alter table public.portal_accounts
  drop constraint if exists portal_accounts_aegis_status_check;

alter table public.portal_accounts
  add constraint portal_accounts_aegis_status_check
  check (aegis_status in ('invited', 'active', 'revoked'));

-- Provision or update portal_accounts from Zoho Account snapshot (service role / edge function only)
create or replace function public.provision_portal_account_from_zoho(p_payload jsonb)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_zoho_id text;
  v_account_id uuid;
begin
  v_zoho_id := nullif(trim(p_payload ->> 'zoho_account_id'), '');
  if v_zoho_id is null then
    raise exception 'zoho_account_id is required';
  end if;

  insert into public.portal_accounts (
    name,
    zoho_account_id,
    phone,
    website,
    registration_number,
    vat_number,
    industry,
    logo_url,
    zoho_synced_at,
    aegis_status
  )
  values (
    coalesce(nullif(trim(p_payload ->> 'name'), ''), 'Unnamed Account'),
    v_zoho_id,
    nullif(trim(p_payload ->> 'phone'), ''),
    nullif(trim(p_payload ->> 'website'), ''),
    nullif(trim(p_payload ->> 'registration_number'), ''),
    nullif(trim(p_payload ->> 'vat_number'), ''),
    nullif(trim(p_payload ->> 'industry'), ''),
    nullif(trim(p_payload ->> 'logo_url'), ''),
    now(),
    coalesce(nullif(trim(p_payload ->> 'aegis_status'), ''), 'invited')
  )
  on conflict (zoho_account_id) where zoho_account_id is not null
  do update set
    name = excluded.name,
    phone = excluded.phone,
    website = excluded.website,
    registration_number = excluded.registration_number,
    vat_number = excluded.vat_number,
    industry = excluded.industry,
    logo_url = coalesce(excluded.logo_url, portal_accounts.logo_url),
    zoho_synced_at = now()
  returning id into v_account_id;

  return v_account_id;
end;
$$;

revoke all on function public.provision_portal_account_from_zoho(jsonb) from public;
grant execute on function public.provision_portal_account_from_zoho(jsonb) to service_role;

-- Upsert invite row (service role / edge function only)
create or replace function public.upsert_portal_invite(
  p_account_id uuid,
  p_email text,
  p_role text default 'owner',
  p_invited_by_email text default null,
  p_zoho_account_id text default null
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_invite_id uuid;
  v_email text;
begin
  v_email := lower(trim(p_email));
  if v_email = '' then
    raise exception 'email is required';
  end if;

  if p_role not in ('owner', 'admin', 'member') then
    raise exception 'invalid role';
  end if;

  insert into public.portal_invites (
    account_id,
    email,
    role,
    invited_by_email,
    zoho_account_id,
    accepted_at
  )
  values (
    p_account_id,
    v_email,
    p_role,
    nullif(trim(p_invited_by_email), ''),
    nullif(trim(p_zoho_account_id), ''),
    null
  )
  on conflict (account_id, email) do update set
    role = excluded.role,
    invited_by_email = excluded.invited_by_email,
    zoho_account_id = excluded.zoho_account_id,
    accepted_at = null,
    created_at = now()
  returning id into v_invite_id;

  return v_invite_id;
end;
$$;

revoke all on function public.upsert_portal_invite(uuid, text, text, text, text) from public;
grant execute on function public.upsert_portal_invite(uuid, text, text, text, text) to service_role;

-- Invite status for Zoho widget (service role only)
create or replace function public.get_portal_invite_status(p_zoho_account_id text)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_account public.portal_accounts%rowtype;
  v_pending int;
  v_active int;
  v_last_invite jsonb;
begin
  select * into v_account
  from public.portal_accounts
  where zoho_account_id = nullif(trim(p_zoho_account_id), '')
  limit 1;

  if v_account.id is null then
    return jsonb_build_object('exists', false);
  end if;

  select count(*) into v_pending
  from public.portal_invites
  where account_id = v_account.id and accepted_at is null;

  select count(*) into v_active
  from public.portal_users
  where account_id = v_account.id;

  select jsonb_build_object(
    'email', email,
    'role', role,
    'created_at', created_at,
    'accepted_at', accepted_at
  ) into v_last_invite
  from public.portal_invites
  where account_id = v_account.id
  order by created_at desc
  limit 1;

  return jsonb_build_object(
    'exists', true,
    'portal_account_id', v_account.id,
    'account_name', v_account.name,
    'aegis_status', v_account.aegis_status,
    'pending_invites', v_pending,
    'active_users', v_active,
    'last_invite', v_last_invite,
    'zoho_synced_at', v_account.zoho_synced_at
  );
end;
$$;

revoke all on function public.get_portal_invite_status(text) from public;
grant execute on function public.get_portal_invite_status(text) to service_role;

-- Accept invite: also mark account active
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

  insert into public.portal_users (user_id, account_id, role, email)
  values (auth.uid(), invite_record.account_id, invite_record.role, invite_record.email);

  update public.portal_invites
  set accepted_at = now()
  where id = invite_record.id;

  update public.portal_accounts
  set aegis_status = 'active'
  where id = invite_record.account_id;

  return invite_record.account_id;
end;
$$;

grant execute on function public.accept_portal_invite_for_current_user() to authenticated;
