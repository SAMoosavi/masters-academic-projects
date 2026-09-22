# Plan — Build reports/ + vault/ + fa/ (scorecard item #10, 0/10 → target 9/10)

> Three crew rounds, one Dr. per paper per round (≤5 parallel), each Dr. spawns
> exactly 1 Master and audits it. Ground truth: audited `summaries/<key>.md` +
> `research/clas-vanet-audit/sources/<key>.txt` (NO re-read of Zotero PDFs unless
> a dump is challenged). Budgets: ~50 calls/round; ≤2 returns per Dr. → escalate.

## Round A — Per-paper EN reports (G5) → `research/clas-vanet-audit/reports/<key>-en.md`

- INPUT per paper: `summaries/<key>.md` (audited) + `sources/<key>.txt`.
- OUTPUT template (required sections — matches `check_report.py` REQUIRED_SECTIONS):
  `# <title>` + `## Bibliographic` (title/authors/venue/year/doi/pages, Zotero-verified)
  + `## Problem` + `## Method` + `## Key findings` + `## Limitations`
  + `## Related Work` (wikilinks to existing summaries only) + `## Provenance`
  (Mode label + endpoints + access date + expected-vs-retrieved + warnings).
- GROUNDING: every bullet + every prose paragraph >~80 chars under
  Problem/Method/Key findings/Limitations carries `(p.X)` / `(pp. X–Y)`; no new
  equations — copy from summary, keep locators. Pairing family must match audit:
  [P] = cahyadi-scheme, wang2022, yuan2023, zhang2014, wang2025-detectable keep
  `e(...)`; all other constructions ECC/HECC-only. han2022 + wu2025-collusion =
  Abstract-only (no equations, hedged claims, OA/closed labels as in summaries).
- Dr. spawn contract (one key per spawn):
  `paper_key=<key> | src=summaries/<key>.md | text=sources/<key>.txt | out=reports/<key>-en.md | question=<1-line scope> | Gate: G5 + Provenance`
- Dr. RETURNS: PAPER/STATUS/FILE/MODE/ORPHANS/SPOT + PROVENANCE + FIXLIST on FAIL.
- BATCHES (5/5/5/5/4): [cahyadi-scheme, cahyadi-survey, dai2022, gong2023, han2022]
  → [iqbal2023, lode2026, shim2026, shim2023, tao2026] → [vallent2021, wang2022,
  wang2025-ecae, wang2025-detectable, wei2025] → [wu2025-collusion,
  wu2025-pseudonyms, wu2025-signcryption, xu2023, yuan2023] → [yue2025, zhang2024,
  zhang2014, zheng2023].
- ACCEPTANCE: `check_report.py --json reports/<key>-en.md` exit 0 for all 22
  Full-text reports; 2 Abstract-only accepted at exit 1 ONLY with documented
  record-attribution override (same rule as collusion summary).

## Round B — Atomic Obsidian notes (G6) → `research/clas-vanet-audit/vault/atomic/*.md`

- INPUT per paper: its Round-A `reports/<key>-en.md`.
- OUTPUT: ≥1 note per paper (target ~2–3; ~50–60 notes total), one concept per file.
  Template per note:
  `---` frontmatter (`title:`, `aliases:`, `tags:`, `source:: [[<key>-en]]`,
  `pages:: p.X`) `---` + `# <concept>` + 3–8 bullets, each with `(p.X)` locator
  + `## Links` (`[[wikilinks]]` to sibling concepts only — run link-scan, 0 broken)
  + `## Source` (`source:: [[<key>-en]] p.X`).
- CONCEPT SPLIT (per paper, Dr. decides exact cut, examples): construction (setup/
  keygen/sign/verify equations) · security claim (theorem + assumption) ·
  attack (for cryptanalyses/break-fix: forgery equation + patch) · numbers
  (cost table row) · privacy mechanism (pseudonym/trace). Reviews
  (cahyadi-survey, lode2026) → framework + tables + gaps. Abstract-only papers →
  concept notes on scope/bib/status ONLY, no equations.
- Dr. spawn contract: `paper_key=<key> | src=reports/<key>-en.md | out=vault/atomic/<key>-*.md (≥1) | question=<concepts> | Gate: G6 (1 concept/file, frontmatter, [[wikilinks]], source:: + page)`.
- ACCEPTANCE: notes n ≥ 24 (≥1/report); frontmatter valid on all; 0 broken
  `[[...]]`; filename slug = `<key>-<concept-slug>.md`.

## Round C — Persian translations (G7) → `research/clas-vanet-audit/fa/<key>-fa.md`

- INPUT per paper: its Round-A `reports/<key>-en.md`.
- OUTPUT: full FA mirror of the EN report, academic register (`persian-writing`
  skill): sections 1:1 with EN; every EN `(p.X)` → `(ص. X)` 1:1; ZWNJ + Persian
  digits correct; math stays Latin/LaTeX; no new claims.
- Pipeline per file: draft → `persian_cleanup.py` → `fa_lint.py` → fix → re-lint clean.
- Dr. spawn contract: `paper_key=<key> | src=reports/<key>-en.md | out=fa/<key>-fa.md | question=<scope> | Gate: G7 (register, cleanup+lint, ZWNJ/digits, (ص. X) 1:1)`.
- ACCEPTANCE: 24 FA files (FA count = EN count); lint clean; random Professor
  back-check of 2 files (EN↔FA paragraph alignment).

## Cross-round rules

- Sequential rounds (B needs A's reports, C needs A's EN). Batches ≤5 Drs in flight.
- Retry: Master 2 self-checks → Dr. 2 respawns → Professor 2 returns → STATUS
  blocked/failed + escalate. Never loop.
- Professor final: counts (24 EN = 24 FA; atomic ≥24), `validate_citations.py`
  clean, sample re-run of `check_report.py` on ≥2 EN reports, sign-off in fix-log.

## Estimates

- Round A: 5 batches ≈ 5 crew-turns. Round B: same. Round C: same + lint time.
- Total ≈ 15 crew-turns + merge/sign-off. No Zotero/PDF work needed (dumps exist).
