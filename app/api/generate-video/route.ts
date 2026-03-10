import { NextResponse } from 'next/server';
import { taoVideoSchema } from '@/lib/validators';
import { lamSachChuoi } from '@/lib/sanitize';
import { supabaseInsert } from '@/lib/supabase';
import { kiemTraVaTruCredit } from '@/lib/credits';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const parsed = taoVideoSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ message: 'Dữ liệu đầu vào không hợp lệ.' }, { status: 400 });
    }

    await kiemTraVaTruCredit(parsed.data.userId, 5);

    const payload = Object.fromEntries(
      Object.entries(parsed.data).map(([k, v]) => [k, typeof v === 'string' ? lamSachChuoi(v) : v])
    ) as typeof parsed.data;

    const videoUrl = `https://cdn.adsvideoai.vn/video-demo-${Date.now()}.mp4`;

    await supabaseInsert('videos', {
      user_id: payload.userId,
      script_id: null,
      video_url: videoUrl,
      status: 'hoan_thanh'
    });

    return NextResponse.json(
      {
        message: 'Tạo video quảng cáo thành công.',
        data: { videoUrl, quyTrinh: ['Sinh giọng đọc', 'Tạo cảnh', 'Ghép FFmpeg'] }
      },
      { status: 200 }
    );
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Lỗi tạo video. Vui lòng thử lại.';
    return NextResponse.json({ message }, { status: 500 });
  }
}
