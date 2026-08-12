INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857117',
  'I Phone 13 Pro',
  'Miscellaneous',
  'Miscellaneous',
  23499,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'IPHONE-7117',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857117'
);
UPDATE public.portal_risk_items SET
  name = 'I Phone 13 Pro',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 23499,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857117';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857118',
  '79x PM75 Mobile Device',
  'Miscellaneous',
  'Miscellaneous',
  720717,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '79XPM7-7118',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857118'
);
UPDATE public.portal_risk_items SET
  name = '79x PM75 Mobile Device',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 720717,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857118';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857119',
  '16x Ulefone Armor X6 16GB Sim Rugged',
  'Miscellaneous',
  'Miscellaneous',
  38384,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '16XULE-7119',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857119'
);
UPDATE public.portal_risk_items SET
  name = '16x Ulefone Armor X6 16GB Sim Rugged',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 38384,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857119';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857120',
  '2x CryoVacc units',
  'Miscellaneous',
  'Miscellaneous',
  253000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '2XCRYO-7120',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857120'
);
UPDATE public.portal_risk_items SET
  name = '2x CryoVacc units',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 253000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857120';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857121',
  'Fridge Master',
  'Miscellaneous',
  'Miscellaneous',
  8500,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'FRIDGE-7121',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857121'
);
UPDATE public.portal_risk_items SET
  name = 'Fridge Master',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 8500,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857121';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857122',
  'Samsung Tablet',
  'Miscellaneous',
  'Miscellaneous',
  5000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'SAMSUN-7122',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857122'
);
UPDATE public.portal_risk_items SET
  name = 'Samsung Tablet',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857122';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857123',
  '7002300 Coldfront CIC-4809 DR Zulu Onco Fridge',
  'Miscellaneous',
  'Miscellaneous',
  15587,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '700230-7123',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857123'
);
UPDATE public.portal_risk_items SET
  name = '7002300 Coldfront CIC-4809 DR Zulu Onco Fridge',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 15587,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857123';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857124',
  '7002400 UTrackIt SI207883 Design time R&M inst',
  'Miscellaneous',
  'Miscellaneous',
  85750,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '700240-7124',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857124'
);
UPDATE public.portal_risk_items SET
  name = '7002400 UTrackIt SI207883 Design time R&M inst',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 85750,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857124';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857125',
  'Lenovo R90H7FDF Laptop',
  'Miscellaneous',
  'Miscellaneous',
  14000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'LENOVO-7125',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857125'
);
UPDATE public.portal_risk_items SET
  name = 'Lenovo R90H7FDF Laptop',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 14000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857125';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857126',
  '7002400 Pure Water Systems 116096 Ozone generato',
  'Miscellaneous',
  'Miscellaneous',
  10775,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '700240-7126',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857126'
);
UPDATE public.portal_risk_items SET
  name = '7002400 Pure Water Systems 116096 Ozone generato',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 10775,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857126';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857127',
  '1320307 My Frifge Online IN123159 Wifi logger ex',
  'Miscellaneous',
  'Miscellaneous',
  1400,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7127',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857127'
);
UPDATE public.portal_risk_items SET
  name = '1320307 My Frifge Online IN123159 Wifi logger ex',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 1400,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857127';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857128',
  '1320434 Pure Water Systems 116096 HC480 UV Balla',
  'Miscellaneous',
  'Miscellaneous',
  4678,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132043-7128',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857128'
);
UPDATE public.portal_risk_items SET
  name = '1320434 Pure Water Systems 116096 HC480 UV Balla',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4678,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857128';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857129',
  'Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002',
  'Building',
  'Building',
  20000000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'GEZINA-7129',
  '{"Risk_Type":"Building","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857129'
);
UPDATE public.portal_risk_items SET
  name = 'Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002',
  category = 'Building',
  insurance_section = 'Building',
  unit_cost = 20000000,
  zoho_fields = '{"Risk_Type":"Building","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857129';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857130',
  'Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493',
  'Building',
  'Building',
  20000000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'PAROWI-7130',
  '{"Risk_Type":"Building","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857130'
);
UPDATE public.portal_risk_items SET
  name = 'Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493',
  category = 'Building',
  insurance_section = 'Building',
  unit_cost = 20000000,
  zoho_fields = '{"Risk_Type":"Building","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857130';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857131',
  'iMat Manufacturing IN125936',
  'Miscellaneous',
  'Miscellaneous',
  28680,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'IMATMA-7131',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857131'
);
UPDATE public.portal_risk_items SET
  name = 'iMat Manufacturing IN125936',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 28680,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857131';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857132',
  'Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493 Brutes Air Sol IN133118 x2 Delcos Pro',
  'Miscellaneous',
  'Miscellaneous',
  102294,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'PAROWI-7132',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857132'
);
UPDATE public.portal_risk_items SET
  name = 'Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493 Brutes Air Sol IN133118 x2 Delcos Pro',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 102294,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857132';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857133',
  '7012300 Netlogix IN129799 x1 Mercer desktop PC',
  'Miscellaneous',
  'Miscellaneous',
  9392,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701230-7133',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857133'
);
UPDATE public.portal_risk_items SET
  name = '7012300 Netlogix IN129799 x1 Mercer desktop PC',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 9392,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857133';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857134',
  '7012300 Netlogix IN129799 x1 Mercer desktop PC',
  'Miscellaneous',
  'Miscellaneous',
  7102,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701230-7134',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857134'
);
UPDATE public.portal_risk_items SET
  name = '7012300 Netlogix IN129799 x1 Mercer desktop PC',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 7102,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857134';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857135',
  '1320311 Netlogix IN128855 x10 Mercer Monitors',
  'Miscellaneous',
  'Miscellaneous',
  11754,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7135',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857135'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Netlogix IN128855 x10 Mercer Monitors',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 11754,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857135';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857136',
  'Strategix SIT-INV112722 x82 Veeam backup',
  'Miscellaneous',
  'Miscellaneous',
  15416,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'STRATE-7136',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857136'
);
UPDATE public.portal_risk_items SET
  name = 'Strategix SIT-INV112722 x82 Veeam backup',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 15416,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857136';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857137',
  'Strategix SIT-INV112722 x18 Fileshare li',
  'Miscellaneous',
  'Miscellaneous',
  2700,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'STRATE-7137',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857137'
);
UPDATE public.portal_risk_items SET
  name = 'Strategix SIT-INV112722 x18 Fileshare li',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2700,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857137';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857138',
  'Netlogix IN129646 x5 Mercer 19.5 Monito',
  'Miscellaneous',
  'Miscellaneous',
  5822,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7138',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857138'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129646 x5 Mercer 19.5 Monito',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5822,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857138';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857139',
  'Netlogix IN129648 x4 Mercer 19.5'' Monito',
  'Miscellaneous',
  'Miscellaneous',
  4658,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7139',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857139'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129648 x4 Mercer 19.5'' Monito',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4658,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857139';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857140',
  'Netlogix IN129794 x1 SSD Drive/Adaptor/U',
  'Miscellaneous',
  'Miscellaneous',
  2398.04,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7140',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857140'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129794 x1 SSD Drive/Adaptor/U',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2398.04,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857140';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857141',
  'Netlogix IN129693 x2 Hand scanners',
  'Miscellaneous',
  'Miscellaneous',
  4743.32,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7141',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857141'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129693 x2 Hand scanners',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4743.32,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857141';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857142',
  'Netlogix IN129694 x1 Zebra Thermal print',
  'Miscellaneous',
  'Miscellaneous',
  6016.91,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7142',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857142'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129694 x1 Zebra Thermal print',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6016.91,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857142';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857143',
  'Netlogix IN129695 x5 Barcode scanners',
  'Miscellaneous',
  'Miscellaneous',
  6041.75,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7143',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857143'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129695 x5 Barcode scanners',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6041.75,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857143';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857144',
  'Netlogix IN129715 x10 Keyboard combo''s',
  'Miscellaneous',
  'Miscellaneous',
  1955.3,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7144',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857144'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129715 x10 Keyboard combo''s',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 1955.3,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857144';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857145',
  'Netlogix IN129716 x5 SSD drives',
  'Miscellaneous',
  'Miscellaneous',
  4476.4,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7145',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857145'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129716 x5 SSD drives',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4476.4,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857145';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857146',
  'Netlogix IN129661 x2 HPE 600GB SAS HDD',
  'Miscellaneous',
  'Miscellaneous',
  8525.78,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'NETLOG-7146',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857146'
);
UPDATE public.portal_risk_items SET
  name = 'Netlogix IN129661 x2 HPE 600GB SAS HDD',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 8525.78,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857146';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857147',
  'P3155DN Printers x 32 (R19000.00 each)',
  'Miscellaneous',
  'Miscellaneous',
  608000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'P3155D-7147',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857147'
);
UPDATE public.portal_risk_items SET
  name = 'P3155DN Printers x 32 (R19000.00 each)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 608000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857147';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000002894001',
  '32x G4X Printers',
  'Miscellaneous',
  'Miscellaneous',
  54000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '32XG4X-4001',
  '{"Risk_Type":"Business Vehicle","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000002894001'
);
UPDATE public.portal_risk_items SET
  name = '32x G4X Printers',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 54000,
  zoho_fields = '{"Risk_Type":"Business Vehicle","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000002894001';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000003122001',
  'Office Contents',
  'Contents',
  'Contents',
  54000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'OFFICE-2001',
  '{"Risk_Type":"Office Contents","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003122001'
);
UPDATE public.portal_risk_items SET
  name = 'Office Contents',
  category = 'Contents',
  insurance_section = 'Contents',
  unit_cost = 54000,
  zoho_fields = '{"Risk_Type":"Office Contents","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003122001';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000003957001',
  'Samsung 35" LED TV',
  'Electronic Equipment',
  'Electronic Equipment',
  3504,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'SAMSUN-7001',
  '{"Risk_Type":"Electronic Equipment","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957001'
);
UPDATE public.portal_risk_items SET
  name = 'Samsung 35" LED TV',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 3504,
  zoho_fields = '{"Risk_Type":"Electronic Equipment","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957001';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000003957002',
  'Honeywell Scanners @ R1248.30 Each',
  'Electronic Equipment',
  'Electronic Equipment',
  37449,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HONEYW-7002',
  '{"Risk_Type":"Electronic Equipment","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957002'
);
UPDATE public.portal_risk_items SET
  name = 'Honeywell Scanners @ R1248.30 Each',
  category = 'Electronic Equipment',
  insurance_section = 'Electronic Equipment',
  unit_cost = 37449,
  zoho_fields = '{"Risk_Type":"Electronic Equipment","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957002';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000003957003',
  '7002400 Pure Water Systems 116096 Grundfos Scala',
  'Miscellaneous',
  'Miscellaneous',
  14484,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '700240-7003',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957003'
);
UPDATE public.portal_risk_items SET
  name = '7002400 Pure Water Systems 116096 Grundfos Scala',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 14484,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957003';;
COMMIT;