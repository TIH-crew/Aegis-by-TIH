/** Dummy emergency roadside / assist providers by area (SA). Replace with live panel later. */
export interface RoadsideProvider {
  id: string
  name: string
  area: string
  phone: string
  whatsapp?: string
  hours: string
  notes: string
}

export const ROADSIDE_PROVIDERS: RoadsideProvider[] = [
  {
    id: 'gauteng-north',
    name: 'Highveld Road Rescue',
    area: 'Gauteng North (Pretoria / Centurion)',
    phone: '+27 12 555 0140',
    whatsapp: '+27125550140',
    hours: '24/7',
    notes: 'Tow, jump-start, flat tyre, lockout.',
  },
  {
    id: 'gauteng-south',
    name: 'Joburg Assist Network',
    area: 'Gauteng South (Johannesburg / East Rand)',
    phone: '+27 11 555 0288',
    whatsapp: '+27115550288',
    hours: '24/7',
    notes: 'Light & commercial tow; accident scene standby.',
  },
  {
    id: 'western-cape',
    name: 'Cape Route Assist',
    area: 'Western Cape (Cape Town / Helderberg)',
    phone: '+27 21 555 0633',
    whatsapp: '+27215550633',
    hours: '24/7',
    notes: 'N1 / N2 corridor coverage; mountain pass recovery.',
  },
  {
    id: 'kwazulu-natal',
    name: 'Coastal Highway Assist',
    area: 'KwaZulu-Natal (Durban / Pinetown)',
    phone: '+27 31 555 0199',
    whatsapp: '+27315550199',
    hours: '24/7',
    notes: 'Harbour & freeway tow; fuel delivery.',
  },
  {
    id: 'eastern-cape',
    name: 'Bay & Karoo Rescue',
    area: 'Eastern Cape (Gqeberha / Makhanda)',
    phone: '+27 41 555 0444',
    whatsapp: '+27415550444',
    hours: '06:00–22:00 (after-hours on call)',
    notes: 'Long-distance tow to nearest panel shop.',
  },
  {
    id: 'free-state',
    name: 'Central Plains Assist',
    area: 'Free State (Bloemfontein / Welkom)',
    phone: '+27 51 555 0177',
    whatsapp: '+27515550177',
    hours: '24/7',
    notes: 'N1 corridor; agricultural vehicle recovery on request.',
  },
]

export type RoadsideCallPreference = 'self' | 'broker'

export function nearestProvidersByKeyword(areaHint?: string | null): RoadsideProvider[] {
  const q = (areaHint ?? '').toLowerCase()
  if (!q) return ROADSIDE_PROVIDERS
  const scored = ROADSIDE_PROVIDERS.map((p) => {
    const hay = `${p.area} ${p.name}`.toLowerCase()
    return { p, score: q.split(/\s+/).filter((w) => w && hay.includes(w)).length }
  })
  scored.sort((a, b) => b.score - a.score)
  return scored.map((s) => s.p)
}
