WITH m(portal_id, zoho_id, item_value) AS (VALUES
('bd138cf6-fd11-4250-bfc9-f83ba89f7792'::uuid, '7351644000003983017'::text, 98400::numeric),
('16183faf-f08a-44ae-b043-8a441f202962'::uuid, '7351644000003983018'::text, 98400::numeric),
('49711a97-2038-4014-b7e9-e66a41fbe2e6'::uuid, '7351644000003983019'::text, 98400::numeric),
('dd6b7278-204c-4647-a9a5-c74f90798534'::uuid, '7351644000003983020'::text, 98400::numeric),
('beb973e7-73c3-4caa-b8e7-6a0558973497'::uuid, '7351644000003983021'::text, 110200::numeric),
('d5a4c9d5-cb30-41ae-aed8-2db612ca1cc3'::uuid, '7351644000003983022'::text, 129050::numeric),
('7a5cab2a-10f4-49fa-aac6-86601ee85a17'::uuid, '7351644000003983023'::text, 133550::numeric),
('5f1545fc-6f44-40a2-8b96-7fb29c06c28b'::uuid, '7351644000003983024'::text, 131700::numeric),
('3f6375fa-bac1-41de-b4c8-0eeb5568ecc8'::uuid, '7351644000003983025'::text, 141700::numeric),
('396d82d8-a38a-410b-9f7e-d392e7df2aa3'::uuid, '7351644000003983026'::text, 4150::numeric),
('da17d834-87d7-486c-9f90-07ed1f689815'::uuid, '7351644000003983027'::text, 4474::numeric),
('4f7c3f9a-9cbe-4ab4-a37d-50f0d7af16ee'::uuid, '7351644000003983028'::text, 9133::numeric),
('2e283096-14a9-4061-8217-156daff98f7c'::uuid, '7351644000003983029'::text, 9133::numeric),
('e8b9c4c3-1114-4347-87a6-ba2778f5eb17'::uuid, '7351644000003983030'::text, 3891::numeric),
('981b35cc-fa0f-44c1-95db-e34155647c45'::uuid, '7351644000003983031'::text, 4474::numeric),
('2d3b9603-2df0-4dd3-a286-88cd35b34f9c'::uuid, '7351644000003983032'::text, 83393::numeric),
('f507340f-feb2-4972-8471-dbad6d588bdd'::uuid, '7351644000003983033'::text, 9133::numeric),
('3441382b-8ed6-4bb0-897c-9267c0613302'::uuid, '7351644000003983034'::text, 9133::numeric),
('511f8571-badd-4da6-8a7f-acb2b531855c'::uuid, '7351644000003983035'::text, 9102::numeric),
('d75fac25-0160-441e-83b6-75e53fb6cb06'::uuid, '7351644000003983036'::text, 9102::numeric),
('f0555067-6664-4783-9413-da420be26030'::uuid, '7351644000003983037'::text, 13845::numeric),
('34fb25a2-ac6a-4ad5-91f8-01d1d5023fc8'::uuid, '7351644000003983038'::text, 3608::numeric),
('02da9523-b1b0-41db-902e-a7ca9ab1edec'::uuid, '7351644000003983039'::text, 3608::numeric),
('1995b607-a477-43bf-90cb-a5eea02973e0'::uuid, '7351644000003983040'::text, 274916::numeric),
('9fd8bfdc-9699-4b9d-8429-db5968e7ee43'::uuid, '7351644000003983041'::text, 98118::numeric)
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