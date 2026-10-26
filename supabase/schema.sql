-- ====================================================================
-- SIDHU @ INDRA HEIGHTS: RENOVATION COMMAND CENTER DATABASE SCHEMA
-- Supabase (PostgreSQL + Storage + RLS)
-- ====================================================================

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- 1. EPICS (Major Renovation Rooms / Project Streams)
create table if not exists public.epics (
  id uuid primary key default uuid_generate_v4(),
  title text not null,
  space text not null, -- 'Kitchen', 'Bathroom & WC', 'Master Bedroom', '2nd Bedroom', 'Hall', 'Balcony', 'Entire Flat'
  target_week text not null, -- 'Pre-Reno', 'Week 1', 'Week 2', 'Week 3', 'Week 4'
  description text,
  status text not null default 'planning' check (status in ('planning', 'in_progress', 'completed', 'blocked')),
  sort_order int default 0,
  created_at timestamptz default now()
);

-- 2. CONTACTS (Contractors, Vendors, Society Management Directory)
create table if not exists public.contacts (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  role text not null, -- 'Plumber', 'Electrician', 'Carpenter/Modular', 'Mason/Civil', 'Painter', 'Waterproofing Specialist', 'False Ceiling', 'Tile Vendor', 'Society Manager'
  phone text not null,
  whatsapp text,
  company text,
  notes text,
  created_at timestamptz default now()
);

-- 3. TASKS (Jira-Style Agile Work Items)
create table if not exists public.tasks (
  id uuid primary key default uuid_generate_v4(),
  epic_id uuid references public.epics(id) on delete set null,
  assigned_contact_id uuid references public.contacts(id) on delete set null,
  title text not null,
  description text,
  days_label text, -- e.g. 'Days 1–3', 'Days 8–10'
  phase text not null default 'week-1' check (phase in ('pre-reno', 'week-1', 'week-2', 'week-3', 'week-4')),
  status text not null default 'todo' check (status in ('todo', 'in_progress', 'blocked', 'done')),
  priority text not null default 'medium' check (priority in ('low', 'medium', 'high', 'critical')),
  sort_order int default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- 4. SUBTASKS (Checklist Items inside a Task / Epic)
create table if not exists public.subtasks (
  id uuid primary key default uuid_generate_v4(),
  task_id uuid not null references public.tasks(id) on delete cascade,
  title text not null,
  is_completed boolean not null default false,
  sort_order int default 0,
  created_at timestamptz default now()
);

-- 5. MEDIA VAULT (Pre / In-Progress / Post Photos & Videos)
create table if not exists public.media (
  id uuid primary key default uuid_generate_v4(),
  task_id uuid references public.tasks(id) on delete set null,
  epic_id uuid references public.epics(id) on delete set null,
  file_url text not null,
  storage_path text not null,
  file_type text not null default 'image' check (file_type in ('image', 'video')),
  stage text not null default 'in_progress' check (stage in ('pre', 'in_progress', 'post')),
  caption text,
  room_tag text not null default 'Entire Flat',
  uploaded_at timestamptz default now()
);

-- 6. BUDGET & EXPENSES (Optional tracking tied to Vendors & Tasks)
create table if not exists public.expenses (
  id uuid primary key default uuid_generate_v4(),
  task_id uuid references public.tasks(id) on delete set null,
  contact_id uuid references public.contacts(id) on delete set null,
  item_name text not null,
  category text not null, -- 'Civil', 'Plumbing', 'Electrical', 'Modular', 'Paint', 'Tiles', 'Sanitaryware', 'Society Fee'
  estimated_cost numeric default 0,
  actual_cost numeric default 0,
  status text not null default 'pending' check (status in ('pending', 'advance_paid', 'fully_paid')),
  receipt_url text,
  created_at timestamptz default now()
);

-- ====================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- Default: Public read & write for personal renovation project tracker
-- (Can be restricted to authenticated users when adding Supabase Auth)
-- ====================================================================

alter table public.epics enable row level security;
alter table public.contacts enable row level security;
alter table public.tasks enable row level security;
alter table public.subtasks enable row level security;
alter table public.media enable row level security;
alter table public.expenses enable row level security;

-- Open policies for personal project (easy setup without complex auth first)
create policy "Allow all operations on epics" on public.epics for all using (true) with check (true);
create policy "Allow all operations on contacts" on public.contacts for all using (true) with check (true);
create policy "Allow all operations on tasks" on public.tasks for all using (true) with check (true);
create policy "Allow all operations on subtasks" on public.subtasks for all using (true) with check (true);
create policy "Allow all operations on media" on public.media for all using (true) with check (true);
create policy "Allow all operations on expenses" on public.expenses for all using (true) with check (true);

-- ====================================================================
-- SUPABASE STORAGE BUCKET CONFIGURATION
-- ====================================================================
-- In Supabase Dashboard -> Storage:
-- Create a public bucket named: 'renovation-media'
-- Max file size: 50MB (handles HD photos & short video walk-throughs)
-- Allowed MIME types: image/*, video/*
