-- Remove "Insured elsewhere": treat as Uninsured going forward.
-- Also mark Building items as insured under the Fire schedule section when section was blank/Building.

update public.portal_risk_items
set
  insurance_status = 'Uninsured',
  updated_at = now()
where insurance_status in ('Insured elsewhere', 'Covered Elsewhere');

-- Building portal category ↔ Fire schedule section note
update public.portal_risk_items
set
  insurance_section = 'Fire',
  updated_at = now()
where category = 'Building'
  and (
    insurance_section is null
    or insurance_section = ''
    or insurance_section = 'Building'
    or insurance_section = 'Buildings'
  );

-- Items linked on a policy schedule remain Insured with us
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

-- Previously insured with us but no longer on any policy schedule → Uninsured
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
  insurance_status = 'Uninsured',
  updated_at = now()
where r.insurance_status = 'Insured with us'
  and not exists (select 1 from linked l where l.risk_item_id = r.id);
