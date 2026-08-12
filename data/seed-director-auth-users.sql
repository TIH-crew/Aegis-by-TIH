-- Create auth + portal users for director invites (branch-scoped)
create extension if not exists pgcrypto;

do $$
declare
  r record;
  new_id uuid;
begin
  for r in
    select i.email, i.account_id, i.branch_id, i.director_id, i.role, d.full_name
    from portal_invites i
    join portal_directors d on d.id = i.director_id
    where i.director_id is not null
      and i.accepted_at is null
  loop
    if exists (select 1 from auth.users where lower(email) = lower(r.email)) then
      select id into new_id from auth.users where lower(email) = lower(r.email) limit 1;
      insert into portal_users (user_id, account_id, role, email, full_name, branch_id, director_id)
      values (new_id, r.account_id, r.role, lower(r.email), r.full_name, r.branch_id, r.director_id)
      on conflict do nothing;
      update portal_directors set user_id = new_id, updated_at = now() where id = r.director_id and user_id is null;
      update portal_invites set accepted_at = now()
        where director_id = r.director_id and lower(email) = lower(r.email) and accepted_at is null;
      continue;
    end if;

    new_id := gen_random_uuid();
    insert into auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
      confirmation_token, recovery_token, email_change_token_new, email_change
    ) values (
      '00000000-0000-0000-0000-000000000000',
      new_id,
      'authenticated',
      'authenticated',
      lower(r.email),
      crypt('AegisDirector2026!', gen_salt('bf')),
      now(),
      jsonb_build_object('provider','email','providers',jsonb_build_array('email')),
      jsonb_build_object('full_name', r.full_name),
      now(), now(),
      '', '', '', ''
    );

    insert into auth.identities (
      id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at
    ) values (
      new_id, new_id,
      jsonb_build_object('sub', new_id::text, 'email', lower(r.email)),
      'email', new_id::text, now(), now(), now()
    );

    insert into portal_users (user_id, account_id, role, email, full_name, branch_id, director_id)
    values (new_id, r.account_id, r.role, lower(r.email), r.full_name, r.branch_id, r.director_id)
    on conflict do nothing;

    update portal_directors set user_id = new_id, updated_at = now() where id = r.director_id;
    update portal_invites set accepted_at = now()
      where director_id = r.director_id and lower(email) = lower(r.email) and accepted_at is null;
  end loop;
end $$;

select count(*)::int as director_users from portal_users where director_id is not null;
