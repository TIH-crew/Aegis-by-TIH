interface PlaceholderPageProps {
  title: string
}

export function PlaceholderPage({ title }: PlaceholderPageProps) {
  return (
    <div className="rounded-lg border border-border bg-surface p-8 text-center shadow-sm">
      <h1 className="text-xl font-semibold">{title}</h1>
      <p className="mt-2 text-sm text-muted">
        This collection will be wired to Supabase in the next phase.
      </p>
    </div>
  )
}
