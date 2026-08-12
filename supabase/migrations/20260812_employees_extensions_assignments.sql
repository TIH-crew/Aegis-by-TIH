-- Employees, item custody (assign / check-out / check-in), and policy section extensions

create table if not exists public.portal_employees (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  full_name text not null,
  job_title text,
  email text,
  phone text,
  whatsapp_number text not null,
  employee_number text,
  branch_id uuid references public.portal_branches(id) on delete set null,
  image_url text,
  status text not null default 'active' check (status in ('active', 'inactive')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists portal_employees_account_id_idx
  on public.portal_employees (account_id);

create index if not exists portal_employees_branch_id_idx
  on public.portal_employees (branch_id);

alter table public.portal_risk_items
  add column if not exists employee_id uuid references public.portal_employees(id) on delete set null,
  add column if not exists item_extensions jsonb not null default '[]'::jsonb,
  add column if not exists assignment_status text not null default 'unassigned'
    check (assignment_status in ('unassigned', 'assigned', 'checked_out'));

create index if not exists portal_risk_items_employee_id_idx
  on public.portal_risk_items (employee_id);

comment on column public.portal_risk_items.item_extensions is
  'Selected insurance extensions for this risk item (credit shortfall, windscreen, etc).';

comment on column public.portal_risk_items.assignment_status is
  'Custody state: unassigned, assigned to an employee, or temporarily checked out.';

alter table public.portal_policies
  add column if not exists section_extensions jsonb not null default '[]'::jsonb;

comment on column public.portal_policies.section_extensions is
  'Policy-level insurance extensions grouped by schedule section (car hire, SASRIA, roadside assist).';

create table if not exists public.portal_item_assignments (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references public.portal_accounts(id) on delete cascade,
  risk_item_id uuid not null references public.portal_risk_items(id) on delete cascade,
  employee_id uuid references public.portal_employees(id) on delete set null,
  action text not null check (action in ('assign', 'check_out', 'check_in')),
  status text not null default 'open' check (status in ('open', 'closed')),
  notes text,
  due_at date,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  closed_at timestamptz
);

create index if not exists portal_item_assignments_account_id_idx
  on public.portal_item_assignments (account_id);

create index if not exists portal_item_assignments_item_open_idx
  on public.portal_item_assignments (risk_item_id, status);

alter table public.portal_employees enable row level security;
alter table public.portal_item_assignments enable row level security;

drop policy if exists portal_employees_member_all on public.portal_employees;
create policy portal_employees_member_all on public.portal_employees
  for all to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

drop policy if exists portal_item_assignments_member_all on public.portal_item_assignments;
create policy portal_item_assignments_member_all on public.portal_item_assignments
  for all to authenticated
  using (account_id in (select public.current_account_ids()))
  with check (account_id in (select public.current_account_ids()));

grant select, insert, update, delete on public.portal_employees to authenticated;
grant select, insert, update, delete on public.portal_item_assignments to authenticated;
