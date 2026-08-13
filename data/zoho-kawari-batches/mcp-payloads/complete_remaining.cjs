const fs = require('fs')
const path = require('path')

const ROOT = path.join(__dirname, '..')
const URL = 'https://egemzmclxcrbgzovcyku.supabase.co/functions/v1/kawari-bulk-push'
const SECRET = 'kawari-push-b00000047-2026'

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms))
}

function loadAllItems() {
  const items = []
  for (let i = 0; i <= 9; i++) {
    const name = `batch_${String(i).padStart(2, '0')}.json`
    const b = JSON.parse(fs.readFileSync(path.join(ROOT, name), 'utf8'))
    for (let j = 0; j < b.portal_ids.length; j++) {
      items.push({
        portal_id: b.portal_ids[j],
        data: b.data[j],
        item_value: b.data[j].Item_Value,
      })
    }
  }
  return items
}

async function status() {
  const res = await fetch(URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', 'x-kawari-push': SECRET },
    body: JSON.stringify({ action: 'status' }),
  })
  return res.json()
}

async function pushItems(slice) {
  for (let attempt = 1; attempt <= 6; attempt++) {
    const res = await fetch(URL, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-kawari-push': SECRET },
      body: JSON.stringify({ items: slice }),
    })
    const text = await res.text()
    let json
    try {
      json = JSON.parse(text)
    } catch {
      json = { error: text }
    }
    if (res.ok && json.ok) return json
    console.error('FAIL attempt', attempt, res.status, JSON.stringify(json).slice(0, 300))
    await sleep(10000 * attempt)
  }
  return { error: true }
}

async function main() {
  const before = await status()
  console.log('before', JSON.stringify(before))
  const items = loadAllItems()
  console.log('batch_items', items.length)

  let created = 0
  let remapped = 0
  let skipped = 0
  const failures = []

  for (let off = 0; off < items.length; off += 25) {
    const slice = items.slice(off, off + 25)
    const label = `off_${off}`
    const r = await pushItems(slice)
    if (r && r.ok) {
      created += r.created || 0
      remapped += r.remapped || 0
      skipped += r.skipped || 0
      console.log('OK', label, 'created', r.created, 'skipped', r.skipped || 0)
    } else {
      // retry as 1x25 already failed; try 5 then 5? already 25. split to 1x1? try chunks of 5
      console.error('RETRY-SPLIT', label)
      for (let s = 0; s < slice.length; s += 5) {
        const sub = slice.slice(s, s + 5)
        const rr = await pushItems(sub)
        if (rr && rr.ok) {
          created += rr.created || 0
          remapped += rr.remapped || 0
          skipped += rr.skipped || 0
          console.log('OK-sub', label, s, rr.created)
        } else {
          failures.push({ label, s, portal_ids: sub.map((x) => x.portal_id) })
          console.error('ERR-sub', label, s)
        }
        await sleep(2500)
      }
    }
    await sleep(2500)
  }

  const after = await status()
  const summary = { created_this_run: created, remapped_this_run: remapped, skipped, failures, before, after }
  fs.writeFileSync(path.join(__dirname, 'complete_summary.json'), JSON.stringify(summary, null, 2))
  console.log(JSON.stringify(summary, null, 2))
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
