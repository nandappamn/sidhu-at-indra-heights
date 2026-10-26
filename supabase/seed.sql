-- ====================================================================
-- SEED DATA FOR SIDHU @ INDRA HEIGHTS (30-DAY MASTER PLAN)
-- ====================================================================

-- 1. Contacts Seed
insert into public.contacts (id, name, role, phone, whatsapp, company, notes) values
('c0000001-0000-0000-0000-000000000001', 'Indra Heights Society Office', 'Society Manager', '+91 98000 00001', '+919800000001', 'Indra Heights RWA', 'Strict noisy hours: 10 AM to 5 PM. NOC pasted on entrance door.'),
('c0000001-0000-0000-0000-000000000002', 'Ramesh Sharma', 'Mason/Civil', '+91 98000 00002', '+919800000002', 'Sharma Civil Works', 'Demolition, wall plaster, floor leveling & debris removal.'),
('c0000001-0000-0000-0000-000000000003', 'Vijay Kumar', 'Plumber', '+91 98000 00003', '+919800000003', 'Kumar Plumbing', 'CPVC piping, concealed wall mixers, core-cut & ponding test verification.'),
('c0000001-0000-0000-0000-000000000004', 'Suresh Electrician', 'Electrician', '+91 98000 00004', '+919800000004', 'Suresh Electricals', 'FRLS wire pulling, DB upgrade, 16A kitchen lines & false ceiling lights.'),
('c0000001-0000-0000-0000-000000000005', 'Anil Carpenter', 'Carpenter/Modular', '+91 98000 00005', '+919800000005', 'Precision Modulars', 'Factory modular kitchen and 2 bedroom wardrobes assembly team.'),
('c0000001-0000-0000-0000-000000000006', 'Deepak Painter', 'Painter', '+91 98000 00006', '+919800000006', 'Deepak Paint Studio', 'Wall putty, base primer, interior emulsion & balcony weather coat.')
on conflict (id) do nothing;

-- 2. Epics Seed (Rooms & Work Streams)
insert into public.epics (id, title, space, target_week, description, status, sort_order) values
('e0000001-0000-0000-0000-000000000001', 'Site Approvals, Logistics & Pre-Orders', 'Entire Flat', 'Pre-Reno', 'Society NOC, down-stairs baseline check, and 100% factory modular orders.', 'in_progress', 1),
('e0000001-0000-0000-0000-000000000002', 'Kitchen Transformation (Civil & Factory Modular)', 'Kitchen', 'Week 1', 'Granite counter, 6-inch core cut, concealed plumbing, tandem drawers & chimney.', 'in_progress', 2),
('e0000001-0000-0000-0000-000000000003', '1 Bathroom & 1 Washroom Complete Overhaul', 'Bathroom & WC', 'Week 1', 'Full tile stripping, CPVC pipe replacement, polymer waterproofing & anti-skid tiles.', 'planning', 3),
('e0000001-0000-0000-0000-000000000004', 'Living & Dining Hall (False Ceiling & Flooring)', 'Hall', 'Week 2', 'Gypsum false ceiling with COB drops, upgraded MCB DB, tile-on-tile flooring.', 'planning', 4),
('e0000001-0000-0000-0000-000000000005', 'Master Bedroom & Factory Wardrobe', 'Master Bedroom', 'Week 3', 'Tile-on-tile flooring, 2-way bed switches, false ceiling, and factory wardrobe assembly.', 'planning', 5),
('e0000001-0000-0000-0000-000000000006', '2nd Bedroom & Factory Wardrobe', '2nd Bedroom', 'Week 3', 'Tile-on-tile flooring, work desk point, false ceiling, and factory wardrobe assembly.', 'planning', 6),
('e0000001-0000-0000-0000-000000000007', 'Open Balcony Refresh', 'Balcony', 'Week 4', 'Drain trap waterproofing check, weather-proof switchboard, exterior paint & railing enamel.', 'planning', 7)
on conflict (id) do nothing;

