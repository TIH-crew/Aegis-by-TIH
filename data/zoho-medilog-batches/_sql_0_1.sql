WITH m(portal_id, zoho_id, item_value) AS (VALUES
('cd4e5908-9319-4a6d-a3ea-19894f27ee41'::uuid, '7351644000003990004'::text, 8000::numeric),
('14bacdf7-be55-4e72-8db7-2ef3da2a59a3'::uuid, '7351644000003990005'::text, 7197::numeric),
('45ebacd5-32bd-4e0d-a3f1-038589a5d7b0'::uuid, '7351644000003990006'::text, 90440::numeric),
('0ca7aefe-136e-45dd-8b12-b0434afa7461'::uuid, '7351644000003990007'::text, 28069.65::numeric),
('dc85ecf7-887d-497c-b231-b5a08fb23cbe'::uuid, '7351644000003990008'::text, 129410::numeric),
('95c400b7-0cbe-4a10-b853-c74a5e6cfbbd'::uuid, '7351644000003990009'::text, 13160::numeric),
('af7c4f6b-e1df-4e5f-8d88-e2b7cb19f08f'::uuid, '7351644000003990010'::text, 20000000::numeric),
('c042bc1e-e89b-44a3-bc4a-4c6962e93897'::uuid, '7351644000003990011'::text, 100000::numeric),
('36cebec0-0bd1-4710-903a-a9b8e75939d9'::uuid, '7351644000003990012'::text, 29500::numeric),
('6926292e-e1c0-4274-89eb-b29c7f871a9e'::uuid, '7351644000003990013'::text, 12000::numeric),
('7972baed-cc0b-480a-94d1-88d79cde8afd'::uuid, '7351644000003990014'::text, 83742.12::numeric),
('a5e70a09-cd91-47af-ac5a-01883a1c993e'::uuid, '7351644000003990015'::text, 52310::numeric),
('2b63af98-7cee-4809-b0bf-a3c5c6dfa167'::uuid, '7351644000003990016'::text, 122709.79::numeric),
('1b00e772-ca12-4e55-9181-d1a5b7583116'::uuid, '7351644000003990017'::text, 95866.4::numeric),
('def5d97f-6b87-48e9-887b-9ed78272e4c2'::uuid, '7351644000003990018'::text, 106000::numeric),
('12129f63-7a54-4163-9364-f456f109ef96'::uuid, '7351644000003990019'::text, 10500::numeric),
('38bcd5b3-3aa0-472a-b359-568582a14a2c'::uuid, '7351644000003990020'::text, 71581.48::numeric),
('d76f967d-a1e6-44c2-84e1-9be3ed98c5b7'::uuid, '7351644000003990021'::text, 106000::numeric),
('8ffe2a23-4ba4-448d-b375-4763e0d19d98'::uuid, '7351644000003990022'::text, 95749.36::numeric),
('b9aa9537-9498-4027-bb6e-0e5442a4277f'::uuid, '7351644000003990023'::text, 6148::numeric),
('1261c0b1-ff8b-4dcb-95eb-b1f60e2e1428'::uuid, '7351644000003990024'::text, 13160::numeric),
('224d2b93-02bc-49ff-a730-8fbeed41d689'::uuid, '7351644000003990025'::text, 6999::numeric),
('c3091e1c-98cf-4b7d-a95e-b5c700639a57'::uuid, '7351644000003990026'::text, 6999::numeric),
('36833dc7-c518-4bc6-af97-0620bf69b403'::uuid, '7351644000003990027'::text, 6999::numeric),
('95e3c100-8b80-4718-a727-01d651e76622'::uuid, '7351644000003990028'::text, 6999::numeric)
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