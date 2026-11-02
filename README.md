# Sidhu @ Indra Heights — Renovation Command Center

A simplified, mobile-first Jira alternative and media vault custom-built for tracking the **Indra Heights Renovation**.

---

## 🏗️ Architecture: Why This Stack?

Renovation tracking requires more than a simple to-do list:
1. **Dynamic Task & Checklist Creation from UI:** Create tasks, assign priorities (Critical, High, Medium, Low), set target dates, add detailed scopes, and build step-by-step checklist subtasks directly in the browser.
2. **Inline Quick-Add:** Create tasks in 1 second by typing into any column and hitting Enter.
3. **Epics & Rooms Management:** Define custom rooms/epics (Kitchen, Master Bed, Living Hall, Balcony, etc.) with automated progress bars tracking tasks completed per room.
4. **Vendor CRM:** Maintain vendor records (Plumber, Electrician, Carpenter, Mason, Painter, Society Office) with instant one-tap **WhatsApp** (`wa.me`) and phone calling.
5. **Media Vault:** Record **Pre-demolition baseline photos** (for society NOC and the downstairs flat ceiling), **In-progress concealed pipe/wiring proof** (before contractors plaster grooves), and **Post-finish handover shots**.
7. **🤖 Multimodal AI Copilot (Indra AI):** Interactive ReAct renovation assistant that asks questions, manages tasks with granular checklists, answers queries, archives media proof to the vault, and tracks project progress with native Gemini function calling.

---

## 🚀 Quick Start (Two Ways to Use)

### 1. Instant Local Sandbox Mode (Zero Setup)
Simply open `index.html` in your browser.
* Drag-and-drop Kanban board, inline task quick-add, checklist items, media gallery, and vendor directory all work immediately out-of-the-box in your browser with `localStorage`.

### 2. Live Supabase Cloud Sync (Cross-Device Phone + Laptop)
To sync photos and updates live between your phone and laptop:
1. Create a free project at [supabase.com](https://supabase.com).
2. Go to **SQL Editor** in Supabase and run `supabase/schema.sql`.
3. In **Storage**, create a public bucket named `renovation-media`.
4. Open `index.html`, click the top-right ⚙️ **Settings icon**, and paste your Supabase Project URL and Anon Key.

---

## 📱 Core Features

* **📋 Jira-Style Agile Board:**
  * Columns: `To Do`, `In Progress`, `Blocked / Waiting`, and `Completed`.
  * Inline "+ Add a task..." quick-input inside every column.
  * Drag-and-drop cards between columns with celebration confetti upon completion.
  * Grouping options: By Status or By Room / Epic.
  * Filter on-the-fly by Space/Room, Assigned Contractor, or Priority.
* **✅ Checklist Items & Subtasks:**
  * Add multiple checklist steps while creating or editing tasks.
  * Check/uncheck steps with live completion percentage meters.
* **🏛️ Epics & Spaces Roadmap:**
  * Add, edit, or delete custom renovation spaces and project streams.
  * Room-by-room completion percentage bars and attached media counters.
  * One-click "+ Add Task" directly under any room.
* **👷 Contractor & Vendor Directory:**
  * Add and edit contractors, trades, company names, rates, and notes.
  * Direct one-tap **WhatsApp** and **Call** links, plus assigned task counters.
* **🤖 Multimodal AI Copilot (Indra AI):**
  * Powered by Google **Gemini 3.5 Flash** with ReAct architecture and native function calling.
  * **Interactive ReAct Loop:** Evaluates task ambiguity, asks targeted clarifying questions with one-tap answer buttons, and proposes proactive follow-ups.
  * **Intent & Automated Actions:** Direct natural language actions to create tasks with subtasks, assign contractors, update progress, create epics, or save proof to the Media Vault.
  * **Interactive Action Cards:** Displays live card results in the chat with one-click navigation to inspect the updated board cards.
  * **Renovation Queries:** Ask *"What tasks are blocked?"*, *"Who is the plumber?"*, or *"Summarize overall progress"*.
  * **Multimodal Media Support:** Attach or snap photos/videos of worksite progress, materials, or plans to link directly to tasks and rooms.
* **📸 Media Vault (Pre / In-Progress / Post):**
  * Mobile camera capture support (`capture="environment"`).
  * Filter by stage: **Pre-Demolition (Before)**, **In-Progress (Pipes & Walls)**, and **Post-Finish (After)**.
  * Direct linkage to specific tasks and rooms.

---

## 📁 Repository Structure

```text
sidhu-at-indra-heights/
├── index.html          # Standalone Mobile/Desktop Command Center App
├── supabase/
│   └── schema.sql      # PostgreSQL tables, RLS policies & Storage setup
└── README.md           # Architecture & setup guide
```
