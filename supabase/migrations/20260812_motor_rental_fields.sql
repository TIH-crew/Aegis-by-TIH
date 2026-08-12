alter table public.portal_risk_items
  add column if not exists is_rental boolean not null default false,
  add column if not exists rental_company text,
  add column if not exists rental_start_date date,
  add column if not exists rental_end_date date;

comment on column public.portal_risk_items.is_rental is
  'True when the motor vehicle is a rental (hire) vehicle';
comment on column public.portal_risk_items.rental_company is
  'Company the vehicle is rented from';
comment on column public.portal_risk_items.rental_start_date is
  'Rental hire start date';
comment on column public.portal_risk_items.rental_end_date is
  'Rental hire end date';
