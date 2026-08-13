WITH m(portal_id, zoho_id, item_value) AS (VALUES
('d141e9b3-7967-46e1-bb95-4b1415cb0037'::uuid, '7351644000003995051'::text, 151300::numeric),
('650bf8d3-c07e-44fb-b985-47112d98212e'::uuid, '7351644000003995052'::text, 14369::numeric),
('37fedaac-a321-4af1-ac31-afaacb37b836'::uuid, '7351644000003995053'::text, 14369::numeric),
('95cd06d9-38ab-430e-ae2e-666b8ceaaed1'::uuid, '7351644000003995054'::text, 14161::numeric),
('a48bad92-8a52-489e-86c3-4c99d44360ef'::uuid, '7351644000003995055'::text, 15000::numeric),
('7db51f94-4b3e-447b-8665-3501a682cccc'::uuid, '7351644000003995056'::text, 14369::numeric),
('8d87882d-7664-45c5-bf7e-3cb7c0531043'::uuid, '7351644000003995057'::text, 14369::numeric),
('27b04015-b21a-4624-a68a-aacc29c3d93e'::uuid, '7351644000003995058'::text, 14369::numeric),
('3c32361d-fe07-432e-8838-248a434fd0b0'::uuid, '7351644000003995059'::text, 14369::numeric),
('cd1d96e3-8211-45e3-810b-5672ab07ed4b'::uuid, '7351644000003995060'::text, 14369::numeric),
('c585c6cc-67da-4aa2-aab7-4db79fc42554'::uuid, '7351644000003995061'::text, 14369::numeric),
('dcada91b-6e1c-4f87-a2b6-3bc0a2f0bdd2'::uuid, '7351644000003995062'::text, 14369::numeric),
('fe6d0fc8-f04e-45f9-b088-6f82827c1212'::uuid, '7351644000003995063'::text, 14369::numeric),
('c88958ab-0127-4003-bff2-d6f6ded58759'::uuid, '7351644000003995064'::text, 14369::numeric),
('fc0b8485-470d-408f-aa84-64dab5bc3e13'::uuid, '7351644000003995065'::text, 14369::numeric),
('3f96ef0d-b83f-4782-b702-34376a6ae91d'::uuid, '7351644000003995066'::text, 14369::numeric),
('c834953d-5012-4aa8-8588-033bba61c44e'::uuid, '7351644000003995067'::text, 14369::numeric),
('c840cf2d-0899-400c-941e-7c852a3df046'::uuid, '7351644000003995068'::text, 14369::numeric),
('c527ceac-5e87-4c2b-816a-4172c9ce496d'::uuid, '7351644000003995069'::text, 14369::numeric),
('e2140209-2c38-48aa-bc23-8745d63a2710'::uuid, '7351644000003995070'::text, 14369::numeric),
('f13d0cf5-39f7-41fb-902e-be39f04275fd'::uuid, '7351644000003995071'::text, 14369::numeric),
('857a93ae-2709-4fe0-8e43-97968ae674bc'::uuid, '7351644000003995072'::text, 14369::numeric),
('d4768d93-c201-41e3-8247-7a6c9293c80b'::uuid, '7351644000003995073'::text, 14369::numeric),
('fb7abf0f-df7f-49fa-8a4b-73a766ae8a27'::uuid, '7351644000003995074'::text, 14369::numeric),
('96494340-8bc4-43c4-8864-a24206682cbb'::uuid, '7351644000003995075'::text, 14369::numeric)
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