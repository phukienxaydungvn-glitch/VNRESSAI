const supabaseUrl = process.env.SUPABASE_URL ?? '';
const supabaseAnonKey = process.env.SUPABASE_KEY ?? '';
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY ?? '';

type Value = string | number | boolean | null;

function buildHeaders(useServiceRole = false) {
  const apiKey = useServiceRole ? supabaseServiceRoleKey : supabaseAnonKey;
  return {
    apikey: apiKey,
    Authorization: `Bearer ${apiKey}`,
    'Content-Type': 'application/json',
    Prefer: 'return=representation'
  };
}

function assertConfig(useServiceRole = false) {
  if (!supabaseUrl) throw new Error('Thiếu SUPABASE_URL.');
  if (useServiceRole && !supabaseServiceRoleKey) throw new Error('Thiếu SUPABASE_SERVICE_ROLE_KEY.');
  if (!useServiceRole && !supabaseAnonKey) throw new Error('Thiếu SUPABASE_KEY.');
}

export async function supabaseInsert(table: string, payload: Record<string, Value>, useServiceRole = true) {
  assertConfig(useServiceRole);
  const response = await fetch(`${supabaseUrl}/rest/v1/${table}`, {
    method: 'POST',
    headers: buildHeaders(useServiceRole),
    body: JSON.stringify(payload)
  });

  if (!response.ok) throw new Error(`Không thể lưu dữ liệu ${table}.`);
  return response.json();
}

export async function supabaseSelect(
  table: string,
  select = '*',
  filters?: Record<string, Value>,
  useServiceRole = true
) {
  assertConfig(useServiceRole);
  const url = new URL(`${supabaseUrl}/rest/v1/${table}`);
  url.searchParams.set('select', select);
  if (filters) {
    for (const [key, value] of Object.entries(filters)) {
      url.searchParams.set(key, `eq.${value}`);
    }
  }

  const response = await fetch(url.toString(), {
    headers: buildHeaders(useServiceRole)
  });

  if (!response.ok) throw new Error(`Không thể tải dữ liệu ${table}.`);
  return response.json();
}

export async function supabaseUpdate(
  table: string,
  payload: Record<string, Value>,
  filters: Record<string, Value>,
  useServiceRole = true
) {
  assertConfig(useServiceRole);
  const url = new URL(`${supabaseUrl}/rest/v1/${table}`);
  for (const [key, value] of Object.entries(filters)) {
    url.searchParams.set(key, `eq.${value}`);
  }

  const response = await fetch(url.toString(), {
    method: 'PATCH',
    headers: buildHeaders(useServiceRole),
    body: JSON.stringify(payload)
  });

  if (!response.ok) throw new Error(`Không thể cập nhật dữ liệu ${table}.`);
  return response.json();
}
