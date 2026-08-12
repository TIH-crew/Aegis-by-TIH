BEGIN;
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
  '2dee6eb1-07ad-5f7a-a301-982fe9bba18d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-533',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  12327.32,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-533',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "533", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 12327.32,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "533", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-533'
  AND id <> '2dee6eb1-07ad-5f7a-a301-982fe9bba18d';
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
  '4f756a2d-4e1d-5807-97e2-4d2b48ef3fb5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-054',
  'ACER Projector',
  'Electronic Equipment',
  'Electronic Equipment',
  8505.16,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-054',
  'ACER Projector',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "54", "location_code": "G15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'ACER Projector',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8505.16,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "54", "location_code": "G15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-054'
  AND id <> '4f756a2d-4e1d-5807-97e2-4d2b48ef3fb5';
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
  'a73fc928-3446-56c0-ac6f-cc569584a063',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-542',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  8286.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-542',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "542", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 8286.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "542", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-542'
  AND id <> 'a73fc928-3446-56c0-ac6f-cc569584a063';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5fde6790-5b9b-5b0a-b7be-aef1d5a58e5a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-543',
  'Wireless Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  520.87,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-543',
  'Wireless Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "543", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Wireless Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 520.87,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "543", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-543'
  AND id <> '5fde6790-5b9b-5b0a-b7be-aef1d5a58e5a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4deb9388-6124-5547-8a4a-e6b4cc439efd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-438',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-438',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "438", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "438", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-438'
  AND id <> '4deb9388-6124-5547-8a4a-e6b4cc439efd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bcc081c0-fe17-5540-ab8d-8b406aef17d9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-518',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-518',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "518", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "518", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-518'
  AND id <> 'bcc081c0-fe17-5540-ab8d-8b406aef17d9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '76f70bc4-50be-5fe2-b98e-1459171a097c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-535',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-535',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "535", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "535", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-535'
  AND id <> '76f70bc4-50be-5fe2-b98e-1459171a097c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a6e229fb-7e14-585e-9de4-11846f912d10',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-544',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-544',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "544", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "544", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-544'
  AND id <> 'a6e229fb-7e14-585e-9de4-11846f912d10';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2bffaaea-065a-5bbb-bf04-082f1de10d64',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-552',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-552',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "552", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "552", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-552'
  AND id <> '2bffaaea-065a-5bbb-bf04-082f1de10d64';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e82950e9-e63e-5a5e-9f73-20502dd1e02e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-558',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-558',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "558", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "558", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-558'
  AND id <> 'e82950e9-e63e-5a5e-9f73-20502dd1e02e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6bdd1829-7803-5e99-8247-a4108f1b9137',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-608',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-608',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "608", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "608", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-608'
  AND id <> '6bdd1829-7803-5e99-8247-a4108f1b9137';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7de6742b-506e-54db-b10a-e5e5183a55f7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-061',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-061',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "61", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "61", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-061'
  AND id <> '7de6742b-506e-54db-b10a-e5e5183a55f7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a614e47f-0e8f-59e4-8e45-9c123cb43454',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-624',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-624',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "624", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "624", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-624'
  AND id <> 'a614e47f-0e8f-59e4-8e45-9c123cb43454';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '13eb5c82-b72b-5523-8ddd-41b50dc2cc01',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-658',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-658',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "658", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "658", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-658'
  AND id <> '13eb5c82-b72b-5523-8ddd-41b50dc2cc01';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8728b700-58b5-5d26-929f-5749cfa989e6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-553',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11834.15,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-553',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "553", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 11834.15,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "553", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-553'
  AND id <> '8728b700-58b5-5d26-929f-5749cfa989e6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '024babc3-8ba4-5551-a3c4-13c7938ab3f1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-676',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-676',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "676", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "676", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-676'
  AND id <> '024babc3-8ba4-5551-a3c4-13c7938ab3f1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'cfe53834-a4a1-51c3-a8cc-266596005251',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-682',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-682',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "682", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "682", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-682'
  AND id <> 'cfe53834-a4a1-51c3-a8cc-266596005251';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e6303ee0-5cd9-5b16-87f9-9b1852ce11c7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-769',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-769',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "769", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "769", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-769'
  AND id <> 'e6303ee0-5cd9-5b16-87f9-9b1852ce11c7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9c60520c-8591-5b14-a1a8-340db9159d95',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-772',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-772',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "772", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "772", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-772'
  AND id <> '9c60520c-8591-5b14-a1a8-340db9159d95';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0e6dbe59-c06a-5a04-92d8-eeade3667500',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-778',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-778',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "778", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "778", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-778'
  AND id <> '0e6dbe59-c06a-5a04-92d8-eeade3667500';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '94e7e545-66d2-59a1-b5f9-a40940883086',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-559',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  6999.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-559',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "559", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 6999.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "559", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-559'
  AND id <> '94e7e545-66d2-59a1-b5f9-a40940883086';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f562928d-e59b-56f2-9740-8b2c218f318f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-782',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-782',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "782", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "782", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-782'
  AND id <> 'f562928d-e59b-56f2-9740-8b2c218f318f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5dd8d44c-4c0f-59e5-808c-b07b9671e954',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-785',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-785',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "785", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "785", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-785'
  AND id <> '5dd8d44c-4c0f-59e5-808c-b07b9671e954';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '332fcad7-e88e-55d6-872a-72997b2287c0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B1-791',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B1-791',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "791", "location_code": "B1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "791", "location_code": "B1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B1-791'
  AND id <> '332fcad7-e88e-55d6-872a-72997b2287c0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '53bec137-646f-5d70-b2fb-7cde96e4dddd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B1-792',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B1-792',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "792", "location_code": "B1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "792", "location_code": "B1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B1-792'
  AND id <> '53bec137-646f-5d70-b2fb-7cde96e4dddd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2eda22c0-ff84-53cf-bf7a-659bc7537fb1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B1-796',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B1-796',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "796", "location_code": "B1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "796", "location_code": "B1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B1-796'
  AND id <> '2eda22c0-ff84-53cf-bf7a-659bc7537fb1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ea7a7895-faa6-5d6b-a078-0097ffe915b1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-832',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-832',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "832", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "832", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-832'
  AND id <> 'ea7a7895-faa6-5d6b-a078-0097ffe915b1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '85431dce-8903-54b2-a38a-2a14e20c04ff',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-837',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-837',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "837", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "837", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-837'
  AND id <> '85431dce-8903-54b2-a38a-2a14e20c04ff';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e77049c1-e8dc-5103-8388-eba5757040c3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-840',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-840',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "840", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "840", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-840'
  AND id <> 'e77049c1-e8dc-5103-8388-eba5757040c3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd5ae6815-22c9-5d73-9e49-268109cf2231',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-850',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-850',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "850", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "850", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-850'
  AND id <> 'd5ae6815-22c9-5d73-9e49-268109cf2231';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'de095d9a-264c-55e5-82c6-bf6b4853083a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-854',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-854',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "854", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "854", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-854'
  AND id <> 'de095d9a-264c-55e5-82c6-bf6b4853083a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c439d726-b008-50a7-9089-2de11f5be0ad',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-858',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-858',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "858", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "858", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-858'
  AND id <> 'c439d726-b008-50a7-9089-2de11f5be0ad';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dddf0d35-59fb-542d-9e34-1cb7681d92c4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-882',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-882',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "882", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "882", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-882'
  AND id <> 'dddf0d35-59fb-542d-9e34-1cb7681d92c4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e192c4d0-7166-5406-9801-fd0383d12f09',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-894',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-894',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "894", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "894", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-894'
  AND id <> 'e192c4d0-7166-5406-9801-fd0383d12f09';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '30d22e20-caaa-5d2d-b927-00b3ca99e7a8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-899',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-899',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "899", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "899", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-899'
  AND id <> '30d22e20-caaa-5d2d-b927-00b3ca99e7a8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5a9546c1-2f66-5a79-bb74-6d5f7c545cb2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-578',
  'Wireless Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  1250.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-578',
  'Wireless Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "578", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Wireless Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 1250.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "578", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-578'
  AND id <> '5a9546c1-2f66-5a79-bb74-6d5f7c545cb2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c7451fb8-3a5f-5117-9a48-f035babf940b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-096',
  'Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-096',
  'Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "96", "location_code": "WH-QA &", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "96", "location_code": "WH-QA &", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-096'
  AND id <> 'c7451fb8-3a5f-5117-9a48-f035babf940b';
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
  'e75e384a-f31b-50fa-a614-b3f239b4031e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-580',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  27669.99,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-580',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "580", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 27669.99,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "580", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-580'
  AND id <> 'e75e384a-f31b-50fa-a614-b3f239b4031e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b8504071-8125-5e78-b107-23d329697839',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-581',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  6050.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-581',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "581", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 6050.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "581", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-581'
  AND id <> 'b8504071-8125-5e78-b107-23d329697839';
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
  'e98cfa87-4aa6-5141-94ab-7c582d8d5050',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-584',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2607.83,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-584',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "584", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 2607.83,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "584", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-584'
  AND id <> 'e98cfa87-4aa6-5141-94ab-7c582d8d5050';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2dd46663-0110-5833-8706-3eedebe804be',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-585',
  'RAM - R Dreyer',
  'Electronic Equipment',
  'Electronic Equipment',
  868.7,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-585',
  'RAM - R Dreyer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "585", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'RAM - R Dreyer',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 868.7,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "585", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-585'
  AND id <> '2dd46663-0110-5833-8706-3eedebe804be';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '895c6d2c-28cd-5423-aa39-a70ad64a086d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-586',
  'HDMI Port x2-Rudi',
  'Electronic Equipment',
  'Electronic Equipment',
  498.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-586',
  'HDMI Port x2-Rudi',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "586", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HDMI Port x2-Rudi',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 498.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "586", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-586'
  AND id <> '895c6d2c-28cd-5423-aa39-a70ad64a086d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '71a8fae5-32f1-5e86-9e21-77d3f31a495e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-587',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  9993.5,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-587',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "587", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 9993.5,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "587", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-587'
  AND id <> '71a8fae5-32f1-5e86-9e21-77d3f31a495e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5cede18a-6dea-5a64-a35e-9db0324ee866',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-897',
  'NOC Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-897',
  'NOC Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "897", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'NOC Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "897", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-897'
  AND id <> '5cede18a-6dea-5a64-a35e-9db0324ee866';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7d3f5195-0347-5409-b9e0-472729a1601e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-009',
  'NOC PC Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-009',
  'NOC PC Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "9", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'NOC PC Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "9", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-009'
  AND id <> '7d3f5195-0347-5409-b9e0-472729a1601e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5cd8cf86-27ef-574b-ab3d-d8fb2c30808d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-659',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  8610.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-659',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "659", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 8610.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "659", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-659'
  AND id <> '5cd8cf86-27ef-574b-ab3d-d8fb2c30808d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f4d4a83d-8447-576e-b317-d1168d1f9e24',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-662',
  'Server',
  'Electronic Equipment',
  'Electronic Equipment',
  5791.2,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-662',
  'Server',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "662", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 5791.2,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "662", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-662'
  AND id <> 'f4d4a83d-8447-576e-b317-d1168d1f9e24';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '54c3d2d3-bc56-56f8-9329-02e97673482d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-663',
  'Server',
  'Electronic Equipment',
  'Electronic Equipment',
  5791.2,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-663',
  'Server',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "663", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 5791.2,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "663", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-663'
  AND id <> '54c3d2d3-bc56-56f8-9329-02e97673482d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7b50355c-39ac-5c43-b936-ebfeb3d598fd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-736',
  'HP Printer m651 LaserJet',
  'Electronic Equipment',
  'Electronic Equipment',
  4545.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-736',
  'HP Printer m651 LaserJet',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "736", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer m651 LaserJet',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4545.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "736", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-736'
  AND id <> '7b50355c-39ac-5c43-b936-ebfeb3d598fd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3b24f897-493f-598d-847e-7af112216c2d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-737',
  'Apple Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  30773.91,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-737',
  'Apple Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "737", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Apple Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 30773.91,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "737", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-737'
  AND id <> '3b24f897-493f-598d-847e-7af112216c2d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2ee86daf-70ce-576c-83e1-d2168e8c9575',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-741',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  14150.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-741',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "741", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 14150.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "741", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-741'
  AND id <> '2ee86daf-70ce-576c-83e1-d2168e8c9575';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '16b671cb-4a88-51f6-b330-887c3f67fe24',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-746',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11077.59,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-746',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "746", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "746", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-746'
  AND id <> '16b671cb-4a88-51f6-b330-887c3f67fe24';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '40c6c02a-6747-5405-a738-e83398b0d1e3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-835',
  'Mecer Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5415.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-835',
  'Mecer Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "835", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Mecer Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5415.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "835", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-835'
  AND id <> '40c6c02a-6747-5405-a738-e83398b0d1e3';
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
  50000.0,
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
  unit_cost = 50000.0,
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
  'c03bc24b-8a14-569f-a544-4e967b78f509',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-272',
  'Server',
  'Electronic Equipment',
  'Electronic Equipment',
  50000.0,
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
  unit_cost = 50000.0,
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
  '712eb1a3-9edf-533e-8b4a-9fa9fd32d766',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-925',
  'Server',
  'Electronic Equipment',
  'Electronic Equipment',
  50000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-925',
  'Server',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "925", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 50000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "925", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-925'
  AND id <> '712eb1a3-9edf-533e-8b4a-9fa9fd32d766';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e4c341df-2214-5f72-a214-e5353ec728a5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-845',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  6968.84,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-845',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "845", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 6968.84,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "845", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-845'
  AND id <> 'e4c341df-2214-5f72-a214-e5353ec728a5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'de9d98de-a716-5bf2-89c8-fab24409902f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-846',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  4694.3,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-846',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "846", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 4694.3,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "846", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-846'
  AND id <> 'de9d98de-a716-5bf2-89c8-fab24409902f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '44c1e10f-71ea-5162-bdf4-1b8b1cb80033',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-855',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  5037.66,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-855',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "855", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 5037.66,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "855", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-855'
  AND id <> '44c1e10f-71ea-5162-bdf4-1b8b1cb80033';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '678fe736-f5d1-5301-9ba9-69c9182edd90',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-856',
  'Mecer Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5415.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-856',
  'Mecer Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "856", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Mecer Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5415.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "856", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-856'
  AND id <> '678fe736-f5d1-5301-9ba9-69c9182edd90';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '439b49e5-d7d5-59c1-9f57-33675dbac5f0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-860',
  'Mecer Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  4760.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-860',
  'Mecer Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "860", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Mecer Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4760.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "860", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-860'
  AND id <> '439b49e5-d7d5-59c1-9f57-33675dbac5f0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'aa20773c-8e40-500e-a4c4-c47d6d9cfd83',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-863',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  5300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-863',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "863", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 5300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "863", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-863'
  AND id <> 'aa20773c-8e40-500e-a4c4-c47d6d9cfd83';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7747de56-1b65-56ba-a3ad-147db7656e33',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-867',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  6145.88,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-867',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "867", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 6145.88,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "867", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-867'
  AND id <> '7747de56-1b65-56ba-a3ad-147db7656e33';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '51c7d01d-124d-5b49-af89-29ed3e18e7eb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-868',
  'Mecer Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2760.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-868',
  'Mecer Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "868", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Mecer Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2760.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "868", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-868'
  AND id <> '51c7d01d-124d-5b49-af89-29ed3e18e7eb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b4e579e7-8107-514e-abd9-e5124b8f406c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-871',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  4412.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-871',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "871", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 4412.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "871", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-871'
  AND id <> 'b4e579e7-8107-514e-abd9-e5124b8f406c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7685634b-ad05-557c-9eb2-55e4483a0e78',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-879',
  'LG Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  5383.99,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-879',
  'LG Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "879", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'LG Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5383.99,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "879", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-879'
  AND id <> '7685634b-ad05-557c-9eb2-55e4483a0e78';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '147e2e93-4887-5e74-8069-a7d6ac056696',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-883',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  2455.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-883',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "883", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 2455.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "883", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-883'
  AND id <> '147e2e93-4887-5e74-8069-a7d6ac056696';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ad18f1bc-afb9-5df0-a4ac-8dffa6b01b29',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-884',
  'Mecer Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  1231.2,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-884',
  'Mecer Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "884", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Mecer Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 1231.2,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "884", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-884'
  AND id <> 'ad18f1bc-afb9-5df0-a4ac-8dffa6b01b29';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c42c0a24-394c-5adb-8be6-5066aa60d7b9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-947',
  'NETWORK PLUG AND DATA POINTS',
  'Electronic Equipment',
  'Electronic Equipment',
  24500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-947',
  'NETWORK PLUG AND DATA POINTS',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "947", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'NETWORK PLUG AND DATA POINTS',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 24500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "947", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-947'
  AND id <> 'c42c0a24-394c-5adb-8be6-5066aa60d7b9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd46353ee-9995-5461-8a34-eeb833a793f7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-949',
  'POD Device CMD',
  'Electronic Equipment',
  'Electronic Equipment',
  8000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-949',
  'POD Device CMD',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "949", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'POD Device CMD',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "949", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-949'
  AND id <> 'd46353ee-9995-5461-8a34-eeb833a793f7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2099569b-c58a-5638-a715-6a895563212f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-095',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  8375.65,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-095',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "95", "location_code": "WH-QA &", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "95", "location_code": "WH-QA &", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-095'
  AND id <> '2099569b-c58a-5638-a715-6a895563212f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a162ea64-6612-50f4-a976-2374a2469faa',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-950',
  'POD Device CMD',
  'Electronic Equipment',
  'Electronic Equipment',
  8000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-950',
  'POD Device CMD',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "950", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'POD Device CMD',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "950", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-950'
  AND id <> 'a162ea64-6612-50f4-a976-2374a2469faa';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'edbc7666-b5ac-5610-9501-3fe3888734df',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-953',
  'Brother MFC L5700DN CMD',
  'Electronic Equipment',
  'Electronic Equipment',
  7320.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-953',
  'Brother MFC L5700DN CMD',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "953", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Brother MFC L5700DN CMD',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 7320.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "953", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-953'
  AND id <> 'edbc7666-b5ac-5610-9501-3fe3888734df';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0dcf9789-882c-5add-a7f5-0a30287ecd6b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-954',
  'Servipro Laptop CPT Warehouse Management',
  'Electronic Equipment',
  'Electronic Equipment',
  12618.99,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-954',
  'Servipro Laptop CPT Warehouse Management',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "954", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Servipro Laptop CPT Warehouse Management',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12618.99,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "954", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-954'
  AND id <> '0dcf9789-882c-5add-a7f5-0a30287ecd6b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9330e736-7c0e-529a-b1ee-9d56e43c4f7d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-955',
  'Servipro Printer CPT Warehouse Managemen',
  'Electronic Equipment',
  'Electronic Equipment',
  4100.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-955',
  'Servipro Printer CPT Warehouse Managemen',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "955", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Servipro Printer CPT Warehouse Managemen',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4100.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "955", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-955'
  AND id <> '9330e736-7c0e-529a-b1ee-9d56e43c4f7d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dbfc803d-b3f6-5632-a3bc-71890a9cc34e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-956',
  'Mecer monitor CPT J Gabriel',
  'Electronic Equipment',
  'Electronic Equipment',
  1651.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-956',
  'Mecer monitor CPT J Gabriel',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "956", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Mecer monitor CPT J Gabriel',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 1651.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "956", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-956'
  AND id <> 'dbfc803d-b3f6-5632-a3bc-71890a9cc34e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3f13341a-30e8-513f-bc56-995090bbd8a5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-957',
  'Office, Screen J Gabriel CPT',
  'Electronic Equipment',
  'Electronic Equipment',
  8951.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-957',
  'Office, Screen J Gabriel CPT',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "957", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Office, Screen J Gabriel CPT',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8951.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "957", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-957'
  AND id <> '3f13341a-30e8-513f-bc56-995090bbd8a5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3ad703e3-b242-50c9-9ae5-6788e5685f4a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-958',
  'Office, Screen M Houbert CPT',
  'Electronic Equipment',
  'Electronic Equipment',
  8951.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-958',
  'Office, Screen M Houbert CPT',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "958", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Office, Screen M Houbert CPT',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8951.0,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "958", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-958'
  AND id <> '3ad703e3-b242-50c9-9ae5-6788e5685f4a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'bcb4f4ec-c3bb-5266-8fde-c68a21290bde',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-CT-CE-973',
  'Esquire Tech 922911 x1 Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  8893.05,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-CT-CE-973',
  'Esquire Tech 922911 x1 Laptop',
  'c4444444-4444-4444-8444-444444444402',
  'Cape Town',
  '{"asset_list_code": "D101", "asset_number": "973", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
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
  name = 'Esquire Tech 922911 x1 Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 8893.05,
  branch_id = 'c4444444-4444-4444-8444-444444444402',
  branch = 'Cape Town',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "973", "location_code": "CPT", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-CT-CE-973'
  AND id <> 'bcb4f4ec-c3bb-5266-8fde-c68a21290bde';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f0dca853-b3fc-53a3-bd11-da22642d1dfb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-986',
  'Laptop P du Toit/Rentia Myburgh',
  'Electronic Equipment',
  'Electronic Equipment',
  10638.98,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-986',
  'Laptop P du Toit/Rentia Myburgh',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "986", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Laptop P du Toit/Rentia Myburgh',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10638.98,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "986", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-986'
  AND id <> 'f0dca853-b3fc-53a3-bd11-da22642d1dfb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '43107e2e-f9c8-5bdc-a07a-b44aa7ba09d3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-987',
  'Mecer 23.8'' monitor Lizzy CC/Renthea Gen',
  'Electronic Equipment',
  'Electronic Equipment',
  2433.91,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-987',
  'Mecer 23.8'' monitor Lizzy CC/Renthea Gen',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "987", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Mecer 23.8'' monitor Lizzy CC/Renthea Gen',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2433.91,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "987", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-987'
  AND id <> '43107e2e-f9c8-5bdc-a07a-b44aa7ba09d3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0154302d-5499-5575-ae11-a180b2815475',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-988',
  '40A4K Hisense 40'''' FHD Smart TV',
  'Electronic Equipment',
  'Electronic Equipment',
  3477.39,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-988',
  '40A4K Hisense 40'''' FHD Smart TV',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "988", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = '40A4K Hisense 40'''' FHD Smart TV',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3477.39,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "988", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-988'
  AND id <> '0154302d-5499-5575-ae11-a180b2815475';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '12230ed0-2e1f-59a2-9bc9-4cf45662dac8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-989',
  '40A4K Hisense 40'''' FHD Smart TV',
  'Electronic Equipment',
  'Electronic Equipment',
  3477.39,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-989',
  '40A4K Hisense 40'''' FHD Smart TV',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "989", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = '40A4K Hisense 40'''' FHD Smart TV',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3477.39,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "989", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-989'
  AND id <> '12230ed0-2e1f-59a2-9bc9-4cf45662dac8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'efa66607-41de-5b89-9377-209f67d34bc6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-579',
  'Weib Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-579',
  'Weib Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "579", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Weib Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "579", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-579'
  AND id <> 'efa66607-41de-5b89-9377-209f67d34bc6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '42923a95-53c7-5628-bda4-d34a0cc040be',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-694',
  'Dell Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-694',
  'Dell Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "694", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Dell Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "694", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-694'
  AND id <> '42923a95-53c7-5628-bda4-d34a0cc040be';
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
  '2ed75993-86a0-5538-bd7d-30fbfdca8797',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-767',
  'DVR Cameras',
  'Electronic Equipment',
  'Electronic Equipment',
  30000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-767',
  'DVR Cameras',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "767", "location_code": "F15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'DVR Cameras',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 30000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "767", "location_code": "F15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-767'
  AND id <> '2ed75993-86a0-5538-bd7d-30fbfdca8797';
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
  15000.0,
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
  unit_cost = 15000.0,
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
  '513ef3ac-5ef2-5851-a4bf-56f0d26d17f1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-661',
  'Fellowes Laminator',
  'Electronic Equipment',
  'Electronic Equipment',
  800.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-661',
  'Fellowes Laminator',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "661", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Fellowes Laminator',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 800.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "661", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-661'
  AND id <> '513ef3ac-5ef2-5851-a4bf-56f0d26d17f1';
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
  '2c03694a-34b4-54c5-ab82-31830dc7193c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-487',
  'Fellowes Shredder',
  'Electronic Equipment',
  'Electronic Equipment',
  4125.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-487',
  'Fellowes Shredder',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "487", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Fellowes Shredder',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4125.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "487", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-487'
  AND id <> '2c03694a-34b4-54c5-ab82-31830dc7193c';
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
  'a1337971-db95-5dff-957a-977429bc2547',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-173',
  'Fujistu Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  5000.0,
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
  unit_cost = 5000.0,
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
  '2a347008-3a3c-5899-ae87-bf645a55f9e8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-924',
  'Hanns Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-924',
  'Hanns Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "924", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Hanns Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "924", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-924'
  AND id <> '2a347008-3a3c-5899-ae87-bf645a55f9e8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ad2aece5-51dd-59b0-a3f7-f98afd656756',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-392',
  'Hisense AC AC54',
  'Electronic Equipment',
  'Electronic Equipment',
  5500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-392',
  'Hisense AC AC54',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "392", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Hisense AC AC54',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "392", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-392'
  AND id <> 'ad2aece5-51dd-59b0-a3f7-f98afd656756';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a60d78a5-18ed-5604-ab3d-b7418d09f43a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-088',
  'Hisense TV',
  'Electronic Equipment',
  'Electronic Equipment',
  5000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-WH-088',
  'Hisense TV',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "88", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Hisense TV',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "88", "location_code": "WH-Secur", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-WH-088'
  AND id <> 'a60d78a5-18ed-5604-ab3d-b7418d09f43a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4cd078fc-d097-5747-82bc-4aae6422ec89',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-657',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-657',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "657", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "657", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-657'
  AND id <> '4cd078fc-d097-5747-82bc-4aae6422ec89';
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
  'be62cb46-93e4-5151-b2d2-5760b51e11a7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-011',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-011',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "11", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "11", "location_code": "G1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-011'
  AND id <> 'be62cb46-93e4-5151-b2d2-5760b51e11a7';
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
  500.0,
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
  unit_cost = 500.0,
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
  '6b81793b-7f0a-5562-9a7a-60333090cfb6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-140',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'b39b39fc-ecd1-5c73-8885-b86fefdbace5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-153',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  '548239b7-4d95-5218-aa09-4acbb0e2624d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-168',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'f562b632-b87c-5041-86b2-f128d8ce5153',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-175',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'f221ba64-d87e-570f-8db1-417d6881d7cc',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-211',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'f15d69ac-757b-5e5b-9227-61f175822601',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-219',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'e549f949-fc2b-5451-a815-eaf350c14ef7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-225',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'e9787cd9-aa00-5344-9e95-56748a433754',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-WH-278',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  '1bacde09-bf51-5107-b48d-5a133263480a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-385',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
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
  unit_cost = 500.0,
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
  'cb14b0ee-f479-53ab-b14b-7075c0cb03f3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-557',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-557',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "557", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "557", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-557'
  AND id <> 'cb14b0ee-f479-53ab-b14b-7075c0cb03f3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2ea52e36-5ccd-5e68-a318-9aa14e4ebd9e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-609',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-609',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "609", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "609", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-609'
  AND id <> '2ea52e36-5ccd-5e68-a318-9aa14e4ebd9e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '26a14972-7dcc-583b-a091-190c2d90fada',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-717',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-717',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "717", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "717", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-717'
  AND id <> '26a14972-7dcc-583b-a091-190c2d90fada';
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
  'bc110030-54da-5249-9525-98648ebdd276',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-GZ-B13-773',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-GZ-B13-773',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "773", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "773", "location_code": "B13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-GZ-B13-773'
  AND id <> 'bc110030-54da-5249-9525-98648ebdd276';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c11981b2-0c6d-50ea-a785-72371d9d2896',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-831',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-831',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "831", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "831", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-831'
  AND id <> 'c11981b2-0c6d-50ea-a785-72371d9d2896';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '313b5a8c-da39-502c-82bc-2e0c97b7e862',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-836',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-836',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "836", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "836", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-836'
  AND id <> '313b5a8c-da39-502c-82bc-2e0c97b7e862';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9784b8fc-0ed3-5b98-935a-f1c093a78f13',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-DR-839',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  500.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-DR-839',
  'Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "839", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 500.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "839", "location_code": "F41", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-DR-839'
  AND id <> '9784b8fc-0ed3-5b98-935a-f1c093a78f13';
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
COMMIT;