-- 3. Tasks Seed
insert into public.tasks (id, epic_id, assigned_contact_id, title, description, days_label, phase, status, priority, sort_order) values
-- Pre-Reno
('t0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000001', 'Society Approvals & Site Logistics', 'Inform building management and paste NOC on the entrance door.', '15–20 Days Before Day 1', 'pre-reno', 'done', 'high', 1),
('t0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000005', 'Factory Modular Orders & Material Dispatch', 'Critical 30-day rule: 100% factory modular production must be triggered in advance.', '15–20 Days Before Day 1', 'pre-reno', 'done', 'critical', 2),

-- Week 1
('t0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000003', 'c0000001-0000-0000-0000-000000000002', 'Demolition & Debris (Malba) Evacuation', 'Never pile debris in the center of the hall slab. Stack along perimeter walls.', 'Days 1–3', 'week-1', 'in_progress', 'high', 3),
('t0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000002', 'c0000001-0000-0000-0000-000000000003', 'Plumbing First Fix & Kitchen Core-Cut', 'Replace old metal GI pipes with CPVC. Drill exterior 6-inch hole for chimney duct.', 'Days 4–6', 'week-1', 'todo', 'critical', 4),
('t0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000004', 'Electrical First Fix (Concealed Wires & Boards)', 'Take high-res photos of all wall grooves before plastering over them!', 'Days 5–7', 'week-1', 'todo', 'high', 5),

-- Week 2
('t0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000003', 'c0000001-0000-0000-0000-000000000003', 'Wet-Area Waterproofing & Ponding Test', 'Flood test for 24–36 hours. Verify zero moisture in ceiling below.', 'Days 8–10', 'week-2', 'todo', 'critical', 6),
('t0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000004', 'False Ceiling Framework & Exhaust Concealment', 'Conceal the rigid kitchen chimney duct inside the ceiling framework.', 'Days 8–12', 'week-2', 'todo', 'medium', 7),
('t0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000003', 'c0000001-0000-0000-0000-000000000002', 'Bathroom, Washroom & Kitchen Tiling', 'Ensure proper slope towards drain trap in bathroom/washroom floors.', 'Days 11–15', 'week-2', 'todo', 'high', 8),

-- Week 3
('t0000001-0000-0000-0000-000000000009', 'e0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000002', '4-Room Main Floor Tiling (Tile-on-Tile)', 'Immediately protect new floors with corrugated sheets / POP.', 'Days 14–18', 'week-3', 'todo', 'high', 9),
('t0000001-0000-0000-0000-000000000010', 'e0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000006', 'Ceiling Taping, Wall Putty & Base Primer', 'Apply 1 base coat primer to seal all masonry dust before carpentry delivery.', 'Days 18–21', 'week-3', 'todo', 'medium', 10),

-- Week 4
('t0000001-0000-0000-0000-000000000011', 'e0000001-0000-0000-0000-000000000002', 'c0000001-0000-0000-0000-000000000005', 'Modular Kitchen & Wardrobe Assembly', 'Assembly only on site—zero cutting or carpentry dust.', 'Days 22–26', 'week-4', 'todo', 'critical', 11),
('t0000001-0000-0000-0000-000000000012', 'e0000001-0000-0000-0000-000000000007', 'c0000001-0000-0000-0000-000000000006', 'Interior Paint Finish Coats & Balcony Refresh', 'Weather-proof exterior paint in balcony + enamel on safety railing.', 'Days 25–27', 'week-4', 'todo', 'medium', 12),
('t0000001-0000-0000-0000-000000000013', 'e0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000004', 'Plumbing & Electrical "Second Fix" (Fittings)', 'Mount sanitaryware, switch plates, fans, lights, and chimney.', 'Days 28–29', 'week-4', 'todo', 'high', 13),
('t0000001-0000-0000-0000-000000000014', 'e0000001-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000002', 'Deep Cleaning, Snag List & Handover', 'Final day touch-up paint over any handling scuffs or fingerprints.', 'Day 30', 'week-4', 'todo', 'critical', 14)
on conflict (id) do nothing;

