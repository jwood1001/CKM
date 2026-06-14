## Session — 06/13/2026 @ 23:15

### Completed Tasks
- Located `jwood1001/CKM` GitHub repo (public, last pushed 2026-03-16) and CKM Vercel project at `ckm-weld.vercel.app`
- Cloned `jwood1001/CKM` into `c:\Claude Code\CKM` via `gh repo clone`
- Deployed site to Vercel production (`npx vercel --prod`) — status: Ready
- Ran VoiceForge scan on all 11 pages — produced full ranked report
- Fixed `services.html` — replaced 7 direction-text passages with patient-facing copy (H1/lead, Urgent Care lead, Red Light lead, Fit3D lead, Microneedling lead, Botox lead, BioTe lead)
- Fixed `resources.html` — replaced hero lead + all 9 resource card descriptions with patient-facing copy
- Fixed `aesthetics.html` — replaced H1/lead + 4 editorial "copy angle" cards with real patient FAQs
- Fixed `index.html` — replaced "Brand voice direction" card, "Audience feeling" card, all 6 Popular Pages descriptions, and CTA direction sentence with patient-facing copy

### Decisions Made
- Site's #1 issue is internal copywriting direction/planning text still visible to patients, not AI word choice — VoiceForge confirmed
- Auto-accept all VoiceForge rewrites unless flagged as uncertain (user instruction mid-session)
- `recommendations.html` is an internal planning doc currently live at `/recommendations.html` — needs discussion about whether to remove from public site

### Next Steps / Pending Queue
- [ ] **glp1-guide.html** — paused, awaiting decision:
  - [ ] Option A: Convert to real GLP-1 education page — rewrite all "what to teach" stubs into actual patient content (semaglutide vs tirzepatide, dosing, side effects, best practices). Header still says "Resource Mockup."
  - [ ] Option B: Skip for now, fix remaining pages first
- [ ] **hormone-support.html** — 5 signals, 3 direction-text passages to fix ("BioTe should not be presented like...", "central to the CKM brand", "Avoid overpromising. BioTe should be described as...")
- [ ] **about.html** — 3 mild AI signals ("personalized care," "individualized treatments," "feel like their best self")
- [ ] **direct-primary-care.html** — 1 direction sentence ("The final site can expand this with clearer expectations and FAQs") + 1 mild AI phrase
- [ ] **medical-weight-loss.html** — 2 mild AI signals only — cleanest content page, low priority
- [ ] **pricing.html** — 1 mild signal — nearly clean, low priority
- [ ] Push all fixed pages to Vercel after full VoiceForge pass is complete
- [ ] Decide what to do with `recommendations.html` (internal planning doc currently publicly accessible)

### Resume Note
VoiceForge pass is 4 of 10 pages done (services, resources, aesthetics, index — all saved locally but not yet pushed to Vercel); paused at glp1-guide.html awaiting A/B decision; continue with hormone-support.html → about.html → direct-primary-care.html → medical-weight-loss.html → pricing.html, then push all to Vercel.
