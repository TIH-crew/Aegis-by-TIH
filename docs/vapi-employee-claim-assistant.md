# Vapi assistant setup for Aegis employee claims

Configure this once in the [Vapi Dashboard](https://dashboard.vapi.ai) for the assistant ID in `VITE_VAPI_ASSISTANT_ID`.

## 1. Structured Output

Create a Structured Output named **Aegis Employee Claim** with this JSON schema:

```json
{
  "type": "object",
  "properties": {
    "title": { "type": "string", "description": "Short claim title" },
    "description": { "type": "string", "description": "Incident details" },
    "incident_date": { "type": "string", "description": "When it happened (ISO or natural language)" },
    "asset_name_or_plate": { "type": "string", "description": "Insured item name or vehicle plate" },
    "category_hint": { "type": "string", "description": "Motor, Electronic Equipment, Contents, etc." },
    "claim_amount": { "type": "number", "description": "Estimated claim amount if known" },
    "broker_message": { "type": "string", "description": "Notes for the broker" },
    "roadside_needed": { "type": "boolean", "description": "Whether emergency roadside is needed" },
    "ready_to_submit": { "type": "boolean", "description": "True when the employee confirmed the claim can be lodged" }
  },
  "required": ["title", "description", "ready_to_submit"]
}
```

Attach it to the assistant (`artifactPlan.structuredOutputIds`).

Optional: set Supabase secret `VAPI_CLAIM_STRUCTURED_OUTPUT_ID` to that output’s UUID so the edge function picks it reliably.

## 2. Recording + transcript

On the assistant **Artifact Plan**:

- Enable **recording** (`recordingEnabled: true`)
- Ensure transcripts / conversation messages are produced

Aegis downloads the mono recording via the private API after the call ends.

## 3. System prompt variables

Aegis passes these at call start — reference them with Liquid syntax:

`{{employee_name}}`, `{{first_name}}`, `{{company_name}}`, `{{branch_name}}`, `{{job_title}}`, `{{employee_number}}`, `{{email}}`, `{{whatsapp_number}}`, `{{selected_item_name}}`, `{{selected_item_category}}`, `{{call_purpose}}`

Example guidance:

```text
You are the Aegis claims assistant helping verified staff member {{employee_name}}
({{company_name}}{{#if branch_name}}, {{branch_name}}{{/if}}) log an insurance claim.

Collect title, description, asset/plate, amount if known, broker notes, and roadside need.
Confirm a short summary, then set ready_to_submit true and end the call.
```

(Use `{{branch_name}}` plain Liquid; avoid unsupported tags if your prompt engine is strict LiquidJS.)

## 4. Server secret

Set on Supabase Edge Functions (not Vercel frontend):

```env
VAPI_PRIVATE_KEY=your_vapi_private_server_key
```

Never put the private key in `VITE_*` env vars.
