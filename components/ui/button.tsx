import { ButtonHTMLAttributes } from 'react';
import { cn } from '@/lib/utils';

type Variant = 'mac-dinh' | 'phu' | 'vien';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: Variant;
}

const variantStyles: Record<Variant, string> = {
  'mac-dinh': 'bg-chinh text-white hover:bg-blue-700',
  phu: 'bg-emerald-600 text-white hover:bg-emerald-700',
  vien: 'border border-slate-300 bg-white text-slate-800 hover:bg-slate-100'
};

export function Button({ className, variant = 'mac-dinh', ...props }: ButtonProps) {
  return (
    <button
      className={cn(
        'inline-flex items-center justify-center rounded-xl px-4 py-2 text-sm font-semibold transition disabled:cursor-not-allowed disabled:opacity-60',
        variantStyles[variant],
        className
      )}
      {...props}
    />
  );
}
