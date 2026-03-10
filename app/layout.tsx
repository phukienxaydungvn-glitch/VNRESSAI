import type { Metadata } from 'next';
import './globals.css';
import { MainNav } from '@/components/layout/main-nav';

export const metadata: Metadata = {
  title: 'AdsVideoAI',
  description: 'Nền tảng AI tạo kịch bản, banner và video quảng cáo.'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="vi">
      <body>
        <MainNav />
        <main className="container-app py-8">{children}</main>
      </body>
    </html>
  );
}
