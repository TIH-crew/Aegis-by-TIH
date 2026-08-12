-- Claim broker messaging + schedule item linkage for portal claims
alter table public.portal_claims
  add column if not exists broker_message text,
  add column if not exists voice_note_url text,
  add column if not exists schedule_item_key text,
  add column if not exists schedule_item_name text;

comment on column public.portal_claims.broker_message is 'Optional text note to broker with the claim';
comment on column public.portal_claims.voice_note_url is 'Optional recorded voice note URL for the broker';
