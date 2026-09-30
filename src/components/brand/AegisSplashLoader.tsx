import { cn } from '../../lib/utils'
import { BRAND } from '../../config/brand'

interface AegisSplashLoaderProps {
  /** Full-bleed wordmark (default) or compact pill on page background */
  variant?: 'fullscreen' | 'pill'
  className?: string
  /** Optional short caption under the mark */
  caption?: string
}

/**
 * Brand splash: solid field + bold wordmark.
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
        aria-label={`Loading ${BRAND.name}`}
      >
        <div className="aegis-splash-pill rounded-full bg-primary px-7 py-2.5 shadow-sm">
          <span className="font-[system-ui] text-sm font-bold tracking-[0.18em] text-white">
            {BRAND.name}
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
      aria-label={`Loading ${BRAND.name}`}
    >
      <p className="aegis-splash-wordmark select-none font-[system-ui] text-4xl font-bold tracking-[0.14em] text-white sm:text-5xl">
        {BRAND.name}
      </p>
      <p className="aegis-splash-sub mt-4 text-[10px] font-semibold uppercase tracking-[0.35em] text-white/55">
        {BRAND.tagline}
      </p>
      {caption && <p className="mt-8 text-xs text-white/70">{caption}</p>}
    </div>
  )
}
