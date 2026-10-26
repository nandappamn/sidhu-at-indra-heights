# Sidhu @ Indra Heights — Renovation Command Center

A simplified, mobile-first Jira alternative and media vault custom-built for tracking the **Indra Heights 2BHK 30-Day Renovation**.

---

## 🏗️ Architecture: Why This Stack?

Renovation tracking requires more than a simple to-do list:
1. **Media Vault:** You need to record **Pre-demolition baseline photos** (for society NOC and the downstairs flat ceiling), **In-progress concealed pipe/wiring proof** (before contractors plaster grooves), and **Post-finish handover shots**.
2. **On-Site Mobile Capture:** When standing on-site at Indra Heights, you snap photos directly with your phone camera and tag them to a task or room.
3. **Vendor CRM:** Instant one-tap **WhatsApp** and phone links for tradesmen (Plumber, Electrician, Carpenter, Mason, Painter, Society Office).
4. **Epics & Tasks:** Room-by-room breakdown (Kitchen, Bathrooms, Master Bed, 2nd Bed, Hall, Balcony) with drag-and-drop agile status tracking.

---

## 🚀 Quick Start (Two Ways to Use)

### 1. Instant Local Sandbox Mode (Zero Setup)
Simply open `index.html` in your browser.
* Pre-loaded with your entire 30-day master plan.
* Drag-and-drop Kanban board, media gallery, vendor directory, and subtask checklists all work immediately out-of-the-box in your browser.

### 2. Live Supabase Cloud Sync (Cross-Device Phone + Laptop)
To sync photos and updates live between your phone and laptop:
1. Create a free project at [supabase.com](https://supabase.com).
2. Go to **SQL Editor** in Supabase and run `supabase/schema.sql`.
3. (Optional) Run `supabase/seed.sql` to populate all 30-day master plan tasks and contacts.
4. In **Storage**, create a public bucket named `renovation-media`.
5. Open `index.html`, click the top-right ⚙️ **Settings icon**, and paste your Supabase Project URL and Anon Key.

---

## 📱 Core Features

* **📋 Jira-Style Agile Board:**
  * Columns: `To Do`, `In Progress`, `Blocked / Waiting`, and `Completed`.
  * Grouping options: Agile Status View or 30-Day Timeline Phase View.
  * Filter on-the-fly by Space/Room (`Kitchen`, `Bathroom & WC`, `Master Bed`, `Hall`, `Balcony`) or assigned Contractor.
* **📸 Media Vault (Pre / In-Progress / Post):**
  * Mobile camera capture support (`capture="environment"`).
  * Filter by stage: **Pre-Demolition (Before)**, **In-Progress (Pipes & Walls)**, and **Post-Finish (After)**.
  * Direct linkage to specific tasks (e.g. wall groove photos before plastering).
* **🏛️ Epics & Spaces Roadmap:**
  * Room-by-room completion percentage bars and attached media counters.
* **👷 Contractor & Vendor Directory:**
  * Contact cards with direct **WhatsApp** (`wa.me`) and **Call** links, plus assigned task counters.

---

## 📁 Repository Structure

```text
sidhu-at-indra-heights/
├── index.html                                  # Standalone Mobile/Desktop Command Center App
├── 30_day_2bhk_renovation_master_plan.md        # Master 30-Day Renovation Specification
├── supabase/
│   ├── schema.sql                              # PostgreSQL tables, RLS policies & Storage setup
│   └── seed.sql                                # Complete 30-day Indra Heights seed data
└── README.md                                   # Architecture & setup guide
```
