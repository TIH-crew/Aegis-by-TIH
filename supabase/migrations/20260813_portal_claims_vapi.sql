-- Vapi voice claim linkage on portal_claims
alter table public.portal_claims
  add column if not exists vapi_call_id text,
  add column if not exists vapi_transcript text,
  add column if not exists vapi_recording_path text;

create unique index if not exists portal_claims_vapi_call_id_key
  on public.portal_claims (vapi_call_id)
  where vapi_call_id is not null;

comment on column public.portal_claims.vapi_call_id is 'Vapi web call id used for voice-lodged claims (idempotency)';
comment on column public.portal_claims.vapi_transcript is 'Full call transcript from Vapi';
comment on column public.portal_claims.vapi_recording_path is 'Storage path for Vapi mono recording in claim-attachments';
