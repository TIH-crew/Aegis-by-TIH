WITH m(portal_id, zoho_id, item_value) AS (VALUES
('6220d4af-f8f1-4d3d-a13c-275d37856ae4'::uuid, '7351644000003994001'::text, 316785::numeric),
('589aee4d-5006-40a5-bbc4-f0750921273d'::uuid, '7351644000003994002'::text, 146000::numeric),
('3bb3e238-0039-4cc4-bf40-c92fa430c18b'::uuid, '7351644000003994003'::text, 212000::numeric),
('63dfdf55-237e-45b5-9071-deec5243c6b0'::uuid, '7351644000003994004'::text, 925202::numeric),
('037bc67d-8902-4dce-8586-df17c644253d'::uuid, '7351644000003994005'::text, 6000::numeric),
('8a3ec81e-18ce-4327-a4ba-3537c162b36f'::uuid, '7351644000003994006'::text, 6000::numeric),
('8b1b206f-c310-4c33-acf8-00d030ccc480'::uuid, '7351644000003994007'::text, 2853::numeric),
('dad3e5ef-d5f0-462c-86b2-feee66bb1585'::uuid, '7351644000003994008'::text, 12477::numeric),
('3516dc8f-6ece-4b72-a216-baccf572d6bc'::uuid, '7351644000003994009'::text, 6086::numeric),
('1e78db84-bc96-4cb8-9f2d-38108f2085d4'::uuid, '7351644000003994010'::text, 6086::numeric),
('af336763-17db-4fe1-9d83-205efdb0184e'::uuid, '7351644000003994011'::text, 6086::numeric),
('d66952bd-e2f6-45af-8250-f16bc64203dc'::uuid, '7351644000003994012'::text, 6086::numeric),
('bff0856a-70a7-4e22-b485-c589b5daa662'::uuid, '7351644000003994013'::text, 6086::numeric),
('a4f541cb-7752-48f2-a5ba-9ce0a0c8c0b3'::uuid, '7351644000003994014'::text, 8521::numeric),
('97623cea-8c47-414a-be2a-2b17b41b7707'::uuid, '7351644000003994015'::text, 8173::numeric),
('35f15df2-8e3d-48dd-8b85-7fcbabb76476'::uuid, '7351644000003994016'::text, 10434::numeric),
('e7c02182-2b80-4baf-b4f5-680b8c91848a'::uuid, '7351644000003994017'::text, 3000::numeric),
('2560ac03-dff0-42b4-b01c-434bec1bb484'::uuid, '7351644000003994018'::text, 3000::numeric),
('2c1633d0-1e25-4dfb-86de-5c26b5711ac8'::uuid, '7351644000003994019'::text, 3000::numeric),
('4ce70ff0-da9f-4467-ada7-15ea5a4d067d'::uuid, '7351644000003994020'::text, 3000::numeric),
('c37671dd-322a-4b42-a2c7-6d8a26407984'::uuid, '7351644000003994021'::text, 2200::numeric),
('3cc45860-1567-492d-8956-9cb9c82626fb'::uuid, '7351644000003994022'::text, 8173::numeric),
('eeec0500-5b36-4490-9fff-f54d18032fd4'::uuid, '7351644000003994023'::text, 141400::numeric),
('b69044ba-0f01-4e0a-b2db-368432372502'::uuid, '7351644000003994024'::text, 73500::numeric),
('bc269e06-fe7b-4549-8040-a01be9cafbc5'::uuid, '7351644000003994025'::text, 22048::numeric)
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