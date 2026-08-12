#!/usr/bin/env node
const fs = require('fs');
const path = process.argv[2];
if (!path) {
  console.error('Usage: node read-deploy-payload.cjs <deploy-json-path>');
  process.exit(1);
}
const payload = JSON.parse(fs.readFileSync(path, 'utf8'));
process.stdout.write(JSON.stringify(payload));
