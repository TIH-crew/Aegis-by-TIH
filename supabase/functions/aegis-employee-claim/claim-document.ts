/** Claim form document (what the employee sees) — not a call transcript. */

export type ClaimFormDocInput = {
  handlerName: string
  claimId: string
  title: string
  description: string
  submittedVia: string
  employeeName: string
  employeeWhatsapp: string
  jobTitle: string
  companyName: string
  riskName: string
  riskCategory: string
  branch: string
  policyLine: string
  sumInsuredLine: string
  claimAmountLine: string
  locationLine: string
  roadsideLine: string
  brokerMessage: string
  docGeneratedAt: string
  photos: { bytes: Uint8Array; caption: string }[]
}

function escapeHtml(value: string): string {
  return value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

export function publicClaimDescription(description: string, transcript: string | null): string {
  const text = description.trim()
  if (!text) return ''
  if (/voice claim transcript/i.test(text)) return ''
  const t = transcript?.trim() ?? ''
  if (t && (text === t || (t.length >= 80 && text.includes(t.slice(0, 80))))) return ''
  return text
}

export function voiceClaimFormDescription(opts: {
  companyName: string | null
  policyNumber: string | null
  itemName: string
  sumInsured: number | null
}): string {
  const parts = [
    opts.companyName,
    opts.policyNumber ? `Policy ${opts.policyNumber}` : null,
    opts.itemName,
    opts.sumInsured != null && Number.isFinite(opts.sumInsured)
      ? `Sum insured R ${opts.sumInsured.toLocaleString('en-ZA')}`
      : null,
  ].filter(Boolean)
  return parts.length ? `Voice claim — ${parts.join(' · ')}` : 'Voice claim'
}

function formRows(opts: ClaimFormDocInput): [string, string][] {
  const via = opts.submittedVia === 'employee_vapi' ? 'Voice call + claim form' : 'Employee claim form'
  return [
    ['Handler', opts.handlerName],
    ['Claim ID', opts.claimId],
    ['What happened', opts.title],
    ['Submitted via', via],
    ['Employee', opts.employeeName],
    ['Employee WhatsApp', opts.employeeWhatsapp],
    ['Job title', opts.jobTitle],
    ['Company', opts.companyName],
    ['Item', `${opts.riskName} (${opts.riskCategory})`],
    ['Branch', opts.branch],
    ['Policy', opts.policyLine],
    ['Sum insured', opts.sumInsuredLine],
    ['Claim amount', opts.claimAmountLine],
    ['Location', opts.locationLine],
    ['Roadside assistance', opts.roadsideLine],
  ]
}

export function buildClaimSummaryHtml(opts: ClaimFormDocInput): string {
  const tableRows = formRows(opts)
    .map(
      ([label, value]) =>
        `<tr><th style="text-align:left;padding:8px;border-bottom:1px solid #e5e7eb;width:180px">${escapeHtml(label)}</th><td style="padding:8px;border-bottom:1px solid #e5e7eb">${escapeHtml(value)}</td></tr>`,
    )
    .join('')

  const descriptionBlock = opts.description
    ? `<div style="margin:16px 0"><p style="font-weight:600;margin:0 0 8px">Details</p><p style="white-space:pre-wrap;margin:0">${escapeHtml(opts.description)}</p></div>`
    : ''

  const brokerBlock = opts.brokerMessage
    ? `<div style="margin:16px 0"><p style="font-weight:600;margin:0 0 8px">Message for the broker</p><p style="white-space:pre-wrap;margin:0">${escapeHtml(opts.brokerMessage)}</p></div>`
    : ''

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Aegis Claim — ${escapeHtml(opts.title)}</title>
</head>
<body style="font-family:system-ui,-apple-system,Segoe UI,sans-serif;color:#111827;max-width:900px;margin:24px auto;padding:0 16px">
  <h1 style="font-size:22px;margin:0 0 4px">Aegis employee claim</h1>
  <p style="color:#6b7280;margin:0 0 20px">Generated ${escapeHtml(opts.docGeneratedAt)}</p>
  <table style="width:100%;border-collapse:collapse;margin:16px 0">${tableRows}</table>
  ${descriptionBlock}
  ${brokerBlock}
  ${opts.photos.length ? `<p style="color:#6b7280;font-size:13px">${opts.photos.length} photo(s) included in the PDF sent to the claims handler.</p>` : ''}
</body>
</html>`
}

function toWinAnsi(text: string): string {
  return text
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^\t\n\r\x20-\x7e\xa0-\xff]/g, '?')
}

function pdfLiteral(text: string): string {
  const ansi = toWinAnsi(text)
  let out = '('
  for (let i = 0; i < ansi.length; i++) {
    const code = ansi.charCodeAt(i)
    if (code === 0x28 || code === 0x29 || code === 0x5c) out += `\\${ansi[i]}`
    else if (code < 32 || code > 126) out += `\\${code.toString(8).padStart(3, '0')}`
    else out += ansi[i]
  }
  return `${out})`
}

function wrapText(text: string, maxChars: number): string[] {
  const lines: string[] = []
  for (const paragraph of text.replace(/\r\n/g, '\n').split('\n')) {
    if (!paragraph) {
      lines.push('')
      continue
    }
    let rest = paragraph
    while (rest.length > maxChars) {
      let cut = rest.lastIndexOf(' ', maxChars)
      if (cut < 12) cut = maxChars
      lines.push(rest.slice(0, cut))
      rest = rest.slice(cut).trimStart()
    }
    lines.push(rest)
  }
  return lines
}

function jpegSize(bytes: Uint8Array): { width: number; height: number } | null {
  if (bytes.length < 4 || bytes[0] !== 0xff || bytes[1] !== 0xd8) return null
  let i = 2
  while (i < bytes.length - 8) {
    if (bytes[i] !== 0xff) {
      i += 1
      continue
    }
    const marker = bytes[i + 1]
    if (marker === 0xc0 || marker === 0xc1 || marker === 0xc2) {
      return {
        height: (bytes[i + 5] << 8) | bytes[i + 6],
        width: (bytes[i + 7] << 8) | bytes[i + 8],
      }
    }
    const len = (bytes[i + 2] << 8) | bytes[i + 3]
    i += 2 + len
  }
  return null
}

function concatBytes(parts: Uint8Array[]): Uint8Array {
  const total = parts.reduce((n, p) => n + p.length, 0)
  const out = new Uint8Array(total)
  let offset = 0
  for (const part of parts) {
    out.set(part, offset)
    offset += part.length
  }
  return out
}

function utf8(text: string): Uint8Array {
  return new TextEncoder().encode(text)
}

type PdfObject = { id: number; body: Uint8Array }

export function buildClaimSummaryPdf(opts: ClaimFormDocInput): Uint8Array {
  const pageWidth = 595
  const pageHeight = 842
  const margin = 48
  const contentWidth = pageWidth - margin * 2
  const lineHeight = 14
  const labelWidth = 130
  const objects: PdfObject[] = []
  const fontId = 1
  objects.push({
    id: fontId,
    body: utf8('<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>'),
  })
  const boldId = 2
  objects.push({
    id: boldId,
    body: utf8('<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold >>'),
  })

  const imageObjects: {
    id: number
    caption: string
    width: number
    height: number
  }[] = []
  for (const photo of opts.photos.slice(0, 6)) {
    const size = jpegSize(photo.bytes)
    if (!size) continue
    const id = objects.length + 1
    const header = utf8(
      `<< /Type /XObject /Subtype /Image /Width ${size.width} /Height ${size.height} /ColorSpace /DeviceRGB /BitsPerComponent 8 /Filter /DCTDecode /Length ${photo.bytes.byteLength} >>\nstream\n`,
    )
    const footer = utf8('\nendstream')
    objects.push({ id, body: concatBytes([header, photo.bytes, footer]) })
    imageObjects.push({ id, caption: photo.caption, width: size.width, height: size.height })
  }

  type PageSpec = { content: string; xobjects: number[] }
  const pages: PageSpec[] = []

  const startPage = (): { lines: string[]; y: number; xobjects: number[] } => ({
    lines: ['BT'],
    y: pageHeight - margin,
    xobjects: [],
  })

  const flushPage = (page: { lines: string[]; xobjects: number[] }) => {
    page.lines.push('ET')
    pages.push({ content: page.lines.join('\n'), xobjects: page.xobjects })
  }

  let page = startPage()

  const ensureSpace = (needed: number) => {
    if (page.y - needed < margin) {
      flushPage(page)
      page = startPage()
    }
  }

  const addText = (text: string, x: number, font: number, size: number, maxChars: number) => {
    const wrapped = wrapText(text || '—', maxChars)
    for (const line of wrapped) {
      ensureSpace(lineHeight)
      page.lines.push(`/F${font} ${size} Tf`)
      page.lines.push(`1 0 0 1 ${x.toFixed(1)} ${page.y.toFixed(1)} Tm`)
      page.lines.push(`${pdfLiteral(line)} Tj`)
      page.y -= lineHeight
    }
  }

  addText('Aegis employee claim', margin, 2, 18, 60)
  page.y -= 4
  addText(`Generated ${opts.docGeneratedAt}`, margin, 1, 9, 90)
  page.y -= 10

  for (const [label, value] of formRows(opts)) {
    ensureSpace(lineHeight * 2)
    page.lines.push(`/F2 10 Tf`)
    page.lines.push(`1 0 0 1 ${margin.toFixed(1)} ${page.y.toFixed(1)} Tm`)
    page.lines.push(`${pdfLiteral(label)} Tj`)
    addText(value || '—', margin + labelWidth, 1, 10, 70)
    page.y -= 4
  }

  page.y -= 8
  if (opts.description) {
    addText('Details', margin, 2, 12, 80)
    page.y -= 2
    addText(opts.description, margin, 1, 10, 88)
    page.y -= 8
  }
  if (opts.brokerMessage) {
    addText('Message for the broker', margin, 2, 12, 80)
    page.y -= 2
    addText(opts.brokerMessage, margin, 1, 10, 88)
    page.y -= 8
  }

  flushPage(page)

  for (const image of imageObjects) {
    const maxW = contentWidth
    const maxH = 620
    const scale = Math.min(maxW / image.width, maxH / image.height, 1)
    const drawW = image.width * scale
    const drawH = image.height * scale
    const imgPage = startPage()
    imgPage.lines.push(`/F2 11 Tf`)
    imgPage.lines.push(`1 0 0 1 ${margin.toFixed(1)} ${imgPage.y.toFixed(1)} Tm`)
    imgPage.lines.push(`${pdfLiteral(image.caption || 'Claim photo')} Tj`)
    imgPage.y -= 18
    imgPage.lines.push('ET')
    const y = Math.max(margin, imgPage.y - drawH)
    imgPage.lines.push('q')
    imgPage.lines.push(`${drawW.toFixed(2)} 0 0 ${drawH.toFixed(2)} ${margin.toFixed(2)} ${y.toFixed(2)} cm`)
    imgPage.lines.push(`/Im${image.id} Do`)
    imgPage.lines.push('Q')
    imgPage.xobjects.push(image.id)
    pages.push({ content: imgPage.lines.join('\n'), xobjects: imgPage.xobjects })
  }

  const pageIds: number[] = []
  for (const spec of pages) {
    const contentId = objects.length + 1
    const stream = utf8(spec.content)
    objects.push({
      id: contentId,
      body: concatBytes([
        utf8(`<< /Length ${stream.byteLength} >>\nstream\n`),
        stream,
        utf8('\nendstream'),
      ]),
    })
    const xobjectDict = spec.xobjects.length
      ? `/XObject << ${spec.xobjects.map((id) => `/Im${id} ${id} 0 R`).join(' ')} >>`
      : ''
    const pageId = objects.length + 1
    pageIds.push(pageId)
    objects.push({
      id: pageId,
      body: utf8(
        `<< /Type /Page /Parent PLACEHOLDER /MediaBox [0 0 ${pageWidth} ${pageHeight}] /Contents ${contentId} 0 R /Resources << /Font << /F1 ${fontId} 0 R /F2 ${boldId} 0 R >> ${xobjectDict} >> >>`,
      ),
    })
  }

  const pagesId = objects.length + 1
  objects.push({
    id: pagesId,
    body: utf8(
      `<< /Type /Pages /Kids [${pageIds.map((id) => `${id} 0 R`).join(' ')}] /Count ${pageIds.length} >>`,
    ),
  })
  for (const obj of objects) {
    if (pageIds.includes(obj.id)) {
      obj.body = utf8(new TextDecoder().decode(obj.body).replace('PLACEHOLDER', `${pagesId} 0 R`))
    }
  }

  const catalogId = objects.length + 1
  objects.push({
    id: catalogId,
    body: utf8(`<< /Type /Catalog /Pages ${pagesId} 0 R >>`),
  })

  objects.sort((a, b) => a.id - b.id)
  const encoder = new TextEncoder()
  const header = encoder.encode('%PDF-1.4\n')
  const chunks: Uint8Array[] = [header]
  const offsets = [0]
  let pos = header.byteLength
  for (const obj of objects) {
    offsets[obj.id] = pos
    const prefix = encoder.encode(`${obj.id} 0 obj\n`)
    const suffix = encoder.encode('\nendobj\n')
    chunks.push(prefix, obj.body, suffix)
    pos += prefix.byteLength + obj.body.byteLength + suffix.byteLength
  }
  const xrefStart = pos
  const maxId = objects[objects.length - 1]?.id ?? 0
  let xref = `xref\n0 ${maxId + 1}\n0000000000 65535 f \n`
  for (let i = 1; i <= maxId; i++) {
    xref += `${String(offsets[i] ?? 0).padStart(10, '0')} 00000 n \n`
  }
  const trailer = `trailer\n<< /Size ${maxId + 1} /Root ${catalogId} 0 R >>\nstartxref\n${xrefStart}\n%%EOF\n`
  chunks.push(encoder.encode(xref), encoder.encode(trailer))
  return concatBytes(chunks)
}
