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
UPDATE public.portal_risk_items SET
  name = '1320303 Esquire 00929271 SSD Steyn',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 607,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857080';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857081',
  'Krokodildrift Wes, Brits, North West, 0250 Lenovo Desktop met toerusting',
  'Miscellaneous',
  'Miscellaneous',
  13300,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'KROKOD-7081',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857081'
);
UPDATE public.portal_risk_items SET
  name = 'Krokodildrift Wes, Brits, North West, 0250 Lenovo Desktop met toerusting',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 13300,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857081';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857082',
  '7012300 First Tech 588805 x2 Zebra Printers',
  'Miscellaneous',
  'Miscellaneous',
  30182,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '701230-7082',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857082'
);
UPDATE public.portal_risk_items SET
  name = '7012300 First Tech 588805 x2 Zebra Printers',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 30182,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857082';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857083',
  '1320302 First Tech 588804 x1 Screen',
  'Miscellaneous',
  'Miscellaneous',
  2473,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7083',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857083'
);
UPDATE public.portal_risk_items SET
  name = '1320302 First Tech 588804 x1 Screen',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2473,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857083';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857084',
  '1320303 Netlogix IN125910 x1 Laptop charger/plug',
  'Miscellaneous',
  'Miscellaneous',
  400,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7084',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857084'
);
UPDATE public.portal_risk_items SET
  name = '1320303 Netlogix IN125910 x1 Laptop charger/plug',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 400,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857084';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857085',
  '1320303 Esquire Tech 925722 x3 Mini PC''s',
  'Miscellaneous',
  'Miscellaneous',
  9910,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7085',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857085'
);
UPDATE public.portal_risk_items SET
  name = '1320303 Esquire Tech 925722 x3 Mini PC''s',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 9910,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857085';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857086',
  '1320303 Esquire Tech 923670 x1 RAM',
  'Miscellaneous',
  'Miscellaneous',
  312,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132030-7086',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857086'
);
UPDATE public.portal_risk_items SET
  name = '1320303 Esquire Tech 923670 x1 RAM',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 312,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857086';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857087',
  '1320311 Esquire Tech 927586 x5 Screens',
  'Miscellaneous',
  'Miscellaneous',
  5647,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7087',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857087'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Esquire Tech 927586 x5 Screens',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5647,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857087';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857088',
  '1320311 Netlogix IN126155 Nakivo backup & Replic',
  'Miscellaneous',
  'Miscellaneous',
  35460,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7088',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857088'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Netlogix IN126155 Nakivo backup & Replic',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 35460,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857088';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857089',
  '1320311 Netlogix IN125620 x14 HDD HP SAS 75GB',
  'Miscellaneous',
  'Miscellaneous',
  28070,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7089',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857089'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Netlogix IN125620 x14 HDD HP SAS 75GB',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 28070,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857089';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857090',
  '1320311 Netlogix IN126128 x2 HDD HP SAS 75G',
  'Miscellaneous',
  'Miscellaneous',
  4010,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7090',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857090'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Netlogix IN126128 x2 HDD HP SAS 75G',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 4010,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857090';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857091',
  '1320311 Esquite Tech 925824 x5 Screens',
  'Miscellaneous',
  'Miscellaneous',
  5647,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7091',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857091'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Esquite Tech 925824 x5 Screens',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5647,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857091';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857092',
  '1320311 Esquire Tech 923708 x10 Keyboard/Mouse',
  'Miscellaneous',
  'Miscellaneous',
  1904,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132031-7092',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857092'
);
UPDATE public.portal_risk_items SET
  name = '1320311 Esquire Tech 923708 x10 Keyboard/Mouse',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 1904,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857092';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857093',
  '1320434 Esquire Tech 925723 x12 USB Keyboards',
  'Miscellaneous',
  'Miscellaneous',
  1241,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '132043-7093',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857093'
);
UPDATE public.portal_risk_items SET
  name = '1320434 Esquire Tech 925723 x12 USB Keyboards',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 1241,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857093';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857094',
  '4 x Nuvi 42 LM GPS',
  'Miscellaneous',
  'Miscellaneous',
  5360,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  '4XNUVI-7094',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857094'
);
UPDATE public.portal_risk_items SET
  name = '4 x Nuvi 42 LM GPS',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5360,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857094';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857095',
  'Huawei Mate 20 Lite (Timothy Botha)',
  'Miscellaneous',
  'Miscellaneous',
  6840,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7095',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857095'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Mate 20 Lite (Timothy Botha)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6840,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857095';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857096',
  'Huawei Mate 20 Lite (Jonathan Komape)',
  'Miscellaneous',
  'Miscellaneous',
  6840,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7096',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857096'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Mate 20 Lite (Jonathan Komape)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6840,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857096';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857097',
  'Huawei Mate 20 Lite (Aidan Muruvan)',
  'Miscellaneous',
  'Miscellaneous',
  6840,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7097',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857097'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Mate 20 Lite (Aidan Muruvan)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 6840,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857097';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857098',
  'CAT S31 Smarphone (Quintin Els)',
  'Miscellaneous',
  'Miscellaneous',
  5780,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'CATS31-7098',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857098'
);
UPDATE public.portal_risk_items SET
  name = 'CAT S31 Smarphone (Quintin Els)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 5780,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857098';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857099',
  'Huawei Y6 2019 (Nick)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7099',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857099'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Nick)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857099';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857100',
  'Huawei Y6 2019 (Natasha)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7100',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857100'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Natasha)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857100';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857101',
  'Huawei Y6 2019 (Brandon)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7101',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857101'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Brandon)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857101';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857102',
  'Huawei Y6 2019 (Nlotando)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7102',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857102'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Nlotando)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857102';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857103',
  'Huawei Y6 2019 (Damien)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7103',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857103'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Damien)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857103';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857104',
  'Huawei Y6 2019 (Adnew)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7104',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857104'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Adnew)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857104';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857105',
  'Huawei Y6 2019 (MIchelle)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7105',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857105'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (MIchelle)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857105';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857106',
  'Huawei Y6 2019 (Zama)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7106',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857106'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Zama)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857106';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857107',
  'Huawei Y6 2019 (Tonqo)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7107',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857107'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Tonqo)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857107';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857108',
  'Huawei Y6 2019 (Tyonn)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7108',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857108'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Tyonn)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857108';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857109',
  'Huawei Y6 2019 (Ian)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7109',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857109'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Ian)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857109';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857110',
  'Huawei Y6 2019 (Andile)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7110',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857110'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Andile)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857110';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857111',
  'Huawei Y6 2019 (Savesh)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7111',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857111'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Savesh)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857111';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857112',
  'Huawei Y6 2019 (Tshepo)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7112',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857112'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Tshepo)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857112';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857113',
  'Huawei Y6 2019 (Bessie)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7113',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857113'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Bessie)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857113';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857114',
  'Huawei Y6 2019 (Cedric)',
  'Miscellaneous',
  'Miscellaneous',
  2710,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'HUAWEI-7114',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857114'
);
UPDATE public.portal_risk_items SET
  name = 'Huawei Y6 2019 (Cedric)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2710,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857114';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857115',
  'LG K10 Smartphone (Munene)',
  'Miscellaneous',
  'Miscellaneous',
  2000,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'LGK10S-7115',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857115'
);
UPDATE public.portal_risk_items SET
  name = 'LG K10 Smartphone (Munene)',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 2000,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857115';
