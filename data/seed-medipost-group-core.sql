-- Medipost group accounts, branches, directors
BEGIN;
UPDATE portal_accounts SET registration_number = '2014/089301/07', name = 'Medipost FTRR&I' WHERE id = '3a842763-e5f2-43f7-87c2-2a5429738fb3';
INSERT INTO portal_accounts (id, name, parent_account_id, zoho_account_id, industry, registration_number, phone, aegis_status)
VALUES ('b1111111-1111-4111-8111-111111111147', 'Kawari Wholesalers (Pty) Ltd', '3a842763-e5f2-43f7-87c2-2a5429738fb3', '7351644000003979001', 'Wholesale', '2004/015737/07', '+27 12 426 4001', 'active')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  parent_account_id = EXCLUDED.parent_account_id,
  zoho_account_id = EXCLUDED.zoho_account_id,
  registration_number = EXCLUDED.registration_number,
  industry = EXCLUDED.industry,
  phone = EXCLUDED.phone,
  aegis_status = 'active';
INSERT INTO portal_accounts (id, name, parent_account_id, zoho_account_id, industry, registration_number, phone, aegis_status)
VALUES ('b1111111-1111-4111-8111-111111111151', 'Medilogistics FTRR&I', '3a842763-e5f2-43f7-87c2-2a5429738fb3', '7351644000003987001', 'Logistics', '2011/129984/07', '+27 12 426 4000', 'active')
ON CONFLICT (id) DO UPDATE SET parent_account_id = EXCLUDED.parent_account_id, zoho_account_id = EXCLUDED.zoho_account_id,
  registration_number = EXCLUDED.registration_number, name = EXCLUDED.name, aegis_status = 'active';
INSERT INTO portal_accounts (id, name, parent_account_id, zoho_account_id, industry, registration_number, phone, aegis_status)
VALUES ('b1111111-1111-4111-8111-111111111152', 'Medipost Pharmacy (HH Durrheim)', '3a842763-e5f2-43f7-87c2-2a5429738fb3', '7351644000003987002', 'Pharmacy', '1997/011099/07', '+27 12 426 4000', 'active')
ON CONFLICT (id) DO UPDATE SET parent_account_id = EXCLUDED.parent_account_id, zoho_account_id = EXCLUDED.zoho_account_id,
  registration_number = EXCLUDED.registration_number, name = EXCLUDED.name, aegis_status = 'active';
