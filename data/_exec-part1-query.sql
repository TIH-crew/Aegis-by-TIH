BEGIN;
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857044',
  'USB Scanners',
  'Miscellaneous',
  'Miscellaneous',
  384347,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'USBSCA-7044',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857044'
);
UPDATE public.portal_risk_items SET
  name = 'USB Scanners',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 384347,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857044';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857045',
  'Krokodildrift Wes, Brits, North West, 0250 Mecer stick PC met toerusting',
  'Miscellaneous',
  'Miscellaneous',
  3500,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'KROKOD-7045',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857045'
);
UPDATE public.portal_risk_items SET
  name = 'Krokodildrift Wes, Brits, North West, 0250 Mecer stick PC met toerusting',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 3500,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857045';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857046',
  'Monitor Screens',
  'Miscellaneous',
  'Miscellaneous',
  9138,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'MONITO-7046',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857046'
);
UPDATE public.portal_risk_items SET
  name = 'Monitor Screens',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 9138,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857046';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857047',
  'Desktop Computers & Accessories',
  'Miscellaneous',
  'Miscellaneous',
  286457,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'DESKTO-7047',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857047'
);
UPDATE public.portal_risk_items SET
  name = 'Desktop Computers & Accessories',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 286457,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857047';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857048',
  'Printers',
  'Miscellaneous',
  'Miscellaneous',
  514944,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'PRINTE-7048',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857048'
);
UPDATE public.portal_risk_items SET
  name = 'Printers',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 514944,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857048';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857049',
  'Harddrives',
  'Miscellaneous',
  'Miscellaneous',
  10719,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HARDDR-7049',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857049'
);
UPDATE public.portal_risk_items SET
  name = 'Harddrives',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 10719,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857049';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857050',
  'Laptops',
  'Miscellaneous',
  'Miscellaneous',
  261303,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'LAPTOP-7050',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857050'
);
UPDATE public.portal_risk_items SET
  name = 'Laptops',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 261303,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857050';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857051',
  'Tablets',
  'Miscellaneous',
  'Miscellaneous',
  7812,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'TABLET-7051',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857051'
);
UPDATE public.portal_risk_items SET
  name = 'Tablets',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 7812,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857051';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857052',
  'Celeron Laptop & Bag - N2840',
  'Miscellaneous',
  'Miscellaneous',
  4218,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'CELERO-7052',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857052'
);
UPDATE public.portal_risk_items SET
  name = 'Celeron Laptop & Bag - N2840',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4218,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857052';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857053',
  'Honeydew USB Scanners',
  'Miscellaneous',
  'Miscellaneous',
  3745,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HONEYD-7053',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857053'
);
UPDATE public.portal_risk_items SET
  name = 'Honeydew USB Scanners',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 3745,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857053';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857054',
  'Krokodildrift Wes, Brits, North West, 0250 Lenovo Server - 7Y48CTO1WW',
  'Miscellaneous',
  'Miscellaneous',
  39000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'KROKOD-7054',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857054'
);
UPDATE public.portal_risk_items SET
  name = 'Krokodildrift Wes, Brits, North West, 0250 Lenovo Server - 7Y48CTO1WW',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 39000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857054';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857055',
  'Honeywell USB Scanners',
  'Miscellaneous',
  'Miscellaneous',
  41910,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HONEYW-7055',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857055'
);
UPDATE public.portal_risk_items SET
  name = 'Honeywell USB Scanners',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 41910,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857055';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857056',
  'HP Laserjet Printer P2035',
  'Miscellaneous',
  'Miscellaneous',
  3000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HPLASE-7056',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857056'
);
UPDATE public.portal_risk_items SET
  name = 'HP Laserjet Printer P2035',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 3000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857056';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857057',
  'HP Laserjet Printer',
  'Miscellaneous',
  'Miscellaneous',
  4093,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HPLASE-7057',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857057'
);
UPDATE public.portal_risk_items SET
  name = 'HP Laserjet Printer',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4093,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857057';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857058',
  'Lenovo Celeron laptop - ML-PC2896',
  'Miscellaneous',
  'Miscellaneous',
  4480,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'LENOVO-7058',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857058'
);
UPDATE public.portal_risk_items SET
  name = 'Lenovo Celeron laptop - ML-PC2896',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4480,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857058';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857059',
  'Longrange CCD USB Scanners',
  'Miscellaneous',
  'Miscellaneous',
  25080,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'LONGRA-7059',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857059'
);
UPDATE public.portal_risk_items SET
  name = 'Longrange CCD USB Scanners',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 25080,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857059';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857060',
  'Mecer PC',
  'Miscellaneous',
  'Miscellaneous',
  5284,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'MECERP-7060',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857060'
);
UPDATE public.portal_risk_items SET
  name = 'Mecer PC',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5284,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857060';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857061',
  'Mecer PC With Mecer Screens',
  'Miscellaneous',
  'Miscellaneous',
  36000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'MECERP-7061',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857061'
);
UPDATE public.portal_risk_items SET
  name = 'Mecer PC With Mecer Screens',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 36000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857061';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857062',
  'Mecer PC''s With Accesories & Software',
  'Miscellaneous',
  'Miscellaneous',
  15185,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'MECERP-7062',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857062'
);
UPDATE public.portal_risk_items SET
  name = 'Mecer PC''s With Accesories & Software',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 15185,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857062';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857063',
  'Multifunction DFN Printer',
  'Miscellaneous',
  'Miscellaneous',
  3187,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'MULTIF-7063',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857063'
);
UPDATE public.portal_risk_items SET
  name = 'Multifunction DFN Printer',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 3187,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857063';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857064',
  'Samsung Galaxy Tab (Dian Bester)',
  'Miscellaneous',
  'Miscellaneous',
  5000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'SAMSUN-7064',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857064'
);
UPDATE public.portal_risk_items SET
  name = 'Samsung Galaxy Tab (Dian Bester)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857064';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857065',
  'Software Office 2016 Home and Business Microsoft',
  'Miscellaneous',
  'Miscellaneous',
  3938,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'SOFTWA-7065',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857065'
);
UPDATE public.portal_risk_items SET
  name = 'Software Office 2016 Home and Business Microsoft',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 3938,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857065';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857066',
  'Zebra Printers',
  'Miscellaneous',
  'Miscellaneous',
  17323,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'ZEBRAP-7066',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857066'
);
UPDATE public.portal_risk_items SET
  name = 'Zebra Printers',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 17323,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857066';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857067',
  '7012300 Esquire 00929260 x2 PC Boxes CCMDD',
  'Miscellaneous',
  'Miscellaneous',
  15458,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701230-7067',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857067'
);
UPDATE public.portal_risk_items SET
  name = '7012300 Esquire 00929260 x2 PC Boxes CCMDD',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 15458,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857067';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857068',
  '7012400 Esquire Tech 929262 x1 PC Box',
  'Miscellaneous',
  'Miscellaneous',
  7825,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701240-7068',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857068'
);
UPDATE public.portal_risk_items SET
  name = '7012400 Esquire Tech 929262 x1 PC Box',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 7825,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857068';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857069',
  'Krokodildrift Wes, Brits, North West, 0250 Apple MacBook Laptop',
  'Miscellaneous',
  'Miscellaneous',
  19000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'KROKOD-7069',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857069'
);
UPDATE public.portal_risk_items SET
  name = 'Krokodildrift Wes, Brits, North West, 0250 Apple MacBook Laptop',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 19000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857069';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857070',
  '1320303 Esquire 00929271 SSD Steyn',
  'Miscellaneous',
  'Miscellaneous',
  607,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7070',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857070'
);
UPDATE public.portal_risk_items SET
  name = '1320303 Esquire 00929271 SSD Steyn',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 607,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857070';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857071',
  '1320310 Esquire Tech 930055 x1 PC Box - BI',
  'Miscellaneous',
  'Miscellaneous',
  6580,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7071',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857071'
);
UPDATE public.portal_risk_items SET
  name = '1320310 Esquire Tech 930055 x1 PC Box - BI',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6580,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857071';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857072',
  '1320310 Esquire Tech 930060 x1 SSD - BI',
  'Miscellaneous',
  'Miscellaneous',
  868,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7072',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857072'
);
UPDATE public.portal_risk_items SET
  name = '1320310 Esquire Tech 930060 x1 SSD - BI',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 868,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857072';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857073',
  '1320310 First Tech 590735 x5 Wireless keyboard/m',
  'Miscellaneous',
  'Miscellaneous',
  1281,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7073',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857073'
);
UPDATE public.portal_risk_items SET
  name = '1320310 First Tech 590735 x5 Wireless keyboard/m',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 1281,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857073';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857074',
  '1320311 Strategix SIT - INV11643 x62 MSP Licences',
  'Miscellaneous',
  'Miscellaneous',
  14206,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7074',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857074'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Strategix SIT - INV11643 x62 MSP Licences',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 14206,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857074';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857075',
  '1320311 Esquire Tech 929272 x10 Screens',
  'Miscellaneous',
  'Miscellaneous',
  10252,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7075',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857075'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Esquire Tech 929272 x10 Screens',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 10252,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857075';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857076',
  '1320312 Netlogix INV126433 Asus Battery',
  'Miscellaneous',
  'Miscellaneous',
  480,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7076',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857076'
);
UPDATE public.portal_risk_items SET
  name = '1320312 Netlogix INV126433 Asus Battery',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 480,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857076';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857077',
  '7012400 Esquire Tech 925719 x1 ASUS PC Box',
  'Miscellaneous',
  'Miscellaneous',
  6955,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701240-7077',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857077'
);
UPDATE public.portal_risk_items SET
  name = '7012400 Esquire Tech 925719 x1 ASUS PC Box',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6955,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857077';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857078',
  '7012400 Esquire Tech 925721 x1 MS Office',
  'Miscellaneous',
  'Miscellaneous',
  3129,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701240-7078',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857078'
);
UPDATE public.portal_risk_items SET
  name = '7012400 Esquire Tech 925721 x1 MS Office',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 3129,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857078';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857079',
  '1320302 Esquire 00929261x6 MS Office',
  'Miscellaneous',
  'Miscellaneous',
  18777,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7079',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857079'
);
UPDATE public.portal_risk_items SET
  name = '1320302 Esquire 00929261x6 MS Office',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 18777,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857079';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857080',
  '1320303 Esquire 00929271 SSD Steyn',
  'Miscellaneous',
  'Miscellaneous',
  607,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7080',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857080'
);