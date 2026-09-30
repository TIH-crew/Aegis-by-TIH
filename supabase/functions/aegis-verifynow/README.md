# aegis-verifynow

Proxy for VerifyNow.co.za. **Drivers licence barcode verification only.**

Vehicle licence-disc scan and number-plate lookup have been **retired** (HTTP 410). Enter motor asset details manually in the portal.

## Endpoints

| Method | Path | Status |
|--------|------|--------|
| POST | `/aegis-verifynow/drivers-licence` | Active |
| POST | `/aegis-verifynow/vehicle` | Retired (410) |
| POST | `/aegis-verifynow/vehicle-licence-disc` | Retired (410) |
| GET | `/aegis-verifynow/health` | Active |

## Secrets

```bash
supabase secrets set VERIFYNOW_API_KEY=vn_live_...
```
