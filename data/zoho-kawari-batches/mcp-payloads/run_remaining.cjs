const fs = require('fs')
const path = require('path')

const CHUNK_DIR = path.join(__dirname, 'chunks')
const URL = 'https://egemzmclxcrbgzovcyku.supabase.co/functions/v1/kawari-bulk-push'
const SECRET = 'kawari-push-b00000047-2026'
const DONE = new Set([
  'batch_00_c00.json',
  'batch_00_c01.json',
  'batch_00_c02.json',
  'batch_00_c03.json',
  'batch_01_c00.json',
  'batch_01_c01.json',
])

async function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms))
}

async function pushChunk(file) {
  const chunk = JSON.parse(fs.readFileSync(path.join(CHUNK_DIR, file), 'utf8'))
  const body = {
    data: chunk.data,
    portal_ids: chunk.portal_ids,
    item_values: chunk.item_values,
  }
  for (let attempt = 1; attempt <= 3; attempt++) {
    const res = await fetch(URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-kawari-push': SECRET,
      },
      body: JSON.stringify(body),
    })
    const text = await res.text()
    let json
    try {
      json = JSON.parse(text)
    } catch {
      json = { error: text }
    }
    if (res.ok && json.ok) {
      return { file, created: json.created, remapped: json.remapped, fails: json.fails || [] }
    }
    console.error('FAIL', file, 'attempt', attempt, res.status, JSON.stringify(json).slice(0, 500))
    if (attempt < 3) await sleep(2000 * attempt)
    else return { file, error: json, status: res.status }
  }
}

async function main() {
  const files = fs
    .readdirSync(CHUNK_DIR)
    .filter((f) => f.endsWith('.json') && !f.includes('rest'))
    .sort()
  const pending = files.filter((f) => !DONE.has(f))
  console.log('pending', pending.length)
  const results = []
  let created = 0
  let remapped = 0
  const failures = []
  for (const file of pending) {
    const r = await pushChunk(file)
    results.push(r)
    if (r.created) {
      created += r.created
      remapped += r.remapped || 0
      console.log('OK', file, 'created', r.created, 'remapped', r.remapped)
    } else {
      failures.push(r)
      console.error('ERR', file)
    }
    await sleep(400)
  }
  const summary = { created, remapped, failures, results }
  fs.writeFileSync(path.join(__dirname, 'bulk_run_summary.json'), JSON.stringify(summary, null, 2))
  console.log(JSON.stringify({ created, remapped, failureCount: failures.length }))
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
