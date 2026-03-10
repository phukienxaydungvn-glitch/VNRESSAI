'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card } from '@/components/ui/card';

export function ScriptForm() {
  const [duLieu, setDuLieu] = useState({
    tenSanPham: '',
    moTaSanPham: '',
    doiTuongKhachHang: '',
    nenTangQuangCao: '',
    doDaiVideo: ''
  });
  const [ketQua, setKetQua] = useState<any>(null);
  const [trangThai, setTrangThai] = useState('');

  const submit = async () => {
    setTrangThai('Đang tạo kịch bản...');
    const res = await fetch('/api/generate-script', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(duLieu)
    });
    const json = await res.json();
    setTrangThai(json.message || (res.ok ? 'Thành công' : 'Lỗi tạo kịch bản'));
    if (res.ok) setKetQua(json.data);
  };

  return (
    <Card title="AI Script Generator">
      <div className="grid gap-3">
        <Input placeholder="Tên sản phẩm" onChange={(e) => setDuLieu({ ...duLieu, tenSanPham: e.target.value })} />
        <Input placeholder="Mô tả sản phẩm" onChange={(e) => setDuLieu({ ...duLieu, moTaSanPham: e.target.value })} />
        <Input placeholder="Đối tượng khách hàng" onChange={(e) => setDuLieu({ ...duLieu, doiTuongKhachHang: e.target.value })} />
        <Input placeholder="Nền tảng quảng cáo" onChange={(e) => setDuLieu({ ...duLieu, nenTangQuangCao: e.target.value })} />
        <Input placeholder="Độ dài video" onChange={(e) => setDuLieu({ ...duLieu, doDaiVideo: e.target.value })} />
        <Button onClick={submit}>Tạo kịch bản quảng cáo</Button>
      </div>
      {trangThai ? <p className="mt-4 text-sm">{trangThai}</p> : null}
      {ketQua ? (
        <div className="mt-4 space-y-2 text-sm">
          <p><strong>Hook mở đầu:</strong> {ketQua.hook}</p>
          <p><strong>Nội dung chính:</strong> {ketQua.noiDungChinh}</p>
          <p><strong>Ý tưởng hình ảnh:</strong> {ketQua.yTuongHinhAnh}</p>
          <p><strong>Kêu gọi hành động:</strong> {ketQua.keuGoiHanhDong}</p>
        </div>
      ) : null}
    </Card>
  );
}
