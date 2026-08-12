const fs = require('fs');
const path = require('path');

const part = Number(process.argv[2]);
if (!part) {
  console.error('Usage: node mcp-exec-part.cjs <part-number>');
  process.exit(1);
}

const file = path.join(__dirname, `_invoke-part${part}.json`);
if (!fs.existsSync(file)) {
  const src = path.join(__dirname, `_mcp-part${part}.json`);
  const payload = JSON.parse(fs.readFileSync(src, 'utf8'));
  fs.writeFileSync(file, JSON.stringify(payload));
}

const args = JSON.parse(fs.readFileSync(file, 'utf8'));
process.stdout.write(JSON.stringify(args));