INSERT INTO portal_branches (id, account_id, name, address, latitude, longitude)
VALUES ('c4444444-4444-4444-8444-444444444401', 'b1111111-1111-4111-8111-111111111147', 'Midrand', 'Crescent Corporate Park, Unit A1, Block A, Technohub 59 Roan, Midrand, Gauteng, 1682', -25.996, 28.128)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, address = EXCLUDED.address, latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude;
INSERT INTO portal_branches (id, account_id, name, address, latitude, longitude)
VALUES ('c4444444-4444-4444-8444-444444444402', 'b1111111-1111-4111-8111-111111111147', 'Cape Town', 'Parow / Cape Town operations', -33.8985, 18.5902)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, address = EXCLUDED.address, latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude;
INSERT INTO portal_branches (id, account_id, name, address, latitude, longitude)
VALUES ('c4444444-4444-4444-8444-444444444403', 'b1111111-1111-4111-8111-111111111151', 'Head Office', 'Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002', -25.7205, 28.2055)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, address = EXCLUDED.address, latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude;
INSERT INTO portal_branches (id, account_id, name, address, latitude, longitude)
VALUES ('c4444444-4444-4444-8444-444444444404', 'b1111111-1111-4111-8111-111111111152', 'Gezina', 'Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002', -25.7205, 28.2055)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, address = EXCLUDED.address, latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude;
INSERT INTO portal_directors (id, full_name, email)
VALUES ('2d5a1223-075d-5918-a838-fcc44318cff0', 'Bulelwa Promise Mamabolo', 'bulelwa.promise.mamabolo@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('2d5a1223-075d-5918-a838-fcc44318cff0', 'b1111111-1111-4111-8111-111111111151', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('2d5a1223-075d-5918-a838-fcc44318cff0', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111151', 'bulelwa.promise.mamabolo@directors.aegis.local', 'member', 'c4444444-4444-4444-8444-444444444403', '2d5a1223-075d-5918-a838-fcc44318cff0'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('bulelwa.promise.mamabolo@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('c95b3529-c93a-5ec2-8191-9592536c140d', 'Emmerentia Frederika Myburgh', 'rentia@medipost.co.za')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('c95b3529-c93a-5ec2-8191-9592536c140d', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111152', 'rentia@medipost.co.za', 'member', 'c4444444-4444-4444-8444-444444444404', 'c95b3529-c93a-5ec2-8191-9592536c140d'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('rentia@medipost.co.za') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('e0e94e40-d653-524a-8410-2fefbf4fd241', 'Khulekani Mcwallace Dlamini', 'khulekani.mcwallace.dlamini@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('e0e94e40-d653-524a-8410-2fefbf4fd241', '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('e0e94e40-d653-524a-8410-2fefbf4fd241', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'khulekani.mcwallace.dlamini@directors.aegis.local', 'member', '1fc97cdd-ff84-4afa-8bca-3840eafb5847', 'e0e94e40-d653-524a-8410-2fefbf4fd241'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('khulekani.mcwallace.dlamini@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('0dcaaa21-9825-5b0b-9a6d-435e29d95189', 'Louis Scheepers', 'louis@medipost.co.za')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('0dcaaa21-9825-5b0b-9a6d-435e29d95189', '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('0dcaaa21-9825-5b0b-9a6d-435e29d95189', 'b1111111-1111-4111-8111-111111111151', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('0dcaaa21-9825-5b0b-9a6d-435e29d95189', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111151', 'louis@medipost.co.za', 'member', 'c4444444-4444-4444-8444-444444444403', '0dcaaa21-9825-5b0b-9a6d-435e29d95189'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('louis@medipost.co.za') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('157c73d4-178d-5324-898f-32dad53e7dfc', 'Mamedupi Matsipa', 'mamedupi.matsipa@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('157c73d4-178d-5324-898f-32dad53e7dfc', 'b1111111-1111-4111-8111-111111111147', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111147', 'mamedupi.matsipa@directors.aegis.local', 'member', 'c4444444-4444-4444-8444-444444444401', '157c73d4-178d-5324-898f-32dad53e7dfc'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('mamedupi.matsipa@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('124ca33d-d82c-5bf1-8841-857c78f5bb8d', 'Martha Sophia Joubert', 'martha.sophia.joubert@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('124ca33d-d82c-5bf1-8841-857c78f5bb8d', '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('124ca33d-d82c-5bf1-8841-857c78f5bb8d', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111152', 'martha.sophia.joubert@directors.aegis.local', 'member', 'c4444444-4444-4444-8444-444444444404', '124ca33d-d82c-5bf1-8841-857c78f5bb8d'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('martha.sophia.joubert@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('53f93aeb-f8e8-5f89-84d8-5679790ffea7', 'Mziwandile Noel Guliwe', 'mziwandile.noel.guliwe@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('53f93aeb-f8e8-5f89-84d8-5679790ffea7', 'b1111111-1111-4111-8111-111111111147', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111147', 'mziwandile.noel.guliwe@directors.aegis.local', 'member', 'c4444444-4444-4444-8444-444444444401', '53f93aeb-f8e8-5f89-84d8-5679790ffea7'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('mziwandile.noel.guliwe@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('2be70940-89cb-5a20-a2be-368d2902662e', 'Ramoroesi Victor Jonas Ramathesele', 'ramoroesi.victor.jonas.ramathesele@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('2be70940-89cb-5a20-a2be-368d2902662e', 'b1111111-1111-4111-8111-111111111151', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('2be70940-89cb-5a20-a2be-368d2902662e', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT 'b1111111-1111-4111-8111-111111111151', 'ramoroesi.victor.jonas.ramathesele@directors.aegis.local', 'member', 'c4444444-4444-4444-8444-444444444403', '2be70940-89cb-5a20-a2be-368d2902662e'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('ramoroesi.victor.jonas.ramathesele@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('11cb8de5-2be4-55f4-8506-90622826245e', 'Selapeng Chriscentia Maledimo', 'selapeng.chriscentia.maledimo@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('11cb8de5-2be4-55f4-8506-90622826245e', '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('11cb8de5-2be4-55f4-8506-90622826245e', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'selapeng.chriscentia.maledimo@directors.aegis.local', 'member', '1fc97cdd-ff84-4afa-8bca-3840eafb5847', '11cb8de5-2be4-55f4-8506-90622826245e'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('selapeng.chriscentia.maledimo@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('6857bc87-22ea-5dbf-a315-4b5f5c506b99', 'Urvashi Maganlal', 'urvashi.maganlal@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('6857bc87-22ea-5dbf-a315-4b5f5c506b99', '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('6857bc87-22ea-5dbf-a315-4b5f5c506b99', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'urvashi.maganlal@directors.aegis.local', 'member', '1fc97cdd-ff84-4afa-8bca-3840eafb5847', '6857bc87-22ea-5dbf-a315-4b5f5c506b99'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('urvashi.maganlal@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_directors (id, full_name, email)
VALUES ('ce5ce151-e77c-5fa1-8bce-c980d6085f43', 'Willem Adolph Joubert', 'willem.adolph.joubert@directors.aegis.local')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = COALESCE(EXCLUDED.email, portal_directors.email), updated_at = now();
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('ce5ce151-e77c-5fa1-8bce-c980d6085f43', '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_director_accounts (director_id, account_id, title, is_primary)
VALUES ('ce5ce151-e77c-5fa1-8bce-c980d6085f43', 'b1111111-1111-4111-8111-111111111152', 'Director', true)
ON CONFLICT (director_id, account_id) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO portal_invites (account_id, email, role, branch_id, director_id)
SELECT '3a842763-e5f2-43f7-87c2-2a5429738fb3', 'willem.adolph.joubert@directors.aegis.local', 'member', '1fc97cdd-ff84-4afa-8bca-3840eafb5847', 'ce5ce151-e77c-5fa1-8bce-c980d6085f43'
WHERE NOT EXISTS (
  SELECT 1 FROM portal_invites WHERE lower(email) = lower('willem.adolph.joubert@directors.aegis.local') AND accepted_at IS NULL
);
INSERT INTO portal_policies (
  id, account_id, zoho_policy_id, policy_number, status, premium, inception_date, renewal_date,
  insurer, product_line, frequency, covered_items
) VALUES (
  'c2222222-2222-4222-8222-222222222313',
  'b1111111-1111-4111-8111-111111111152',
  'pi313688-rsum',
  'PI313688',
  'Active',
  1665,
  '2025-04-01',
  '2026-04-01',
  'RSUM',
  'Professional Indemnity (Pharmacists)',
  'Monthly',
  '[]'::jsonb
)
ON CONFLICT (id) DO UPDATE SET account_id = EXCLUDED.account_id, premium = EXCLUDED.premium;
COMMIT;