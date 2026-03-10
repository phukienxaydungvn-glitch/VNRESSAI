import { Card } from '@/components/ui/card';

const adminMenu = [
  'Bảng điều khiển',
  'Quản lý người dùng',
  'Quản lý video',
  'Quản lý banner',
  'Quản lý kịch bản',
  'Quản lý credit'
];

export default function AdminPage() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold">/admin</h1>
      <div className="grid gap-6 md:grid-cols-[260px_1fr]">
        <aside className="rounded-2xl border bg-white p-4">
          {adminMenu.map((item) => (
            <div key={item} className="rounded-lg px-3 py-2 text-sm hover:bg-slate-100">{item}</div>
          ))}
        </aside>
        <Card title="Quản trị hệ thống">
          <ul className="list-disc space-y-2 pl-5 text-sm">
            <li>Admin có thể xem người dùng.</li>
            <li>Admin có thể xóa nội dung.</li>
            <li>Admin có thể điều chỉnh credit.</li>
          </ul>
        </Card>
      </div>
    </div>
  );
}
