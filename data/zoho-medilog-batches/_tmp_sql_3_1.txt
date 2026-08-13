WITH m(portal_id, zoho_id, item_value) AS (VALUES
('176f2816-02d9-4b01-8404-0886a9155b63'::uuid, '7351644000003995101'::text, 4086::numeric),
('f8bd5bc9-1623-4ba6-8eb7-f37d0941b5be'::uuid, '7351644000003995102'::text, 4086::numeric),
('9d3c4e15-3c23-4e4c-9cc2-90ddf19e25a4'::uuid, '7351644000003995103'::text, 105453.04::numeric),
('626b9848-7e07-490d-9952-7a1592d9c582'::uuid, '7351644000003995104'::text, 218447::numeric),
('1602a728-7e26-468c-be9b-5ddbfe9532da'::uuid, '7351644000003995105'::text, 147125.93::numeric),
('87c8c50d-2fb2-485c-9f69-4abd900a40fb'::uuid, '7351644000003995106'::text, 5300::numeric),
('7ab680cd-7820-4b81-9502-04dfb4ce3afa'::uuid, '7351644000003995107'::text, 7500::numeric),
('9e1840b8-5f9f-4b6f-9cb8-ffd721718977'::uuid, '7351644000003995108'::text, 5500::numeric),
('7337d156-1c96-4615-a5c6-537580ffc534'::uuid, '7351644000003995109'::text, 11672::numeric),
('4bede61d-12d6-4f47-b237-e1546d259014'::uuid, '7351644000003995110'::text, 10000::numeric),
('2df66f92-c27b-46c5-ba4f-429256a505cb'::uuid, '7351644000003995111'::text, 90440::numeric),
('aaaf032c-16ea-4ceb-9ec8-2dc97945d83f'::uuid, '7351644000003995112'::text, 115761.87::numeric),
('9b09008f-7a70-4d7b-8bea-f8e419b82f62'::uuid, '7351644000003995113'::text, 193947::numeric),
('e3d0bb6d-e1e4-4847-a47d-aecfda390f35'::uuid, '7351644000003995114'::text, 90440::numeric),
('8417fc66-656a-411b-bd63-525261e8965e'::uuid, '7351644000003995115'::text, 106000::numeric),
('18763a87-52d4-4f81-b775-6a62b8e04983'::uuid, '7351644000003995116'::text, 132413.47::numeric),
('dc9bcf71-191b-4e05-abb3-49768959560d'::uuid, '7351644000003995117'::text, 4160::numeric),
('893554ea-93c5-428a-b2ca-5f229edc5e04'::uuid, '7351644000003995118'::text, 4160::numeric),
('433b1db1-6761-4385-bdf6-8f1ac620d62c'::uuid, '7351644000003995119'::text, 4160::numeric),
('b4f1f9fa-4616-4c5a-af6e-c31b84e632ba'::uuid, '7351644000003995120'::text, 3030::numeric),
('d160ad02-5e40-4d12-9044-8b3332b6127a'::uuid, '7351644000003995121'::text, 136100::numeric),
('05daa9a7-03c2-4368-befd-b0674464ca93'::uuid, '7351644000003995122'::text, 154900::numeric),
('626dea97-6729-4568-9e2c-d4c6437f6891'::uuid, '7351644000003995123'::text, 154900::numeric),
('fa91fea6-9012-4932-acf8-1fb16fb0f5bc'::uuid, '7351644000003995124'::text, 115150::numeric),
('684c75b5-6ba3-4c28-ac19-997c5cb25dba'::uuid, '7351644000003995125'::text, 127700::numeric)
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