import { useRef, useState } from 'react'
import { Download, FileSpreadsheet, Upload, X } from 'lucide-react'
import { Link } from 'react-router-dom'
import { INSURANCE_STATUSES, RISK_CATEGORIES } from '../../config/collections'
import { useBranches } from '../../context/BranchesContext'
import { useSearch } from '../../context/SearchContext'
import { useDataService } from '../../hooks/useDataService'
import {
  downloadImportTemplate,
  parseRiskItemsCsv,
  type ImportRowResult,
} from '../../lib/risk-items-import'

interface RiskItemsBulkImportProps {
  open: boolean
  onClose: () => void
}

export function RiskItemsBulkImport({ open, onClose }: RiskItemsBulkImportProps) {
  const { branches } = useBranches()
  const { refreshRiskItems } = useSearch()
  const dataService = useDataService()
  const fileRef = useRef<HTMLInputElement>(null)

  const [fileName, setFileName] = useState<string | null>(null)
  const [parseError, setParseError] = useState<string | null>(null)
  const [rows, setRows] = useState<ImportRowResult[]>([])
  const [importing, setImporting] = useState(false)
  const [importResult, setImportResult] = useState<string | null>(null)
  const [importError, setImportError] = useState<string | null>(null)

  const validRows = rows.filter((r) => r.input)
  const invalidRows = rows.filter((r) => r.errors.length > 0)

  function resetState() {
    setFileName(null)
    setParseError(null)
    setRows([])
    setImporting(false)
    setImportResult(null)
    setImportError(null)
    if (fileRef.current) fileRef.current.value = ''
  }

  function handleClose() {
    resetState()
    onClose()
  }

  async function handleFileChange(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return

    setImportResult(null)
    setImportError(null)
    setFileName(file.name)

    try {
      const text = await file.text()
      const { rows: parsed, parseError: headerError } = parseRiskItemsCsv(text, branches)
      if (headerError) {
        setParseError(headerError)
        setRows([])
        return
      }
      setParseError(null)
      setRows(parsed)
    } catch {
      setParseError('Could not read the file. Save your spreadsheet as CSV and try again.')
      setRows([])
    }
  }

  async function handleImport() {
    if (!dataService || validRows.length === 0) return

    setImporting(true)
    setImportError(null)
    setImportResult(null)

    try {
      const inputs = validRows.map((r) => r.input!)
      await dataService.createRiskItemsBulk(inputs)
      await refreshRiskItems()
      setImportResult(`Imported ${inputs.length} risk item${inputs.length === 1 ? '' : 's'} successfully.`)
      setRows([])
      setFileName(null)
      if (fileRef.current) fileRef.current.value = ''
    } catch (err) {
      setImportError(err instanceof Error ? err.message : 'Import failed')
    } finally {
      setImporting(false)
    }
  }

  if (!open) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4">
      <div
        className="flex max-h-[90vh] w-full max-w-3xl flex-col rounded-xl border border-border bg-surface shadow-xl"
        role="dialog"
        aria-labelledby="bulk-import-title"
      >
        <div className="flex items-start justify-between border-b border-border px-6 py-4">
          <div>
            <h2 id="bulk-import-title" className="text-lg font-semibold">
              Import risk items from spreadsheet
            </h2>
            <p className="mt-1 text-sm text-muted">
              Upload a CSV file exported from Excel or Google Sheets.
            </p>
          </div>
          <button
            type="button"
            onClick={handleClose}
            className="rounded-lg p-2 text-muted hover:bg-gray-100 hover:text-gray-900"
            aria-label="Close"
          >
            <X size={18} />
          </button>
        </div>

        <div className="flex-1 space-y-4 overflow-y-auto px-6 py-4">
          {branches.length === 0 && (
            <p className="rounded-md border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
              Add branches in{' '}
              <Link to="/settings/organization" className="font-medium underline" onClick={handleClose}>
                Organization settings
              </Link>{' '}
              before importing. Branch names in the spreadsheet must match exactly.
            </p>
          )}

          <div className="flex flex-wrap gap-3">
            <button
              type="button"
              onClick={downloadImportTemplate}
              className="inline-flex items-center gap-2 rounded-lg border border-border px-4 py-2 text-sm hover:bg-gray-50"
            >
              <Download size={16} />
              Download template
            </button>
            <label className="inline-flex cursor-pointer items-center gap-2 rounded-lg border border-border px-4 py-2 text-sm hover:bg-gray-50">
              <Upload size={16} />
              {fileName ?? 'Choose CSV file'}
              <input
                ref={fileRef}
                type="file"
                accept=".csv,text/csv"
                className="sr-only"
                onChange={(e) => void handleFileChange(e)}
                disabled={!branches.length}
              />
            </label>
          </div>

          <div className="rounded-lg border border-border bg-page p-4 text-xs text-muted">
            <p className="mb-2 font-medium text-gray-700">Required columns</p>
            <p>Item Name, Category, Branch</p>
            <p className="mt-2 font-medium text-gray-700">Optional columns</p>
            <p>
              Unit Cost, Repair Cost, Insurance Status, Employee, Serial Number, Description, Record
              Date (YYYY-MM-DD)
            </p>
            <p className="mt-2">
              <span className="font-medium text-gray-700">Categories:</span>{' '}
              {RISK_CATEGORIES.join(', ')}
            </p>
            <p className="mt-1">
              <span className="font-medium text-gray-700">Statuses:</span>{' '}
              {INSURANCE_STATUSES.join(', ')}
            </p>
          </div>

          {parseError && (
            <p className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
              {parseError}
            </p>
          )}

          {rows.length > 0 && (
            <div className="space-y-2">
              <div className="flex items-center gap-2 text-sm">
                <FileSpreadsheet size={16} className="text-muted" />
                <span>
                  {validRows.length} ready to import
                  {invalidRows.length > 0 && ` · ${invalidRows.length} with errors`}
                </span>
              </div>

              <div className="max-h-64 overflow-auto rounded-lg border border-border">
                <table className="w-full text-left text-sm">
                  <thead className="sticky top-0 bg-gray-50 text-xs uppercase text-muted">
                    <tr>
                      <th className="px-3 py-2">Row</th>
                      <th className="px-3 py-2">Item Name</th>
                      <th className="px-3 py-2">Category</th>
                      <th className="px-3 py-2">Branch</th>
                      <th className="px-3 py-2">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {rows.map((row) => (
                      <tr key={row.rowNumber} className="border-t border-border">
                        <td className="px-3 py-2 text-muted">{row.rowNumber}</td>
                        <td className="px-3 py-2">{row.raw.name || '—'}</td>
                        <td className="px-3 py-2">{row.raw.category || '—'}</td>
                        <td className="px-3 py-2">{row.raw.branch || '—'}</td>
                        <td className="px-3 py-2">
                          {row.input ? (
                            <span className="text-green-700">Ready</span>
                          ) : (
                            <span className="text-red-600" title={row.errors.join('; ')}>
                              {row.errors.join('; ')}
                            </span>
                          )}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {importResult && (
            <p className="rounded-md border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-800">
              {importResult}
            </p>
          )}
          {importError && (
            <p className="rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
              {importError}
            </p>
          )}
        </div>

        <div className="flex justify-end gap-3 border-t border-border px-6 py-4">
          <button
            type="button"
            onClick={handleClose}
            className="rounded-lg border border-border px-4 py-2 text-sm hover:bg-gray-50"
          >
            {importResult ? 'Done' : 'Cancel'}
          </button>
          {!importResult && (
            <button
              type="button"
              onClick={() => void handleImport()}
              disabled={importing || validRows.length === 0 || !branches.length}
              className="rounded-lg bg-accent px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-accent-hover disabled:opacity-60"
            >
              {importing
                ? 'Importing...'
                : `Import ${validRows.length} item${validRows.length === 1 ? '' : 's'}`}
            </button>
          )}
        </div>
      </div>
    </div>
  )
}
