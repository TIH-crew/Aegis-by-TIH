const fs = require('fs')
const path = require('path')

const ROOT = path.join(__dirname, '..')
const OUT = path.join(__dirname, 'final_chunks')
const URL = 'https://egemzmclxcrbgzovcyku.supabase.co/functions/v1/kawari-bulk-push'
const SECRET = 'kawari-push-b00000047-2026'
const IDS = path.join(__dirname, 'remaining_ids.txt')

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms))
}

function rebuild() {
  const remaining = new Set(
    fs
      .readFileSync(IDS, 'utf8')
      .split(',')
      .map((s) => s.trim())
      .filter(Boolean),
  )
  fs.mkdirSync(OUT, { recursive: true })
  for (const f of fs.readdirSync(OUT)) fs.unlinkSync(path.join(OUT, f))
  const all = []
  for (let i = 0; i <= 9; i++) {
    const b = JSON.parse(
      fs.readFileSync(
        path.join(ROOT, `batch_${String(i).padStart(2, '0')}.json`),
        'utf8',
      ),
    )
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
  let n = 0
  for (let off = 0; off < all.length; off += 10) {
    const slice = all.slice(off, off + 10)
    fs.writeFileSync(
      path.join(OUT, `f_${String(n).padStart(2, '0')}.json`),
      JSON.stringify({
        items: slice,
        portal_ids: slice.map((x) => x.portal_id),
        data: slice.map((x) => x.data),
        item_values: slice.map((x) => x.item_value),
      }),
    )
    n++
  }
  console.log(JSON.stringify({ matched: all.length, chunks: n }))
}

async function pushFile(file) {
  const chunk = JSON.parse(fs.readFileSync(path.join(OUT, file), 'utf8'))
  for (let attempt = 1; attempt <= 4; attempt++) {
    const res = await fetch(URL, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-kawari-push': SECRET },
      body: JSON.stringify({ items: chunk.items }),
    })
    const text = await res.text()
    let json
    try {
      json = JSON.parse(text)
    } catch {
      json = { error: text }
    }
    if (res.ok && json.ok) return { file, ...json }
    console.error('FAIL', file, attempt, res.status, JSON.stringify(json).slice(0, 200))
    await sleep(15000)
  }
  return { file, error: true }
}

async function main() {
  const cmd = process.argv[2] || 'push'
  if (cmd === 'rebuild') return rebuild()
  rebuild()
  const files = fs.readdirSync(OUT).filter((f) => f.endsWith('.json')).sort()
  let created = 0
  let remapped = 0
  const failures = []
  for (const file of files) {
    const r = await pushFile(file)
    if (r.created != null && !r.error) {
      created += r.created || 0
      remapped += r.remapped || 0
      console.log('OK', file, r.created)
    } else {
      failures.push(r)
      console.error('ERR', file)
    }
    await sleep(4000)
  }
  // status
  const st = await fetch(URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', 'x-kawari-push': SECRET },
    body: JSON.stringify({ action: 'status' }),
  }).then((r) => r.json())
  const summary = { created, remapped, failures: failures.length, status: st }
  fs.writeFileSync(path.join(__dirname, 'final_summary.json'), JSON.stringify(summary, null, 2))
  console.log(JSON.stringify(summary))
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
