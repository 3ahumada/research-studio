-- Execute in Supabase SQL Editor. Authentication alone does NOT sync local drafts.
-- All access is protected with RLS. Only the designated professor can read student work.
create table if not exists public.profiles (
 id uuid primary key references auth.users(id) on delete cascade,
 email text,
 display_name text,
 role text not null default 'student' check (role in ('student','professor','admin')),
 created_at timestamptz not null default now()
);
create table if not exists public.manuscripts (
 id uuid primary key default gen_random_uuid(),
 owner_id uuid not null references auth.users(id) on delete cascade,
 title text not null,
 model text not null default 'IMRyD',
 sections jsonb not null default '{}'::jsonb,
 objective text not null default '',
 notes text not null default '',
 updated_at timestamptz not null default now()
);
alter table public.profiles enable row level security;
alter table public.manuscripts enable row level security;
drop policy if exists "read own profile" on public.profiles;
create policy "read own profile" on public.profiles for select to authenticated using (id=auth.uid());
drop policy if exists "read own manuscripts" on public.manuscripts;
create policy "read own manuscripts" on public.manuscripts for select to authenticated using (owner_id=auth.uid());
drop policy if exists "insert own manuscripts" on public.manuscripts;
create policy "insert own manuscripts" on public.manuscripts for insert to authenticated with check (owner_id=auth.uid());
drop policy if exists "update own manuscripts" on public.manuscripts;
create policy "update own manuscripts" on public.manuscripts for update to authenticated using (owner_id=auth.uid()) with check (owner_id=auth.uid());
drop policy if exists "delete own manuscripts" on public.manuscripts;
create policy "delete own manuscripts" on public.manuscripts for delete to authenticated using (owner_id=auth.uid());
-- Professor access will be added only after verified professor identity and cohort membership.
-- Never make a blanket policy allowing all authenticated users to read all manuscripts.
