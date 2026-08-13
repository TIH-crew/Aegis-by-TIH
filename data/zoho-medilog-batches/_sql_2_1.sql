WITH m(portal_id, zoho_id, item_value) AS (VALUES
('28164131-fbe1-447b-b235-98b1fa806efa'::uuid, '7351644000003996001'::text, 14369::numeric),
('ad8c996b-4b35-4a31-a721-66d2e95f9f31'::uuid, '7351644000003996002'::text, 14369::numeric),
('b369cb9c-ad3e-482d-a335-1ed39c8c4a93'::uuid, '7351644000003996003'::text, 14369::numeric),
('60daceb4-ea70-4ca1-8290-33aaf1d1859a'::uuid, '7351644000003996004'::text, 14369::numeric),
('a8fa409c-31c1-4a1a-9a76-e309add3feb2'::uuid, '7351644000003996005'::text, 14369::numeric),
('6bae9787-b05d-412c-9b32-d923400f57b9'::uuid, '7351644000003996006'::text, 14417::numeric),
('5c90763b-2e1e-4b69-95bd-2112d473e56e'::uuid, '7351644000003996007'::text, 14164::numeric),
('e7278763-7e05-4287-95c0-e1e6dd5d39d0'::uuid, '7351644000003996008'::text, 14151::numeric),
('e4d3565d-37dd-4df1-9a24-e20b752e9bb2'::uuid, '7351644000003996009'::text, 9347::numeric),
('47b4a37a-be63-4c7a-b076-cd1f6cb43033'::uuid, '7351644000003996010'::text, 6291::numeric),
('8fd54771-7eb6-4bd4-b05c-02e3802ccd0c'::uuid, '7351644000003996011'::text, 93046.8::numeric),
('dbc8dc97-e094-4747-a841-e5c3a261a83d'::uuid, '7351644000003996012'::text, 106000::numeric),
('99010208-f7af-4dc6-8adb-7165be2b297d'::uuid, '7351644000003996013'::text, 118844.81::numeric),
('546bdc42-2707-447e-ae19-210b8d616251'::uuid, '7351644000003996014'::text, 4930::numeric),
('974e1a3b-1ada-44ec-bd2e-6c7c7dae4ccc'::uuid, '7351644000003996015'::text, 5563::numeric),
('358472c4-907f-427f-b322-78b84cffb65a'::uuid, '7351644000003996016'::text, 5563::numeric),
('6a4fa301-24ab-4c8d-b53f-5c86acc50fdc'::uuid, '7351644000003996017'::text, 4450::numeric),
('0c580bec-9960-46c9-a803-85a774395894'::uuid, '7351644000003996018'::text, 4474::numeric),
('d98b1280-c5e5-4093-8d6b-55bec38d82aa'::uuid, '7351644000003996019'::text, 5000::numeric),
('28ee1a33-557d-4c01-adc8-011d556ac09e'::uuid, '7351644000003996020'::text, 90440::numeric),
('86e9ac30-fcda-4595-bfcb-fa948c0e3f9d'::uuid, '7351644000003996021'::text, 185969::numeric),
('132b46c2-631e-4db9-89aa-ffd1c60f6456'::uuid, '7351644000003996022'::text, 115765.86::numeric),
('e2d14945-b7b1-4dd5-854c-f5132dea620b'::uuid, '7351644000003996023'::text, 76129.2::numeric),
('0e5e27cc-7bee-43c6-919d-f0b9405ad309'::uuid, '7351644000003996024'::text, 107000::numeric),
('fcd37982-1d4e-4a22-bb9c-a3da48e0a7a6'::uuid, '7351644000003996025'::text, 39130::numeric)
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