const fs = require('fs')
const path = require('path')

const ROOT = path.join(__dirname, '..')
const OUT = path.join(__dirname, 'remaining_chunks')
const URL = 'https://egemzmclxcrbgzovcyku.supabase.co/functions/v1/kawari-bulk-push'
const SECRET = 'kawari-push-b00000047-2026'
const IDS_FILE = path.join(__dirname, 'remaining_ids.txt')

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms))
}

function rebuildChunks() {
  const remaining = new Set(
    fs
      .readFileSync(IDS_FILE, 'utf8')
      .split(',')
      .map((s) => s.trim())
      .filter(Boolean),
  )
  fs.mkdirSync(OUT, { recursive: true })
  for (const f of fs.readdirSync(OUT)) fs.unlinkSync(path.join(OUT, f))

  const all = []
  for (let i = 0; i <= 9; i++) {
    const name = `batch_${String(i).padStart(2, '0')}.json`
    const b = JSON.parse(fs.readFileSync(path.join(ROOT, name), 'utf8'))
    for (let j = 0; j < b.portal_ids.length; j++) {
      if (remaining.has(b.portal_ids[j])) {
        all.push({
          portal_id: b.portal_ids[j],
          data: b.data[j],
          item_value: b.data[j].Item_Value,
        })
      }
    }
  }

  const chunks = []
  for (let off = 0; off < all.length; off += 25) {
    const slice = all.slice(off, off + 25)
    const chunk = {
      portal_ids: slice.map((x) => x.portal_id),
      data: slice.map((x) => x.data),
      item_values: slice.map((x) => x.item_value),
    }
    const fname = `remain_${String(chunks.length).padStart(2, '0')}.json`
    fs.writeFileSync(path.join(OUT, fname), JSON.stringify(chunk))
    chunks.push(fname)
  }
  console.log(
    JSON.stringify({
      remaining_ids: remaining.size,
      matched: all.length,
      chunks: chunks.length,
    }),
  )
  return chunks
}

async function pushChunk(file) {
  const chunk = JSON.parse(fs.readFileSync(path.join(OUT, file), 'utf8'))
  for (let attempt = 1; attempt <= 6; attempt++) {
    const res = await fetch(URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-kawari-push': SECRET,
      },
      body: JSON.stringify({
        data: chunk.data,
        portal_ids: chunk.portal_ids,
        item_values: chunk.item_values,
      }),
    })
    const text = await res.text()
    let json
    try {
      json = JSON.parse(text)
    } catch {
      json = { error: text }
    }
    if (res.ok && json.ok) {
      return {
        file,
        created: json.created,
        remapped: json.remapped,
        fails: json.fails || [],
      }
    }
    console.error(
      'FAIL',
      file,
      'attempt',
      attempt,
      res.status,
      JSON.stringify(json).slice(0, 250),
    )
    // On Access Denied, wait longer (token/rate)
    await sleep(8000 * attempt)
  }
  return { file, error: true, portal_ids: chunk.portal_ids }
}

async function main() {
  const cmd = process.argv[2] || 'all'
  if (cmd === 'rebuild' || cmd === 'all') rebuildChunks()
  if (cmd === 'rebuild') return

  const files = fs
    .readdirSync(OUT)
    .filter((f) => f.endsWith('.json'))
    .sort()
  let created = 0
  let remapped = 0
  const failures = []
  for (const file of files) {
    const r = await pushChunk(file)
    if (r.created) {
      created += r.created
      remapped += r.remapped || 0
      console.log('OK', file, r.created)
    } else {
      failures.push(r)
      console.error('ERR', file)
    }
    await sleep(2000)
  }
  const summary = { created, remapped, failureCount: failures.length, failures }
  fs.writeFileSync(
    path.join(__dirname, 'resume_summary.json'),
    JSON.stringify(summary, null, 2),
  )
  console.log(JSON.stringify({ created, remapped, failureCount: failures.length }))
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
