import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  Bar,
  BarChart,
  CartesianGrid,
  Cell,
  Legend,
  Line,
  LineChart,
  Pie,
  PieChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { ArrowRight, Users } from 'lucide-react'
import { EmptyState, PageHeader } from '../components/workspace/WorkspaceUi'
import { useAuth } from '../context/AuthContext'
import { cn, formatCurrency } from '../lib/utils'
import {
  getPeopleBenefitsAnalytics,
  type MetricValue,
  type PeopleBenefitsAnalytics,
} from '../services/people-benefits-analytics.service'

const CHART_BURGUNDY = '#630d16'
const CHART_MUTED = '#9ca3af'
const CHART_SECONDARY = '#b45309'
const PIE_COLORS = ['#630d16', '#9f1239', '#b45309', '#57534e', '#a8a29e', '#78716c']

function formatMetric(m: MetricValue): string {
  const showValue =
    (m.availability === 'available' || m.availability === 'derived') && m.value != null
  if (!showValue) {
    if (m.availability === 'not_connected') return 'Not connected'
    if (m.availability === 'awaiting_provider') return 'Awaiting data'
    return '—'
  }
  if (m.unit === 'percent') return `${m.value}%`
  if (m.unit === 'zar') return formatCurrency(m.value as number)
  return String(m.value)
}

function KpiCard({
  label,
  metric,
  to,
  hint,
}: {
  label: string
  metric: MetricValue
  to?: string
  hint?: string
}) {
  const hasValue =
    (metric.availability === 'available' || metric.availability === 'derived') &&
    metric.value != null
  const inner = (
    <div
      className={cn(
        'ws-panel h-full px-3.5 py-3 transition-colors',
        to && 'hover:border-primary/40 hover:bg-accent-light/30',
      )}
    >
      <div className="flex items-start justify-between gap-2">
        <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">{label}</p>
        {to && <ArrowRight size={14} className="shrink-0 text-primary" />}
      </div>
      <p
        className={cn(
          'mt-1 text-lg font-semibold tabular-nums tracking-tight',
          hasValue ? 'text-ink' : 'text-muted',
        )}
      >
        {formatMetric(metric)}
      </p>
      <p className="mt-0.5 text-[11px] leading-snug text-muted">
        {hint ?? metric.note ?? (to ? 'Open directory' : undefined)}
      </p>
    </div>
  )
  return to ? <Link to={to}>{inner}</Link> : inner
}

function Section({
  title,
  description,
  children,
}: {
  title: string
  description?: string
  children: React.ReactNode
}) {
  return (
    <section className="space-y-3">
      <div>
        <h2 className="text-base font-semibold text-ink">{title}</h2>
        {description && <p className="mt-0.5 text-sm text-muted">{description}</p>}
      </div>
      {children}
    </section>
  )
}

function ChartPanel({
  title,
  children,
  empty,
}: {
  title: string
  children?: React.ReactNode
  empty?: { title: string; description: string }
}) {
  return (
    <div className="ws-panel flex min-h-[260px] flex-col p-4">
      <h3 className="text-sm font-semibold text-ink">{title}</h3>
      <div className="mt-3 min-h-0 flex-1">
        {empty ? (
          <EmptyState title={empty.title} description={empty.description} />
        ) : (
          children
        )}
      </div>
    </div>
  )
}

