import type { DashboardStats, RiskItem, RiskItemInput } from '../types'

export interface DataService {
  getRiskItems(): Promise<RiskItem[]>
  getRiskItem(id: string): Promise<RiskItem | null>
  createRiskItem(input: RiskItemInput): Promise<RiskItem>
  createRiskItemsBulk(inputs: RiskItemInput[]): Promise<RiskItem[]>
  updateRiskItem(id: string, input: Partial<RiskItemInput>): Promise<RiskItem>
  deleteRiskItem(id: string): Promise<void>
  getDashboardStats(): Promise<DashboardStats>
}
