-- Fix subsidiary account names + reassign Medilogistics (B00000050) ownership

BEGIN;

-- 1) Restore correct company names / metadata
UPDATE portal_accounts
SET
  name = 'Kawari Wholesalers (Pty) Ltd',
  industry = 'Wholesale',
  registration_number = coalesce(registration_number, '2004/015737/07'),
  zoho_account_id = coalesce(zoho_account_id, '7351644000003979001')
WHERE id = 'b1111111-1111-4111-8111-111111111147';

UPDATE portal_accounts
SET
  name = 'Medilogistics FTRR&I',
  industry = 'Logistics',
  registration_number = coalesce(registration_number, '2011/129984/07'),
  zoho_account_id = coalesce(zoho_account_id, '7351644000003987001'),
  parent_account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  aegis_status = 'active'
WHERE id = 'b1111111-1111-4111-8111-111111111151';

UPDATE portal_accounts
SET
  name = 'Medipost Pharmacy (HH Durrheim)',
  industry = 'Pharmacy',
  registration_number = coalesce(registration_number, '1997/011099/07'),
  zoho_account_id = coalesce(zoho_account_id, '7351644000003987002'),
  parent_account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  aegis_status = 'active'
WHERE id = 'b1111111-1111-4111-8111-111111111152';

-- Ensure Medilogistics head-office branch exists
INSERT INTO portal_branches (id, account_id, name, address, latitude, longitude)
VALUES (
  'c4444444-4444-4444-8444-444444444403',
  'b1111111-1111-4111-8111-111111111151',
  'Head Office',
  'Gezina City Centre, 593 Nico Smith Street, Gezina, Pretoria, Gauteng, 0002',
  -25.7205,
  28.2055
)
ON CONFLICT (id) DO UPDATE SET
  account_id = EXCLUDED.account_id,
  name = EXCLUDED.name,
  address = EXCLUDED.address,
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude;

-- 2) Move B00000050 risk items from Medipost parent → Medilogistics
UPDATE portal_risk_items
SET
  account_id = 'b1111111-1111-4111-8111-111111111151',
  branch_id = 'c4444444-4444-4444-8444-444444444403',
  branch = 'Head Office',
  latitude = -25.7205,
  longitude = 28.2055,
  updated_at = now()
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
  AND zoho_fields->>'policy_number' = 'B00000050';

-- 3) Move parent copy of B00000050 policy onto Medilogistics (keep one canonical policy)
UPDATE portal_policies
SET account_id = 'b1111111-1111-4111-8111-111111111151'
WHERE id = 'd3333333-3333-4333-8333-333333333350'
  AND policy_number = 'B00000050';

-- If no row updated (id differs), upsert by moving any Medipost-owned B00000050
UPDATE portal_policies
SET account_id = 'b1111111-1111-4111-8111-111111111151'
WHERE account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3'
  AND policy_number = 'B00000050';

-- 4) Point covered_items risk_item_id account ownership is already via items;
--    refresh director home accounts that should be Medilogistics (already correct for Louis etc.)

COMMIT;

-- Verification
SELECT a.name, count(r.*)::int AS items,
       round(sum(coalesce(r.unit_cost,0))::numeric, 2) AS value
FROM portal_accounts a
LEFT JOIN portal_risk_items r ON r.account_id = a.id
WHERE a.id IN (
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  'b1111111-1111-4111-8111-111111111147',
  'b1111111-1111-4111-8111-111111111151',
  'b1111111-1111-4111-8111-111111111152'
)
GROUP BY a.name
ORDER BY items DESC;

SELECT id::text, account_id::text, policy_number, premium
FROM portal_policies
WHERE policy_number = 'B00000050'
ORDER BY account_id::text;
