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
