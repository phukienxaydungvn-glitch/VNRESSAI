"use client";

import React from "react";
import { Line } from "react-chartjs-2";
import { CategoryScale, Chart as ChartJS, LinearScale, LineElement, PointElement, Tooltip, Legend } from "chart.js";

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Tooltip, Legend);

export function TrendChart(): JSX.Element {
  const data = {
    labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
    datasets: [
      {
        label: "Trend Score",
        data: [42, 54, 48, 69, 72, 76, 91],
        borderColor: "#22d3ee",
        backgroundColor: "rgba(34, 211, 238, 0.2)",
      },
    ],
  };

  return (
    <div className="rounded-2xl bg-slate-900 p-4 shadow-lg ring-1 ring-slate-700">
      <h3 className="mb-3 text-slate-100 font-semibold">Trend Radar</h3>
      <Line data={data} />
    </div>
  );
}
