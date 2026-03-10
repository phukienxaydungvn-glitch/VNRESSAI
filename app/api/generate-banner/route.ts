import { NextResponse } from 'next/server';
import { taoBannerSchema } from '@/lib/validators';
import { lamSachChuoi } from '@/lib/sanitize';
import { supabaseInsert } from '@/lib/supabase';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const parsed = taoBannerSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ message: 'Dữ liệu đầu vào không hợp lệ.' }, { status: 400 });
    }

    const payload = Object.fromEntries(Object.entries(parsed.data).map(([k, v]) => [k, lamSachChuoi(v)])) as typeof parsed.data;

    const imageUrl = `https://dummyimage.com/1200x628/1d4ed8/ffffff&text=${encodeURIComponent(payload.tenSanPham)}`;

    await supabaseInsert('banners', {
      user_id: null,
      prompt: `${payload.tenSanPham} - ${payload.slogan} - ${payload.phongCachBanner}`,
      image_url: imageUrl
    });

    return NextResponse.json({ message: 'Tạo banner thành công.', data: { imageUrl } }, { status: 200 });
  } catch {
    return NextResponse.json({ message: 'Lỗi tạo banner. Vui lòng thử lại.' }, { status: 500 });
  }
}
