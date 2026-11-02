import { supabase } from '../lib/supabase'
import { normalizeTag } from '../domain/asset-tags'
import { appendTimeline } from './asset-lifecycle.service'

export type TagKind = 'nfc' | 'rfid'
export type TagTarget = 'risk_item' | 'ledger'

const COLUMN: Record<TagKind, 'nfc_uid' | 'rfid_epc'> = {
  nfc: 'nfc_uid',
  rfid: 'rfid_epc',
}

async function tagTaken(
  accountId: string,
  column: 'nfc_uid' | 'rfid_epc',
  value: string,
  except: { table: 'portal_risk_items' | 'aam_assets'; id: string },
) {
  const [{ data: risk }, { data: ledger }] = await Promise.all([
    supabase
      .from('portal_risk_items')
      .select('id, asset_tag, name')
      .eq('account_id', accountId)
      .eq(column, value)
      .maybeSingle(),
    supabase
      .from('aam_assets')
      .select('id, asset_tag, description')
      .eq('account_id', accountId)
      .eq(column, value)
      .maybeSingle(),
  ])
  if (risk && !(except.table === 'portal_risk_items' && risk.id === except.id)) {
    return `${risk.asset_tag} (${risk.name})`
  }
  if (ledger && !(except.table === 'aam_assets' && ledger.id === except.id)) {
    return `${ledger.asset_tag} (${ledger.description})`
  }
  return null
}

export async function assignAssetTag(opts: {
  accountId: string
  target: TagTarget
  recordId: string
  kind: TagKind
  rawValue: string
  userId?: string
}) {
  const value = normalizeTag(opts.rawValue)
  if (value.length < 4) throw new Error('Tag ID is too short.')
  const column = COLUMN[opts.kind]
  const table = opts.target === 'risk_item' ? 'portal_risk_items' : 'aam_assets'
  const taken = await tagTaken(opts.accountId, column, value, { table, id: opts.recordId })
  if (taken) {
    throw new Error(`This ${opts.kind.toUpperCase()} tag is already on ${taken} and cannot be reused.`)
  }

  const { error } = await supabase
    .from(table)
    .update({ [column]: value, updated_at: new Date().toISOString() })
    .eq('id', opts.recordId)
    .eq('account_id', opts.accountId)
  if (error) throw error

  if (opts.target === 'ledger') {
    await appendTimeline(opts.accountId, opts.recordId, {
      eventType: opts.kind === 'nfc' ? 'nfc_assigned' : 'rfid_assigned',
      summary: `${opts.kind.toUpperCase()} tag assigned`,
      after: { [column]: value },
      actorUserId: opts.userId,
    })
  }
  return value
}

export type TagMatch = {
  target: TagTarget
  id: string
  assetTag: string
  label: string
  matched: 'nfc' | 'rfid' | 'barcode' | 'asset_tag'
}

export async function findAssetByScan(accountId: string, raw: string): Promise<TagMatch | null> {
  const value = normalizeTag(raw)
  if (!value) return null

  const risk = await supabase
    .from('portal_risk_items')
    .select('id, asset_tag, name, nfc_uid, rfid_epc')
    .eq('account_id', accountId)
    .or(`nfc_uid.eq.${value},rfid_epc.eq.${value},asset_tag.eq.${value}`)
    .limit(1)
    .maybeSingle()
  if (risk.data) {
    const row = risk.data
    const matched =
      row.nfc_uid === value ? 'nfc' : row.rfid_epc === value ? 'rfid' : 'asset_tag'
    return { target: 'risk_item', id: row.id, assetTag: row.asset_tag, label: row.name, matched }
  }

  const ledger = await supabase
    .from('aam_assets')
    .select('id, asset_tag, description, nfc_uid, rfid_epc, barcode')
    .eq('account_id', accountId)
    .or(`nfc_uid.eq.${value},rfid_epc.eq.${value},barcode.eq.${value},asset_tag.eq.${value}`)
    .limit(1)
    .maybeSingle()
  if (ledger.data) {
    const row = ledger.data
    const matched =
      row.nfc_uid === value
        ? 'nfc'
        : row.rfid_epc === value
          ? 'rfid'
          : row.barcode === value
            ? 'barcode'
            : 'asset_tag'
    return {
      target: 'ledger',
      id: row.id,
      assetTag: row.asset_tag,
      label: row.description,
      matched,
    }
  }
  return null
}
