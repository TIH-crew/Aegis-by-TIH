CREATE TEMP TABLE IF NOT EXISTS _seed_covered_items (
  ord int primary key,
  payload jsonb not null
);
TRUNCATE _seed_covered_items;