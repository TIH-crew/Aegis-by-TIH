# ASSETS fixed-asset accounting & ZA tax foundation

## Inspection summary (pre-implementation)

- Insurance portal tables (`portal_risk_items`, policies, claims, employees) remain the source of truth for **insurance**.
- There was **no** depreciation, GL, tax register, or movements ledger in the database.
- `portal_risk_items.unit_cost` is a **schedule / declared** figure — never acquisition cost, NBV, or tax value.
- Tenant scoping uses `current_account_ids()`; branch scoping for risk items is application-layer.

## Migration

Apply:

`supabase/migrations/20260929_fixed_asset_accounting.sql`

Creates `aam_*` tables (assets, acquisitions, movements, book policies/schedules, tax rules/positions/schedules, VAT treatments, insurance links, GL, reconciliations, close periods, documents, approvals, audit) with RLS on `current_account_ids()`.

Seeds **draft** ZA tax rule templates (`s11(e)`, motor W&T candidate, VAT motor-car restriction) with SARS source URLs. Templates must be **approved** before any claim proposal.

### Linking strategy (safe)

| Case | Approach |
|------|----------|
| Company-owned fixed asset | `aam_assets` with `capitalised_cost` from approved acquisition; optional `portal_risk_item_id` |
| Insurance-only / third-party | `ownership_type = insurance_only`, **null** capitalised cost; link via `aam_insurance_links` |
| Existing risk items | Do **not** bulk-capitalise; use `registerInsuranceOnlyFromRiskItem` or full acquisition flow |

## Domain engines (pure, tested)

| Module | Path |
|--------|------|
| Money (Decimal.js) | `src/domain/money.ts` |
| Straight-line book | `src/domain/book/straight-line.ts` |
| Tax proposals | `src/domain/tax/tax-engine.ts` |
| Recon / insurance match | `src/domain/reconciliation/engines.ts` |

Run: `npm test`

## Vertical slice API

`src/services/asset-ledger.service.ts`

1. `createAcquisition` → classify lines (never silent capitalise)
2. `submitAcquisitionForApproval` / `approveAcquisition`
3. `capitaliseAcquisitionLine` → asset tag, book policy, tax position (`needs_tax_classification`), insurance review movement
4. `runDraftDepreciation` → immutable draft schedule lines + journal preview
5. `importGlBatch` / `gl-import.adapter.ts` CSV → idempotent `dedupe_key`
6. `runSubledgerGlRecon` → exceptions with tolerance
7. `proposeTaxForAsset` → provisional only; double-claim guard
8. `proposeInsuranceMatches` → exact IDs only auto-insert; fuzzy = proposed for review
9. Disposal types exist on `aam_asset_movements`; tax disposal review is status-driven (no auto tax conclusion)

## Roles

Table `aam_portal_roles` supports: `client_viewer`, `asset_manager`, `finance_preparer`, `finance_approver`, `tax_reviewer`, `insurance_broker`, `auditor`, `platform_admin`.

UI RBAC still maps portal admin → full access; enforce preparer vs approver separation in services/approvals table as you wire role checks.

## UI

- **Finance** / **Tax** pages load live `aam_*` data when migration is applied; otherwise show an apply-migration message.
- Values are labelled; NBV only after schedule runs; insured value stays on insurance links / risk items.

## Remaining external dependencies

- Live accounting connectors (Xero/Sage/SAP) — CSV adapter only today
- Reducing-balance & units-of-production book methods (engine designed for extension)
- Full SARS life-table import as approved config rows
- ITR14 / VAT201 submission — **not** claimed
- Server-side RPC enforcement of finance_approver vs preparer (table ready; wire checks next)
