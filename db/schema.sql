create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  email text unique,
  phone text unique,
  name text,
  created_at timestamptz not null default now()
);

create table if not exists credits (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  balance integer not null default 20
);

create table if not exists scripts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users(id) on delete set null,
  product_name text not null,
  script_content text not null,
  created_at timestamptz not null default now()
);

create table if not exists banners (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users(id) on delete set null,
  prompt text not null,
  image_url text not null,
  created_at timestamptz not null default now()
);

create table if not exists videos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  script_id uuid references scripts(id) on delete set null,
  video_url text not null,
  status text not null default 'dang_xu_ly',
  created_at timestamptz not null default now()
);

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  name text not null,
  created_at timestamptz not null default now()
);
