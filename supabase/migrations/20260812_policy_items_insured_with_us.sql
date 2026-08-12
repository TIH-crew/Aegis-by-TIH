-- Policy schedule items are covered with TIH, not "elsewhere".
with linked as (
  select distinct (item->>'risk_item_id')::uuid as risk_item_id
  from public.portal_policies p,
  lateral jsonb_array_elements(coalesce(p.covered_items, '[]'::jsonb)) item
  where item->>'risk_item_id' is not null
    and item->>'risk_item_id' <> ''
    and (item->>'risk_item_id') ~* '^[0-9a-f-]{36}$'
)
update public.portal_risk_items r
set
  insurance_status = 'Insured with us',
  updated_at = now()
from linked l
where r.id = l.risk_item_id
  and r.insurance_status is distinct from 'Insured with us';
