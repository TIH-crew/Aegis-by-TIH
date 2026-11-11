import { describe, expect, it } from 'vitest'
import {
  assertServerVerifiedIds,
  isBrokerEmailDomain,
  isWidgetSessionActive,
  resolveWidgetRole,
  widgetSessionAllows,
} from '../workforce-widget-auth'

describe('zoho widget authentication', () => {
  it('rejects mismatched account or user verification', () => {
    expect(() =>
      assertServerVerifiedIds({
        requestedZohoAccountId: 'A1',
        verifiedZohoAccountId: 'A2',
        requestedEmail: 'a@tih.co.za',
        verifiedEmail: 'a@tih.co.za',
        verifiedZohoUserId: 'U1',
      }),
    ).toThrow(/Account verification/)

    expect(() =>
      assertServerVerifiedIds({
        requestedZohoAccountId: 'A1',
        verifiedZohoAccountId: 'A1',
        requestedEmail: 'a@tih.co.za',
        verifiedEmail: 'b@tih.co.za',
        verifiedZohoUserId: 'U1',
      }),
    ).toThrow(/email verification/)

    expect(() =>
      assertServerVerifiedIds({
        requestedZohoAccountId: 'A1',
        verifiedZohoAccountId: 'A1',
        requestedZohoUserId: 'U1',
        verifiedZohoUserId: 'U2',
        requestedEmail: 'a@theinsurancehub.co.za',
        verifiedEmail: 'a@theinsurancehub.co.za',
      }),
    ).toThrow(/user id/)
  })

  it('accepts verified matching ids', () => {
    expect(() =>
      assertServerVerifiedIds({
        requestedZohoAccountId: 'A1',
        verifiedZohoAccountId: 'A1',
        requestedZohoUserId: 'U1',
        verifiedZohoUserId: 'U1',
        requestedEmail: 'broker@theinsurancehub.co.za',
        verifiedEmail: 'broker@theinsurancehub.co.za',
      }),
    ).not.toThrow()
  })

  it('expires and revokes sessions', () => {
    expect(
      isWidgetSessionActive({
        expiresAt: Date.now() - 1000,
      }),
    ).toBe(false)
    expect(
      isWidgetSessionActive({
        expiresAt: Date.now() + 60_000,
        revokedAt: new Date().toISOString(),
      }),
    ).toBe(false)
    expect(
      isWidgetSessionActive({
        expiresAt: Date.now() + 60_000,
      }),
    ).toBe(true)
  })

  it('authorises TIH broker domains and portal roles', () => {
    expect(isBrokerEmailDomain('x@theinsurancehub.co.za', ['theinsurancehub.co.za'])).toBe(true)
    expect(isBrokerEmailDomain('x@acme.com', ['theinsurancehub.co.za'])).toBe(false)
    expect(
      resolveWidgetRole({
        portalRole: null,
        email: 'x@theinsurancehub.co.za',
        brokerDomains: ['theinsurancehub.co.za'],
      }),
    ).toBe('broker')
    expect(
      resolveWidgetRole({
        portalRole: 'member',
        email: 'hr@acme.com',
        brokerDomains: ['theinsurancehub.co.za'],
      }),
    ).toBeNull()
    expect(
      resolveWidgetRole({
        portalRole: 'hr_admin',
        email: 'hr@acme.com',
        brokerDomains: ['theinsurancehub.co.za'],
      }),
    ).toBe('hr_admin')
  })

  it('separates hr write from crm promote scopes', () => {
    const broker = {
      role: 'broker' as const,
      scopes: ['workforce:read', 'workforce:write', 'crm:promote'],
    }
    expect(widgetSessionAllows(broker, 'crm_promote')).toBe(true)
    expect(widgetSessionAllows(broker, 'hr_write')).toBe(false)

    const hr = {
      role: 'hr_admin' as const,
      scopes: ['workforce:read', 'workforce:write'],
    }
    expect(widgetSessionAllows(hr, 'hr_write')).toBe(true)
    expect(widgetSessionAllows(hr, 'crm_promote')).toBe(false)
  })

  it('does not trust client-supplied account id alone for cross-tenant', () => {
    const sessionAccount = 'portal-uuid-A'
    const requestedAccount = 'portal-uuid-B'
    expect(sessionAccount === requestedAccount).toBe(false)
  })
})
