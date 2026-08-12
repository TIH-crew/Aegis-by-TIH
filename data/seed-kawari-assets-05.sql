BEGIN;
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '15ab44f8-98de-537c-a5da-042a4f863e07',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-411',
  'Security cameras & HDD for warehouse',
  'Electronic Equipment',
  'Electronic Equipment',
  11750.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-411',
  'Security cameras & HDD for warehouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "411", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Security cameras & HDD for warehouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 11750.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "411", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-411'
  AND id <> '15ab44f8-98de-537c-a5da-042a4f863e07';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a6eeed76-56f7-5a87-acc2-0bd81a1baf03',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-412',
  'SECURITY CAMERAS',
  'Electronic Equipment',
  'Electronic Equipment',
  90073.47,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-412',
  'SECURITY CAMERAS',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "412", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'SECURITY CAMERAS',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 90073.47,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "412", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-412'
  AND id <> 'a6eeed76-56f7-5a87-acc2-0bd81a1baf03';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '61422f4b-b15f-56b0-909f-6292632fd57e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-413',
  'SECURITY CAMERAS - PACKING AREA',
  'Electronic Equipment',
  'Electronic Equipment',
  12621.5,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-413',
  'SECURITY CAMERAS - PACKING AREA',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "413", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'SECURITY CAMERAS - PACKING AREA',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 12621.5,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "413", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-413'
  AND id <> '61422f4b-b15f-56b0-909f-6292632fd57e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '93f2bdcd-7644-5896-bb79-7308a567a8b1',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-S-414',
  'SECURITY CAMERA AND ALARM SYSTEM',
  'Electronic Equipment',
  'Electronic Equipment',
  154615.05,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-S-414',
  'SECURITY CAMERA AND ALARM SYSTEM',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "C101", "asset_number": "414", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'SECURITY CAMERA AND ALARM SYSTEM',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 154615.05,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "C101", "asset_number": "414", "location_code": "GW4", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-S-414'
  AND id <> '93f2bdcd-7644-5896-bb79-7308a567a8b1';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '638bbaf9-ddc5-5b4a-ad36-26869d55034c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-419',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-419',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "419", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "419", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-419'
  AND id <> '638bbaf9-ddc5-5b4a-ad36-26869d55034c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dc1e0133-b1ba-59bc-8dd0-e12335eca9b2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-420',
  'Microsoft Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-420',
  'Microsoft Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "420", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "420", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-420'
  AND id <> 'dc1e0133-b1ba-59bc-8dd0-e12335eca9b2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '53a6c86c-aa9f-5dc5-a362-0f69a553e3c8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-421',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-421',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "421", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "421", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-421'
  AND id <> '53a6c86c-aa9f-5dc5-a362-0f69a553e3c8';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'aceb28f9-0bb6-5a90-8bd7-a0882a44df4e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-422',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11095.63,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-422',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "422", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 11095.63,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "422", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-422'
  AND id <> 'aceb28f9-0bb6-5a90-8bd7-a0882a44df4e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4b71b168-effb-5d2b-9f5c-94ed64674073',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-427',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-427',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "427", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "427", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-427'
  AND id <> '4b71b168-effb-5d2b-9f5c-94ed64674073';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5f0368c6-ff5c-51f4-916e-61585dfbff6c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-428',
  'HP Printer M281 fdn',
  'Electronic Equipment',
  'Electronic Equipment',
  4864.5,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-428',
  'HP Printer M281 fdn',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "428", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer M281 fdn',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4864.5,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "428", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-428'
  AND id <> '5f0368c6-ff5c-51f4-916e-61585dfbff6c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '86e4c0e5-00a0-5ca1-9a25-574393e885a3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-429',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-429',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "429", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "429", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-429'
  AND id <> '86e4c0e5-00a0-5ca1-9a25-574393e885a3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f96b1352-369b-5f5f-b5d8-e32ff3f095a3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-434',
  'HP Printer LaserJet Pro 200 276n',
  'Electronic Equipment',
  'Electronic Equipment',
  3404.04,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-434',
  'HP Printer LaserJet Pro 200 276n',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "434", "location_code": "F6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer LaserJet Pro 200 276n',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3404.04,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "434", "location_code": "F6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-434'
  AND id <> 'f96b1352-369b-5f5f-b5d8-e32ff3f095a3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '917e1793-42be-5827-908a-aa376023f88a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-435',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-435',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "435", "location_code": "F6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "435", "location_code": "F6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-435'
  AND id <> '917e1793-42be-5827-908a-aa376023f88a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a0255a12-baf1-5986-a685-be64b60486a6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-436',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-436',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "436", "location_code": "F6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "436", "location_code": "F6", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-436'
  AND id <> 'a0255a12-baf1-5986-a685-be64b60486a6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '980a3726-9f0f-5294-8295-70e9690bf7b8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-437',
  'ASUS Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  6150.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-437',
  'ASUS Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "437", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 6150.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "437", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-437'
  AND id <> '980a3726-9f0f-5294-8295-70e9690bf7b8';
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
  '978634f9-c31b-5b32-b933-309cc71ca906',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-HR-439',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2770.2,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-HR-439',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "439", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 2770.2,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "439", "location_code": "F12", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-HR-439'
  AND id <> '978634f9-c31b-5b32-b933-309cc71ca906';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7a45453c-0e25-53bb-bb32-1517e720ed86',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-446',
  'HP Printer LaserJet Pro 1536 dnf MFP',
  'Electronic Equipment',
  'Electronic Equipment',
  7170.6,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-446',
  'HP Printer LaserJet Pro 1536 dnf MFP',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "446", "location_code": "F9", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer LaserJet Pro 1536 dnf MFP',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 7170.6,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "446", "location_code": "F9", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-446'
  AND id <> '7a45453c-0e25-53bb-bb32-1517e720ed86';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '27a5c86c-e6d8-5f7f-8778-e32c9097d6b6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-447',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-447',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "447", "location_code": "F9", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "447", "location_code": "F9", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-447'
  AND id <> '27a5c86c-e6d8-5f7f-8778-e32c9097d6b6';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4f5a09a0-0aac-58c3-ba05-753e8418c5e0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-045',
  'HP Printer',
  'Electronic Equipment',
  'Electronic Equipment',
  2939.68,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-045',
  'HP Printer',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "45", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 2939.68,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "45", "location_code": "G17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-045'
  AND id <> '4f5a09a0-0aac-58c3-ba05-753e8418c5e0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c018aa03-8b31-5791-8525-bb7bd713df38',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-452',
  'Optoma Projector',
  'Electronic Equipment',
  'Electronic Equipment',
  10741.57,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-452',
  'Optoma Projector',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "452", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Optoma Projector',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10741.57,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "452", "location_code": "F13", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-452'
  AND id <> 'c018aa03-8b31-5791-8525-bb7bd713df38';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '79fc4287-4ccf-5d95-bde6-184aef25bd48',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-464',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-464',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "464", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "464", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-464'
  AND id <> '79fc4287-4ccf-5d95-bde6-184aef25bd48';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '43b95a23-3cf2-5a3c-8233-04563d22c13b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-465',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-465',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "465", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "465", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-465'
  AND id <> '43b95a23-3cf2-5a3c-8233-04563d22c13b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2bd4d730-c61a-585f-8654-03bd6bc465e2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-467',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  27669.99,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-467',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "467", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "467", "location_code": "F8", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-467'
  AND id <> '2bd4d730-c61a-585f-8654-03bd6bc465e2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fe8691cd-8bea-5cb3-8959-30c06dc32781',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-472',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-472',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "472", "location_code": "F7", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "472", "location_code": "F7", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-472'
  AND id <> 'fe8691cd-8bea-5cb3-8959-30c06dc32781';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '9f2d8b4d-1ca9-58f7-b899-8923a109b864',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-473',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  4690.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-473',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "473", "location_code": "F7", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 4690.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "473", "location_code": "F7", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-473'
  AND id <> '9f2d8b4d-1ca9-58f7-b899-8923a109b864';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a66368ff-6394-57bd-bbeb-ba8fcdb88ccf',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-490',
  'Samsung Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-490',
  'Samsung Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "490", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Samsung Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "490", "location_code": "F3", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-490'
  AND id <> 'a66368ff-6394-57bd-bbeb-ba8fcdb88ccf';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8bde18d6-caa0-54f9-98a8-55823b160515',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-492',
  'LG TV',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-492',
  'LG TV',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "492", "location_code": "F1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "492", "location_code": "F1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-492'
  AND id <> '8bde18d6-caa0-54f9-98a8-55823b160515';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '583d3895-b3a1-550a-b489-01bb978baaff',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-496',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-496',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "496", "location_code": "F1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "496", "location_code": "F1", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-496'
  AND id <> '583d3895-b3a1-550a-b489-01bb978baaff';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8ad94275-68e1-5eed-a401-b6ccf9bd3c6a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-499',
  'Epson Projector',
  'Electronic Equipment',
  'Electronic Equipment',
  29780.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-499',
  'Epson Projector',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "499", "location_code": "F16", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Epson Projector',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 29780.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "499", "location_code": "F16", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-499'
  AND id <> '8ad94275-68e1-5eed-a401-b6ccf9bd3c6a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e3471c48-d526-5f4d-90fa-1352a0b1de6e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-513',
  'Canon Printer isensys MR237',
  'Electronic Equipment',
  'Electronic Equipment',
  3475.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-513',
  'Canon Printer isensys MR237',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "513", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Canon Printer isensys MR237',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3475.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "513", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-513'
  AND id <> 'e3471c48-d526-5f4d-90fa-1352a0b1de6e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f136d68f-22b1-5085-bf67-ef981a2690ed',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-514',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-514',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "514", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "514", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-514'
  AND id <> 'f136d68f-22b1-5085-bf67-ef981a2690ed';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4d35eeda-301d-5abf-9363-2eec926c59bf',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-515',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  17241.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-515',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "515", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 17241.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "515", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-515'
  AND id <> '4d35eeda-301d-5abf-9363-2eec926c59bf';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '57fc632e-4456-5665-b03f-ee9dc3b9f876',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-516',
  'LG Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  1690.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-516',
  'LG Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "516", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 1690.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "516", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-516'
  AND id <> '57fc632e-4456-5665-b03f-ee9dc3b9f876';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '678742f2-040b-5488-bb52-8942578c326e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-517',
  'RCT Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-517',
  'RCT Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "517", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'RCT Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "517", "location_code": "F37", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-517'
  AND id <> '678742f2-040b-5488-bb52-8942578c326e';
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
  'be29dd54-61c7-596b-bf46-f3fd5daa0016',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-524',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2607.83,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-524',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "524", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "524", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-524'
  AND id <> 'be29dd54-61c7-596b-bf46-f3fd5daa0016';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1592c7a8-6eaa-5581-b4c9-665ee020cdb9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-525',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-525',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "525", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "525", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-525'
  AND id <> '1592c7a8-6eaa-5581-b4c9-665ee020cdb9';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1cd239de-d0c8-5f55-86c6-353477cd9b8a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-531',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-531',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "531", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "531", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-531'
  AND id <> '1cd239de-d0c8-5f55-86c6-353477cd9b8a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3ebae789-780c-502c-9056-d8eb3d0e2daa',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-532',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-532',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "532", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "532", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-532'
  AND id <> '3ebae789-780c-502c-9056-d8eb3d0e2daa';
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
  '2210672e-466e-5011-9079-bb162ebfbe65',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-534',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-534',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "534", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "534", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-534'
  AND id <> '2210672e-466e-5011-9079-bb162ebfbe65';
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
  '05dc54bc-380a-5b40-8c9f-67cf05583c5f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-541',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-541',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "541", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "541", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-541'
  AND id <> '05dc54bc-380a-5b40-8c9f-67cf05583c5f';
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
  '9c71acf2-04c3-5597-8ae0-1f9a2fc6215c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-545',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-545',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "545", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "545", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-545'
  AND id <> '9c71acf2-04c3-5597-8ae0-1f9a2fc6215c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5c659650-ae24-5de3-bc6e-79c6828419c0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-551',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-551',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "551", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "551", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-551'
  AND id <> '5c659650-ae24-5de3-bc6e-79c6828419c0';
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
  '0392446a-f261-5a68-a57c-17f1b3e7f380',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-554',
  'Canon Scanner 1',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-554',
  'Canon Scanner 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "554", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Canon Scanner 1',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "554", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-554'
  AND id <> '0392446a-f261-5a68-a57c-17f1b3e7f380';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '17678cbf-4023-545c-bec4-aac0a4e4b183',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-555',
  'Lenovo Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-555',
  'Lenovo Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "555", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "555", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-555'
  AND id <> '17678cbf-4023-545c-bec4-aac0a4e4b183';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'b7abb000-11a7-5b85-b3d2-3a35568aa2e8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-556',
  'Canon Scanner 2',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-556',
  'Canon Scanner 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "556", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Canon Scanner 2',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "556", "location_code": "F40", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-556'
  AND id <> 'b7abb000-11a7-5b85-b3d2-3a35568aa2e8';
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
  300.0,
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
  unit_cost = 300.0,
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
  '9714676b-6c17-554c-8ca4-0725c3117104',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-056',
  'Office chair - Guest 1',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-056',
  'Office chair - Guest 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "B101", "asset_number": "56", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Office chair - Guest 1',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "B101", "asset_number": "56", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-056'
  AND id <> '9714676b-6c17-554c-8ca4-0725c3117104';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1f0e2ce1-84b3-5579-a438-6bbcc2c13b80',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-567',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-567',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "567", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "567", "location_code": "F39", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-567'
  AND id <> '1f0e2ce1-84b3-5579-a438-6bbcc2c13b80';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd3d56be2-da92-5221-ac1f-a55f4facd269',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-575',
  'Samsung PC Monitor 1',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-575',
  'Samsung PC Monitor 1',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "575", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Samsung PC Monitor 1',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "575", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-575'
  AND id <> 'd3d56be2-da92-5221-ac1f-a55f4facd269';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'eb640197-b18e-5779-9137-84aa363d7e7d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-576',
  'Samsung PC Monitor 2',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-576',
  'Samsung PC Monitor 2',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "576", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Samsung PC Monitor 2',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "576", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-576'
  AND id <> 'eb640197-b18e-5779-9137-84aa363d7e7d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '86943870-a882-5dfe-88cc-4e0bc0e56c3f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-M-577',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-M-577',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "577", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "577", "location_code": "F2", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-M-577'
  AND id <> '86943870-a882-5dfe-88cc-4e0bc0e56c3f';
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
  'c9e9aaaf-a62c-573f-ad7d-49eafd8c81c3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-582',
  'Logitec Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-582',
  'Logitec Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "582", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Logitec Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "582", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-582'
  AND id <> 'c9e9aaaf-a62c-573f-ad7d-49eafd8c81c3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '19d6c41b-857f-5238-ae61-89fc08902876',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-F-583',
  'Logitec Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-F-583',
  'Logitec Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "583", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Logitec Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "583", "location_code": "F38", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-F-583'
  AND id <> '19d6c41b-857f-5238-ae61-89fc08902876';
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
  '4958dfdd-f178-5e08-ae4e-bee7e7e97c13',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MT-595',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MT-595',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "595", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "595", "location_code": "F34", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MT-595'
  AND id <> '4958dfdd-f178-5e08-ae4e-bee7e7e97c13';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4c7175df-55d7-53c1-b17b-3c173134818f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-060',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  10536.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-060',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "60", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 10536.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "60", "location_code": "G24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-060'
  AND id <> '4c7175df-55d7-53c1-b17b-3c173134818f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c33239bb-97d2-5248-ae7d-207b73c6643f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-605',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-605',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "605", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "605", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-605'
  AND id <> 'c33239bb-97d2-5248-ae7d-207b73c6643f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd4fc7479-c286-5006-9d97-1d1a380ff7d2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-606',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-606',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "606", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "606", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-606'
  AND id <> 'd4fc7479-c286-5006-9d97-1d1a380ff7d2';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '1b606557-c15e-5fba-81c8-2a1137fa2db8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-607',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11315.77,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-R-607',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "607", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 11315.77,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "607", "location_code": "F32", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-R-607'
  AND id <> '1b606557-c15e-5fba-81c8-2a1137fa2db8';
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
  2000.0,
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
  unit_cost = 2000.0,
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
  '2ea52e36-5ccd-5e68-a318-9aa14e4ebd9e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-R-609',
  'Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
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
  unit_cost = 2000.0,
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
  '09cc71dc-34d4-591e-935c-455bf3a22ae5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-619',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11355.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-619',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "619", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 11355.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "619", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-619'
  AND id <> '09cc71dc-34d4-591e-935c-455bf3a22ae5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '076098c4-63e3-5cc5-8a61-3c766389f7ae',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-620',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-620',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "620", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "620", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-620'
  AND id <> '076098c4-63e3-5cc5-8a61-3c766389f7ae';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '155f9bae-7a4c-5b2a-87f8-3dbb40a44b4e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-621',
  'HP Printer LaserJet Pro M281fdn',
  'Electronic Equipment',
  'Electronic Equipment',
  6279.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-621',
  'HP Printer LaserJet Pro M281fdn',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "621", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer LaserJet Pro M281fdn',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 6279.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "621", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-621'
  AND id <> '155f9bae-7a4c-5b2a-87f8-3dbb40a44b4e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '129af75b-de31-5ac1-b8df-05689fcda175',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-622',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-622',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "622", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "622", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-622'
  AND id <> '129af75b-de31-5ac1-b8df-05689fcda175';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd3ec695b-4834-55b8-933f-49abdb0079b4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-623',
  'Microsoft Keyboard',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-623',
  'Microsoft Keyboard',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "623", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Microsoft Keyboard',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "623", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-623'
  AND id <> 'd3ec695b-4834-55b8-933f-49abdb0079b4';
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
  '18150288-f45c-5a4e-9950-d781f678e65d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-RP-625',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  6999.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-RP-625',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "625", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "625", "location_code": "F31", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-RP-625'
  AND id <> '18150288-f45c-5a4e-9950-d781f678e65d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7e52b459-4272-5d2d-a227-4ebd10d54689',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-063',
  'Epson Projector',
  'Electronic Equipment',
  'Electronic Equipment',
  4000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-063',
  'Epson Projector',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "63", "location_code": "G20", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Epson Projector',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 4000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "63", "location_code": "G20", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-063'
  AND id <> '7e52b459-4272-5d2d-a227-4ebd10d54689';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7bc9709b-9626-5282-97d9-d300f5c47228',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-650',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-650',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "650", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "650", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-650'
  AND id <> '7bc9709b-9626-5282-97d9-d300f5c47228';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'da1fe3ea-26c7-59ef-bfb3-7ac83682ef5c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-651',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-651',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "651", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "651", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-651'
  AND id <> 'da1fe3ea-26c7-59ef-bfb3-7ac83682ef5c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'ea1bbebc-a8b5-525c-9e49-7b83d922cbf3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-652',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-652',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "652", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "652", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-652'
  AND id <> 'ea1bbebc-a8b5-525c-9e49-7b83d922cbf3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5052f366-7ee5-564d-8ef8-718e061309e7',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-653',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-653',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "653", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "653", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-653'
  AND id <> '5052f366-7ee5-564d-8ef8-718e061309e7';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '17af8f8e-3127-547c-b739-4cc5a460cd38',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-654',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-654',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "654", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "654", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-654'
  AND id <> '17af8f8e-3127-547c-b739-4cc5a460cd38';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'e444b1b0-9eba-571f-8b63-9cf958b06a7d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-655',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-655',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "655", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "655", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-655'
  AND id <> 'e444b1b0-9eba-571f-8b63-9cf958b06a7d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2e2692f3-bd53-5c6c-a9ec-b1336684a7a6',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-656',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-656',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "656", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "656", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-656'
  AND id <> '2e2692f3-bd53-5c6c-a9ec-b1336684a7a6';
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
  15000.0,
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
  unit_cost = 15000.0,
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
  'c8ffaacc-1268-54d3-9462-2667d891afc8',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-660',
  'Combbind 4210 Paper Binder',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-660',
  'Combbind 4210 Paper Binder',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "660", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Combbind 4210 Paper Binder',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "660", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-660'
  AND id <> 'c8ffaacc-1268-54d3-9462-2667d891afc8';
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
  15000.0,
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
  unit_cost = 15000.0,
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
  'e91dbebb-5a01-5a44-ba4a-1010d20861e0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-664',
  'Storage Cupboard (Brown)',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
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
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
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
  'bfeef70d-297c-5e61-8724-b3c172d18439',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-665',
  'UPS/UPT PTECH',
  'Electronic Equipment',
  'Electronic Equipment',
  3141.22,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-665',
  'UPS/UPT PTECH',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "665", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'UPS/UPT PTECH',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3141.22,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "665", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-665'
  AND id <> 'bfeef70d-297c-5e61-8724-b3c172d18439';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c0fa6539-21a5-54cb-a223-07f7cb17d009',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-674',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-674',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "674", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "674", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-674'
  AND id <> 'c0fa6539-21a5-54cb-a223-07f7cb17d009';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a1cdb346-350e-57c1-9ec4-5e2fc23b8ac2',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-675',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  5999.99,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-675',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "675", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 5999.99,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "675", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-675'
  AND id <> 'a1cdb346-350e-57c1-9ec4-5e2fc23b8ac2';
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
  'ea9dce6d-0721-58fc-b22c-5ecc79f8d70a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-677',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-677',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "677", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "677", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-677'
  AND id <> 'ea9dce6d-0721-58fc-b22c-5ecc79f8d70a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a24b6533-159a-5b65-88c4-a62390c4c97d',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-678',
  'HP Printer m402 dne',
  'Electronic Equipment',
  'Electronic Equipment',
  18421.26,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-678',
  'HP Printer m402 dne',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "678", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HP Printer m402 dne',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 18421.26,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "678", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-678'
  AND id <> 'a24b6533-159a-5b65-88c4-a62390c4c97d';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'f5610509-5fad-533f-8c26-80b8818da607',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-679',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  10699.99,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-679',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "679", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10699.99,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "679", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-679'
  AND id <> 'f5610509-5fad-533f-8c26-80b8818da607';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c8b74ce6-37a9-5f08-85a0-e14ac7c962df',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-680',
  'Samsung Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-680',
  'Samsung Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "680", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Samsung Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "680", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-680'
  AND id <> 'c8b74ce6-37a9-5f08-85a0-e14ac7c962df';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '65958ae8-1e34-54b9-a713-5f08cee9c763',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-681',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-681',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "681", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "681", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-681'
  AND id <> '65958ae8-1e34-54b9-a713-5f08cee9c763';
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
  '24f93beb-64b2-5d47-ba35-a20fc6db589c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-683',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  975.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-683',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "683", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 975.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "683", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-683'
  AND id <> '24f93beb-64b2-5d47-ba35-a20fc6db589c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2f893cdd-323b-54ba-9cf7-1fcc735e9c1a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-684',
  'Actrum Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-684',
  'Actrum Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "684", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Actrum Mouse',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 300.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "684", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-684'
  AND id <> '2f893cdd-323b-54ba-9cf7-1fcc735e9c1a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '3691e013-09b6-54e1-852c-3445c8642f54',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-685',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-685',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "685", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "685", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-685'
  AND id <> '3691e013-09b6-54e1-852c-3445c8642f54';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a95a1bbd-b91d-5f10-981c-63a85f67a4be',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-692',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-692',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "692", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "692", "location_code": "F23", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-692'
  AND id <> 'a95a1bbd-b91d-5f10-981c-63a85f67a4be';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '74f864c3-34ea-5537-b8ba-03a206619de9',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-693',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11052.63,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-693',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "693", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 11052.63,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "693", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-693'
  AND id <> '74f864c3-34ea-5537-b8ba-03a206619de9';
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
  'd9a9ed4d-9949-5988-9a40-7053ff83a093',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-695',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-695',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "695", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "695", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-695'
  AND id <> 'd9a9ed4d-9949-5988-9a40-7053ff83a093';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '2a148391-81dd-53d3-a4e5-b25b6ff8d8fd',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-696',
  'ACER Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  11144.98,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-696',
  'ACER Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "696", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 11144.98,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "696", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-696'
  AND id <> '2a148391-81dd-53d3-a4e5-b25b6ff8d8fd';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '8a79a5df-681c-5bb8-a96d-757795b21d0e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-697',
  'HDMI cable - medicine policy assistant',
  'Electronic Equipment',
  'Electronic Equipment',
  355.75,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-697',
  'HDMI cable - medicine policy assistant',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "697", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HDMI cable - medicine policy assistant',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 355.75,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "697", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-697'
  AND id <> '8a79a5df-681c-5bb8-a96d-757795b21d0e';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '646b6469-74b7-5ad0-b2be-a13c31073a8b',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MP-698',
  'HDMI Adaptor & Cable-Deepika',
  'Electronic Equipment',
  'Electronic Equipment',
  536.52,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MP-698',
  'HDMI Adaptor & Cable-Deepika',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "698", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'HDMI Adaptor & Cable-Deepika',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 536.52,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "698", "location_code": "F22", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MP-698'
  AND id <> '646b6469-74b7-5ad0-b2be-a13c31073a8b';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'de4dd56d-1a52-52da-9cc1-d5ae93ec0f13',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-707',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-707',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "707", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "707", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-707'
  AND id <> 'de4dd56d-1a52-52da-9cc1-d5ae93ec0f13';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '92c7c2d6-f43e-5070-bb39-6dd65c68638c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-708',
  'HP Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  17430.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-708',
  'HP Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "708", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  unit_cost = 17430.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "708", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-708'
  AND id <> '92c7c2d6-f43e-5070-bb39-6dd65c68638c';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '5081d61b-ef3c-56e1-9a97-5b4371e81577',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-709',
  'Microsoft Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-709',
  'Microsoft Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "709", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "709", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-709'
  AND id <> '5081d61b-ef3c-56e1-9a97-5b4371e81577';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '7a1db1cc-e005-5ecb-aa5d-b225cdcbf49a',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-710',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-710',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "710", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "710", "location_code": "F29", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-710'
  AND id <> '7a1db1cc-e005-5ecb-aa5d-b225cdcbf49a';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'd62b7b11-2cd6-5d2a-a8e5-05259e98dea3',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-714',
  'PC',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-714',
  'PC',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "714", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "714", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-714'
  AND id <> 'd62b7b11-2cd6-5d2a-a8e5-05259e98dea3';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '87396961-bd60-556e-a443-3471e927f667',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-716',
  'PC Samsung Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-716',
  'PC Samsung Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "716", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'PC Samsung Monitor',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 2000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "716", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-716'
  AND id <> '87396961-bd60-556e-a443-3471e927f667';
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
  300.0,
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
  unit_cost = 300.0,
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
  '15a454c7-5bce-5656-8f75-144071a290ae',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-718',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-718',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "718", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "718", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-718'
  AND id <> '15a454c7-5bce-5656-8f75-144071a290ae';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '815387e6-906d-5e86-a631-0fbb566894e5',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-719',
  'Microsoft Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-719',
  'Microsoft Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "719", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "719", "location_code": "F28", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-719'
  AND id <> '815387e6-906d-5e86-a631-0fbb566894e5';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '651fe8d8-b0cb-5b5b-85e9-b5bc7e9206bb',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-G-072',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-G-072',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "72", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "72", "location_code": "G18", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-G-072'
  AND id <> '651fe8d8-b0cb-5b5b-85e9-b5bc7e9206bb';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'dc0b87c0-c4c2-53e9-baa0-954091a18e8f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-721',
  'Lenovo Laptop',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-721',
  'Lenovo Laptop',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "721", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Lenovo Laptop',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 15000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "721", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-721'
  AND id <> 'dc0b87c0-c4c2-53e9-baa0-954091a18e8f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'a47cbd02-958f-592e-8157-803f3a189f0f',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-722',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-722',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "722", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "722", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-722'
  AND id <> 'a47cbd02-958f-592e-8157-803f3a189f0f';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'fb132c9f-8f4c-5c0a-a40d-cc75e5b1cb2e',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-723',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-723',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "723", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "723", "location_code": "F25", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-723'
  AND id <> 'fb132c9f-8f4c-5c0a-a40d-cc75e5b1cb2e';
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
  '4ee28a30-135f-54e5-8206-535ab2bcb718',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-738',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-738',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "738", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "738", "location_code": "F26", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-738'
  AND id <> '4ee28a30-135f-54e5-8206-535ab2bcb718';
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
  '3807bf7f-b443-50d0-b711-326c4ae07c9c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-742',
  'Office Side Table/Desk',
  'Electronic Equipment',
  'Electronic Equipment',
  7210.0,
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
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 7210.0,
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
  '5d12df34-ae54-5fcc-a6d3-190cec8ec481',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-743',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-743',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "743", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "743", "location_code": "F27", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-743'
  AND id <> '5d12df34-ae54-5fcc-a6d3-190cec8ec481';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '231b4c7b-0dfc-52d2-ab8f-a0209dc73824',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-744',
  'Microsoft Mouse',
  'Electronic Equipment',
  'Electronic Equipment',
  300.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-744',
  'Microsoft Mouse',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "744", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "744", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-744'
  AND id <> '231b4c7b-0dfc-52d2-ab8f-a0209dc73824';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '6d2c2fe0-69d6-5509-ae88-850e94cbe15c',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-MR-745',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-MR-745',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "745", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "745", "location_code": "F24", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-MR-745'
  AND id <> '6d2c2fe0-69d6-5509-ae88-850e94cbe15c';
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
  '2cdd391f-8247-5df9-ba53-ef4dd2e67447',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-747',
  'Canon Scanner Lide i20',
  'Electronic Equipment',
  'Electronic Equipment',
  10000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-747',
  'Canon Scanner Lide i20',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "747", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  asset_tag = EXCLUDED.asset_tag,
  branch_id = EXCLUDED.branch_id,
  branch = EXCLUDED.branch,
  zoho_fields = EXCLUDED.zoho_fields,
  insurance_status = EXCLUDED.insurance_status,
  updated_at = now();
