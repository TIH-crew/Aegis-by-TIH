WITH m(portal_id, zoho_id, item_value) AS (VALUES
('e24f0a54-300c-4431-8c1a-b806af973f3b'::uuid, '7351644000003997001'::text, 95000::numeric),
('129bb938-4c89-4bc5-b5c7-3e3752667c6c'::uuid, '7351644000003997002'::text, 118650::numeric),
('87057b2d-9caa-4b1b-adf1-c2b624bb4b74'::uuid, '7351644000003997003'::text, 127650::numeric),
('952f3294-27a7-45fb-9e29-244c41ac6797'::uuid, '7351644000003997004'::text, 118800::numeric),
('d7a5e62a-dd15-4c39-b992-2e499a5657d6'::uuid, '7351644000003997005'::text, 117800::numeric),
('9b710a9e-1f84-4aca-85eb-2a07f824dc2c'::uuid, '7351644000003997006'::text, 126100::numeric),
('fa241cda-26b4-4807-adab-720958d2489b'::uuid, '7351644000003997007'::text, 115800::numeric),
('f9efe657-997c-4043-a1d6-5bd88118d8e8'::uuid, '7351644000003997008'::text, 126450::numeric),
('83065c6d-3d30-4ddf-a761-2b58cceee50c'::uuid, '7351644000003997009'::text, 156550::numeric),
('e00c85e3-a4da-45d1-89d0-ec472ea3e8bc'::uuid, '7351644000003997010'::text, 174800::numeric),
('0cb62248-64c3-4653-96fc-9c5db396c8d2'::uuid, '7351644000003997011'::text, 168650::numeric),
('00d21ef5-643e-4552-84a2-77916bec662e'::uuid, '7351644000003997012'::text, 165650::numeric),
('b43b8333-48e9-4bea-90e9-29f856e5a8f6'::uuid, '7351644000003997013'::text, 195650::numeric),
('131fa5b6-c2ba-4beb-884e-ec5794d99d20'::uuid, '7351644000003997014'::text, 173150::numeric),
('e10c3ebd-fb5b-40b3-bdf9-6b4212e45b87'::uuid, '7351644000003997015'::text, 194850::numeric),
('6435090b-dc87-4634-bbd0-847dccb1bf20'::uuid, '7351644000003997016'::text, 174850::numeric),
('4e9359c2-0ee9-4d98-85de-7f91ecff6bc8'::uuid, '7351644000003997017'::text, 186850::numeric),
('faa41630-2937-463d-b900-acb99853d2b6'::uuid, '7351644000003997018'::text, 182000::numeric),
('d7db5367-1d85-433d-a8b7-75b0866facc5'::uuid, '7351644000003997019'::text, 203820::numeric),
('201868bc-7df3-47e7-b5b7-6d46229ee8fd'::uuid, '7351644000003997020'::text, 175850::numeric),
('3278bd88-a9a4-44da-9921-1d65b36770a0'::uuid, '7351644000003997021'::text, 184150::numeric),
('1b48b2ae-0f9f-44e1-94c2-b4afebe4c4b3'::uuid, '7351644000003997022'::text, 175850::numeric),
('83caf961-faa9-4d23-be37-13dcfa419e4f'::uuid, '7351644000003997023'::text, 198500::numeric),
('b9664b5c-9628-4fa1-9df0-a7ac6adf5868'::uuid, '7351644000003997024'::text, 198500::numeric),
('64a10e4a-34ba-46ba-8a38-1dfd8eaa9656'::uuid, '7351644000003997025'::text, 209500::numeric)
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