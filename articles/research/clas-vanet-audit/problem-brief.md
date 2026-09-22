# Problem Brief — CLAS-for-VANET Report Correctness Audit

**Question:** Are the 23 existing summaries in `articles/summaries/` factually correct against the Zotero ground-truth PDFs, and what fixes are required?

**Scope:**
- Target: all files in `articles/summaries/*.md` (23 papers) + missing `iqbal2023` (PDF exists, no report) = 24 Zotero entries.
- Ground truth: Zotero PDFs under `/home/sam/snap/zotero-snap/common/Zotero/storage/<KEY>/` + bib metadata supplied by user (2026-08-28 snapshot).
- Fix in place in `articles/summaries/`; audit trail in `./research/clas-vanet-audit/`.

**Inclusion / exclusion:**
- Include: all 24 Zotero entries even if off-topic (ECAE/NDN-IoT, Wei/IoT-CLS, Zhang2024/IoMT) — but label scope clearly.
- Exclude: no new literature search; no web search unless PDF is unreadable.

**Date range:** 2014–2026 (Zhang2014 … Tao2026, Wu-Heng 2025-11, Lode 2026-07).

**Known ground-truth constraints (do not guess):**
- `han2022` (eCLAS): Zotero has HTML only (`4GAJGY45/9580742.html`), NO PDF → must be labeled `Abstract-only`, no invented equations.
- `wu2025-collusion` (Wu & Heng): user bib has NO `file` field → treat as `Abstract-only` unless PDF found on disk.
- `iqbal2023` (HECC): PDF `YLVWD2J6` exists but no summary → create it.
- `cahyadi2022-survey`: stub (65 words, 1 Persian line) → full rewrite required.

**Verification standard (G5):**
- Bibliographic fields (title/authors/year/venue/doi/pages) must match Zotero bib exactly.
- Pairing-free schemes MUST NOT show bilinear-pairing `e(...)` verification equations.
- No invented math: generic `D_i=sH(ID_i)` / "Pairing-free equation" placeholders must be replaced with paper-true equations or removed with `Abstract-only` label.
- Every report ends with Provenance block (mode: Full-text / Abstract-only / Unresolvable).

**Locked by user:** 2026-09-21 — "Locked, start all batches". Scope: verify + fix all 24 summaries/*.md vs Zotero PDFs (22 Full-text; han2022 + wu2025-collusion Abstract-only), rewrite each schemes/<key>.md from corrected summary, Professor merges protocols.md + categories + taxonomy. No new literature search.
