-- Zoho CRM field storage on portal risk items
alter table public.portal_risk_items
  add column if not exists zoho_fields jsonb not null default '{}'::jsonb,
  add column if not exists zoho_risk_id text;

comment on column public.portal_risk_items.zoho_fields is 'Category-specific Client_Risks field values keyed by Zoho API name';
comment on column public.portal_risk_items.zoho_risk_id is 'Linked Zoho CRM Client_Risks record id';
