-- Allow parent-company users to see subsidiary policies (same scope as risk items).
drop policy if exists portal_policies_account on public.portal_policies;

create policy portal_policies_account on public.portal_policies
  for all
  to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));
