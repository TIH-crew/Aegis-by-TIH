import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom'
import { RequireCapability } from './components/auth/RequireCapability'
import { RequireOrganization } from './components/auth/RequireOrganization'
import { RequireSession } from './components/auth/RequireSession'
import { ShellLayout } from './components/layout/ShellLayout'
import { AuthProvider } from './context/AuthContext'
import { BranchesProvider } from './context/BranchesContext'
import { OrganizationProvider } from './context/OrganizationContext'
import { AddRiskItemPage } from './pages/AddRiskItemPage'
import { AuthCallbackPage } from './pages/AuthCallbackPage'
import { ClaimsPage } from './pages/ClaimsPage'
import { DashboardPage } from './pages/DashboardPage'
import { LoginPage } from './pages/LoginPage'
import { NewClaimPage } from './pages/NewClaimPage'
import { NoAccessPage } from './pages/NoAccessPage'
import { OrganizationSettingsPage } from './pages/OrganizationSettingsPage'
import { PoliciesPage } from './pages/PoliciesPage'
import { PolicyDetailPage } from './pages/PolicyDetailPage'
import { QuotationDetailPage } from './pages/QuotationDetailPage'
import { QuotationsPage } from './pages/QuotationsPage'
import { RiskItemDetailPage } from './pages/RiskItemDetailPage'
import { RiskItemsPage } from './pages/RiskItemsPage'
import { EmployeesPage } from './pages/EmployeesPage'
import { EmployeeDetailPage } from './pages/EmployeeDetailPage'
import { AssignToPage, CheckInPage, CheckOutPage } from './pages/CustodyPages'
import { MyProfilePage } from './pages/MyProfilePage'
import { MyAssetsPage } from './pages/MyAssetsPage'
import { EmployeeClaimPortalPage } from './pages/EmployeeClaimPortalPage'
import { EmployeeClaimEntryPage } from './pages/EmployeeClaimEntryPage'
import { useAuth } from './context/AuthContext'

function HomeRedirect() {
  const { isAdmin, loading } = useAuth()
  if (loading) return <p className="p-6 text-sm text-muted">Loading…</p>
  return <Navigate to={isAdmin ? '/' : '/me/claim'} replace />
}

export default function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/auth/callback" element={<AuthCallbackPage />} />
          {/* Public employee claim portal — WhatsApp OTP gated */}
          <Route path="/claim/:token" element={<EmployeeClaimPortalPage />} />

          <Route element={<RequireSession />}>
            <Route path="/no-access" element={<NoAccessPage />} />

            <Route element={<RequireOrganization />}>
              <Route
                element={
                  <OrganizationProvider>
                    <BranchesProvider>
                      <ShellLayout />
                    </BranchesProvider>
                  </OrganizationProvider>
                }
              >
                <Route element={<RequireCapability capability="employee_claim" />}>
                  <Route path="/me/claim" element={<EmployeeClaimEntryPage />} />
                </Route>

                <Route element={<RequireCapability capability="my_profile" />}>
                  <Route path="/me" element={<MyProfilePage />} />
                </Route>
                <Route element={<RequireCapability capability="my_assets" />}>
                  <Route path="/me/assets" element={<MyAssetsPage />} />
                </Route>

                <Route element={<RequireCapability capability="dashboard_full" />}>
                  <Route path="/" element={<DashboardPage />} />
                </Route>

                <Route element={<RequireCapability capability="settings" />}>
                  <Route path="/settings/organization" element={<OrganizationSettingsPage />} />
                </Route>

                <Route element={<RequireCapability capability="risk_items" />}>
                  <Route path="/collections/risk-items" element={<RiskItemsPage />} />
                  <Route path="/collections/risk-items/new" element={<AddRiskItemPage />} />
                  <Route path="/collections/risk-items/:id" element={<RiskItemDetailPage />} />
                </Route>

                <Route element={<RequireCapability capability="quotations" />}>
                  <Route path="/collections/quotations" element={<QuotationsPage />} />
                  <Route path="/collections/quotations/:id" element={<QuotationDetailPage />} />
                </Route>

                <Route element={<RequireCapability capability="policies" />}>
                  <Route path="/collections/policies" element={<PoliciesPage />} />
                  <Route path="/collections/policies/:id" element={<PolicyDetailPage />} />
                </Route>

                <Route element={<RequireCapability capability="claims" />}>
                  <Route path="/collections/claims" element={<ClaimsPage />} />
                  <Route path="/collections/claims/new" element={<NewClaimPage />} />
                </Route>

                <Route element={<RequireCapability capability="employees" />}>
                  <Route path="/collections/employees" element={<EmployeesPage />} />
                  <Route path="/collections/employees/new" element={<EmployeeDetailPage />} />
                  <Route path="/collections/employees/:id" element={<EmployeeDetailPage />} />
                </Route>

                <Route element={<RequireCapability capability="forms_custody" />}>
                  <Route path="/forms/assign-to" element={<AssignToPage />} />
                  <Route path="/forms/check-out" element={<CheckOutPage />} />
                  <Route path="/forms/check-in" element={<CheckInPage />} />
                </Route>
              </Route>
            </Route>
          </Route>

          <Route path="*" element={<HomeRedirect />} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  )
}
