/**
 * GL CSV / export adapter — idempotent imports into aam_gl_imports / aam_gl_lines.
 * Expected columns: gl_account, amount, source_identifier, narrative (optional)
 */

import { importGlBatch } from './asset-ledger.service'

export type GlCsvRow = {
  glAccount: string
  amount: string
  sourceIdentifier: string
  narrative?: string
}

export function parseGlCsv(text: string): GlCsvRow[] {
  const lines = text
    .split(/\r?\n/)
    .map((l) => l.trim())
    .filter(Boolean)
  if (lines.length < 2) return []
  const header = lines[0].split(',').map((h) => h.trim().toLowerCase())
  const idx = {
    gl: header.indexOf('gl_account'),
    amount: header.indexOf('amount'),
    source: header.indexOf('source_identifier'),
    narrative: header.indexOf('narrative'),
  }
  if (idx.gl < 0 || idx.amount < 0 || idx.source < 0) {
    throw new Error('GL CSV requires gl_account, amount, source_identifier columns')
  }
  return lines.slice(1).map((line) => {
    const cols = line.split(',').map((c) => c.trim())
    return {
      glAccount: cols[idx.gl] ?? '',
      amount: cols[idx.amount] ?? '0',
      sourceIdentifier: cols[idx.source] ?? '',
      narrative: idx.narrative >= 0 ? cols[idx.narrative] : undefined,
    }
  })
}

export async function importGlCsvForAccount(
  accountId: string,
  opts: {
    sourceSystem: string
    periodKey: string
    batchKey: string
    fileName: string
    csvText: string
  },
) {
  const lines = parseGlCsv(opts.csvText)
  return importGlBatch(accountId, {
    sourceSystem: opts.sourceSystem,
    periodKey: opts.periodKey,
    batchKey: opts.batchKey,
    fileName: opts.fileName,
    lines,
  })
}
