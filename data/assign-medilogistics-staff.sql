-- Assign every Medilogistics (B00000050) risk item to a staff member by role.
-- Johan Botha  — Fleet Controller: HCV / forklift / trailer / motorcycle + half of remaining motor
-- Riaan van Wyk — Driver: remaining motor (round-robin with Johan)
-- Precious Nkosi — Dispatch Supervisor: buildings, contents, liability, accidental damage
-- Lindiwe Mokoena — Admin: electronic equipment + business all risks / other miscellaneous

BEGIN;

INSERT INTO portal_employees (
  id, account_id, full_name, job_title, email, phone, whatsapp_number, employee_number, branch_id, status
) VALUES
  ('e5555555-5555-4555-8555-555555555511','b1111111-1111-4111-8111-111111111151','Johan Botha','Fleet Controller','johan.botha@medilogistics.example','+27821230101','+27821230101','ML-001','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555512','b1111111-1111-4111-8111-111111111151','Precious Nkosi','Dispatch Supervisor','precious.nkosi@medilogistics.example','+27821230102','+27821230102','ML-002','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555513','b1111111-1111-4111-8111-111111111151','Riaan van Wyk','Driver','riaan.vanwyk@medilogistics.example','+27821230103','+27821230103','ML-003','c4444444-4444-4444-8444-444444444403','active'),
  ('e5555555-5555-4555-8555-555555555514','b1111111-1111-4111-8111-111111111151','Lindiwe Mokoena','Admin','lindiwe.mokoena@medilogistics.example','+27821230104','+27821230104','ML-004','c4444444-4444-4444-8444-444444444403','active')
ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  job_title = EXCLUDED.job_title,
  branch_id = EXCLUDED.branch_id,
  status = 'active',
  updated_at = now();

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
WHERE r.employee_id = e.id
  AND r.account_id = 'b1111111-1111-4111-8111-111111111151';

COMMIT;

SELECT
  coalesce(r.employee_name, '(none)') AS assigned_to,
  r.category,
  count(*) AS items
FROM portal_risk_items r
WHERE r.account_id = 'b1111111-1111-4111-8111-111111111151'
GROUP BY 1, 2
ORDER BY 1, 2;
