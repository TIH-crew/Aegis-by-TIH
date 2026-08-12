import {
  Building2,
  Calendar,
  CheckCircle2,
  FileText,
  Layers,
  Mail,
  MapPin,
  Phone,
  Shield,
} from 'lucide-react'
import { BRAND } from '../../config/brand'
import {
  buildPolicyScheduleModel,
  formatScheduleDate,
  formatScheduleMoney,
  groupLinesBySection,
  isActivePolicyStatus,
} from '../../lib/policy-schedule'
import type { PolicyDetail } from '../../types/crm'
import './policy-schedule.css'

const BROKER_FOOTER = {
  phone: '0800 123 4567',
  email: 'quotes@theinsurancehub.co.za',
  location: 'Hartbeespoort, South Africa',
  legal: 'The Insurance Hub (Pty) Ltd · FSP License #12345',
} as const

interface PolicyScheduleDocumentProps {
  policy: PolicyDetail
  clientName: string
  brokerLogoSrc?: string
}

function ScheduleFooter({ policyNumber, insurer }: { policyNumber: string; insurer: string | null }) {
  return (
    <div className="policy-schedule-footer">
      <div
        style={{
          display: 'grid',
          gridTemplateColumns: '1fr 1fr 1fr',
          gap: 16,
        }}
      >
        <span style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
          <Phone size={12} />
          <strong>{BROKER_FOOTER.phone}</strong>
        </span>
        <span style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
          <Mail size={12} />
          <strong>{BROKER_FOOTER.email}</strong>
        </span>
        <span style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
          <MapPin size={12} />
          <strong>{BROKER_FOOTER.location}</strong>
        </span>
      </div>
      <div
        style={{
          marginTop: 4,
          paddingTop: 4,
          borderTop: '1px solid rgba(255,255,255,0.2)',
          fontSize: 8,
          opacity: 0.75,
          textAlign: 'center',
        }}
      >
        {BROKER_FOOTER.legal} · {policyNumber}
        {insurer ? ` · ${insurer}` : ''}
      </div>
    </div>
  )
}

function InfoRow({
  icon,
  label,
  value,
}: {
  icon: React.ReactNode
  label: string
  value: string
}) {
  return (
    <div style={{ display: 'flex', gap: 6, alignItems: 'flex-start' }}>
      <span style={{ color: 'var(--schedule-primary)', flexShrink: 0, marginTop: 1 }}>{icon}</span>
      <span style={{ color: 'var(--schedule-muted)', minWidth: 80 }}>{label}:</span>
      <span style={{ fontWeight: 600 }}>{value}</span>
    </div>
  )
}

function PremiumBlock({ label, value }: { label: string; value: string }) {
  return (
    <div
      style={{
        background: 'var(--schedule-panel)',
        borderRadius: 5,
        padding: '6px 8px',
        border: '1px solid var(--schedule-border)',
      }}
    >
      <div style={{ fontSize: 8.5, color: 'var(--schedule-muted)', marginBottom: 2 }}>{label}</div>
      <div
        style={{
          fontWeight: 700,
          fontSize: 10.5,
          fontFamily: 'ui-monospace, monospace',
          color: 'var(--schedule-primary)',
        }}
      >
        {value}
      </div>
    </div>
  )
}

