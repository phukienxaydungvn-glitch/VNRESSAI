import { ReactNode } from 'react';

export function Card({ title, children }: { title?: string; children: ReactNode }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
      {title ? <h3 className="mb-4 text-lg font-bold">{title}</h3> : null}
      {children}
    </div>
  );
}
