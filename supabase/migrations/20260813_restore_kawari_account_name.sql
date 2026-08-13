-- Restore Kawari subsidiary display name (Zoho refresh had overwritten it to Medipost FTRR&I)

update public.portal_accounts
set
  name = 'Kawari Wholesalers (Pty) Ltd',
  industry = coalesce(nullif(industry, ''), 'Wholesale'),
  registration_number = coalesce(registration_number, '2004/015737/07'),
  parent_account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  aegis_status = 'active'
where id = 'b1111111-1111-4111-8111-111111111147';
