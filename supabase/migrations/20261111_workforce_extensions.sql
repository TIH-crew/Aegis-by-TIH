-- Workforce extensions: HR fields, invitations, imports, exceptions, CRM links,
-- benefit membership skeleton. Additive on portal_employees — no table replace.

-- ---------------------------------------------------------------------------
-- Extend portal_employees (keep custody FKs intact)
-- ---------------------------------------------------------------------------
alter table public.portal_employees
  add column if not exists first_name text,
  add column if not exists last_name text,
  add column if not exists department text,
  add column if not exists employment_start_date date,
  add column if not exists employment_end_date date,
  add column if not exists invitation_status text not null default 'not_invited',
  add column if not exists invited_at timestamptz,
  add column if not exists activated_at timestamptz,
  add column if not exists user_id uuid references auth.users(id) on delete set null,
  add column if not exists zoho_contact_id text,
  add column if not exists zoho_contact_link_status text not null default 'none',
  add column if not exists zoho_contact_linked_at timestamptz,
  add column if not exists zoho_contact_linked_by uuid references auth.users(id) on delete set null,
  add column if not exists deactivated_at timestamptz,
  add column if not exists deactivation_reason text;

do $$ begin
  alter table public.portal_employees drop constraint if exists portal_employees_invitation_status_check;
  alter table public.portal_employees add constraint portal_employees_invitation_status_check
    check (invitation_status in (
      'not_invited','pending','accepted','expired','revoked'
    ));
exception when others then null; end $$;

do $$ begin
  alter table public.portal_employees drop constraint if exists portal_employees_zoho_contact_link_status_check;
  alter table public.portal_employees add constraint portal_employees_zoho_contact_link_status_check
    check (zoho_contact_link_status in (
      'none','matched','linked','create_pending','failed'
    ));
exception when others then null; end $$;

-- Allow HR imports without WhatsApp (claim QR still works when present)
alter table public.portal_employees
  alter column whatsapp_number drop not null;

alter table public.portal_employees
  alter column whatsapp_number set default '';

update public.portal_employees
set whatsapp_number = coalesce(whatsapp_number, '')
where whatsapp_number is null;

-- Unique employee number per organisation (when provided)
create unique index if not exists portal_employees_account_empno_uidx
  on public.portal_employees (account_id, lower(employee_number))
  where employee_number is not null and length(trim(employee_number)) > 0;

create unique index if not exists portal_employees_account_email_uidx
  on public.portal_employees (account_id, lower(email))
  where email is not null and length(trim(email)) > 0
    and status = 'active';

create index if not exists portal_employees_zoho_contact_idx
  on public.portal_employees (account_id, zoho_contact_id)
  where zoho_contact_id is not null;

-- Backfill names from full_name
update public.portal_employees
set
  first_name = coalesce(nullif(first_name, ''), split_part(trim(full_name), ' ', 1)),
  last_name = coalesce(
    nullif(last_name, ''),
    nullif(trim(substring(trim(full_name) from length(split_part(trim(full_name), ' ', 1)) + 1)), ''),
    split_part(trim(full_name), ' ', 1)
  )
where first_name is null or last_name is null;

-- ---------------------------------------------------------------------------
-- Employee activation invites (distinct from portal_invites / CRM login)
-- ---------------------------------------------------------------------------
create table if not exists public.portal_employee_invites (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  employee_id uuid not null references public.portal_employees(id) on delete cascade,
  email text not null,
  token_hash text not null,
  status text not null default 'pending'
    check (status in ('pending','accepted','expired','revoked')),
  invited_by uuid references auth.users(id) on delete set null,
  expires_at timestamptz not null,
  accepted_at timestamptz,
  created_at timestamptz not null default now(),
  unique (account_id, token_hash)
);

create index if not exists portal_employee_invites_employee_idx
  on public.portal_employee_invites (employee_id, status);

-- ---------------------------------------------------------------------------
-- Bulk import
-- ---------------------------------------------------------------------------
create table if not exists public.portal_employee_import_batches (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  file_name text not null,
  source_hash text,
  status text not null default 'uploaded'
    check (status in ('uploaded','mapped','previewed','importing','completed','failed')),
  column_map jsonb not null default '{}'::jsonb,
  row_count int not null default 0,
  success_count int not null default 0,
  error_count int not null default 0,
  skipped_count int not null default 0,
  uploaded_by uuid references auth.users(id) on delete set null,
  result_report jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  completed_at timestamptz
);

create unique index if not exists portal_employee_import_batches_hash_uidx
  on public.portal_employee_import_batches (account_id, source_hash)
  where source_hash is not null;

