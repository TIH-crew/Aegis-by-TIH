-- Fix Medipost group company names (idempotent), plates, extensions, employees, branch coverage

BEGIN;

-- 1) Company names (match Zoho)
UPDATE portal_accounts SET name = 'Medipost FTRR&I', industry = coalesce(industry, 'Healthcare')
WHERE id = '3a842763-e5f2-43f7-87c2-2a5429738fb3';
UPDATE portal_accounts SET name = 'Kawari Wholesalers (Pty) Ltd', industry = 'Wholesale',
  registration_number = coalesce(nullif(registration_number,''), '2004/015737/07')
WHERE id = 'b1111111-1111-4111-8111-111111111147';
UPDATE portal_accounts SET name = 'Medilogistics FTRR&I', industry = 'Logistics',
  registration_number = coalesce(nullif(registration_number,''), '2011/129984/07')
WHERE id = 'b1111111-1111-4111-8111-111111111151';
UPDATE portal_accounts SET name = 'Medipost Pharmacy (HH Durrheim)', industry = 'Pharmacy',
  registration_number = coalesce(nullif(registration_number,''), '1997/011099/07')
WHERE id = 'b1111111-1111-4111-8111-111111111152';

-- 2) Extract SA number plates from Motor item names into zoho_fields.Registration_Number
UPDATE portal_risk_items
SET zoho_fields = coalesce(zoho_fields, '{}'::jsonb) || jsonb_build_object(
  'Registration_Number', upper((regexp_match(name, '([A-Z]{1,3}[0-9]{1,3}[A-Z]{1,3}[0-9]{0,3}GP)', 'i'))[1])
),
updated_at = now()
WHERE category = 'Motor'
  AND (zoho_fields->>'Registration_Number' IS NULL OR zoho_fields->>'Registration_Number' = '')
  AND name ~* '[A-Z]{1,3}[0-9]{1,3}[A-Z]{1,3}[0-9]{0,3}GP';

-- Forklifts / plant without plates: synthetic reg from asset_tag
UPDATE portal_risk_items
SET zoho_fields = coalesce(zoho_fields, '{}'::jsonb) || jsonb_build_object(
  'Registration_Number', 'FLT-' || upper(left(regexp_replace(coalesce(asset_tag, id::text), '[^A-Za-z0-9]', '', 'g'), 8))
),
updated_at = now()
WHERE category = 'Motor'
  AND (zoho_fields->>'Registration_Number' IS NULL OR zoho_fields->>'Registration_Number' = '');

-- 3) Dummy item extensions / add-ons by category (only where empty)
UPDATE portal_risk_items
SET item_extensions = CASE category
  WHEN 'Motor' THEN '[
    {"code":"windscreen","name":"Windscreen","description":"Glass cover"},
    {"code":"credit_shortfall","name":"Credit shortfall","description":"Difference between settlement and market value"},
    {"code":"car_hire","name":"Car hire","description":"Courtesy vehicle after loss"}
  ]'::jsonb
  WHEN 'Electronic Equipment' THEN '[
    {"code":"power_surge","name":"Power surge","description":"Electrical damage extension"},
    {"code":"theft","name":"Theft cover","description":"Theft following forcible entry"}
  ]'::jsonb
  WHEN 'Contents' THEN '[
    {"code":"theft_forcible","name":"Theft (forcible entry)","description":"Office contents theft"},
    {"code":"accidental_damage","name":"Accidental damage","description":"Accidental damage extension"}
  ]'::jsonb
  WHEN 'Building' THEN '[
    {"code":"special_perils","name":"Special perils","description":"Storm and water"},
    {"code":"subsidence","name":"Subsidence","description":"Subsidence and landslip"}
  ]'::jsonb
  WHEN 'Miscellaneous' THEN '[
    {"code":"all_risks","name":"All risks","description":"Specified all-risks cover"}
  ]'::jsonb
  WHEN 'Liability' THEN '[
    {"code":"public_liability","name":"Public liability","description":"Third-party liability"}
  ]'::jsonb
  ELSE '[
    {"code":"standard_cover","name":"Standard cover add-on","description":"Base section extension"}
  ]'::jsonb
END,
updated_at = now()
WHERE account_id IN (
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  'b1111111-1111-4111-8111-111111111147',
  'b1111111-1111-4111-8111-111111111151',
  'b1111111-1111-4111-8111-111111111152'
)
AND (item_extensions IS NULL OR item_extensions = '[]'::jsonb);

-- 4) Seed purchase_value from unit_cost where missing
UPDATE portal_risk_items
SET purchase_value = unit_cost,
    purchase_date = coalesce(record_date::date, current_date - (random() * 400)::int),
    updated_at = now()
