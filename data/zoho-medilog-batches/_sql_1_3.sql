WITH m(portal_id, zoho_id, item_value) AS (VALUES
('7a2e38fb-3f41-4064-9b56-4ef2cf9128e4'::uuid, '7351644000003995001'::text, 435525::numeric),
('34ccdea6-890c-40e6-8e71-995c8fd3f301'::uuid, '7351644000003995002'::text, 435525::numeric),
('4391ff2c-1f24-476b-9335-da0eae293d45'::uuid, '7351644000003995003'::text, 192100::numeric),
('f4570132-6868-4d4b-8df2-c015847009e8'::uuid, '7351644000003995004'::text, 349385::numeric),
('dc6f4876-847b-4e8f-97c7-c04269e43891'::uuid, '7351644000003995005'::text, 496185::numeric),
('72679955-2636-41b2-b29d-aa3632737184'::uuid, '7351644000003995006'::text, 379550::numeric),
('5b6cfc61-48f3-451b-a3e0-19221f1b442b'::uuid, '7351644000003995007'::text, 188600::numeric),
('89a9c75c-1a77-486a-979d-b2df4f9cebe9'::uuid, '7351644000003995008'::text, 207200::numeric),
('90bd5978-fc25-45aa-8502-eb6eb6dc4bed'::uuid, '7351644000003995009'::text, 216700::numeric),
('48649613-73c3-4cab-b181-de242e87e406'::uuid, '7351644000003995010'::text, 211200::numeric),
('83f74720-379c-4e21-b6fb-d3c9e5ddaa5f'::uuid, '7351644000003995011'::text, 225525::numeric),
('54fef482-b087-4699-ae27-1f00fcbeb00a'::uuid, '7351644000003995012'::text, 211200::numeric),
('396e195b-0018-4a2a-b428-3ce4ec8394f2'::uuid, '7351644000003995013'::text, 211200::numeric),
('e9040352-f1f8-4dde-9810-db8b91b33440'::uuid, '7351644000003995014'::text, 249035::numeric),
('221621cc-801a-4079-8e64-d738323ee92d'::uuid, '7351644000003995015'::text, 204535::numeric),
('0a400356-bb12-4db8-b1ca-5dc69f3afc9f'::uuid, '7351644000003995016'::text, 135500::numeric),
('21976615-3905-4ba6-baa3-12443f15feff'::uuid, '7351644000003995017'::text, 289060::numeric),
('17e35a32-d290-44a4-adb8-ceb0fe0a14bb'::uuid, '7351644000003995018'::text, 289060::numeric),
('c2dea9bd-0e4c-4491-a0c4-7f8062316a75'::uuid, '7351644000003995019'::text, 157800::numeric),
('4e6d37a6-b7b4-472d-b806-2c382a67d821'::uuid, '7351644000003995020'::text, 178300::numeric),
('3a9b3274-0bda-481c-9e48-22d99f6e46fd'::uuid, '7351644000003995021'::text, 317525::numeric),
('b4b54c6f-bf6a-4c60-ad14-8743dec2430e'::uuid, '7351644000003995022'::text, 317525::numeric),
('844936a7-3e98-4260-bd51-193b9f0a73aa'::uuid, '7351644000003995023'::text, 331050::numeric),
('28ef1345-774b-4ef2-8fc7-57dbc768b809'::uuid, '7351644000003995024'::text, 331050::numeric),
('878edfff-3ba7-48d4-aaa0-0a97b43797ef'::uuid, '7351644000003995025'::text, 410425::numeric)
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