create table if not exists public.portal_employee_import_rows (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  batch_id uuid not null references public.portal_employee_import_batches(id) on delete cascade,
  row_no int not null,
  source_key text,
  payload jsonb not null default '{}'::jsonb,
  status text not null default 'pending'
    check (status in ('pending','valid','invalid','imported','excluded','duplicate','updated')),
  error_message text,
  employee_id uuid references public.portal_employees(id) on delete set null,
  unique (batch_id, row_no)
);

-- ---------------------------------------------------------------------------
-- Broker review-by-exception
-- ---------------------------------------------------------------------------
create table if not exists public.portal_workforce_exceptions (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  exception_type text not null check (exception_type in (
    'suspected_duplicate',
    'conflicting_employment',
    'unusual_bulk_change',
    'unresolved_validation',
    'disputed_benefit',
    'benefit_adviser_review',
    'other'
  )),
  severity text not null default 'medium'
    check (severity in ('low','medium','high','critical')),
  status text not null default 'open'
    check (status in ('open','assigned','resolved','dismissed')),
  employee_id uuid references public.portal_employees(id) on delete set null,
  import_batch_id uuid references public.portal_employee_import_batches(id) on delete set null,
  title text not null,
  details jsonb not null default '{}'::jsonb,
  assigned_to uuid references auth.users(id) on delete set null,
  resolution_notes text,
  resolved_by uuid references auth.users(id) on delete set null,
  resolved_at timestamptz,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists portal_workforce_exceptions_account_status_idx
  on public.portal_workforce_exceptions (account_id, status);

-- ---------------------------------------------------------------------------
-- CRM Contact linkage (idempotent; employee remains in Supabase)
-- ---------------------------------------------------------------------------
create table if not exists public.portal_employee_crm_links (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  employee_id uuid not null references public.portal_employees(id) on delete cascade,
  zoho_contact_id text not null,
  link_status text not null default 'linked'
    check (link_status in ('matched','linked','failed')),
  link_method text not null default 'broker_promote'
    check (link_method in ('broker_promote','manual_link','import')),
  idempotency_key text not null,
  sync_meta jsonb not null default '{}'::jsonb,
  linked_by uuid references auth.users(id) on delete set null,
  linked_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  unique (account_id, idempotency_key),
  unique (account_id, employee_id, zoho_contact_id)
);

-- ---------------------------------------------------------------------------
-- Benefit membership skeleton (no provider integrations)
-- ---------------------------------------------------------------------------
create table if not exists public.portal_employee_benefit_memberships (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  employee_id uuid not null references public.portal_employees(id) on delete cascade,
  benefit_type text not null check (benefit_type in (
    'pension','provident','medical_aid','gap_cover',
    'group_life','disability','funeral','other'
  )),
  employment_verified boolean not null default false,
  aegis_activation_status text not null default 'not_activated'
    check (aegis_activation_status in ('not_activated','pending','active','revoked')),
  enrolment_status text not null default 'not_enrolled'
    check (enrolment_status in ('not_enrolled','hr_declared','pending','enrolled','ended')),
  provider_confirmation_status text not null default 'unconfirmed'
    check (provider_confirmation_status in ('unconfirmed','pending','confirmed','declined')),
  provider_name text,
  membership_number text,
  notes text,
  -- Sensitive balances / claims must NOT be stored here in Phase 1
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (employee_id, benefit_type)
);

-- ---------------------------------------------------------------------------
-- Workforce audit events (immutable)
-- ---------------------------------------------------------------------------
create table if not exists public.portal_workforce_audit_events (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  employee_id uuid references public.portal_employees(id) on delete set null,
  event_type text not null,
  summary text not null,
  detail jsonb not null default '{}'::jsonb,
  actor_user_id uuid references auth.users(id) on delete set null,
  actor_label text,
  created_at timestamptz not null default now()
);

create index if not exists portal_workforce_audit_employee_idx
  on public.portal_workforce_audit_events (employee_id, created_at desc);

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------
do $$
declare
  t text;
begin
  foreach t in array array[
    'portal_employee_invites',
    'portal_employee_import_batches',
    'portal_employee_import_rows',
    'portal_workforce_exceptions',
    'portal_employee_crm_links',
    'portal_employee_benefit_memberships',
    'portal_workforce_audit_events'
  ]
  loop
    execute format('alter table public.%I enable row level security', t);
    execute format('drop policy if exists %I_member_all on public.%I', t, t);
    execute format(
      'create policy %I_member_all on public.%I for all to authenticated
         using (account_id in (select public.current_account_ids()))
         with check (account_id in (select public.current_account_ids()))',
      t, t
    );
    execute format('grant select, insert, update, delete on public.%I to authenticated', t);
  end loop;
end $$;
