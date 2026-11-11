-- Workforce permissions: extend portal roles + tighten employee mutation RLS.
-- Non-destructive. Do not apply to production without explicit approval.

-- Allow HR / broker portal membership roles
alter table public.portal_users drop constraint if exists portal_users_role_check;
alter table public.portal_users add constraint portal_users_role_check
  check (role = any (array[
    'owner'::text,
    'admin'::text,
    'member'::text,
    'hr_admin'::text,
    'broker'::text
  ]));

-- Same for invites if constrained
do $$ begin
  alter table public.portal_invites drop constraint if exists portal_invites_role_check;
exception when undefined_object then null;
end $$;

do $$ begin
  alter table public.portal_invites
    add constraint portal_invites_role_check
    check (role = any (array[
      'owner'::text, 'admin'::text, 'member'::text, 'hr_admin'::text, 'broker'::text
    ]));
exception when duplicate_object then null;
when undefined_table then null;
end $$;

-- True when the caller may mutate workforce data for an account
create or replace function public.can_manage_workforce(p_account_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.portal_users pu
    where pu.user_id = auth.uid()
      and pu.account_id = p_account_id
      and pu.role in ('owner', 'admin', 'hr_admin')
  )
  or exists (
    -- Parent-company admins may manage child accounts in hierarchy
    select 1
    from public.portal_users pu
    join public.portal_accounts child on child.id = p_account_id
    where pu.user_id = auth.uid()
      and pu.account_id = child.parent_account_id
      and pu.role in ('owner', 'admin', 'hr_admin')
  );
$$;

grant execute on function public.can_manage_workforce(uuid) to authenticated;

-- Brokers may read workforce + manage exceptions / CRM promote metadata
create or replace function public.can_broker_workforce(p_account_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.portal_users pu
    where pu.user_id = auth.uid()
      and (
        pu.account_id = p_account_id
        or pu.account_id in (
          select parent_account_id from public.portal_accounts where id = p_account_id
        )
      )
      and pu.role in ('owner', 'admin', 'broker')
  );
$$;

grant execute on function public.can_broker_workforce(uuid) to authenticated;

-- Split portal_employees: members read; only HR/admin/owner write
drop policy if exists portal_employees_member_all on public.portal_employees;
drop policy if exists portal_employees_select on public.portal_employees;
drop policy if exists portal_employees_insert on public.portal_employees;
drop policy if exists portal_employees_update on public.portal_employees;
drop policy if exists portal_employees_delete on public.portal_employees;

create policy portal_employees_select on public.portal_employees
  for select to authenticated
  using (account_id in (select public.current_account_ids()));

create policy portal_employees_insert on public.portal_employees
  for insert to authenticated
  with check (
    account_id in (select public.current_account_ids())
    and public.can_manage_workforce(account_id)
  );

create policy portal_employees_update on public.portal_employees
  for update to authenticated
  using (
    account_id in (select public.current_account_ids())
    and (
      public.can_manage_workforce(account_id)
      or public.can_broker_workforce(account_id)
    )
  )
  with check (
    account_id in (select public.current_account_ids())
    and (
      public.can_manage_workforce(account_id)
      or public.can_broker_workforce(account_id)
    )
  );

create policy portal_employees_delete on public.portal_employees
  for delete to authenticated
  using (
    account_id in (select public.current_account_ids())
    and public.can_manage_workforce(account_id)
  );

-- Satellite workforce tables: read for account members; write for HR (exceptions also broker)
do $$
declare
  t text;
begin
  foreach t in array array[
    'portal_employee_invites',
    'portal_employee_import_batches',
    'portal_employee_import_rows',
    'portal_employee_benefit_memberships',
    'portal_workforce_audit_events'
  ]
  loop
    execute format('drop policy if exists %I_member_all on public.%I', t, t);
    execute format('drop policy if exists %I_select on public.%I', t, t);
    execute format('drop policy if exists %I_write on public.%I', t, t);
    execute format(
      'create policy %I_select on public.%I for select to authenticated
         using (account_id in (select public.current_account_ids()))',
      t, t
    );
    execute format(
      'create policy %I_write on public.%I for all to authenticated
         using (
           account_id in (select public.current_account_ids())
           and public.can_manage_workforce(account_id)
         )
         with check (
           account_id in (select public.current_account_ids())
           and public.can_manage_workforce(account_id)
         )',
      t, t
    );
  end loop;
end $$;

drop policy if exists portal_workforce_exceptions_member_all on public.portal_workforce_exceptions;
drop policy if exists portal_workforce_exceptions_select on public.portal_workforce_exceptions;
drop policy if exists portal_workforce_exceptions_write on public.portal_workforce_exceptions;

create policy portal_workforce_exceptions_select on public.portal_workforce_exceptions
  for select to authenticated
  using (account_id in (select public.current_account_ids()));

create policy portal_workforce_exceptions_write on public.portal_workforce_exceptions
  for all to authenticated
  using (
    account_id in (select public.current_account_ids())
    and (
      public.can_manage_workforce(account_id)
      or public.can_broker_workforce(account_id)
    )
  )
  with check (
    account_id in (select public.current_account_ids())
    and (
      public.can_manage_workforce(account_id)
      or public.can_broker_workforce(account_id)
    )
  );

drop policy if exists portal_employee_crm_links_member_all on public.portal_employee_crm_links;
drop policy if exists portal_employee_crm_links_select on public.portal_employee_crm_links;
drop policy if exists portal_employee_crm_links_write on public.portal_employee_crm_links;

create policy portal_employee_crm_links_select on public.portal_employee_crm_links
  for select to authenticated
  using (
    account_id in (select public.current_account_ids())
    and (
      public.can_manage_workforce(account_id)
      or public.can_broker_workforce(account_id)
    )
  );

create policy portal_employee_crm_links_write on public.portal_employee_crm_links
  for all to authenticated
  using (
    account_id in (select public.current_account_ids())
    and public.can_broker_workforce(account_id)
  )
  with check (
    account_id in (select public.current_account_ids())
    and public.can_broker_workforce(account_id)
  );
