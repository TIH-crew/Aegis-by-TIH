# Finance & Tax integration

See **`docs/asset-accounting.md`** for the implemented schema, engines, vertical slice, and tests.

## Live vs pending

| Capability | Status |
|------------|--------|
| Acquisition → capitalisation → book schedule → journal preview | Implemented in `asset-ledger.service.ts` |
| GL CSV import (idempotent) | Implemented in `gl-import.adapter.ts` |
| Subledger ↔ GL reconciliation | Implemented |
| ZA tax rule templates + provisional proposals | Implemented (draft until approved) |
| Live ERP connectors / ITR14 submit | Not implemented — do not claim |

Never fabricate NBV, journals, or SARS allowances in the UI.
