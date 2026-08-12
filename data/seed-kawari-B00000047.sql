-- Kawari Wholesalers B00000047 under Medipost parent
BEGIN;

INSERT INTO portal_accounts (
  id, name, parent_account_id, zoho_account_id, industry, registration_number, vat_number, phone, aegis_status
) VALUES (
  'b1111111-1111-4111-8111-111111111147',
  'Kawari Wholesalers (Pty) Ltd',
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000003979001',
  'Commercial',
  '1990/000001/01',
  '000000',
  '+27 (0)00 474224',
  'active'
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  parent_account_id = EXCLUDED.parent_account_id,
  zoho_account_id = EXCLUDED.zoho_account_id,
  industry = EXCLUDED.industry,
  registration_number = EXCLUDED.registration_number,
  vat_number = EXCLUDED.vat_number,
  phone = EXCLUDED.phone,
  aegis_status = EXCLUDED.aegis_status;

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '523137b3-0c97-508f-a43a-2c95c7cf0b20',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59137',
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  'Building',
  'Fire',
  4133365.5,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59137',
  null,
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  '{"nimbis_risk_id": "59137", "nimbis_tracking_id": "773463fc-c35d-419b-a96d-320f3cb582e9", "nimbis_section": "Fire", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "location", "sum_insured": 4133365.5, "premium_excl": 742.208609, "premium_incl": 853.53990035}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'a07f0ad1-6095-518c-b8f0-789178a8abf6',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59138',
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  'Contents',
  'Office Contents',
  1306028.9,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59138',
  null,
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  '{"nimbis_risk_id": "59138", "nimbis_tracking_id": "1d3dd30d-fb81-434a-9340-fbd6892bfbe6", "nimbis_section": "Office Contents", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "location", "sum_insured": 1306028.9, "premium_excl": 317.989645, "premium_incl": 365.68809175}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '2090d645-ff8a-505a-b88f-5b9a11e571f5',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59139',
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  'Miscellaneous',
  'Accidental Damage',
  2185932.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59139',
  null,
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  '{"nimbis_risk_id": "59139", "nimbis_tracking_id": "7a7997bc-24bc-4731-9757-ddd577a06b56", "nimbis_section": "Accidental Damage", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "cover", "sum_insured": 2185932.0, "premium_excl": 282.936609, "premium_incl": 325.37710035}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '570abcaa-d734-5c23-b779-037bd5d6b362',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59140',
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  'Miscellaneous',
  'Theft',
  100000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59140',
  null,
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  '{"nimbis_risk_id": "59140", "nimbis_tracking_id": "0f113211-8052-4382-8ed2-8aad19c9f56c", "nimbis_section": "Theft", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "cover", "sum_insured": 100000.0, "premium_excl": 376.231884, "premium_incl": 432.6666666}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '9432298b-7504-5a2a-bb36-840f8273d586',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59141',
  '16x PC''s or electronic equipment in administration offices @ R8,000 each',
  'Electronic Equipment',
  'Electronic Equipment',
  128000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59141',
  null,
  '16x PC''s or electronic equipment in administration offices @ R8,000 each',
  '{"nimbis_risk_id": "59141", "nimbis_tracking_id": "d668f28f-091d-4113-8847-59dea180182a", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 128000.0, "premium_excl": 327.513043, "premium_incl": 376.63999945}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '43b7fbd9-0192-5749-8b02-7ec1d5ed252d',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59142',
  'Complete server room with accessories',
  'Electronic Equipment',
  'Electronic Equipment',
  200000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59142',
  null,
  'Complete server room with accessories',
  '{"nimbis_risk_id": "59142", "nimbis_tracking_id": "705b8f45-771c-43ef-9062-1fe2f15f5f1d", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 200000.0, "premium_excl": 511.73913, "premium_incl": 588.4999995}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'ff4c9d40-ceb0-5d2c-a8e9-73c3cd84a62a',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59143',
  '16x Telephone Handsets @ R2,000 each',
  'Electronic Equipment',
  'Electronic Equipment',
  32000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59143',
  null,
  '16x Telephone Handsets @ R2,000 each',
  '{"nimbis_risk_id": "59143", "nimbis_tracking_id": "bf3d6a50-1c08-4eaa-b6dc-7fe73e5f7ebe", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 32000.0, "premium_excl": 81.878261, "premium_incl": 94.16000015}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'c9d8f322-19a2-5abf-b037-6d008799d9f4',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59144',
  '11 x Printers @ R3000 each',
  'Electronic Equipment',
  'Electronic Equipment',
  33000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59144',
  null,
  '11 x Printers @ R3000 each',
  '{"nimbis_risk_id": "59144", "nimbis_tracking_id": "c1dfca4a-ccba-4798-b6ed-34e7f37ca489", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 33000.0, "premium_excl": 84.436957, "premium_incl": 97.10250055}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '6e0ca5c3-54fb-50d5-b315-724d970dc8e2',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59145',
  'Laptop with accessories and software',
  'Electronic Equipment',
  'Electronic Equipment',
  10550.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59145',
  'LXATROX17183604E9E200',
  'Laptop with accessories and software',
  '{"nimbis_risk_id": "59145", "nimbis_tracking_id": "8c03c2ff-24d8-4a90-ba47-57773b0ac350", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 10550.0, "premium_excl": 134.971196, "premium_incl": 155.2168754}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'cc6e9d3d-53bd-5eb4-80b7-26cadd47e348',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59146',
  '15" Retina 2.6Ghz QC 17 laptop with accessories ans software',
  'Electronic Equipment',
  'Electronic Equipment',
  31000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59146',
  'SC02J63HWDKQ2',
  '15" Retina 2.6Ghz QC 17 laptop with accessories ans software',
  '{"nimbis_risk_id": "59146", "nimbis_tracking_id": "e8373ade-2bde-4824-83cb-7a65bcf0d368", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 31000.0, "premium_excl": 396.597826, "premium_incl": 456.0874999}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '08e7ccb9-2148-5fc9-b1f3-faaee4e57815',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59147',
  'TM5760-2416G64MNBK / 15.6"/15-2410/6GB/640GB Acer laptop with accessories and software',
  'Electronic Equipment',
  'Electronic Equipment',
  7560.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59147',
  'LXVZW030461121E9672500',
  'TM5760-2416G64MNBK / 15.6"/15-2410/6GB/640GB Acer laptop with accessories and software',
  '{"nimbis_risk_id": "59147", "nimbis_tracking_id": "595e0da3-81d1-4b3a-a3c9-523b65cdb951", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 7560.0, "premium_excl": 96.724722, "premium_incl": 111.2334303}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '3bd3c232-e0f9-5a6e-a07e-f1e28ccbdbb1',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59148',
  'Travelmate TN653 15.6" i7-3520M 2laptop with accessories and software',
  'Electronic Equipment',
  'Electronic Equipment',
  15000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59148',
  'NXV83EA002307005F92000',
  'Travelmate TN653 15.6" i7-3520M 2laptop with accessories and software',
  '{"nimbis_risk_id": "59148", "nimbis_tracking_id": "b0ea7123-3b21-47b9-9417-6ac8eb818de4", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 15000.0, "premium_excl": 191.902174, "premium_incl": 220.6875001}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'aa6ac456-0bcc-58d2-8214-d5d023820653',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59149',
  'Galaxy Tab4, 16GB, 255.8mm(10.1") WXGALCD',
  'Electronic Equipment',
  'Electronic Equipment',
  4600.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59149',
  'RF2FC005PPL',
  'Galaxy Tab4, 16GB, 255.8mm(10.1") WXGALCD',
  '{"nimbis_risk_id": "59149", "nimbis_tracking_id": "1ce45901-92d6-4378-b548-2e35a8c9f9ce", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'cedfe8b7-1dcd-597c-8934-491fc6c3ab17',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59150',
  'Galaxy Tab4, 16GB, 255.8mm(10.1") WXGALCD',
  'Electronic Equipment',
  'Electronic Equipment',
  4600.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59150',
  'R52G11DMWWD',
  'Galaxy Tab4, 16GB, 255.8mm(10.1") WXGALCD',
  '{"nimbis_risk_id": "59150", "nimbis_tracking_id": "60da0b65-0878-4fd3-89d5-9126a8264678", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '6a81a47d-395b-50e2-9127-2cb51651f597',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59151',
  '40A4K Hisense 40'''' FHD Smart TV',
  'Electronic Equipment',
  'Electronic Equipment',
  3477.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59151',
  null,
  '40A4K Hisense 40'''' FHD Smart TV',
  '{"nimbis_risk_id": "59151", "nimbis_tracking_id": "dc170a16-1af6-4c95-b2a4-d76780468042", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '264e4e3d-ecc8-5f5d-82ab-a8edd67a2ad9',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59152',
  '40A4K Hisense 40'''' FHD Smart TV',
  'Electronic Equipment',
  'Electronic Equipment',
  3477.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59152',
  null,
  '40A4K Hisense 40'''' FHD Smart TV',
  '{"nimbis_risk_id": "59152", "nimbis_tracking_id": "5efff36a-d5d6-4fcb-8528-3701c0395b28", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '0ca5c208-2e81-5ffa-a0fe-0f49746a7da5',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59153',
  '1320995 First Technology INV564094 Scanner-Canon',
  'Electronic Equipment',
  'Electronic Equipment',
  13524.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59153',
  'PNA44286',
  '1320995 First Technology INV564094 Scanner-Canon',
  '{"nimbis_risk_id": "59153", "nimbis_tracking_id": "08e83cde-7212-4c65-bcd4-f265677bb175", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 13524.0, "premium_excl": 86.24, "premium_incl": 99.176}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '16ea005d-8158-5b95-b0f5-6afe05355a64',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59154',
  '1320995 Esquire Tech 922911 x1 Laptop SSD',
  'Electronic Equipment',
  'Electronic Equipment',
  8893.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59154',
  'PNA45226',
  '1320995 Esquire Tech 922911 x1 Laptop SSD',
  '{"nimbis_risk_id": "59154", "nimbis_tracking_id": "05b887f5-1810-43af-b22f-59c2bd558e12", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 8893.0, "premium_excl": 56.708986, "premium_incl": 65.2153339}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '5aeeeb68-3b71-53ca-b816-c88d349af3a3',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59155',
  '1320995 First Tech 587959 x3 Batteries 4x Charg',
  'Electronic Equipment',
  'Electronic Equipment',
  9385.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59155',
  'PNA45397',
  '1320995 First Tech 587959 x3 Batteries 4x Charg',
  '{"nimbis_risk_id": "59155", "nimbis_tracking_id": "3b23887b-9550-44e9-852c-05db42a9f0cb", "nimbis_section": "Electronic Equipment", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 9385.0, "premium_excl": 59.846377, "premium_incl": 68.82333355}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '6ecf3e3f-6641-5fa4-b318-1a7ee51ad417',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59156',
  '15x 2D Mobile scanners @ R12027 each',
  'Miscellaneous',
  'Business All Risks',
  180405.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59156',
  null,
  '15x 2D Mobile scanners @ R12027 each',
  '{"nimbis_risk_id": "59156", "nimbis_tracking_id": "df16a8b7-f18e-4f5d-af70-f1f956db4278", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 180405.0, "premium_excl": 1230.937304, "premium_incl": 1415.5778996}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '8f98a048-5d95-5955-83a1-609808b39f37',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59157',
  '30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town)',
  'Miscellaneous',
  'Business All Risks',
  307800.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59157',
  null,
  '30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town)',
  '{"nimbis_risk_id": "59157", "nimbis_tracking_id": "844510f4-b9c4-4ed9-9fac-ba326bfce862", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 307800.0, "premium_excl": 2085.456522, "premium_incl": 2398.2750003}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '7b9ab963-a175-58e2-8692-e21fcb65b7b7',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59158',
  '3x Samsung Galaxy Tab S6 Lite @ R9078 each',
  'Miscellaneous',
  'Business All Risks',
  27234.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59158',
  null,
  '3x Samsung Galaxy Tab S6 Lite @ R9078 each',
  '{"nimbis_risk_id": "59158", "nimbis_tracking_id": "bc07ed1c-8c36-49fd-993e-7432b9fcf785", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 27234.0, "premium_excl": 232.278391, "premium_incl": 267.12014965}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '8bb72572-0301-578a-abe2-8dca0320ef12',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59159',
  '4x Television sets',
  'Miscellaneous',
  'Business All Risks',
  36500.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59159',
  null,
  '4x Television sets',
  '{"nimbis_risk_id": "59159", "nimbis_tracking_id": "42acf460-44ca-47af-be2d-240811abde55", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 36500.0, "premium_excl": 248.697246, "premium_incl": 286.0018329}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '75e40825-63e8-5f56-86a8-07e553cfbb28',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59160',
  '5x 2D Mobile scanners with docking stations @ R10260 each',
  'Miscellaneous',
  'Business All Risks',
  51300.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59160',
  null,
  '5x 2D Mobile scanners with docking stations @ R10260 each',
  '{"nimbis_risk_id": "59160", "nimbis_tracking_id": "76c61350-8bda-45eb-ba05-a2c463d77537", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 51300.0, "premium_excl": 291.146087, "premium_incl": 334.81800005}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '6e845b13-7efb-5fb1-8f56-381f70423dd0',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59161',
  '5x IP65 Mobile rugged device 2d scanners @ R12027 each (Cape Town)',
  'Miscellaneous',
  'Business All Risks',
  60135.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59161',
  null,
  '5x IP65 Mobile rugged device 2d scanners @ R12027 each (Cape Town)',
  '{"nimbis_risk_id": "59161", "nimbis_tracking_id": "37605746-25c9-4703-bced-d7527379b164", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 60135.0, "premium_excl": 410.312435, "premium_incl": 471.85930025}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '9694bf7f-4eb2-5f72-8d1e-41d92eb403e2',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59162',
  '6x Pallet jacks @ R3000 each',
  'Miscellaneous',
  'Business All Risks',
  18000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59162',
  null,
  '6x Pallet jacks @ R3000 each',
  '{"nimbis_risk_id": "59162", "nimbis_tracking_id": "f95256f4-18da-4f68-9197-c07b978f2c31", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 18000.0, "premium_excl": 103.447826, "premium_incl": 118.9649999}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '7ffd949b-190c-5321-9ada-184078a3a214',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59163',
  'Acer PJ P1385 WB projector',
  'Miscellaneous',
  'Business All Risks',
  8500.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59163',
  null,
  'Acer PJ P1385 WB projector',
  '{"nimbis_risk_id": "59163", "nimbis_tracking_id": "085a87e5-6d72-45b3-9e15-10626af83d6c", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 8500.0, "premium_excl": 68.024638, "premium_incl": 78.2283337}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'b9e92d0e-e20d-5eeb-a13e-55eac4e0e341',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59164',
  'Alarm System',
  'Miscellaneous',
  'Business All Risks',
  50000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59164',
  null,
  'Alarm System',
  '{"nimbis_risk_id": "59164", "nimbis_tracking_id": "770529f4-9393-4409-8aaf-86c58c904b53", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 50000.0, "premium_excl": 170.181159, "premium_incl": 195.70833285}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  'c76322ce-be4d-52b4-9445-ba11a2c2f80a',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59165',
  'Security camera system',
  'Miscellaneous',
  'Business All Risks',
  200000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59165',
  null,
  'Security camera system',
  '{"nimbis_risk_id": "59165", "nimbis_tracking_id": "ca6f83fd-72c0-46e6-90db-a23aba44cd09", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 200000.0, "premium_excl": 1149.42029, "premium_incl": 1321.8333335}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '930258ef-0fa5-52f9-8224-4347f2a84acd',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59166',
  'Router KDC',
  'Miscellaneous',
  'Business All Risks',
  13500.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59166',
  null,
  'Router KDC',
  '{"nimbis_risk_id": "59166", "nimbis_tracking_id": "dcb4808a-48a0-474b-a827-c4537b0298b0", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '00f40064-a658-5322-8d23-025e97084d93',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59167',
  'Router CT',
  'Miscellaneous',
  'Business All Risks',
  13500.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59167',
  null,
  'Router CT',
  '{"nimbis_risk_id": "59167", "nimbis_tracking_id": "6d625e85-9a81-4887-a38b-39cb9ef98944", "nimbis_section": "Business All Risks", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "item", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, serial_number, description, zoho_fields
)
VALUES (
  '1c7b5ad7-3c20-590a-8873-ccee8af1cf19',
  'b1111111-1111-4111-8111-111111111147',
  'nimbis-risk-59168',
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  'Liability',
  'Public Liability',
  20000000.0,
  0,
  '2025-07-01',
  'Insured with us',
  'KW-59168',
  null,
  'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682',
  '{"nimbis_risk_id": "59168", "nimbis_tracking_id": "eafe7264-d36e-4b9b-97a9-47b44dd54102", "nimbis_section": "Public Liability", "nimbis_section_type": "Generic", "policy_number": "B00000047", "cover_kind": "cover", "sum_insured": 20000000.0, "premium_excl": 386.017392, "premium_incl": 443.9200008}'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  insurance_section = EXCLUDED.insurance_section,
  unit_cost = EXCLUDED.unit_cost,
  insurance_status = EXCLUDED.insurance_status,
  serial_number = EXCLUDED.serial_number,
  description = EXCLUDED.description,
  zoho_fields = EXCLUDED.zoho_fields,
  updated_at = now();

INSERT INTO portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
) VALUES (
  'c2222222-2222-4222-8222-222222222247',
  'b1111111-1111-4111-8111-111111111147',
  '7351644000003980001',
  'B00000047',
  'B00000047',
  'Active',
  12423.908815,
  249.678663,
  95.65,
  '2025-07-01',
  '2026-09-01',
  'Bryte Insurance Company South Africa',
  'Bryte Commercial (Kolonie)',
  'Monthly',
  '[{"risk_item_id": "523137b3-0c97-508f-a43a-2c95c7cf0b20", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Fire", "sum_insured": 4133365.5, "premium_excl": 742.208609, "premium_incl": 853.53990035, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59137", "tracking_id": "773463fc-c35d-419b-a96d-320f3cb582e9", "extensions": [{"id": "ext-59137-0", "name": "Cover terms", "sum_insured": 4133365.5, "premium_excl": 742.208609, "premium_incl": 853.53990035, "details": {"rate": "0.236100%", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682"}}, {"id": "ext-59137-1", "name": "Building", "sum_insured": 4133365.5, "premium_excl": null, "premium_incl": null, "details": {}}, {"id": "ext-59137-2", "name": "Insured perils", "sum_insured": 4133365.5, "premium_excl": null, "premium_incl": null, "details": {"earthquake": "Yes", "special perils": "Yes"}}], "attachments": []}, {"risk_item_id": "a07f0ad1-6095-518c-b8f0-789178a8abf6", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Office Contents", "sum_insured": 1306028.9, "premium_excl": 317.989645, "premium_incl": 365.68809175, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59138", "tracking_id": "1d3dd30d-fb81-434a-9340-fbd6892bfbe6", "extensions": [{"id": "ext-59138-0", "name": "Cover terms", "sum_insured": 1306028.9, "premium_excl": 317.989645, "premium_incl": 365.68809175, "details": {"security": "Unspecified"}}, {"id": "ext-59138-1", "name": "Subsection A - Contents", "sum_insured": 1306028.9, "premium_excl": null, "premium_incl": null, "details": {"rate": "0.336000%", "burglar Alarm Warranty applicable": "0"}}], "attachments": []}, {"risk_item_id": "2090d645-ff8a-505a-b88f-5b9a11e571f5", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Accidental Damage", "sum_insured": 2185932.0, "premium_excl": 282.936609, "premium_incl": 325.37710035, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59139", "tracking_id": "7a7997bc-24bc-4731-9757-ddd577a06b56", "extensions": [{"id": "ext-59139-0", "name": "Cover terms", "sum_insured": 2185932.0, "premium_excl": 282.936609, "premium_incl": 325.37710035, "details": {"rate": "0.110000%", "description": "Crescent Corporate Park…", "basis of Cover": "Full Value"}}], "attachments": []}, {"risk_item_id": "570abcaa-d734-5c23-b779-037bd5d6b362", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Theft", "sum_insured": 100000.0, "premium_excl": 376.231884, "premium_incl": 432.6666666, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59140", "tracking_id": "0f113211-8052-4382-8ed2-8aad19c9f56c", "extensions": [{"id": "ext-59140-0", "name": "Cover terms", "sum_insured": 100000.0, "premium_excl": 376.231884, "premium_incl": 432.6666666, "details": {"rate": "5.192000%", "basis": "First Loss", "burglar Alarm Warranty": "1"}}], "attachments": []}, {"risk_item_id": "9432298b-7504-5a2a-bb36-840f8273d586", "risk_item_name": "16x PC''s or electronic equipment in administration offices @ R8,000 each", "section": "Electronic Equipment", "sum_insured": 128000.0, "premium_excl": 327.513043, "premium_incl": 376.63999945, "cover_status": "Approved", "description": "16x PC''s or electronic equipment in administration offices @ R8,000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59141", "tracking_id": "d668f28f-091d-4113-8847-59dea180182a", "extensions": [{"id": "ext-59141-0", "name": "Subsection A - Material Damage", "sum_insured": 128000.0, "premium_excl": 327.513043, "premium_incl": 376.63999945, "details": {"rate": "3.210000%", "description": "16x PC''s or electronic equipment in administration offices @ R8,000 each"}}], "attachments": []}, {"risk_item_id": "43b7fbd9-0192-5749-8b02-7ec1d5ed252d", "risk_item_name": "Complete server room with accessories", "section": "Electronic Equipment", "sum_insured": 200000.0, "premium_excl": 511.73913, "premium_incl": 588.4999995, "cover_status": "Approved", "description": "Complete server room with accessories", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59142", "tracking_id": "705b8f45-771c-43ef-9062-1fe2f15f5f1d", "extensions": [{"id": "ext-59142-0", "name": "Subsection A - Material Damage", "sum_insured": 200000.0, "premium_excl": 511.73913, "premium_incl": 588.4999995, "details": {"rate": "3.210000%", "description": "Complete server room with accessories"}}], "attachments": []}, {"risk_item_id": "ff4c9d40-ceb0-5d2c-a8e9-73c3cd84a62a", "risk_item_name": "16x Telephone Handsets @ R2,000 each", "section": "Electronic Equipment", "sum_insured": 32000.0, "premium_excl": 81.878261, "premium_incl": 94.16000015, "cover_status": "Approved", "description": "16x Telephone Handsets @ R2,000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59143", "tracking_id": "bf3d6a50-1c08-4eaa-b6dc-7fe73e5f7ebe", "extensions": [{"id": "ext-59143-0", "name": "Subsection A - Material Damage", "sum_insured": 32000.0, "premium_excl": 81.878261, "premium_incl": 94.16000015, "details": {"rate": "3.210000%"}}], "attachments": []}, {"risk_item_id": "c9d8f322-19a2-5abf-b037-6d008799d9f4", "risk_item_name": "11 x Printers @ R3000 each", "section": "Electronic Equipment", "sum_insured": 33000.0, "premium_excl": 84.436957, "premium_incl": 97.10250055, "cover_status": "Approved", "description": "11 x Printers @ R3000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59144", "tracking_id": "c1dfca4a-ccba-4798-b6ed-34e7f37ca489", "extensions": [{"id": "ext-59144-0", "name": "Subsection A - Material Damage", "sum_insured": 33000.0, "premium_excl": 84.436957, "premium_incl": 97.10250055, "details": {"rate": "3.531000%"}}], "attachments": []}, {"risk_item_id": "6e0ca5c3-54fb-50d5-b315-724d970dc8e2", "risk_item_name": "Laptop with accessories and software", "section": "Electronic Equipment", "sum_insured": 10550.0, "premium_excl": 134.971196, "premium_incl": 155.2168754, "cover_status": "Approved", "description": "Laptop with accessories and software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59145", "tracking_id": "8c03c2ff-24d8-4a90-ba47-57773b0ac350", "extensions": [{"id": "ext-59145-0", "name": "Subsection A - Material Damage", "sum_insured": 10550.0, "premium_excl": 134.971196, "premium_incl": 155.2168754, "details": {"rate": "17.655000%", "serial number": "LXATROX17183604E9E200"}}], "attachments": []}, {"risk_item_id": "cc6e9d3d-53bd-5eb4-80b7-26cadd47e348", "risk_item_name": "15\" Retina 2.6Ghz QC 17 laptop with accessories ans software", "section": "Electronic Equipment", "sum_insured": 31000.0, "premium_excl": 396.597826, "premium_incl": 456.0874999, "cover_status": "Approved", "description": "15\" Retina 2.6Ghz QC 17 laptop with accessories ans software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59146", "tracking_id": "e8373ade-2bde-4824-83cb-7a65bcf0d368", "extensions": [{"id": "ext-59146-0", "name": "Subsection A - Material Damage", "sum_insured": 31000.0, "premium_excl": 396.597826, "premium_incl": 456.0874999, "details": {"rate": "17.655000%", "serial number": "SC02J63HWDKQ2"}}], "attachments": []}, {"risk_item_id": "08e7ccb9-2148-5fc9-b1f3-faaee4e57815", "risk_item_name": "TM5760-2416G64MNBK / 15.6\"/15-2410/6GB/640GB Acer laptop with accessories and software", "section": "Electronic Equipment", "sum_insured": 7560.0, "premium_excl": 96.724722, "premium_incl": 111.2334303, "cover_status": "Approved", "description": "TM5760-2416G64MNBK / 15.6\"/15-2410/6GB/640GB Acer laptop with accessories and software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59147", "tracking_id": "595e0da3-81d1-4b3a-a3c9-523b65cdb951", "extensions": [{"id": "ext-59147-0", "name": "Subsection A - Material Damage", "sum_insured": 7560.0, "premium_excl": 96.724722, "premium_incl": 111.2334303, "details": {"rate": "17.656100%", "serial number": "LXVZW030461121E9672500"}}], "attachments": []}, {"risk_item_id": "3bd3c232-e0f9-5a6e-a07e-f1e28ccbdbb1", "risk_item_name": "Travelmate TN653 15.6\" i7-3520M 2laptop with accessories and software", "section": "Electronic Equipment", "sum_insured": 15000.0, "premium_excl": 191.902174, "premium_incl": 220.6875001, "cover_status": "Approved", "description": "Travelmate TN653 15.6\" i7-3520M 2laptop with accessories and software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59148", "tracking_id": "b0ea7123-3b21-47b9-9417-6ac8eb818de4", "extensions": [{"id": "ext-59148-0", "name": "Subsection A - Material Damage", "sum_insured": 15000.0, "premium_excl": 191.902174, "premium_incl": 220.6875001, "details": {"rate": "17.655000%", "make and Model": "NXV83EA002307005F92000"}}], "attachments": []}, {"risk_item_id": "aa6ac456-0bcc-58d2-8214-d5d023820653", "risk_item_name": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "section": "Electronic Equipment", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "cover_status": "Approved", "description": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59149", "tracking_id": "1ce45901-92d6-4378-b548-2e35a8c9f9ce", "extensions": [{"id": "ext-59149-0", "name": "Subsection A - Material Damage", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "details": {"rate": "17.656100%", "serial number": "RF2FC005PPL"}}], "attachments": []}, {"risk_item_id": "cedfe8b7-1dcd-597c-8934-491fc6c3ab17", "risk_item_name": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "section": "Electronic Equipment", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "cover_status": "Approved", "description": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59150", "tracking_id": "60da0b65-0878-4fd3-89d5-9126a8264678", "extensions": [{"id": "ext-59150-0", "name": "Subsection A - Material Damage", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "details": {"rate": "17.656100%", "serial number": "R52G11DMWWD"}}], "attachments": []}, {"risk_item_id": "6a81a47d-395b-50e2-9127-2cb51651f597", "risk_item_name": "40A4K Hisense 40'''' FHD Smart TV", "section": "Electronic Equipment", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "cover_status": "Approved", "description": "40A4K Hisense 40'''' FHD Smart TV", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59151", "tracking_id": "dc170a16-1af6-4c95-b2a4-d76780468042", "extensions": [{"id": "ext-59151-0", "name": "Subsection A - Material Damage", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "264e4e3d-ecc8-5f5d-82ab-a8edd67a2ad9", "risk_item_name": "40A4K Hisense 40'''' FHD Smart TV", "section": "Electronic Equipment", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "cover_status": "Approved", "description": "40A4K Hisense 40'''' FHD Smart TV", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59152", "tracking_id": "5efff36a-d5d6-4fcb-8528-3701c0395b28", "extensions": [{"id": "ext-59152-0", "name": "Subsection A - Material Damage", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "0ca5c208-2e81-5ffa-a0fe-0f49746a7da5", "risk_item_name": "1320995 First Technology INV564094 Scanner-Canon", "section": "Electronic Equipment", "sum_insured": 13524.0, "premium_excl": 86.24, "premium_incl": 99.176, "cover_status": "Approved", "description": "1320995 First Technology INV564094 Scanner-Canon", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59153", "tracking_id": "08e83cde-7212-4c65-bcd4-f265677bb175", "extensions": [{"id": "ext-59153-0", "name": "Subsection A - Material Damage", "sum_insured": 13524.0, "premium_excl": 86.24, "premium_incl": 99.176, "details": {"rate": "8.800000%", "serial number": "PNA44286"}}], "attachments": []}, {"risk_item_id": "16ea005d-8158-5b95-b0f5-6afe05355a64", "risk_item_name": "1320995 Esquire Tech 922911 x1 Laptop SSD", "section": "Electronic Equipment", "sum_insured": 8893.0, "premium_excl": 56.708986, "premium_incl": 65.2153339, "cover_status": "Approved", "description": "1320995 Esquire Tech 922911 x1 Laptop SSD", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59154", "tracking_id": "05b887f5-1810-43af-b22f-59c2bd558e12", "extensions": [{"id": "ext-59154-0", "name": "Subsection A - Material Damage", "sum_insured": 8893.0, "premium_excl": 56.708986, "premium_incl": 65.2153339, "details": {"rate": "8.800000%", "serial number": "PNA45226"}}], "attachments": []}, {"risk_item_id": "5aeeeb68-3b71-53ca-b816-c88d349af3a3", "risk_item_name": "1320995 First Tech 587959 x3 Batteries 4x Charg", "section": "Electronic Equipment", "sum_insured": 9385.0, "premium_excl": 59.846377, "premium_incl": 68.82333355, "cover_status": "Approved", "description": "1320995 First Tech 587959 x3 Batteries 4x Charg", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59155", "tracking_id": "3b23887b-9550-44e9-852c-05db42a9f0cb", "extensions": [{"id": "ext-59155-0", "name": "Subsection A - Material Damage", "sum_insured": 9385.0, "premium_excl": 59.846377, "premium_incl": 68.82333355, "details": {"rate": "8.800000%", "serial number": "PNA45397"}}], "attachments": []}, {"risk_item_id": "6ecf3e3f-6641-5fa4-b318-1a7ee51ad417", "risk_item_name": "15x 2D Mobile scanners @ R12027 each", "section": "Business All Risks", "sum_insured": 180405.0, "premium_excl": 1230.937304, "premium_incl": 1415.5778996, "cover_status": "Approved", "description": "15x 2D Mobile scanners @ R12027 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59156", "tracking_id": "df16a8b7-f18e-4f5d-af70-f1f956db4278", "extensions": [{"id": "ext-59156-0", "name": "Cover terms", "sum_insured": 180405.0, "premium_excl": 1230.937304, "premium_incl": 1415.5778996, "details": {"rate": "9.416000%"}}], "attachments": []}, {"risk_item_id": "8f98a048-5d95-5955-83a1-609808b39f37", "risk_item_name": "30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town)", "section": "Business All Risks", "sum_insured": 307800.0, "premium_excl": 2085.456522, "premium_incl": 2398.2750003, "cover_status": "Approved", "description": "30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town)", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59157", "tracking_id": "844510f4-b9c4-4ed9-9fac-ba326bfce862", "extensions": [{"id": "ext-59157-0", "name": "Cover terms", "sum_insured": 307800.0, "premium_excl": 2085.456522, "premium_incl": 2398.2750003, "details": {"rate": "9.350000%"}}], "attachments": []}, {"risk_item_id": "7b9ab963-a175-58e2-8692-e21fcb65b7b7", "risk_item_name": "3x Samsung Galaxy Tab S6 Lite @ R9078 each", "section": "Business All Risks", "sum_insured": 27234.0, "premium_excl": 232.278391, "premium_incl": 267.12014965, "cover_status": "Approved", "description": "3x Samsung Galaxy Tab S6 Lite @ R9078 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59158", "tracking_id": "bc07ed1c-8c36-49fd-993e-7432b9fcf785", "extensions": [{"id": "ext-59158-0", "name": "Cover terms", "sum_insured": 27234.0, "premium_excl": 232.278391, "premium_incl": 267.12014965, "details": {"rate": "11.770000%"}}], "attachments": []}, {"risk_item_id": "8bb72572-0301-578a-abe2-8dca0320ef12", "risk_item_name": "4x Television sets", "section": "Business All Risks", "sum_insured": 36500.0, "premium_excl": 248.697246, "premium_incl": 286.0018329, "cover_status": "Approved", "description": "4x Television sets", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59159", "tracking_id": "42acf460-44ca-47af-be2d-240811abde55", "extensions": [{"id": "ext-59159-0", "name": "Cover terms", "sum_insured": 36500.0, "premium_excl": 248.697246, "premium_incl": 286.0018329, "details": {"rate": "9.402800%"}}], "attachments": []}, {"risk_item_id": "75e40825-63e8-5f56-86a8-07e553cfbb28", "risk_item_name": "5x 2D Mobile scanners with docking stations @ R10260 each", "section": "Business All Risks", "sum_insured": 51300.0, "premium_excl": 291.146087, "premium_incl": 334.81800005, "cover_status": "Approved", "description": "5x 2D Mobile scanners with docking stations @ R10260 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59160", "tracking_id": "76c61350-8bda-45eb-ba05-a2c463d77537", "extensions": [{"id": "ext-59160-0", "name": "Cover terms", "sum_insured": 51300.0, "premium_excl": 291.146087, "premium_incl": 334.81800005, "details": {"rate": "7.832000%"}}], "attachments": []}, {"risk_item_id": "6e845b13-7efb-5fb1-8f56-381f70423dd0", "risk_item_name": "5x IP65 Mobile rugged device 2d scanners @ R12027 each (Cape Town)", "section": "Business All Risks", "sum_insured": 60135.0, "premium_excl": 410.312435, "premium_incl": 471.85930025, "cover_status": "Approved", "description": "5x IP65 Mobile rugged device 2d scanners @ R12027 each (Cape Town)", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59161", "tracking_id": "37605746-25c9-4703-bced-d7527379b164", "extensions": [{"id": "ext-59161-0", "name": "Cover terms", "sum_insured": 60135.0, "premium_excl": 410.312435, "premium_incl": 471.85930025, "details": {"rate": "9.416000%"}}], "attachments": []}, {"risk_item_id": "9694bf7f-4eb2-5f72-8d1e-41d92eb403e2", "risk_item_name": "6x Pallet jacks @ R3000 each", "section": "Business All Risks", "sum_insured": 18000.0, "premium_excl": 103.447826, "premium_incl": 118.9649999, "cover_status": "Approved", "description": "6x Pallet jacks @ R3000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59162", "tracking_id": "f95256f4-18da-4f68-9197-c07b978f2c31", "extensions": [{"id": "ext-59162-0", "name": "Cover terms", "sum_insured": 18000.0, "premium_excl": 103.447826, "premium_incl": 118.9649999, "details": {"rate": "7.931000%"}}], "attachments": []}, {"risk_item_id": "7ffd949b-190c-5321-9ada-184078a3a214", "risk_item_name": "Acer PJ P1385 WB projector", "section": "Business All Risks", "sum_insured": 8500.0, "premium_excl": 68.024638, "premium_incl": 78.2283337, "cover_status": "Approved", "description": "Acer PJ P1385 WB projector", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59163", "tracking_id": "085a87e5-6d72-45b3-9e15-10626af83d6c", "extensions": [{"id": "ext-59163-0", "name": "Cover terms", "sum_insured": 8500.0, "premium_excl": 68.024638, "premium_incl": 78.2283337, "details": {"rate": "11.044000%"}}], "attachments": []}, {"risk_item_id": "b9e92d0e-e20d-5eeb-a13e-55eac4e0e341", "risk_item_name": "Alarm System", "section": "Business All Risks", "sum_insured": 50000.0, "premium_excl": 170.181159, "premium_incl": 195.70833285, "cover_status": "Approved", "description": "Alarm System", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59164", "tracking_id": "770529f4-9393-4409-8aaf-86c58c904b53", "extensions": [{"id": "ext-59164-0", "name": "Cover terms", "sum_insured": 50000.0, "premium_excl": 170.181159, "premium_incl": 195.70833285, "details": {"rate": "4.697000%"}}], "attachments": []}, {"risk_item_id": "c76322ce-be4d-52b4-9445-ba11a2c2f80a", "risk_item_name": "Security camera system", "section": "Business All Risks", "sum_insured": 200000.0, "premium_excl": 1149.42029, "premium_incl": 1321.8333335, "cover_status": "Approved", "description": "Security camera system", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59165", "tracking_id": "ca6f83fd-72c0-46e6-90db-a23aba44cd09", "extensions": [{"id": "ext-59165-0", "name": "Cover terms", "sum_insured": 200000.0, "premium_excl": 1149.42029, "premium_incl": 1321.8333335, "details": {"rate": "7.931000%"}}], "attachments": []}, {"risk_item_id": "930258ef-0fa5-52f9-8224-4347f2a84acd", "risk_item_name": "Router KDC", "section": "Business All Risks", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "cover_status": "Approved", "description": "Router KDC", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59166", "tracking_id": "dcb4808a-48a0-474b-a827-c4537b0298b0", "extensions": [{"id": "ext-59166-0", "name": "Cover terms", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "00f40064-a658-5322-8d23-025e97084d93", "risk_item_name": "Router CT", "section": "Business All Risks", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "cover_status": "Approved", "description": "Router CT", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59167", "tracking_id": "6d625e85-9a81-4887-a38b-39cb9ef98944", "extensions": [{"id": "ext-59167-0", "name": "Cover terms", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "1c7b5ad7-3c20-590a-8873-ccee8af1cf19", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Public Liability", "sum_insured": 20000000.0, "premium_excl": 386.017392, "premium_incl": 443.9200008, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59168", "tracking_id": "eafe7264-d36e-4b9b-97a9-47b44dd54102", "extensions": [{"id": "ext-59168-0", "name": "Cover terms", "sum_insured": 20000000.0, "premium_excl": 386.017392, "premium_incl": 443.9200008, "details": {"rate": "0.026400%", "basis of Cover": "Claims Made"}}, {"id": "ext-59168-1", "name": "Cover", "sum_insured": 20000000.0, "premium_excl": null, "premium_incl": null, "details": {"territorial limits": "Anywhere in the world but not in connection with (i) any business carried on by the Insured at or from premises outside or  (ii) any contract for the performance of work outside  the Republic of South Africa, Namibia, Botswana, Lesotho, Swaziland, Zimbabwe"}}], "attachments": []}]'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  account_id = EXCLUDED.account_id,
  zoho_policy_id = EXCLUDED.zoho_policy_id,
  policy_number = EXCLUDED.policy_number,
  insurer_policy_number = EXCLUDED.insurer_policy_number,
  status = EXCLUDED.status,
  premium = EXCLUDED.premium,
  sasria_premium = EXCLUDED.sasria_premium,
  fee_premium = EXCLUDED.fee_premium,
  inception_date = EXCLUDED.inception_date,
  renewal_date = EXCLUDED.renewal_date,
  insurer = EXCLUDED.insurer,
  product_line = EXCLUDED.product_line,
  frequency = EXCLUDED.frequency,
  covered_items = EXCLUDED.covered_items;

INSERT INTO portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
) VALUES (
  'd3333333-3333-4333-8333-333333333347',
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000003980001',
  'B00000047',
  'B00000047',
  'Active',
  12423.908815,
  249.678663,
  95.65,
  '2025-07-01',
  '2026-09-01',
  'Bryte Insurance Company South Africa',
  'Bryte Commercial (Kolonie)',
  'Monthly',
  '[{"risk_item_id": "523137b3-0c97-508f-a43a-2c95c7cf0b20", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Fire", "sum_insured": 4133365.5, "premium_excl": 742.208609, "premium_incl": 853.53990035, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59137", "tracking_id": "773463fc-c35d-419b-a96d-320f3cb582e9", "extensions": [{"id": "ext-59137-0", "name": "Cover terms", "sum_insured": 4133365.5, "premium_excl": 742.208609, "premium_incl": 853.53990035, "details": {"rate": "0.236100%", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682"}}, {"id": "ext-59137-1", "name": "Building", "sum_insured": 4133365.5, "premium_excl": null, "premium_incl": null, "details": {}}, {"id": "ext-59137-2", "name": "Insured perils", "sum_insured": 4133365.5, "premium_excl": null, "premium_incl": null, "details": {"earthquake": "Yes", "special perils": "Yes"}}], "attachments": []}, {"risk_item_id": "a07f0ad1-6095-518c-b8f0-789178a8abf6", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Office Contents", "sum_insured": 1306028.9, "premium_excl": 317.989645, "premium_incl": 365.68809175, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59138", "tracking_id": "1d3dd30d-fb81-434a-9340-fbd6892bfbe6", "extensions": [{"id": "ext-59138-0", "name": "Cover terms", "sum_insured": 1306028.9, "premium_excl": 317.989645, "premium_incl": 365.68809175, "details": {"security": "Unspecified"}}, {"id": "ext-59138-1", "name": "Subsection A - Contents", "sum_insured": 1306028.9, "premium_excl": null, "premium_incl": null, "details": {"rate": "0.336000%", "burglar Alarm Warranty applicable": "0"}}], "attachments": []}, {"risk_item_id": "2090d645-ff8a-505a-b88f-5b9a11e571f5", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Accidental Damage", "sum_insured": 2185932.0, "premium_excl": 282.936609, "premium_incl": 325.37710035, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59139", "tracking_id": "7a7997bc-24bc-4731-9757-ddd577a06b56", "extensions": [{"id": "ext-59139-0", "name": "Cover terms", "sum_insured": 2185932.0, "premium_excl": 282.936609, "premium_incl": 325.37710035, "details": {"rate": "0.110000%", "description": "Crescent Corporate Park…", "basis of Cover": "Full Value"}}], "attachments": []}, {"risk_item_id": "570abcaa-d734-5c23-b779-037bd5d6b362", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Theft", "sum_insured": 100000.0, "premium_excl": 376.231884, "premium_incl": 432.6666666, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59140", "tracking_id": "0f113211-8052-4382-8ed2-8aad19c9f56c", "extensions": [{"id": "ext-59140-0", "name": "Cover terms", "sum_insured": 100000.0, "premium_excl": 376.231884, "premium_incl": 432.6666666, "details": {"rate": "5.192000%", "basis": "First Loss", "burglar Alarm Warranty": "1"}}], "attachments": []}, {"risk_item_id": "9432298b-7504-5a2a-bb36-840f8273d586", "risk_item_name": "16x PC''s or electronic equipment in administration offices @ R8,000 each", "section": "Electronic Equipment", "sum_insured": 128000.0, "premium_excl": 327.513043, "premium_incl": 376.63999945, "cover_status": "Approved", "description": "16x PC''s or electronic equipment in administration offices @ R8,000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59141", "tracking_id": "d668f28f-091d-4113-8847-59dea180182a", "extensions": [{"id": "ext-59141-0", "name": "Subsection A - Material Damage", "sum_insured": 128000.0, "premium_excl": 327.513043, "premium_incl": 376.63999945, "details": {"rate": "3.210000%", "description": "16x PC''s or electronic equipment in administration offices @ R8,000 each"}}], "attachments": []}, {"risk_item_id": "43b7fbd9-0192-5749-8b02-7ec1d5ed252d", "risk_item_name": "Complete server room with accessories", "section": "Electronic Equipment", "sum_insured": 200000.0, "premium_excl": 511.73913, "premium_incl": 588.4999995, "cover_status": "Approved", "description": "Complete server room with accessories", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59142", "tracking_id": "705b8f45-771c-43ef-9062-1fe2f15f5f1d", "extensions": [{"id": "ext-59142-0", "name": "Subsection A - Material Damage", "sum_insured": 200000.0, "premium_excl": 511.73913, "premium_incl": 588.4999995, "details": {"rate": "3.210000%", "description": "Complete server room with accessories"}}], "attachments": []}, {"risk_item_id": "ff4c9d40-ceb0-5d2c-a8e9-73c3cd84a62a", "risk_item_name": "16x Telephone Handsets @ R2,000 each", "section": "Electronic Equipment", "sum_insured": 32000.0, "premium_excl": 81.878261, "premium_incl": 94.16000015, "cover_status": "Approved", "description": "16x Telephone Handsets @ R2,000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59143", "tracking_id": "bf3d6a50-1c08-4eaa-b6dc-7fe73e5f7ebe", "extensions": [{"id": "ext-59143-0", "name": "Subsection A - Material Damage", "sum_insured": 32000.0, "premium_excl": 81.878261, "premium_incl": 94.16000015, "details": {"rate": "3.210000%"}}], "attachments": []}, {"risk_item_id": "c9d8f322-19a2-5abf-b037-6d008799d9f4", "risk_item_name": "11 x Printers @ R3000 each", "section": "Electronic Equipment", "sum_insured": 33000.0, "premium_excl": 84.436957, "premium_incl": 97.10250055, "cover_status": "Approved", "description": "11 x Printers @ R3000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59144", "tracking_id": "c1dfca4a-ccba-4798-b6ed-34e7f37ca489", "extensions": [{"id": "ext-59144-0", "name": "Subsection A - Material Damage", "sum_insured": 33000.0, "premium_excl": 84.436957, "premium_incl": 97.10250055, "details": {"rate": "3.531000%"}}], "attachments": []}, {"risk_item_id": "6e0ca5c3-54fb-50d5-b315-724d970dc8e2", "risk_item_name": "Laptop with accessories and software", "section": "Electronic Equipment", "sum_insured": 10550.0, "premium_excl": 134.971196, "premium_incl": 155.2168754, "cover_status": "Approved", "description": "Laptop with accessories and software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59145", "tracking_id": "8c03c2ff-24d8-4a90-ba47-57773b0ac350", "extensions": [{"id": "ext-59145-0", "name": "Subsection A - Material Damage", "sum_insured": 10550.0, "premium_excl": 134.971196, "premium_incl": 155.2168754, "details": {"rate": "17.655000%", "serial number": "LXATROX17183604E9E200"}}], "attachments": []}, {"risk_item_id": "cc6e9d3d-53bd-5eb4-80b7-26cadd47e348", "risk_item_name": "15\" Retina 2.6Ghz QC 17 laptop with accessories ans software", "section": "Electronic Equipment", "sum_insured": 31000.0, "premium_excl": 396.597826, "premium_incl": 456.0874999, "cover_status": "Approved", "description": "15\" Retina 2.6Ghz QC 17 laptop with accessories ans software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59146", "tracking_id": "e8373ade-2bde-4824-83cb-7a65bcf0d368", "extensions": [{"id": "ext-59146-0", "name": "Subsection A - Material Damage", "sum_insured": 31000.0, "premium_excl": 396.597826, "premium_incl": 456.0874999, "details": {"rate": "17.655000%", "serial number": "SC02J63HWDKQ2"}}], "attachments": []}, {"risk_item_id": "08e7ccb9-2148-5fc9-b1f3-faaee4e57815", "risk_item_name": "TM5760-2416G64MNBK / 15.6\"/15-2410/6GB/640GB Acer laptop with accessories and software", "section": "Electronic Equipment", "sum_insured": 7560.0, "premium_excl": 96.724722, "premium_incl": 111.2334303, "cover_status": "Approved", "description": "TM5760-2416G64MNBK / 15.6\"/15-2410/6GB/640GB Acer laptop with accessories and software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59147", "tracking_id": "595e0da3-81d1-4b3a-a3c9-523b65cdb951", "extensions": [{"id": "ext-59147-0", "name": "Subsection A - Material Damage", "sum_insured": 7560.0, "premium_excl": 96.724722, "premium_incl": 111.2334303, "details": {"rate": "17.656100%", "serial number": "LXVZW030461121E9672500"}}], "attachments": []}, {"risk_item_id": "3bd3c232-e0f9-5a6e-a07e-f1e28ccbdbb1", "risk_item_name": "Travelmate TN653 15.6\" i7-3520M 2laptop with accessories and software", "section": "Electronic Equipment", "sum_insured": 15000.0, "premium_excl": 191.902174, "premium_incl": 220.6875001, "cover_status": "Approved", "description": "Travelmate TN653 15.6\" i7-3520M 2laptop with accessories and software", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59148", "tracking_id": "b0ea7123-3b21-47b9-9417-6ac8eb818de4", "extensions": [{"id": "ext-59148-0", "name": "Subsection A - Material Damage", "sum_insured": 15000.0, "premium_excl": 191.902174, "premium_incl": 220.6875001, "details": {"rate": "17.655000%", "make and Model": "NXV83EA002307005F92000"}}], "attachments": []}, {"risk_item_id": "aa6ac456-0bcc-58d2-8214-d5d023820653", "risk_item_name": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "section": "Electronic Equipment", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "cover_status": "Approved", "description": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59149", "tracking_id": "1ce45901-92d6-4378-b548-2e35a8c9f9ce", "extensions": [{"id": "ext-59149-0", "name": "Subsection A - Material Damage", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "details": {"rate": "17.656100%", "serial number": "RF2FC005PPL"}}], "attachments": []}, {"risk_item_id": "cedfe8b7-1dcd-597c-8934-491fc6c3ab17", "risk_item_name": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "section": "Electronic Equipment", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "cover_status": "Approved", "description": "Galaxy Tab4, 16GB, 255.8mm(10.1\") WXGALCD", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59150", "tracking_id": "60da0b65-0878-4fd3-89d5-9126a8264678", "extensions": [{"id": "ext-59150-0", "name": "Subsection A - Material Damage", "sum_insured": 4600.0, "premium_excl": 58.853667, "premium_incl": 67.68171705, "details": {"rate": "17.656100%", "serial number": "R52G11DMWWD"}}], "attachments": []}, {"risk_item_id": "6a81a47d-395b-50e2-9127-2cb51651f597", "risk_item_name": "40A4K Hisense 40'''' FHD Smart TV", "section": "Electronic Equipment", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "cover_status": "Approved", "description": "40A4K Hisense 40'''' FHD Smart TV", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59151", "tracking_id": "dc170a16-1af6-4c95-b2a4-d76780468042", "extensions": [{"id": "ext-59151-0", "name": "Subsection A - Material Damage", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "264e4e3d-ecc8-5f5d-82ab-a8edd67a2ad9", "risk_item_name": "40A4K Hisense 40'''' FHD Smart TV", "section": "Electronic Equipment", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "cover_status": "Approved", "description": "40A4K Hisense 40'''' FHD Smart TV", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59152", "tracking_id": "5efff36a-d5d6-4fcb-8528-3701c0395b28", "extensions": [{"id": "ext-59152-0", "name": "Subsection A - Material Damage", "sum_insured": 3477.0, "premium_excl": 22.172174, "premium_incl": 25.4980001, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "0ca5c208-2e81-5ffa-a0fe-0f49746a7da5", "risk_item_name": "1320995 First Technology INV564094 Scanner-Canon", "section": "Electronic Equipment", "sum_insured": 13524.0, "premium_excl": 86.24, "premium_incl": 99.176, "cover_status": "Approved", "description": "1320995 First Technology INV564094 Scanner-Canon", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59153", "tracking_id": "08e83cde-7212-4c65-bcd4-f265677bb175", "extensions": [{"id": "ext-59153-0", "name": "Subsection A - Material Damage", "sum_insured": 13524.0, "premium_excl": 86.24, "premium_incl": 99.176, "details": {"rate": "8.800000%", "serial number": "PNA44286"}}], "attachments": []}, {"risk_item_id": "16ea005d-8158-5b95-b0f5-6afe05355a64", "risk_item_name": "1320995 Esquire Tech 922911 x1 Laptop SSD", "section": "Electronic Equipment", "sum_insured": 8893.0, "premium_excl": 56.708986, "premium_incl": 65.2153339, "cover_status": "Approved", "description": "1320995 Esquire Tech 922911 x1 Laptop SSD", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59154", "tracking_id": "05b887f5-1810-43af-b22f-59c2bd558e12", "extensions": [{"id": "ext-59154-0", "name": "Subsection A - Material Damage", "sum_insured": 8893.0, "premium_excl": 56.708986, "premium_incl": 65.2153339, "details": {"rate": "8.800000%", "serial number": "PNA45226"}}], "attachments": []}, {"risk_item_id": "5aeeeb68-3b71-53ca-b816-c88d349af3a3", "risk_item_name": "1320995 First Tech 587959 x3 Batteries 4x Charg", "section": "Electronic Equipment", "sum_insured": 9385.0, "premium_excl": 59.846377, "premium_incl": 68.82333355, "cover_status": "Approved", "description": "1320995 First Tech 587959 x3 Batteries 4x Charg", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59155", "tracking_id": "3b23887b-9550-44e9-852c-05db42a9f0cb", "extensions": [{"id": "ext-59155-0", "name": "Subsection A - Material Damage", "sum_insured": 9385.0, "premium_excl": 59.846377, "premium_incl": 68.82333355, "details": {"rate": "8.800000%", "serial number": "PNA45397"}}], "attachments": []}, {"risk_item_id": "6ecf3e3f-6641-5fa4-b318-1a7ee51ad417", "risk_item_name": "15x 2D Mobile scanners @ R12027 each", "section": "Business All Risks", "sum_insured": 180405.0, "premium_excl": 1230.937304, "premium_incl": 1415.5778996, "cover_status": "Approved", "description": "15x 2D Mobile scanners @ R12027 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59156", "tracking_id": "df16a8b7-f18e-4f5d-af70-f1f956db4278", "extensions": [{"id": "ext-59156-0", "name": "Cover terms", "sum_insured": 180405.0, "premium_excl": 1230.937304, "premium_incl": 1415.5778996, "details": {"rate": "9.416000%"}}], "attachments": []}, {"risk_item_id": "8f98a048-5d95-5955-83a1-609808b39f37", "risk_item_name": "30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town)", "section": "Business All Risks", "sum_insured": 307800.0, "premium_excl": 2085.456522, "premium_incl": 2398.2750003, "cover_status": "Approved", "description": "30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town)", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59157", "tracking_id": "844510f4-b9c4-4ed9-9fac-ba326bfce862", "extensions": [{"id": "ext-59157-0", "name": "Cover terms", "sum_insured": 307800.0, "premium_excl": 2085.456522, "premium_incl": 2398.2750003, "details": {"rate": "9.350000%"}}], "attachments": []}, {"risk_item_id": "7b9ab963-a175-58e2-8692-e21fcb65b7b7", "risk_item_name": "3x Samsung Galaxy Tab S6 Lite @ R9078 each", "section": "Business All Risks", "sum_insured": 27234.0, "premium_excl": 232.278391, "premium_incl": 267.12014965, "cover_status": "Approved", "description": "3x Samsung Galaxy Tab S6 Lite @ R9078 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59158", "tracking_id": "bc07ed1c-8c36-49fd-993e-7432b9fcf785", "extensions": [{"id": "ext-59158-0", "name": "Cover terms", "sum_insured": 27234.0, "premium_excl": 232.278391, "premium_incl": 267.12014965, "details": {"rate": "11.770000%"}}], "attachments": []}, {"risk_item_id": "8bb72572-0301-578a-abe2-8dca0320ef12", "risk_item_name": "4x Television sets", "section": "Business All Risks", "sum_insured": 36500.0, "premium_excl": 248.697246, "premium_incl": 286.0018329, "cover_status": "Approved", "description": "4x Television sets", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59159", "tracking_id": "42acf460-44ca-47af-be2d-240811abde55", "extensions": [{"id": "ext-59159-0", "name": "Cover terms", "sum_insured": 36500.0, "premium_excl": 248.697246, "premium_incl": 286.0018329, "details": {"rate": "9.402800%"}}], "attachments": []}, {"risk_item_id": "75e40825-63e8-5f56-86a8-07e553cfbb28", "risk_item_name": "5x 2D Mobile scanners with docking stations @ R10260 each", "section": "Business All Risks", "sum_insured": 51300.0, "premium_excl": 291.146087, "premium_incl": 334.81800005, "cover_status": "Approved", "description": "5x 2D Mobile scanners with docking stations @ R10260 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59160", "tracking_id": "76c61350-8bda-45eb-ba05-a2c463d77537", "extensions": [{"id": "ext-59160-0", "name": "Cover terms", "sum_insured": 51300.0, "premium_excl": 291.146087, "premium_incl": 334.81800005, "details": {"rate": "7.832000%"}}], "attachments": []}, {"risk_item_id": "6e845b13-7efb-5fb1-8f56-381f70423dd0", "risk_item_name": "5x IP65 Mobile rugged device 2d scanners @ R12027 each (Cape Town)", "section": "Business All Risks", "sum_insured": 60135.0, "premium_excl": 410.312435, "premium_incl": 471.85930025, "cover_status": "Approved", "description": "5x IP65 Mobile rugged device 2d scanners @ R12027 each (Cape Town)", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59161", "tracking_id": "37605746-25c9-4703-bced-d7527379b164", "extensions": [{"id": "ext-59161-0", "name": "Cover terms", "sum_insured": 60135.0, "premium_excl": 410.312435, "premium_incl": 471.85930025, "details": {"rate": "9.416000%"}}], "attachments": []}, {"risk_item_id": "9694bf7f-4eb2-5f72-8d1e-41d92eb403e2", "risk_item_name": "6x Pallet jacks @ R3000 each", "section": "Business All Risks", "sum_insured": 18000.0, "premium_excl": 103.447826, "premium_incl": 118.9649999, "cover_status": "Approved", "description": "6x Pallet jacks @ R3000 each", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59162", "tracking_id": "f95256f4-18da-4f68-9197-c07b978f2c31", "extensions": [{"id": "ext-59162-0", "name": "Cover terms", "sum_insured": 18000.0, "premium_excl": 103.447826, "premium_incl": 118.9649999, "details": {"rate": "7.931000%"}}], "attachments": []}, {"risk_item_id": "7ffd949b-190c-5321-9ada-184078a3a214", "risk_item_name": "Acer PJ P1385 WB projector", "section": "Business All Risks", "sum_insured": 8500.0, "premium_excl": 68.024638, "premium_incl": 78.2283337, "cover_status": "Approved", "description": "Acer PJ P1385 WB projector", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59163", "tracking_id": "085a87e5-6d72-45b3-9e15-10626af83d6c", "extensions": [{"id": "ext-59163-0", "name": "Cover terms", "sum_insured": 8500.0, "premium_excl": 68.024638, "premium_incl": 78.2283337, "details": {"rate": "11.044000%"}}], "attachments": []}, {"risk_item_id": "b9e92d0e-e20d-5eeb-a13e-55eac4e0e341", "risk_item_name": "Alarm System", "section": "Business All Risks", "sum_insured": 50000.0, "premium_excl": 170.181159, "premium_incl": 195.70833285, "cover_status": "Approved", "description": "Alarm System", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59164", "tracking_id": "770529f4-9393-4409-8aaf-86c58c904b53", "extensions": [{"id": "ext-59164-0", "name": "Cover terms", "sum_insured": 50000.0, "premium_excl": 170.181159, "premium_incl": 195.70833285, "details": {"rate": "4.697000%"}}], "attachments": []}, {"risk_item_id": "c76322ce-be4d-52b4-9445-ba11a2c2f80a", "risk_item_name": "Security camera system", "section": "Business All Risks", "sum_insured": 200000.0, "premium_excl": 1149.42029, "premium_incl": 1321.8333335, "cover_status": "Approved", "description": "Security camera system", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59165", "tracking_id": "ca6f83fd-72c0-46e6-90db-a23aba44cd09", "extensions": [{"id": "ext-59165-0", "name": "Cover terms", "sum_insured": 200000.0, "premium_excl": 1149.42029, "premium_incl": 1321.8333335, "details": {"rate": "7.931000%"}}], "attachments": []}, {"risk_item_id": "930258ef-0fa5-52f9-8224-4347f2a84acd", "risk_item_name": "Router KDC", "section": "Business All Risks", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "cover_status": "Approved", "description": "Router KDC", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59166", "tracking_id": "dcb4808a-48a0-474b-a827-c4537b0298b0", "extensions": [{"id": "ext-59166-0", "name": "Cover terms", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "00f40064-a658-5322-8d23-025e97084d93", "risk_item_name": "Router CT", "section": "Business All Risks", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "cover_status": "Approved", "description": "Router CT", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59167", "tracking_id": "6d625e85-9a81-4887-a38b-39cb9ef98944", "extensions": [{"id": "ext-59167-0", "name": "Cover terms", "sum_insured": 13500.0, "premium_excl": 86.086957, "premium_incl": 99.00000055, "details": {"rate": "8.800000%"}}], "attachments": []}, {"risk_item_id": "1c7b5ad7-3c20-590a-8873-ccee8af1cf19", "risk_item_name": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "section": "Public Liability", "sum_insured": 20000000.0, "premium_excl": 386.017392, "premium_incl": 443.9200008, "cover_status": "Approved", "description": "Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682", "branch": null, "date_added": "2025-07-01", "external_risk_id": "59168", "tracking_id": "eafe7264-d36e-4b9b-97a9-47b44dd54102", "extensions": [{"id": "ext-59168-0", "name": "Cover terms", "sum_insured": 20000000.0, "premium_excl": 386.017392, "premium_incl": 443.9200008, "details": {"rate": "0.026400%", "basis of Cover": "Claims Made"}}, {"id": "ext-59168-1", "name": "Cover", "sum_insured": 20000000.0, "premium_excl": null, "premium_incl": null, "details": {"territorial limits": "Anywhere in the world but not in connection with (i) any business carried on by the Insured at or from premises outside or  (ii) any contract for the performance of work outside  the Republic of South Africa, Namibia, Botswana, Lesotho, Swaziland, Zimbabwe"}}], "attachments": []}]'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  covered_items = EXCLUDED.covered_items,
  premium = EXCLUDED.premium,
  zoho_policy_id = EXCLUDED.zoho_policy_id;

COMMIT;