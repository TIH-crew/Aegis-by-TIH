const fs = require('fs');
const path = require('path');

const dataDir = __dirname;
const projectId = 'egemzmclxcrbgzovcyku';

async function main() {
  for (let i = 1; i <= 3; i++) {
    const sqlFile = path.join(dataDir, `medipost-portal-sync-risks-part${i}.sql`);
    const query = fs.readFileSync(sqlFile, 'utf8');
    const payload = { project_id: projectId, query };
    const outFile = path.join(dataDir, `_mcp-call-part${i}.json`);
    fs.writeFileSync(outFile, JSON.stringify(payload));
    console.log(`part${i}: wrote ${outFile} (${query.length} chars)`);
  }
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
