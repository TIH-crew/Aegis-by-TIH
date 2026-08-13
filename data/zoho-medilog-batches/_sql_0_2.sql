WITH m(portal_id, zoho_id, item_value) AS (VALUES
('efa9e870-c873-4f39-8b8b-4ddb20be6665'::uuid, '7351644000003991003'::text, 38086.96::numeric),
('ddbdef6b-1ab3-4a38-a2bc-6ab0749ec47c'::uuid, '7351644000003991004'::text, 10282::numeric),
('d0f0c3ed-cb45-412a-8790-8dae144a1881'::uuid, '7351644000003991005'::text, 6960::numeric),
('ae2501ff-de61-4aae-bf42-654c533906aa'::uuid, '7351644000003991006'::text, 470000::numeric),
('f2987274-60f2-4510-8956-42ecd040ffd6'::uuid, '7351644000003991007'::text, 850000::numeric),
('8e7a74e6-a629-40a6-ae58-c273d0d3c49f'::uuid, '7351644000003991008'::text, 5000::numeric),
('49fccee1-4824-4b8f-b44f-b4a119d4dc33'::uuid, '7351644000003991009'::text, 5000::numeric),
('cb702bd1-ab5b-40a2-abf6-1b8fcf1149c6'::uuid, '7351644000003991010'::text, 90440::numeric),
('a3caeded-56fc-4c5b-93e1-6d678eb5458f'::uuid, '7351644000003991011'::text, 106000::numeric),
('f12be9fa-68a3-4212-95d4-2fd09711fa90'::uuid, '7351644000003991012'::text, 115764.53::numeric),
('a2985ee0-9e59-4440-acb5-1c22a3fe34d5'::uuid, '7351644000003991013'::text, 12542::numeric),
('47d7bb49-7f5d-4fe4-8b8c-800229b15b18'::uuid, '7351644000003991014'::text, 2734::numeric),
('b34c372d-94ca-4f66-a131-b5328e5b18f7'::uuid, '7351644000003991015'::text, 9000::numeric),
('2b21dc54-95bb-431d-b19f-ea0589d37cc1'::uuid, '7351644000003991016'::text, 13700::numeric),
('c7e467f9-fea5-4558-9bcb-bcd9678dc880'::uuid, '7351644000003991017'::text, 12800::numeric),
('06397cf1-f653-42be-a297-9f1b806fcae5'::uuid, '7351644000003991018'::text, 9400::numeric),
('8ae1d555-99f4-41a9-b370-ad91e8bb2f9d'::uuid, '7351644000003991019'::text, 8650::numeric),
('c8fbcff8-c906-465f-9390-2dc4afbd9d42'::uuid, '7351644000003991020'::text, 65500::numeric),
('edb3bb6b-b326-4e7a-a478-794a57e5acfb'::uuid, '7351644000003991021'::text, 98400::numeric),
('7d2c73fa-a00d-4eb6-bebf-58d7d8407555'::uuid, '7351644000003991022'::text, 98400::numeric),
('19a0c2aa-25d1-43a3-8e37-48b6e034d82d'::uuid, '7351644000003991023'::text, 101950::numeric),
('26eec376-b7ac-43d5-ac22-6ba08e21a455'::uuid, '7351644000003991024'::text, 63100::numeric),
('eba7ccfa-d2dd-487c-92e6-765cb2d8c0ae'::uuid, '7351644000003991025'::text, 63100::numeric),
('6f8a69a5-0547-4893-877e-a1a083a14736'::uuid, '7351644000003991026'::text, 98400::numeric),
('36002e85-c506-45f4-b4ad-563236aa9bd4'::uuid, '7351644000003991027'::text, 98400::numeric)
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