-- 4. Subtasks Seed
insert into public.subtasks (task_id, title, is_completed, sort_order) values
-- Task 1: Society Approvals
('t0000001-0000-0000-0000-000000000001', 'Society NOC pasted on main door for security and neighbours', true, 1),
('t0000001-0000-0000-0000-000000000001', 'Confirm noisy-work hours with contractors (10:00 AM – 5:00 PM)', true, 2),
('t0000001-0000-0000-0000-000000000001', 'Common area protection: pad lift and lobby walls with corrugated sheets', true, 3),
('t0000001-0000-0000-0000-000000000001', 'Downstairs neighbour check: time-stamped ceiling baseline photos', true, 4),
('t0000001-0000-0000-0000-000000000001', 'Shut-off valves located in the building plumbing shaft', true, 5),
('t0000001-0000-0000-0000-000000000001', 'Electricity load check: 3-Phase meter upgrade for ACs & kitchen appliances', false, 6),

-- Task 2: Pre-orders
('t0000001-0000-0000-0000-000000000002', '100% Factory modular order placed for Kitchen & 2 Bedroom wardrobes', true, 1),
('t0000001-0000-0000-0000-000000000002', 'Finished Floor Level (FFL) locked (+15 mm if tile-on-tile)', true, 2),
('t0000001-0000-0000-0000-000000000002', 'CPVC pipes, fittings, and concealed diverter/mixer bodies on site', true, 3),
('t0000001-0000-0000-0000-000000000002', 'Fast-curing polymer waterproofing chemicals delivered', true, 4),
('t0000001-0000-0000-0000-000000000002', 'Floor & wall tiles + tile-on-tile adhesive + epoxy grout delivered', false, 5),
('t0000001-0000-0000-0000-000000000002', 'FRLS copper wires, modular switchboxes, and new MCB DB delivered', true, 6),
('t0000001-0000-0000-0000-000000000002', 'Kitchen chimney, exhaust fan, and rigid 6-inch duct pipe ready', false, 7),
('t0000001-0000-0000-0000-000000000002', 'Sanitaryware (WC, basin, taps, showerheads) and light fixtures selected', true, 8),

-- Task 3: Demolition
('t0000001-0000-0000-0000-000000000003', 'Strip out old kitchen platform and wall tiles', true, 1),
('t0000001-0000-0000-0000-000000000003', 'Completely strip wall and floor tiles in 1 Bathroom and 1 Washroom', true, 2),
('t0000001-0000-0000-0000-000000000003', 'Bag debris daily into cement sacks and evacuate every 2 days', false, 3),

-- Task 4: Plumbing First Fix
('t0000001-0000-0000-0000-000000000004', 'Replace old 20-yr metal pipes in Bathroom, Washroom, Kitchen with CPVC', false, 1),
('t0000001-0000-0000-0000-000000000004', 'Install concealed wall mixer/diverter bodies and pressure test', false, 2),
('t0000001-0000-0000-0000-000000000004', 'Drill 6-inch core-cut hole through kitchen exterior wall for chimney duct', false, 3),

-- Task 5: Electrical First Fix
('t0000001-0000-0000-0000-000000000004', 'Pull fresh FRLS copper wires through conduits across all 4 rooms', false, 1),
('t0000001-0000-0000-0000-000000000004', 'Cut wall grooves for 16A appliance points and ceiling drops', false, 2),
('t0000001-0000-0000-0000-000000000004', 'Replace old metal switch boxes and upgrade main MCB DB box', false, 3),
('t0000001-0000-0000-0000-000000000004', 'Photograph all open wall grooves with tape measure before plastering', false, 4),

-- Task 6: Waterproofing & Ponding
('t0000001-0000-0000-0000-000000000006', 'Plaster all plumbing/electrical wall grooves using chicken mesh', false, 1),
('t0000001-0000-0000-0000-000000000006', 'Apply 2 coats of fast-curing polymer waterproofing in Bathroom & Washroom', false, 2),
('t0000001-0000-0000-0000-000000000006', 'Seal kitchen sink zone and Open Balcony drain trap perimeter', false, 3),
('t0000001-0000-0000-0000-000000000006', 'Flood test for 24–36 hrs and verify zero dampness with downstairs neighbour', false, 4),

