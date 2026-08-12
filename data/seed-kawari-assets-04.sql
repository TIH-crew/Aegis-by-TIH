BEGIN;
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '862684b1-c423-5503-ba10-3a65eb37a3dc',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-118',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4185.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-118',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "118", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4185.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "118", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-118'
  AND id <> '862684b1-c423-5503-ba10-3a65eb37a3dc';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '53c75d4e-9aa0-5034-9fb4-14272663aad8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-119',
  'Microsoft Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-119',
  'Microsoft Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "119", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Microsoft Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "119", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-119'
  AND id <> '53c75d4e-9aa0-5034-9fb4-14272663aad8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '741bfd23-f243-5c73-a79f-d43009018bd0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-012',
  'Canon Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  2560.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-012',
  'Canon Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "12", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Canon Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2560.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "12", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-012'
  AND id <> '741bfd23-f243-5c73-a79f-d43009018bd0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2c1fb0b3-3a0f-5956-9e80-c45990409eb7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-121',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  16887.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-121',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "121", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 16887.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "121", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-121'
  AND id <> '2c1fb0b3-3a0f-5956-9e80-c45990409eb7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b589dbac-f50c-536d-b25b-e52697fbbfb3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-124',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-124',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "124", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "124", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-124'
  AND id <> 'b589dbac-f50c-536d-b25b-e52697fbbfb3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '03c151e0-bf77-52d7-8cba-0dc7fee13200',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-126',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4185.27,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-126',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "126", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4185.27,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "126", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-126'
  AND id <> '03c151e0-bf77-52d7-8cba-0dc7fee13200';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7ae062c0-5e28-56cd-ba87-fccd8f793766',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-127',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-127',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "127", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "127", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-127'
  AND id <> '7ae062c0-5e28-56cd-ba87-fccd8f793766';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3c4544cf-9828-511e-938b-793fcdc22f81',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-129',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-129',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "129", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "129", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-129'
  AND id <> '3c4544cf-9828-511e-938b-793fcdc22f81';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c1ce4634-c3cc-5ae3-bce1-a4d39dad8b31',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-013',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-013',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "13", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "13", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-013'
  AND id <> 'c1ce4634-c3cc-5ae3-bce1-a4d39dad8b31';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7d09fd0d-7efb-5701-be4d-053c596b1340',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-131',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11077.59,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-131',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "131", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 11077.59,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "131", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-131'
  AND id <> '7d09fd0d-7efb-5701-be4d-053c596b1340';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '29a2a1ef-2c85-5754-8a43-92c7c5738a95',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-132',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4185.27,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-132',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "132", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4185.27,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "132", "location_code": "WH-Scan", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-132'
  AND id <> '29a2a1ef-2c85-5754-8a43-92c7c5738a95';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '258e939e-12df-50e1-9cb0-444be7f9a45e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-135',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5280.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-135',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "135", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5280.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "135", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-135'
  AND id <> '258e939e-12df-50e1-9cb0-444be7f9a45e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2671a601-deee-5c5e-a595-55f7579d6ba3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-136',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  8282.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-136',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "136", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8282.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "136", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-136'
  AND id <> '2671a601-deee-5c5e-a595-55f7579d6ba3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1e98da58-9ccf-5e63-b300-4d30611899cf',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-137',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  5424.96,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-137',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "137", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5424.96,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "137", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-137'
  AND id <> '1e98da58-9ccf-5e63-b300-4d30611899cf';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a9a6c786-ee2e-5bd6-9cd9-6286e3339303',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-138',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-138',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "138", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "138", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-138'
  AND id <> 'a9a6c786-ee2e-5bd6-9cd9-6286e3339303';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '993251b1-519c-5593-9930-06582563df3b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-139',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-139',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "139", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "139", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-139'
  AND id <> '993251b1-519c-5593-9930-06582563df3b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '403b5666-f1fe-54ce-97f4-8ba3328a9330',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-014',
  'MECER Inverter/UPS Back Up Supply',
  'Electronic Equipment',
  'Electronic Equipment',
  848.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-014',
  'MECER Inverter/UPS Back Up Supply',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "14", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Inverter/UPS Back Up Supply',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 848.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "14", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-014'
  AND id <> '403b5666-f1fe-54ce-97f4-8ba3328a9330';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6b81793b-7f0a-5562-9a7a-60333090cfb6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-140',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-140',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "140", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "140", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-140'
  AND id <> '6b81793b-7f0a-5562-9a7a-60333090cfb6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '356d86c1-46e1-5a1b-a9e6-8c30f590d807',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-141',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-141',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "141", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "141", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-141'
  AND id <> '356d86c1-46e1-5a1b-a9e6-8c30f590d807';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7a31cd8d-0941-5597-84a0-31cdabb55071',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-142',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  3499.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-142',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "142", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3499.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "142", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-142'
  AND id <> '7a31cd8d-0941-5597-84a0-31cdabb55071';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '040d0def-bd08-5f0e-b89f-ba4a8f2002b4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-143',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  1071.6,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-143',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "143", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 1071.6,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "143", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-143'
  AND id <> '040d0def-bd08-5f0e-b89f-ba4a8f2002b4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5fb492e1-26a3-549e-b95d-90678b49e330',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-144',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-144',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "144", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "144", "location_code": "WH-Stati", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-144'
  AND id <> '5fb492e1-26a3-549e-b95d-90678b49e330';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9678e3a7-f4b6-553a-bc29-6641ac6ed0e9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-150',
  'Spare Printers*4',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-150',
  'Spare Printers*4',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "150", "location_code": "GW6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Spare Printers*4',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "150", "location_code": "GW6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-150'
  AND id <> '9678e3a7-f4b6-553a-bc29-6641ac6ed0e9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '06aaccc5-6f38-54fd-9d53-648ac7405fea',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-152',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  11200.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-152',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "152", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 11200.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "152", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-152'
  AND id <> '06aaccc5-6f38-54fd-9d53-648ac7405fea';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b39b39fc-ecd1-5c73-8885-b86fefdbace5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-153',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-153',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "153", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "153", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-153'
  AND id <> 'b39b39fc-ecd1-5c73-8885-b86fefdbace5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '46274d92-9688-5d5c-92ba-6d0cc41ecba3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-154',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-154',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "154", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "154", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-154'
  AND id <> '46274d92-9688-5d5c-92ba-6d0cc41ecba3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dd1480de-f4ca-564f-a311-d877973dc7cb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-155',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5280.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-155',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "155", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5280.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "155", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-155'
  AND id <> 'dd1480de-f4ca-564f-a311-d877973dc7cb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b12eddcb-0bd1-505d-a1fb-3320353d9dce',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-156',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  5424.96,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-156',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "156", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5424.96,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "156", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-156'
  AND id <> 'b12eddcb-0bd1-505d-a1fb-3320353d9dce';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c5c9ab67-6d53-5078-9076-017988911f66',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-159',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-159',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "159", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "159", "location_code": "WH-Next", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-159'
  AND id <> 'c5c9ab67-6d53-5078-9076-017988911f66';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1af1d62a-184f-57f9-ad37-3ff9c263cceb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-166',
  'HP Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-166',
  'HP Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "166", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'HP Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "166", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-166'
  AND id <> '1af1d62a-184f-57f9-ad37-3ff9c263cceb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4729be6d-2263-5048-b99c-c9dc69e01cd4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-167',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-167',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "167", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "167", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-167'
  AND id <> '4729be6d-2263-5048-b99c-c9dc69e01cd4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '548239b7-4d95-5218-aa09-4acbb0e2624d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-168',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-168',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "168", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "168", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-168'
  AND id <> '548239b7-4d95-5218-aa09-4acbb0e2624d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c72efd14-d994-5f35-9dd1-3e738a67d22a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-169',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-169',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "169", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "169", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-169'
  AND id <> 'c72efd14-d994-5f35-9dd1-3e738a67d22a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ad033745-9e09-53cc-9415-66854667be85',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-017',
  'Defy Microwave',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-017',
  'Defy Microwave',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "17", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Defy Microwave',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "17", "location_code": "G13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-017'
  AND id <> 'ad033745-9e09-53cc-9415-66854667be85';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1a9b2e85-3787-54dd-b960-a18270114e26',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-170',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  8282.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-170',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "170", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8282.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "170", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-170'
  AND id <> '1a9b2e85-3787-54dd-b960-a18270114e26';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7a95a1c2-4fef-5424-864e-efedf73dbb30',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-171',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4185.27,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-171',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "171", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4185.27,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "171", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-171'
  AND id <> '7a95a1c2-4fef-5424-864e-efedf73dbb30';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '813ad21f-d13d-57f9-8cb9-5870f7509801',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-172',
  'Scanner (Old/Traditional)',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-172',
  'Scanner (Old/Traditional)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "172", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Scanner (Old/Traditional)',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "172", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-172'
  AND id <> '813ad21f-d13d-57f9-8cb9-5870f7509801';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a1337971-db95-5dff-957a-977429bc2547',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-173',
  'Fujistu Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-173',
  'Fujistu Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "173", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Fujistu Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "173", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-173'
  AND id <> 'a1337971-db95-5dff-957a-977429bc2547';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '91b3d826-771e-597b-bbb4-203e9e335451',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-174',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  1500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-174',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "174", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 1500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "174", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-174'
  AND id <> '91b3d826-771e-597b-bbb4-203e9e335451';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f562b632-b87c-5041-86b2-f128d8ce5153',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-175',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-175',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "175", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "175", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-175'
  AND id <> 'f562b632-b87c-5041-86b2-f128d8ce5153';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '51833643-9e75-5d86-9afa-e6b588f06d03',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-176',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-176',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "176", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "176", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-176'
  AND id <> '51833643-9e75-5d86-9afa-e6b588f06d03';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd57fadee-3048-596e-9eb9-eeda08567737',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-177',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4532.64,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-177',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "177", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4532.64,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "177", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-177'
  AND id <> 'd57fadee-3048-596e-9eb9-eeda08567737';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3736a9e5-c6bc-5d44-af78-6c6f61532062',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-178',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-178',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "178", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "178", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-178'
  AND id <> '3736a9e5-c6bc-5d44-af78-6c6f61532062';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9acd7f22-ce79-5c95-907e-ed6c65c32856',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-179',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  8282.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-179',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "179", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8282.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "179", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-179'
  AND id <> '9acd7f22-ce79-5c95-907e-ed6c65c32856';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '748c00c6-2f1b-54fc-b367-7cbf67862b69',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-180',
  'Scanner (Old/Traditional)',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-180',
  'Scanner (Old/Traditional)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "180", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Scanner (Old/Traditional)',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "180", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-180'
  AND id <> '748c00c6-2f1b-54fc-b367-7cbf67862b69';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6d44d2ed-3346-53a3-bd92-3ced283a6f43',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-181',
  'MECER Inverter/UPS Back Up Supply',
  'Electronic Equipment',
  'Electronic Equipment',
  848.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-181',
  'MECER Inverter/UPS Back Up Supply',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "181", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Inverter/UPS Back Up Supply',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 848.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "181", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-181'
  AND id <> '6d44d2ed-3346-53a3-bd92-3ced283a6f43';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ccb86e78-e4d8-56a4-bde1-1dd67394999d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-183',
  'LG TV',
  'Electronic Equipment',
  'Electronic Equipment',
  20000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-183',
  'LG TV',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "183", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'LG TV',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 20000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "183", "location_code": "WH-Dispa", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-183'
  AND id <> 'ccb86e78-e4d8-56a4-bde1-1dd67394999d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3fbcfaae-895a-5381-961c-c1f0a8611a6f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-189',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-189',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "189", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "189", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-189'
  AND id <> '3fbcfaae-895a-5381-961c-c1f0a8611a6f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0d9fb021-6828-51fd-8e95-175b97a0bdcb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-194',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  19419.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-194',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "194", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 19419.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "194", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-194'
  AND id <> '0d9fb021-6828-51fd-8e95-175b97a0bdcb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2b9cf608-e5ce-5fd5-b01b-0bd018da1001',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-195',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-195',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "195", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "195", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-195'
  AND id <> '2b9cf608-e5ce-5fd5-b01b-0bd018da1001';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fbd7776a-68ad-50a8-9e68-0c4645377542',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-196',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-196',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "196", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "196", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-196'
  AND id <> 'fbd7776a-68ad-50a8-9e68-0c4645377542';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7ff35939-10c8-5c00-b8c4-e52c199453d5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-198',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  3499.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-198',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "198", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3499.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "198", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-198'
  AND id <> '7ff35939-10c8-5c00-b8c4-e52c199453d5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7f3762bb-5677-52f0-8412-43a92ed3a81b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-199',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  18734.78,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-199',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "199", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'HP Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 18734.78,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "199", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-199'
  AND id <> '7f3762bb-5677-52f0-8412-43a92ed3a81b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'be767089-12f3-5c9e-8f87-a285b740f2d0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-200',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  6100.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-200',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "200", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 6100.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "200", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-200'
  AND id <> 'be767089-12f3-5c9e-8f87-a285b740f2d0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1197d425-7d96-52e8-b8e3-08e341e4fe25',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-201',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11207.71,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-201',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "201", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 11207.71,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "201", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-201'
  AND id <> '1197d425-7d96-52e8-b8e3-08e341e4fe25';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '782a51db-65f7-54da-b4d7-9a20b6ea3416',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-209',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-209',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "209", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "209", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-209'
  AND id <> '782a51db-65f7-54da-b4d7-9a20b6ea3416';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2404bc3e-dd15-51cf-9db4-b73a71853e61',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-210',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-210',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "210", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "210", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-210'
  AND id <> '2404bc3e-dd15-51cf-9db4-b73a71853e61';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f221ba64-d87e-570f-8db1-417d6881d7cc',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-211',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-211',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "211", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "211", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-211'
  AND id <> 'f221ba64-d87e-570f-8db1-417d6881d7cc';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a7b5fd90-9ef6-5226-a1a6-27e06924c1eb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-212',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5280.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-212',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "212", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5280.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "212", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-212'
  AND id <> 'a7b5fd90-9ef6-5226-a1a6-27e06924c1eb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8b9d4108-8f0a-58c6-8787-a58f6f5d85f3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-213',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  8282.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-213',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "213", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8282.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "213", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-213'
  AND id <> '8b9d4108-8f0a-58c6-8787-a58f6f5d85f3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '03372c86-853f-5855-9610-a08209d1121f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-214',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  10918.92,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-214',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "214", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10918.92,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "214", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-214'
  AND id <> '03372c86-853f-5855-9610-a08209d1121f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9e4ac310-db75-5b68-9772-d8a33c236dcd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-215',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  12428.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-215',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "215", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12428.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "215", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-215'
  AND id <> '9e4ac310-db75-5b68-9772-d8a33c236dcd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8eb66832-569d-5f7f-a0ca-51d38b08743a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-218',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  1651.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-218',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "218", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 1651.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "218", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-218'
  AND id <> '8eb66832-569d-5f7f-a0ca-51d38b08743a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f15d69ac-757b-5e5b-9227-61f175822601',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-219',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-219',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "219", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "219", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-219'
  AND id <> 'f15d69ac-757b-5e5b-9227-61f175822601';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8c7a38d5-13c5-5e62-803c-b9cec2cc94e3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-220',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-220',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "220", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "220", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-220'
  AND id <> '8c7a38d5-13c5-5e62-803c-b9cec2cc94e3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'cd42a4be-2f1f-5558-b459-1ff4a38411a6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-221',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-221',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "221", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "221", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-221'
  AND id <> 'cd42a4be-2f1f-5558-b459-1ff4a38411a6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f0082638-795f-5a71-8eb2-ad02b03a4a66',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-222',
  'MECER UPS/Back Up Supply',
  'Electronic Equipment',
  'Electronic Equipment',
  848.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-222',
  'MECER UPS/Back Up Supply',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "222", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER UPS/Back Up Supply',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 848.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "222", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-222'
  AND id <> 'f0082638-795f-5a71-8eb2-ad02b03a4a66';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '32e86b41-d14d-50f2-bebc-33b1357a515b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-223',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  12000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-223',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "223", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "223", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-223'
  AND id <> '32e86b41-d14d-50f2-bebc-33b1357a515b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '64d8b18f-429f-54e8-9e25-efbce2883708',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-224',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-224',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "224", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "224", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-224'
  AND id <> '64d8b18f-429f-54e8-9e25-efbce2883708';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e549f949-fc2b-5451-a815-eaf350c14ef7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-225',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-225',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "225", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "225", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-225'
  AND id <> 'e549f949-fc2b-5451-a815-eaf350c14ef7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd2b1dd98-3067-51f4-9eb8-a60185e4c4e3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-226',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-226',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "226", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "226", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-226'
  AND id <> 'd2b1dd98-3067-51f4-9eb8-a60185e4c4e3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dbadd827-b592-5fdf-bc73-a4f33f2d20af',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-227',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  8282.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-227',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "227", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8282.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "227", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-227'
  AND id <> 'dbadd827-b592-5fdf-bc73-a4f33f2d20af';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6b282ea9-587f-5a48-875f-486bc632fdec',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-228',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5280.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-228',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "228", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5280.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "228", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-228'
  AND id <> '6b282ea9-587f-5a48-875f-486bc632fdec';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1e0f2e86-3bf2-50ec-9996-faba7891c321',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-229',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  8375.65,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-229',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "229", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'HP Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8375.65,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "229", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-229'
  AND id <> '1e0f2e86-3bf2-50ec-9996-faba7891c321';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bb8da1ba-f485-5eb7-b9e3-70e87d4d1a13',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-230',
  'Microsoft Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-230',
  'Microsoft Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "230", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Microsoft Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "230", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-230'
  AND id <> 'bb8da1ba-f485-5eb7-b9e3-70e87d4d1a13';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '649e1c27-8762-51bd-9c32-d586894cb884',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-231',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  0.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-231',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "231", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 0.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "231", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-231'
  AND id <> '649e1c27-8762-51bd-9c32-d586894cb884';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c289a08a-5c91-5a02-8765-cd0444ccb300',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-232',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-232',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "232", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "232", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-232'
  AND id <> 'c289a08a-5c91-5a02-8765-cd0444ccb300';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '81ab54bd-18fb-5ce6-aea5-7178670be6b5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-233',
  'ACER Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-233',
  'ACER Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "233", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "233", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-233'
  AND id <> '81ab54bd-18fb-5ce6-aea5-7178670be6b5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5f8d1bf4-454f-5d7f-8a68-574c01d85de1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-235',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  7300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-235',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "235", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 7300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "235", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-235'
  AND id <> '5f8d1bf4-454f-5d7f-8a68-574c01d85de1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '82c5dba8-e56a-5a65-ab2c-45c8627f6f1c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-236',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-236',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "236", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "236", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-236'
  AND id <> '82c5dba8-e56a-5a65-ab2c-45c8627f6f1c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8d3bf158-b133-5bb9-a0c2-d5e4983d5534',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-237',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4532.64,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-237',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "237", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4532.64,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "237", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-237'
  AND id <> '8d3bf158-b133-5bb9-a0c2-d5e4983d5534';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '870b70ac-bafa-5b2f-8b0f-4ee87da0f00f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-239',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  6258.75,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-239',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "239", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 6258.75,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "239", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-239'
  AND id <> '870b70ac-bafa-5b2f-8b0f-4ee87da0f00f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9d85d4cf-faa8-5a35-bab7-87973b6a1334',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-240',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-240',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "240", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "240", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-240'
  AND id <> '9d85d4cf-faa8-5a35-bab7-87973b6a1334';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fd00a959-f9bd-5db4-98d4-9143ab94cbaf',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-244',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  16887.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-244',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "244", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 16887.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "244", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-244'
  AND id <> 'fd00a959-f9bd-5db4-98d4-9143ab94cbaf';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4b2b7886-bddd-5018-9394-4790f75bd21b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-245',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-245',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "245", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "245", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-245'
  AND id <> '4b2b7886-bddd-5018-9394-4790f75bd21b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8a7b0a9a-48dd-5376-ba57-012b2c488f23',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-246',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-246',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "246", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "246", "location_code": "WH-Recei", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-246'
  AND id <> '8a7b0a9a-48dd-5376-ba57-012b2c488f23';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '218e7d09-2f1c-5afe-af54-0537bc383485',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-256',
  'Server',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-256',
  'Server',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "256", "location_code": "GW15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Server',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "256", "location_code": "GW15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-256'
  AND id <> '218e7d09-2f1c-5afe-af54-0537bc383485';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e91877d0-c09b-510b-ba78-0c7fd6072c5c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-257',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  13840.5,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-257',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "257", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'HP Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 13840.5,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "257", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-257'
  AND id <> 'e91877d0-c09b-510b-ba78-0c7fd6072c5c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0e3249a7-c505-543c-84dc-29d929c96098',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-264',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-264',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "264", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "264", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-264'
  AND id <> '0e3249a7-c505-543c-84dc-29d929c96098';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '80395281-344f-5110-8845-8d51b6d95c5a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-265',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-265',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "265", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "265", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-265'
  AND id <> '80395281-344f-5110-8845-8d51b6d95c5a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '934d8402-66ad-5170-8ee5-b4c17395a577',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-267',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-267',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "267", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "267", "location_code": "WH-Pharm", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-267'
  AND id <> '934d8402-66ad-5170-8ee5-b4c17395a577';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4b4bb345-08e3-5933-babd-8e11d00bbf22',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-027',
  'P.TECH UPS Power Box',
  'Electronic Equipment',
  'Electronic Equipment',
  56340.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-027',
  'P.TECH UPS Power Box',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "27", "location_code": "G21", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'P.TECH UPS Power Box',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 56340.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "27", "location_code": "G21", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-027'
  AND id <> '4b4bb345-08e3-5933-babd-8e11d00bbf22';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c03bc24b-8a14-569f-a544-4e967b78f509',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-272',
  'Server',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-272',
  'Server',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "272", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Server',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "272", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-272'
  AND id <> 'c03bc24b-8a14-569f-a544-4e967b78f509';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f76d77a2-1c0f-52ac-aed8-402bbdf1d2a2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-273',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  10223.96,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-273',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "273", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10223.96,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "273", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-273'
  AND id <> 'f76d77a2-1c0f-52ac-aed8-402bbdf1d2a2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5829d20a-96e9-5a1d-a1af-558f10fc4b6a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-275',
  'Label Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  4700.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-275',
  'Label Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "275", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Label Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4700.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "275", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-275'
  AND id <> '5829d20a-96e9-5a1d-a1af-558f10fc4b6a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b9938bf3-35fd-52ea-96ae-b373e550774a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-276',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  4783.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-276',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "276", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4783.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "276", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-276'
  AND id <> 'b9938bf3-35fd-52ea-96ae-b373e550774a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1f8d0002-879c-5031-b463-4159247a1a93',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-277',
  'ASUS monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-277',
  'ASUS monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "277", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "277", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-277'
  AND id <> '1f8d0002-879c-5031-b463-4159247a1a93';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e9787cd9-aa00-5344-9e95-56748a433754',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-278',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-278',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "278", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "278", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-278'
  AND id <> 'e9787cd9-aa00-5344-9e95-56748a433754';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0c78a3a5-5266-593b-b57e-c7a5946419a5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-279',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-279',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "279", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "279", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-279'
  AND id <> '0c78a3a5-5266-593b-b57e-c7a5946419a5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2646d389-1af5-5608-9d9f-887cb89b2db2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-028',
  'Server 192.168.25.5',
  'Electronic Equipment',
  'Electronic Equipment',
  3143.89,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-028',
  'Server 192.168.25.5',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "28", "location_code": "G21", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Server 192.168.25.5',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3143.89,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "28", "location_code": "G21", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-028'
  AND id <> '2646d389-1af5-5608-9d9f-887cb89b2db2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4a0407a6-ca00-5fda-921e-4df6b5c798cf',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-280',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-280',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "280", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "280", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-280'
  AND id <> '4a0407a6-ca00-5fda-921e-4df6b5c798cf';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ec0503a6-35c1-5e4b-9c6d-bb0a1666e92d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-281',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-281',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "281", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "281", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-281'
  AND id <> 'ec0503a6-35c1-5e4b-9c6d-bb0a1666e92d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '12078249-cafc-5efb-b81d-7c63b3107072',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-284',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-284',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "284", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "284", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-284'
  AND id <> '12078249-cafc-5efb-b81d-7c63b3107072';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '068e4973-bc09-538f-81e5-31032f09895f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-285',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  5483.33,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-285',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "285", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5483.33,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "285", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-285'
  AND id <> '068e4973-bc09-538f-81e5-31032f09895f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9b6660b2-1e8d-580e-9c60-5d50ce2983f5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-286',
  'Canon Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-286',
  'Canon Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "286", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Canon Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "286", "location_code": "WH-Inven", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-286'
  AND id <> '9b6660b2-1e8d-580e-9c60-5d50ce2983f5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd9715f0a-00fc-5631-854d-ec9afefd6cd8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-029',
  'Server 192.168.25.9',
  'Electronic Equipment',
  'Electronic Equipment',
  3143.89,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-029',
  'Server 192.168.25.9',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "29", "location_code": "G21", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Server 192.168.25.9',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3143.89,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "29", "location_code": "G21", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-029'
  AND id <> 'd9715f0a-00fc-5631-854d-ec9afefd6cd8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8d90e1a7-1522-5831-a6fa-220c24998541',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-291',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  10827.25,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-291',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "291", "location_code": "WH-Train", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ACER Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10827.25,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "291", "location_code": "WH-Train", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-291'
  AND id <> '8d90e1a7-1522-5831-a6fa-220c24998541';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'de8e7a0b-39bd-5783-86ee-dfcc8be0037f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-292',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-292',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "292", "location_code": "WH-Train", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "292", "location_code": "WH-Train", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-292'
  AND id <> 'de8e7a0b-39bd-5783-86ee-dfcc8be0037f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '988037ef-ffda-5c05-9c09-1a807bb730e7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-302',
  'BOSS MONITORING SYSTEM (COLD CURVE WORKI',
  'Electronic Equipment',
  'Electronic Equipment',
  63579.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-302',
  'BOSS MONITORING SYSTEM (COLD CURVE WORKI',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "302", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'BOSS MONITORING SYSTEM (COLD CURVE WORKI',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 63579.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "302", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-302'
  AND id <> '988037ef-ffda-5c05-9c09-1a807bb730e7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6d0dba78-4a96-5741-9746-f6ca163ebbd3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-310',
  'Fridge SMS Module',
  'Electronic Equipment',
  'Electronic Equipment',
  61486.15,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-310',
  'Fridge SMS Module',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "310", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Fridge SMS Module',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 61486.15,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "310", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-310'
  AND id <> '6d0dba78-4a96-5741-9746-f6ca163ebbd3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd7c90acf-2dfa-5fef-8082-63218ac951ae',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-331',
  'Telephone System',
  'Electronic Equipment',
  'Electronic Equipment',
  20259.49,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-331',
  'Telephone System',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "331", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Telephone System',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 20259.49,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "331", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-331'
  AND id <> 'd7c90acf-2dfa-5fef-8082-63218ac951ae';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2f8cb5ab-e95c-5769-8b67-982a5253b1da',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-332',
  'Tablet counter - Kirby Lester (KL15E & K',
  'Electronic Equipment',
  'Electronic Equipment',
  115578.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-332',
  'Tablet counter - Kirby Lester (KL15E & K',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "332", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Tablet counter - Kirby Lester (KL15E & K',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 115578.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "332", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-332'
  AND id <> '2f8cb5ab-e95c-5769-8b67-982a5253b1da';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3bd2b57d-1c57-591f-b2ff-e1c2ea8a9c32',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-340',
  'UNITEMP DATA LOGGER',
  'Electronic Equipment',
  'Electronic Equipment',
  12938.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-340',
  'UNITEMP DATA LOGGER',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "340", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'UNITEMP DATA LOGGER',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12938.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "340", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-340'
  AND id <> '3bd2b57d-1c57-591f-b2ff-e1c2ea8a9c32';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4ac9be9e-1be2-5af1-ab05-4dbe7afcf991',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-342',
  'GSM FRIDGE DATA LOGGER 2',
  'Electronic Equipment',
  'Electronic Equipment',
  7524.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-342',
  'GSM FRIDGE DATA LOGGER 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "342", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'GSM FRIDGE DATA LOGGER 2',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 7524.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "342", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-342'
  AND id <> '4ac9be9e-1be2-5af1-ab05-4dbe7afcf991';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5dc99e4f-efd6-5133-8a8d-ff64d675bce4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-344',
  'UNITEMP DATA LOGGERS',
  'Electronic Equipment',
  'Electronic Equipment',
  15702.36,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-344',
  'UNITEMP DATA LOGGERS',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "344", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'UNITEMP DATA LOGGERS',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15702.36,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "344", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-344'
  AND id <> '5dc99e4f-efd6-5133-8a8d-ff64d675bce4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6d2112d3-1940-5570-a69c-742cf7317408',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-347',
  'TEMPERATURE LOGGERS (AIRSEP)',
  'Electronic Equipment',
  'Electronic Equipment',
  19070.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-347',
  'TEMPERATURE LOGGERS (AIRSEP)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "347", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'TEMPERATURE LOGGERS (AIRSEP)',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 19070.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "347", "location_code": "WH-Cold", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-347'
  AND id <> '6d2112d3-1940-5570-a69c-742cf7317408';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6e373a12-536d-51d6-ad6c-83f3c17dc006',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-358',
  'TEMP MAPPING',
  'Electronic Equipment',
  'Electronic Equipment',
  337932.56,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-358',
  'TEMP MAPPING',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "358", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'TEMP MAPPING',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 337932.56,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "358", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-358'
  AND id <> '6e373a12-536d-51d6-ad6c-83f3c17dc006';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3178905a-00ad-5824-9fb7-0ed99837709d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-361',
  'ECO TIME UNIT (CMD)',
  'Electronic Equipment',
  'Electronic Equipment',
  23967.13,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-361',
  'ECO TIME UNIT (CMD)',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "361", "location_code": "GW1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ECO TIME UNIT (CMD)',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 23967.13,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "361", "location_code": "GW1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-361'
  AND id <> '3178905a-00ad-5824-9fb7-0ed99837709d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '04fd9234-667d-5436-8295-bf54f3f8d950',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-362',
  'ECO TIME system',
  'Electronic Equipment',
  'Electronic Equipment',
  23967.13,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-362',
  'ECO TIME system',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "362", "location_code": "GW1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ECO TIME system',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 23967.13,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "362", "location_code": "GW1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-362'
  AND id <> '04fd9234-667d-5436-8295-bf54f3f8d950';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '82410339-1c52-550a-848d-f1e74e938ba0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-363',
  'Network Infrastructure',
  'Electronic Equipment',
  'Electronic Equipment',
  125945.5,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-363',
  'Network Infrastructure',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "363", "location_code": "F15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Network Infrastructure',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 125945.5,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "363", "location_code": "F15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-363'
  AND id <> '82410339-1c52-550a-848d-f1e74e938ba0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'aee6db5e-2c67-53da-8e74-4340c866dc54',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-364',
  'USB to serial converter-L Wessels-Digit',
  'Electronic Equipment',
  'Electronic Equipment',
  521.74,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-364',
  'USB to serial converter-L Wessels-Digit',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "364", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'USB to serial converter-L Wessels-Digit',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 521.74,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "364", "location_code": "WH-Gener", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-364'
  AND id <> 'aee6db5e-2c67-53da-8e74-4340c866dc54';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8a6cd47d-70a7-58eb-a0bb-4c4c377a436e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-368',
  'Hisense TV 1',
  'Electronic Equipment',
  'Electronic Equipment',
  12150.58,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-368',
  'Hisense TV 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "368", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Hisense TV 1',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12150.58,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "368", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-368'
  AND id <> '8a6cd47d-70a7-58eb-a0bb-4c4c377a436e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7dcd1fff-5560-5849-b490-509787200974',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-369',
  'Hisense TV 2',
  'Electronic Equipment',
  'Electronic Equipment',
  12150.58,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-369',
  'Hisense TV 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "369", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Hisense TV 2',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12150.58,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "369", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-369'
  AND id <> '7dcd1fff-5560-5849-b490-509787200974';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '01b40857-b5f8-5023-babb-e86a5767c17a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-370',
  'LG TV',
  'Electronic Equipment',
  'Electronic Equipment',
  12150.58,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-370',
  'LG TV',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "370", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'LG TV',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12150.58,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "370", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-370'
  AND id <> '01b40857-b5f8-5023-babb-e86a5767c17a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '670f54a7-697f-5538-b62a-2d90713d0d52',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-371',
  'Keyboard 1',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-371',
  'Keyboard 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "371", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard 1',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "371", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-371'
  AND id <> '670f54a7-697f-5538-b62a-2d90713d0d52';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f73d5bc4-dca9-54f6-8ca7-42f807fdf670',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-372',
  'Keyboard 2',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-372',
  'Keyboard 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "372", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard 2',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "372", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-372'
  AND id <> 'f73d5bc4-dca9-54f6-8ca7-42f807fdf670';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '957250fb-baf5-5b5f-a567-0894e5fdc424',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-373',
  'Keyboard 3',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-373',
  'Keyboard 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "373", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard 3',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "373", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-373'
  AND id <> '957250fb-baf5-5b5f-a567-0894e5fdc424';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9623c224-b1c0-5c45-a535-5e2eab7bdfba',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-374',
  'Mouse 1',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-374',
  'Mouse 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "374", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse 1',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "374", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-374'
  AND id <> '9623c224-b1c0-5c45-a535-5e2eab7bdfba';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ba06a272-cc89-5b8c-b039-077a3edfc05b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-375',
  'Mouse 2',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-375',
  'Mouse 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "375", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse 2',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "375", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-375'
  AND id <> 'ba06a272-cc89-5b8c-b039-077a3edfc05b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9fb7de64-dc8d-5d7b-b701-030b9d3ee428',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-376',
  'Mouse 3',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-376',
  'Mouse 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "376", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse 3',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "376", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-376'
  AND id <> '9fb7de64-dc8d-5d7b-b701-030b9d3ee428';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd9fcd8b2-750e-5ba4-af34-d3be2ef13509',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-377',
  'ASUS PC',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-377',
  'ASUS PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "377", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "377", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-377'
  AND id <> 'd9fcd8b2-750e-5ba4-af34-d3be2ef13509';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7c00f85a-6d09-5029-9613-0ee6dc09b820',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-378',
  'MECER PC',
  'Electronic Equipment',
  'Electronic Equipment',
  8282.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-378',
  'MECER PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "378", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8282.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "378", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-378'
  AND id <> '7c00f85a-6d09-5029-9613-0ee6dc09b820';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '58e2aabd-1c13-546c-b49e-d5989cf279ee',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-379',
  'Maximus PC',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-379',
  'Maximus PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "379", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Maximus PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "379", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-379'
  AND id <> '58e2aabd-1c13-546c-b49e-d5989cf279ee';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '96b444f0-ad4d-5ee5-9dbb-689399de2e10',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-380',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-380',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "380", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "380", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-380'
  AND id <> '96b444f0-ad4d-5ee5-9dbb-689399de2e10';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'eb48cffc-d152-583c-a1a2-7152a23f3ffe',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-381',
  'MECER PC Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-381',
  'MECER PC Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "381", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER PC Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "381", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-381'
  AND id <> 'eb48cffc-d152-583c-a1a2-7152a23f3ffe';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '877845ef-9136-503c-99a7-9eebce3c5206',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-382',
  'HP Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  5935.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-382',
  'HP Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "382", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'HP Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5935.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "382", "location_code": "GW5", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-382'
  AND id <> '877845ef-9136-503c-99a7-9eebce3c5206';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '83c36684-80b3-58e3-ab1d-b9d98aa88741',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-383',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-383',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "383", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'PC',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "383", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-383'
  AND id <> '83c36684-80b3-58e3-ab1d-b9d98aa88741';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '27649eb9-3e40-5b58-970e-d25cfb4dc2d8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-384',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-384',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "384", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "384", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-384'
  AND id <> '27649eb9-3e40-5b58-970e-d25cfb4dc2d8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1bacde09-bf51-5107-b48d-5a133263480a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-385',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-385',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "385", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "385", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-385'
  AND id <> '1bacde09-bf51-5107-b48d-5a133263480a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2cd5db8d-0972-5177-b158-9f4435351984',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-386',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-386',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "386", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "386", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-386'
  AND id <> '2cd5db8d-0972-5177-b158-9f4435351984';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5a0f4a10-796f-5ccb-82c6-c8c85e1e7640',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-387',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  8975.65,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-387',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "387", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'ASUS Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8975.65,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "387", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-387'
  AND id <> '5a0f4a10-796f-5ccb-82c6-c8c85e1e7640';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '23c36473-b73e-5f03-ae0e-e8bf848ea1d4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-388',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-388',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "388", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'MECER Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "388", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-388'
  AND id <> '23c36473-b73e-5f03-ae0e-e8bf848ea1d4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '19c5d170-d7be-5913-a1e9-bbb85ad702c0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-389',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-389',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "389", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mitel Office Telephone',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "389", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-389'
  AND id <> '19c5d170-d7be-5913-a1e9-bbb85ad702c0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3b20dce8-a7b6-5eca-875e-2be50c92c5ad',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-390',
  'HP Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  2832.32,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-390',
  'HP Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "390", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'HP Printer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2832.32,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "390", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-390'
  AND id <> '3b20dce8-a7b6-5eca-875e-2be50c92c5ad';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7618e4ed-d711-57d1-87c0-257eb6db2621',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-391',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-391',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "391", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "391", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-391'
  AND id <> '7618e4ed-d711-57d1-87c0-257eb6db2621';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd1d0be51-34b8-5b49-abb1-746295bfa420',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-401',
  'Scanner',
  'Electronic Equipment',
  'Electronic Equipment',
  19476.52,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-401',
  'Scanner',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "401", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Scanner',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 19476.52,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "401", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-401'
  AND id <> 'd1d0be51-34b8-5b49-abb1-746295bfa420';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd4a4f2b2-b4ca-583e-9e5a-dd6c26cbf6ea',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-402',
  'Chair 1',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-402',
  'Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "402", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "402", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-402'
  AND id <> 'd4a4f2b2-b4ca-583e-9e5a-dd6c26cbf6ea';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3070a93a-fd74-5e27-ad71-64c6532da5ee',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-403',
  'Scanner',
  'Electronic Equipment',
  'Electronic Equipment',
  19476.52,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-403',
  'Scanner',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "403", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Scanner',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 19476.52,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "403", "location_code": "G0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-403'
  AND id <> '3070a93a-fd74-5e27-ad71-64c6532da5ee';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fb99ba39-cd96-5a5b-9297-acb8abddb6f3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-409',
  'Security Cameras for Freezer',
  'Electronic Equipment',
  'Electronic Equipment',
  24160.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-409',
  'Security Cameras for Freezer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "409", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Security Cameras for Freezer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 24160.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "409", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-409'
  AND id <> 'fb99ba39-cd96-5a5b-9297-acb8abddb6f3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '47573183-44c0-5c0d-91f0-652a62b7274b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-410',
  '32 ch 5 mph 4xHDD DVR for security recor',
  'Electronic Equipment',
  'Electronic Equipment',
  8999.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-410',
  '32 ch 5 mph 4xHDD DVR for security recor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "410", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = '32 ch 5 mph 4xHDD DVR for security recor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8999.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "410", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-410'
  AND id <> '47573183-44c0-5c0d-91f0-652a62b7274b';
COMMIT;