WITH m(portal_id, zoho_id, item_value) AS (VALUES
('e0f48744-090c-4ee6-9db9-db270b16b6f2'::uuid, '7351644000003982042'::text, 6000::numeric),
('8cb65885-8d86-42aa-bee6-1d5bc8d8c68d'::uuid, '7351644000003982043'::text, 8086::numeric),
('005d541b-cb72-4f2f-b980-a218e128be8c'::uuid, '7351644000003982044'::text, 6699::numeric),
('8b16e2ca-c430-4ceb-b66b-a0b05cd7d3c6'::uuid, '7351644000003982045'::text, 6850::numeric),
('33c11d66-e3d3-4cb2-9d8d-ea0945ea4bdb'::uuid, '7351644000003982046'::text, 7637::numeric),
('8064afa3-8f39-4b27-aa6a-5f7fe4a9e645'::uuid, '7351644000003982047'::text, 15079::numeric),
('1d486988-5cda-4586-a145-f3e90446a5bf'::uuid, '7351644000003982048'::text, 13104::numeric),
('01a49c3f-4501-4b2c-8a74-7160b0054520'::uuid, '7351644000003982049'::text, 10000::numeric),
('460ac6c8-955a-4d11-999a-3d84cb6922ef'::uuid, '7351644000003982050'::text, 10000::numeric),
('50481585-3a79-404b-a825-8bca8461e67e'::uuid, '7351644000003982051'::text, 10000::numeric),
('da5d0728-80d3-4844-81ed-9385ad1338f2'::uuid, '7351644000003982052'::text, 8000::numeric),
('7f37fb0d-7f22-45d1-81ba-769c575e19e8'::uuid, '7351644000003982053'::text, 7999::numeric),
('0a70b429-51f1-46cd-8f71-8884e4ff1438'::uuid, '7351644000003982054'::text, 12488.7::numeric),
('2cfd39c1-95ba-4589-8bbe-58b6389df3a7'::uuid, '7351644000003982055'::text, 90440::numeric),
('2d4c3563-4adf-4d19-bd9c-ebba801dadf3'::uuid, '7351644000003982056'::text, 111320::numeric),
('b14891e7-a7c0-4a5f-8868-db2dfb6b1279'::uuid, '7351644000003982057'::text, 403631::numeric),
('a1408f31-7d09-4914-8dba-6617f372ce50'::uuid, '7351644000003982058'::text, 684000::numeric),
('87e06f51-35ae-462d-aed2-85f36d4dca8a'::uuid, '7351644000003982059'::text, 414000::numeric),
('c51f7048-ea61-426b-ba4b-38cbd6b706fe'::uuid, '7351644000003982060'::text, 267900::numeric),
('c816ca33-f8ac-4706-bfff-cd792be19ed6'::uuid, '7351644000003982061'::text, 139100::numeric),
('dd5ae8dc-c5ec-403b-83a3-357f1bbf36b6'::uuid, '7351644000003982062'::text, 140000::numeric),
('f5833bb8-b92a-49c5-aa31-a3de76d9f1ab'::uuid, '7351644000003982063'::text, 238600::numeric),
('4f1c3fce-fc32-4381-94c1-cf755f9c442e'::uuid, '7351644000003982064'::text, 238600::numeric),
('b1558868-1e3a-451e-80fe-3edebba027da'::uuid, '7351644000003982065'::text, 238600::numeric),
('c75d05f2-437f-475f-9827-b9766e06eeba'::uuid, '7351644000003982066'::text, 238600::numeric)
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