BEGIN;
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
  2000.0,
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
  unit_cost = 2000.0,
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
  '991d60ac-910f-57c5-8872-f66ba7ce2097',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-501',
  'JURA coffee station',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-501',
  'JURA coffee station',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "501", "location_code": "F18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'JURA coffee station',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "501", "location_code": "F18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-501'
  AND id <> '991d60ac-910f-57c5-8872-f66ba7ce2097';
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
  'd10e96e7-0f12-5744-bcea-e71a6a3fe55b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-504',
  'Samsung Microwave Silver',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '6b3e72b8-4f46-5902-bb9a-b979adc7809f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-505',
  'Water Cooler',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '70af855d-153e-5e28-8121-913f16197407',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-508',
  'Office Chair - Guest',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-508',
  'Office Chair - Guest',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "508", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "508", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-508'
  AND id <> '70af855d-153e-5e28-8121-913f16197407';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a593dbe4-3fa6-5612-8499-c0d0acad9476',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-509',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-509',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "509", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "509", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-509'
  AND id <> 'a593dbe4-3fa6-5612-8499-c0d0acad9476';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd8cb6d04-4d97-5e23-abe9-3d4cdac2c1f7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-051',
  'Boardroom Table + 12 Chairs',
  'Contents',
  'Office Contents',
  23353.47,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-051',
  'Boardroom Table + 12 Chairs',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "51", "location_code": "G15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Boardroom Table + 12 Chairs',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 23353.47,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "51", "location_code": "G15", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-051'
  AND id <> 'd8cb6d04-4d97-5e23-abe9-3d4cdac2c1f7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '946f2e46-4e40-5ed6-bcbf-620f14268de7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-510',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-510',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "510", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "510", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-510'
  AND id <> '946f2e46-4e40-5ed6-bcbf-620f14268de7';
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
  7210.0,
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
  unit_cost = 7210.0,
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
  'ba90909f-17fd-5037-b722-8ccd37ea095e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-519',
  'Wooden Drawers - Large',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  'ffa97359-6d9e-5f37-b763-d3532a6d53ec',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-521',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-521',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "521", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "521", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-521'
  AND id <> 'ffa97359-6d9e-5f37-b763-d3532a6d53ec';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  '290d653e-5ac3-5061-8393-8d54c1fbbd03',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-523',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-523',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "523", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "523", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-523'
  AND id <> '290d653e-5ac3-5061-8393-8d54c1fbbd03';
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
  '1365b773-3106-5718-aaab-9a3fc4f92236',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-527',
  'Office Chair - Guest',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-527',
  'Office Chair - Guest',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "527", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "527", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-527'
  AND id <> '1365b773-3106-5718-aaab-9a3fc4f92236';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd428571f-214b-52f7-a24e-2ee79c36f49a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-528',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-528',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "528", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "528", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-528'
  AND id <> 'd428571f-214b-52f7-a24e-2ee79c36f49a';
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
  'acc9f615-e12a-55e5-bc09-b6679ce89d99',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-530',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-530',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "530", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "530", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-530'
  AND id <> 'acc9f615-e12a-55e5-bc09-b6679ce89d99';
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
  'abd0febf-9b78-57c6-add9-ba6a0b183685',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-537',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-537',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "537", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "537", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-537'
  AND id <> 'abd0febf-9b78-57c6-add9-ba6a0b183685';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c1dfad49-dd44-51e0-b3e0-6f8f55bb5ad0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-538',
  'office chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-538',
  'office chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "538", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'office chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "538", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-538'
  AND id <> 'c1dfad49-dd44-51e0-b3e0-6f8f55bb5ad0';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  'ce8ba65a-b0b3-5218-b7c9-7dd11dacb5d5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-540',
  'Storage Cupboard small',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  'f444663a-99d1-5532-adfb-8c722f7392ac',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-546',
  'Office Chair - Guest',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-546',
  'Office Chair - Guest',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "546", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "546", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-546'
  AND id <> 'f444663a-99d1-5532-adfb-8c722f7392ac';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f1265dda-3cad-5c0c-8abf-3f1de39b4d2a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-547',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-547',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "547", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "547", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-547'
  AND id <> 'f1265dda-3cad-5c0c-8abf-3f1de39b4d2a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd906eab8-d142-514b-9e67-58c5158fbec6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-548',
  'office chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-548',
  'office chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "548", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'office chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "548", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-548'
  AND id <> 'd906eab8-d142-514b-9e67-58c5158fbec6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'faee94d7-2415-5d6d-a5e2-7b53a7e7b545',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-549',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-549',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "549", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "549", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-549'
  AND id <> 'faee94d7-2415-5d6d-a5e2-7b53a7e7b545';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7b3ed36e-007b-54cd-8a8b-23e1cec45af1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-055',
  'Office chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-055',
  'Office chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "55", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "55", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-055'
  AND id <> '7b3ed36e-007b-54cd-8a8b-23e1cec45af1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6990e853-3803-5eb0-984a-d1a094a250f3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-550',
  'office chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-550',
  'office chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "550", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'office chair',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "550", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-550'
  AND id <> '6990e853-3803-5eb0-984a-d1a094a250f3';
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
  '937e1382-e11c-5779-b69c-04e4ea64b690',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-563',
  'Filing Unit',
  'Contents',
  'Office Contents',
  10729.18,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-563',
  'Filing Unit',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "563", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Filing Unit',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 10729.18,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "563", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-563'
  AND id <> '937e1382-e11c-5779-b69c-04e4ea64b690';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a0b16654-ecb8-514e-88f4-50d889af5257',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-564',
  'Office Chair - Guest',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-564',
  'Office Chair - Guest',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "564", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "564", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-564'
  AND id <> 'a0b16654-ecb8-514e-88f4-50d889af5257';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7a6299ae-2dc8-5f88-a1ba-952706aa9fbe',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-565',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-565',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "565", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "565", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-565'
  AND id <> '7a6299ae-2dc8-5f88-a1ba-952706aa9fbe';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f869e555-bdfd-5d7b-a423-850ab8b2b086',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-566',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-566',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "566", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "566", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-566'
  AND id <> 'f869e555-bdfd-5d7b-a423-850ab8b2b086';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e5c02bcc-e108-522e-a37e-f26d2484a3ad',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-568',
  'Grey Shelving 1',
  'Contents',
  'Office Contents',
  5650.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-568',
  'Grey Shelving 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "568", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Grey Shelving 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 5650.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "568", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-568'
  AND id <> 'e5c02bcc-e108-522e-a37e-f26d2484a3ad';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'aba51035-96a7-58c9-9b37-a3bdcdf288b3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-569',
  'Grey Shelving 2',
  'Contents',
  'Office Contents',
  5650.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-569',
  'Grey Shelving 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "569", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Grey Shelving 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 5650.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "569", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-569'
  AND id <> 'aba51035-96a7-58c9-9b37-a3bdcdf288b3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '175e31e2-78fc-58a3-abb9-66c03ce5abe9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-057',
  'Office chair - Guest 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-057',
  'Office chair - Guest 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "57", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair - Guest 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "57", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-057'
  AND id <> '175e31e2-78fc-58a3-abb9-66c03ce5abe9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ca9ce1eb-4e6e-5c29-b8e2-50ab4f577dd7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-570',
  'Grey Shelving 3',
  'Contents',
  'Office Contents',
  5650.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-570',
  'Grey Shelving 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "570", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Grey Shelving 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 5650.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "570", "location_code": "F35", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-570'
  AND id <> 'ca9ce1eb-4e6e-5c29-b8e2-50ab4f577dd7';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  'c26d58e4-6748-50b6-9ed1-b896a564df51',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-572',
  'Boardroom Round Table + 3 Chairs',
  'Contents',
  'Office Contents',
  5390.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-572',
  'Boardroom Round Table + 3 Chairs',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "572", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Boardroom Round Table + 3 Chairs',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 5390.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "572", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-572'
  AND id <> 'c26d58e4-6748-50b6-9ed1-b896a564df51';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd06e5070-326b-5699-b759-8c994c61084a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-573',
  'Office Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-573',
  'Office Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "573", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "573", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-573'
  AND id <> 'd06e5070-326b-5699-b759-8c994c61084a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8a822cb0-cc61-5fef-8b77-982ab2f63235',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-574',
  'Office Desk',
  'Contents',
  'Office Contents',
  16612.75,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-574',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "574", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 16612.75,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "574", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-574'
  AND id <> '8a822cb0-cc61-5fef-8b77-982ab2f63235';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd36222ad-1b19-59a1-bc7c-58e64be37031',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-058',
  'Office chair - Guest 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-058',
  'Office chair - Guest 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "58", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair - Guest 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "58", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-058'
  AND id <> 'd36222ad-1b19-59a1-bc7c-58e64be37031';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ad9d0905-8d30-5259-98f4-53351d666f37',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-588',
  'Office Desk 1',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-588',
  'Office Desk 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "588", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "588", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-588'
  AND id <> 'ad9d0905-8d30-5259-98f4-53351d666f37';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b6759ff5-be8e-5579-8c60-74915f0de233',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-589',
  'Office Desk 2',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-589',
  'Office Desk 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "589", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "589", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-589'
  AND id <> 'b6759ff5-be8e-5579-8c60-74915f0de233';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b0619a66-01a8-5c4c-bbfe-8fb93ed4a444',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-059',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-059',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "59", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "59", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-059'
  AND id <> 'b0619a66-01a8-5c4c-bbfe-8fb93ed4a444';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a1e47a4c-d84c-52df-bcc0-465fb67be476',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-590',
  'Office Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-590',
  'Office Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "590", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "590", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-590'
  AND id <> 'a1e47a4c-d84c-52df-bcc0-465fb67be476';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '871896cb-3767-5673-a3f8-d7a06e031915',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-591',
  'Office Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-591',
  'Office Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "591", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "591", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-591'
  AND id <> '871896cb-3767-5673-a3f8-d7a06e031915';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a6dca2ad-09a3-5c0c-acd0-21b9368a34ee',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-592',
  'Office Chair - Guest 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-592',
  'Office Chair - Guest 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "592", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "592", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-592'
  AND id <> 'a6dca2ad-09a3-5c0c-acd0-21b9368a34ee';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6b7d8957-3eb5-5124-b91f-6fbeea6d894f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-593',
  'Office Chair - Guest 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-593',
  'Office Chair - Guest 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "593", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "593", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-593'
  AND id <> '6b7d8957-3eb5-5124-b91f-6fbeea6d894f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd9a3927b-1339-5ade-a700-16d5b3edc896',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-594',
  'Office Chair - Guest 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-594',
  'Office Chair - Guest 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "594", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "594", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-594'
  AND id <> 'd9a3927b-1339-5ade-a700-16d5b3edc896';
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
  '3ca2a483-ad1d-54bb-a45f-a57932fb7c9d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-599',
  'Storage Cupboard  Deskside',
  'Contents',
  'Office Contents',
  7210.0,
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
  unit_cost = 7210.0,
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
  'f0b2a9a4-1bbc-565d-b335-251b4e888468',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-006',
  'Table (Water Dispenser Support)',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '26332021-7efa-57a0-acca-0ccc7ce8185a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-600',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-600',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "600", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "600", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-600'
  AND id <> '26332021-7efa-57a0-acca-0ccc7ce8185a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ba62449b-6ea8-5098-b92d-84e5e65a7b3e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-601',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-601',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "601", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "601", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-601'
  AND id <> 'ba62449b-6ea8-5098-b92d-84e5e65a7b3e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1b49ddb2-b260-526e-a297-8b2f50e36799',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-602',
  'Office Chair - Guest 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-602',
  'Office Chair - Guest 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "602", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "602", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-602'
  AND id <> '1b49ddb2-b260-526e-a297-8b2f50e36799';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1a9d2518-3361-58d4-859f-4b113e3fbe89',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-603',
  'Office Chair - Guest 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-603',
  'Office Chair - Guest 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "603", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "603", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-603'
  AND id <> '1a9d2518-3361-58d4-859f-4b113e3fbe89';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f4a9200e-8cb4-5177-bbfc-d7466f57d5e2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-604',
  'HP Printer LaserJet Pro m276n',
  'Contents',
  'Office Contents',
  4867.95,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-604',
  'HP Printer LaserJet Pro m276n',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "604", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer LaserJet Pro m276n',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 4867.95,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "604", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-604'
  AND id <> 'f4a9200e-8cb4-5177-bbfc-d7466f57d5e2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '0062a3cb-1638-5bd5-bf0a-eecc0c9ba519',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-610',
  'Boardroom Round Table + 3 Chairs',
  'Contents',
  'Office Contents',
  5390.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-610',
  'Boardroom Round Table + 3 Chairs',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "610", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Boardroom Round Table + 3 Chairs',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 5390.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "610", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-610'
  AND id <> '0062a3cb-1638-5bd5-bf0a-eecc0c9ba519';
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
  'c7da617c-af4c-5a18-a770-a58df634eb33',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-614',
  'Storage Cupboard Horizontal',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '991ff89d-06d5-55c4-8790-6b7b4a7bb341',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-615',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  7210.0,
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
  unit_cost = 7210.0,
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
  '96292d3e-7ccd-594f-8935-5e1ea14c78e6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-616',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-616',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "616", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "616", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-616'
  AND id <> '96292d3e-7ccd-594f-8935-5e1ea14c78e6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ea76cde3-8e6e-5d1b-9a2e-429ab2cfce9d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-617',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-617',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "617", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "617", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-617'
  AND id <> 'ea76cde3-8e6e-5d1b-9a2e-429ab2cfce9d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f31e10e1-3960-5b4e-9328-0db852ed5445',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-618',
  'Office Chair - Guest',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-618',
  'Office Chair - Guest',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "618", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "618", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-618'
  AND id <> 'f31e10e1-3960-5b4e-9328-0db852ed5445';
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
  15000.0,
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
  unit_cost = 15000.0,
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
  '9f3bc87b-d3ef-58d3-b7d5-10c19552f115',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-626',
  'Storage Cupboard 1',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '5fb4dfab-91c3-5467-a81f-2e0e0f5bca25',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-627',
  'Storage Cupboard 2',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '7267a54c-37cd-53f5-97e6-6ea11c95b7f5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-628',
  'Storage Cupboard 3',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '2d90251a-be8e-5bd6-8225-4f517cbe6d2c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-W-630',
  'Casual Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-W-630',
  'Casual Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "630", "location_code": "F0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Casual Chair 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "630", "location_code": "F0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-W-630'
  AND id <> '2d90251a-be8e-5bd6-8225-4f517cbe6d2c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2c0b8217-9e5a-5b08-be2f-85a72d4f6be2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-W-631',
  'Casual Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-W-631',
  'Casual Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "631", "location_code": "F0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Casual Chair 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "631", "location_code": "F0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-W-631'
  AND id <> '2c0b8217-9e5a-5b08-be2f-85a72d4f6be2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ad6a96dc-8cf9-5c64-9edb-858860fe8102',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-W-632',
  'Display Cabinet',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-W-632',
  'Display Cabinet',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "632", "location_code": "F0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Display Cabinet',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "632", "location_code": "F0", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-W-632'
  AND id <> 'ad6a96dc-8cf9-5c64-9edb-858860fe8102';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  'e8ba350f-8c78-5d87-be33-b76c91923d73',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-634',
  'Storage Cupboard 2',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '219fb457-7aae-5008-92af-bca672153f3d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-064',
  'Chairs*34',
  'Contents',
  'Office Contents',
  68000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-064',
  'Chairs*34',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "64", "location_code": "G20", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Chairs*34',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 68000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "64", "location_code": "G20", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-064'
  AND id <> '219fb457-7aae-5008-92af-bca672153f3d';
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
  '6823509e-0a23-5d8e-b66d-f9a9fba50853',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-641',
  'Office Desk 1',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-641',
  'Office Desk 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "641", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "641", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-641'
  AND id <> '6823509e-0a23-5d8e-b66d-f9a9fba50853';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dedb61d7-eb22-59c8-afdc-d6b22c9cbb8d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-642',
  'Office Desk 2',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-642',
  'Office Desk 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "642", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "642", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-642'
  AND id <> 'dedb61d7-eb22-59c8-afdc-d6b22c9cbb8d';
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
  '91497844-3ca7-5b42-aa28-eb6663cbd513',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-645',
  'Office Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-645',
  'Office Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "645", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "645", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-645'
  AND id <> '91497844-3ca7-5b42-aa28-eb6663cbd513';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fe40d796-830f-5625-a039-89ef584519f3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-646',
  'Office Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-646',
  'Office Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "646", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "646", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-646'
  AND id <> 'fe40d796-830f-5625-a039-89ef584519f3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '852e7490-5d59-5ecc-bbee-11b32f5507bb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-647',
  'Office Chair 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-647',
  'Office Chair 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "647", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "647", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-647'
  AND id <> '852e7490-5d59-5ecc-bbee-11b32f5507bb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ab6a2ab1-5459-5294-9c61-a42a303c8517',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-648',
  'Office Chair 4',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-648',
  'Office Chair 4',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "648", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "648", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-648'
  AND id <> 'ab6a2ab1-5459-5294-9c61-a42a303c8517';
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
  8000.0,
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
  unit_cost = 8000.0,
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
  '91d1fdb2-61de-5e3a-a887-8d90c100a860',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-065',
  'Office Desk 1',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-065',
  'Office Desk 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "65", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Desk 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "65", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-065'
  AND id <> '91d1fdb2-61de-5e3a-a887-8d90c100a860';
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
  'ad3a7321-59e4-55e2-9613-2431ff0ffa40',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-666',
  'Cubicle Desks 1',
  'Contents',
  'Office Contents',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-666',
  'Cubicle Desks 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "666", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Cubicle Desks 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "666", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-666'
  AND id <> 'ad3a7321-59e4-55e2-9613-2431ff0ffa40';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '739f834c-d6da-57f1-8de1-17f9189d5ac5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-667',
  'Cubicle Desks 2',
  'Contents',
  'Office Contents',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-667',
  'Cubicle Desks 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "667", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Cubicle Desks 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "667", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-667'
  AND id <> '739f834c-d6da-57f1-8de1-17f9189d5ac5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '075ff842-b265-5f51-b925-2066b7107594',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-668',
  'Cubicle Desks 3',
  'Contents',
  'Office Contents',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-668',
  'Cubicle Desks 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "668", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Cubicle Desks 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "668", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-668'
  AND id <> '075ff842-b265-5f51-b925-2066b7107594';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1fad8732-583f-53ec-9def-cbceb6c898ff',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-669',
  'Cubicle Desks 4',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-669',
  'Cubicle Desks 4',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "669", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Cubicle Desks 4',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "669", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-669'
  AND id <> '1fad8732-583f-53ec-9def-cbceb6c898ff';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7788b0f6-731d-5ffd-87af-38997a4ac655',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-067',
  'Office chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-067',
  'Office chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "67", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "67", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-067'
  AND id <> '7788b0f6-731d-5ffd-87af-38997a4ac655';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  'b1f95017-3b28-55bd-b5b1-06e47ea0f035',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-671',
  'Samsung Microwave',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '46d3ca56-7c84-58f8-b21f-b1c69cffd328',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-672',
  'Plattinum Kettle',
  'Contents',
  'Office Contents',
  2000.0,
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
  unit_cost = 2000.0,
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
  '4239c89e-ff84-59a3-90e7-642217500093',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-068',
  'Office chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-068',
  'Office chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "68", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "68", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-068'
  AND id <> '4239c89e-ff84-59a3-90e7-642217500093';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '44293326-0af8-5edf-91dc-35f107af1030',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-686',
  'Office Chair 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-686',
  'Office Chair 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "686", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "686", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-686'
  AND id <> '44293326-0af8-5edf-91dc-35f107af1030';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1b2b2cbf-efe6-5c53-b02c-70f68ba56b73',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-687',
  'Office Chair 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-687',
  'Office Chair 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "687", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "687", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-687'
  AND id <> '1b2b2cbf-efe6-5c53-b02c-70f68ba56b73';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'be47b34c-c184-5c29-a623-7742258b079d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-688',
  'Office Chair 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-688',
  'Office Chair 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "688", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "688", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-688'
  AND id <> 'be47b34c-c184-5c29-a623-7742258b079d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2bcd5fcb-f4f3-554e-a82f-18899e4c7dd0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-689',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-689',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "689", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "689", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-689'
  AND id <> '2bcd5fcb-f4f3-554e-a82f-18899e4c7dd0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a4d7043b-f47d-5bcb-8c8d-03d7086309f7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-069',
  'Office chair 3',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-069',
  'Office chair 3',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "69", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair 3',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "69", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-069'
  AND id <> 'a4d7043b-f47d-5bcb-8c8d-03d7086309f7';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  2000.0,
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
  unit_cost = 2000.0,
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
  'e19fecc5-a049-537e-ab76-5fde9d8db596',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-699',
  'Boardroom Table + 11 Chairs',
  'Contents',
  'Office Contents',
  27162.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-699',
  'Boardroom Table + 11 Chairs',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "699", "location_code": "F30", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Boardroom Table + 11 Chairs',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 27162.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "699", "location_code": "F30", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-699'
  AND id <> 'e19fecc5-a049-537e-ab76-5fde9d8db596';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '61d2574c-cd84-59af-9ed8-36c0d9c42bc4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-007',
  'Coffee Table',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-007',
  'Coffee Table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "7", "location_code": "G2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Coffee Table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "7", "location_code": "G2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-007'
  AND id <> '61d2574c-cd84-59af-9ed8-36c0d9c42bc4';
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
  '4a8d9cb2-af1a-50da-b625-cae233f148f5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-700',
  'Boardroom Round Table',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-700',
  'Boardroom Round Table',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "700", "location_code": "F30", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Boardroom Round Table',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "700", "location_code": "F30", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-700'
  AND id <> '4a8d9cb2-af1a-50da-b625-cae233f148f5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3cd1bba1-be31-5cc6-b040-40c711cf7604',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-701',
  'ACER Projector',
  'Contents',
  'Office Contents',
  26726.78,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-701',
  'ACER Projector',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "701", "location_code": "F30", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 26726.78,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "701", "location_code": "F30", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-701'
  AND id <> '3cd1bba1-be31-5cc6-b040-40c711cf7604';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3fc12d73-df44-5411-979c-9fea8dfe0bce',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-702',
  'Office Desk',
  'Contents',
  'Office Contents',
  8000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-702',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "702", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 8000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "702", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-702'
  AND id <> '3fc12d73-df44-5411-979c-9fea8dfe0bce';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6ef41cbf-a21c-5852-8f1d-886a7bcf587a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-703',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-703',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "703", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "703", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-703'
  AND id <> '6ef41cbf-a21c-5852-8f1d-886a7bcf587a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '42fd246e-5a3f-5173-9245-84e6e48125ea',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-704',
  'Office Chair - Guest 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-704',
  'Office Chair - Guest 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "704", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "704", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-704'
  AND id <> '42fd246e-5a3f-5173-9245-84e6e48125ea';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'be53168e-f761-5a90-90cc-6b5c24fc42ac',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-705',
  'Office Chair - Guest 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-705',
  'Office Chair - Guest 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "705", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "705", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-705'
  AND id <> 'be53168e-f761-5a90-90cc-6b5c24fc42ac';
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
  '1bbbdb83-aed6-55a1-9035-2d8a7c2b6a12',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-071',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  3000.0,
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
  unit_cost = 3000.0,
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
  'a84bc697-77ac-5087-8e61-a3bcc43af365',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-711',
  'Storage Cupboard - Deskside',
  'Contents',
  'Office Contents',
  7210.0,
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
  unit_cost = 7210.0,
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
  'a5aa118f-802b-5b17-be62-d18790e56d68',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-712',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-712',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "712", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "712", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-712'
  AND id <> 'a5aa118f-802b-5b17-be62-d18790e56d68';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f98bcf91-70c3-575d-bfb0-ee404a88b8e4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-713',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-713',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "713", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "713", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-713'
  AND id <> 'f98bcf91-70c3-575d-bfb0-ee404a88b8e4';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5a213c93-99f4-516c-a2fc-52301bf9b49a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-715',
  'Office Chair - Guest',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-715',
  'Office Chair - Guest',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "715", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "715", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-715'
  AND id <> '5a213c93-99f4-516c-a2fc-52301bf9b49a';
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
  'd24721c6-bbf7-54ed-a38a-f7b0741a9175',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-724',
  'Office Desk',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-724',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "724", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "724", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-724'
  AND id <> 'd24721c6-bbf7-54ed-a38a-f7b0741a9175';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6ab4eb93-244e-56df-aee7-5c9d0f5da797',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-725',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-725',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "725", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "725", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-725'
  AND id <> '6ab4eb93-244e-56df-aee7-5c9d0f5da797';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2327cdad-8bbb-53e1-96cd-ee8369dfe8dc',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-726',
  'Office Chair - Guest 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-726',
  'Office Chair - Guest 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "726", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "726", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-726'
  AND id <> '2327cdad-8bbb-53e1-96cd-ee8369dfe8dc';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1aa4ba8b-9332-5121-9b7e-6a84b300db65',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-727',
  'Office Chair - Guest 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-727',
  'Office Chair - Guest 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "727", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "727", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-727'
  AND id <> '1aa4ba8b-9332-5121-9b7e-6a84b300db65';
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
  7210.0,
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
  unit_cost = 7210.0,
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
  '0f4f51b4-364c-56a8-a914-24a2e1ac0394',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-073',
  'Round Table',
  'Contents',
  'Office Contents',
  5000.0,
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
  unit_cost = 5000.0,
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
  '17559bc6-7269-5f02-bc76-096d37714af4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-730',
  'Office Side Table/Desk',
  'Contents',
  'Office Contents',
  7210.0,
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
  unit_cost = 7210.0,
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
  'd40a1e32-65f4-53c0-99a5-a57cc34bbf44',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-732',
  'Office Chair - Guest 1',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-732',
  'Office Chair - Guest 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "732", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 1',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "732", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-732'
  AND id <> 'd40a1e32-65f4-53c0-99a5-a57cc34bbf44';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd3c5d957-0eb4-5905-a043-f7b11311b70a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-733',
  'Office Chair - Guest 2',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-733',
  'Office Chair - Guest 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "733", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office Chair - Guest 2',
  category = 'Contents',
  insurance_section = 'Office Contents',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "733", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-733'
  AND id <> 'd3c5d957-0eb4-5905-a043-f7b11311b70a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b69b8dc2-0c15-507a-bb56-a335e61fd9e8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-734',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-734',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "734", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "734", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-734'
  AND id <> 'b69b8dc2-0c15-507a-bb56-a335e61fd9e8';
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
  7210.0,
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
  unit_cost = 7210.0,
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
  'ab700d05-4fee-5e8f-a8aa-3be3a9650eaa',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-739',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-739',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "739", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "739", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-739'
  AND id <> 'ab700d05-4fee-5e8f-a8aa-3be3a9650eaa';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '598261af-d05a-56ea-8e54-cf0cec3b259a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-740',
  'Office Chair',
  'Contents',
  'Office Contents',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-740',
  'Office Chair',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "740", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "740", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-740'
  AND id <> '598261af-d05a-56ea-8e54-cf0cec3b259a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '67e7f1b2-4a02-51fc-8ae1-43708b2b1b75',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-754',
  'Office Desk',
  'Contents',
  'Office Contents',
  3000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-754',
  'Office Desk',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "754", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 3000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "754", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-754'
  AND id <> '67e7f1b2-4a02-51fc-8ae1-43708b2b1b75';
COMMIT;