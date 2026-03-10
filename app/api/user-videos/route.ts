import { NextResponse } from 'next/server';
import { supabaseSelect } from '@/lib/supabase';

export async function GET(request: Request) {
  try {
    const userId = new URL(request.url).searchParams.get('userId');
    if (!userId) {
      return NextResponse.json({ message: 'Thiếu userId.' }, { status: 400 });
    }

    const data = await supabaseSelect('videos', '*', { user_id: userId });
    return NextResponse.json({ data }, { status: 200 });
  } catch {
    return NextResponse.json({ message: 'Lỗi tải video. Vui lòng thử lại.' }, { status: 500 });
  }
}