UPDATE portal_risk_items SET
  account_id = 'b1111111-1111-4111-8111-111111111147',
  name = 'Canon Scanner Lide i20',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 10000.0,
  branch_id = 'c4444444-4444-4444-8444-444444444401',
  branch = 'Midrand',
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "747", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-747'
  AND id <> '2cdd391f-8247-5df9-ba53-ef4dd2e67447';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '4ff4fbc4-f567-541f-8c09-4c28764058f0',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-748',
  'Mitel Office Telephone',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-748',
  'Mitel Office Telephone',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "748", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "748", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-748'
  AND id <> '4ff4fbc4-f567-541f-8c09-4c28764058f0';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  '523edc55-9aa9-5007-830f-a0019cd39bee',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-749',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-749',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "749", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "749", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-749'
  AND id <> '523edc55-9aa9-5007-830f-a0019cd39bee';
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, description, branch_id, branch, zoho_fields,
  latitude, longitude
) VALUES (
  'c1258e92-0899-5c48-bd9e-4f9ed1dedae4',
  'b1111111-1111-4111-8111-111111111147',
  'asset-KW-M-IT-750',
  'MECER Monitor',
  'Electronic Equipment',
  'Electronic Equipment',
  2000.0,
  0,
  '2026-02-01',
  'Insured with us',
  'KW-M-IT-750',
  'MECER Monitor',
  'c4444444-4444-4444-8444-444444444401',
  'Midrand',
  '{"asset_list_code": "D101", "asset_number": "750", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN -33.8985 ELSE -25.996 END,
  CASE WHEN 'c4444444-4444-4444-8444-444444444401' = 'c4444444-4444-4444-8444-444444444402' THEN 18.5902 ELSE 28.128 END
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
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
  zoho_fields = '{"asset_list_code": "D101", "asset_number": "750", "location_code": "F17", "source": "Asset List - 20260808", "owner_account": "Kawari"}'::jsonb,
  insurance_status = 'Insured with us',
  updated_at = now()
WHERE account_id IN ('b1111111-1111-4111-8111-111111111147', '3a842763-e5f2-43f7-87c2-2a5429738fb3')
  AND asset_tag = 'KW-M-IT-750'
  AND id <> 'c1258e92-0899-5c48-bd9e-4f9ed1dedae4';
COMMIT;