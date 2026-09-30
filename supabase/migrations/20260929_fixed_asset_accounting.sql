-- Fixed-asset accounting, tax, GL reconciliation, and close period foundation.
-- Additive and reversible: does NOT alter insurance semantics of portal_risk_items.
-- Money columns use numeric(18,4). Application layer must use decimal arithmetic (not float).

-- ---------------------------------------------------------------------------
-- Legal entity profile (extends portal_accounts — never invents financials)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_legal_entity_profiles (
  account_id uuid primary key references public.portal_accounts(id) on delete cascade,
  tax_number text,
  vat_number text,
  financial_year_end_month int not null default 2
    check (financial_year_end_month between 1 and 12),
  functional_currency text not null default 'ZAR',
  accounting_framework text not null default 'ifrs_for_smes'
    check (accounting_framework in ('ifrs', 'ifrs_for_smes', 'sa_gaap_legacy', 'other')),
  accounting_framework_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.aam_legal_entity_profiles is
  'Accounting/tax profile per portal_accounts legal entity. Parent/subsidiary hierarchy remains on portal_accounts.parent_account_id.';

-- ---------------------------------------------------------------------------
-- Portal workspace roles (server-side capability hints; UI must not be sole gate)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_portal_roles (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  role_key text not null check (role_key in (
    'client_viewer',
    'asset_manager',
    'finance_preparer',
    'finance_approver',
    'tax_reviewer',
    'insurance_broker',
    'auditor',
    'platform_admin'
  )),
  created_at timestamptz not null default now(),
  unique (account_id, user_id, role_key)
);

create index if not exists aam_portal_roles_account_user_idx
  on public.aam_portal_roles (account_id, user_id);

-- ---------------------------------------------------------------------------
-- Book policies (versioned)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_book_policies (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  name text not null,
  asset_class text not null,
  method text not null check (method in ('straight_line', 'reducing_balance', 'units_of_production')),
  useful_life_months int,
  residual_value_pct numeric(8,4),
  residual_value_amount numeric(18,4),
  first_period_convention text not null default 'full_month'
    check (first_period_convention in ('full_month', 'pro_rata_days', 'half_year')),
  day_count_convention text not null default 'actual_365'
    check (day_count_convention in ('actual_365', '30_360')),
  gl_asset_account text,
  gl_accum_dep_account text,
  gl_dep_expense_account text,
  version int not null default 1,
  effective_from date not null,
  effective_to date,
  status text not null default 'draft'
    check (status in ('draft', 'approved', 'superseded')),
  approved_by uuid references auth.users(id) on delete set null,
  approved_at timestamptz,
  source_reference text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists aam_book_policies_account_class_idx
  on public.aam_book_policies (account_id, asset_class, status);

-- ---------------------------------------------------------------------------
-- Assets (distinct from insurance risk items)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_assets (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_tag text not null,
  description text not null,
  asset_class text not null,
  asset_type text not null default 'tangible'
    check (asset_type in ('tangible', 'intangible')),
  ownership_type text not null default 'owned'
    check (ownership_type in (
      'owned',
      'leased_rou',
      'hired_in',
      'third_party',
      'client_property',
      'insurance_only'
    )),
  branch_id uuid references public.portal_branches(id) on delete set null,
  location_text text,
  custodian_employee_id uuid references public.portal_employees(id) on delete set null,
  serial_number text,
  imei text,
  vin text,
  acquisition_date date,
  available_for_use_date date,
  tax_brought_into_use_date date,
  status text not null default 'draft'
    check (status in (
      'draft',
      'pending_capitalisation',
      'active',
      'held_for_sale',
      'disposed',
      'written_off',
      'insurance_only'
    )),
  quantity numeric(18,4) not null default 1,
  unit_of_measure text not null default 'ea',
  parent_asset_id uuid references public.aam_assets(id) on delete set null,
  book_policy_id uuid references public.aam_book_policies(id) on delete set null,
  -- Optional link to insurance risk item — NEVER copy unit_cost as acquisition cost
  portal_risk_item_id uuid unique references public.portal_risk_items(id) on delete set null,
  capitalised_cost numeric(18,4),
  currency text not null default 'ZAR',
  replacement_value numeric(18,4),
  replacement_value_date date,
  replacement_value_source text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (account_id, asset_tag)
);

create index if not exists aam_assets_account_status_idx
  on public.aam_assets (account_id, status);
create index if not exists aam_assets_branch_idx
  on public.aam_assets (account_id, branch_id);
create index if not exists aam_assets_serial_idx
  on public.aam_assets (account_id, serial_number);

comment on column public.aam_assets.portal_risk_item_id is
  'Optional link to insurance schedule item. Insured/declared value stays on portal_risk_items; never treat as book cost.';

create table if not exists public.aam_asset_components (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  component_tag text not null,
  description text not null,
  capitalised_cost numeric(18,4) not null,
  useful_life_months int,
  residual_value_amount numeric(18,4),
  book_policy_id uuid references public.aam_book_policies(id) on delete set null,
  status text not null default 'active'
    check (status in ('active', 'replaced', 'disposed')),
  created_at timestamptz not null default now(),
  unique (asset_id, component_tag)
);

-- ---------------------------------------------------------------------------
-- Acquisitions / capitalisations
-- ---------------------------------------------------------------------------
create table if not exists public.aam_acquisitions (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  supplier_name text,
  invoice_number text,
  purchase_order text,
  invoice_date date,
  currency text not null default 'ZAR',
  status text not null default 'draft'
    check (status in ('draft', 'pending_approval', 'approved', 'rejected', 'cancelled')),
  duplicate_check_key text,
  notes text,
  created_by uuid references auth.users(id) on delete set null,
  approved_by uuid references auth.users(id) on delete set null,
  approved_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists aam_acquisitions_dup_key_idx
  on public.aam_acquisitions (account_id, duplicate_check_key)
  where duplicate_check_key is not null;

create table if not exists public.aam_acquisition_lines (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  acquisition_id uuid not null references public.aam_acquisitions(id) on delete cascade,
  line_no int not null,
  description text not null,
  quantity numeric(18,4) not null default 1,
  gross_amount numeric(18,4) not null,
  vat_amount numeric(18,4) not null default 0,
  recoverable_vat numeric(18,4) not null default 0,
  non_recoverable_vat numeric(18,4) not null default 0,
  directly_attributable_costs numeric(18,4) not null default 0,
  capitalised_cost numeric(18,4),
  classification text not null default 'needs_classification'
    check (classification in (
      'fixed_asset',
      'expense',
      'inventory',
      'intangible',
      'leased_asset',
      'insurance_only',
      'needs_classification'
    )),
  asset_class text,
  branch_id uuid references public.portal_branches(id) on delete set null,
  serial_number text,
  proposed_asset_id uuid references public.aam_assets(id) on delete set null,
  unique (acquisition_id, line_no)
);

-- ---------------------------------------------------------------------------
-- Movements (effective-dated history)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_asset_movements (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  movement_type text not null check (movement_type in (
    'acquisition',
    'capitalisation',
    'assignment',
    'transfer',
    'check_out',
    'check_in',
    'improvement',
    'repair',
    'impairment',
    'revaluation',
    'write_off',
    'sale',
    'scrap',
    'theft_loss',
    'disposal',
    'partial_disposal',
    'component_replacement',
    'insurance_review'
  )),
  effective_date date not null,
  recorded_at timestamptz not null default now(),
  actor_user_id uuid references auth.users(id) on delete set null,
  approver_user_id uuid references auth.users(id) on delete set null,
  approved_at timestamptz,
  reason text,
  before_state jsonb not null default '{}'::jsonb,
  after_state jsonb not null default '{}'::jsonb,
  amount numeric(18,4),
  currency text default 'ZAR',
  requires_insurance_endorsement boolean not null default false,
  capital_improvement boolean not null default false
);

create index if not exists aam_asset_movements_asset_eff_idx
  on public.aam_asset_movements (asset_id, effective_date);

-- ---------------------------------------------------------------------------
-- Book schedule lines (immutable calculation results)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_book_schedule_lines (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  component_id uuid references public.aam_asset_components(id) on delete set null,
  period_key text not null,
  period_start date not null,
  period_end date not null,
  book_policy_id uuid not null references public.aam_book_policies(id),
  book_policy_version int not null,
  opening_gross_cost numeric(18,4) not null,
  additions numeric(18,4) not null default 0,
  disposals numeric(18,4) not null default 0,
  closing_gross_cost numeric(18,4) not null,
  opening_accum_dep numeric(18,4) not null,
  current_charge numeric(18,4) not null,
  closing_accum_dep numeric(18,4) not null,
  impairment numeric(18,4) not null default 0,
  closing_nbv numeric(18,4) not null,
  inputs jsonb not null default '{}'::jsonb,
  calculation_trace jsonb not null default '{}'::jsonb,
  status text not null default 'draft'
    check (status in ('draft', 'approved', 'locked')),
  run_id uuid,
  created_at timestamptz not null default now(),
  unique (asset_id, component_id, period_key, book_policy_version)
);

create index if not exists aam_book_schedule_period_idx
  on public.aam_book_schedule_lines (account_id, period_key);

-- ---------------------------------------------------------------------------
-- Tax rules (versioned, effective-dated — rates live in config JSON, not code)
-- ---------------------------------------------------------------------------
create table if not exists public.aam_tax_rules (
  id uuid primary key default gen_random_uuid(),
  jurisdiction text not null default 'ZA',
  legal_provision text not null,
  name text not null,
  qualification_criteria jsonb not null default '{}'::jsonb,
  config jsonb not null default '{}'::jsonb,
  exclusions jsonb not null default '[]'::jsonb,
  evidence_requirements jsonb not null default '[]'::jsonb,
  source_reference text not null,
  tax_year_from int,
  tax_year_to int,
  effective_from date not null,
  effective_to date,
  version int not null default 1,
  status text not null default 'draft'
    check (status in ('draft', 'approved', 'superseded', 'expired')),
  approved_by uuid references auth.users(id) on delete set null,
  approved_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists aam_tax_rules_provision_idx
  on public.aam_tax_rules (jurisdiction, legal_provision, status);

create table if not exists public.aam_tax_asset_positions (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  tax_rule_id uuid references public.aam_tax_rules(id) on delete set null,
  classification_status text not null default 'needs_tax_classification'
    check (classification_status in (
      'needs_tax_classification',
      'provisional',
      'approved',
      'rejected',
      'overridden'
    )),
  tax_cost_base numeric(18,4),
  prior_allowances numeric(18,4) not null default 0,
  remaining_tax_value numeric(18,4),
  brought_into_use_date date,
  override_reason text,
  override_by uuid references auth.users(id) on delete set null,
  override_at timestamptz,
  reviewer_user_id uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  evidence_refs jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (asset_id)
);

create table if not exists public.aam_tax_schedule_lines (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  tax_year int not null,
  tax_rule_id uuid not null references public.aam_tax_rules(id),
  tax_rule_version int not null,
  opening_tax_value numeric(18,4) not null,
  proposed_allowance numeric(18,4) not null,
  closing_tax_value numeric(18,4) not null,
  inputs jsonb not null default '{}'::jsonb,
  calculation_trace jsonb not null default '{}'::jsonb,
  status text not null default 'provisional'
    check (status in ('provisional', 'approved', 'rejected')),
  reviewer_user_id uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  created_at timestamptz not null default now(),
  unique (asset_id, tax_year, tax_rule_version)
);

create table if not exists public.aam_vat_treatments (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid references public.aam_assets(id) on delete set null,
  acquisition_line_id uuid references public.aam_acquisition_lines(id) on delete set null,
  invoice_vat_amount numeric(18,4) not null default 0,
  recoverable_vat numeric(18,4) not null default 0,
  non_recoverable_vat numeric(18,4) not null default 0,
  decision text not null default 'needs_review'
    check (decision in (
      'fully_recoverable',
      'partially_recoverable',
      'not_recoverable',
      'needs_review',
      'motor_car_restriction'
    )),
  basis text,
  evidence_refs jsonb not null default '[]'::jsonb,
  disposal_vat_review text,
  decided_by uuid references auth.users(id) on delete set null,
  decided_at timestamptz,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Insurance links (asset ↔ schedule) — matching confidence, never silent merge
-- ---------------------------------------------------------------------------
create table if not exists public.aam_insurance_links (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_id uuid not null references public.aam_assets(id) on delete cascade,
  portal_risk_item_id uuid references public.portal_risk_items(id) on delete set null,
  policy_id uuid references public.portal_policies(id) on delete set null,
  schedule_item_key text,
  insured_interest text,
  insured_value numeric(18,4),
  section text,
  effective_from date,
  effective_to date,
  match_confidence text not null default 'unmatched'
    check (match_confidence in ('exact', 'high', 'proposed', 'unmatched', 'rejected')),
  match_method text,
  reviewer_user_id uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists aam_insurance_links_asset_idx
  on public.aam_insurance_links (asset_id);

-- ---------------------------------------------------------------------------
-- GL mapping, imports, lines
-- ---------------------------------------------------------------------------
create table if not exists public.aam_gl_mappings (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  asset_class text not null,
  gl_asset_account text,
  gl_accum_dep_account text,
  gl_dep_expense_account text,
  status text not null default 'awaiting_mapping'
    check (status in ('mapped', 'awaiting_mapping', 'not_connected')),
  unique (account_id, asset_class)
);

create table if not exists public.aam_gl_imports (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  source_system text not null,
  period_key text not null,
  import_batch_key text not null,
  file_name text,
  status text not null default 'imported'
    check (status in ('imported', 'failed', 'superseded')),
  imported_by uuid references auth.users(id) on delete set null,
  imported_at timestamptz not null default now(),
  unique (account_id, import_batch_key)
);

create table if not exists public.aam_gl_lines (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  import_id uuid not null references public.aam_gl_imports(id) on delete cascade,
  period_key text not null,
  gl_account text not null,
  amount numeric(18,4) not null,
  currency text not null default 'ZAR',
  source_identifier text,
  dedupe_key text not null,
  narrative text,
  unique (account_id, dedupe_key)
);

-- ---------------------------------------------------------------------------
-- Reconciliations & exceptions
-- ---------------------------------------------------------------------------
create table if not exists public.aam_reconciliations (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  recon_type text not null check (recon_type in (
    'physical_to_register',
    'subledger_to_gl',
    'book_to_tax',
    'assets_to_insurance'
  )),
  period_key text not null,
  status text not null default 'open'
    check (status in ('open', 'in_review', 'resolved', 'approved')),
  created_at timestamptz not null default now(),
  approved_by uuid references auth.users(id) on delete set null,
  approved_at timestamptz
);

create table if not exists public.aam_reconciliation_exceptions (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  reconciliation_id uuid not null references public.aam_reconciliations(id) on delete cascade,
  asset_id uuid references public.aam_assets(id) on delete set null,
  scope_key text,
  register_amount numeric(18,4),
  external_amount numeric(18,4),
  difference numeric(18,4),
  tolerance numeric(18,4) not null default 0,
  status text not null default 'open'
    check (status in (
      'open',
      'assigned',
      'in_review',
      'resolved',
      'accepted_difference',
      'approved'
    )),
  owner_user_id uuid references auth.users(id) on delete set null,
  reason text,
  resolution text,
  evidence_refs jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  resolved_at timestamptz,
  approved_at timestamptz
);

create index if not exists aam_recon_exceptions_status_idx
  on public.aam_reconciliation_exceptions (account_id, status);

-- ---------------------------------------------------------------------------
-- Close periods
-- ---------------------------------------------------------------------------
create table if not exists public.aam_close_periods (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  period_key text not null,
  period_start date not null,
  period_end date not null,
  status text not null default 'draft'
    check (status in ('draft', 'in_review', 'approved', 'locked', 'reopened')),
  snapshot jsonb,
  prepared_by uuid references auth.users(id) on delete set null,
  approved_by uuid references auth.users(id) on delete set null,
  locked_at timestamptz,
  reopen_reason text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (account_id, period_key)
);

-- ---------------------------------------------------------------------------
-- Documents, approvals, audit
-- ---------------------------------------------------------------------------
create table if not exists public.aam_documents (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  entity_type text not null,
  entity_id uuid not null,
  file_name text not null,
  file_url text not null,
  doc_type text,
  uploaded_by uuid references auth.users(id) on delete set null,
  uploaded_at timestamptz not null default now()
);

create table if not exists public.aam_approvals (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  entity_type text not null,
  entity_id uuid not null,
  action text not null,
  decision text not null check (decision in ('approved', 'rejected')),
  actor_user_id uuid references auth.users(id) on delete set null,
  reason text,
  created_at timestamptz not null default now()
);

create table if not exists public.aam_audit_events (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  entity_type text not null,
  entity_id uuid,
  event_type text not null,
  actor_user_id uuid references auth.users(id) on delete set null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists aam_audit_events_account_created_idx
  on public.aam_audit_events (account_id, created_at desc);

-- ---------------------------------------------------------------------------
-- Seed ZA tax rule TEMPLATES (draft — require Tax approval before use)
-- Rates/lives live in config JSON; application must not hard-code them.
-- ---------------------------------------------------------------------------
insert into public.aam_tax_rules (
  jurisdiction, legal_provision, name, qualification_criteria, config,
  exclusions, evidence_requirements, source_reference,
  effective_from, status
)
select * from (values
  (
    'ZA',
    's11(e)',
    'Wear and tear — general plant & machinery (template)',
    '{"requires_brought_into_use":true,"asset_types":["tangible"],"notes":"Candidate only — confirm SARS Interpretation Note and facts."}'::jsonb,
    '{"method":"straight_line_write_off","write_off_years":null,"write_off_pct_per_year":null,"requires_approved_life_table":true}'::jsonb,
    '["private_use_portion","non_qualifying_assets"]'::jsonb,
    '["invoice","brought_into_use_evidence","asset_register"]'::jsonb,
    'https://www.sars.gov.za/lapd-intr-in-2012-47-wear-and-tear-depreciation-allowance/',
    date '2020-01-01',
    'draft'
  ),
  (
    'ZA',
    's11(e)_motor',
    'Wear and tear — motor vehicles (template)',
    '{"requires_brought_into_use":true,"asset_classes":["Motor"],"notes":"Confirm SARS prescribed write-off periods; private use adjustments may apply."}'::jsonb,
    '{"method":"straight_line_write_off","write_off_years":null,"requires_approved_life_table":true}'::jsonb,
    '["private_use"]'::jsonb,
    '["invoice","logbook_if_required","brought_into_use_evidence"]'::jsonb,
    'https://www.sars.gov.za/lapd-intr-in-2012-47-wear-and-tear-depreciation-allowance/',
    date '2020-01-01',
    'draft'
  ),
  (
    'ZA',
    'vat_motor_car_restriction',
    'VAT input restriction — defined motor car (template)',
    '{"applies_to":"acquisition_vat","notes":"Business use alone does not prove recoverable input VAT on a motor car as defined."}'::jsonb,
    '{"default_decision":"needs_review","suggested_decision_if_motor_car":"motor_car_restriction"}'::jsonb,
    '[]'::jsonb,
    '["invoice","vehicle_classification_memo"]'::jsonb,
    'https://www.sars.gov.za/legal-pub-guide-vat404-vat-404-guide-for-vendors/',
    date '2020-01-01',
    'draft'
  )
) as v(jurisdiction, legal_provision, name, qualification_criteria, config, exclusions, evidence_requirements, source_reference, effective_from, status)
where not exists (
  select 1 from public.aam_tax_rules r
  where r.legal_provision = v.legal_provision and r.version = 1 and r.jurisdiction = 'ZA'
);

-- ---------------------------------------------------------------------------
-- RLS — tenant scope via current_account_ids()
-- ---------------------------------------------------------------------------
do $$
declare
  t text;
begin
  foreach t in array array[
    'aam_legal_entity_profiles',
    'aam_portal_roles',
    'aam_book_policies',
    'aam_assets',
    'aam_asset_components',
    'aam_acquisitions',
    'aam_acquisition_lines',
    'aam_asset_movements',
    'aam_book_schedule_lines',
    'aam_tax_asset_positions',
    'aam_tax_schedule_lines',
    'aam_vat_treatments',
    'aam_insurance_links',
    'aam_gl_mappings',
    'aam_gl_imports',
    'aam_gl_lines',
    'aam_reconciliations',
    'aam_reconciliation_exceptions',
    'aam_close_periods',
    'aam_documents',
    'aam_approvals',
    'aam_audit_events'
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
    execute format(
      'grant select, insert, update, delete on public.%I to authenticated',
      t
    );
  end loop;
end $$;

-- Tax rules are shared templates (read for authenticated); writes via service role / admin
alter table public.aam_tax_rules enable row level security;
drop policy if exists aam_tax_rules_select on public.aam_tax_rules;
create policy aam_tax_rules_select on public.aam_tax_rules
  for select to authenticated
  using (true);
grant select on public.aam_tax_rules to authenticated;
