"""Export Medilogistics portal risks and build Zoho Client_Risks create batches."""
from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "zoho-medilog-batches"
OUT.mkdir(parents=True, exist_ok=True)

LAYOUT = "7351644000002766026"
ACCOUNT = "7351644000003987001"
POLICY_NO = "B00000050"
POLICY_ID = "7351644000003964002"

RISK_TYPE = {
    "Motor": "Motor Vehicle",
    "Electronic Equipment": "Electronic Equipment",
    "Miscellaneous": "Other",
    "Contents": "Office Contents",
    "Building": "Building",
    "Liability": "Other",
    "Plant & Machinery": "Business Property",
    "Glass": "Other",
    "Money": "Other",
    "Business Interruption": "Other",
}


def to_payload(row: dict) -> dict:
    value = float(row.get("unit_cost") or 0)
    name = (row.get("name") or "Risk item").strip()[:120]
    tag = (row.get("tag") or name[:40]).strip()[:50]
    cat = row.get("category") or "Other"
    risk_type = RISK_TYPE.get(cat, "Other")
    payload = {
        "Name": name,
        "Layout": {"id": LAYOUT},
        "Item_Owned_By": {"id": ACCOUNT},
        "Risk_Category": "Commercial Lines",
        "Risk_Type": risk_type,
        "Risk_Status": "Covered With Us",
        "Currently_Insured": "Yes - With Us",
        "Item_Value": value,
        "Policy_Number": POLICY_NO,
        "Existing_Policy": {"id": POLICY_ID},
        "Tag": tag,
        "Description": (row.get("description") or name)[:2000],
    }
    serial = row.get("serial_number")
    if serial:
        payload["Serial_Number"] = str(serial)[:100]
    if cat == "Contents":
        payload["Total_Contents_Value"] = value
    elif cat in ("Building", "Liability", "Miscellaneous", "Plant & Machinery", "Money"):
        payload["Total_Sum_Insured"] = value
    elif cat == "Electronic Equipment":
        payload["Total_Sum_Insured"] = value
    return payload


def main() -> None:
    # stdin: JSON array of portal rows
    rows = json.load(sys.stdin)
    # skip already-created test forklift if mapped elsewhere
    skip = set(sys.argv[1:])
    rows = [r for r in rows if r.get("zoho_risk_id") not in skip]

    batches = []
    for i in range(0, len(rows), 100):
        chunk = rows[i : i + 100]
        batch = {
            "portal_ids": [r["portal_id"] for r in chunk],
            "legacy_zoho_ids": [r["zoho_risk_id"] for r in chunk],
            "data": [to_payload(r) for r in chunk],
        }
        batches.append(batch)
        path = OUT / f"batch_{i // 100:02d}.json"
        path.write_text(json.dumps(batch, ensure_ascii=False), encoding="utf-8")
        print(f"wrote {path.name} records={len(chunk)}")

    (OUT / "index.json").write_text(
        json.dumps({"batch_count": len(batches), "total": len(rows)}, indent=2),
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