-- Task 7: False Ceiling & Exhaust
('t0000001-0000-0000-0000-000000000007', 'Install GI metal framing for gypsum ceiling in Hall and 2 Bedrooms', false, 1),
('t0000001-0000-0000-0000-000000000007', 'Install and insulate rigid kitchen exhaust duct to exterior core-cut', false, 2),
('t0000001-0000-0000-0000-000000000007', 'Drop electrical wiring for spotlights, COBs, and ceiling fans', false, 3),
('t0000001-0000-0000-0000-000000000007', 'Screw on gypsum boards and check seamless leveling', false, 4),

-- Task 8: Tiling
('t0000001-0000-0000-0000-000000000008', 'Lay wall tiles (up to false ceiling) in Bathroom and Washroom', false, 1),
('t0000001-0000-0000-0000-000000000008', 'Lay anti-skid floor tiles with verified slope towards multi-floor trap', false, 2),
('t0000001-0000-0000-0000-000000000008', 'Set up kitchen granite countertop slab and lay 2-foot dado wall tiles', false, 3),

-- Task 9: 4-Room Flooring
('t0000001-0000-0000-0000-000000000009', 'Lay floor tiles across Hall, Kitchen, Master Bed, 2nd Bed with adhesive', false, 1),
('t0000001-0000-0000-0000-000000000009', 'Check and trim main door & balcony door bottoms for +15mm height increase', false, 2),
('t0000001-0000-0000-0000-000000000009', 'Cover entire floor with heavy corrugated rolls and tape to lock out grit', false, 3),

-- Task 10: Putty & Primer
('t0000001-0000-0000-0000-000000000010', 'Tape and compound all false ceiling gypsum joints with fiber tape', false, 1),
('t0000001-0000-0000-0000-000000000010', 'Apply 2 coats of fast-drying wall putty across Hall and 2 Bedrooms', false, 2),
('t0000001-0000-0000-0000-000000000010', 'Sand walls smooth and apply 1 base coat primer to lock in dust', false, 3),

-- Task 11: Modular Assembly
('t0000001-0000-0000-0000-000000000011', 'Deliver factory carcasses, shutters, and hardware to site', false, 1),
('t0000001-0000-0000-0000-000000000011', 'Team A (Kitchen): Assemble tandem drawers, overhead cabinets, and tall unit', false, 2),
('t0000001-0000-0000-0000-000000000011', 'Team B (Bedrooms): Assemble 2 wardrobes (1 each bedroom) with lofts', false, 3),

-- Task 12: Paint
('t0000001-0000-0000-0000-000000000012', 'Apply 2 coats of premium interior emulsion on ceilings and walls', false, 1),
('t0000001-0000-0000-0000-000000000012', 'Apply weather-proof exterior emulsion in Open Balcony', false, 2),
('t0000001-0000-0000-0000-000000000012', 'Apply anti-corrosion enamel paint on balcony safety railing', false, 3),

-- Task 13: Second Fix
('t0000001-0000-0000-0000-000000000013', 'Electrical: Clip on switch plates, sockets, hang fans, fit LED lights', false, 1),
('t0000001-0000-0000-0000-000000000013', 'Mount kitchen chimney & connect 6-inch rigid exhaust duct', false, 2),
('t0000001-0000-0000-0000-000000000013', 'Plumbing: Install WC in washroom, basin/diverter/geyser in bathroom', false, 3),
('t0000001-0000-0000-0000-000000000013', 'Plumbing: Install kitchen sink, swivel mixer tap, and RO purifier points', false, 4),

-- Task 14: Deep Cleaning
('t0000001-0000-0000-0000-000000000014', 'Remove all floor protection sheets and polish tile joints/epoxy grout', false, 1),
('t0000001-0000-0000-0000-000000000014', 'Professional deep clean of all 4 rooms, wardrobes, cabinets, bathroom, WC', false, 2),
('t0000001-0000-0000-0000-000000000014', 'Touch-up paint over any installation scuffs and inspect final snag list', false, 3);
