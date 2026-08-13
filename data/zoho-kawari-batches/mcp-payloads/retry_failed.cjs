const fs = require('fs')
const path = require('path')

const CHUNK_DIR = path.join(__dirname, 'chunks')
const URL = 'https://egemzmclxcrbgzovcyku.supabase.co/functions/v1/kawari-bulk-push'
const SECRET = 'kawari-push-b00000047-2026'
const FAILED = [
  'batch_03_c03.json',
  'batch_04_c01.json',
  'batch_04_c02.json',
  'batch_04_c03.json',
  'batch_05_c00.json',
  'batch_05_c01.json',
  'batch_05_c02.json',
  'batch_05_c03.json',
  'batch_06_c00.json',
  'batch_06_c01.json',
  'batch_06_c02.json',
  'batch_06_c03.json',
  'batch_07_c00.json',
  'batch_07_c01.json',
  'batch_07_c02.json',
]

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
  for (let attempt = 1; attempt <= 5; attempt++) {
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
    console.error('FAIL', file, 'attempt', attempt, res.status, JSON.stringify(json).slice(0, 300))
    await sleep(5000 * attempt)
  }
  return { file, error: true }
}

async function main() {
  let created = 0
  let remapped = 0
  const failures = []
  for (const file of FAILED) {
    const r = await pushChunk(file)
    if (r.created) {
      created += r.created
      remapped += r.remapped || 0
      console.log('OK', file, r.created)
    } else {
      failures.push(r)
      console.error('ERR', file)
    }
    await sleep(1500)
  }
  fs.writeFileSync(
    path.join(__dirname, 'bulk_retry_summary.json'),
    JSON.stringify({ created, remapped, failures }, null, 2),
  )
  console.log(JSON.stringify({ created, remapped, failureCount: failures.length }))
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
