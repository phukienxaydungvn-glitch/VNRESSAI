# AdsVideoAI

Nền tảng SaaS tạo tài sản quảng cáo bằng AI với giao diện tiếng Việt 100%.

## Tính năng chính
- Đăng nhập Google OAuth và OTP số điện thoại qua Supabase Auth.
- Công cụ miễn phí tạo kịch bản quảng cáo và banner quảng cáo.
- Công cụ trả phí tạo video quảng cáo (5 credit/lần).
- Dashboard người dùng và trang quản trị `/admin`.
- API routes chuẩn hoá cho triển khai Vercel.

## Cài đặt
```bash
npm install
npm run build
npm start
```

## Môi trường
Sao chép `.env.example` thành `.env.local` và điền giá trị thật.

## CSDL
Chạy file `db/schema.sql` trên PostgreSQL/Supabase SQL Editor.
