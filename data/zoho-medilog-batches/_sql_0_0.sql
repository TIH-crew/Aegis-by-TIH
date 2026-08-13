WITH m(portal_id, zoho_id, item_value) AS (VALUES
('66f2a92f-6526-4743-8719-44bc4f19eba8'::uuid, '7351644000003992001'::text, 43940::numeric),
('4919e113-7d15-49fe-82fd-ab09e4e57ec5'::uuid, '7351644000003992002'::text, 7980::numeric),
('ce2b5dfa-b377-4ba9-b9f5-47b0e4f669e7'::uuid, '7351644000003992003'::text, 7980::numeric),
('9165857b-7192-4d80-b728-9c8c2d92e2f1'::uuid, '7351644000003992004'::text, 56832::numeric),
('5e7e95b0-3e46-4f82-9c43-a36ba5a8fbb7'::uuid, '7351644000003992005'::text, 65732::numeric),
('e5db909b-a325-4f74-851c-e70d3f5bfa57'::uuid, '7351644000003992006'::text, 12312::numeric),
('82198247-8593-4bfc-ab49-add1237bfef4'::uuid, '7351644000003992007'::text, 1288::numeric),
('b55e88be-6f2e-4ced-a079-8b66200c67a2'::uuid, '7351644000003992008'::text, 10840::numeric),
('c335f436-f75a-48b8-958a-8aa105021eae'::uuid, '7351644000003992009'::text, 24966::numeric),
('66e341fa-e22a-4932-9eb1-254530db5c52'::uuid, '7351644000003992010'::text, 24966::numeric),
('fe6af6ba-cc34-4c88-b70c-86c4d3888d5d'::uuid, '7351644000003992011'::text, 24966::numeric),
('9f56763a-3f8a-404c-9d1f-afcf53bb414b'::uuid, '7351644000003992012'::text, 30000::numeric),
('862bec17-6067-440f-a19e-f20f2aeb6cc0'::uuid, '7351644000003992013'::text, 30000::numeric),
('fb987eb7-e3a7-4d51-8298-59cbc445d52a'::uuid, '7351644000003992014'::text, 12000::numeric),
('c31c7a4f-e14c-472c-88c7-cd1bdc999f14'::uuid, '7351644000003992015'::text, 12658::numeric),
('d9fee030-6f52-4830-bfb0-39d82fa83a7b'::uuid, '7351644000003992016'::text, 10784::numeric),
('ae64059e-555d-40de-8df4-27c910e0e2a1'::uuid, '7351644000003992017'::text, 30000::numeric),
('e2c7d038-01ca-45bf-b871-34595d672624'::uuid, '7351644000003992018'::text, 12000::numeric),
('0be8359c-c43a-44db-88c8-bbd849f196bd'::uuid, '7351644000003992019'::text, 3000::numeric),
('e7025251-4853-4a95-9965-287234afb110'::uuid, '7351644000003992020'::text, 4800::numeric),
('0fc0ac78-a969-4be1-a46e-b92de7101a50'::uuid, '7351644000003992021'::text, 4800::numeric),
('28692d6d-e8f4-490b-a584-a86fdf18d4ff'::uuid, '7351644000003992022'::text, 23879::numeric),
('77e608b9-2dda-4aeb-991e-38e4603f521a'::uuid, '7351644000003992023'::text, 17431::numeric),
('fc7c7367-37bb-4f39-b5f3-b0e4f2b6bbf9'::uuid, '7351644000003992024'::text, 5400::numeric),
('965f4381-6af5-49ab-bf3b-4d0590ac6ab4'::uuid, '7351644000003992025'::text, 4500::numeric)
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