WHERE purchase_value IS NULL AND unit_cost IS NOT NULL AND unit_cost > 0
  AND account_id IN (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'b1111111-1111-4111-8111-111111111147',
    'b1111111-1111-4111-8111-111111111151',
    'b1111111-1111-4111-8111-111111111152'
  );

-- Dummy invoices for a sample of assigned-ready items
UPDATE portal_risk_items
SET purchase_invoice_url = 'https://picsum.photos/seed/' || replace(id::text, '-', '') || '/800/1100',
    purchase_invoice_name = 'Invoice-' || left(coalesce(asset_tag, id::text), 12) || '.pdf',
    updated_at = now()
WHERE purchase_invoice_url IS NULL
  AND account_id IN (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'b1111111-1111-4111-8111-111111111147',
    'b1111111-1111-4111-8111-111111111151',
    'b1111111-1111-4111-8111-111111111152'
  );

-- Finance flags on ~15% of motor
UPDATE portal_risk_items
SET is_financed = true,
    finance_house = (ARRAY['WesBank','MFC','ABSA','FNB','Standard Bank'])[1 + (abs(hashtext(id::text)) % 5)],
    finance_account_number = 'FIN' || lpad((abs(hashtext(id::text)) % 1000000)::text, 6, '0'),
    finance_amount = round(unit_cost * 0.65, 2),
    updated_at = now()
WHERE category = 'Motor'
  AND account_id = 'b1111111-1111-4111-8111-111111111151'
  AND (abs(hashtext(id::text)) % 7) = 0;

-- 5) Distribute Kawari assets across Midrand / Cape Town branches
UPDATE portal_risk_items r
SET branch_id = CASE WHEN abs(hashtext(r.id::text)) % 2 = 0
  THEN 'c4444444-4444-4444-8444-444444444401' ELSE 'c4444444-4444-4444-8444-444444444402' END,
  branch = CASE WHEN abs(hashtext(r.id::text)) % 2 = 0 THEN 'Midrand' ELSE 'Cape Town' END,
  latitude = CASE WHEN abs(hashtext(r.id::text)) % 2 = 0 THEN -25.996 ELSE -33.8985 END,
  longitude = CASE WHEN abs(hashtext(r.id::text)) % 2 = 0 THEN 28.128 ELSE 18.5902 END,
  updated_at = now()
WHERE r.account_id = 'b1111111-1111-4111-8111-111111111147'
  AND (r.branch_id IS NULL OR r.branch_id NOT IN (
    'c4444444-4444-4444-8444-444444444401','c4444444-4444-4444-8444-444444444402'
  ));

-- 6) Employees for Kawari, Medilogistics, Pharmacy
INSERT INTO portal_employees (
  id, account_id, full_name, job_title, email, phone, whatsapp_number,
  employee_number, branch_id, status
) VALUES
  ('e5555555-5555-4555-8555-555555555501','b1111111-1111-4111-8111-111111111147','Thabo Molefe','Warehouse Manager','thabo.molefe@kawari.example','+27821230001','+27821230001','KW-001','c4444444-4444-4444-8444-444444444401','active'),
  ('e5555555-5555-4555-8555-555555555502','b1111111-1111-4111-8111-111111111147','Naledi Jacobs','Admin Clerk','naledi.jacobs@kawari.example','+27821230002','+27821230002','KW-002','c4444444-4444-4444-8444-444444444401','active'),
  ('e5555555-5555-4555-8555-555555555503','b1111111-1111-4111-8111-111111111147','Sipho Dlamini','Driver','sipho.dlamini@kawari.example','+27821230003','+27821230003','KW-003','c4444444-4444-4444-8444-444444444402','active'),
  ('e5555555-5555-4555-8555-555555555504','b1111111-1111-4111-8111-111111111147','Ayesha Khan','Operations Lead','ayesha.khan@kawari.example','+27821230004','+27821230004','KW-004','c4444444-4444-4444-8444-444444444402','active'),
  ('e5555555-5555-4555-8555-555555555511','b1111111-1111-4111-8111-111111111151','Johan Botha','Fleet Controller','johan.botha@medilogistics.example','+27821230101','+27821230101','ML-001','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555512','b1111111-1111-4111-8111-111111111151','Precious Nkosi','Dispatch Supervisor','precious.nkosi@medilogistics.example','+27821230102','+27821230102','ML-002','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555513','b1111111-1111-4111-8111-111111111151','Riaan van Wyk','Driver','riaan.vanwyk@medilogistics.example','+27821230103','+27821230103','ML-003','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555514','b1111111-1111-4111-8111-111111111151','Lindiwe Mokoena','Admin','lindiwe.mokoena@medilogistics.example','+27821230104','+27821230104','ML-004','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555521','b1111111-1111-4111-8111-111111111152','Hennie Durrheim','Pharmacist','hennie@pharmacy.example','+27821232001','+27821232001','PH-001','c4444444-4444-4444-8444-444444444404','active'),
  ('e5555555-5555-4555-8555-555555555522','b1111111-1111-4111-8111-111111111152','Carmen Pieterse','Dispensary Assistant','carmen@pharmacy.example','+27821232002','+27821232002','PH-002','c4444444-4444-4444-8444-444444444404','active'),
  ('e5555555-5555-4555-8555-555555555523','b1111111-1111-4111-8111-111111111152','Fatima Essop','Front Shop','fatima@pharmacy.example','+27821232003','+27821232003','PH-003','c4444444-4444-4444-8444-444444444404','active')
ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  job_title = EXCLUDED.job_title,
  branch_id = EXCLUDED.branch_id,
  status = 'active',
  updated_at = now();