export function PolicyScheduleDocument({
  policy,
  clientName,
  brokerLogoSrc = BRAND.logoSrc,
}: PolicyScheduleDocumentProps) {
  const model = buildPolicyScheduleModel(policy, clientName)
  const sections = groupLinesBySection(model.lines)
  const combinedTotal = model.totalMonthlyPremium
  const hasOtherCharges = model.otherCharges > 0.005

  return (
    <div className="policy-schedule-screen">
      <div className="policy-schedule-doc">
        {/* Page 1 — summary */}
        <div className="policy-schedule-page">
          <div className="policy-schedule-header">
            <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
              <img
                src={brokerLogoSrc}
                alt={BRAND.logoAlt}
                style={{ height: 36, objectFit: 'contain' }}
                onError={(e) => {
                  e.currentTarget.style.display = 'none'
                }}
              />
              <div>
                <div
                  style={{
                    fontSize: 18,
                    fontWeight: 800,
                    fontFamily: 'Georgia, serif',
                    letterSpacing: '-0.02em',
                  }}
                >
                  Policy Schedule Summary
                </div>
                <div style={{ fontSize: 9.5, opacity: 0.8 }}>Comprehensive Cover Overview</div>
              </div>
            </div>
            <div style={{ textAlign: 'right', fontSize: 10, opacity: 0.85 }}>Page 1</div>
          </div>

          <div className="policy-schedule-body">
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
              <div
                style={{
                  background: 'var(--schedule-panel)',
                  borderRadius: 6,
                  padding: '10px 14px',
                  border: '1px solid var(--schedule-border)',
                }}
              >
                <div
                  style={{
                    fontSize: 9,
                    color: 'var(--schedule-muted)',
                    fontWeight: 600,
                    textTransform: 'uppercase',
                    letterSpacing: '0.06em',
                    marginBottom: 6,
                  }}
                >
                  Policy Holder
                </div>
                <div
                  style={{
                    fontWeight: 800,
                    fontSize: 16,
                    color: 'var(--schedule-primary)',
                    marginBottom: 6,
                  }}
                >
                  {model.clientName}
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: 4, fontSize: 10.5 }}>
                  <InfoRow
                    icon={<FileText size={12} />}
                    label="Policy Number"
                    value={model.policyNumber}
                  />
                  {policy.insurer_policy_number && (
                    <InfoRow
                      icon={<FileText size={12} />}
                      label="Insurer ref"
                      value={policy.insurer_policy_number}
                    />
                  )}
                  <InfoRow
                    icon={<Building2 size={12} />}
                    label="Insurer"
                    value={model.insurer ?? '—'}
                  />
                  {policy.frequency && (
                    <InfoRow
                      icon={<Calendar size={12} />}
                      label="Frequency"
                      value={policy.frequency}
                    />
                  )}
                  <InfoRow
                    icon={<Calendar size={12} />}
                    label="Inception"
                    value={formatScheduleDate(model.inceptionDate)}
                  />
                  <InfoRow
                    icon={<Calendar size={12} />}
                    label="Renewal"
                    value={formatScheduleDate(model.renewalDate)}
                  />
                  {model.productLine && (
                    <InfoRow
                      icon={<Shield size={12} />}
                      label="Product"
                      value={model.productLine}
                    />
                  )}
                </div>
              </div>

              <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                <div
                  style={{
                    background: 'var(--schedule-primary)',
                    borderRadius: 6,
                    padding: '10px 14px',
                    color: 'var(--schedule-primary-fg)',
                  }}
                >
                  <div
                    style={{
                      fontSize: 9,
                      opacity: 0.8,
                      textTransform: 'uppercase',
                      letterSpacing: '0.06em',
                      marginBottom: 4,
                    }}
                  >
                    Total Monthly Premium
                  </div>
                  <div
                    style={{
                      fontSize: 28,
                      fontWeight: 800,
                      fontFamily: 'ui-monospace, monospace',
                      letterSpacing: '-0.02em',
                    }}
                  >
                    {formatScheduleMoney(combinedTotal)}
                  </div>
                  <div style={{ fontSize: 9, opacity: 0.75, marginTop: 2 }}>
                    {hasOtherCharges ? 'incl. SASRIA & fees where applicable' : 'per policy schedule'}
                  </div>
                </div>
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 6 }}>
                  <PremiumBlock label="Base Premium" value={formatScheduleMoney(model.basePremium)} />
                  <PremiumBlock
                    label="SASRIA & fees"
                    value={hasOtherCharges ? formatScheduleMoney(model.otherCharges) : '—'}
                  />
                  <PremiumBlock label="Sections" value={String(sections.length)} />
                </div>
                <div
                  style={{
                    background: 'var(--schedule-panel)',
                    borderRadius: 6,
                    padding: '7px 10px',
                    border: '1px solid var(--schedule-border)',
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                  }}
                >
                  <span style={{ fontSize: 10, color: 'var(--schedule-muted)' }}>Total Insured Value</span>
                  <span
                    style={{
                      fontWeight: 800,
                      fontSize: 13,
                      fontFamily: 'ui-monospace, monospace',
                      color: 'var(--schedule-primary)',
                    }}
                  >
                    {formatScheduleMoney(model.totalInsuredValue)}
                  </span>
                </div>
                <div
                  style={{
                    background: 'var(--schedule-panel)',
                    borderRadius: 6,
                    padding: '7px 10px',
                    border: '1px solid var(--schedule-border)',
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                  }}
                >
                  <span style={{ fontSize: 10, color: 'var(--schedule-muted)' }}>Total Risk Items</span>
                  <span style={{ fontWeight: 800, fontSize: 13, color: 'var(--schedule-primary)' }}>
                    {model.totalItems} items across {sections.length} sections
                  </span>
                </div>
              </div>
            </div>

            <div>
              <div
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: 6,
                  fontWeight: 700,
                  fontSize: 12,
                  marginBottom: 6,
                  color: 'var(--schedule-primary)',
                }}
              >
                <Layers size={16} />
                Section Breakdown
              </div>
              <div
                style={{
                  border: '1px solid var(--schedule-border)',
                  borderRadius: 6,
                  overflow: 'hidden',
                }}
              >
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 10 }}>
                  <thead>
                    <tr>
                      {['Section', 'Items', 'Insured Value', 'Monthly Premium'].map((heading, i) => (
                        <th
                          key={heading}
                          style={{
                            background: 'var(--schedule-panel)',
                            padding: '5px 10px',
                            textAlign: i === 0 ? 'left' : i === 1 ? 'center' : 'right',
                            fontWeight: 700,
                            fontSize: 9,
                            textTransform: 'uppercase',
                            letterSpacing: '0.04em',
                            color: 'var(--schedule-muted)',
                            borderBottom: '1.5px solid var(--schedule-border)',
                          }}
                        >
                          {heading}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody>
                    {sections.map((sec, i) => (
                      <tr key={sec.section}>
                        <td
                          style={{
                            padding: '4px 10px',
                            borderBottom: '1px solid #ece8e0',
                            background: i % 2 === 1 ? 'var(--schedule-row-alt)' : 'white',
                            fontWeight: 500,
                          }}
                        >
                          {sec.section}
                        </td>
                        <td
                          style={{
                            padding: '4px 10px',
                            borderBottom: '1px solid #ece8e0',
                            background: i % 2 === 1 ? 'var(--schedule-row-alt)' : 'white',
                            textAlign: 'center',
                            color: 'var(--schedule-muted)',
                          }}
                        >
                          {sec.items.length}
                        </td>
                        <td
                          style={{
                            padding: '4px 10px',
                            borderBottom: '1px solid #ece8e0',
                            background: i % 2 === 1 ? 'var(--schedule-row-alt)' : 'white',
                            textAlign: 'right',
                            fontFamily: 'ui-monospace, monospace',
                          }}
                        >
                          {sec.insuredValue > 0 ? formatScheduleMoney(sec.insuredValue) : '—'}
                        </td>
                        <td
                          style={{
                            padding: '4px 10px',
                            borderBottom: '1px solid #ece8e0',
                            background: i % 2 === 1 ? 'var(--schedule-row-alt)' : 'white',
                            textAlign: 'right',
                            fontFamily: 'ui-monospace, monospace',
                            fontWeight: 600,
                            color: 'var(--schedule-primary)',
                          }}
                        >
                          {formatScheduleMoney(sec.premium)}
                        </td>
                      </tr>
                    ))}
                    <tr>
                      <td
                        colSpan={2}
                        style={{
                          padding: '5px 10px',
                          background: 'var(--schedule-primary)',
                          color: 'var(--schedule-primary-fg)',
                          fontWeight: 800,
                          fontSize: 10.5,
                        }}
                      >
                        TOTAL
                      </td>
                      <td
                        style={{
                          padding: '5px 10px',
                          background: 'var(--schedule-primary)',
                          color: 'var(--schedule-primary-fg)',
                          fontWeight: 800,
                          fontSize: 10.5,
                          textAlign: 'right',
                          fontFamily: 'ui-monospace, monospace',
                        }}
                      >
                        {formatScheduleMoney(model.totalInsuredValue)}
                      </td>
                      <td
                        style={{
                          padding: '5px 10px',
                          background: 'var(--schedule-primary)',
                          color: 'var(--schedule-primary-fg)',
                          fontWeight: 800,
                          fontSize: 10.5,
                          textAlign: 'right',
                          fontFamily: 'ui-monospace, monospace',
                        }}
                      >
                        {formatScheduleMoney(model.basePremium)}
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            {isActivePolicyStatus(model.status) && (
              <div
                style={{
                  display: 'flex',
                  gap: 8,
                  alignItems: 'flex-start',
                  background: '#f0fdf4',
                  border: '1px solid #bbf7d0',
                  borderRadius: 5,
                  padding: '8px 10px',
                }}
              >
                <CheckCircle2 size={16} style={{ color: '#16a34a', flexShrink: 0, marginTop: 1 }} />
                <div style={{ fontSize: 10 }}>
                  <span style={{ fontWeight: 700, color: '#166534' }}>
                    Policy Status: {model.status ?? 'Active'}
                  </span>
                  <span style={{ color: 'var(--schedule-muted)', marginLeft: 8 }}>
                    All risk items listed reflect the current schedule. Detailed item breakdown follows
                    on the next page. Premium amounts are monthly where shown.
                  </span>
                </div>
              </div>
            )}

            <div
              style={{
                textAlign: 'center',
                fontSize: 9,
                color: 'var(--schedule-muted)',
                fontStyle: 'italic',
              }}
            >
              Detailed item-level schedule continues on page 2, grouped by insurance section.
            </div>
          </div>

          <ScheduleFooter policyNumber={model.policyNumber} insurer={model.insurer} />
        </div>

        {/* Page 2+ — section detail */}
        <div className="policy-schedule-page" style={{ minHeight: 'auto' }}>
          <div className="policy-schedule-table-header">
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <img
                src={brokerLogoSrc}
                alt={BRAND.logoAlt}
                style={{ height: 22, objectFit: 'contain' }}
                onError={(e) => {
                  e.currentTarget.style.display = 'none'
                }}
              />
              <span style={{ fontWeight: 700 }}>{model.clientName}</span>
              <span style={{ opacity: 0.7 }}>·</span>
              <span style={{ opacity: 0.8 }}>{model.policyNumber}</span>
            </div>
            <span style={{ opacity: 0.8 }}>Detailed Schedule — All Sections</span>
          </div>

          <div className="policy-schedule-detail">
            {sections.length === 0 ? (
              <p style={{ padding: '24px 0', fontSize: 11, color: 'var(--schedule-muted)' }}>
                No covered items on this policy schedule yet.
              </p>
            ) : (
              sections.map((sec) => (
                <div key={sec.section} className="policy-schedule-section-block">
                  <div className="policy-schedule-section-heading">
                    <Shield size={11} style={{ flexShrink: 0 }} />
                    {sec.section}
                    <span style={{ marginLeft: 'auto', opacity: 0.85, fontWeight: 400, fontSize: 9 }}>
                      {sec.items.length} item{sec.items.length === 1 ? '' : 's'}
                    </span>
                  </div>

                  <table className="policy-schedule-table">
                    <thead>
                      <tr>
                        <th style={{ width: '52%' }}>Item Description</th>
                        <th className="num" style={{ width: '20%' }}>
                          Insured Value
                        </th>
                        <th className="num" style={{ width: '18%' }}>
                          Premium (incl.)
                        </th>
                        <th style={{ width: '10%' }}>Section</th>
                      </tr>
                    </thead>
                    <tbody>
                      {sec.items.map((row, i) => (
                        <tr key={`${sec.section}-${i}`}>
                          <td>{row.description}</td>
                          <td className="num">
                            {row.insuredAmount > 0 ? formatScheduleMoney(row.insuredAmount) : '—'}
                          </td>
                          <td className="num">
                            {row.premium > 0 ? formatScheduleMoney(row.premium) : 'Incl.'}
                          </td>
                          <td style={{ fontSize: 8.5, color: 'var(--schedule-muted)' }}>{sec.section}</td>
                        </tr>
                      ))}
                      <tr className="policy-schedule-section-total">
                        <td>Section Total</td>
                        <td className="num">
                          {sec.insuredValue > 0 ? formatScheduleMoney(sec.insuredValue) : '—'}
                        </td>
                        <td className="num">{formatScheduleMoney(sec.premium)}</td>
                        <td />
                      </tr>
                    </tbody>
                  </table>
                </div>
              ))
            )}

            {sections.length > 0 && (
              <table className="policy-schedule-table" style={{ marginTop: 12, marginBottom: 14 }}>
                <tbody>
                  <tr className="policy-schedule-grand-total">
                    <td style={{ width: '52%' }}>
                      GRAND TOTAL — All Sections ({model.totalItems} items)
                    </td>
                    <td className="num" style={{ width: '20%' }}>
                      {formatScheduleMoney(model.totalInsuredValue)}
                    </td>
                    <td className="num" style={{ width: '18%' }}>
                      {formatScheduleMoney(model.basePremium)}
                    </td>
                    <td style={{ width: '10%' }} />
                  </tr>
                  <tr>
                    <td
                      colSpan={4}
                      style={{
                        fontSize: 9,
                        color: 'var(--schedule-muted)',
                        fontStyle: 'italic',
                        paddingTop: 6,
                      }}
                    >
                      {hasOtherCharges && (
                        <>
                          SASRIA & fees: {formatScheduleMoney(model.otherCharges)} ·{' '}
                        </>
                      )}
                      Combined monthly total: {formatScheduleMoney(combinedTotal)}
                    </td>
                  </tr>
                </tbody>
              </table>
            )}
          </div>

          <div className="policy-schedule-footer" style={{ marginTop: 'auto' }}>
            <div
              style={{
                display: 'grid',
                gridTemplateColumns: '1fr 1fr 1fr',
                gap: 16,
                fontSize: 9,
              }}
            >
              <span style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
                <Phone size={10} />
                <strong>{BROKER_FOOTER.phone}</strong>
              </span>
              <span style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
                <Mail size={10} />
                <strong>{BROKER_FOOTER.email}</strong>
              </span>
              <span style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
                <MapPin size={10} />
                <strong>{BROKER_FOOTER.location}</strong>
              </span>
            </div>
            <div
              style={{
                marginTop: 3,
                paddingTop: 3,
                borderTop: '1px solid rgba(255,255,255,0.2)',
                fontSize: 7.5,
                opacity: 0.75,
                textAlign: 'center',
              }}
            >
              {BROKER_FOOTER.legal} · This is a summary schedule only. Refer to full policy wording
              for exact terms and conditions.
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
