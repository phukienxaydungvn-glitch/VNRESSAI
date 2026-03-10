import { NextResponse } from 'next/server';

export async function GET() {
  try {
    const supabaseUrl = process.env.SUPABASE_URL;
    const redirectTo = `${process.env.NEXT_PUBLIC_APP_URL}/dashboard`;
    if (!supabaseUrl) {
      return NextResponse.json({ message: 'Thiếu cấu hình đăng nhập Google.' }, { status: 500 });
    }

    const url = `${supabaseUrl}/auth/v1/authorize?provider=google&redirect_to=${encodeURIComponent(redirectTo)}`;
    return NextResponse.json({ url }, { status: 200 });
  } catch {
    return NextResponse.json({ message: 'Lỗi khởi tạo đăng nhập Google.' }, { status: 500 });
  }
}