INSERT INTO public.portal_risk_items (
  account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  record_date, insurance_status, asset_tag, zoho_fields
)
SELECT
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  '7351644000001857116',
  'Laptop GM5TN0W',
  'Miscellaneous',
  'Miscellaneous',
  42650,
  0,
  CURRENT_DATE,
  'Insured elsewhere',
  'LAPTOP-7116',
  '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.portal_risk_items
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857116'
);
UPDATE public.portal_risk_items SET
  name = 'Laptop GM5TN0W',
  category = 'Miscellaneous',
  insurance_section = 'Miscellaneous',
  unit_cost = 42650,
  zoho_fields = '{"Risk_Type":"All Risk / Portable Item","Risk_Category":"Commercial Lines"}'::jsonb,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000001857116';
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
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND zoho_risk_id = '7351644000003957003';
CREATE TEMP TABLE medipost_cov_link (
  external_risk_id text PRIMARY KEY,
  zoho_risk_id text NOT NULL
) ON COMMIT DROP;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59170', '7351644000001857129') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59174', '7351644000001857129') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59176', '7351644000001857044') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59177', '7351644000003957001') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59178', '7351644000001857046') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59179', '7351644000001857047') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59180', '7351644000001857048') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59181', '7351644000001857049') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59182', '7351644000001857050') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59183', '7351644000001857051') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59184', '7351644000001857052') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59185', '7351644000001857053') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59186', '7351644000003957002') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59187', '7351644000001857055') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59188', '7351644000001857056') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59189', '7351644000001857057') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59190', '7351644000001857058') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59191', '7351644000001857059') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59192', '7351644000001857060') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59193', '7351644000001857061') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59194', '7351644000001857062') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59195', '7351644000001857063') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59196', '7351644000001857064') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59197', '7351644000001857065') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59198', '7351644000001857066') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59199', '7351644000001857067') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59200', '7351644000001857068') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59201', '7351644000001857079') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59202', '7351644000001857080') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59203', '7351644000001857071') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59204', '7351644000001857072') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59205', '7351644000001857073') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59206', '7351644000001857074') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59207', '7351644000001857075') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59208', '7351644000001857076') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59209', '7351644000001857077') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59210', '7351644000001857078') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59211', '7351644000001857079') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59212', '7351644000001857080') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59213', '7351644000001857086') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59214', '7351644000001857082') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59215', '7351644000001857083') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59216', '7351644000001857084') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59217', '7351644000001857085') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59218', '7351644000001857086') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59219', '7351644000001857087') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59220', '7351644000001857088') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59221', '7351644000001857089') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59222', '7351644000001857090') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59223', '7351644000001857091') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59224', '7351644000001857092') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59225', '7351644000001857093') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59226', '7351644000001857094') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59227', '7351644000001857095') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59228', '7351644000001857096') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59229', '7351644000001857097') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59230', '7351644000001857098') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59231', '7351644000001857099') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59232', '7351644000001857100') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59233', '7351644000001857101') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59234', '7351644000001857102') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59235', '7351644000001857103') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59236', '7351644000001857104') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59237', '7351644000001857105') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59238', '7351644000001857106') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59239', '7351644000001857107') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59240', '7351644000001857108') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59241', '7351644000001857109') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59242', '7351644000001857110') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59243', '7351644000001857111') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59244', '7351644000001857112') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59245', '7351644000001857113') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59246', '7351644000001857114') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59247', '7351644000001857115') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59249', '7351644000001857119') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59250', '7351644000001857117') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59251', '7351644000001857118') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59252', '7351644000001857119') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59253', '7351644000001857120') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59254', '7351644000001857121') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59255', '7351644000001857122') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59256', '7351644000001857123') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59257', '7351644000001857124') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59258', '7351644000003957003') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59259', '7351644000001857126') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59260', '7351644000001857127') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59261', '7351644000001857128') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59262', '7351644000001857129') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('59263', '7351644000001857130') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62527', '7351644000001857131') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62529', '7351644000001857132') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62530', '7351644000001857133') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62531', '7351644000001857134') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62533', '7351644000001857135') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62534', '7351644000001857136') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62535', '7351644000001857137') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62536', '7351644000001857138') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62537', '7351644000001857139') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62538', '7351644000001857140') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62539', '7351644000001857141') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62540', '7351644000001857142') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62541', '7351644000001857143') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62542', '7351644000001857144') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62543', '7351644000001857145') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('62544', '7351644000001857146') ON CONFLICT DO NOTHING;
INSERT INTO medipost_cov_link (external_risk_id, zoho_risk_id) VALUES ('64687', '7351644000001857147') ON CONFLICT DO NOTHING;
UPDATE public.portal_policies p SET
  zoho_policy_id = '7351644000001876587',
  covered_items = (
    SELECT COALESCE(jsonb_agg(
      item || jsonb_build_object(
        'risk_item_id', pri.id::text,
        'zoho_risk_id', l.zoho_risk_id
      )
    ), '[]'::jsonb)
    FROM jsonb_array_elements('[{"risk_item_id":null,"risk_item_name":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002","section":"Office Contents","sum_insured":139150.29,"premium_excl":50.504855,"premium_incl":58.08058325,"cover_status":"Approved","description":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002","branch":null,"external_risk_id":"59170","zoho_risk_id":"7351644000001857129","tracking_id":"d60549e0-4037-46c6-bacc-85edc4b175b3","date_added":"2025-07-01","extensions":[{"id":"ext-59170-0","name":"Cover terms","sum_insured":139150.29,"premium_excl":null,"premium_incl":null,"details":{"security":"Unspecified","building Type":""}},{"id":"ext-59170-1","name":"Subsection A - Contents","sum_insured":139150.29,"premium_excl":329.65,"premium_incl":379.1,"details":{"rate":"0.236900%","burglar Alarm Warranty applicable":"0"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002 Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002","section":"Accidental Damage","sum_insured":1515533,"premium_excl":631.66471,"premium_incl":726.4144165,"cover_status":"Approved","description":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002 Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002","branch":null,"external_risk_id":"59174","zoho_risk_id":"7351644000001857129","tracking_id":"85b7e7cf-c81d-4830-94b7-774c5046b58d","date_added":"2025-07-01","extensions":[{"id":"ext-59174-0","name":"Cover terms","sum_insured":1515533,"premium_excl":1216.97,"premium_incl":1399.52,"details":{"rate":"0.080300%","description":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002 ","basis of Cover":"Full Value"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"USB Scanners","section":"Electronic Equipment","sum_insured":384347,"premium_excl":968.10882,"premium_incl":1113.325143,"cover_status":"Approved","description":"USB Scanners","branch":null,"external_risk_id":"59176","zoho_risk_id":"7351644000001857044","tracking_id":"a4c93999-d979-4c2c-9d10-9e2d0b3d57e7","date_added":"2025-07-01","extensions":[{"id":"ext-59176-0","name":"Subsection A - Material Damage","sum_insured":384347,"premium_excl":13359.9,"premium_incl":15363.88,"details":{"description":"USB Scanners","rate":"3.476000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Samsung 35\" LED TV","section":"Electronic Equipment","sum_insured":3504,"premium_excl":42.250369,"premium_incl":48.58792435,"cover_status":"Approved","description":"Samsung 35\" LED TV","branch":null,"external_risk_id":"59177","zoho_risk_id":"7351644000003957001","tracking_id":"9a332a4c-afe6-4e98-9f1f-13af29031242","date_added":"2025-07-01","extensions":[{"id":"ext-59177-0","name":"Subsection A - Material Damage","sum_insured":3504,"premium_excl":583.06,"premium_incl":670.52,"details":{"description":"Samsung 35\" LED TV","rate":"16.639700%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Monitor Screens","section":"Electronic Equipment","sum_insured":9138,"premium_excl":53.507625,"premium_incl":61.53376875,"cover_status":"Approved","description":"Monitor Screens","branch":null,"external_risk_id":"59178","zoho_risk_id":"7351644000001857046","tracking_id":"1c6cf397-e65f-480f-aa5e-2a03993a9f84","date_added":"2025-07-01","extensions":[{"id":"ext-59178-0","name":"Subsection A - Material Damage","sum_insured":9138,"premium_excl":738.41,"premium_incl":849.17,"details":{"description":"Monitor Screens","rate":"8.080600%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Desktop Computers & Accessories","section":"Electronic Equipment","sum_insured":286457,"premium_excl":721.539516,"premium_incl":829.7704434,"cover_status":"Approved","description":"Desktop Computers & Accessories","branch":null,"external_risk_id":"59179","zoho_risk_id":"7351644000001857047","tracking_id":"0a275015-4309-4e5b-8a98-e14fcb527a50","date_added":"2025-07-01","extensions":[{"id":"ext-59179-0","name":"Subsection A - Material Damage","sum_insured":286457,"premium_excl":9957.25,"premium_incl":11450.84,"details":{"description":"Desktop Computers & Accessories","rate":"3.476000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Printers","section":"Electronic Equipment","sum_insured":514944,"premium_excl":1297.061843,"premium_incl":1491.62111945,"cover_status":"Approved","description":"Printers","branch":null,"external_risk_id":"59180","zoho_risk_id":"7351644000001857048","tracking_id":"b730a791-9a11-4fcd-8e95-cc4fa151cc9b","date_added":"2025-07-01","extensions":[{"id":"ext-59180-0","name":"Subsection A - Material Damage","sum_insured":514944,"premium_excl":17899.45,"premium_incl":20584.37,"details":{"description":"Printers","rate":"3.476000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Harddrives","section":"Electronic Equipment","sum_insured":10719,"premium_excl":35.970789,"premium_incl":41.36640735,"cover_status":"Approved","description":"Harddrives","branch":null,"external_risk_id":"59181","zoho_risk_id":"7351644000001857049","tracking_id":"af4c0701-82d3-4edc-975a-707db39fb8e0","date_added":"2025-07-01","extensions":[{"id":"ext-59181-0","name":"Subsection A - Material Damage","sum_insured":10719,"premium_excl":496.4,"premium_incl":570.86,"details":{"description":"Harddrives","rate":"4.631000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Laptops","section":"Electronic Equipment","sum_insured":261303,"premium_excl":2189.07535,"premium_incl":2517.4366525,"cover_status":"Approved","description":"Laptops","branch":null,"external_risk_id":"59182","zoho_risk_id":"7351644000001857050","tracking_id":"d4d82894-8e5b-48c2-ba82-8366dd1ef776","date_added":"2025-07-01","extensions":[{"id":"ext-59182-0","name":"Subsection A - Material Damage","sum_insured":261303,"premium_excl":30209.24,"premium_incl":34740.63,"details":{"description":"Laptops","rate":"11.561000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Tablets","section":"Electronic Equipment","sum_insured":7812,"premium_excl":65.445313,"premium_incl":75.26210995,"cover_status":"Approved","description":"Tablets","branch":null,"external_risk_id":"59183","zoho_risk_id":"7351644000001857051","tracking_id":"363a573b-e51b-4ea5-b334-efc98568bc42","date_added":"2025-07-01","extensions":[{"id":"ext-59183-0","name":"Subsection A - Material Damage","sum_insured":7812,"premium_excl":903.15,"premium_incl":1038.62,"details":{"description":"Tablets","rate":"11.561000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Celeron Laptop & Bag - N2840","section":"Electronic Equipment","sum_insured":4218,"premium_excl":33.756226,"premium_incl":38.8196599,"cover_status":"Approved","description":"Celeron Laptop & Bag - N2840","branch":null,"external_risk_id":"59184","zoho_risk_id":"7351644000001857052","tracking_id":"5d57f545-1d0b-4c08-9ac2-425016311f25","date_added":"2025-07-01","extensions":[{"id":"ext-59184-0","name":"Subsection A - Material Damage","sum_insured":4218,"premium_excl":465.84,"premium_incl":535.72,"details":{"description":"Celeron Laptop & Bag - N2840","rate":"11.044000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Honeydew USB Scanners @ R1248.30 Each","section":"Electronic Equipment","sum_insured":3745,"premium_excl":8.982301,"premium_incl":10.32964615,"cover_status":"Approved","description":"Honeydew USB Scanners @ R1248.30 Each","branch":null,"external_risk_id":"59185","zoho_risk_id":"7351644000001857053","tracking_id":"9e6930a6-b3ae-4022-87a7-cb9eefeae25f","date_added":"2025-07-01","extensions":[{"id":"ext-59185-0","name":"Subsection A - Material Damage","sum_insured":3745,"premium_excl":123.96,"premium_incl":142.55,"details":{"description":"Honeydew USB Scanners @ R1248.30 Each","rate":"3.309900%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Honeywell Scanners @ R1248.30 Each","section":"Electronic Equipment","sum_insured":37449,"premium_excl":89.611658,"premium_incl":103.0534067,"cover_status":"Approved","description":"Honeywell Scanners @ R1248.30 Each","branch":null,"external_risk_id":"59186","zoho_risk_id":"7351644000003957002","tracking_id":"00e0bece-7a14-4b0f-ac1b-0666d971a6d1","date_added":"2025-07-01","extensions":[{"id":"ext-59186-0","name":"Subsection A - Material Damage","sum_insured":37449,"premium_excl":1236.64,"premium_incl":1422.14,"details":{"description":"Honeywell Scanners @ R1248.30 Each","rate":"3.302200%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Honeywell USB Scanners @ R1397 Each","section":"Electronic Equipment","sum_insured":41910,"premium_excl":100.286378,"premium_incl":115.3293347,"cover_status":"Approved","description":"Honeywell USB Scanners @ R1397 Each","branch":null,"external_risk_id":"59187","zoho_risk_id":"7351644000001857055","tracking_id":"db55e489-93d1-4dba-bdc7-b52c8736013c","date_added":"2025-07-01","extensions":[{"id":"ext-59187-0","name":"Subsection A - Material Damage","sum_insured":41910,"premium_excl":1383.95,"premium_incl":1591.54,"details":{"description":"Honeywell USB Scanners @ R1397 Each","rate":"3.302200%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"HP Laserjet Printer P2035","section":"Electronic Equipment","sum_insured":3000,"premium_excl":6.744261,"premium_incl":7.75590015,"cover_status":"Approved","description":"HP Laserjet Printer P2035","branch":null,"external_risk_id":"59188","zoho_risk_id":"7351644000001857056","tracking_id":"2c2af535-2a0d-4f2e-8973-850bd3bdd950","date_added":"2025-07-01","extensions":[{"id":"ext-59188-0","name":"Subsection A - Material Damage","sum_insured":3000,"premium_excl":93.07,"premium_incl":107.03,"details":{"description":"HP Laserjet Printer P2035","rate":"3.102360%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"HP Laserjet Printer","section":"Electronic Equipment","sum_insured":4093,"premium_excl":9.794134,"premium_incl":11.2632541,"cover_status":"Approved","description":"HP Laserjet Printer","branch":null,"external_risk_id":"59189","zoho_risk_id":"7351644000001857057","tracking_id":"423379d2-847e-4268-995a-674513a46124","date_added":"2025-07-01","extensions":[{"id":"ext-59189-0","name":"Subsection A - Material Damage","sum_insured":4093,"premium_excl":135.16,"premium_incl":155.43,"details":{"description":"HP Laserjet Printer","rate":"3.302200%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Lenovo Celeron laptop - ML-PC2896","section":"Electronic Equipment","sum_insured":4480,"premium_excl":35.706574,"premium_incl":41.0625601,"cover_status":"Approved","description":"Lenovo Celeron laptop - ML-PC2896","branch":null,"external_risk_id":"59190","zoho_risk_id":"7351644000001857058","tracking_id":"d4ad857a-a0a7-4017-9ea9-b49fa162cd21","date_added":"2025-07-01","extensions":[{"id":"ext-59190-0","name":"Subsection A - Material Damage","sum_insured":4480,"premium_excl":492.75,"premium_incl":566.66,"details":{"description":"Lenovo Celeron laptop - ML-PC2896","rate":"10.998900%","equipment Type":"","make and Model":"","serial number":"R910WN2T"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Longrange CCD USB Scanners @ R627 Each","section":"Electronic Equipment","sum_insured":25080,"premium_excl":60.213809,"premium_incl":69.24588035,"cover_status":"Approved","description":"Longrange CCD USB Scanners @ R627 Each","branch":null,"external_risk_id":"59191","zoho_risk_id":"7351644000001857059","tracking_id":"33b964d7-352d-4c4e-9be2-18551446779b","date_added":"2025-07-01","extensions":[{"id":"ext-59191-0","name":"Subsection A - Material Damage","sum_insured":25080,"premium_excl":830.95,"premium_incl":955.59,"details":{"description":"Longrange CCD USB Scanners @ R627 Each","rate":"3.313200%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Mecer PC","section":"Electronic Equipment","sum_insured":5284,"premium_excl":12.681983,"premium_incl":14.58428045,"cover_status":"Approved","description":"Mecer PC","branch":null,"external_risk_id":"59192","zoho_risk_id":"7351644000001857060","tracking_id":"2783e34b-dc6a-41f2-bf21-61ea0f4112f2","date_added":"2025-07-01","extensions":[{"id":"ext-59192-0","name":"Subsection A - Material Damage","sum_insured":5284,"premium_excl":175.01,"premium_incl":201.26,"details":{"description":"Mecer PC","rate":"3.312100%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Mecer PC With Mecer Screens @ R12000 Rach","section":"Electronic Equipment","sum_insured":36000,"premium_excl":86.431304,"premium_incl":99.3959996,"cover_status":"Approved","description":"Mecer PC With Mecer Screens @ R12000 Rach","branch":null,"external_risk_id":"59193","zoho_risk_id":"7351644000001857061","tracking_id":"f3b831be-cc58-412c-8f36-f7f41ce90fce","date_added":"2025-07-01","extensions":[{"id":"ext-59193-0","name":"Subsection A - Material Damage","sum_insured":36000,"premium_excl":1192.75,"premium_incl":1371.66,"details":{"description":"Mecer PC With Mecer Screens @ R12000 Rach","rate":"3.313200%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Mecer PC''s With Accesories & Software","section":"Electronic Equipment","sum_insured":15185,"premium_excl":36.336164,"premium_incl":41.7865886,"cover_status":"Approved","description":"Mecer PC''s With Accesories & Software","branch":null,"external_risk_id":"59194","zoho_risk_id":"7351644000001857062","tracking_id":"209d1e86-41c5-4b82-837c-1adaf2b37c55","date_added":"2025-07-01","extensions":[{"id":"ext-59194-0","name":"Subsection A - Material Damage","sum_insured":15185,"premium_excl":501.44,"premium_incl":576.66,"details":{"description":"Mecer PC''s With Accesories & Software","rate":"3.302200%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Multifunction DFN Printer","section":"Electronic Equipment","sum_insured":3187,"premium_excl":7.623627,"premium_incl":8.76717105,"cover_status":"Approved","description":"Multifunction DFN Printer","branch":null,"external_risk_id":"59195","zoho_risk_id":"7351644000001857063","tracking_id":"eb3bc67e-a261-4252-b03a-84235c38077d","date_added":"2025-07-01","extensions":[{"id":"ext-59195-0","name":"Subsection A - Material Damage","sum_insured":3187,"premium_excl":105.21,"premium_incl":120.99,"details":{"description":"Multifunction DFN Printer","rate":"3.301100%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Samsung Galaxy Tab (Dian Bester)","section":"Electronic Equipment","sum_insured":5000,"premium_excl":39.847101,"premium_incl":45.82416615,"cover_status":"Approved","description":"Samsung Galaxy Tab (Dian Bester)","branch":null,"external_risk_id":"59196","zoho_risk_id":"7351644000001857064","tracking_id":"a15145b1-8f94-4198-aabc-addd2def1751","date_added":"2025-07-01","extensions":[{"id":"ext-59196-0","name":"Subsection A - Material Damage","sum_insured":5000,"premium_excl":549.89,"premium_incl":632.37,"details":{"description":"Samsung Galaxy Tab (Dian Bester)","rate":"10.997800%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Software Office 2016 Home and Business Microsoft","section":"Electronic Equipment","sum_insured":3938,"premium_excl":9.460902,"premium_incl":10.8800373,"cover_status":"Approved","description":"Software Office 2016 Home and Business Microsoft","branch":null,"external_risk_id":"59197","zoho_risk_id":"7351644000001857065","tracking_id":"0cee4910-ab1b-428a-9179-ab125bf38912","date_added":"2025-07-01","extensions":[{"id":"ext-59197-0","name":"Subsection A - Material Damage","sum_insured":3938,"premium_excl":130.56,"premium_incl":150.14,"details":{"description":"Software Office 2016 Home and Business Microsoft","rate":"3.315400%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Zebra Printers @ 4330.86 Each","section":"Electronic Equipment","sum_insured":17323,"premium_excl":41.562647,"premium_incl":47.79704405,"cover_status":"Approved","description":"Zebra Printers @ 4330.86 Each","branch":null,"external_risk_id":"59198","zoho_risk_id":"7351644000001857066","tracking_id":"d49a0e63-7e10-4e0a-b578-7c14c6591f3a","date_added":"2025-07-01","extensions":[{"id":"ext-59198-0","name":"Subsection A - Material Damage","sum_insured":17323,"premium_excl":573.56,"premium_incl":659.59,"details":{"description":"Zebra Printers @ 4330.86 Each","rate":"3.311000%","equipment Type":"","make and Model":"","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7012300 Esquire 00929260 x2 PC Boxes CCMDD","section":"Electronic Equipment","sum_insured":15458,"premium_excl":98.585075,"premium_incl":113.37283625,"cover_status":"Approved","description":"7012300 Esquire 00929260 x2 PC Boxes CCMDD","branch":null,"external_risk_id":"59199","zoho_risk_id":"7351644000001857067","tracking_id":"3c666c0c-0166-4889-b640-87eea2d8e8d6","date_added":"2025-07-01","extensions":[{"id":"ext-59199-0","name":"Subsection A - Material Damage","sum_insured":15458,"premium_excl":1360.47,"premium_incl":1564.54,"details":{"description":"7012300 Esquire 00929260 x2 PC Boxes CCMDD","rate":"8.801100%","equipment Type":"","make and Model":"","serial number":"PNA54076"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7012400 Esquire Tech 929262 x1 PC Box","section":"Electronic Equipment","sum_insured":7825,"premium_excl":49.904788,"premium_incl":57.3905062,"cover_status":"Approved","description":"7012400 Esquire Tech 929262 x1 PC Box","branch":null,"external_risk_id":"59200","zoho_risk_id":"7351644000001857068","tracking_id":"f44a8581-925b-4b2c-8116-f4f855840f32","date_added":"2025-07-01","extensions":[{"id":"ext-59200-0","name":"Subsection A - Material Damage","sum_insured":7825,"premium_excl":688.69,"premium_incl":791.99,"details":{"description":" 7012400 Esquire Tech 929262 x1 PC Box","rate":"8.801100%","equipment Type":"","make and Model":"","serial number":"PNA45493"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320302 Esquire 00929261x6 MS Office","section":"Electronic Equipment","sum_insured":18777,"premium_excl":119.737391,"premium_incl":137.69799965,"cover_status":"Approved","description":"1320302 Esquire 00929261x6 MS Office","branch":null,"external_risk_id":"59201","zoho_risk_id":"7351644000001857079","tracking_id":"882245cd-6227-4bb2-a6e1-2a91395425c3","date_added":"2025-07-01","extensions":[{"id":"ext-59201-0","name":"Subsection A - Material Damage","sum_insured":18777,"premium_excl":1652.38,"premium_incl":1900.24,"details":{"description":"1320302 Esquire 00929261x6 MS Office","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA54075"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320303 Esquire 00929271 SSD Steyn","section":"Electronic Equipment","sum_insured":607,"premium_excl":3.874112,"premium_incl":4.4552288,"cover_status":"Approved","description":"1320303 Esquire 00929271 SSD Steyn","branch":null,"external_risk_id":"59202","zoho_risk_id":"7351644000001857080","tracking_id":"af23e797-2820-48e9-9829-1e9b48b994cf","date_added":"2025-07-01","extensions":[{"id":"ext-59202-0","name":"Subsection A - Material Damage","sum_insured":607,"premium_excl":53.46,"premium_incl":61.48,"details":{"description":"1320303 Esquire 00929271 SSD Steyn","rate":"8.807700%","equipment Type":"","make and Model":"","serial number":"PNA54074"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320310 Esquire Tech 930055 x1 PC Box - BI","section":"Electronic Equipment","sum_insured":6580,"premium_excl":41.964665,"premium_incl":48.25936475,"cover_status":"Approved","description":"1320310 Esquire Tech 930055 x1 PC Box - BI","branch":null,"external_risk_id":"59203","zoho_risk_id":"7351644000001857071","tracking_id":"129fdb82-44c2-44b8-8d2e-8bcf1b5e7761","date_added":"2025-07-01","extensions":[{"id":"ext-59203-0","name":"Subsection A - Material Damage","sum_insured":6580,"premium_excl":579.11,"premium_incl":665.98,"details":{"description":"1320310 Esquire Tech 930055 x1 PC Box - BI","rate":"8.801100%","equipment Type":"","make and Model":"","serial number":"PNA45495"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320310 Esquire Tech 930060 x1 SSD - BI","section":"Electronic Equipment","sum_insured":868,"premium_excl":5.538532,"premium_incl":6.3693118,"cover_status":"Approved","description":"1320310 Esquire Tech 930060 x1 SSD - BI","branch":null,"external_risk_id":"59204","zoho_risk_id":"7351644000001857072","tracking_id":"3966d184-0e79-4487-b560-ff965ad8d3d8","date_added":"2025-07-01","extensions":[{"id":"ext-59204-0","name":"Subsection A - Material Damage","sum_insured":868,"premium_excl":76.43,"premium_incl":87.89,"details":{"description":"1320310 Esquire Tech 930060 x1 SSD - BI","rate":"8.805500%","equipment Type":"","make and Model":"","serial number":"PNA45496"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320310 First Tech 590735 x5 Wireless keyboard/m","section":"Electronic Equipment","sum_insured":1281,"premium_excl":8.168696,"premium_incl":9.3940004,"cover_status":"Approved","description":"1320310 First Tech 590735 x5 Wireless keyboard/m","branch":null,"external_risk_id":"59205","zoho_risk_id":"7351644000001857073","tracking_id":"ba22e608-a720-40b4-a026-afca848c7b1c","date_added":"2025-07-01","extensions":[{"id":"ext-59205-0","name":"Subsection A - Material Damage","sum_insured":1281,"premium_excl":112.73,"premium_incl":129.64,"details":{"description":"1320310 First Tech 590735 x5 Wireless keyboard/m","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45618"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Strategix SIT - INV11643 x62 MSP Licences","section":"Electronic Equipment","sum_insured":14206,"premium_excl":90.588986,"premium_incl":104.1773339,"cover_status":"Approved","description":"1320311 Strategix SIT - INV11643 x62 MSP Licences","branch":null,"external_risk_id":"59206","zoho_risk_id":"7351644000001857074","tracking_id":"a9791694-5bc3-472b-90fc-fdaa29ab978f","date_added":"2025-07-01","extensions":[{"id":"ext-59206-0","name":"Subsection A - Material Damage","sum_insured":14206,"premium_excl":1250.13,"premium_incl":1437.65,"details":{"description":"1320311 Strategix SIT - INV11643 x62 MSP Licences","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA54094"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Esquire Tech 929272 x10 Screens","section":"Electronic Equipment","sum_insured":10252,"premium_excl":65.375072,"premium_incl":75.1813328,"cover_status":"Approved","description":"1320311 Esquire Tech 929272 x10 Screens","branch":null,"external_risk_id":"59207","zoho_risk_id":"7351644000001857075","tracking_id":"faf66684-3784-41b4-a4fa-f63efd4e785f","date_added":"2025-07-01","extensions":[{"id":"ext-59207-0","name":"Subsection A - Material Damage","sum_insured":10252,"premium_excl":902.18,"premium_incl":1037.51,"details":{"description":"1320311 Esquire Tech 929272 x10 Screens","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45494"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320312 Netlogix INV126433 Asus Battery","section":"Electronic Equipment","sum_insured":480,"premium_excl":3.06087,"premium_incl":3.5200005,"cover_status":"Approved","description":"1320312 Netlogix INV126433 Asus Battery","branch":null,"external_risk_id":"59208","zoho_risk_id":"7351644000001857076","tracking_id":"b75efd01-5d1c-4a1e-b778-0f8402e73525","date_added":"2025-07-01","extensions":[{"id":"ext-59208-0","name":"Subsection A - Material Damage","sum_insured":480,"premium_excl":42.24,"premium_incl":48.58,"details":{"description":"1320312 Netlogix INV126433 Asus Battery","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA54073"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7012400 Esquire Tech 925719 x1 ASUS PC Box","section":"Electronic Equipment","sum_insured":6955,"premium_excl":44.356268,"premium_incl":51.0097082,"cover_status":"Approved","description":"7012400 Esquire Tech 925719 x1 ASUS PC Box","branch":null,"external_risk_id":"59209","zoho_risk_id":"7351644000001857077","tracking_id":"8c8db0d4-671d-4ee4-ab26-2204cf900769","date_added":"2025-07-01","extensions":[{"id":"ext-59209-0","name":"Subsection A - Material Damage","sum_insured":6955,"premium_excl":612.12,"premium_incl":703.94,"details":{"description":"7012400 Esquire Tech 925719 x1 ASUS PC Box","rate":"8.801100%","equipment Type":"","make and Model":"","serial number":"PNA45390"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7012400 Esquire Tech 925721 x1 MS Office","section":"Electronic Equipment","sum_insured":3129,"premium_excl":19.953043,"premium_incl":22.94599945,"cover_status":"Approved","description":"7012400 Esquire Tech 925721 x1 MS Office","branch":null,"external_risk_id":"59210","zoho_risk_id":"7351644000001857078","tracking_id":"9685e1c2-352a-4fe7-b27b-37601558df1a","date_added":"2025-07-01","extensions":[{"id":"ext-59210-0","name":"Subsection A - Material Damage","sum_insured":3129,"premium_excl":275.35,"premium_incl":316.65,"details":{"description":"7012400 Esquire Tech 925721 x1 MS Office","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45395"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320302 Esquire 00929261x6 MS Office","section":"Electronic Equipment","sum_insured":18777,"premium_excl":89.803043,"premium_incl":103.27349945,"cover_status":"Approved","description":"1320302 Esquire 00929261x6 MS Office","branch":null,"external_risk_id":"59211","zoho_risk_id":"7351644000001857079","tracking_id":"c18a54b7-466c-4af1-a479-d02b964c1a22","date_added":"2025-07-01","extensions":[{"id":"ext-59211-0","name":"Subsection A - Material Damage","sum_insured":18777,"premium_excl":1239.28,"premium_incl":1425.17,"details":{"description":"1320302 Esquire 00929261x6 MS Office","rate":"6.600000%","equipment Type":"","make and Model":"","serial number":"PNA54075"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320303 Esquire 00929271 SSD Steyn","section":"Electronic Equipment","sum_insured":607,"premium_excl":3.874112,"premium_incl":4.4552288,"cover_status":"Approved","description":"1320303 Esquire 00929271 SSD Steyn","branch":null,"external_risk_id":"59212","zoho_risk_id":"7351644000001857080","tracking_id":"3212ce42-73e7-4480-bbef-430398a4b5cd","date_added":"2025-07-01","extensions":[{"id":"ext-59212-0","name":"Subsection A - Material Damage","sum_insured":607,"premium_excl":53.46,"premium_incl":61.48,"details":{"description":"1320303 Esquire 00929271 SSD Steyn","rate":"8.807700%","equipment Type":"","make and Model":"","serial number":"PNA54074"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7012300 Esquire Tech 925912 x1 ASUS Laptop","section":"Electronic Equipment","sum_insured":13912,"premium_excl":88.714203,"premium_incl":102.02133345,"cover_status":"Approved","description":"7012300 Esquire Tech 925912 x1 ASUS Laptop","branch":null,"external_risk_id":"59213","zoho_risk_id":"7351644000001857086","tracking_id":"5e34342b-f9d0-43f8-b3ee-bf8016af2781","date_added":"2025-07-01","extensions":[{"id":"ext-59213-0","name":"Subsection A - Material Damage","sum_insured":13912,"premium_excl":1224.26,"premium_incl":1407.9,"details":{"description":"7012300 Esquire Tech 925912 x1 ASUS Laptop","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45394"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7012300 First Tech 588805 x2 Zebra Printers","section":"Electronic Equipment","sum_insured":30182,"premium_excl":192.464928,"premium_incl":221.3346672,"cover_status":"Approved","description":"7012300 First Tech 588805 x2 Zebra Printers","branch":null,"external_risk_id":"59214","zoho_risk_id":"7351644000001857082","tracking_id":"9d5c6272-17bc-495c-9adc-31287b690125","date_added":"2025-07-01","extensions":[{"id":"ext-59214-0","name":"Subsection A - Material Damage","sum_insured":30182,"premium_excl":2656.02,"premium_incl":3054.42,"details":{"description":"7012300 First Tech 588805 x2 Zebra Printers","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45408"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320302 First Tech 588804 x1 Screen","section":"Electronic Equipment","sum_insured":2473,"premium_excl":15.773798,"premium_incl":18.1398677,"cover_status":"Approved","description":"1320302 First Tech 588804 x1 Screen","branch":null,"external_risk_id":"59215","zoho_risk_id":"7351644000001857083","tracking_id":"fc359b31-9e66-4230-9934-7e27e526e827","date_added":"2025-07-01","extensions":[{"id":"ext-59215-0","name":"Subsection A - Material Damage","sum_insured":2473,"premium_excl":217.68,"premium_incl":250.33,"details":{"description":"1320302 First Tech 588804 x1 Screen","rate":"8.802200%","equipment Type":"","make and Model":"","serial number":"PNA45407"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320303 Netlogix IN125910 x1 Laptop charger/plug","section":"Electronic Equipment","sum_insured":400,"premium_excl":2.553913,"premium_incl":2.93699995,"cover_status":"Approved","description":"1320303 Netlogix IN125910 x1 Laptop charger/plug","branch":null,"external_risk_id":"59216","zoho_risk_id":"7351644000001857084","tracking_id":"87467427-22db-434c-b5f6-0c377ed1334d","date_added":"2025-07-01","extensions":[{"id":"ext-59216-0","name":"Subsection A - Material Damage","sum_insured":400,"premium_excl":35.24,"premium_incl":40.53,"details":{"description":"1320303 Netlogix IN125910 x1 Laptop charger/plug","rate":"8.811000%","equipment Type":"","make and Model":"","serial number":"PNA45332"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320303 Esquire Tech 925722 x3 Mini PC''s","section":"Electronic Equipment","sum_insured":9910,"premium_excl":63.194203,"premium_incl":72.67333345,"cover_status":"Approved","description":"1320303 Esquire Tech 925722 x3 Mini PC''s","branch":null,"external_risk_id":"59217","zoho_risk_id":"7351644000001857085","tracking_id":"9bcff911-e652-44da-afd0-d6225c2f5c34","date_added":"2025-07-01","extensions":[{"id":"ext-59217-0","name":"Subsection A - Material Damage","sum_insured":9910,"premium_excl":872.08,"premium_incl":1002.89,"details":{"description":"1320303 Esquire Tech 925722 x3 Mini PC''s","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45392"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320303 Esquire Tech 923670 x1 RAM","section":"Electronic Equipment","sum_insured":312,"premium_excl":1.989565,"premium_incl":2.28799975,"cover_status":"Approved","description":"1320303 Esquire Tech 923670 x1 RAM","branch":null,"external_risk_id":"59218","zoho_risk_id":"7351644000001857086","tracking_id":"1f1572fd-aa85-48ce-ad95-1ad2e40815ec","date_added":"2025-07-01","extensions":[{"id":"ext-59218-0","name":"Subsection A - Material Damage","sum_insured":312,"premium_excl":27.46,"premium_incl":31.58,"details":{"description":"1320303 Esquire Tech 923670 x1 RAM","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45393"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Esquire Tech 927586 x5 Screens","section":"Electronic Equipment","sum_insured":5647,"premium_excl":36.014356,"premium_incl":41.4165094,"cover_status":"Approved","description":"1320311 Esquire Tech 927586 x5 Screens","branch":null,"external_risk_id":"59219","zoho_risk_id":"7351644000001857087","tracking_id":"74275856-d592-4058-9737-4dd4d6ba021a","date_added":"2025-07-01","extensions":[{"id":"ext-59219-0","name":"Subsection A - Material Damage","sum_insured":5647,"premium_excl":497,"premium_incl":571.55,"details":{"description":"1320311 Esquire Tech 927586 x5 Screens","rate":"8.801100%","equipment Type":"","make and Model":"","serial number":"PNA45472"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Netlogix IN126155 Nakivo backup & Replic","section":"Electronic Equipment","sum_insured":35460,"premium_excl":226.121739,"premium_incl":260.03999985,"cover_status":"Approved","description":"1320311 Netlogix IN126155 Nakivo backup & Replic","branch":null,"external_risk_id":"59220","zoho_risk_id":"7351644000001857088","tracking_id":"68a5b129-5429-4a78-8f66-c37f9b024dc6","date_added":"2025-07-01","extensions":[{"id":"ext-59220-0","name":"Subsection A - Material Damage","sum_insured":35460,"premium_excl":3120.48,"premium_incl":3588.55,"details":{"description":"1320311 Netlogix IN126155 Nakivo backup & Replic","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45307"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Netlogix IN125620 x14 HDD HP SAS 75GB","section":"Electronic Equipment","sum_insured":28070,"premium_excl":178.997101,"premium_incl":205.84666615,"cover_status":"Approved","description":"1320311 Netlogix IN125620 x14 HDD HP SAS 75GB","branch":null,"external_risk_id":"59221","zoho_risk_id":"7351644000001857089","tracking_id":"2afbd9e0-9532-47bf-8226-31ff82004ff5","date_added":"2025-07-01","extensions":[{"id":"ext-59221-0","name":"Subsection A - Material Damage","sum_insured":28070,"premium_excl":2470.16,"premium_incl":2840.68,"details":{"description":"1320311 Netlogix IN125620 x14 HDD HP SAS 75GB","rate":"8.800000%","equipment Type":"","make and Model":"","serial number":"PNA45331"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Netlogix IN126128 x2 HDD HP SAS 75G","section":"Electronic Equipment","sum_insured":4010,"premium_excl":25.567818,"premium_incl":29.4029907,"cover_status":"Approved","description":"1320311 Netlogix IN126128 x2 HDD HP SAS 75G","branch":null,"external_risk_id":"59222","zoho_risk_id":"7351644000001857090","tracking_id":"27f74e6d-0467-4f67-92f1-502d9a446ed4","date_added":"2025-07-01","extensions":[{"id":"ext-59222-0","name":"Subsection A - Material Damage","sum_insured":4010,"premium_excl":352.84,"premium_incl":405.77,"details":{"description":"1320311 Netlogix IN126128 x2 HDD HP SAS 75G","rate":"8.798900%","equipment Type":"","make and Model":"","serial number":"PNA45331"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Esquite Tech 925824 x5 Screens","section":"Electronic Equipment","sum_insured":5647,"premium_excl":36.014356,"premium_incl":41.4165094,"cover_status":"Approved","description":"1320311 Esquite Tech 925824 x5 Screens","branch":null,"external_risk_id":"59223","zoho_risk_id":"7351644000001857091","tracking_id":"db1292fa-62ba-4b71-af3e-6816d3f7862a","date_added":"2025-07-01","extensions":[{"id":"ext-59223-0","name":"Subsection A - Material Damage","sum_insured":5647,"premium_excl":497,"premium_incl":571.55,"details":{"description":"1320311 Esquite Tech 925824 x5 Screens","rate":"8.801100%","equipment Type":"","make and Model":"","serial number":"PNA45389"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320311 Esquire Tech 923708 x10 Keyboard/Mouse","section":"Electronic Equipment","sum_insured":1904,"premium_excl":12.14752,"premium_incl":13.969648,"cover_status":"Approved","description":"1320311 Esquire Tech 923708 x10 Keyboard/Mouse","branch":null,"external_risk_id":"59224","zoho_risk_id":"7351644000001857092","tracking_id":"f7feec51-0242-4422-a702-d75693a769a0","date_added":"2025-07-01","extensions":[{"id":"ext-59224-0","name":"Subsection A - Material Damage","sum_insured":1904,"premium_excl":167.64,"premium_incl":192.79,"details":{"description":"1320311 Esquire Tech 923708 x10 Keyboard/Mouse","rate":"8.804400%","equipment Type":"","make and Model":"","serial number":"PNA45391"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320434 Esquire Tech 925723 x12 USB Keyboards","section":"Electronic Equipment","sum_insured":1241,"premium_excl":7.919558,"premium_incl":9.1074917,"cover_status":"Approved","description":"1320434 Esquire Tech 925723 x12 USB Keyboards","branch":null,"external_risk_id":"59225","zoho_risk_id":"7351644000001857093","tracking_id":"4b05330f-c580-440e-92f0-e7d7a30343b6","date_added":"2025-07-01","extensions":[{"id":"ext-59225-0","name":"Subsection A - Material Damage","sum_insured":1241,"premium_excl":109.29,"premium_incl":125.68,"details":{"description":"1320434 Esquire Tech 925723 x12 USB Keyboards","rate":"8.806600%","equipment Type":"","make and Model":"","serial number":"PNA45396"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"4 x Nuvi 42 LM GPS","section":"Business All Risks","sum_insured":5360,"premium_excl":34.260887,"premium_incl":39.40002005,"cover_status":"Approved","description":"4 x Nuvi 42 LM GPS","branch":null,"external_risk_id":"59226","zoho_risk_id":"7351644000001857094","tracking_id":"a5aee507-af3e-4a27-a3ee-54872c5f3af3","date_added":"2025-07-01","extensions":[{"id":"ext-59226-0","name":"Cover terms","sum_insured":5360,"premium_excl":472.8,"premium_incl":543.72,"details":{"rate":"8.820900%","description":"4 x Nuvi 42 LM GPS","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Mate 20 Lite (Timothy Botha)","section":"Business All Risks","sum_insured":6840,"premium_excl":65.589652,"premium_incl":75.4280998,"cover_status":"Approved","description":"Huawei Mate 20 Lite (Timothy Botha)","branch":null,"external_risk_id":"59227","zoho_risk_id":"7351644000001857095","tracking_id":"4da085da-fa6c-4e9b-86fd-19b92125ca73","date_added":"2025-07-01","extensions":[{"id":"ext-59227-0","name":"Cover terms","sum_insured":6840,"premium_excl":905.14,"premium_incl":1040.91,"details":{"rate":"13.233000%","description":"Huawei Mate 20 Lite (Timothy Botha)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Mate 20 Lite (Jonathan Komape)","section":"Business All Risks","sum_insured":6840,"premium_excl":65.589652,"premium_incl":75.4280998,"cover_status":"Approved","description":"Huawei Mate 20 Lite (Jonathan Komape)","branch":null,"external_risk_id":"59228","zoho_risk_id":"7351644000001857096","tracking_id":"31dd52af-bdc5-4b52-afbe-c97a959be186","date_added":"2025-07-01","extensions":[{"id":"ext-59228-0","name":"Cover terms","sum_insured":6840,"premium_excl":905.14,"premium_incl":1040.91,"details":{"rate":"13.233000%","description":"Huawei Mate 20 Lite (Jonathan Komape)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Mate 20 Lite (Aidan Muruvan)","section":"Business All Risks","sum_insured":6840,"premium_excl":65.589652,"premium_incl":75.4280998,"cover_status":"Approved","description":"Huawei Mate 20 Lite (Aidan Muruvan)","branch":null,"external_risk_id":"59229","zoho_risk_id":"7351644000001857097","tracking_id":"074e6ad1-3b41-4185-b522-df240b16679e","date_added":"2025-07-01","extensions":[{"id":"ext-59229-0","name":"Cover terms","sum_insured":6840,"premium_excl":905.14,"premium_incl":1040.91,"details":{"rate":"13.233000%","description":"Huawei Mate 20 Lite (Aidan Muruvan)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"CAT S31 Smarphone (Quintin Els)","section":"Business All Risks","sum_insured":5780,"premium_excl":58.184914,"premium_incl":66.9126511,"cover_status":"Approved","description":"CAT S31 Smarphone (Quintin Els)","branch":null,"external_risk_id":"59230","zoho_risk_id":"7351644000001857098","tracking_id":"d5820507-7bda-4e93-915e-7ba7a5704c18","date_added":"2025-07-01","extensions":[{"id":"ext-59230-0","name":"Cover terms","sum_insured":5780,"premium_excl":802.95,"premium_incl":923.39,"details":{"rate":"13.891900%","description":"CAT S31 Smarphone (Quintin Els)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Nick)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Nick)","branch":null,"external_risk_id":"59231","zoho_risk_id":"7351644000001857099","tracking_id":"4a877550-8400-4d3d-a6aa-cf05a401702f","date_added":"2025-07-01","extensions":[{"id":"ext-59231-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Nick)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Natasha)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Natasha)","branch":null,"external_risk_id":"59232","zoho_risk_id":"7351644000001857100","tracking_id":"e9e79b4f-74cf-455c-84d1-3c4eb72e60c5","date_added":"2025-07-01","extensions":[{"id":"ext-59232-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Natasha)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Brandon)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Brandon)","branch":null,"external_risk_id":"59233","zoho_risk_id":"7351644000001857101","tracking_id":"a671045c-5759-4d31-9e0f-09ea26454428","date_added":"2025-07-01","extensions":[{"id":"ext-59233-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Brandon)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Nlotando)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Nlotando)","branch":null,"external_risk_id":"59234","zoho_risk_id":"7351644000001857102","tracking_id":"8cbb72b5-068c-49d8-85e2-534bfe412927","date_added":"2025-07-01","extensions":[{"id":"ext-59234-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Nlotando)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Damien)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Damien)","branch":null,"external_risk_id":"59235","zoho_risk_id":"7351644000001857103","tracking_id":"40c6925b-4294-4fcd-b20f-df8f5a6f81a9","date_added":"2025-07-01","extensions":[{"id":"ext-59235-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Damien)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Adnew)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Adnew)","branch":null,"external_risk_id":"59236","zoho_risk_id":"7351644000001857104","tracking_id":"671df1eb-174c-4b42-8f76-d4ea9749ba20","date_added":"2025-07-01","extensions":[{"id":"ext-59236-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Adnew)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (MIchelle)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (MIchelle)","branch":null,"external_risk_id":"59237","zoho_risk_id":"7351644000001857105","tracking_id":"1d4af5d3-2933-4bf4-b4ad-9df560bddb8a","date_added":"2025-07-01","extensions":[{"id":"ext-59237-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (MIchelle)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Zama)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Zama)","branch":null,"external_risk_id":"59238","zoho_risk_id":"7351644000001857106","tracking_id":"2a58be57-7961-4f61-92d1-d061b8de5fbc","date_added":"2025-07-01","extensions":[{"id":"ext-59238-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Zama)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Tonqo)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Tonqo)","branch":null,"external_risk_id":"59239","zoho_risk_id":"7351644000001857107","tracking_id":"c7a9a5c3-f23c-4994-939f-1d3082d12cca","date_added":"2025-07-01","extensions":[{"id":"ext-59239-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Tonqo)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Tyonn)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Tyonn)","branch":null,"external_risk_id":"59240","zoho_risk_id":"7351644000001857108","tracking_id":"22a6352e-a387-4cd1-9747-4f266a06f9ae","date_added":"2025-07-01","extensions":[{"id":"ext-59240-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Tyonn)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Ian)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Ian)","branch":null,"external_risk_id":"59241","zoho_risk_id":"7351644000001857109","tracking_id":"0157a8a2-b6ba-474d-b496-9155a698e3d9","date_added":"2025-07-01","extensions":[{"id":"ext-59241-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Ian)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Andile)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Andile)","branch":null,"external_risk_id":"59242","zoho_risk_id":"7351644000001857110","tracking_id":"dc9915ba-1166-4dda-99ba-5459b7e914ab","date_added":"2025-07-01","extensions":[{"id":"ext-59242-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Andile)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Savesh)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Savesh)","branch":null,"external_risk_id":"59243","zoho_risk_id":"7351644000001857111","tracking_id":"3b086981-13cd-4a10-b055-c81290b8cde2","date_added":"2025-07-01","extensions":[{"id":"ext-59243-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":" Huawei Y6 2019 (Savesh)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Tshepo)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Tshepo)","branch":null,"external_risk_id":"59244","zoho_risk_id":"7351644000001857112","tracking_id":"5d478826-c29a-4dcf-b817-5794af976f34","date_added":"2025-07-01","extensions":[{"id":"ext-59244-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Tshepo)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Bessie)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Bessie)","branch":null,"external_risk_id":"59245","zoho_risk_id":"7351644000001857113","tracking_id":"87039209-a6ea-4b8b-ad66-09a3ac202a7c","date_added":"2025-07-01","extensions":[{"id":"ext-59245-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Bessie)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Huawei Y6 2019 (Cedric)","section":"Business All Risks","sum_insured":2710,"premium_excl":27.28047,"premium_incl":31.3725405,"cover_status":"Approved","description":"Huawei Y6 2019 (Cedric)","branch":null,"external_risk_id":"59246","zoho_risk_id":"7351644000001857114","tracking_id":"24472118-17d9-48f6-b7e0-f8dc6d1234e7","date_added":"2025-07-01","extensions":[{"id":"ext-59246-0","name":"Cover terms","sum_insured":2710,"premium_excl":376.47,"premium_incl":432.94,"details":{"rate":"13.891900%","description":"Huawei Y6 2019 (Cedric)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"LG K10 Smartphone (Munene)","section":"Business All Risks","sum_insured":2000,"premium_excl":20.134783,"premium_incl":23.15500045,"cover_status":"Approved","description":"LG K10 Smartphone (Munene)","branch":null,"external_risk_id":"59247","zoho_risk_id":"7351644000001857115","tracking_id":"b98f9641-5dba-4039-822d-b085fe885d70","date_added":"2025-07-01","extensions":[{"id":"ext-59247-0","name":"Cover terms","sum_insured":2000,"premium_excl":277.86,"premium_incl":319.54,"details":{"rate":"13.893000%","description":"LG K10 Smartphone (Munene)","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"21x Ulefone Armor X6 16GB Dual Sim","section":"Business All Risks","sum_insured":43339,"premium_excl":436.310672,"premium_incl":501.7572728,"cover_status":"Approved","description":"21x Ulefone Armor X6 16GB Dual Sim","branch":null,"external_risk_id":"59249","zoho_risk_id":"7351644000001857119","tracking_id":"3991244c-44ff-46b8-81b5-66475523304e","date_added":"2025-07-01","extensions":[{"id":"ext-59249-0","name":"Cover terms","sum_insured":43339,"premium_excl":6021.09,"premium_incl":6924.25,"details":{"rate":"13.893000%","description":" 21x Ulefone Armor X6 16GB Dual Sim","serial Number":"Excel list attached with IMEI and Serial","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"I Phone 13 Pro","section":"Business All Risks","sum_insured":23499,"premium_excl":236.573628,"premium_incl":272.0596722,"cover_status":"Approved","description":"I Phone 13 Pro","branch":null,"external_risk_id":"59250","zoho_risk_id":"7351644000001857117","tracking_id":"622d90e5-a46c-4d74-9412-4d7ed64ecf8b","date_added":"2025-07-01","extensions":[{"id":"ext-59250-0","name":"Cover terms","sum_insured":23499,"premium_excl":3264.72,"premium_incl":3754.43,"details":{"rate":"13.893000%","description":"I Phone 13 Pro","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"79x PM75 Mobile Device @ R9,123 each","section":"Business All Risks","sum_insured":720717,"premium_excl":7255.740059,"premium_incl":8344.10106785,"cover_status":"Approved","description":"79x PM75 Mobile Device @ R9,123 each","branch":null,"external_risk_id":"59251","zoho_risk_id":"7351644000001857118","tracking_id":"254a2fb9-16fb-4ffd-8e41-9c68a9bc46ed","date_added":"2025-07-01","extensions":[{"id":"ext-59251-0","name":"Cover terms","sum_insured":720717,"premium_excl":100129.21,"premium_incl":115148.59,"details":{"rate":"13.893000%","description":"79x PM75 Mobile Device @ R9,123 each","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"16x Ulefone Armor X6 16GB Sim Rugged @ R2,399 each","section":"Business All Risks","sum_insured":38384,"premium_excl":372.658574,"premium_incl":428.5573601,"cover_status":"Approved","description":"16x Ulefone Armor X6 16GB Sim Rugged @ R2,399 each","branch":null,"external_risk_id":"59252","zoho_risk_id":"7351644000001857119","tracking_id":"32e55668-d016-4ad7-9c04-5377d6e348b0","date_added":"2025-07-01","extensions":[{"id":"ext-59252-0","name":"Cover terms","sum_insured":38384,"premium_excl":5142.69,"premium_incl":5914.09,"details":{"rate":"13.398000%","description":"16x Ulefone Armor X6 16GB Sim Rugged @ R2,399 each","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"2x CryoVacc units @ R126,500 each","section":"Business All Risks","sum_insured":253000,"premium_excl":625.166667,"premium_incl":718.94166705,"cover_status":"Approved","description":"2x CryoVacc units @ R126,500 each","branch":null,"external_risk_id":"59253","zoho_risk_id":"7351644000001857120","tracking_id":"c57832f6-2b16-48a1-9dc9-8a9c13c8b468","date_added":"2025-07-01","extensions":[{"id":"ext-59253-0","name":"Cover terms","sum_insured":253000,"premium_excl":8627.3,"premium_incl":9921.39,"details":{"rate":"3.410000%","description":"2x CryoVacc units @ R126,500 each","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Fridge Master","section":"Business All Risks","sum_insured":8500,"premium_excl":34.561123,"premium_incl":39.74529145,"cover_status":"Approved","description":"Fridge Master","branch":null,"external_risk_id":"59254","zoho_risk_id":"7351644000001857121","tracking_id":"d3d4ddad-05b8-46ce-af7c-3e55d9364927","date_added":"2025-07-01","extensions":[{"id":"ext-59254-0","name":"Cover terms","sum_insured":8500,"premium_excl":476.94,"premium_incl":548.48,"details":{"rate":"5.611100%","description":"Fridge Master","serial Number":"114X04","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Samsung Tablet","section":"Business All Risks","sum_insured":5000,"premium_excl":40.452899,"premium_incl":46.52083385,"cover_status":"Approved","description":"Samsung Tablet","branch":null,"external_risk_id":"59255","zoho_risk_id":"7351644000001857122","tracking_id":"3c5a47c7-3a06-4048-abe6-90855d01fbdd","date_added":"2025-07-01","extensions":[{"id":"ext-59255-0","name":"Cover terms","sum_insured":5000,"premium_excl":558.25,"premium_incl":641.99,"details":{"rate":"11.165000%","description":"Samsung Tablet","serial Number":"","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7002300 Coldfront CIC-4809 DR Zulu Onco Fridge","section":"Business All Risks","sum_insured":15587,"premium_excl":99.395362,"premium_incl":114.3046663,"cover_status":"Approved","description":"7002300 Coldfront CIC-4809 DR Zulu Onco Fridge","branch":null,"external_risk_id":"59256","zoho_risk_id":"7351644000001857123","tracking_id":"e36f5697-e230-4f74-afe4-32225e45f448","date_added":"2025-07-01","extensions":[{"id":"ext-59256-0","name":"Cover terms","sum_insured":15587,"premium_excl":1371.66,"premium_incl":1577.41,"details":{"rate":"8.800000%","description":"7002300 Coldfront CIC-4809 DR Zulu Onco Fridge","serial Number":"PNA54064","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7002400 UTrackIt SI207883 Design time R&M inst","section":"Business All Risks","sum_insured":85750,"premium_excl":546.811594,"premium_incl":628.8333331,"cover_status":"Approved","description":"7002400 UTrackIt SI207883 Design time R&M inst","branch":null,"external_risk_id":"59257","zoho_risk_id":"7351644000001857124","tracking_id":"f1d2bbef-3641-4e27-bc08-059e666f7534","date_added":"2025-07-01","extensions":[{"id":"ext-59257-0","name":"Cover terms","sum_insured":85750,"premium_excl":7546,"premium_incl":8677.9,"details":{"rate":"8.800000%","description":"7002400 UTrackIt SI207883 Design time R&M inst","serial Number":"PNA45552","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7002400 Pure Water Systems 116096 Grundfos Scala","section":"Business All Risks","sum_insured":14484,"premium_excl":92.361739,"premium_incl":106.21599985,"cover_status":"Approved","description":"7002400 Pure Water Systems 116096 Grundfos Scala","branch":null,"external_risk_id":"59258","zoho_risk_id":"7351644000003957003","tracking_id":"fd7196d8-cda3-4ddc-9f65-0352a02a832e","date_added":"2025-07-01","extensions":[{"id":"ext-59258-0","name":"Cover terms","sum_insured":14484,"premium_excl":1274.59,"premium_incl":1465.78,"details":{"rate":"8.800000%","description":"7002400 Pure Water Systems 116096 Grundfos Scala","serial Number":"PNA45595","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"7002400 Pure Water Systems 116096 Ozone generato","section":"Business All Risks","sum_insured":10775,"premium_excl":68.710145,"premium_incl":79.01666675,"cover_status":"Approved","description":"7002400 Pure Water Systems 116096 Ozone generato","branch":null,"external_risk_id":"59259","zoho_risk_id":"7351644000001857126","tracking_id":"d661cb4c-5cca-4067-8cd3-424306cfe892","date_added":"2025-07-01","extensions":[{"id":"ext-59259-0","name":"Cover terms","sum_insured":10775,"premium_excl":948.2,"premium_incl":1090.43,"details":{"rate":"8.800000%","description":"7002400 Pure Water Systems 116096 Ozone generato","serial Number":"PNA45595","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320307 My Frifge Online IN123159 Wifi logger ex","section":"Business All Risks","sum_insured":1400,"premium_excl":8.924188,"premium_incl":10.2628162,"cover_status":"Approved","description":"1320307 My Frifge Online IN123159 Wifi logger ex","branch":null,"external_risk_id":"59260","zoho_risk_id":"7351644000001857127","tracking_id":"acca8d23-652d-4ae2-899e-7f36b3ae0c85","date_added":"2025-07-01","extensions":[{"id":"ext-59260-0","name":"Cover terms","sum_insured":1400,"premium_excl":123.15,"premium_incl":141.62,"details":{"rate":"8.796700%","description":"1320307 My Frifge Online IN123159 Wifi logger ex","serial Number":"PNA45593","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"1320434 Pure Water Systems 116096 HC480 UV Balla","section":"Business All Risks","sum_insured":4678,"premium_excl":29.834453,"premium_incl":34.30962095,"cover_status":"Approved","description":"1320434 Pure Water Systems 116096 HC480 UV Balla","branch":null,"external_risk_id":"59261","zoho_risk_id":"7351644000001857128","tracking_id":"09aef55e-d69b-4389-8ae6-aeb179c007e1","date_added":"2025-07-01","extensions":[{"id":"ext-59261-0","name":"Cover terms","sum_insured":4678,"premium_excl":411.72,"premium_incl":473.48,"details":{"rate":"8.801100%","description":"1320434 Pure Water Systems 116096 HC480 UV Balla","serial Number":"PNA45595","category":"","article type":"","additional Information":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002","section":"Public Liability","sum_insured":20000000,"premium_excl":63.768116,"premium_incl":73.3333334,"cover_status":"Approved","description":"Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002","branch":null,"external_risk_id":"59262","zoho_risk_id":"7351644000001857129","tracking_id":"ee7db6cf-7796-430b-8bf2-1c8627ee1e18","date_added":"2025-07-01","extensions":[{"id":"ext-59262-0","name":"Cover terms","sum_insured":20000000,"premium_excl":880,"premium_incl":1012,"details":{"rate":"0.004400%","basis of Cover":"Claims Made","retroactive Cover Date (if applicable)":""}},{"id":"ext-59262-1","name":"Cover","sum_insured":20000000,"premium_excl":null,"premium_incl":null,"details":{"territorial limits":"Anywhere in the world but not in connection with (i) any business carried on by the Insured at or from premises outside or  (ii) any contract for the performance of work outside  the Republic of South Africa, Namibia, Botswana, Lesotho, Swaziland, Zimbabwe"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493","section":"Public Liability","sum_insured":20000000,"premium_excl":63.768116,"premium_incl":73.3333334,"cover_status":"Approved","description":"Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493","branch":null,"external_risk_id":"59263","zoho_risk_id":"7351644000001857130","tracking_id":"55902e74-0098-42c5-88af-b2b86444ea75","date_added":"2025-07-01","extensions":[{"id":"ext-59263-0","name":"Cover terms","sum_insured":20000000,"premium_excl":880,"premium_incl":1012,"details":{"rate":"0.004400%","basis of Cover":"Claims Made","retroactive Cover Date (if applicable)":""}},{"id":"ext-59263-1","name":"Cover","sum_insured":20000000,"premium_excl":null,"premium_incl":null,"details":{"territorial limits":"Anywhere in the world but not in connection with (i) any business carried on by the Insured at or from premises outside or  (ii) any contract for the performance of work outside  the Republic of South Africa, Namibia, Botswana, Lesotho, Swaziland, Zimbabwe"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"iMat Manufacturing IN125936","section":"Electronic Equipment","sum_insured":28680,"premium_excl":83.130435,"premium_incl":95.60000025,"cover_status":"Approved","description":"iMat Manufacturing IN125936","branch":null,"external_risk_id":"62527","zoho_risk_id":"7351644000001857131","tracking_id":"2c0351d5-d346-45c5-8cf0-0bc877e2a057","date_added":"2025-10-16","extensions":[{"id":"ext-62527-0","name":"Subsection A - Material Damage","sum_insured":28680,"premium_excl":1147.2,"premium_incl":1319.28,"details":{"description":"iMat Manufacturing IN125936","rate":"4.000000%","equipment Type":"","make and Model":"iMat Manufacturing IN125936","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493 Brutes Air Sol IN133118 x2 Delcos Pro","section":"Fire","sum_insured":102294,"premium_excl":15.566478,"premium_incl":17.9014497,"cover_status":"Approved","description":"Parow Industria, 6 Koets Street, Ravensmead, Belhar, Western Cape, 7493 Brutes Air Sol IN133118 x2 Delcos Pro","branch":null,"external_risk_id":"62529","zoho_risk_id":"7351644000001857132","tracking_id":"bb2d8614-7d9e-4586-8892-fa018409e716","date_added":"2025-10-16","extensions":[{"id":"ext-62529-0","name":"Cover terms","sum_insured":102294,"premium_excl":214.82,"premium_incl":247.04,"details":{"rate":"0.210000%","description":"Brutes Air Sol IN133118 x2 Delcos Pro","number of months":"","security":"","occupied As":"Standard","stock and materials in trade":"","roof Construction":""}},{"id":"ext-62529-1","name":"Building","sum_insured":102294,"premium_excl":null,"premium_incl":null,"details":{"building Type":"Commercial"}},{"id":"ext-62529-2","name":"Insured perils","sum_insured":102294,"premium_excl":null,"premium_incl":null,"details":{"earthquake":"Yes","special perils":"Yes"}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129799 x1 Mercer desktop PC","section":"Electronic Equipment","sum_insured":9392,"premium_excl":27.223188,"premium_incl":31.3066662,"cover_status":"Approved","description":"Netlogix IN129799 x1 Mercer desktop PC","branch":null,"external_risk_id":"62530","zoho_risk_id":"7351644000001857133","tracking_id":"8f38fcab-dcd3-4568-9423-c0e8d6a1a9d6","date_added":"2025-10-16","extensions":[{"id":"ext-62530-0","name":"Subsection A - Material Damage","sum_insured":9392,"premium_excl":375.68,"premium_incl":432.03,"details":{"description":"Netlogix IN129799 x1 Mercer desktop PC","rate":"4.000000%","equipment Type":"","make and Model":"7012300 Netlogix IN129799 x1 Mercer desktop PC","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129799 x1 Mercer desktop PC","section":"Electronic Equipment","sum_insured":7102,"premium_excl":20.585507,"premium_incl":23.67333305,"cover_status":"Approved","description":"Netlogix IN129799 x1 Mercer desktop PC","branch":null,"external_risk_id":"62531","zoho_risk_id":"7351644000001857134","tracking_id":"cb05aadc-3501-48fb-9df5-aa6fc5608fd9","date_added":"2025-10-16","extensions":[{"id":"ext-62531-0","name":"Subsection A - Material Damage","sum_insured":7102,"premium_excl":284.08,"premium_incl":326.69,"details":{"description":"Netlogix IN129799 x1 Mercer desktop PC","rate":"4.000000%","equipment Type":"","make and Model":"7012300 Netlogix IN129799 x1 Mercer desktop PC","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN128855 x10 Mercer Monitors","section":"Electronic Equipment","sum_insured":11754,"premium_excl":34.069565,"premium_incl":39.17999975,"cover_status":"Approved","description":"Netlogix IN128855 x10 Mercer Monitors","branch":null,"external_risk_id":"62533","zoho_risk_id":"7351644000001857135","tracking_id":"7c4b5e92-5fe3-4f48-b8bf-b172a7bde4c0","date_added":"2025-10-16","extensions":[{"id":"ext-62533-0","name":"Subsection A - Material Damage","sum_insured":11754,"premium_excl":470.16,"premium_incl":540.68,"details":{"description":"Netlogix IN128855 x10 Mercer Monitors","rate":"4.000000%","equipment Type":"","make and Model":"1320311 Netlogix IN128855 x10 Mercer Monitors","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Strategix SIT-INV112722 x82 Veeam backup","section":"Electronic Equipment","sum_insured":15416,"premium_excl":44.684058,"premium_incl":51.3866667,"cover_status":"Approved","description":"Strategix SIT-INV112722 x82 Veeam backup","branch":null,"external_risk_id":"62534","zoho_risk_id":"7351644000001857136","tracking_id":"3b843a4a-2d68-4d4e-9318-40850ce22ffc","date_added":"2025-10-16","extensions":[{"id":"ext-62534-0","name":"Subsection A - Material Damage","sum_insured":15416,"premium_excl":616.64,"premium_incl":709.14,"details":{"description":"Strategix SIT-INV112722 x82 Veeam backup","rate":"4.000000%","equipment Type":"","make and Model":"Strategix SIT-INV112722 x82 Veeam backup","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Strategix SIT-INV112722 x18 Fileshare li","section":"Electronic Equipment","sum_insured":2700,"premium_excl":7.826087,"premium_incl":9.00000005,"cover_status":"Approved","description":"Strategix SIT-INV112722 x18 Fileshare li","branch":null,"external_risk_id":"62535","zoho_risk_id":"7351644000001857137","tracking_id":"f3fec1fe-7793-4837-a901-6b44ae9be355","date_added":"2025-10-16","extensions":[{"id":"ext-62535-0","name":"Subsection A - Material Damage","sum_insured":2700,"premium_excl":108,"premium_incl":124.2,"details":{"description":"Strategix SIT-INV112722 x18 Fileshare li","rate":"4.000000%","equipment Type":"","make and Model":"Strategix SIT-INV112722 x18 Fileshare li","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129646 x5 Mercer 19.5  Monito","section":"Electronic Equipment","sum_insured":5822,"premium_excl":16.875362,"premium_incl":19.4066663,"cover_status":"Approved","description":"Netlogix IN129646 x5 Mercer 19.5  Monito","branch":null,"external_risk_id":"62536","zoho_risk_id":"7351644000001857138","tracking_id":"d2b1e73b-bf12-447a-a738-7437df61243e","date_added":"2025-10-16","extensions":[{"id":"ext-62536-0","name":"Subsection A - Material Damage","sum_insured":5822,"premium_excl":232.88,"premium_incl":267.81,"details":{"description":"Netlogix IN129646 x5 Mercer 19.5  Monito","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129646 x5 Mercer 19.5  Monito","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129648 x4 Mercer 19.5'' Monito","section":"Electronic Equipment","sum_insured":4658,"premium_excl":13.501449,"premium_incl":15.52666635,"cover_status":"Approved","description":"Netlogix IN129648 x4 Mercer 19.5'' Monito","branch":null,"external_risk_id":"62537","zoho_risk_id":"7351644000001857139","tracking_id":"fa19f574-b922-476f-a87d-c3a576698eb6","date_added":"2025-10-16","extensions":[{"id":"ext-62537-0","name":"Subsection A - Material Damage","sum_insured":4658,"premium_excl":186.32,"premium_incl":214.27,"details":{"description":"Netlogix IN129648 x4 Mercer 19.5'' Monito","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129648 x4 Mercer 19.5'' Monito","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129794 x1 SSD Drive/Adaptor/U","section":"Electronic Equipment","sum_insured":2398.04,"premium_excl":6.950841,"premium_incl":7.99346715,"cover_status":"Approved","description":"Netlogix IN129794 x1 SSD Drive/Adaptor/U","branch":null,"external_risk_id":"62538","zoho_risk_id":"7351644000001857140","tracking_id":"1c5b0ac1-23d7-4b57-a5a9-fd9d7beae08b","date_added":"2025-10-16","extensions":[{"id":"ext-62538-0","name":"Subsection A - Material Damage","sum_insured":2398.04,"premium_excl":95.92,"premium_incl":110.31,"details":{"description":"Netlogix IN129794 x1 SSD Drive/Adaptor/U","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129794 x1 SSD Drive/Adaptor/U","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129693 x2 Hand scanners","section":"Electronic Equipment","sum_insured":4743.32,"premium_excl":13.748754,"premium_incl":15.8110671,"cover_status":"Approved","description":"Netlogix IN129693 x2 Hand scanners","branch":null,"external_risk_id":"62539","zoho_risk_id":"7351644000001857141","tracking_id":"1693dfc6-b829-4cae-a7c1-44d60a44ad25","date_added":"2025-10-16","extensions":[{"id":"ext-62539-0","name":"Subsection A - Material Damage","sum_insured":4743.32,"premium_excl":189.73,"premium_incl":218.19,"details":{"description":"Netlogix IN129693 x2 Hand scanners","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129693 x2 Hand scanners","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129694 x1 Zebra Thermal print","section":"Electronic Equipment","sum_insured":6016.91,"premium_excl":17.440319,"premium_incl":20.05636685,"cover_status":"Approved","description":"Netlogix IN129694 x1 Zebra Thermal print","branch":null,"external_risk_id":"62540","zoho_risk_id":"7351644000001857142","tracking_id":"04957cc9-432a-4926-b01c-5feef9900f2d","date_added":"2025-10-16","extensions":[{"id":"ext-62540-0","name":"Subsection A - Material Damage","sum_insured":6016.91,"premium_excl":240.68,"premium_incl":276.78,"details":{"description":"Netlogix IN129694 x1 Zebra Thermal print","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129694 x1 Zebra Thermal print","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129695 x5 Barcode scanners","section":"Electronic Equipment","sum_insured":6041.75,"premium_excl":17.512319,"premium_incl":20.13916685,"cover_status":"Approved","description":"Netlogix IN129695 x5 Barcode scanners","branch":null,"external_risk_id":"62541","zoho_risk_id":"7351644000001857143","tracking_id":"7bf2c7ff-bca8-414c-8a75-9620746f56d3","date_added":"2025-10-16","extensions":[{"id":"ext-62541-0","name":"Subsection A - Material Damage","sum_insured":6041.75,"premium_excl":241.67,"premium_incl":277.92,"details":{"description":"Netlogix IN129695 x5 Barcode scanners","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129695 x5 Barcode scanners","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129715 x10 Keyboard combo''s","section":"Electronic Equipment","sum_insured":1955.3,"premium_excl":5.667536,"premium_incl":6.5176664,"cover_status":"Approved","description":"Netlogix IN129715 x10 Keyboard combo''s","branch":null,"external_risk_id":"62542","zoho_risk_id":"7351644000001857144","tracking_id":"c42f6d91-7d3c-47b0-95d4-87f860569323","date_added":"2025-10-16","extensions":[{"id":"ext-62542-0","name":"Subsection A - Material Damage","sum_insured":1955.3,"premium_excl":78.21,"premium_incl":89.94,"details":{"description":"Netlogix IN129715 x10 Keyboard combo''s","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129715 x10 Keyboard combo''s","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129716 x5 SSD drives","section":"Electronic Equipment","sum_insured":4476.4,"premium_excl":12.975072,"premium_incl":14.9213328,"cover_status":"Approved","description":"Netlogix IN129716 x5 SSD drives","branch":null,"external_risk_id":"62543","zoho_risk_id":"7351644000001857145","tracking_id":"61a35109-8145-4bd3-9fcb-9e21067d864d","date_added":"2025-10-16","extensions":[{"id":"ext-62543-0","name":"Subsection A - Material Damage","sum_insured":4476.4,"premium_excl":179.06,"premium_incl":205.92,"details":{"description":"Netlogix IN129716 x5 SSD drives","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129716 x5 SSD drives","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"Netlogix IN129661 x2 HPE 600GB SAS HDD","section":"Electronic Equipment","sum_insured":8525.78,"premium_excl":24.712406,"premium_incl":28.4192669,"cover_status":"Approved","description":"Netlogix IN129661 x2 HPE 600GB SAS HDD","branch":null,"external_risk_id":"62544","zoho_risk_id":"7351644000001857146","tracking_id":"d2458802-14ff-4e3b-9c49-d1157f0a0d3e","date_added":"2025-10-16","extensions":[{"id":"ext-62544-0","name":"Subsection A - Material Damage","sum_insured":8525.78,"premium_excl":341.03,"premium_incl":392.18,"details":{"description":"Netlogix IN129661 x2 HPE 600GB SAS HDD","rate":"4.000000%","equipment Type":"","make and Model":"Netlogix IN129661 x2 HPE 600GB SAS HDD","serial number":""}}],"attachments":[]},{"risk_item_id":null,"risk_item_name":"P3155DN Printers x 32 (R19000.00 each)","section":"Electronic Equipment","sum_insured":608000,"premium_excl":1531.455072,"premium_incl":1761.1733328,"cover_status":"Approved","description":"P3155DN Printers x 32 (R19000.00 each)","branch":null,"external_risk_id":"64687","zoho_risk_id":"7351644000001857147","tracking_id":"a17a41ba-e0c7-4821-bda5-a891d7f8db88","date_added":"2026-02-26","extensions":[{"id":"ext-64687-0","name":"Subsection A - Material Damage","sum_insured":608000,"premium_excl":21134.08,"premium_incl":24304.19,"details":{"description":"P3155DN Printers x 32 (R19000.00 each)","rate":"3.476000%","equipment Type":"Printer","make and Model":"","serial number":"Refer to endorsement"}}],"attachments":[]}]'::jsonb) AS item
    LEFT JOIN medipost_cov_link l ON l.external_risk_id = item->>'external_risk_id'
    LEFT JOIN public.portal_risk_items pri
      ON pri.account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
     AND pri.zoho_risk_id = l.zoho_risk_id
  ),
  updated_at = now()
WHERE p.id = 'c2222222-2222-4222-8222-222222222248';
COMMIT;
