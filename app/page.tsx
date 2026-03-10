import Link from 'next/link';
import { Button } from '@/components/ui/button';

export default function HomePage() {
  return (
    <section className="space-y-8 py-8">
      <div className="space-y-4 text-center">
        <h1 className="text-4xl font-extrabold sm:text-5xl">Tạo Video Quảng Cáo Chỉ Trong 3 Phút Với AI</h1>
        <p className="mx-auto max-w-3xl text-lg text-slate-600">
          Viết kịch bản quảng cáo, tạo banner và sản xuất video quảng cáo tự động bằng AI.
        </p>
      </div>
      <div className="flex flex-wrap justify-center gap-4">
        <Link href="/cong-cu-mien-phi#kich-ban">
          <Button>Viết kịch bản miễn phí</Button>
        </Link>
        <Link href="/cong-cu-mien-phi#banner">
          <Button variant="phu">Tạo banner miễn phí</Button>
        </Link>
        <Link href="/tao-video-ai">
          <Button variant="vien">Tạo video quảng cáo</Button>
        </Link>
      </div>
    </section>
  );
}
