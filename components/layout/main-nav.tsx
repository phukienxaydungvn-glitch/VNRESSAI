import Link from 'next/link';

const menus = [
  { href: '/', label: 'Trang chủ' },
  { href: '/cong-cu-mien-phi', label: 'Công cụ miễn phí' },
  { href: '/xu-huong-quang-cao', label: 'Xu hướng quảng cáo' },
  { href: '/tao-video-ai', label: 'Tạo video AI' },
  { href: '/mau-quang-cao', label: 'Mẫu quảng cáo' },
  { href: '/bang-gia', label: 'Bảng giá' },
  { href: '/dang-nhap', label: 'Đăng nhập' }
];

export function MainNav() {
  return (
    <header className="border-b border-slate-200 bg-white">
      <div className="container-app flex h-16 items-center justify-between">
        <Link href="/" className="text-xl font-extrabold text-chinh">
          AdsVideoAI
        </Link>
        <nav className="hidden gap-5 text-sm font-medium md:flex">
          {menus.map((item) => (
            <Link key={item.href} href={item.href} className="text-slate-700 hover:text-chinh">
              {item.label}
            </Link>
          ))}
        </nav>
      </div>
    </header>
  );
}
