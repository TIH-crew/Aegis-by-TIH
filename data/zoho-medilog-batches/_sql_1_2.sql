WITH m(portal_id, zoho_id, item_value) AS (VALUES
('6d22782d-3427-4464-a3ad-7a56bd88bcf1'::uuid, '7351644000003990054'::text, 9450::numeric),
('705d4dde-1115-4f35-89f9-99345f6593d2'::uuid, '7351644000003990055'::text, 9450::numeric),
('a2be06ec-45ef-481a-b296-2a8e6d0d9182'::uuid, '7351644000003990056'::text, 28633::numeric),
('6417bf2a-55f7-433e-8e89-69b1e206d839'::uuid, '7351644000003990057'::text, 9450::numeric),
('a5c94f24-593e-4ce6-b717-18dfaaa38f0e'::uuid, '7351644000003990058'::text, 9450::numeric),
('07bddfb2-d3c0-4dfb-83ac-6cb24df2834b'::uuid, '7351644000003990059'::text, 483035::numeric),
('19182897-3a86-4e82-b8ce-eb301f7a54e6'::uuid, '7351644000003990060'::text, 483035::numeric),
('5a782ac9-87f2-4d52-95e9-3221839fe37b'::uuid, '7351644000003990061'::text, 587025::numeric),
('11fa205d-b0c4-4b59-92ce-6b7e844e6101'::uuid, '7351644000003990062'::text, 641550::numeric),
('3a72b6a8-edb2-41da-8b0d-aa365b9303ca'::uuid, '7351644000003990063'::text, 523775::numeric),
('043208ae-2173-43c2-9c32-62067036db98'::uuid, '7351644000003990064'::text, 578300::numeric),
('0c7384ee-9464-4dfe-99f3-30b5487c6808'::uuid, '7351644000003990065'::text, 435525::numeric),
('a524e518-17ca-4511-8c8e-dbbaab74a5cf'::uuid, '7351644000003990066'::text, 435525::numeric),
('19ee0903-d207-41d5-a1b7-cd9fb5cb5a23'::uuid, '7351644000003990067'::text, 435525::numeric),
('9acf82d7-e810-4b47-913d-edae41a8911f'::uuid, '7351644000003990068'::text, 355700::numeric),
('8fd4f515-82cd-41a3-abd5-7a8736205010'::uuid, '7351644000003990069'::text, 411935::numeric),
('7080c085-ec8e-445f-a187-320ab5c253c4'::uuid, '7351644000003990070'::text, 355700::numeric),
('bc4f0b7b-e1e7-4b6d-af18-4b28be9f349f'::uuid, '7351644000003990071'::text, 355700::numeric),
('1b3d2ef2-6f47-4b37-af9e-28cfe1ff34ea'::uuid, '7351644000003990072'::text, 355700::numeric),
('774c96f3-20fa-44bd-831f-51fe4f9a90a1'::uuid, '7351644000003990073'::text, 355700::numeric),
('94994181-00fe-428f-8500-6865ec38b04c'::uuid, '7351644000003990074'::text, 355700::numeric),
('6082bac5-1cc1-46fe-968c-49fbc63daafd'::uuid, '7351644000003990075'::text, 404900::numeric),
('84151c73-0e15-410f-8cef-883c1a186080'::uuid, '7351644000003990076'::text, 404900::numeric),
('f21948e6-eed0-4925-8877-6e9d6efef729'::uuid, '7351644000003990077'::text, 551285::numeric),
('84741079-6252-490d-a409-84e237808363'::uuid, '7351644000003990078'::text, 435525::numeric)
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