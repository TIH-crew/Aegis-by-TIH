-- Workforce: optional Zoho Lead promotion links (parallel to Contacts).
-- Additive only — does not invent Zoho custom fields.

alter table public.portal_employees
  add column if not exists zoho_lead_id text,
  add column if not exists zoho_lead_link_status text not null default 'none',
  add column if not exists zoho_lead_linked_at timestamptz,
  add column if not exists zoho_lead_linked_by uuid references auth.users(id) on delete set null;

do $$ begin
  alter table public.portal_employees drop constraint if exists portal_employees_zoho_lead_link_status_check;
  alter table public.portal_employees add constraint portal_employees_zoho_lead_link_status_check
    check (zoho_lead_link_status in (
      'none','matched','linked','create_pending','failed'
    ));
exception when others then null; end $$;

create index if not exists portal_employees_zoho_lead_idx
  on public.portal_employees (account_id, zoho_lead_id)
  where zoho_lead_id is not null;

-- Allow CRM link rows for Leads (contact id stays required for Contact links).
alter table public.portal_employee_crm_links
  add column if not exists zoho_lead_id text,
  add column if not exists crm_module text not null default 'Contacts';

do $$ begin
  alter table public.portal_employee_crm_links drop constraint if exists portal_employee_crm_links_crm_module_check;
  alter table public.portal_employee_crm_links add constraint portal_employee_crm_links_crm_module_check
    check (crm_module in ('Contacts', 'Leads'));
exception when others then null; end $$;

-- Lead-only rows may leave zoho_contact_id null.
alter table public.portal_employee_crm_links
  alter column zoho_contact_id drop not null;

do $$ begin
  alter table public.portal_employee_crm_links drop constraint if exists portal_employee_crm_links_record_check;
  alter table public.portal_employee_crm_links add constraint portal_employee_crm_links_record_check
    check (
      (crm_module = 'Contacts' and zoho_contact_id is not null)
      or (crm_module = 'Leads' and zoho_lead_id is not null)
    );
exception when others then null; end $$;

create unique index if not exists portal_employee_crm_links_lead_uidx
  on public.portal_employee_crm_links (account_id, employee_id, zoho_lead_id)
  where zoho_lead_id is not null;
