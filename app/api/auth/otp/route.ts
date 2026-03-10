import { NextResponse } from 'next/server';

export async function POST(request: Request) {
  try {
    const { phone } = await request.json();
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseKey = process.env.SUPABASE_KEY;

    if (!phone || !supabaseUrl || !supabaseKey) {
      return NextResponse.json({ message: 'Thiếu dữ liệu gửi OTP.' }, { status: 400 });
    }

    const response = await fetch(`${supabaseUrl}/auth/v1/otp`, {
      method: 'POST',
      headers: {
        apikey: supabaseKey,
        Authorization: `Bearer ${supabaseKey}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ phone, create_user: true })
    });

    if (!response.ok) {
      return NextResponse.json({ message: 'Không gửi được mã OTP.' }, { status: 500 });
    }

    return NextResponse.json({ message: 'Đã gửi mã OTP đến số điện thoại của bạn.' }, { status: 200 });
  } catch {
    return NextResponse.json({ message: 'Lỗi gửi OTP. Vui lòng thử lại.' }, { status: 500 });
  }
}
