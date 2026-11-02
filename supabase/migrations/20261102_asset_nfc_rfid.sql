alter table public.portal_risk_items
  add column if not exists nfc_uid text,
  add column if not exists rfid_epc text;

alter table public.aam_assets
  add column if not exists nfc_uid text,
  add column if not exists rfid_epc text;

create unique index if not exists portal_risk_items_account_nfc_uidx
  on public.portal_risk_items (account_id, nfc_uid)
  where nfc_uid is not null;

create unique index if not exists portal_risk_items_account_rfid_uidx
  on public.portal_risk_items (account_id, rfid_epc)
  where rfid_epc is not null;

create unique index if not exists aam_assets_account_nfc_uidx
  on public.aam_assets (account_id, nfc_uid)
  where nfc_uid is not null;

create unique index if not exists aam_assets_account_rfid_uidx
  on public.aam_assets (account_id, rfid_epc)
  where rfid_epc is not null;