-- Assign a portion of Kawari items to employees (keep ~1/3 assigned)
UPDATE portal_risk_items r
SET employee_id = CASE
  WHEN r.branch_id = 'c4444444-4444-4444-8444-444444444401'
    THEN (ARRAY['e5555555-5555-4555-8555-555555555501'::uuid,'e5555555-5555-4555-8555-555555555502'::uuid])[1 + (abs(hashtext(r.id::text)) % 2)]
  ELSE (ARRAY['e5555555-5555-4555-8555-555555555503'::uuid,'e5555555-5555-4555-8555-555555555504'::uuid])[1 + (abs(hashtext(r.id::text)) % 2)]
END,
assignment_status = 'assigned',
updated_at = now()
WHERE r.account_id = 'b1111111-1111-4111-8111-111111111147'
  AND (abs(hashtext(r.id::text)) % 3) = 0;

-- Assign every Medilogistics item to staff by role
UPDATE portal_risk_items r
SET
  employee_id = CASE
    WHEN r.category = 'Motor'
      AND (
        r.name ~* '(FRR|NMR|NPR|FAW|FORKLIFT|BENDI|CROWN|TRAILER|YAMAHA|YBR|SCORPION|CHALLENGER)'
        OR coalesce(r.insurance_section, '') ~* '(Heavy|Forklift|Trailer|Motor Cycle)'
        OR coalesce(r.zoho_fields->>'vehicle_type', '') ~* '(Heavy|Forklift|Trailer|Motor Cycle)'
      )
      THEN 'e5555555-5555-4555-8555-555555555511'::uuid
    WHEN r.category = 'Motor'
      THEN (ARRAY[
        'e5555555-5555-4555-8555-555555555511'::uuid,
        'e5555555-5555-4555-8555-555555555513'::uuid
      ])[1 + (abs(hashtext(r.id::text)) % 2)]
    WHEN r.category = 'Electronic Equipment'
      THEN 'e5555555-5555-4555-8555-555555555514'::uuid
    WHEN r.category IN ('Building', 'Contents', 'Liability')
      OR r.insurance_section IN ('Fire', 'Office Contents', 'Public Liability', 'Accidental Damage')
      THEN 'e5555555-5555-4555-8555-555555555512'::uuid
    ELSE 'e5555555-5555-4555-8555-555555555514'::uuid
  END,
  assignment_status = 'assigned',
  updated_at = now()
WHERE r.account_id = 'b1111111-1111-4111-8111-111111111151';

UPDATE portal_risk_items r
SET employee_name = e.full_name
FROM portal_employees e
WHERE r.employee_id = e.id AND (r.employee_name IS NULL OR r.employee_name <> e.full_name);

