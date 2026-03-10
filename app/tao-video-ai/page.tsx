'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card } from '@/components/ui/card';

export default function TaoVideoPage() {
  const [duLieu, setDuLieu] = useState({
    userId: '',
    kichBanQuangCao: '',
    anhSanPham: '',
    phongCachVideo: '',
    giongDoc: '',
    nhacNen: '',
    thoiLuongVideo: ''
  });
  const [thongBao, setThongBao] = useState('');
  const [videoUrl, setVideoUrl] = useState('');

  const taoVideo = async () => {
    setThongBao('Đang tạo video quảng cáo...');
    const res = await fetch('/api/generate-video', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(duLieu)
    });
    const json = await res.json();
    setThongBao(json.message || (res.ok ? 'Thành công' : 'Lỗi tạo video. Vui lòng thử lại.'));
    if (res.ok) setVideoUrl(json.data.videoUrl);
  };

  return (
    <Card title="Tạo video quảng cáo">
      <div className="grid gap-3">
        <Input placeholder="User ID" onChange={(e) => setDuLieu({ ...duLieu, userId: e.target.value })} />
        <Input placeholder="Kịch bản quảng cáo" onChange={(e) => setDuLieu({ ...duLieu, kichBanQuangCao: e.target.value })} />
        <Input placeholder="Ảnh sản phẩm (URL)" onChange={(e) => setDuLieu({ ...duLieu, anhSanPham: e.target.value })} />
        <Input placeholder="Phong cách video" onChange={(e) => setDuLieu({ ...duLieu, phongCachVideo: e.target.value })} />
        <Input placeholder="Giọng đọc" onChange={(e) => setDuLieu({ ...duLieu, giongDoc: e.target.value })} />
        <Input placeholder="Nhạc nền" onChange={(e) => setDuLieu({ ...duLieu, nhacNen: e.target.value })} />
        <Input placeholder="Thời lượng video" onChange={(e) => setDuLieu({ ...duLieu, thoiLuongVideo: e.target.value })} />
        <Button onClick={taoVideo}>Tạo video quảng cáo</Button>
      </div>
      {thongBao ? <p className="mt-4 text-sm">{thongBao}</p> : null}
      {videoUrl ? (
        <a className="mt-4 inline-block text-chinh underline" href={videoUrl} target="_blank">
          Tải video đã tạo
        </a>
      ) : null}
    </Card>
  );
}
