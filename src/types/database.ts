export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      portal_accounts: {
        Row: {
          id: string
          name: string
          zoho_account_id: string | null
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          zoho_account_id?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          zoho_account_id?: string | null
          created_at?: string
        }
      }
      portal_risk_items: {
        Row: {
          id: string
          account_id: string
          asset_tag: string
          name: string
          category: string
          unit_cost: number
          repair_cost: number
          record_date: string
          image_url: string | null
          employee_name: string | null
          insurance_status: string
          description: string | null
          serial_number: string | null
          branch: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          account_id: string
          asset_tag: string
          name: string
          category?: string
          unit_cost?: number
          repair_cost?: number
          record_date?: string
          image_url?: string | null
          employee_name?: string | null
          insurance_status?: string
          description?: string | null
          serial_number?: string | null
          branch?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          account_id?: string
          asset_tag?: string
          name?: string
          category?: string
          unit_cost?: number
          repair_cost?: number
          record_date?: string
          image_url?: string | null
          employee_name?: string | null
          insurance_status?: string
          description?: string | null
          serial_number?: string | null
          branch?: string | null
          created_at?: string
          updated_at?: string
        }
      }
    }
  }
}
