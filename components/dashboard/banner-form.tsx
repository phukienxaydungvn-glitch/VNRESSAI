'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card } from '@/components/ui/card';

export function BannerForm() {
  const [duLieu, setDuLieu] = useState({ tenSanPham: '', slogan: '', phongCachBanner: '', mauChuDao: '', kichThuocBanner: '' });
  const [anhUrl, setAnhUrl] = useState('');
  const [trangThai, setTrangThai] = useState('');

  const submit = async () => {
    setTrangThai('Đang tạo banner...');
    const res = await fetch('/api/generate-banner', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(duLieu)
    });
    const json = await res.json();
    setTrangThai(json.message || (res.ok ? 'Thành công' : 'Lỗi tạo banner'));
    if (res.ok) setAnhUrl(json.data.imageUrl);
  };

  return (
    <Card title="AI Banner Generator">
      <div className="grid gap-3">
        <Input placeholder="Tên sản phẩm" onChange={(e) => setDuLieu({ ...duLieu, tenSanPham: e.target.value })} />
        <Input placeholder="Slogan" onChange={(e) => setDuLieu({ ...duLieu, slogan: e.target.value })} />
        <Input placeholder="Phong cách banner" onChange={(e) => setDuLieu({ ...duLieu, phongCachBanner: e.target.value })} />
        <Input placeholder="Màu chủ đạo" onChange={(e) => setDuLieu({ ...duLieu, mauChuDao: e.target.value })} />
        <Input placeholder="Kích thước banner" onChange={(e) => setDuLieu({ ...duLieu, kichThuocBanner: e.target.value })} />
        <Button onClick={submit}>Tạo banner</Button>
      </div>
      {trangThai ? <p className="mt-4 text-sm">{trangThai}</p> : null}
      {anhUrl ? <img src={anhUrl} alt="Banner đã tạo" className="mt-4 rounded-xl" /> : null}
    </Card>
  );
}
