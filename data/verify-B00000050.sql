SELECT a.name AS account, a.id AS account_id,
  p.policy_number, p.insurer, p.product_line, p.status,
  jsonb_array_length(p.covered_items) AS covered_items_count,
  (SELECT COUNT(*) FROM portal_risk_items r WHERE r.account_id = a.id) AS risk_items_count
FROM portal_accounts a
JOIN portal_policies p ON p.account_id = a.id
WHERE p.policy_number = 'B00000050';

SELECT category, insurance_section, COUNT(*) AS n
FROM portal_risk_items
WHERE account_id = 'b1111111-1111-4111-8111-111111111150'
GROUP BY 1, 2
ORDER BY 1, 2;

SELECT
  COUNT(*) FILTER (WHERE (ci->>'risk_item_id') IS NOT NULL AND (ci->>'risk_item_id') <> '') AS with_risk_item_id,
  COUNT(*) FILTER (WHERE EXISTS (
    SELECT 1 FROM portal_risk_items r
    WHERE r.id::text = ci->>'risk_item_id'
      AND r.account_id = 'b1111111-1111-4111-8111-111111111150'
  )) AS linked_to_existing_risk,
  COUNT(*) AS total_covered
FROM portal_policies p,
LATERAL jsonb_array_elements(p.covered_items) ci
WHERE p.policy_number = 'B00000050';
