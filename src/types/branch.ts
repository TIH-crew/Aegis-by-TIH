export interface Branch {
  id: string
  account_id: string
  name: string
  address: string
  latitude: number
  longitude: number
  place_id: string | null
  created_at: string
}

export interface BranchInput {
  name: string
  address: string
  latitude: number
  longitude: number
  place_id?: string | null
}
