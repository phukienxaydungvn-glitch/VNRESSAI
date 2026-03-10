import { Card } from '@/components/ui/card';

const menu = [
  'Tổng quan',
  'Viết kịch bản quảng cáo',
  'Tạo banner quảng cáo',
  'Tạo video quảng cáo',
  'Video của tôi',
  'Banner của tôi',
  'Kịch bản của tôi',
  'Tài khoản'
];

export default function DashboardPage() {
  return (
    <div className="grid gap-6 md:grid-cols-[240px_1fr]">
      <aside className="rounded-2xl border bg-white p-4">
        <ul className="space-y-2 text-sm">
          {menu.map((m) => (
            <li key={m} className="rounded-lg px-3 py-2 hover:bg-slate-100">{m}</li>
          ))}
        </ul>
      </aside>
      <section className="grid gap-4 sm:grid-cols-2">
        <Card title="Số video đã tạo">12</Card>
        <Card title="Số banner đã tạo">31</Card>
        <Card title="Số kịch bản đã viết">54</Card>
        <Card title="Số credit còn lại">20</Card>
      </section>
    </div>
  );
}