export function PeopleBenefitsOverviewPage() {
  const { accountId, can } = useAuth()
  const [data, setData] = useState<PeopleBenefitsAnalytics | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const canView = can('employees') || can('workforce_hr') || can('workforce_broker')

  useEffect(() => {
    if (!accountId || !canView) return
    setLoading(true)
    setError(null)
    void getPeopleBenefitsAnalytics(accountId)
      .then(setData)
      .catch((err) => setError(err instanceof Error ? err.message : 'Failed to load analytics'))
      .finally(() => setLoading(false))
  }, [accountId, canView])

  if (!canView) {
    return (
      <EmptyState
        title="Workforce analytics unavailable"
        description="Your role does not include organisation-wide people and benefits analytics."
      />
    )
  }

  return (
    <div className="space-y-6">
      <PageHeader
        title="People & Benefits"
        description="Workforce overview for insurance, retirement funds, medical aid and employee benefits. Financial provider feeds show only when connected."
        meta={
          data ? (
            <p className="text-xs text-muted">
              Reporting period: {data.reportingPeriod.label} · As of{' '}
              {new Date(data.reportingPeriod.asOf).toLocaleString('en-ZA')}
            </p>
          ) : undefined
        }
        actions={
          <Link
            to="/people/employees"
            className="inline-flex items-center gap-2 rounded-md border border-border bg-surface px-3.5 py-2 text-sm font-medium hover:bg-page"
          >
            <Users size={14} />
            View employees
          </Link>
        }
      />

      {loading && <p className="text-sm text-muted">Loading workforce analytics…</p>}
      {error && <p className="text-sm text-red-600">{error}</p>}

      {data && (
        <>
          {data.isDemoOverlay && (
            <div
              className="rounded-md border border-amber-200 bg-amber-50 px-3.5 py-2.5 text-sm text-amber-950"
              role="status"
            >
              <span className="font-semibold">Sample demonstration data.</span>{' '}
              Membership and headcount charts use real AEGIS records where present. Fund value,
              contribution and medical financial series are illustrative overlays for UI preview —
              not live administrator or scheme feeds. Set{' '}
              <code className="rounded bg-amber-100 px-1 text-xs">VITE_PEOPLE_DEMO_DATA=false</code>{' '}
              to hide overlays.
            </div>
          )}

          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
            <KpiCard
              label="Total employees"
              metric={data.kpis.totalEmployees}
              to="/people/employees"
              hint="Open employee directory"
            />
            <KpiCard
              label="Pension participation"
              metric={data.kpis.pensionParticipation}
              hint={
                data.kpis.pensionParticipation.note ??
                `${data.retirement.participation?.enrolled ?? 0} enrolled of ${data.kpis.activeEmployees.value ?? 0} active`
              }
            />
            <KpiCard
              label="Aggregate retirement fund value"
              metric={data.kpis.aggregateRetirementFundValue}
            />
            <KpiCard
              label="Medical aid participation"
              metric={data.kpis.medicalAidParticipation}
              hint={
                data.kpis.medicalAidParticipation.note ??
                `${data.medicalAid.participation?.enrolled ?? 0} enrolled of ${data.kpis.activeEmployees.value ?? 0} active`
              }
            />
          </div>

          <Section
            title="Retirement funds"
            description={data.retirement.note}
          >
            <div className="grid gap-3 lg:grid-cols-2">
              <ChartPanel
                title="Membership participation"
                empty={
                  !data.retirement.participation
                    ? {
                        title: 'No retirement memberships registered',
                        description:
                          'Register pension or provident memberships on employee profiles. Fund balances are not invented.',
                      }
                    : undefined
                }
              >
                {data.retirement.participation && (
                  <div className="h-52">
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart
                        data={[
                          {
                            name: 'HR / enrolled',
                            count: data.retirement.participation.enrolled,
                          },
                          {
                            name: 'Provider confirmed',
                            count: data.retirement.participation.providerConfirmed,
                          },
                          {
                            name: 'HR declared only',
                            count: data.retirement.participation.hrDeclared,
                          },
                        ]}
                      >
                        <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
                        <XAxis dataKey="name" tick={{ fontSize: 11 }} />
                        <YAxis allowDecimals={false} tick={{ fontSize: 11 }} />
                        <Tooltip />
                        <Bar dataKey="count" fill={CHART_BURGUNDY} radius={[4, 4, 0, 0]} />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                )}
              </ChartPanel>

              <ChartPanel
                title={
                  data.isDemoOverlay
                    ? 'Fund value & contributions (sample)'
                    : 'Fund value, contributions & investment performance'
                }
                empty={
                  !data.retirement.fundValueSeries
                    ? {
                        title: 'Awaiting provider data',
                        description:
                          'Closing fund value, employer/employee contributions, investment gains/losses and benefit payments require fund administrator feeds. Growth will not be labelled as investment return without an authoritative source.',
                      }
                    : undefined
                }
              >
                {data.retirement.fundValueSeries && (
                  <div className="h-52">
                    <ResponsiveContainer width="100%" height="100%">
                      <LineChart data={data.retirement.fundValueSeries}>
                        <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
                        <XAxis dataKey="period" tick={{ fontSize: 10 }} />
                        <YAxis
                          yAxisId="value"
                          tick={{ fontSize: 10 }}
                          tickFormatter={(v) =>
                            v >= 1_000_000 ? `${(v / 1_000_000).toFixed(1)}m` : String(v)
                          }
                        />
                        <YAxis
                          yAxisId="flow"
                          orientation="right"
                          tick={{ fontSize: 10 }}
                          tickFormatter={(v) =>
                            v >= 1_000 ? `${Math.round(v / 1_000)}k` : String(v)
                          }
                        />
                        <Tooltip
                          formatter={(value, name) => [
                            typeof value === 'number' ? formatCurrency(value) : String(value ?? ''),
                            String(name),
                          ]}
                        />
                        <Legend wrapperStyle={{ fontSize: 11 }} />
                        <Line
                          yAxisId="value"
                          type="monotone"
                          dataKey="closingValue"
                          name="Closing value"
                          stroke={CHART_BURGUNDY}
                          strokeWidth={2}
                          dot={{ r: 2 }}
                        />
                        <Line
                          yAxisId="flow"
                          type="monotone"
                          dataKey="employerContributions"
                          name="Employer contrib."
                          stroke={CHART_SECONDARY}
                          strokeWidth={1.5}
                          strokeDasharray={data.isDemoOverlay ? '4 3' : undefined}
                          dot={false}
                        />
                        <Line
                          yAxisId="flow"
                          type="monotone"
                          dataKey="investmentGain"
                          name="Investment movement"
                          stroke={CHART_MUTED}
                          strokeWidth={1.5}
                          strokeDasharray={data.isDemoOverlay ? '4 3' : undefined}
                          dot={false}
                        />
                      </LineChart>
                    </ResponsiveContainer>
                  </div>
                )}
              </ChartPanel>
            </div>
          </Section>

          <Section title="Medical aid" description={data.medicalAid.note}>
            <div className="grid gap-3 lg:grid-cols-2">
              <ChartPanel
                title="Scheme distribution"
                empty={
                  data.medicalAid.schemeDistribution.length === 0
                    ? {
                        title: 'No medical aid memberships registered',
                        description:
                          'Enrolment counts appear once medical aid memberships exist. Contribution totals await scheme feeds.',
                      }
                    : undefined
                }
              >
                {data.medicalAid.schemeDistribution.length > 0 && (
                  <div className="h-52">
                    <ResponsiveContainer width="100%" height="100%">
                      <PieChart>
                        <Pie
                          data={data.medicalAid.schemeDistribution}
                          dataKey="count"
                          nameKey="name"
                          innerRadius={48}
                          outerRadius={72}
                          paddingAngle={2}
                        >
                          {data.medicalAid.schemeDistribution.map((_, i) => (
                            <Cell key={i} fill={PIE_COLORS[i % PIE_COLORS.length]} />
                          ))}
                        </Pie>
                        <Tooltip />
                        <Legend wrapperStyle={{ fontSize: 12 }} />
                      </PieChart>
                    </ResponsiveContainer>
                  </div>
                )}
              </ChartPanel>

              <ChartPanel
                title={
                  data.isDemoOverlay
                    ? 'Contributions & enrolment (sample)'
                    : 'Contributions & enrolment trend'
                }
                empty={
                  !data.medicalAid.contributionTotals
                    ? {
                        title: 'Data not connected',
                        description:
                          'Monthly employer/employee medical contributions and enrolment trends require medical scheme integrations. Individual claims and diagnoses are never shown on this dashboard.',
                      }
                    : undefined
                }
              >
                {data.medicalAid.contributionTotals && (
                  <div className="h-52">
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={data.medicalAid.contributionTotals}>
                        <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
                        <XAxis dataKey="period" tick={{ fontSize: 10 }} />
                        <YAxis
                          tick={{ fontSize: 10 }}
                          tickFormatter={(v) =>
                            v >= 1_000 ? `${Math.round(v / 1_000)}k` : String(v)
                          }
                        />
                        <Tooltip
                          formatter={(value, name) => [
                            typeof value === 'number' ? formatCurrency(value) : String(value ?? ''),
                            String(name),
                          ]}
                        />
                        <Legend wrapperStyle={{ fontSize: 11 }} />
                        <Bar
                          dataKey="employer"
                          name="Employer"
                          stackId="c"
                          fill={CHART_BURGUNDY}
                          radius={[0, 0, 0, 0]}
                        />
                        <Bar
                          dataKey="employee"
                          name="Employee"
                          stackId="c"
                          fill={CHART_SECONDARY}
                          radius={[3, 3, 0, 0]}
                        />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                )}
              </ChartPanel>
            </div>
          </Section>

          <Section
            title="Workforce trends"
            description={data.workforceTrends.note}
          >
            <div className="grid gap-3 lg:grid-cols-2">
              <ChartPanel
                title="Joiners and departures (12 months)"
                empty={
                  data.workforceTrends.series.every((p) => p.joiners === 0 && p.departures === 0)
                    ? {
                        title: 'No joiners or departures in dated records',
                        description:
                          'Trends use employment start and end dates. Capture those dates on employee records to populate this chart.',
                      }
                    : undefined
                }
              >
                <div className="h-52">
                  <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={data.workforceTrends.series}>
                      <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
                      <XAxis dataKey="period" tick={{ fontSize: 10 }} />
                      <YAxis allowDecimals={false} tick={{ fontSize: 11 }} />
                      <Tooltip />
                      <Legend wrapperStyle={{ fontSize: 12 }} />
                      <Bar dataKey="joiners" name="Joiners" fill={CHART_BURGUNDY} radius={[3, 3, 0, 0]} />
                      <Bar
                        dataKey="departures"
                        name="Departures"
                        fill={CHART_SECONDARY}
                        radius={[3, 3, 0, 0]}
                      />
                    </BarChart>
                  </ResponsiveContainer>
                </div>
              </ChartPanel>

              <ChartPanel
                title="Reconstructed headcount"
                empty={
                  data.workforceTrends.quality === 'insufficient_dates'
                    ? {
                        title: 'Insufficient employment dates',
                        description: data.workforceTrends.note,
                      }
                    : undefined
                }
              >
                {data.workforceTrends.quality !== 'insufficient_dates' && (
                  <div className="h-52">
                    <ResponsiveContainer width="100%" height="100%">
                      <LineChart data={data.workforceTrends.series}>
                        <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
                        <XAxis dataKey="period" tick={{ fontSize: 10 }} />
                        <YAxis allowDecimals={false} tick={{ fontSize: 11 }} />
                        <Tooltip />
                        <Line
                          type="monotone"
                          dataKey="headcount"
                          name="Headcount"
                          stroke={CHART_BURGUNDY}
                          strokeWidth={2}
                          dot={{ r: 3 }}
                          connectNulls={false}
                        />
                      </LineChart>
                    </ResponsiveContainer>
                  </div>
                )}
              </ChartPanel>
            </div>

            <div className="grid gap-2 sm:grid-cols-3">
              <div className="ws-panel px-3.5 py-3">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Active</p>
                <p className="mt-1 text-lg font-semibold tabular-nums">
                  {data.kpis.activeEmployees.value ?? 0}
                </p>
              </div>
              <div className="ws-panel px-3.5 py-3">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">Inactive</p>
                <p className="mt-1 text-lg font-semibold tabular-nums">
                  {data.kpis.inactiveEmployees.value ?? 0}
                </p>
              </div>
              <div className="ws-panel px-3.5 py-3">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">
                  Pending invites
                </p>
                <p className="mt-1 text-lg font-semibold tabular-nums">
                  {data.kpis.pendingInvites.value ?? 0}
                </p>
              </div>
            </div>
          </Section>

          <Section
            title="Other employee benefits"
            description="Gap cover, group life, disability and funeral — participation only where memberships exist."
          >
            {data.otherBenefits.length === 0 ? (
              <EmptyState
                title="No other benefit memberships registered"
                description="Compact analytics appear here once gap cover, group life, disability or funeral memberships are recorded. Aggregate financials await provider feeds."
              />
            ) : (
              <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
                {data.otherBenefits.map((b) => (
                  <div key={b.benefitType} className="ws-panel px-3.5 py-3">
                    <p className="text-[11px] font-semibold uppercase tracking-wide text-muted">
                      {b.label}
                    </p>
                    <p className="mt-1 text-lg font-semibold tabular-nums">{b.enrolled}</p>
                    <p className="text-[11px] text-muted">
                      {b.providerConfirmed} provider confirmed · financials not connected
                    </p>
                  </div>
                ))}
              </div>
            )}
          </Section>

          <Section title="Data freshness & integrations">
            <div className="ws-panel overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead className="border-b border-border bg-page text-left text-xs uppercase text-muted">
                  <tr>
                    <th className="px-4 py-2">Provider</th>
                    <th className="px-4 py-2">Last sync</th>
                    <th className="px-4 py-2">Reporting period</th>
                    <th className="px-4 py-2">Availability</th>
                    <th className="px-4 py-2">Reconciliation</th>
                  </tr>
                </thead>
                <tbody>
                  {data.dataFreshness.map((row) => (
                    <tr key={row.provider} className="border-b border-border last:border-0">
                      <td className="px-4 py-2.5 font-medium">{row.provider}</td>
                      <td className="px-4 py-2.5 text-muted">
                        {row.lastSync
                          ? new Date(row.lastSync).toLocaleString('en-ZA')
                          : '—'}
                      </td>
                      <td className="px-4 py-2.5 text-muted">{row.reportingPeriod}</td>
                      <td className="px-4 py-2.5 capitalize text-muted">
                        {row.availability.replace(/_/g, ' ')}
                      </td>
                      <td className="px-4 py-2.5 text-muted">{row.reconciliationStatus}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <p className="text-xs text-muted">
              Open exceptions requiring review:{' '}
              <Link to="/people/employees" className="font-medium text-primary underline">
                {data.kpis.openExceptions.value ?? 0} in directory
              </Link>
              <span className="ml-2 inline-block h-2 w-2 rounded-full" style={{ background: CHART_MUTED }} />
            </p>
          </Section>
        </>
      )}
    </div>
  )
}
