# aegis-employee-claim

Public employee claim portal API (WhatsApp OTP + submit).

Base: `https://<project>.supabase.co/functions/v1/aegis-employee-claim`

| Method | Path | Auth | Purpose |
|--------|------|------|---------|
| GET | `/resolve/:token` | anon | Resolve QR token → first name + masked WhatsApp |
| POST | `/otp/send` | anon | Send WhatsApp OTP (`{ token }`) |
| POST | `/otp/verify` | anon | Verify code → `session_token` |
| POST | `/upload-url` | `x-aegis-claim-session` | Signed upload for photos / voice |
| POST | `/submit` | `x-aegis-claim-session` | Create `portal_claims` with geo + photo_meta |

## Secrets

| Secret | Purpose |
|--------|---------|
| `TWILIO_ACCOUNT_SID` | Twilio account |
| `TWILIO_AUTH_TOKEN` | Twilio auth |
| `TWILIO_VERIFY_SERVICE_SID` | Prefer Verify WhatsApp channel |
| `TWILIO_WHATSAPP_FROM` | Fallback Messaging API sender (`whatsapp:+…`) |

Without Twilio, OTP is logged and returned as `dev_code` for local testing only.
