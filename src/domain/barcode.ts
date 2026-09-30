/** Generate a stable Code 128–friendly barcode payload (tenant-scoped uniqueness enforced in DB). */
export function generateAssetBarcode(opts: {
  accountShort: string
  assetTag: string
  sequence?: number
}): string {
  const acct = opts.accountShort.replace(/[^A-Z0-9]/gi, '').slice(0, 4).toUpperCase() || 'AEG'
  const tag = opts.assetTag.replace(/[^A-Z0-9]/gi, '').slice(0, 12).toUpperCase() || 'ASSET'
  const seq = String(opts.sequence ?? Date.now() % 100000).padStart(5, '0')
  return `AEG-${acct}-${tag}-${seq}`
}

export function barcodeNeedsPhysicalLabel(ownershipType: string, assetType: string): boolean {
  if (assetType === 'intangible') return false
  if (ownershipType === 'insurance_only') return false
  return true
}
