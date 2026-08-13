WITH m(portal_id, zoho_id, item_value) AS (VALUES
('6ae7cff1-ee8c-41ce-9eaa-8bc8fffafb54'::uuid, '7351644000003999001'::text, 161000::numeric),
('cf6ff736-6b11-4c19-b7bf-cbf0f222c62a'::uuid, '7351644000003999002'::text, 262100::numeric),
('60f04f3e-367b-48b4-bdde-4293fa5ed68e'::uuid, '7351644000003999003'::text, 126000::numeric),
('d6da7037-7678-4815-87f4-4b24a747fcae'::uuid, '7351644000003999004'::text, 126000::numeric),
('25f55154-e982-4179-8e1b-db7df65cb796'::uuid, '7351644000003999005'::text, 126000::numeric),
('00064737-0256-4cb6-baff-9fb1127ce693'::uuid, '7351644000003999006'::text, 132550::numeric),
('db408d96-3ab5-449a-b3c4-fcdb32daec47'::uuid, '7351644000003999007'::text, 434035::numeric),
('474d4f18-4785-46a9-82f2-5572a55fa4bb'::uuid, '7351644000003999008'::text, 150250::numeric),
('0cd93f53-cd59-4f35-a39b-7c16ac0c2333'::uuid, '7351644000003999009'::text, 15000::numeric),
('ef7288a5-1383-4600-be7c-eab5ffb96539'::uuid, '7351644000003999010'::text, 20200::numeric),
('723456d7-b911-4dcd-9ca5-0a1261b8327d'::uuid, '7351644000003999011'::text, 90440::numeric),
('446ac395-11c7-4ce3-88c2-92ed1b2aa2a2'::uuid, '7351644000003999012'::text, 114819::numeric),
('1f69ce77-ac21-44ca-a845-c6a4ec86555d'::uuid, '7351644000003999013'::text, 180882.66::numeric),
('79c7a595-8247-4c2f-a853-aeece9f2880c'::uuid, '7351644000004000001'::text, 158271.33::numeric),
('836c6bce-e1eb-4db7-9035-eaef0c9014db'::uuid, '7351644000004000002'::text, 271700::numeric),
('f133842a-6cf4-4c3c-bd20-85fe6d34ea11'::uuid, '7351644000004000003'::text, 99485.33::numeric),
('21702e47-df7b-4200-8f41-eb5c8a2ede18'::uuid, '7351644000004000004'::text, 248993::numeric),
('c697504b-072a-4f7c-8119-bfb60c1f55e6'::uuid, '7351644000004000005'::text, 163571.38::numeric),
('c833219b-cbd5-462c-93ac-304262dc0e06'::uuid, '7351644000004000006'::text, 33350::numeric),
('701c1e65-731d-484f-bdfe-27d304eb2ac3'::uuid, '7351644000004000007'::text, 111600::numeric),
('56649e3c-7a89-43e7-919c-cfdf3b66f212'::uuid, '7351644000004000008'::text, 153650::numeric),
('d54cf445-2a5a-43fa-9dee-833362855ec7'::uuid, '7351644000004000009'::text, 168000::numeric),
('9a61afb3-150b-4dbb-990c-0a8b7230e243'::uuid, '7351644000004000010'::text, 106000::numeric),
('d103772c-0f5f-4d16-a91c-b10747d36565'::uuid, '7351644000004000011'::text, 88150::numeric),
('dff4425e-9e56-49c0-84b9-dbc860e6c7ba'::uuid, '7351644000004000012'::text, 87000::numeric)
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