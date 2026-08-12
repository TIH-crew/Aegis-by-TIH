#!/usr/bin/env node
/**
 * Reads a .deploy-*.json payload and prints MCP deploy_edge_function arguments as JSON.
 * Usage: node mcp-deploy-from-json.cjs <path-to-deploy-json>
 */
const fs = require('fs');
const path = process.argv[2];
if (!path) {
  console.error('Usage: node mcp-deploy-from-json.cjs <deploy-json-path>');
  process.exit(1);
}
const payload = JSON.parse(fs.readFileSync(path, 'utf8'));
const args = {
  name: payload.name,
  entrypoint_path: payload.entrypoint_path,
  verify_jwt: payload.verify_jwt,
  files: payload.files,
};
process.stdout.write(JSON.stringify(args));
