UPDATE portal_risk_items pri
SET zoho_risk_id = v.zoho_risk_id,
    zoho_fields = coalesce(pri.zoho_fields,'{}'::jsonb) || jsonb_build_object('Item_Value', v.item_value, 'Policy_Number', 'B00000047'),
    updated_at = now()
FROM (VALUES
('7d09fd0d-7efb-5701-be4d-053c596b1340'::uuid,'7351644000003979005'::text,11077.59::numeric),
('870b70ac-bafa-5b2f-8b0f-4ee87da0f00f'::uuid,'7351644000003979006'::text,6258.75::numeric),
('980a3726-9f0f-5294-8295-70e9690bf7b8'::uuid,'7351644000003979007'::text,6150::numeric),
('b589dbac-f50c-536d-b25b-e52697fbbfb3'::uuid,'7351644000003979008'::text,15000::numeric),
('be767089-12f3-5c9e-8f87-a285b740f2d0'::uuid,'7351644000003979009'::text,6100::numeric),
('ece19b03-ea17-5d75-94bb-3fa305357d20'::uuid,'7351644000003979010'::text,6150::numeric),
('1f8d0002-879c-5031-b463-4159247a1a93'::uuid,'7351644000003979011'::text,2000::numeric),
('d9fcd8b2-750e-5ba4-af34-d3be2ef13509'::uuid,'7351644000003979012'::text,15000::numeric),
('5c5af5e7-cc9d-5001-ad0c-9bf181e778e4'::uuid,'7351644000003979013'::text,4745722.11::numeric),
('2bef0880-d069-5f46-b51b-28c31103389b'::uuid,'7351644000003979014'::text,64968.75::numeric),
('6bedd98e-2a4a-5173-92bd-4e95121e6b5d'::uuid,'7351644000003979015'::text,43656.25::numeric),
('79334f06-f300-5f55-8875-a40f6fb671f0'::uuid,'7351644000003979016'::text,53968.75::numeric),
('e356a36b-ce2c-5407-a670-9cf131d327cc'::uuid,'7351644000003979017'::text,51906.25::numeric),
('9c63f653-398e-563b-81ef-d7153eb58570'::uuid,'7351644000003979018'::text,18559.99::numeric),
('00283c3b-711d-52f3-b10f-12e3c63d7591'::uuid,'7351644000003979019'::text,36850::numeric),
('1e907f4f-ae41-5432-b68e-6437f6a4ec72'::uuid,'7351644000003979020'::text,42229.5::numeric),
('4a8d9cb2-af1a-50da-b625-cae233f148f5'::uuid,'7351644000003979021'::text,2000::numeric),
('d3091c10-d8ed-5631-a60d-51a751ed5edc'::uuid,'7351644000003979022'::text,12708::numeric),
('0062a3cb-1638-5bd5-bf0a-eecc0c9ba519'::uuid,'7351644000003979023'::text,5390::numeric),
('c26d58e4-6748-50b6-9ed1-b896a564df51'::uuid,'7351644000003979024'::text,5390::numeric),
('ae7c64be-e08e-5c73-bb8e-ffd0137e3c79'::uuid,'7351644000003979025'::text,15000::numeric),
('38dd69df-39bc-5556-a724-87e4ce9e813e'::uuid,'7351644000003979026'::text,15000::numeric),
('6e17365d-f0c5-51bf-9595-32b8658cdfba'::uuid,'7351644000003979027'::text,23244::numeric),
('e19fecc5-a049-537e-ab76-5fde9d8db596'::uuid,'7351644000003979028'::text,27162::numeric),
('d8cb6d04-4d97-5e23-abe9-3d4cdac2c1f7'::uuid,'7351644000003979029'::text,23353.47::numeric)
) AS v(portal_id, zoho_risk_id, item_value)
WHERE pri.id = v.portal_id
RETURNING pri.id;