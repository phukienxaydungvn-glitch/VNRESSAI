'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';

export function LoginForm() {
  const [soDienThoai, setSoDienThoai] = useState('');
  const [thongBao, setThongBao] = useState('');

  const dangNhapGoogle = async () => {
    const res = await fetch('/api/auth/google');
    const json = await res.json();
    if (res.ok && json.url) {
      window.location.href = json.url;
      return;
    }
    setThongBao('Không thể đăng nhập Google.');
  };

  const guiOtp = async () => {
    const res = await fetch('/api/auth/otp', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ phone: soDienThoai })
    });
    const json = await res.json();
    setThongBao(json.message || 'Không gửi được mã OTP.');
  };

  return (
    <div className="space-y-4 rounded-2xl border bg-white p-6 shadow-sm">
      <h1 className="text-2xl font-bold">Đăng nhập vào AdsVideoAI</h1>
      <Button onClick={dangNhapGoogle} className="w-full">
        Đăng nhập bằng Google
      </Button>
      <div className="space-y-2">
        <label className="text-sm font-medium">Số điện thoại</label>
        <Input value={soDienThoai} onChange={(e) => setSoDienThoai(e.target.value)} placeholder="+849xxxxxxxx" />
      </div>
      <Button variant="vien" onClick={guiOtp} className="w-full">
        Gửi mã OTP
      </Button>
      {thongBao ? <p className="text-sm text-slate-600">{thongBao}</p> : null}
    </div>
  );
}
