WITH m(portal_id, zoho_id, item_value) AS (VALUES
('df5da379-718c-465c-846f-d942c9df500b'::uuid, '7351644000003998001'::text, 209500::numeric),
('bd4bd376-bb21-4c90-b723-d300110efdf1'::uuid, '7351644000003998002'::text, 222850::numeric),
('e331f7dd-e6bc-4db7-9753-bb8b2f1d666e'::uuid, '7351644000003998003'::text, 223900::numeric),
('3a0c7dde-2d57-46ac-bbab-ee31ee31903a'::uuid, '7351644000003998004'::text, 223900::numeric),
('7612d2fe-87aa-4f5d-9e03-79ab9a27359b'::uuid, '7351644000003998005'::text, 244800::numeric),
('4c46058c-da76-4495-910a-c619889fd82d'::uuid, '7351644000003998006'::text, 223900::numeric),
('6ce453ec-d4a4-4148-85ad-e8bdc3ebdad3'::uuid, '7351644000003998007'::text, 223900::numeric),
('1e5221b6-4c6d-451b-ba8e-cbce0690f324'::uuid, '7351644000003998008'::text, 223900::numeric),
('870c7717-8243-4131-94f6-43dd9da4a6c4'::uuid, '7351644000003998009'::text, 223900::numeric),
('1656d7e1-f21c-487c-aad0-ec9b11a9cd59'::uuid, '7351644000003998010'::text, 222850::numeric),
('4c9c7173-47e0-45a2-b617-113a57b3cb67'::uuid, '7351644000003998011'::text, 236750::numeric),
('67dcfba7-c5e5-4e1d-8931-6a95be8a2320'::uuid, '7351644000003998012'::text, 223900::numeric),
('6ee48d62-8000-4f34-8795-83701e699716'::uuid, '7351644000003998013'::text, 236750::numeric),
('826c2d45-550d-4eb0-a6f1-9ff3c27303b9'::uuid, '7351644000003998014'::text, 236750::numeric),
('998ae2f8-6ee7-409c-a99e-d95df21954c7'::uuid, '7351644000003998015'::text, 236750::numeric),
('3e468ee1-4dc6-44e4-91f6-61ce73755db7'::uuid, '7351644000003998016'::text, 223900::numeric),
('f98a6c81-cdc1-4b8c-bd2d-f195f1a307f8'::uuid, '7351644000003998017'::text, 120700::numeric),
('75b628a8-1ff9-43cf-bb04-fce19d50e099'::uuid, '7351644000003998018'::text, 199348::numeric),
('45563a9e-51ea-45f4-8e96-f6aa62c25cee'::uuid, '7351644000003998019'::text, 210350::numeric),
('7ba9fd23-69b8-4b0d-883c-9c5794be0301'::uuid, '7351644000003998020'::text, 1500::numeric),
('85713723-4c60-4456-9277-c1e0d045eaa6'::uuid, '7351644000003998021'::text, 405306::numeric),
('3c7e6b6c-7c06-4455-b71e-f29e92a92cb6'::uuid, '7351644000003998022'::text, 109433.73::numeric),
('322c63ac-6119-4831-9d7b-b73d7c4d7919'::uuid, '7351644000003998023'::text, 171800::numeric),
('0295d386-74e1-422a-a67d-9d5bf72f66ab'::uuid, '7351644000003998024'::text, 100489.48::numeric),
('2fe7f497-b9f1-403a-8680-4e7463598097'::uuid, '7351644000003998025'::text, 38998::numeric)
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