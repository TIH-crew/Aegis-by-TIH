WITH aggregated AS (
  SELECT jsonb_agg(payload ORDER BY ord) AS items FROM _seed_covered_items
)
UPDATE public.portal_policies p
SET covered_items = aggregated.items, updated_at = now()
FROM aggregated
WHERE p.id = 'b2222222-2222-4222-8222-222222222248';

INSERT INTO public.portal_policies (
  id, account_id, zoho_policy_id, policy_number, insurer_policy_number, status, premium,
  sasria_premium, fee_premium, inception_date, renewal_date, insurer, product_line,
  frequency, covered_items
)
SELECT
  'c2222222-2222-4222-8222-222222222248',
  '3a842763-e5f2-43f7-87c2-2a5429738fb3',
  'nimbis-policy-15786-medipost',
  'B00000048',
  'GC2895315',
  'Active',
  24174.625688,
  144.538825,
  95.65,
  '2025-07-01',
  '2026-09-01',
  'Bryte Insurance Company South Africa',
  'Bryte Commercial (Kolonie)',
  'Monthly',
  aggregated.items
FROM (
  SELECT jsonb_agg(payload ORDER BY ord) AS items FROM _seed_covered_items
) aggregated
ON CONFLICT (id) DO UPDATE SET
  account_id = EXCLUDED.account_id,
  zoho_policy_id = EXCLUDED.zoho_policy_id,
  policy_number = EXCLUDED.policy_number,
  insurer_policy_number = EXCLUDED.insurer_policy_number,
  status = EXCLUDED.status,
  premium = EXCLUDED.premium,
  sasria_premium = EXCLUDED.sasria_premium,
  fee_premium = EXCLUDED.fee_premium,
  inception_date = EXCLUDED.inception_date,
  renewal_date = EXCLUDED.renewal_date,
  insurer = EXCLUDED.insurer,
  product_line = EXCLUDED.product_line,
  frequency = EXCLUDED.frequency,
  covered_items = EXCLUDED.covered_items,
  updated_at = now();