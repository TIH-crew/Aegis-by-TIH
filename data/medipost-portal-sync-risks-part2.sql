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