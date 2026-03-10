import { NextRequest, NextResponse } from 'next/server';
import { supabaseSelect } from '@/lib/supabase';

export async function middleware(req: NextRequest) {
  if (req.nextUrl.pathname === '/api/generate-video') {
    const userId = req.headers.get('x-user-id');
    if (!userId) {
      return NextResponse.json({ message: 'Thiếu thông tin người dùng để kiểm tra credit.' }, { status: 401 });
    }

    try {
      const rows = await supabaseSelect('credits', 'balance', { user_id: userId });
      const credit = rows?.[0];
      if (!credit || credit.balance < 5) {
        return NextResponse.json({ message: 'Bạn không đủ credit để tạo video.' }, { status: 402 });
      }
    } catch {
      return NextResponse.json({ message: 'Không thể kiểm tra credit.' }, { status: 500 });
    }
  }

  return NextResponse.next();
}

export const config = {
  matcher: ['/api/generate-video']
};
