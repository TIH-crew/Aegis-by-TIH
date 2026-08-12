import { BRAND } from '../../config/brand'
import { cn } from '../../lib/utils'

/** Shared styles so the circular burgundy mark renders consistently in menu + favicon contexts. */
export const LOGO_MARK_CLASS = 'rounded-full object-cover aspect-square'

interface BrandLogoProps {
  variant?: 'full' | 'mark'
  className?: string
}

export function BrandLogo({ variant = 'full', className }: BrandLogoProps) {
  if (variant === 'mark') {
    return (
      <img
        src={BRAND.logoSrc}
        alt={BRAND.logoAlt}
        className={cn(LOGO_MARK_CLASS, 'h-11 w-11', className)}
        draggable={false}
      />
    )
  }

  return (
    <div className={cn('flex items-center gap-2.5', className)}>
      <img
        src={BRAND.logoSrc}
        alt={BRAND.logoAlt}
        className={cn(LOGO_MARK_CLASS, 'h-10 w-10 shrink-0')}
        draggable={false}
      />
      <p className="text-sm font-semibold leading-tight text-burgundy">{BRAND.fullName}</p>
    </div>
  )
}
