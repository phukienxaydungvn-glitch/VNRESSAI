import { supabaseSelect, supabaseUpdate } from '@/lib/supabase';

export async function kiemTraVaTruCredit(userId: string, soCreditCanTru: number) {
  const credits = await supabaseSelect('credits', 'id,balance', { user_id: userId });
  const credit = credits?.[0];

  if (!credit) {
    throw new Error('Không tìm thấy thông tin credit của người dùng.');
  }

  if (credit.balance < soCreditCanTru) {
    throw new Error('Bạn không đủ credit để tạo video.');
  }

  await supabaseUpdate('credits', { balance: credit.balance - soCreditCanTru }, { id: credit.id });
}
