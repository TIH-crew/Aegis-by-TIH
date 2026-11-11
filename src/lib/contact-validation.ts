/** Shared claim / contact validation helpers (no secrets). */

/** Usable WhatsApp / mobile for OTP — digits only length after normalize. */
export function normalizeWhatsAppNumber(raw: string | null | undefined): string | null {
  if (!raw?.trim()) return null
  const digits = raw.replace(/[^\d+]/g, '')
  if (!digits) return null
  let e164 = digits
  if (digits.startsWith('+')) e164 = digits
  else if (digits.startsWith('0') && digits.length >= 10) e164 = `+27${digits.slice(1)}`
  else if (digits.startsWith('27')) e164 = `+${digits}`
  else e164 = digits.startsWith('+') ? digits : `+${digits}`

  const numeric = e164.replace(/\D/g, '')
  // E.164 mobile-ish: country + subscriber, typically 10–15 digits
  if (numeric.length < 10 || numeric.length > 15) return null
  return e164
}

export function employeeHasClaimWhatsApp(whatsapp: string | null | undefined): boolean {
  return normalizeWhatsAppNumber(whatsapp) != null
}

export function assertClaimWhatsApp(whatsapp: string | null | undefined): string {
  const wa = normalizeWhatsAppNumber(whatsapp)
  if (!wa) {
    throw new Error(
      'This employee has no usable WhatsApp number. Add a mobile number before sending claim OTP.',
    )
  }
  return wa
}
