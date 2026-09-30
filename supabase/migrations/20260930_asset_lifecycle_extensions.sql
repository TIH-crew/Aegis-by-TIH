-- Asset lifecycle extensions: documents, valuations, incidents/cases, barcodes,
-- bulk import, physical audits. Additive on existing aam_* foundation.

-- ---------------------------------------------------------------------------
-- Processing status & barcode on assets
-- ---------------------------------------------------------------------------
alter table public.aam_assets
  add column if not exists processing_status text not null default 'incomplete'
    check (processing_status in (
      'incomplete',
      'awaiting_documents',
      'finance_review',
      'capitalised',
      'in_use',
      'under_review',
      'write_off_pending',
      'disposed',
      'replaced'
    )),
  add column if not exists barcode text,
  add column if not exists barcode_kind text not null default 'physical'
    check (barcode_kind in ('physical', 'internal_only')),
  add column if not exists barcode_reason text,
  add column if not exists condition_code text
    check (condition_code is null or condition_code in (
      'excellent','good','fair','poor','damaged','unusable'
    )),
  add column if not exists last_verified_at timestamptz,
  add column if not exists market_value numeric(18,4),
  add column if not exists market_value_date date,
  add column if not exists market_value_source text,
  add column if not exists market_value_reviewer uuid references auth.users(id) on delete set null;

create unique index if not exists aam_assets_account_barcode_uidx
  on public.aam_assets (account_id, barcode)
  where barcode is not null;

