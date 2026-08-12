# Zoho CRM — Commercial Assets layouts

Zoho’s REST/MCP APIs can **update** layouts but cannot **create** new ones on a production org.  
ZDK `org:push` can create layouts but only works against a **sandbox** org (production returns `api supported only in sandbox environment`).

## Create layouts in Zoho CRM (production — ~2 minutes)

### Client Risks (risk items)

1. **Setup** → **Customization** → **Modules and Fields**
2. Open **Client Risks**
3. **Layouts** tab → open **Standard**
4. **⋮** (or **More**) → **Clone layout**
5. Name: **Commercial Assets**
6. Assign profiles (recommended):
   - Administrator
   - Director: Commercial Lines
   - Commercial Lines Broker
   - Insurance Administrator
   - Short-term Insurance Administrator
7. **Save**

### Quotations (`Deals` module)

1. **Setup** → **Customization** → **Modules and Fields**
2. Open **Quotations** (API name: `Deals`)
3. **Layouts** tab → open **Commercial Quotes**
4. **Clone layout**
5. Name: **Commercial Assets**
6. Assign profiles:
   - Administrator
   - Director: Commercial Lines
   - Commercial Lines Broker
7. **Save**

After cloning, tell the agent to verify via MCP and tune sections/fields for commercial assets.

## Sandbox / ZDK (optional)

Layout metadata is prepared in:

- `crm/meta/modules/Client_Risks/layouts/Commercial_Assets.layouts-meta.json`
- `crm/meta/modules/Deals/layouts/Commercial_Assets.layouts-meta.json`

From repo root (sandbox org only):

```bash
npm run zdk:login
npm run zdk:push:layouts
```
