import { NextResponse } from 'next/server';
import { taoKichBanSchema } from '@/lib/validators';
import { lamSachChuoi } from '@/lib/sanitize';
import { supabaseInsert } from '@/lib/supabase';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const parsed = taoKichBanSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ message: 'Dữ liệu đầu vào không hợp lệ.' }, { status: 400 });
    }

    const payload = Object.fromEntries(Object.entries(parsed.data).map(([k, v]) => [k, lamSachChuoi(v)])) as typeof parsed.data;

    const prompt = `Viết kịch bản quảng cáo cho ${payload.tenSanPham}.`;
    const script = {
      hook: `Bạn đã thử ${payload.tenSanPham} chưa?`,
      noiDungChinh: `${payload.moTaSanPham}. Nhắm tới ${payload.doiTuongKhachHang} trên ${payload.nenTangQuangCao}, độ dài ${payload.doDaiVideo}.`,
      yTuongHinhAnh: 'Cảnh sản phẩm cận cảnh + khách hàng thật sử dụng trong đời sống.',
      keuGoiHanhDong: 'Nhấn ngay để nhận ưu đãi hôm nay!'
    };

    await supabaseInsert('scripts', {
      user_id: null,
      product_name: payload.tenSanPham,
      script_content: `${prompt}\n${JSON.stringify(script)}`
    });

    return NextResponse.json({ message: 'Tạo kịch bản thành công.', data: script }, { status: 200 });
  } catch {
    return NextResponse.json({ message: 'Lỗi tạo kịch bản. Vui lòng thử lại.' }, { status: 500 });
  }
}
