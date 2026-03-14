import React from "react";

const cards = [
  { title: "Top Keyword", value: "ai marketing automation" },
  { title: "Top Trend", value: "UGC + AI Ads" },
  { title: "Top Viral Content", value: "Short-form SEO script" },
  { title: "SEO Opportunities", value: "128" },
];

export function DashboardCards(): JSX.Element {
  return (
    <div className="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-4">
      {cards.map((card) => (
        <div key={card.title} className="rounded-2xl bg-slate-900 p-4 text-slate-100 shadow-lg ring-1 ring-slate-700">
          <p className="text-sm text-slate-400">{card.title}</p>
          <p className="mt-2 text-lg font-semibold">{card.value}</p>
        </div>
      ))}
    </div>
  );
}
