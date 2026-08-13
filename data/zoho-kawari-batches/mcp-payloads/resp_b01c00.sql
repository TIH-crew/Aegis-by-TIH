UPDATE portal_risk_items pri
SET zoho_risk_id = v.zoho_risk_id,
    zoho_fields = coalesce(pri.zoho_fields,'{}'::jsonb) || jsonb_build_object('Item_Value', v.item_value, 'Policy_Number', 'B00000047'),
    updated_at = now()
FROM (VALUES
('00f71124-f409-53ea-85dc-6c13e99c8abc'::uuid,'7351644000003983067'::text,2000::numeric),
('33c02ec4-a61d-5470-8ef9-640431f581d6'::uuid,'7351644000003983068'::text,2000::numeric),
('34717ce3-0d4e-5c72-b3d7-504bbdd7d7f7'::uuid,'7351644000003983069'::text,2000::numeric),
('a4c5504c-0ec9-5c99-8542-3e0ea7fbf912'::uuid,'7351644000003983070'::text,2000::numeric),
('1ea99f26-2445-56b1-af70-bc4051cc47e1'::uuid,'7351644000003983071'::text,2000::numeric),
('bf4f843a-7f16-5d7d-afbc-80b0edf696a5'::uuid,'7351644000003983072'::text,2000::numeric),
('0f071b1e-fa74-5732-89bf-bfb72fd085f6'::uuid,'7351644000003983073'::text,2000::numeric),
('61a2dee7-90e8-5bfb-b560-6db53fc5aca4'::uuid,'7351644000003983074'::text,25000::numeric),
('219fb457-7aae-5008-92af-bca672153f3d'::uuid,'7351644000003983075'::text,68000::numeric),
('02bf4641-35bf-5e69-a55d-0229f46f5d1f'::uuid,'7351644000003983076'::text,12000::numeric),
('5db3db39-1d3f-5aea-9c60-0553323f48ef'::uuid,'7351644000003983077'::text,30000::numeric),
('d67abb7e-c793-5e68-8651-087d8114ca05'::uuid,'7351644000003983078'::text,5840::numeric),
('8a1bd6f2-7703-514d-b7ed-cc3dd6595f12'::uuid,'7351644000003983079'::text,5840::numeric),
('dd9916c5-10fb-55a4-b8bb-ae84f006829f'::uuid,'7351644000003983080'::text,14537.9::numeric),
('e610a201-0704-52de-8eb4-3666d44f78f3'::uuid,'7351644000003983081'::text,15099.3::numeric),
('61d2574c-cd84-59af-9ed8-36c0d9c42bc4'::uuid,'7351644000003983082'::text,2000::numeric),
('df1b77a0-9d9b-5e02-91ab-440b0310e9c4'::uuid,'7351644000003983083'::text,902995.7::numeric),
('26f5a007-c77a-5a18-aec0-263b23190e89'::uuid,'7351644000003983084'::text,48585.7::numeric),
('64fb6a43-c528-5ae8-acd6-66984ba388d0'::uuid,'7351644000003983085'::text,711650.7::numeric),
('2874fead-d8ba-5b3a-adc3-c1af961265c2'::uuid,'7351644000003983086'::text,421640::numeric),
('5f6aa79e-ebaa-5b43-a60f-3fb8a119dd1d'::uuid,'7351644000003983087'::text,23520.02::numeric),
('38e5f1d6-2b56-598c-8976-073b43c1208f'::uuid,'7351644000003983088'::text,21481::numeric),
('699ef907-06ba-52ec-ad77-a8ff7f17096f'::uuid,'7351644000003983089'::text,67000::numeric),
('c8ffaacc-1268-54d3-9462-2667d891afc8'::uuid,'7351644000003983090'::text,15000::numeric),
('48b8f534-3128-5a01-b4a9-57d77e357509'::uuid,'7351644000003983091'::text,12240::numeric)
) AS v(portal_id, zoho_risk_id, item_value)
WHERE pri.id = v.portal_id
RETURNING pri.id;