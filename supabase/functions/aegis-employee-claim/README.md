# aegis-employee-claim

Public employee claim portal API (WhatsApp OTP + item selection + submit + broker WhatsApp).

Base: `https://<project>.supabase.co/functions/v1/aegis-employee-claim`

| Method | Path | Auth | Purpose |
|--------|------|------|---------|
| GET | `/resolve/:token` | anon | Resolve QR token → first name + masked WhatsApp |
| POST | `/otp/send` | anon | Send WhatsApp OTP (`{ token }`) |
| POST | `/otp/verify` | anon | Verify code → `session_token` |
| GET/POST | `/items` | `x-aegis-claim-session` | List risk items assigned to the employee |
| POST | `/match-vehicle` | `x-aegis-claim-session` | Match plate text and/or licence disc image to schedule + policy |
| POST | `/upload-url` | `x-aegis-claim-session` | Signed upload for photos / voice |
| POST | `/submit` | `x-aegis-claim-session` | Create `portal_claims` (+ Zoho Claims best-effort) and WhatsApp broker |

## Secrets

| Secret | Purpose |
|--------|---------|
| `TWILIO_ACCOUNT_SID` | Twilio account |
| `TWILIO_AUTH_TOKEN` | Twilio auth |
| `TWILIO_VERIFY_SERVICE_SID` | Prefer Verify WhatsApp channel for OTP |
| `TWILIO_WHATSAPP_FROM` | Messaging API sender (`whatsapp:+…` / sandbox) for OTP fallback + broker notify |
| `BROKER_WHATSAPP_TO` | Broker WhatsApp destination (default `+27824567868`) |
| `VERIFYNOW_API_KEY` | Licence disc OCR for vehicle match |
| `ZOHO_*` | Optional Zoho Claims insert on submit |

Without Twilio, OTP is logged and returned as `dev_code` for local testing only.