-- 7) Pharmacy sample assets
INSERT INTO portal_risk_items (
  id, account_id, zoho_risk_id, name, category, insurance_section, unit_cost, repair_cost,
  asset_tag, branch_id, branch, latitude, longitude, insurance_status, assignment_status,
  employee_id, employee_name, item_extensions, purchase_value, purchase_invoice_url, purchase_invoice_name,
  zoho_fields
) VALUES
  ('a6666666-6666-4666-8666-666666666601','b1111111-1111-4111-8111-111111111152','pharm-asset-001','Pharmacy POS terminal & scanner','Electronic Equipment','Electronic Equipment',18500,0,'PH-POS-001','c4444444-4444-4444-8444-444444444404','Gezina',-25.7205,28.2055,'Insured with us','assigned','e5555555-5555-4555-8555-555555555522','Carmen Pieterse','[{"code":"power_surge","name":"Power surge"}]'::jsonb,18500,'https://picsum.photos/seed/pharm1/800/1100','Invoice-PH-POS-001.pdf','{"Item_Value":18500,"Policy_Number":"PI313688"}'::jsonb),
  ('a6666666-6666-4666-8666-666666666602','b1111111-1111-4111-8111-111111111152','pharm-asset-002','Dispensary refrigerator','Electronic Equipment','Electronic Equipment',42000,0,'PH-FRIDGE-01','c4444444-4444-4444-8444-444444444404','Gezina',-25.7205,28.2055,'Insured with us','assigned','e5555555-5555-4555-8555-555555555521','Hennie Durrheim','[{"code":"power_surge","name":"Power surge"}]'::jsonb,42000,'https://picsum.photos/seed/pharm2/800/1100','Invoice-PH-FRIDGE.pdf','{"Item_Value":42000,"Policy_Number":"PI313688"}'::jsonb),
  ('a6666666-6666-4666-8666-666666666603','b1111111-1111-4111-8111-111111111152','pharm-asset-003','Front-shop shelving & counters','Contents','Contents',65000,0,'PH-CONT-01','c4444444-4444-4444-8444-444444444404','Gezina',-25.7205,28.2055,'Insured with us','unassigned',null,null,'[{"code":"theft_forcible","name":"Theft (forcible entry)"}]'::jsonb,65000,'https://picsum.photos/seed/pharm3/800/1100','Invoice-PH-CONT.pdf','{"Item_Value":65000,"Policy_Number":"PI313688"}'::jsonb),
  ('a6666666-6666-4666-8666-666666666604','b1111111-1111-4111-8111-111111111152','pharm-asset-004','Laptop - pharmacist workstation','Electronic Equipment','Electronic Equipment',14500,0,'PH-LAP-01','c4444444-4444-4444-8444-444444444404','Gezina',-25.7205,28.2055,'Insured with us','assigned','e5555555-5555-4555-8555-555555555521','Hennie Durrheim','[{"code":"theft","name":"Theft cover"}]'::jsonb,14500,'https://picsum.photos/seed/pharm4/800/1100','Invoice-PH-LAP.pdf','{"Item_Value":14500,"Policy_Number":"PI313688"}'::jsonb),
  ('a6666666-6666-4666-8666-666666666605','b1111111-1111-4111-8111-111111111152','pharm-asset-005','CCTV system - Gezina pharmacy','Electronic Equipment','Electronic Equipment',28000,0,'PH-CCTV-01','c4444444-4444-4444-8444-444444444404','Gezina',-25.7205,28.2055,'Insured with us','unassigned',null,null,'[{"code":"power_surge","name":"Power surge"}]'::jsonb,28000,'https://picsum.photos/seed/pharm5/800/1100','Invoice-PH-CCTV.pdf','{"Item_Value":28000,"Policy_Number":"PI313688"}'::jsonb)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  unit_cost = EXCLUDED.unit_cost,
  branch_id = EXCLUDED.branch_id,
  employee_id = EXCLUDED.employee_id,
  item_extensions = EXCLUDED.item_extensions,
  purchase_value = EXCLUDED.purchase_value,
  updated_at = now();

-- 8) Spread Head Office Medipost assets onto empty regional branches (3 each)
WITH empty_branches AS (
  SELECT b.id, b.name, b.latitude, b.longitude, row_number() OVER (ORDER BY b.name) AS rn
  FROM portal_branches b
  WHERE b.account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
    AND NOT EXISTS (SELECT 1 FROM portal_risk_items r WHERE r.branch_id = b.id)
),
ho AS (
  SELECT id FROM portal_branches
  WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3' AND name = 'Head Office'
  LIMIT 1
),
candidates AS (
  SELECT r.id, row_number() OVER (ORDER BY r.updated_at DESC NULLS LAST, r.id) AS rn
  FROM portal_risk_items r
  JOIN ho ON r.branch_id = ho.id
  WHERE r.account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
),
assign AS (
  SELECT c.id AS risk_id, e.id AS branch_id, e.name AS branch_name, e.latitude, e.longitude
  FROM candidates c
  JOIN empty_branches e ON ((c.rn - 1) % (SELECT count(*) FROM empty_branches)) + 1 = e.rn
  WHERE c.rn <= (SELECT count(*) * 3 FROM empty_branches)
)
UPDATE portal_risk_items r
SET branch_id = a.branch_id,
    branch = a.branch_name,
    latitude = a.latitude,
    longitude = a.longitude,
    updated_at = now()
FROM assign a
WHERE r.id = a.risk_id;

WITH targets AS (
  SELECT r.id AS risk_id, e.id AS employee_id, e.full_name,
         row_number() OVER (PARTITION BY r.branch_id ORDER BY r.id) AS rn
  FROM portal_risk_items r
  JOIN portal_employees e ON e.branch_id = r.branch_id AND e.status = 'active'
  WHERE r.account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
    AND r.employee_id IS NULL
    AND r.branch_id IS NOT NULL
)
UPDATE portal_risk_items r
SET employee_id = t.employee_id,
    employee_name = t.full_name,
    assignment_status = 'assigned',
    updated_at = now()
FROM targets t
WHERE r.id = t.risk_id AND t.rn = 1;

COMMIT;
