WITH m(portal_id, zoho_id, item_value) AS (VALUES
('2287d679-89a1-4eba-b696-01959a04d5ab'::uuid, '7351644000003992051'::text, 143000::numeric),
('89798c6c-ec3a-4724-8b11-e0476964a5db'::uuid, '7351644000003992052'::text, 134750::numeric),
('f2285e10-c664-4b87-9718-61f1d1ceff82'::uuid, '7351644000003992053'::text, 95390::numeric),
('228647e0-fe4a-4ada-86f4-bb1d080ec384'::uuid, '7351644000003992054'::text, 130600::numeric),
('3d855ac7-3ab1-4d6b-a907-ed1e63f06d4b'::uuid, '7351644000003992055'::text, 130600::numeric),
('330bdb22-28df-450a-bd96-1be9999f9882'::uuid, '7351644000003992056'::text, 153100::numeric),
('f323d08a-8371-4526-b480-a74088f3c7b4'::uuid, '7351644000003992057'::text, 130600::numeric),
('0cb9162a-58b5-4a58-bb15-198939e4eadf'::uuid, '7351644000003992058'::text, 130600::numeric),
('fe86e461-13f5-463e-a67d-c71afa68e539'::uuid, '7351644000003992059'::text, 125400::numeric),
('00bc5b5e-0311-4648-ba88-b95ef32b83b2'::uuid, '7351644000003992060'::text, 117900::numeric),
('8bfba183-ab67-45e9-98b1-52ab08c82739'::uuid, '7351644000003992061'::text, 164100::numeric),
('b29886a8-3a49-4fd3-89c8-690751d08a24'::uuid, '7351644000003992062'::text, 160100::numeric),
('16d81c5c-87be-429f-99cd-e7da82386eeb'::uuid, '7351644000003992063'::text, 164100::numeric),
('9d8c13f2-3007-4618-a70e-57bc0f370132'::uuid, '7351644000003992064'::text, 164100::numeric),
('3296aa9c-9647-4ea6-9f50-cc3ba1a3a652'::uuid, '7351644000003992065'::text, 164100::numeric),
('ab6cadca-1838-4c4c-93f8-d533ff9f4d01'::uuid, '7351644000003992066'::text, 164100::numeric),
('3c9c8f76-8602-42f4-aff2-927dd7e7378d'::uuid, '7351644000003992067'::text, 155100::numeric),
('68feab06-bdbd-4bef-9b2e-780c6506107c'::uuid, '7351644000003992068'::text, 164100::numeric),
('4f4cd8f8-e512-44fb-90df-c6927ad35511'::uuid, '7351644000003992069'::text, 160100::numeric),
('dfa41c0a-daf7-4975-82d5-c84d416aa045'::uuid, '7351644000003992070'::text, 139600::numeric),
('6961ce3d-95e0-458e-a248-17b10c59b6c5'::uuid, '7351644000003992071'::text, 164100::numeric),
('77bd8220-ad48-435b-ae45-5daaf74aa1a8'::uuid, '7351644000003992072'::text, 164100::numeric),
('76bfb710-79fc-4f7c-b7bf-316a497700b3'::uuid, '7351644000003992073'::text, 164100::numeric),
('da7434b1-db7a-4e93-808b-5a2fbe32253b'::uuid, '7351644000003992074'::text, 164100::numeric),
('62d1043a-7057-4c56-aad5-03439f6ca636'::uuid, '7351644000003992075'::text, 231100::numeric)
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