import { cn } from '../../lib/utils'

interface AegisSplashLoaderProps {
  /** Full-bleed wordmark (default) or compact pill on page background */
  variant?: 'fullscreen' | 'pill'
  className?: string
  /** Optional short caption under the mark */
  caption?: string
}

/**
 * Yoco-style brand splash: solid field + bold wordmark, Aegis burgundy branding.
 * Shown while auth / app context is still resolving after a deep link.
 */
export function AegisSplashLoader({
  variant = 'fullscreen',
  className,
  caption,
}: AegisSplashLoaderProps) {
  if (variant === 'pill') {
    return (
      <div
        className={cn(
          'flex min-h-[40vh] flex-col items-center justify-center gap-4 bg-page',
          className,
        )}
        role="status"
        aria-live="polite"
        aria-label="Loading Aegis"
      >
        <div className="aegis-splash-pill rounded-full bg-primary px-7 py-2.5 shadow-sm">
          <span className="font-[system-ui] text-sm font-bold tracking-[0.22em] text-white">
            AEGIS
          </span>
        </div>
        {caption && <p className="text-xs text-muted">{caption}</p>}
      </div>
    )
  }

  return (
    <div
      className={cn(
        'aegis-splash-screen fixed inset-0 z-[100] flex flex-col items-center justify-center bg-primary',
        className,
      )}
      role="status"
      aria-live="polite"
      aria-label="Loading Aegis"
    >
      <p className="aegis-splash-wordmark select-none font-[system-ui] text-5xl font-bold tracking-[0.18em] text-white sm:text-6xl">
        AEGIS
      </p>
      <p className="aegis-splash-sub mt-4 text-[10px] font-semibold uppercase tracking-[0.35em] text-white/55">
        by TIH
      </p>
      {caption && <p className="mt-8 text-xs text-white/70">{caption}</p>}
    </div>
  )
}
