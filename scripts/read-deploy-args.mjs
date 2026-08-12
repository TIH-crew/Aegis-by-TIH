import { readFileSync } from 'node:fs'
const args = JSON.parse(
  readFileSync(new URL('../.deploy-args-for-mcp.json', import.meta.url), 'utf8'),
)
process.stdout.write(JSON.stringify(args))
