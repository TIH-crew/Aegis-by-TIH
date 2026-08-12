BEGIN;
DELETE FROM portal_pi_members WHERE policy_number = 'PI313688';
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '511d99a4-67ae-5a50-9165-c06f3232ddb3',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'M Parker',
  'Medipost Pharmacy',
  '9504120408085',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  6
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '2c2a5ca1-5c9e-5aae-a96a-628cb2031f5e',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'HA Latief',
  'Medipost Pharmacy',
  '9511305056084',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  7
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '7b00b103-a24d-52d1-ad21-240355e171d9',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'B Enslin',
  'Medipost Pharmacy',
  '8408180079086',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  8
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '24aeed33-0221-57a9-b285-11c7b1d64b07',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'T Nxusani',
  'Medipost Pharmacy',
  '0001041356088',
  null,
  null,
  null,
  84.7826087,
  650.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  9
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '0283719e-9d7d-5c86-b928-1f6689586d51',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'LL Davidson',
  'Medipost Pharmacy',
  '9109170203087',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  10
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'ae753c94-2256-5b30-a23e-55091269946c',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'ZA Tshisa',
  'Medipost Pharmacy',
  '9403211064081',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  11
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '74824933-c1ca-549d-98e4-9d956442ec5b',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'RH Wicks',
  'Medipost Pharmacy',
  '7905045069088',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  12
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'd99c4d9f-fb63-5cfa-be6b-d17b58de8fd9',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'SC Chukwuemeka',
  'Medipost Pharmacy',
  '8307300974186',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  13
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'd77a1dca-b958-52c2-a2ce-0f6450cd5162',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'L Anker',
  'Medipost Pharmacy',
  '9601300054083',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  14
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '56fd9541-49e8-5819-9d9a-8efaca87cfa0',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'M Ndobela',
  'Medipost Pharmacy',
  '9403310638082',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  15
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '75d5be35-9998-5d1b-aff9-7473f6940c9e',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'RM Farisani',
  'Medipost Pharmacy',
  '9012131126084',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  16
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b510a31a-2691-58da-9bff-c26f334292e1',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'L Didiza',
  'Medipost Pharmacy',
  '9705230033081',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  17
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5dae32d6-0a4d-55c3-bdc5-20966049344d',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'S Louwrens',
  'Medipost Pharmacy',
  '9311190044083',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  18
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3d584733-12a5-502e-a8a1-64c4a0732a99',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'RE Makhafola',
  'Medipost Pharmacy',
  '9711190037088',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  19
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c552c961-6401-5c4d-958a-aff193fedf61',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'MP Masemola',
  'Medipost Pharmacy',
  '9107270844081',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  20
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '6083a069-9762-511d-91d2-9b0c3258a0e6',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'P Cilliers',
  'Medipost Pharmacy',
  '9012315105086',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  21
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '156049cd-26de-5aff-8cbf-4d801b002b01',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'L Tsoamene Lontcih',
  'Medipost Pharmacy',
  '7504276148180',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  22
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '92185bea-0c60-5a74-99d6-998145fafcf4',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'JC du Preez',
  'Medipost Pharmacy',
  '9508070114080',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  23
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '42c30ea9-08d4-5c3d-8f99-2aae46b48364',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'C Ribeiro',
  'Medipost Pharmacy',
  '9501240138089',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  24
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'cd4eed61-ef43-5976-8932-12c120a6ec22',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'GM Janse van Rensburg',
  'Medipost Pharmacy',
  '6201190052082',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  25
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '89d99f72-5cfe-5dd7-b2e4-c48ad0daf4ec',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'MF Mashiya',
  'Medipost Pharmacy',
  '9505160695085',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  26
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c8b3836a-938c-5455-b3fe-4e935a3e69de',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Z Van den Berg',
  'Medipost Pharmacy',
  '9401190076084',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  27
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '27ca8f9c-0973-55c8-8b91-41621ac32df4',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'VC Baloyi',
  'Medipost Pharmacy',
  '9407110652086',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  28
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b8c05306-a011-5751-ade8-28ebcbc1e283',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'TN Gule',
  'Medipost Pharmacy',
  '9811140513087',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  29
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '277bb252-60b9-50ef-b6a4-b09160c44356',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'TP Maeko',
  'Medipost Pharmacy',
  '9904065575080',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  30
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f3ae865a-15b5-5e70-abb3-fff71c2caa45',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'S Xatasi',
  'Medipost Pharmacy',
  '0030605602708',
  null,
  null,
  null,
  84.7826087,
  650.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250108',
  31
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c6efc94b-69c2-50be-a7a1-02a3507a5723',
  'b1111111-1111-4111-8111-111111111147',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'BM Modise',
  'Kawari Wholesalers',
  '8711140409081',
  null,
  null,
  'P43315',
  367.826087,
  2820.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewed: 2025/03 - 2026/02',
  47
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '65944da5-de3e-50c5-a16e-7a489d33998f',
  'b1111111-1111-4111-8111-111111111147',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Marilise van Biljoen',
  'Kawari Wholesalers',
  '7801300131087',
  null,
  null,
  'P19314',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250301',
  48
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c3a999af-d70f-5c16-8ac8-79976c5ee1f4',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'W Stoltz',
  'Medipost Pharmacy',
  '0006145107089',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  '*New* Payment - 20250304',
  50
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '39b12e4d-9f92-5b6e-b73b-8168c6231f91',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'KJ Ndou',
  'Medipost Pharmacy',
  '8908095210080',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  '*New* Payment - 20250304',
  51
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f9db7b40-6e08-5298-aa10-efcb1a93abfd',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'SD Raman',
  'Medipost Pharmacy',
  '9912150375084',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  '*New* Payment - 20250304',
  52
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b50128ba-1db8-5dfe-a402-b055fda83151',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'HW Joubert',
  'Medipost Pharmacy',
  '6212300096083',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250304',
  53
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '56745e23-47e8-5dcc-adcc-11bf851a42fe',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'RM Kemm',
  'Medipost Pharmacy',
  '8111170127085',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  54
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '22a8351f-8fb9-5383-836a-c87973624e57',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'P Purazi',
  'Medipost Pharmacy',
  '8803296248189',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  55
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b432882a-4dcc-5213-b3b3-6239f4d93ca0',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'R Homu',
  'Medipost Pharmacy',
  '9205186025082',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  56
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5b5ad373-36cb-566a-818f-88a108cf5050',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'R Van Den Berg',
  'Medipost Pharmacy',
  '7705200074083',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  57
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'ef743a64-6c76-5bd7-9fd9-eebeb211260f',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'RA Rost',
  'Medipost Pharmacy',
  '6203020009084',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  58
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '912b8e32-d0c0-51a3-bce2-a00a1b7f6edf',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'S Kalan',
  'Medipost Pharmacy',
  '6809065221085',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renwal Payment - 20250304',
  59
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '1d13d774-2347-5dd4-b747-497578454d34',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'S Basadien',
  'Medipost Pharmacy',
  '9406280229089',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  60
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'a850fb7e-1178-5ff7-b12b-4cb05f08f20b',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'NP Stuurman',
  'Medipost Pharmacy',
  '9408210742082',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  61
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'e542bb01-318d-56f8-9c4a-4a13967bddc8',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'E Terblanche',
  'Medipost Pharmacy',
  '8207165049084',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  62
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '32522a1a-f9b3-522d-b5cc-2bd655b8391d',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'IM Luttig',
  'Medipost Pharmacy',
  '9305210282087',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  63
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '1fd17d45-5a69-5bb9-ac74-ea8b90975df8',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'A Busch',
  'Medipost Pharmacy',
  '8102220026088',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  64
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'ca1ad63a-4eec-5b93-9946-1f0ec9501aa7',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'B Bhatt',
  'Medipost Pharmacy',
  '9109170269088',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  65
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '668016df-a9d4-5884-a3a3-7efde4ffaecd',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'M Strover',
  'Medipost Pharmacy',
  '9606260034082',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  66
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '18a77fcb-9f7a-5946-86d1-0d1f39f825b3',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'B Van der Schyff',
  'Medipost Pharmacy',
  '9907200086087',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  67
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3144ab3d-bace-5075-8a4a-165d521c7216',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'M Smuts Walkinshaw',
  'Medipost Pharmacy',
  '9603070306081',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  68
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '27035dbb-6dc5-5f79-9bcf-1d64a970cef2',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'J Rossouw',
  'Medipost Pharmacy',
  '6111110058087',
  null,
  null,
  'PI313688',
  36.19565217,
  277.5,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  69
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3decf4b6-8225-549d-957c-1486e86e92ad',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'CF September',
  'Medipost Pharmacy',
  '9205110729080',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  70
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c1beb2f0-12c4-50dc-b572-2b8194db87ca',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'ME Mphe',
  'Medipost Pharmacy',
  '8309230943083',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  71
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b3e9170b-f220-5489-97c9-ab10a6035a86',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'JG Nwandula',
  'Medipost Pharmacy',
  '8803265559087',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  72
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '2b97174e-32eb-5907-9d05-333e101db41a',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'MB Mphaho',
  'Medipost Pharmacy',
  '9510015145088',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  73
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '41849443-0581-5713-85fd-9273e63e080d',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'CM Kasongo',
  'Medipost Pharmacy',
  '8506041608181',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  74
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5dbf3695-6c2c-5345-8905-19efd8d35f53',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'M Dreyer',
  'Medipost Pharmacy',
  '8402160039087',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  75
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '9be5e62b-45e1-5353-b831-1084eb2f77fc',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'LB Mulabisana',
  'Medipost Pharmacy',
  '9010195930086',
  null,
  null,
  'PI313688',
  367.826087,
  2820.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  76
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'e456b506-dd3d-5e79-974c-c0788df10da1',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'KM Makura',
  'Medipost Pharmacy',
  '9309026459186',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  77
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '0cde4303-1648-5632-a29c-905b35a05fb6',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'LS Van Heerden',
  'Medipost Pharmacy',
  '6609050033085',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  78
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b7225dde-158a-5bcd-b083-993b228a609c',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'L Schutte',
  'Medipost Pharmacy',
  '8405070113082',
  null,
  null,
  'PI313688',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  79
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '0f09e707-bce1-5de9-9503-55118e4abc14',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'K Motau',
  'Medipost Pharmacy',
  '0107260233088',
  null,
  null,
  null,
  84.7826087,
  650.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250225',
  90
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '18361a71-fb76-55dc-a854-cd597ec46f7a',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'PL Makokoe',
  'Medipost Pharmacy',
  '9709050452082',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250205',
  91
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '7d5e74f2-596d-5d5b-b5ec-237130fb3d0e',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'MJ Maduane',
  'Medipost Pharmacy',
  '9509300486082',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250205',
  92
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5a2c4a62-2542-52e8-a5ca-1563ca7492c8',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'H Stoppel',
  'Medipost Pharmacy',
  '9904290047087',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250205',
  93
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'ee9868b0-77db-5e40-8289-85cfe349d638',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'X Mboweni',
  'Medipost Pharmacy',
  '9707040928088',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  94
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5196d6e3-2c53-59c7-9515-c01da63d6f08',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'LW Ramokgola',
  'Medipost Pharmacy',
  '9712060677081',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  95
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'beae9a38-0cbd-5269-8216-1de4ee9bd8bc',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'MT Ngidi',
  'Medipost Pharmacy',
  '9404050707087',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  96
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '1c4254c5-c4eb-563b-9ee2-53d8651c78d0',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'ST Malele',
  'Medipost Pharmacy',
  '9805220475084',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  97
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f3949849-67b1-54a4-a2be-2ffdcd74d323',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'S Ndadana',
  'Medipost Pharmacy',
  '9806200578087',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  98
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '6467c4cc-5497-5eca-a7f5-e019c49c5e86',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'SP Horstmann',
  'Medipost Pharmacy',
  '8305305075082',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  99
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3e775adf-d3e9-5122-bcc1-7e587023be5e',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'G Boulenoue Foka',
  'Medipost Pharmacy',
  '8710161167180',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  100
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '85fd7b84-3140-5400-8959-db90b1e76a18',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'LTL Modiba',
  'Medipost Pharmacy',
  '9407040443085',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  101
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'a5ee86e2-0e80-5d77-a666-3be4679f0ba2',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'M Horstmann',
  'Medipost Pharmacy',
  '8507290008081',
  null,
  null,
  null,
  367.826087,
  2820.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250212',
  102
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c00f7de6-bbef-5807-b647-645ef2a1c88a',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'MB Mabuza',
  'Medipost Pharmacy',
  '9312225872084',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  103
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'dd3acc9c-02a5-5d9d-8eec-2abef0ae3dd2',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'SHK Biscuitwala',
  'Medipost Pharmacy',
  '9104196322185',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  104
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '85b34fec-05b5-586b-b163-38ac3917a7fb',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'T Mukuddem',
  'Medipost Pharmacy',
  '0104100254085',
  null,
  null,
  null,
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Renewal Payment - 20250210',
  105
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '2ecbc11c-5c02-5b5b-a956-388009277c1d',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Allen Pheeha',
  'Medipost Pharmacy',
  '9812095515085',
  'allen.pheeha@gmail.com',
  '0726771688',
  'P29891',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/03/31',
  110
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '9c1c4b4f-e559-5f5e-a744-3beeed366e86',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Angel Mahlulo',
  'Medipost Pharmacy',
  '9803110139084',
  'angelthatomahlulo@gmail.com',
  '0634941239',
  'P55451',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/05/02',
  111
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f7688213-e9d7-5879-816e-f4da4804b2b5',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Bongusmusa Mbetho',
  'Medipost Pharmacy',
  '9810305582085',
  'musambetho@gmail.com',
  '0797497909',
  'P55023',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/05',
  112
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'a1feb050-fe6a-52d2-bbca-6658c48c6160',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Dune Olivier',
  'Medipost Pharmacy',
  '9807210226089',
  'olivierdune111@gmail.com',
  '0727812634',
  'P54806',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/03/31',
  113
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '57ca441b-718b-5787-9a53-0fa735c2dcf5',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Elmien Visser',
  'Medipost Pharmacy',
  '6312090082085',
  'visserelmien@gmail.com',
  '0798984060',
  'P02430',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/05',
  114
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '58ff413a-1c2a-5c75-92d3-589785c0df15',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Given Godwin',
  'Medipost Pharmacy',
  '7905255438080',
  'givengerry@gmail.com',
  '0839551219',
  'P21960',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/05/02',
  115
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'e5477928-5f58-5b84-acf9-1c4d97966c99',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Gontse Rametsi',
  'Medipost Pharmacy',
  '9207060297084',
  'gontserametsi@gmail.com',
  '0796011738',
  'P55472',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/25',
  116
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '63e0a2b1-769d-584c-b3fe-f2d5931165e3',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Ivan mashabane',
  'Medipost Pharmacy',
  '9503255523080',
  'modiegivan@gmail.com',
  '0649051537',
  'P50409',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/01',
  117
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '0795de90-2cf1-55b8-aeb2-6e81694f3686',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Joyce Botha',
  'Medipost Pharmacy',
  '7406250008085',
  'joyce.botha@medipost.co.za',
  '0124264000',
  'P16044',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/03/31',
  118
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '1ee3c28c-1709-5d31-9ae2-24c697956b5c',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Khalid Anthony',
  'Medipost Pharmacy',
  '0001125131084',
  'khalidanthony12@gmail.com',
  '0764488274',
  'P61608',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/02',
  119
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '9e25bfad-e38c-5f01-b3e4-11021c3fd3ba',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Louis Scheepers',
  'Medipost Pharmacy',
  '7104265031081',
  'louis@medipost.co.za',
  '0828000508',
  'P11158',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/01',
  120
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '47f5d43f-6d3e-5622-876e-8689b1f2bfb9',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Makhosi Mkwanazi',
  'Medipost Pharmacy',
  '9310160327080',
  'makhosinmkhwanazi@gmail.com',
  '0781134967',
  'P42193',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/03/31',
  121
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '300f97b2-7198-5e95-9e09-86d6978d8f2e',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Marilize Venter (Hatting)',
  'Medipost Pharmacy',
  '9102170055086',
  'life3@medipost.co.za',
  '0124264000',
  'P33711',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/05/09',
  122
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c7a81a8a-6e7d-5697-8b2e-fbafed9c0194',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Marizette Weldhagen',
  'Medipost Pharmacy',
  '8109250234086',
  'weldhagenm@gmail.com',
  '0829276340',
  'P18000',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/29',
  123
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b9e63b81-4c4a-5ec4-bfba-89dff9785937',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Mahdi Salmaan',
  'Medipost Pharmacy',
  '0007075537089',
  'salmaanmehdi7@gmail.com',
  '0714899915',
  'P61379',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/25',
  124
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '806652f5-5290-5155-b78e-daae4148bf6f',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Mia Pienaar',
  'Medipost Pharmacy',
  '7606270004085',
  'mvd527@mweb.co.za',
  '0833576109',
  'P17655',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/03/27',
  125
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '843687e8-66a4-511a-a594-0fb05a68b8ff',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Mlondi Shezi',
  'Medipost Pharmacy',
  '9401125867086',
  'qapharm@medipost.co.za',
  '0684032575',
  'P55377',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/05/07',
  126
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '933e3c2f-9919-5646-a945-ed5099296889',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Mokgadi Chilwane',
  'Medipost Pharmacy',
  '9605230163088',
  'kgadichilwane@gmail.com',
  '0605233471',
  'P52520',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/06',
  127
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'ac50e727-bcfb-537e-b244-e696d3bebb34',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Oneza Nofemela',
  'Medipost Pharmacy',
  '9208180849085',
  'oneza.nofemela@gmail.com',
  '0678471193',
  'P46748',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/06',
  128
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f16915d9-025f-5cf1-9c5c-a5e5ac578445',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Magretha Cooper',
  'Medipost Pharmacy',
  '7501260060082',
  'cooper.retha@gmail.com',
  '0829503996',
  'P17696',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/03/31',
  129
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '7fa75347-f344-5089-b567-8f5a2976ca77',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Sithuthukile Nxumalo',
  'Medipost Pharmacy',
  '0007140305082',
  'tononosthuh123@gmail.com',
  '0653845109',
  'P61718',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/05/05',
  130
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5e185a7a-f337-51fa-8270-eadca203f3ae',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Sonja Bekker',
  'Medipost Pharmacy',
  '7106170012080',
  'sonja.bekker17@gmail.com',
  '0832845230',
  'P00707',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/29',
  131
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '6188f3a1-43f9-5009-8e29-6f75b35a5f9b',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Tarika Gokar',
  'Medipost Pharmacy',
  '9906201304085',
  'tarikagokar99@gmail.com',
  '0814207691',
  'P55813',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/06',
  132
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'd560c7fc-0214-5bdb-9568-67df316f2b38',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Tlangelani Siwele',
  'Medipost Pharmacy',
  '8610230631085',
  'thsiwele@gmail.com',
  '0761714891',
  'P27334',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/24',
  133
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '820756f7-cea2-5d16-8955-ddc5cf5200f9',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Werner Berg',
  'Medipost Pharmacy',
  '9102125136080',
  'wernerberg2@gmail.com',
  '0792823111',
  'P43194',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/04/07',
  134
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f056178a-69ab-5db9-a6fa-f09adda19c75',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Aatiqah Collins-Ockhuizen',
  'Medipost Pharmacy',
  '9706080214086',
  'aatiqahc@gmail.com',
  '0716152741',
  'P52015',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/04',
  140
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3c9fdf76-f27d-5da0-9832-524351d8e46c',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Almaas Essop',
  'Medipost Pharmacy',
  '9808150245085',
  'almaas.essop@live.com',
  '0826673585',
  'P60914',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/03',
  141
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'c191b584-a496-58b5-bafd-9669576a9035',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Lucky Mailula',
  'Medipost Pharmacy',
  '9308205296088',
  'molobedu@gmail.com',
  '0662533220',
  'P48550',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/03',
  142
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '4e08bc2b-89ec-50fe-b547-0f085d9bdb4f',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Lukhanyo Lusiki',
  'Medipost Pharmacy',
  '0108265297086',
  'lusikilukhanyo@gmail.com',
  '0634452500',
  'P63696',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/02',
  143
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '9a6cc4e0-f51c-560f-9d8a-4749628ab085',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Mfezeko Mbenyana',
  'Medipost Pharmacy',
  '9512085687080',
  'mmbenyana131924@gmail.com',
  '0664156554',
  'P47879',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/10',
  144
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'e3daf33d-14f9-560c-a9f1-151829f8826e',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Minenhle Maluleke',
  'Medipost Pharmacy',
  '9807035670081',
  'minenhlemaluleke@gmail.com',
  '0827689728',
  'P56619',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/02',
  145
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'ef4ff29f-30da-51f1-9e13-1a37f1fa50b1',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Sameera Kumandan',
  'Medipost Pharmacy',
  '9803210291082',
  'sameera.kumandan@gmail.com',
  '0798354091',
  'P55830',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/04',
  146
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5bc3e366-7c9e-505c-a7b7-d04b68188936',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Shaista Moolagee',
  'Medipost Pharmacy',
  '9207260172087',
  'shaistamoolagee00@gmail.com',
  '0662153431',
  'P40703',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/10',
  147
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5cc3df29-974f-54c2-b012-e5eb4e733c0a',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Siza Phunzana',
  'Medipost Pharmacy',
  '9808275983085',
  'sizaphunzana@gmail.com',
  '0632160113',
  'P61011',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/02',
  148
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '898d385c-8a6e-5535-b474-2d77a8f01a11',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Thaakirah Handricks',
  'Medipost Pharmacy',
  '9903110187081',
  'thkrhhendricks@gmail.com',
  '0835765900',
  'P55812',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/02',
  149
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '609dc207-fe19-5fdd-a58f-6bff7e8740b9',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Thandumezi Moloi',
  'Medipost Pharmacy',
  '9704015679085',
  'mnhlanhla3@gmail.com',
  '0765368568',
  'P54735',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/05',
  150
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f0caca5b-531a-5081-951a-dd5ecfbbd5e7',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Thloleho Lekena',
  'Medipost Pharmacy',
  '9501095511083',
  'tlholehonature@gmail.com',
  '0791389647',
  'P52603',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/04',
  151
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '7a102efe-d348-5e9f-9a29-8753bbd29d63',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Ulrich Nolan',
  'Medipost Pharmacy',
  '0009195050084',
  'ulrich.nolan19@gmail.com',
  '0762837938',
  'P61275',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/02',
  152
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '637858d5-f5c2-539e-9f42-11aceaf8f624',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Werner Busch',
  'Medipost Pharmacy',
  '8210135259080',
  'werner@medilogistics.co.za',
  '0726076558',
  'P22996',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/10',
  153
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5ac7fe7d-aca7-5353-9d19-f7b4f43abc86',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Yvonne Natuze',
  'Medipost Pharmacy',
  '7711251213182',
  'ivonemizero@yahoo.com',
  '0780441397',
  'P43521',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/04',
  154
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '80bb1cca-919b-5f52-9f08-bbcb31967663',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Zerilda Joubert',
  'Medipost Pharmacy',
  '9203150223080',
  'zerilda.joubert@gmail.com',
  '0824364476',
  'P43205',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/06/05',
  155
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3549ec44-d94e-5b5e-99c8-65b7f5f20748',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Innocent Mabena',
  'Medipost Pharmacy',
  '9406225523083',
  'innovicent@gmail.com',
  '0837373947',
  'P54936',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/01',
  161
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '1e9549da-cb89-5dc5-b523-aaf0c40bc4d5',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Anneke Meyer (Scheepers)',
  'Medipost Pharmacy',
  '8107070015081',
  'awscheepers@gmail.com',
  '0798159774',
  'P21510',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/01',
  162
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'f7dfe588-690b-51df-90b4-acb37f6711e9',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Anna Elizabeth Janneke',
  'Medipost Pharmacy',
  '7703090084080',
  'life39@medipost.co.za',
  '0837554855',
  'P18526',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/02',
  163
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b1017125-8e70-51c2-9b75-ee7fdfbc17f5',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Aviwe Khenku',
  'Medipost Pharmacy',
  '9501100741087',
  null,
  null,
  'P52131',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/15',
  164
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'b19b8606-6251-569a-ab93-f3ae34f7c9a4',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Mmolo Isaac Selesho',
  'Medipost Pharmacy',
  '7203135313081',
  'seleshomi@gmail.com',
  '0761471012',
  'P44058',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/16',
  165
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  'd4761636-9be0-5782-bb5b-ccc37c04efaa',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Maria Magdalena Van Den Heever',
  'Medipost Pharmacy',
  '7708250017085',
  'lindiemmvdh@gmail.com',
  '0836875669',
  'P18467',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/13',
  166
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '3aba3b5c-34f8-5536-a231-f2bc16a27c28',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Raeesa Foflonker',
  'Medipost Pharmacy',
  '9311220207080',
  'raeesafofi@gmail.com',
  '0736003559',
  'P43448',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/04',
  167
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '10cec9f1-66c9-5e5d-a0bb-efa9da88728c',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Simisiwe Xouswa Shabalala',
  'Medipost Pharmacy',
  '9101180574082',
  'shabalalaSX@gmail.com',
  '0768984254',
  'P49695',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/17',
  168
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '6b401aa6-590d-5f9a-8630-3ef3fd9e8386',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Tshepo Athol Bale',
  'Medipost Pharmacy',
  '9105085901088',
  'atholtshepob@gmail.com',
  '0768536213',
  'P48509',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/02',
  169
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
INSERT INTO portal_pi_members (
  id, account_id, policy_id, policy_number, full_name, entity_name, id_number, email, phone,
  council_number, vat_amount, premium, payment_status, cover_year, cover_month, comments, source_row
) VALUES (
  '5066f253-41f4-5734-a441-8bbef009bcc6',
  'b1111111-1111-4111-8111-111111111152',
  'c2222222-2222-4222-8222-222222222313',
  'PI313688',
  'Veethendra Rajmohan Rampath',
  'Medipost Pharmacy',
  '7506245200083',
  'vijenrampath@gmail.com',
  '0834598302',
  'P16194',
  217.173913,
  1665.0,
  'Paid',
  2025,
  '2025-01-01'::date,
  'Received completed proposal form - 2025/07/15',
  170
)
ON CONFLICT (id) DO UPDATE SET
  premium = EXCLUDED.premium,
  payment_status = EXCLUDED.payment_status,
  vat_amount = EXCLUDED.vat_amount,
  comments = EXCLUDED.comments,
  updated_at = now();
COMMIT;