-- ---------------------------------------------------------------------------
-- Document requirements (configurable by class + event)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_document_requirements (
  id uuid primary key default gen_random_uuid(),
  account_id uuid references public.portal_accounts(id) on delete cascade,
  asset_class text,
  event_type text not null,
  doc_type text not null,
  label text not null,
  mandatory boolean not null default false,
  sort_order int not null default 0,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create index if not exists aam_doc_req_lookup_idx
  on public.aam_document_requirements (account_id, asset_class, event_type);

-- Tenant-scoped docs (extends generic aam_documents with verification)
alter table public.aam_documents
  add column if not exists doc_type text,
  add column if not exists verification_status text not null default 'unverified'
    check (verification_status in ('unverified','verified','rejected','superseded')),
  add column if not exists version int not null default 1,
  add column if not exists supersedes_id uuid references public.aam_documents(id) on delete set null,
  add column if not exists source text,
  add column if not exists event_type text,
  add column if not exists incident_id uuid,
  add column if not exists notes text;

-- ---------------------------------------------------------------------------
-- Valuation history (never derive market/replacement from depreciation)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_valuations (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  valuation_kind text not null check (valuation_kind in (
    'market','replacement','insured','other'
  )),
  amount numeric(18,4) not null,
  currency text not null default 'ZAR',
  valuation_date date not null,
  source text not null,
  reviewer_user_id uuid references auth.users(id) on delete set null,
  status text not null default 'draft'
    check (status in ('draft','approved','superseded')),
  notes text,
  created_at timestamptz not null default now(),
  approved_at timestamptz
);

create index if not exists aam_valuations_asset_idx
  on public.aam_valuations (asset_id, valuation_kind, valuation_date desc);

-- ---------------------------------------------------------------------------
-- Incidents / write-off cases (do NOT auto-dispose)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_incidents (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  incident_number text not null,
  incident_type text not null check (incident_type in (
    'accident','theft','fire','damage','breakdown','missing',
    'obsolete','end_of_useful_life','other'
  )),
  incident_date date not null,
  location_text text,
  description text not null,
  reporter_user_id uuid references auth.users(id) on delete set null,
  reporter_name text,
  still_usable boolean,
  held_at text,
  estimated_repair_cost numeric(18,4),
  estimated_salvage_value numeric(18,4),
  replacement_needed boolean,
  status text not null default 'reported'
    check (status in (
      'reported','investigating','repairable','potential_total_loss',
      'approved_outcome','completed','cancelled'
    )),
  outcome text check (outcome is null or outcome in (
    'repair','impairment_review','partial_write_off','full_write_off',
    'sale','scrap','theft_loss','returned_to_use'
  )),
  insurance_status text not null default 'not_submitted'
    check (insurance_status in (
      'not_submitted','submitted','assessing','repair_authorised',
      'total_loss_accepted','declined','settled','closed','review_required'
    )),
  portal_claim_id uuid references public.portal_claims(id) on delete set null,
  policy_id uuid references public.portal_policies(id) on delete set null,
  claim_number text,
  insurer_name text,
  excess_amount numeric(18,4),
  assessor_name text,
  coverage_decision text,
  estimated_settlement numeric(18,4),
  final_settlement numeric(18,4),
  settlement_date date,
  salvage_decision text,
  finance_status text not null default 'needs_review'
    check (finance_status in ('needs_review','in_review','approved','not_applicable')),
  tax_status text not null default 'needs_review'
    check (tax_status in ('needs_review','in_review','approved','provisional','not_applicable')),
  closed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (account_id, incident_number)
);

create index if not exists aam_incidents_asset_idx on public.aam_incidents (asset_id, status);
create index if not exists aam_incidents_account_status_idx on public.aam_incidents (account_id, status);

-- Linked tasks for Insurance / Finance / Tax on the same incident
create table if not exists public.aam_case_tasks (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  incident_id uuid not null references public.aam_incidents(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  team text not null check (team in ('finance','tax','insurance','asset','operations')),
  title text not null,
  description text,
  status text not null default 'open'
    check (status in ('open','in_progress','blocked','done','cancelled')),
  owner_user_id uuid references auth.users(id) on delete set null,
  owner_label text,
  due_date date,
  checklist_step int,
  idempotency_key text not null,
  completed_at timestamptz,
  completed_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  unique (account_id, idempotency_key)
);

create index if not exists aam_case_tasks_incident_idx on public.aam_case_tasks (incident_id, team);

-- Guided checklist steps on an incident
create table if not exists public.aam_case_checklist (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  incident_id uuid not null references public.aam_incidents(id) on delete cascade,
  step_no int not null,
  label text not null,
  status text not null default 'pending'
    check (status in ('pending','in_progress','done','skipped','blocked')),
  owner_label text,
  due_date date,
  completed_at timestamptz,
  unique (incident_id, step_no)
);

-- ---------------------------------------------------------------------------
-- Replacement requests (new asset — never overwrite damaged)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_replacement_requests (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  incident_id uuid not null references public.aam_incidents(id) on delete cascade,
  original_asset_id uuid not null references public.aam_assets(id) on delete cascade,
  new_asset_id uuid references public.aam_assets(id) on delete set null,
  specification text,
  budget_amount numeric(18,4),
  currency text not null default 'ZAR',
  responsible_person text,
  status text not null default 'draft'
    check (status in (
      'draft','pending_approval','approved','ordered','received','cancelled'
    )),
  insurer_action text check (insurer_action is null or insurer_action in (
    'repair','replace_direct','pay_cash','decline','unknown'
  )),
  supplier_quotes jsonb not null default '[]'::jsonb,
  purchase_order text,
  expected_delivery date,
  is_temporary_hire boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Timeline events (immutable readable history)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_timeline_events (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  event_type text not null,
  summary text not null,
  detail text,
  before_values jsonb,
  after_values jsonb,
  actor_user_id uuid references auth.users(id) on delete set null,
  actor_label text,
  effective_date date,
  incident_id uuid references public.aam_incidents(id) on delete set null,
  document_id uuid references public.aam_documents(id) on delete set null,
  audit_id uuid,
  created_at timestamptz not null default now()
);

create index if not exists aam_timeline_asset_idx
  on public.aam_timeline_events (asset_id, created_at desc);

-- ---------------------------------------------------------------------------
-- Bulk import batches
-- ---------------------------------------------------------------------------
create table if not exists public.aam_import_batches (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  file_name text not null,
  file_url text,
  source_hash text,
  status text not null default 'uploaded'
    check (status in ('uploaded','mapped','previewed','importing','completed','failed')),
  column_map jsonb not null default '{}'::jsonb,
  value_kind text check (value_kind is null or value_kind in (
    'purchase_cost','insured_value','replacement_value','other','unknown'
  )),
  ownership_type text,
  branch_id uuid references public.portal_branches(id) on delete set null,
  row_count int not null default 0,
  success_count int not null default 0,
  error_count int not null default 0,
  uploaded_by uuid references auth.users(id) on delete set null,
  result_report jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  completed_at timestamptz
);

create unique index if not exists aam_import_batches_hash_uidx
  on public.aam_import_batches (account_id, source_hash)
  where source_hash is not null;

create table if not exists public.aam_import_rows (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  batch_id uuid not null references public.aam_import_batches(id) on delete cascade,
  row_no int not null,
  source_key text,
  payload jsonb not null default '{}'::jsonb,
  status text not null default 'pending'
    check (status in ('pending','valid','invalid','imported','excluded','duplicate')),
  error_message text,
  asset_id uuid references public.aam_assets(id) on delete set null,
  unique (batch_id, row_no)
);

-- ---------------------------------------------------------------------------
-- Physical audits
-- ---------------------------------------------------------------------------
create table if not exists public.aam_audits (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  name text not null,
  purpose text,
  status text not null default 'draft'
    check (status in (
      'draft','scheduled','launched','in_progress','under_review','completed','cancelled'
    )),
  scope jsonb not null default '{}'::jsonb,
  start_at timestamptz,
  submission_deadline timestamptz,
  review_deadline timestamptz,
  timezone text not null default 'Africa/Johannesburg',
  require_photos boolean not null default true,
  require_serial_check boolean not null default true,
  require_location boolean not null default true,
  reminder_schedule jsonb not null default '[]'::jsonb,
  escalation_email text,
  organiser_user_id uuid references auth.users(id) on delete set null,
  asset_snapshot jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  completed_at timestamptz
);

create table if not exists public.aam_audit_assignments (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  audit_id uuid not null references public.aam_audits(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  assignee_employee_id uuid references public.portal_employees(id) on delete set null,
  assignee_user_id uuid references auth.users(id) on delete set null,
  assignee_email text,
  branch_id uuid references public.portal_branches(id) on delete set null,
  branch_manager_user_id uuid references auth.users(id) on delete set null,
  invite_status text not null default 'pending'
    check (invite_status in ('pending','delivered','failed','started','submitted','overdue')),
  created_at timestamptz not null default now(),
  unique (audit_id, asset_id)
);

create table if not exists public.aam_audit_reports (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  audit_id uuid not null references public.aam_audits(id) on delete cascade,
  assignment_id uuid not null references public.aam_audit_assignments(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  status text not null default 'draft'
    check (status in (
      'draft','submitted','clarification','rejected','manager_approved','escalated'
    )),
  possession text check (possession is null or possession in (
    'have','missing','transferred','returned','damaged','in_repair',
    'write_off_potential','incorrectly_assigned'
  )),
  location_confirmed text,
  barcode_confirmed text,
  condition_code text,
  comments text,
  repairs_none boolean not null default false,
  repairs jsonb not null default '[]'::jsonb,
  photo_urls jsonb not null default '[]'::jsonb,
  attestation_name text,
  attested_at timestamptz,
  manager_decision text check (manager_decision is null or manager_decision in (
    'confirmed','clarification','rejected','discrepancy','escalated'
  )),
  manager_reason text,
  manager_user_id uuid references auth.users(id) on delete set null,
  manager_decided_at timestamptz,
  incident_id uuid references public.aam_incidents(id) on delete set null,
  submitted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (assignment_id)
);

create table if not exists public.aam_email_outbox (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  template_key text not null,
  to_email text not null,
  subject text not null,
  body_text text not null,
  payload jsonb not null default '{}'::jsonb,
  idempotency_key text not null,
  status text not null default 'queued'
    check (status in ('queued','sent','failed','skipped_no_provider')),
  attempts int not null default 0,
  last_error text,
  created_at timestamptz not null default now(),
  sent_at timestamptz,
  unique (account_id, idempotency_key)
);

-- FK for incident on documents (added after incidents exist)
do $$
begin
  if not exists (
    select 1 from information_schema.table_constraints
    where constraint_name = 'aam_documents_incident_id_fkey'
  ) then
    alter table public.aam_documents
      add constraint aam_documents_incident_id_fkey
      foreign key (incident_id) references public.aam_incidents(id) on delete set null;
  end if;
exception when others then null;
end $$;

-- ---------------------------------------------------------------------------
-- Default document requirements (global templates; account_id null = system)
-- ---------------------------------------------------------------------------
insert into public.aam_document_requirements (account_id, asset_class, event_type, doc_type, label, mandatory, sort_order)
select * from (values
  (null::uuid, null::text, 'capitalisation', 'invoice', 'Purchase invoice', true, 1),
  (null, null, 'capitalisation', 'proof_of_ownership', 'Proof of ownership', false, 2),
  (null, 'Motor', 'capitalisation', 'registration_papers', 'Vehicle registration papers', true, 3),
  (null, 'Motor', 'capitalisation', 'asset_photos', 'Asset photos', false, 4),
  (null, null, 'assignment', 'assignment_receipt', 'Assignment receipt', false, 1),
  (null, null, 'incident', 'asset_photos', 'Incident photos', true, 1),
  (null, null, 'incident', 'accident_report', 'Accident / incident report', false, 2),
  (null, null, 'claim', 'claim_correspondence', 'Claim correspondence', false, 1),
  (null, null, 'claim', 'assessor_report', 'Assessor report', false, 2),
  (null, null, 'claim', 'insurer_decision', 'Insurer decision', false, 3),
  (null, null, 'claim', 'settlement_statement', 'Settlement statement', false, 4),
  (null, null, 'disposal', 'disposal_approval', 'Disposal approval', true, 1),
  (null, null, 'disposal', 'salvage_documentation', 'Salvage documentation', false, 2),
  (null, null, 'replacement', 'replacement_invoice', 'Replacement invoice', true, 1),
  (null, null, 'valuation', 'valuation', 'Valuation report', true, 1),
  (null, null, 'maintenance', 'maintenance_records', 'Maintenance / repair records', false, 1),
  (null, null, 'finance', 'finance_agreement', 'Finance agreement', false, 1),
  (null, null, 'insurance', 'policy_schedule', 'Policy schedule extract', false, 1),
  (null, null, 'insurance', 'endorsement', 'Endorsement', false, 2)
) as v(account_id, asset_class, event_type, doc_type, label, mandatory, sort_order)
where not exists (
  select 1 from public.aam_document_requirements r
  where r.account_id is null and r.event_type = v.event_type and r.doc_type = v.doc_type
    and coalesce(r.asset_class,'') = coalesce(v.asset_class,'')
);

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------
do $$
declare
  t text;
begin
  foreach t in array array[
    'aam_document_requirements',
    'aam_valuations',
    'aam_incidents',
    'aam_case_tasks',
    'aam_case_checklist',
    'aam_replacement_requests',
    'aam_timeline_events',
    'aam_import_batches',
    'aam_import_rows',
    'aam_audits',
    'aam_audit_assignments',
    'aam_audit_reports',
    'aam_email_outbox'
  ]
  loop
    execute format('alter table public.%I enable row level security', t);
    execute format('drop policy if exists %I_member_all on public.%I', t, t);
    -- document_requirements: allow read of global (account_id is null) + tenant rows
    if t = 'aam_document_requirements' then
      execute format('drop policy if exists %I_select on public.%I', t, t);
      execute format(
        'create policy %I_select on public.%I for select to authenticated
           using (account_id is null or account_id in (select public.current_account_ids()))',
        t, t
      );
      execute format(
        'create policy %I_member_write on public.%I for all to authenticated
           using (account_id in (select public.current_account_ids()))
           with check (account_id in (select public.current_account_ids()))',
        t, t
      );
      execute format('grant select, insert, update, delete on public.%I to authenticated', t);
    else
      execute format(
        'create policy %I_member_all on public.%I for all to authenticated
           using (account_id in (select public.current_account_ids()))
           with check (account_id in (select public.current_account_ids()))',
        t, t
      );
      execute format('grant select, insert, update, delete on public.%I to authenticated', t);
    end if;
  end loop;
end $$;
