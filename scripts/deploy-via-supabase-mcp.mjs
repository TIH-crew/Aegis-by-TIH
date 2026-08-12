#!/usr/bin/env node
/**
 * Deploy a Supabase edge function via the Supabase MCP HTTP endpoint.
 * Usage: node deploy-via-supabase-mcp.mjs <deploy-json-path>
 */
import fs from 'node:fs';
import { Client } from '@modelcontextprotocol/sdk/client/index.js';
import { StreamableHTTPClientTransport } from '@modelcontextprotocol/sdk/client/streamableHttp.js';

const deployPath = process.argv[2];
if (!deployPath) {
  console.error('Usage: node deploy-via-supabase-mcp.mjs <deploy-json-path>');
  process.exit(1);
}

const payload = JSON.parse(fs.readFileSync(deployPath, 'utf8'));
const args = {
  name: payload.name,
  entrypoint_path: payload.entrypoint_path,
  verify_jwt: payload.verify_jwt,
  files: payload.files,
};

const projectRef = 'egemzmclxcrbgzovcyku';
const url = `https://mcp.supabase.com/mcp?project_ref=${projectRef}`;

const transport = new StreamableHTTPClientTransport(new URL(url));
const client = new Client({ name: 'deploy-script', version: '1.0.0' });

try {
  await client.connect(transport);
  const result = await client.callTool({
    name: 'deploy_edge_function',
    arguments: args,
  });
  console.log(JSON.stringify(result, null, 2));
} catch (err) {
  console.error('Deploy failed:', err);
  process.exit(1);
} finally {
  await client.close();
}
