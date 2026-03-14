import React from "react";
import { DashboardCards } from "../components/DashboardCards";
import { TrendChart } from "../components/TrendChart";

export default function HomePage(): JSX.Element {
  return (
    <main className="min-h-screen bg-slate-950 p-6">
      <header className="mb-6">
        <h1 className="text-3xl font-bold text-slate-100">TREND RADAR AI</h1>
        <p className="text-slate-400">Desktop AI Marketing Engine - realtime analytics dashboard</p>
      </header>
      <DashboardCards />
      <section className="mt-6 grid grid-cols-1 gap-4 xl:grid-cols-3">
        <div className="xl:col-span-2">
          <TrendChart />
        </div>
        <aside className="rounded-2xl bg-slate-900 p-4 text-slate-100 ring-1 ring-slate-700">
          <h3 className="font-semibold">Automation Pipeline</h3>
          <ol className="mt-3 list-decimal pl-5 text-slate-300 space-y-2">
            <li>Scan trend</li>
            <li>Find keyword</li>
            <li>Generate content</li>
            <li>Create image prompt</li>
            <li>Export campaign assets</li>
          </ol>
        </aside>
      </section>
    </main>
  );
}
