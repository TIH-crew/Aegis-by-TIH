UPDATE portal_risk_items pri
SET zoho_risk_id = v.zoho_risk_id,
    zoho_fields = coalesce(pri.zoho_fields,'{}'::jsonb) || jsonb_build_object('Item_Value', v.item_value, 'Policy_Number', 'B00000047'),
    updated_at = now()
FROM (VALUES
('5cd8cf86-27ef-574b-ab3d-d8fb2c30808d'::uuid,'7351644000004005001'::text,8610::numeric),
('7a31cd8d-0941-5597-84a0-31cdabb55071'::uuid,'7351644000004005002'::text,3499::numeric),
('7ff35939-10c8-5c00-b8c4-e52c199453d5'::uuid,'7351644000004005003'::text,3499::numeric),
('8728b700-58b5-5d26-929f-5749cfa989e6'::uuid,'7351644000004005004'::text,11834.15::numeric),
('8d90e1a7-1522-5831-a6fa-220c24998541'::uuid,'7351644000004005005'::text,10827.25::numeric),
('94e7e545-66d2-59a1-b5f9-a40940883086'::uuid,'7351644000004005006'::text,6999::numeric),
('b9938bf3-35fd-52ea-96ae-b373e550774a'::uuid,'7351644000004005007'::text,4783::numeric),
('f76d77a2-1c0f-52ac-aed8-402bbdf1d2a2'::uuid,'7351644000004005008'::text,10223.96::numeric),
('fd00a959-f9bd-5db4-98d4-9143ab94cbaf'::uuid,'7351644000004005009'::text,16887::numeric),
('9f6cdfe0-9ad7-58ba-8735-9a1283cb8ad1'::uuid,'7351644000004005010'::text,2000::numeric),
('81ab54bd-18fb-5ce6-aea5-7178670be6b5'::uuid,'7351644000004005011'::text,300::numeric),
('3cd1bba1-be31-5cc6-b040-40c711cf7604'::uuid,'7351644000004005012'::text,26726.78::numeric),
('4f756a2d-4e1d-5807-97e2-4d2b48ef3fb5'::uuid,'7351644000004005013'::text,8505.16::numeric),
('2f893cdd-323b-54ba-9cf7-1fcc735e9c1a'::uuid,'7351644000004005014'::text,300::numeric),
('8323d352-9e58-57ba-bde0-5ba3c7eb1c82'::uuid,'7351644000004005015'::text,19940::numeric),
('0a60f15a-9553-54ab-b45c-dce7ad8cf5ad'::uuid,'7351644000004005016'::text,51242.11::numeric),
('8085348f-37ee-53da-805a-00eac69b7d4f'::uuid,'7351644000004005017'::text,140123.45::numeric),
('3b24f897-493f-598d-847e-7af112216c2d'::uuid,'7351644000004005018'::text,30773.91::numeric),
('357fbacf-3221-52bf-be2d-140164efc324'::uuid,'7351644000004005019'::text,129903::numeric),
('81ae6e11-c333-5037-8c4c-94fe4bff7237'::uuid,'7351644000004005020'::text,627600::numeric),
('c6d870c8-45ae-5bcc-ad28-c8a64bcf19b4'::uuid,'7351644000004005021'::text,6816.67::numeric),
('03372c86-853f-5855-9610-a08209d1121f'::uuid,'7351644000004005022'::text,10918.92::numeric),
('16b671cb-4a88-51f6-b330-887c3f67fe24'::uuid,'7351644000004005023'::text,11077.59::numeric),
('5a0f4a10-796f-5ccb-82c6-c8c85e1e7640'::uuid,'7351644000004005024'::text,8975.65::numeric),
('5f8d1bf4-454f-5d7f-8a68-574c01d85de1'::uuid,'7351644000004005025'::text,7300::numeric)
) AS v(portal_id, zoho_risk_id, item_value)
WHERE pri.id = v.portal_id
RETURNING pri.id;