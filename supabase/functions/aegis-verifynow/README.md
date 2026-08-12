# Proxy for VerifyNow.co.za (drivers licence, licence disc, number plate / vehicle lookup).

POST /aegis-verifynow/drivers-licence
POST /aegis-verifynow/vehicle-licence-disc
POST /aegis-verifynow/vehicle   (number plate lookup)

Requires Authorization: Bearer <portal user JWT>.

Set secret:
  supabase secrets set VERIFYNOW_API_KEY=vn_live_...
