WITH m(portal_id, zoho_id, item_value) AS (VALUES
('37d989fa-1140-4fbd-9a8e-1b194d5fa9f0'::uuid, '7351644000003990104'::text, 94600::numeric),
('4252ebe9-bc79-496f-9dae-79a4f8cb36db'::uuid, '7351644000003990105'::text, 95750::numeric),
('5864c6c1-9673-44ee-bfa6-a2a616a8de96'::uuid, '7351644000003990106'::text, 204000::numeric),
('9fb23dde-e838-4bff-a9dc-8f3d62e6063f'::uuid, '7351644000003990107'::text, 95600::numeric),
('f14a4d98-c6cd-40ce-955f-36ab0dc7ea6d'::uuid, '7351644000003990108'::text, 114750::numeric),
('da5bc64c-29ae-4aa6-809c-75348bc2dc4b'::uuid, '7351644000003990109'::text, 109300::numeric),
('065855f4-a2b3-4c82-8b33-cf9d98dc1b4f'::uuid, '7351644000003990110'::text, 111600::numeric),
('42f5dd5f-39b5-44aa-a5e2-642efed93b50'::uuid, '7351644000003990111'::text, 111600::numeric),
('8bece074-0d0c-4d8c-a3fd-2b2a4376762f'::uuid, '7351644000003990112'::text, 126000::numeric),
('1b2d3ec9-a255-4ee5-8e6f-0003478ee0ad'::uuid, '7351644000003990113'::text, 111600::numeric),
('f95d5af2-fcef-4bfc-8df1-3121a516cced'::uuid, '7351644000003990114'::text, 111600::numeric),
('e1b9df5d-667e-4bd1-9605-cf37e6df87d6'::uuid, '7351644000003990126'::text, 16000::numeric),
('76acb9ec-f758-41af-92de-e5d14a5485a9'::uuid, '7351644000003990127'::text, 31100::numeric),
('5441bad7-6333-405e-9d4b-64d397a9683e'::uuid, '7351644000003990128'::text, 31100::numeric),
('ef04c72f-f3c1-4933-8bd6-edf15166b4bf'::uuid, '7351644000003990129'::text, 31100::numeric),
('4b4eef4d-d2f2-414b-91a6-649e8207f3d3'::uuid, '7351644000003990130'::text, 31100::numeric),
('10570082-33bd-4b2e-b340-ef926260f03b'::uuid, '7351644000003990131'::text, 31100::numeric),
('a54e1e22-b687-46dd-8d60-d5efe29ef04e'::uuid, '7351644000003990132'::text, 31100::numeric),
('d5922366-44ce-4d7d-b4a0-e298f93708bc'::uuid, '7351644000003990133'::text, 31100::numeric),
('5926e502-713d-49b8-adc5-af34aa5de6f8'::uuid, '7351644000003990134'::text, 31100::numeric),
('60f581a4-b934-433e-bb47-a4a086a6a7ae'::uuid, '7351644000003990135'::text, 31100::numeric),
('28dd4ae7-20e5-41ef-aa02-07bdf9d5adb5'::uuid, '7351644000003990136'::text, 4596::numeric)
)
UPDATE portal_risk_items pri
SET zoho_risk_id = m.zoho_id,
    zoho_fields = COALESCE(pri.zoho_fields, '{}'::jsonb)
      || jsonb_build_object(
           'Item_Value', to_jsonb(m.item_value),
           'Policy_Number', to_jsonb('B00000050'::text)
         )
FROM m
WHERE pri.id = m.portal_id
RETURNING pri.id, pri.zoho_risk_id;