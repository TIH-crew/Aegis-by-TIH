/** Normalise NFC UID / RFID EPC so scans and typed IDs match. */
export function normalizeTag(value: string): string {
  return value.trim().toUpperCase().replace(/[^A-Z0-9]/g, '')
}

export function nfcReaderAvailable(): boolean {
  return typeof window !== 'undefined' && 'NDEFReader' in window
}

type NdefReadingEvent = Event & { serialNumber?: string }

/** Read an NFC tag serial with the Web NFC API (Chrome on Android). */
export async function readNfcSerial(): Promise<string> {
  const Reader = (
    window as Window & {
      NDEFReader?: new () => {
        scan: () => Promise<void>
        onreading: ((event: NdefReadingEvent) => void) | null
      }
    }
  ).NDEFReader
  if (!Reader) {
    throw new Error(
      'This browser cannot read NFC. Use Chrome on Android, or type the ID from a USB NFC/RFID reader.',
    )
  }
  const reader = new Reader()
  await reader.scan()
  return new Promise((resolve, reject) => {
    const timer = window.setTimeout(() => {
      reject(new Error('No tag detected. Hold the device against the tag.'))
    }, 20000)
    reader.onreading = (event) => {
      window.clearTimeout(timer)
      const serial = normalizeTag(event.serialNumber ?? '')
      if (!serial) reject(new Error('The tag did not include a serial number.'))
      else resolve(serial)
    }
  })
}
