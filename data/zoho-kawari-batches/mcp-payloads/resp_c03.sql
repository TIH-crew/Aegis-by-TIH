UPDATE portal_risk_items pri
SET zoho_risk_id = v.zoho_risk_id,
    zoho_fields = coalesce(pri.zoho_fields,'{}'::jsonb) || jsonb_build_object('Item_Value', v.item_value, 'Policy_Number', 'B00000047'),
    updated_at = now()
FROM (VALUES
('cb78d506-245f-5a07-a3c4-f125bc8b94cf'::uuid,'7351644000003997051'::text,15000::numeric),
('423b9da5-7fb7-54e1-bf19-49d5508d0128'::uuid,'7351644000003997052'::text,10664::numeric),
('988037ef-ffda-5c05-9c09-1a807bb730e7'::uuid,'7351644000003997053'::text,63579::numeric),
('edbc7666-b5ac-5610-9501-3fe3888734df'::uuid,'7351644000003997054'::text,7320::numeric),
('418c6dde-c6b6-5b8c-bb78-4c01661a48f1'::uuid,'7351644000003997055'::text,18892::numeric),
('63a6d96c-4c8e-5ebc-97e9-51f43da31bb1'::uuid,'7351644000003997056'::text,219650::numeric),
('de0a2748-77d9-5018-ae27-975a79d081ba'::uuid,'7351644000003997057'::text,13816.93::numeric),
('fa373749-392b-5fdf-8c85-6c4b921b681b'::uuid,'7351644000003997058'::text,13816.93::numeric),
('741bfd23-f243-5c73-a79f-d43009018bd0'::uuid,'7351644000003997059'::text,2560::numeric),
('9b6660b2-1e8d-580e-9c60-5d50ce2983f5'::uuid,'7351644000003997060'::text,10000::numeric),
('e3471c48-d526-5f4d-90fa-1352a0b1de6e'::uuid,'7351644000003997061'::text,3475::numeric),
('0392446a-f261-5a68-a57c-17f1b3e7f380'::uuid,'7351644000003997062'::text,2000::numeric),
('b7abb000-11a7-5b85-b3d2-3a35568aa2e8'::uuid,'7351644000003997063'::text,2000::numeric),
('2cdd391f-8247-5df9-ba53-ef4dd2e67447'::uuid,'7351644000003997064'::text,10000::numeric),
('8f7678dc-a706-5d8c-b5cf-be97207cad2e'::uuid,'7351644000003997065'::text,36726.88::numeric),
('2d90251a-be8e-5bd6-8225-4f517cbe6d2c'::uuid,'7351644000003997066'::text,2000::numeric),
('2c0b8217-9e5a-5b08-be2f-85a72d4f6be2'::uuid,'7351644000003997067'::text,2000::numeric),
('b87ed914-e9d3-51f0-a86c-a3bd29ff0e2c'::uuid,'7351644000003997068'::text,2000::numeric),
('f69a7f17-5b23-510f-a5e5-0568ba5f4755'::uuid,'7351644000003997069'::text,2000::numeric),
('2858ef7f-03ac-5c49-b192-3e4c36847000'::uuid,'7351644000003997070'::text,94000::numeric),
('12a9f021-d6a6-546f-94e8-297b06738ca4'::uuid,'7351644000003997071'::text,2000::numeric),
('1c442ca2-c70f-55a2-bf79-f8b22fc6f9fa'::uuid,'7351644000003997072'::text,2000::numeric),
('658a1ee2-ee1a-5c5f-8090-2f937e04aa56'::uuid,'7351644000003997073'::text,2000::numeric),
('d4a4f2b2-b4ca-583e-9e5a-dd6c26cbf6ea'::uuid,'7351644000003997074'::text,500::numeric),
('d51187e3-4a45-5d9c-9034-362340842319'::uuid,'7351644000003997075'::text,2000::numeric)
) AS v(portal_id, zoho_risk_id, item_value)
WHERE pri.id = v.portal_id
RETURNING pri.id;