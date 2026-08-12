BEGIN;
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '334645b8-6761-5908-8847-d89a1e72f8a5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-066',
  'Office Desk 2',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-066',
  'Office Desk 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "66", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "66", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-066'
  AND id <> '334645b8-6761-5908-8847-d89a1e72f8a5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b4b6896d-2a3c-52b4-8c86-2d3a94170813',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-400',
  'Office Desk 3',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-400',
  'Office Desk 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "400", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "400", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-400'
  AND id <> 'b4b6896d-2a3c-52b4-8c86-2d3a94170813';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd0bd497a-df99-580f-affa-fa4f13ee0f9b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-643',
  'Office Desk 3',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-643',
  'Office Desk 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "643", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "643", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-643'
  AND id <> 'd0bd497a-df99-580f-affa-fa4f13ee0f9b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4106ab88-ba7b-5d9e-81ad-562288b8ddfe',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-644',
  'Office Desk 4',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-644',
  'Office Desk 4',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "644", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 4',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "644", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-644'
  AND id <> '4106ab88-ba7b-5d9e-81ad-562288b8ddfe';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b4972bcf-f30a-5535-b644-5606598b3ad4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-197',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-197',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "197", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "197", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-197'
  AND id <> 'b4972bcf-f30a-5535-b644-5606598b3ad4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1cc086b3-ef6b-5446-8e00-53307de86c34',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-261',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-261',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "261", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "261", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-261'
  AND id <> '1cc086b3-ef6b-5446-8e00-53307de86c34';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '481aa616-bf43-5774-9e01-34ee8b35963e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-649',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-649',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "649", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "649", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-649'
  AND id <> '481aa616-bf43-5774-9e01-34ee8b35963e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1bbbdb83-aed6-55a1-9035-2d8a7c2b6a12',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-071',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-071',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "71", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "71", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-071'
  AND id <> '1bbbdb83-aed6-55a1-9035-2d8a7c2b6a12';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '17559bc6-7269-5f02-bc76-096d37714af4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-730',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-730',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "730", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "730", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-730'
  AND id <> '17559bc6-7269-5f02-bc76-096d37714af4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3807bf7f-b443-50d0-b711-326c4ae07c9c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-742',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-742',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "742", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "742", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-742'
  AND id <> '3807bf7f-b443-50d0-b711-326c4ae07c9c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '92fdb0fd-096d-5ed7-8d70-d26134156f81',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-757',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  1800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-757',
  'Office Side Table/Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "757", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Side Table/Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "757", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-757'
  AND id <> '92fdb0fd-096d-5ed7-8d70-d26134156f81';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '97707e01-b4a9-5052-85c0-16b7f38b4fbb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-016',
  'Oil Heater',
  'Contents',
  'Office Contents',
  1300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-016',
  'Oil Heater',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "16", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Oil Heater',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "16", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-016'
  AND id <> '97707e01-b4a9-5052-85c0-16b7f38b4fbb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b4d25d53-0b31-5623-b0c4-48f95d427e93',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-406',
  'Oil Heater',
  'Contents',
  'Office Contents',
  1300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-406',
  'Oil Heater',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "406", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Oil Heater',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "406", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-406'
  AND id <> 'b4d25d53-0b31-5623-b0c4-48f95d427e93';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a857a759-040c-5dc0-9734-1fb62da230ad',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-032',
  'Ottino kettle',
  'Contents',
  'Office Contents',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-032',
  'Ottino kettle',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "32", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Ottino kettle',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "32", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-032'
  AND id <> 'a857a759-040c-5dc0-9734-1fb62da230ad';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '46d3ca56-7c84-58f8-b21f-b1c69cffd328',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-672',
  'Plattinum Kettle',
  'Contents',
  'Office Contents',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-672',
  'Plattinum Kettle',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "672", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Plattinum Kettle',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "672", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-672'
  AND id <> '46d3ca56-7c84-58f8-b21f-b1c69cffd328';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a8075841-9692-5c8e-a028-ef3b5cad5849',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-635',
  'Rolling Storage Cupboard 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-635',
  'Rolling Storage Cupboard 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "635", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Rolling Storage Cupboard 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "635", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-635'
  AND id <> 'a8075841-9692-5c8e-a028-ef3b5cad5849';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f90afee7-f3c1-58f9-9fa4-63edc7e830ba',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-636',
  'Rolling Storage Cupboard 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-636',
  'Rolling Storage Cupboard 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "636", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Rolling Storage Cupboard 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "636", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-636'
  AND id <> 'f90afee7-f3c1-58f9-9fa4-63edc7e830ba';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6e2211ff-f53d-525c-879b-e58128065152',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-637',
  'Rolling Storage Cupboard 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-637',
  'Rolling Storage Cupboard 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "637", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Rolling Storage Cupboard 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "637", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-637'
  AND id <> '6e2211ff-f53d-525c-879b-e58128065152';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '444cb124-8c26-55bd-bbfd-6c7fe62e238d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-638',
  'Rolling Storage Cupboard 4',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-638',
  'Rolling Storage Cupboard 4',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "638", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Rolling Storage Cupboard 4',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "638", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-638'
  AND id <> '444cb124-8c26-55bd-bbfd-6c7fe62e238d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd3e0ad52-a8dc-5002-bcbf-2851983ab59f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-639',
  'Rolling Storage Cupboard 5',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-639',
  'Rolling Storage Cupboard 5',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "639", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Rolling Storage Cupboard 5',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "639", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-639'
  AND id <> 'd3e0ad52-a8dc-5002-bcbf-2851983ab59f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0f4f51b4-364c-56a8-a914-24a2e1ac0394',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-073',
  'Round Table',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-073',
  'Round Table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "73", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Round Table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "73", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-073'
  AND id <> '0f4f51b4-364c-56a8-a914-24a2e1ac0394';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b1f95017-3b28-55bd-b5b1-06e47ea0f035',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-671',
  'Samsung Microwave',
  'Contents',
  'Office Contents',
  2500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-671',
  'Samsung Microwave',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "671", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Samsung Microwave',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "671", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-671'
  AND id <> 'b1f95017-3b28-55bd-b5b1-06e47ea0f035';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd10e96e7-0f12-5744-bcea-e71a6a3fe55b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-504',
  'Samsung Microwave Silver',
  'Contents',
  'Office Contents',
  2500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-504',
  'Samsung Microwave Silver',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "504", "location_code": "F19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Samsung Microwave Silver',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "504", "location_code": "F19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-504'
  AND id <> 'd10e96e7-0f12-5744-bcea-e71a6a3fe55b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '31d68ee1-68a2-5092-8c62-b8be49275481',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-484',
  'Seating Bench 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-484',
  'Seating Bench 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "484", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Seating Bench 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "484", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-484'
  AND id <> '31d68ee1-68a2-5092-8c62-b8be49275481';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c19c4453-ca17-5fc6-b9a4-f408de46daf4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-485',
  'Seating Bench 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-485',
  'Seating Bench 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "485", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Seating Bench 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "485", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-485'
  AND id <> 'c19c4453-ca17-5fc6-b9a4-f408de46daf4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8b15d62e-cf01-57a4-b140-377af3a22ba1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-003',
  'Security Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-003',
  'Security Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "3", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Security Chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "3", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-003'
  AND id <> '8b15d62e-cf01-57a4-b140-377af3a22ba1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'cde1664a-d785-5ef9-b26a-b4cbf00dabb1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-084',
  'Security Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-084',
  'Security Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "84", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Security Chair 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "84", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-084'
  AND id <> 'cde1664a-d785-5ef9-b26a-b4cbf00dabb1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5bf1d805-0132-57c2-b136-e4bd4e5e3b85',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-085',
  'Security Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-085',
  'Security Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "85", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Security Chair 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "85", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-085'
  AND id <> '5bf1d805-0132-57c2-b136-e4bd4e5e3b85';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a4167d1b-49b9-5ac1-8d86-b54b38cd57e8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-083',
  'Security Table 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-083',
  'Security Table 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "83", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Security Table 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "83", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-083'
  AND id <> 'a4167d1b-49b9-5ac1-8d86-b54b38cd57e8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4892de7a-9794-5763-949a-dd62cfca8436',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-024',
  'Sitting/Eating Bench 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-024',
  'Sitting/Eating Bench 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "24", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Sitting/Eating Bench 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "24", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-024'
  AND id <> '4892de7a-9794-5763-949a-dd62cfca8436';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '79909ee5-7b8a-5a35-be43-fac6427e1cdd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-025',
  'Sitting/Eating Bench 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-025',
  'Sitting/Eating Bench 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "25", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Sitting/Eating Bench 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "25", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-025'
  AND id <> '79909ee5-7b8a-5a35-be43-fac6427e1cdd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4870c8b5-960d-53a8-b7b3-a6d8470431ed',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-041',
  'Small Drawer Cupboard 1',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-041',
  'Small Drawer Cupboard 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "41", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Small Drawer Cupboard 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "41", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-041'
  AND id <> '4870c8b5-960d-53a8-b7b3-a6d8470431ed';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '43e7eb28-690e-5ce5-a959-18f6d3acfeea',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-042',
  'Small Drawer Cupboard 2',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-042',
  'Small Drawer Cupboard 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "42", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Small Drawer Cupboard 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "42", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-042'
  AND id <> '43e7eb28-690e-5ce5-a959-18f6d3acfeea';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'adb684fb-fa50-5cac-84d2-10a0bfdf0512',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-043',
  'Small Round side table',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-043',
  'Small Round side table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "43", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Small Round side table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "43", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-043'
  AND id <> 'adb684fb-fa50-5cac-84d2-10a0bfdf0512';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a4f81112-2151-5a34-9909-17602ae71266',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-050',
  'Small Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-050',
  'Small Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "50", "location_code": "G19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Small Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "50", "location_code": "G19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-050'
  AND id <> 'a4f81112-2151-5a34-9909-17602ae71266';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3348f58b-ef87-5ae6-84a0-b9a8fa93e93e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-640',
  'Small Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-640',
  'Small Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "640", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Small Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "640", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-640'
  AND id <> '3348f58b-ef87-5ae6-84a0-b9a8fa93e93e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5b1eaad4-b09b-5341-97dc-02d8c070fc57',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-076',
  'Steel Lockers/Cupboards',
  'Contents',
  'Office Contents',
  1900.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-076',
  'Steel Lockers/Cupboards',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "76", "location_code": "GW11", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Steel Lockers/Cupboards',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1900.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "76", "location_code": "GW11", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-076'
  AND id <> '5b1eaad4-b09b-5341-97dc-02d8c070fc57';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7570cba6-5452-5f10-a837-001267a552d5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-086',
  'Steel Lockers/Cupboards *2',
  'Contents',
  'Office Contents',
  3800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-086',
  'Steel Lockers/Cupboards *2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "86", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Steel Lockers/Cupboards *2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "86", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-086'
  AND id <> '7570cba6-5452-5f10-a837-001267a552d5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0e1d3aab-e915-58e6-b949-e18d21259cf0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-165',
  'Steel Table',
  'Contents',
  'Office Contents',
  750.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-165',
  'Steel Table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "165", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Steel Table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 750.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "165", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-165'
  AND id <> '0e1d3aab-e915-58e6-b949-e18d21259cf0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9c2cf71b-fb2b-5b3d-b230-c4a82993e25a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-253',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-253',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "253", "location_code": "GW6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "253", "location_code": "GW6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-253'
  AND id <> '9c2cf71b-fb2b-5b3d-b230-c4a82993e25a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5c997209-4c21-568b-a634-4493128d6855',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-290',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-290',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "290", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "290", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-290'
  AND id <> '5c997209-4c21-568b-a634-4493128d6855';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd2889131-4928-5b0e-be69-2d74f60c9860',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-404',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-404',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "404", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "404", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-404'
  AND id <> 'd2889131-4928-5b0e-be69-2d74f60c9860';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '738134f1-a857-58d2-a717-b3a2372ae170',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-415',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-415',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "415", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "415", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-415'
  AND id <> '738134f1-a857-58d2-a717-b3a2372ae170';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '00464794-d792-5a89-aadc-1ed07e611399',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-451',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-451',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "451", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "451", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-451'
  AND id <> '00464794-d792-5a89-aadc-1ed07e611399';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a7644bd7-58cc-588e-b574-fc9ff4c05572',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-457',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-457',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "457", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "457", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-457'
  AND id <> 'a7644bd7-58cc-588e-b574-fc9ff4c05572';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1a2a3c01-7983-5b51-b039-46392e0f5c92',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-475',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-475',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "475", "location_code": "F5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "475", "location_code": "F5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-475'
  AND id <> '1a2a3c01-7983-5b51-b039-46392e0f5c92';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '28f20ed0-b573-5f4f-85ad-3ff741a5dd53',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-479',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-479',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "479", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "479", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-479'
  AND id <> '28f20ed0-b573-5f4f-85ad-3ff741a5dd53';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '78d8fb88-8176-55dd-b5e7-daf8f637c8b5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-507',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-507',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "507", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "507", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-507'
  AND id <> '78d8fb88-8176-55dd-b5e7-daf8f637c8b5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '43b7a1f6-007c-50c2-9459-799002f4cdd4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-520',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-520',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "520", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "520", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-520'
  AND id <> '43b7a1f6-007c-50c2-9459-799002f4cdd4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1f800681-ffec-5cd7-a122-f12803e51d86',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-529',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-529',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "529", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "529", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-529'
  AND id <> '1f800681-ffec-5cd7-a122-f12803e51d86';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '93a68b0f-5365-5117-a171-664d7f63cd2f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-536',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-536',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "536", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "536", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-536'
  AND id <> '93a68b0f-5365-5117-a171-664d7f63cd2f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '05d32dca-f47a-5f92-983f-502e34fd383d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-562',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-562',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "562", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "562", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-562'
  AND id <> '05d32dca-f47a-5f92-983f-502e34fd383d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '593cb612-1f3f-5dde-bfac-bf3735b779ad',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-070',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-070',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "70", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "70", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-070'
  AND id <> '593cb612-1f3f-5dde-bfac-bf3735b779ad';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c8b3ba2f-b4b8-52c3-b939-1999775ffec4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-706',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-706',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "706", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "706", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-706'
  AND id <> 'c8b3ba2f-b4b8-52c3-b939-1999775ffec4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b19c7adf-d53a-5c69-8cfb-a62558d49880',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-720',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-720',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "720", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "720", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-720'
  AND id <> 'b19c7adf-d53a-5c69-8cfb-a62558d49880';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fb6caced-d287-5c30-bf8d-88dfaed08efd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-729',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-729',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "729", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "729", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-729'
  AND id <> 'fb6caced-d287-5c30-bf8d-88dfaed08efd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bb384ece-dee2-5925-8f3d-ccbe6c938492',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-731',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-731',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "731", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "731", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-731'
  AND id <> 'bb384ece-dee2-5925-8f3d-ccbe6c938492';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fcefd456-4210-5649-90d3-ad584b4188f0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-758',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-758',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "758", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "758", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-758'
  AND id <> 'fcefd456-4210-5649-90d3-ad584b4188f0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c2011f73-02ea-5999-94ff-094457ce1e08',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-008',
  'Storage Cupboard',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-008',
  'Storage Cupboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "8", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "8", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-008'
  AND id <> 'c2011f73-02ea-5999-94ff-094457ce1e08';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'aa1d68b3-199d-5c27-b25c-34b3a3a80b5a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-596',
  'Storage Cupboard  1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-596',
  'Storage Cupboard  1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "596", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "596", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-596'
  AND id <> 'aa1d68b3-199d-5c27-b25c-34b3a3a80b5a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '41c3ef08-86c4-5cfc-a1a1-00efea23cc8a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-611',
  'Storage Cupboard  1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-611',
  'Storage Cupboard  1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "611", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "611", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-611'
  AND id <> '41c3ef08-86c4-5cfc-a1a1-00efea23cc8a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6e19f001-8dce-5d60-a4cc-0084e2dec4d7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-597',
  'Storage Cupboard  2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-597',
  'Storage Cupboard  2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "597", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "597", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-597'
  AND id <> '6e19f001-8dce-5d60-a4cc-0084e2dec4d7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c1890440-ef2c-59be-be65-d86b26b4d029',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-612',
  'Storage Cupboard  2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-612',
  'Storage Cupboard  2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "612", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "612", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-612'
  AND id <> 'c1890440-ef2c-59be-be65-d86b26b4d029';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c506cada-0658-5f6c-89a9-3d8cff41a34e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-598',
  'Storage Cupboard  3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-598',
  'Storage Cupboard  3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "598", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "598", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-598'
  AND id <> 'c506cada-0658-5f6c-89a9-3d8cff41a34e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '491049a3-8d08-572d-b591-2cd9a8685957',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-613',
  'Storage Cupboard  3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-613',
  'Storage Cupboard  3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "613", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "613", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-613'
  AND id <> '491049a3-8d08-572d-b591-2cd9a8685957';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3ca2a483-ad1d-54bb-a45f-a57932fb7c9d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-599',
  'Storage Cupboard  Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-599',
  'Storage Cupboard  Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "599", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard  Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "599", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-599'
  AND id <> '3ca2a483-ad1d-54bb-a45f-a57932fb7c9d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0bd6a629-a8c8-533a-8b19-4e834f0527ab',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-268',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-268',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "268", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "268", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-268'
  AND id <> '0bd6a629-a8c8-533a-8b19-4e834f0527ab';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e9492cfb-c281-5c73-b529-561153844294',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-283',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-283',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "283", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "283", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-283'
  AND id <> 'e9492cfb-c281-5c73-b529-561153844294';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '10f7c67d-0236-5207-9566-c538dd4c2818',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-031',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-031',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "31", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "31", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-031'
  AND id <> '10f7c67d-0236-5207-9566-c538dd4c2818';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e1bc249c-d48e-54b5-a4ae-3c0bc9a44c50',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-511',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-511',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "511", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "511", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-511'
  AND id <> 'e1bc249c-d48e-54b5-a4ae-3c0bc9a44c50';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '991ff89d-06d5-55c4-8790-6b7b4a7bb341',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-615',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-615',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "615", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "615", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-615'
  AND id <> '991ff89d-06d5-55c4-8790-6b7b4a7bb341';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a84bc697-77ac-5087-8e61-a3bcc43af365',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-711',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-711',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "711", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "711", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-711'
  AND id <> 'a84bc697-77ac-5087-8e61-a3bcc43af365';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '40357b97-cde0-5913-951b-3cc550d834c2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-728',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-728',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "728", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "728", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-728'
  AND id <> '40357b97-cde0-5913-951b-3cc550d834c2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '05b94369-30c6-587c-bdaa-47ef4bdfdf58',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-735',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-735',
  'Storage Cupboard - Deskside',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "735", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "735", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-735'
  AND id <> '05b94369-30c6-587c-bdaa-47ef4bdfdf58';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '849a290f-44cb-5b5c-817e-b097affb0163',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-288',
  'Storage Cupboard - Deskside 1',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-288',
  'Storage Cupboard - Deskside 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "288", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "288", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-288'
  AND id <> '849a290f-44cb-5b5c-817e-b097affb0163';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '19cbbab4-ac76-5446-b692-44a7997cb983',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-090',
  'Silver Steel Racking *39',
  'Contents',
  'Office Contents',
  102176.75,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-090',
  'Silver Steel Racking *39',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "90", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Silver Steel Racking *39',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 102176.75,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "90", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-090'
  AND id <> '19cbbab4-ac76-5446-b692-44a7997cb983';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '33c67363-ed1a-5d09-8cc4-fd99fe552dc5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-289',
  'Storage Cupboard - Deskside 2',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-289',
  'Storage Cupboard - Deskside 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "289", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Deskside 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "289", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-289'
  AND id <> '33c67363-ed1a-5d09-8cc4-fd99fe552dc5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'da8c42d8-fd19-5712-badc-11551b667c80',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-690',
  'Storage Cupboard - Large',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-690',
  'Storage Cupboard - Large',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "690", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Large',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "690", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-690'
  AND id <> 'da8c42d8-fd19-5712-badc-11551b667c80';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd3268920-ed72-5b3c-8900-48abe479267f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-691',
  'Storage Cupboard - Small',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-691',
  'Storage Cupboard - Small',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "691", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard - Small',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "691", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-691'
  AND id <> 'd3268920-ed72-5b3c-8900-48abe479267f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '64c456fc-9817-5b94-880e-143d94aa5e3f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-571',
  'Storage Cupboard (Brown)',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-571',
  'Storage Cupboard (Brown)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "571", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard (Brown)',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "571", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-571'
  AND id <> '64c456fc-9817-5b94-880e-143d94aa5e3f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e91dbebb-5a01-5a44-ba4a-1010d20861e0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-664',
  'Storage Cupboard (Brown)',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-664',
  'Storage Cupboard (Brown)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "664", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard (Brown)',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "664", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-664'
  AND id <> 'e91dbebb-5a01-5a44-ba4a-1010d20861e0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '65525993-fdd2-5938-a435-1e24af9d374f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-526',
  'Storage Cupboard (Printer Support)',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-526',
  'Storage Cupboard (Printer Support)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "526", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard (Printer Support)',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "526", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-526'
  AND id <> '65525993-fdd2-5938-a435-1e24af9d374f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bcd5946d-f9f7-50ce-96c2-cf430dd1d75a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-262',
  'Storage Cupboard (small brown)',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-262',
  'Storage Cupboard (small brown)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "262", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard (small brown)',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "262", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-262'
  AND id <> 'bcd5946d-f9f7-50ce-96c2-cf430dd1d75a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8d07e003-3e61-5c86-8df6-88455b7a85e2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-263',
  'Storage Cupboard (tall)',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-263',
  'Storage Cupboard (tall)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "263", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard (tall)',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "263", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-263'
  AND id <> '8d07e003-3e61-5c86-8df6-88455b7a85e2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9f3bc87b-d3ef-58d3-b7d5-10c19552f115',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-626',
  'Storage Cupboard 1',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-626',
  'Storage Cupboard 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "626", "location_code": "F36", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "626", "location_code": "F36", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-626'
  AND id <> '9f3bc87b-d3ef-58d3-b7d5-10c19552f115';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b9316cfc-ffcb-57ce-baa8-d10a3f87a917',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-633',
  'Storage Cupboard 1',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-633',
  'Storage Cupboard 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "633", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "633", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-633'
  AND id <> 'b9316cfc-ffcb-57ce-baa8-d10a3f87a917';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5fb4dfab-91c3-5467-a81f-2e0e0f5bca25',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-627',
  'Storage Cupboard 2',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-627',
  'Storage Cupboard 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "627", "location_code": "F36", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "627", "location_code": "F36", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-627'
  AND id <> '5fb4dfab-91c3-5467-a81f-2e0e0f5bca25';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e8ba350f-8c78-5d87-be33-b76c91923d73',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-634',
  'Storage Cupboard 2',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-634',
  'Storage Cupboard 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "634", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "634", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-634'
  AND id <> 'e8ba350f-8c78-5d87-be33-b76c91923d73';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7267a54c-37cd-53f5-97e6-6ea11c95b7f5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-628',
  'Storage Cupboard 3',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-628',
  'Storage Cupboard 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "628", "location_code": "F36", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "628", "location_code": "F36", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-628'
  AND id <> '7267a54c-37cd-53f5-97e6-6ea11c95b7f5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5ab2beed-4922-5c46-b437-536e8c8ea2b8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-459',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-459',
  'Storage Cupboard Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "459", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "459", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-459'
  AND id <> '5ab2beed-4922-5c46-b437-536e8c8ea2b8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '05b928cc-a0b7-53c8-a09e-e003c5c718b9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-468',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-468',
  'Storage Cupboard Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "468", "location_code": "F7", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "468", "location_code": "F7", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-468'
  AND id <> '05b928cc-a0b7-53c8-a09e-e003c5c718b9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ba54bf6d-c9d8-5683-addd-fb88d40c1d94',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-489',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-489',
  'Storage Cupboard Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "489", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "489", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-489'
  AND id <> 'ba54bf6d-c9d8-5683-addd-fb88d40c1d94';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6590a9ae-6ce2-5824-b6a3-80e2a86e7ba2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-495',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-495',
  'Storage Cupboard Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "495", "location_code": "F1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "495", "location_code": "F1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-495'
  AND id <> '6590a9ae-6ce2-5824-b6a3-80e2a86e7ba2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c7da617c-af4c-5a18-a770-a58df634eb33',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-614',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-614',
  'Storage Cupboard Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "614", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "614", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-614'
  AND id <> 'c7da617c-af4c-5a18-a770-a58df634eb33';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2de9221d-b711-5bb6-8568-47335910519a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-670',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-670',
  'Storage Cupboard Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "670", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "670", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-670'
  AND id <> '2de9221d-b711-5bb6-8568-47335910519a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ce8ba65a-b0b3-5218-b7c9-7dd11dacb5d5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-540',
  'Storage Cupboard small',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-540',
  'Storage Cupboard small',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "540", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard small',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "540", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-540'
  AND id <> 'ce8ba65a-b0b3-5218-b7c9-7dd11dacb5d5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '46fbd1a6-91d2-5e9e-89ca-b2458885a97a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-539',
  'Storage Cupboard vertical',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-539',
  'Storage Cupboard vertical',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "539", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard vertical',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "539", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-539'
  AND id <> '46fbd1a6-91d2-5e9e-89ca-b2458885a97a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '47476c82-12e5-5445-a341-3040d6589839',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-271',
  'Storage Cupboard*3',
  'Contents',
  'Office Contents',
  3700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-271',
  'Storage Cupboard*3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "271", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Cupboard*3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "271", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-271'
  AND id <> '47476c82-12e5-5445-a341-3040d6589839';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c7c2be32-0d1a-598c-98e9-c27bbee3c955',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-512',
  'Storage Drawers',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-512',
  'Storage Drawers',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "512", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Drawers',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "512", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-512'
  AND id <> 'c7c2be32-0d1a-598c-98e9-c27bbee3c955';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9215c76c-cf55-5d00-8922-51c678a19925',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-052',
  'Storage Drawers',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-052',
  'Storage Drawers',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "52", "location_code": "G15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Drawers',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "52", "location_code": "G15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-052'
  AND id <> '9215c76c-cf55-5d00-8922-51c678a19925';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '604c4ea6-e328-5cf1-8408-81a2a597d6b2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-486',
  'Storage Drawers Grey',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-486',
  'Storage Drawers Grey',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "486", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Drawers Grey',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "486", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-486'
  AND id <> '604c4ea6-e328-5cf1-8408-81a2a597d6b2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5c2213c1-10ca-55a3-bd49-1017d4f1a67a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-500',
  'Storage Drawers Horizontal',
  'Contents',
  'Office Contents',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-500',
  'Storage Drawers Horizontal',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "500", "location_code": "F16", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Storage Drawers Horizontal',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "500", "location_code": "F16", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-500'
  AND id <> '5c2213c1-10ca-55a3-bd49-1017d4f1a67a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '408040bd-3147-51a8-a91d-b353530722a9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-202',
  'Table',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-202',
  'Table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "202", "location_code": "WH-Put A", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "202", "location_code": "WH-Put A", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-202'
  AND id <> '408040bd-3147-51a8-a91d-b353530722a9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f0b2a9a4-1bbc-565d-b335-251b4e888468',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-006',
  'Table (Water Dispenser Support)',
  'Contents',
  'Office Contents',
  1500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-006',
  'Table (Water Dispenser Support)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "6", "location_code": "G2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Table (Water Dispenser Support)',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "6", "location_code": "G2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-006'
  AND id <> 'f0b2a9a4-1bbc-565d-b335-251b4e888468';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd7a1594a-8228-5ec0-8faf-ef824f638353',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-062',
  'Tables*7',
  'Contents',
  'Office Contents',
  7000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-062',
  'Tables*7',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "62", "location_code": "G20", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Tables*7',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 7000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "62", "location_code": "G20", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-062'
  AND id <> 'd7a1594a-8228-5ec0-8faf-ef824f638353';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2c27cb65-230b-55dc-8169-f87c39f7e339',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-079',
  'Totally Urn, Silver Water Boiler',
  'Contents',
  'Office Contents',
  1500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-079',
  'Totally Urn, Silver Water Boiler',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "79", "location_code": "GW11", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Totally Urn, Silver Water Boiler',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "79", "location_code": "GW11", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-079'
  AND id <> '2c27cb65-230b-55dc-8169-f87c39f7e339';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ec6ae992-3555-531d-a4c6-1fa90a178f85',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-080',
  'Vending Machine',
  'Contents',
  'Office Contents',
  20000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-080',
  'Vending Machine',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "80", "location_code": "GW12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Vending Machine',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 20000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "80", "location_code": "GW12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-080'
  AND id <> 'ec6ae992-3555-531d-a4c6-1fa90a178f85';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '01c6a52a-64ec-5422-b655-897f9340ba54',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-926',
  'Wall Cabinet 4U',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-926',
  'Wall Cabinet 4U',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "926", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Wall Cabinet 4U',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "926", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-926'
  AND id <> '01c6a52a-64ec-5422-b655-897f9340ba54';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6b3e72b8-4f46-5902-bb9a-b979adc7809f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-505',
  'Water Cooler',
  'Contents',
  'Office Contents',
  1500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-505',
  'Water Cooler',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "505", "location_code": "F19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Water Cooler',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "505", "location_code": "F19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-505'
  AND id <> '6b3e72b8-4f46-5902-bb9a-b979adc7809f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e582c97b-b823-5872-9bc4-ff979a52d060',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-044',
  'Water Dispenser',
  'Contents',
  'Office Contents',
  1500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-044',
  'Water Dispenser',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "44", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Water Dispenser',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "44", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-044'
  AND id <> 'e582c97b-b823-5872-9bc4-ff979a52d060';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b3beafad-a9f6-5254-b180-01c9df4bfffa',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-005',
  'Water Dispenser',
  'Contents',
  'Office Contents',
  1500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-005',
  'Water Dispenser',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "5", "location_code": "G2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Water Dispenser',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "5", "location_code": "G2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-005'
  AND id <> 'b3beafad-a9f6-5254-b180-01c9df4bfffa';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ba90909f-17fd-5037-b722-8ccd37ea095e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-519',
  'Wooden Drawers - Large',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-519',
  'Wooden Drawers - Large',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "519", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Wooden Drawers - Large',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "519", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-519'
  AND id <> 'ba90909f-17fd-5037-b722-8ccd37ea095e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a76731c0-c633-5c21-9d78-d3cba0c15a8d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-522',
  'Wooden Drawers - Small',
  'Contents',
  'Office Contents',
  1000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-522',
  'Wooden Drawers - Small',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "522", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Wooden Drawers - Small',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 1000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "522", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-522'
  AND id <> 'a76731c0-c633-5c21-9d78-d3cba0c15a8d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5b20f796-5606-5ea5-9d6b-deaca00ecccc',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-324',
  'PERSPEX SIGNBOARDS',
  'Contents',
  'Office Contents',
  29970.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-324',
  'PERSPEX SIGNBOARDS',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "324", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'PERSPEX SIGNBOARDS',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 29970.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "324", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-324'
  AND id <> '5b20f796-5606-5ea5-9d6b-deaca00ecccc';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1e907f4f-ae41-5432-b68e-6437f6a4ec72',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-133',
  'Blue Bubble Wrapping Machine',
  'Contents',
  'Office Contents',
  42229.5,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-133',
  'Blue Bubble Wrapping Machine',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "133", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Blue Bubble Wrapping Machine',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 42229.5,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "133", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-133'
  AND id <> '1e907f4f-ae41-5432-b68e-6437f6a4ec72';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bb6f808e-01a6-5f7a-9b7e-0c8aa37805a5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-018',
  'HydroBoil',
  'Contents',
  'Office Contents',
  8673.87,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-018',
  'HydroBoil',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "18", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HydroBoil',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 8673.87,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "18", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-018'
  AND id <> 'bb6f808e-01a6-5f7a-9b7e-0c8aa37805a5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a1f14647-5895-5f27-9294-1ff85aab2959',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-107',
  'Fromm Plastic Wrapper Machine',
  'Contents',
  'Office Contents',
  50000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-107',
  'Fromm Plastic Wrapper Machine',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "107", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Fromm Plastic Wrapper Machine',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 50000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "107", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-107'
  AND id <> 'a1f14647-5895-5f27-9294-1ff85aab2959';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4fdcd282-fd3f-5fd6-ad4e-5fee6e6fe62d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-206',
  'Pigeon Holes/Filing Cabinet',
  'Contents',
  'Office Contents',
  5730.93,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-206',
  'Pigeon Holes/Filing Cabinet',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "206", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Pigeon Holes/Filing Cabinet',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 5730.93,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "206", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-206'
  AND id <> '4fdcd282-fd3f-5fd6-ad4e-5fee6e6fe62d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '84a2e233-e117-53ab-9a48-0a848c96691c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-026',
  'Umbrella',
  'Contents',
  'Office Contents',
  11748.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-026',
  'Umbrella',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "26", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Umbrella',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 11748.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "26", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-026'
  AND id <> '84a2e233-e117-53ab-9a48-0a848c96691c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '891cf9cc-e024-521c-9ad5-78b52df24e41',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-296',
  '910 Bin 8 Clear',
  'Contents',
  'Office Contents',
  81900.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-296',
  '910 Bin 8 Clear',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "296", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = '910 Bin 8 Clear',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 81900.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "296", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-296'
  AND id <> '891cf9cc-e024-521c-9ad5-78b52df24e41';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ca766f82-775f-5e99-8222-34f8efa9c928',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-297',
  '2495 Bin 7 Clear',
  'Contents',
  'Office Contents',
  144768.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-297',
  '2495 Bin 7 Clear',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "297", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = '2495 Bin 7 Clear',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 144768.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "297", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-297'
  AND id <> 'ca766f82-775f-5e99-8222-34f8efa9c928';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c620e5a4-8c1e-5abd-ab6f-c0aeb5d7ef76',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-298',
  '2039 Bin 7 Clear',
  'Contents',
  'Office Contents',
  118262.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-298',
  '2039 Bin 7 Clear',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "298", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = '2039 Bin 7 Clear',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 118262.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "298", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-298'
  AND id <> 'c620e5a4-8c1e-5abd-ab6f-c0aeb5d7ef76';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'febfa37c-315d-5ff1-8868-ae5e833bdf07',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-087',
  'Long Table (Black)/Station Table',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-087',
  'Long Table (Black)/Station Table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "87", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Long Table (Black)/Station Table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "87", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-087'
  AND id <> 'febfa37c-315d-5ff1-8868-ae5e833bdf07';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3ab99cee-51bc-58dd-a6af-a8111828b798',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-503',
  'HydroBoil',
  'Contents',
  'Office Contents',
  8673.87,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-503',
  'HydroBoil',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "503", "location_code": "F19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HydroBoil',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 8673.87,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "503", "location_code": "F19", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-503'
  AND id <> '3ab99cee-51bc-58dd-a6af-a8111828b798';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'eee78b04-3647-552c-902d-509bbb69b8ce',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-759',
  'Steel Racking/Shelving',
  'Contents',
  'Office Contents',
  7490.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-759',
  'Steel Racking/Shelving',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "759", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Steel Racking/Shelving',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 7490.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "759", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-759'
  AND id <> 'eee78b04-3647-552c-902d-509bbb69b8ce';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c2a0e39d-2b89-5de6-8e46-9e2541807f6c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-FF-936',
  'CUSTOM CARPORTS - CT DEPOT',
  'Contents',
  'Office Contents',
  6487.6,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-FF-936',
  'CUSTOM CARPORTS - CT DEPOT',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "B101", "asset_number": "936", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444402' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444402' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'CUSTOM CARPORTS - CT DEPOT',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 6487.6,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "936", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-FF-936'
  AND id <> 'c2a0e39d-2b89-5de6-8e46-9e2541807f6c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8f7678dc-a706-5d8c-b5cf-be97207cad2e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-FF-938',
  'CAPE TOWN SHELVING',
  'Contents',
  'Office Contents',
  36726.88,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-FF-938',
  'CAPE TOWN SHELVING',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "B101", "asset_number": "938", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444402' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444402' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'CAPE TOWN SHELVING',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 36726.88,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "938", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-FF-938'
  AND id <> '8f7678dc-a706-5d8c-b5cf-be97207cad2e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8dd8f15e-2016-56c6-82cd-4e857bac0a89',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-094',
  'Numatic Floor Cleaner',
  'Contents',
  'Office Contents',
  34716.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-094',
  'Numatic Floor Cleaner',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "94", "location_code": "GW14", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Numatic Floor Cleaner',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 34716.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "94", "location_code": "GW14", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-094'
  AND id <> '8dd8f15e-2016-56c6-82cd-4e857bac0a89';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7fda0c27-f9f9-59a3-ab56-bd8f625c09e1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-002',
  'Side Table + 5 Chairs',
  'Contents',
  'Office Contents',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-002',
  'Side Table + 5 Chairs',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "2", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Side Table + 5 Chairs',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "2", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-002'
  AND id <> '7fda0c27-f9f9-59a3-ab56-bd8f625c09e1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '423b9da5-7fb7-54e1-bf19-49d5508d0128',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-448',
  'Boardroom Table + 6 Chairs',
  'Contents',
  'Office Contents',
  10664.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-448',
  'Boardroom Table + 6 Chairs',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "448", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Boardroom Table + 6 Chairs',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 10664.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "448", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-448'
  AND id <> '423b9da5-7fb7-54e1-bf19-49d5508d0128';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '139aab27-470b-5fdf-a6d7-e1528bc9f376',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-453',
  'Russel Hobbs Coffee Machine',
  'Contents',
  'Office Contents',
  800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-453',
  'Russel Hobbs Coffee Machine',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "453", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Russel Hobbs Coffee Machine',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "453", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-453'
  AND id <> '139aab27-470b-5fdf-a6d7-e1528bc9f376';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4aba70ca-c71e-5f8f-82fe-cbf4d690c0c4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-100',
  'Office Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-100',
  'Office Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "100", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "100", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-100'
  AND id <> '4aba70ca-c71e-5f8f-82fe-cbf4d690c0c4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bd6f025c-644d-5011-ac42-53873e5e90d8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-105',
  'Scan & Label Station 1 Desk',
  'Contents',
  'Office Contents',
  14344.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-105',
  'Scan & Label Station 1 Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "105", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Scan & Label Station 1 Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 14344.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "105", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-105'
  AND id <> 'bd6f025c-644d-5011-ac42-53873e5e90d8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e0f65773-55f5-5e47-81ae-38114334f3ca',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-108',
  'Scan & Label Station 2 Desk',
  'Contents',
  'Office Contents',
  14344.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-108',
  'Scan & Label Station 2 Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "108", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Scan & Label Station 2 Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 14344.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "108", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-108'
  AND id <> 'e0f65773-55f5-5e47-81ae-38114334f3ca';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '572082a1-f16d-5e69-9d64-c93c87ace95a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-114',
  'Scan & Label Station 3 Desk',
  'Contents',
  'Office Contents',
  14344.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-114',
  'Scan & Label Station 3 Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "114", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Scan & Label Station 3 Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 14344.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "114", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-114'
  AND id <> '572082a1-f16d-5e69-9d64-c93c87ace95a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd51187e3-4a45-5d9c-9034-362340842319',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-115',
  'Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-115',
  'Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "115", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Chair 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "115", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-115'
  AND id <> 'd51187e3-4a45-5d9c-9034-362340842319';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '00f71124-f409-53ea-85dc-6c13e99c8abc',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-116',
  'Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-116',
  'Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "116", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Chair 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "116", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-116'
  AND id <> '00f71124-f409-53ea-85dc-6c13e99c8abc';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e80a6100-9c6b-5bd9-9135-85b8b866cf8a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-122',
  'Scan & Label Station 4 Desk',
  'Contents',
  'Office Contents',
  14344.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-122',
  'Scan & Label Station 4 Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "122", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Scan & Label Station 4 Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 14344.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "122", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-122'
  AND id <> 'e80a6100-9c6b-5bd9-9135-85b8b866cf8a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b87ed914-e9d3-51f0-a86c-a3bd29ff0e2c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-123',
  'Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-123',
  'Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "123", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "123", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-123'
  AND id <> 'b87ed914-e9d3-51f0-a86c-a3bd29ff0e2c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'db9745cf-df5c-5704-8ce2-0790e8529726',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-130',
  'Scan & Label Station 5 Desk',
  'Contents',
  'Office Contents',
  14344.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-130',
  'Scan & Label Station 5 Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "130", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Scan & Label Station 5 Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 14344.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "130", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-130'
  AND id <> 'db9745cf-df5c-5704-8ce2-0790e8529726';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ec8e8e4c-9a00-5769-b69e-a2c439b525ec',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-134',
  'Station 6 Desk *2',
  'Contents',
  'Office Contents',
  9692.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-134',
  'Station 6 Desk *2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "134", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Station 6 Desk *2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 9692.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "134", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-134'
  AND id <> 'ec8e8e4c-9a00-5769-b69e-a2c439b525ec';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6d677173-99d5-5a03-bb52-4d8b42ab5f89',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-145',
  'Office Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-145',
  'Office Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "145", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "145", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-145'
  AND id <> '6d677173-99d5-5a03-bb52-4d8b42ab5f89';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9359146d-fb68-58d0-af10-0868231da25d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-146',
  'Office Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-146',
  'Office Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "146", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "146", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-146'
  AND id <> '9359146d-fb68-58d0-af10-0868231da25d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '34710d11-9579-5e00-9d0c-cdf9a7843a23',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-147',
  'Office Chair 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-147',
  'Office Chair 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "147", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "147", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-147'
  AND id <> '34710d11-9579-5e00-9d0c-cdf9a7843a23';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd2b9c2d6-1bfc-56ab-8bfe-18b740710331',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-148',
  'Office Chair 4',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-148',
  'Office Chair 4',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "148", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair 4',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "148", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-148'
  AND id <> 'd2b9c2d6-1bfc-56ab-8bfe-18b740710331';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'db9c044b-64ad-5d95-acc8-5e57f928b6d0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-149',
  'Silver Steel Racking *2',
  'Contents',
  'Office Contents',
  19339.28,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-149',
  'Silver Steel Racking *2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "149", "location_code": "GW6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Silver Steel Racking *2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 19339.28,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "149", "location_code": "GW6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-149'
  AND id <> 'db9c044b-64ad-5d95-acc8-5e57f928b6d0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ab33d349-5327-5e1f-a6fa-fc2bdf3a6409',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-015',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-015',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "15", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "15", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-015'
  AND id <> 'ab33d349-5327-5e1f-a6fa-fc2bdf3a6409';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '39d406e0-06fb-5ca5-a8e4-8e586a3b476d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-157',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-157',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "157", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "157", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-157'
  AND id <> '39d406e0-06fb-5ca5-a8e4-8e586a3b476d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '272be084-eb36-5018-a6f8-00889b116dc7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-158',
  'Office Desk',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-158',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "158", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "158", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-158'
  AND id <> '272be084-eb36-5018-a6f8-00889b116dc7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '97707e01-b4a9-5052-85c0-16b7f38b4fbb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-016',
  'Oil Heater',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-016',
  'Oil Heater',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "16", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Oil Heater',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "16", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-016'
  AND id <> '97707e01-b4a9-5052-85c0-16b7f38b4fbb';
COMMIT;