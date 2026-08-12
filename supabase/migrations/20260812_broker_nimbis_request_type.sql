alter table public.portal_broker_requests drop constraint if exists portal_broker_requests_request_type_check;
alter table public.portal_broker_requests
  add constraint portal_broker_requests_request_type_check
  check (request_type in ('add_item', 'nimbis_add_item'));
