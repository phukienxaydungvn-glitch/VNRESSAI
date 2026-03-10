import { z } from 'zod';

export const taoKichBanSchema = z.object({
  tenSanPham: z.string().min(2),
  moTaSanPham: z.string().min(10),
  doiTuongKhachHang: z.string().min(3),
  nenTangQuangCao: z.string().min(2),
  doDaiVideo: z.string().min(1)
});

export const taoBannerSchema = z.object({
  tenSanPham: z.string().min(2),
  slogan: z.string().min(2),
  phongCachBanner: z.string().min(2),
  mauChuDao: z.string().min(2),
  kichThuocBanner: z.string().min(2)
});

export const taoVideoSchema = z.object({
  userId: z.string().uuid(),
  kichBanQuangCao: z.string().min(20),
  anhSanPham: z.string().url(),
  phongCachVideo: z.string().min(2),
  giongDoc: z.string().min(2),
  nhacNen: z.string().min(2),
  thoiLuongVideo: z.string().min(1)
});
