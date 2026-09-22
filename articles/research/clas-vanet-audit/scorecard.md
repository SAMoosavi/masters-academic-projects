# Scorecard — Reports & Obsidian Files (2026-09-21, Professor audit)

> Scope: `summaries/`, `schemes/`, `protocols.md`, `analysis-report.md`,
> `math-notation.md`, `categories/`, `summaries/Vault Index.md`,
> `Signature Schemes.canvas`, `comparison-charts/`, `refs.bib`,
> `research/clas-vanet-audit/{reports,vault,fa}/`, wikilink integrity.
> Rubric per item: correctness vs audited ground truth (pairing family, Type-III,
> scope), locator/provenance presence, link validity, template consistency.

## Scores (same template: ITEM / SCORE / DEFECTS / FIX-PLAN)

### 1. summaries/*.md (24 papers) — 9/10 PASS
- DEFECTS: wu2025-collusion exits check_report 1 on 2 record-cited lines (documented honest override, no pages exist); frontmatter `mode:` present in only 2/24 files (rest carry mode in Provenance only).
- FIX-PLAN: (a) standardize frontmatter `mode:` + `scope:` on all 24 (script-assisted, 1 pass); (b) no content changes needed.

### 2. schemes/*.md (20 files) — 9/10 PASS
- DEFECTS: none verified. 18 constructions crew-verified; han2022 + wu2025-collusion correctly stubbed (Abstract-only). 4 correctly absent (2 surveys, 2 cryptanalyses).
- FIX-PLAN: (a) add `mode:` frontmatter to stubs for machine readability; (b) done otherwise.

### 3. protocols.md — 9/10 PASS
- DEFECTS: freshly regenerated from audited summaries; residual risk — condensed equations not individually re-audited after condensation.
- FIX-PLAN: (a) one Professor spot-pass over the 5 [P] entries vs summaries (30 min); (b) freeze with hash in fix-log.

### 4. analysis-report.md — 8/10 PASS-WITH-NOTES
- DEFECTS: pairing row + modes + Type-III fixed 2026-09-21; remaining round-1 prose (§§2,5–7 benchmarks) not re-audited line-by-line; references charts built from pre-audit data.
- FIX-PLAN: (a) audit §§2/5/6 numbers vs summaries (one Dr., read-only); (b) re-point charts after item 9.

### 5. math-notation.md — REMOVED 2026-09-21 (was 3/10 FAIL)
- ACTION TAKEN: file deleted; `summaries/Vault Index.md` Companion Files updated (formula source of truth = audited summaries/schemes; `aggregate.py` generator flagged retire-or-update).
- No regeneration planned — audited Math sections already live in each summary + schemes file.
- DEFECTS: invented generic math still present — cahyadi2022 (`D_i=sH_1`, `S_j=r_j+h_jx_i`, pairing verify) contradicts paper-true `psk=aQ_ID` / eq.6; survey shows invented pairing verification; dai2022 shows invented `D_i=sH_1(ID_i)` / `σ_i=k_i+H·x_i+D_i` vs paper-true `d_ID=y_ID+h_ID·s` / `w_i=u_i+h_i(x+d)`. At least 3 papers wrong; file unchecked for the other 21.
- FIX-PLAN: (a) regenerate entire file from `summaries/*` Math sections ONLY (no new math, copy-with-attribution + per-paper source line); (b) Dr. spot-check 5 papers; (c) gate: grep for `sH_1\|sH(ID` must return 0 outside changelogs.

### 6. categories/*.md (8 files) — 8/10 PASS-WITH-NOTES
- DEFECTS (fixed 2026-09-21): Pairing-Free/CLAS/Type-III/Standard-Model/Detect-Invalid/Cryptanalysis flags corrected. Residual: Detect-Invalid membership is loose by design (traceability ≠ detection); Signcryption/CLS verified clean.
- FIX-PLAN: (a) tighten Detect-Invalid to detection-mechanism papers only (wang2025-detectable, xu2023-BQS) + move traceability-only rows to CLAS notes; (b) 15-min Professor edit.

### 7. summaries/Vault Index.md (MOC) — 5/10 STALE
- DEFECTS: Type-III lists yue2025 (verified NO claim); Pairing-Free ECC lists 4 pairing-based schemes (cahyadi-scheme, wang2022, wang2025-detectable, yuan2023); missing iqbal2023/dai2022/signcryption/zhang2024/wei2025 from pairing-free; wu2025-collusion "Type III (NS3+SUMO)" stated as fact (hedged Abstract-only); xu2023 filed under 2023 (PDF 2024).
- FIX-PLAN: (a) sync all 4 lists with categories/ (mirror, don't fork — single source of truth = categories/); (b) fix year + hedge; (c) add MOC link to `research/clas-vanet-audit/taxonomy.md`.

### 8. Signature Schemes.canvas — 6/10 MISPLACED NODES
- DEFECTS: f_tao2026 sits under "CLAS (Pairing-Based)" — ES-CLAS is verified pairing-free; yuan2023 (pairing-based SM) missing from that group; PF-CLAS missing dai2022/wu2025-signcryption/zhang2024; surveys (cahyadi-survey, lode2026) absent; wu2025coll node needs Abstract-only badge.
- FIX-PLAN: (a) move tao2026 → PF-CLAS; add yuan2023 → Pairing-Based; add dai2022/signcryption/zhang2024 → PF-CLAS (or new CLASC lane); add survey lane (2 nodes); badge collusion/han2022 Abstract-only; (b) visual re-check in Obsidian.

### 9. comparison-charts/ (4 PNGs + generate_charts.py) — 5/10 STALE DATA
- DEFECTS: PNGs rendered from pre-audit feature matrix — Type-III flags both Wu papers as ✓ (collusion unverified), pairing counts predate the 5-scheme correction; script lines 101–102 hardcode both Wu rows as Type-III.
- FIX-PLAN: (a) patch feature matrix to audited truth (Type-III: pseudonyms=1, collusion=hedged/0; pairing-based=5); (b) rerun `python3 generate_charts.py`; (c) Professor eyeball-check of 4 PNGs.

### 10. research/clas-vanet-audit/{reports,vault,fa}/ — 0/10 UNBUILT
- DEFECTS: all three dirs empty — per-paper EN reports (G5 `reports/<key>-en.md`), atomic Obsidian notes (G6 `vault/atomic/*.md`), Persian translations (G7 `reports/<key>-fa.md`) were scoped out of the fix crew.
- FIX-PLAN (3 crew rounds, 1 Dr/paper each, ≤5 parallel): (a) G5 round — 24 Drs × 1 Master, template `assets/report-en.md` analogue (use summaries/ structure + required sections); gate check_report exit 0; (b) G6 round — atomic notes, 1 concept/file, `[[wikilinks]]` + `source::` frontmatter; (c) G7 round — FA drafts, academic register + lint; (d) each round ≤2 returns/Dr then escalate.

### 11. Wikilink integrity (42 distinct targets) — 8/10, 3 BROKEN
- DEFECTS: `[[2025, 11]]` in wu2025-collusion.md (date-parts `[[2025, 11]]` parsed as link — escape brackets); `[[cryptanalysis]]` in shim2026.md (case — target is `Cryptanalysis`); `[[key-replacement-attack]]` in wu2025-signcryption.md (no such note).
- FIX-PLAN: (a) `[2025, 11]` escape; (b) `[[Cryptanalysis]]`; (c) plain-text "public-key-replacement attack" + link to `[[xu2023]]` §IV analogue or leave unlinked; (d) add CI: rerun the link-scan script pre-commit.

### 12. refs.bib — 10/10 PASS
- DEFECTS: none. 24/24 keys match the 24-paper corpus.
- FIX-PLAN: none (validate on any future addition: `validate_citations.py`).

## Overall: 80/120 ≈ 6.7/10

| # | Item | Score |
|---|---|---|
| 1 | summaries/ | 9 |
| 2 | schemes/ | 9 |
| 3 | protocols.md | 9 |
| 4 | analysis-report.md | 8 |
| 5 | math-notation.md | 3 |
| 6 | categories/ | 8 |
| 7 | Vault Index.md | 5 |
| 8 | canvas | 6 |
| 9 | charts | 5 |
| 10 | reports/vault/fa | 0 |
| 11 | wikilinks | 8 |
| 12 | refs.bib | 10 |

## Execution order (dependency-sorted)

1. Item 11 broken links (5 min, zero risk) → 2. Item 7 MOC sync (15 min) → 3. Item 5 math regen (1 Dr. + spot-check) → 4. Item 8 canvas (20 min visual) → 5. Item 9 charts (patch + rerun) → 6. Item 4 analysis §§2/5/6 audit (1 read-only Dr.) → 7. Items 1–3 polish (script + spot-pass) → 8. Item 10 three crew rounds (the big work; needs user go-ahead per round batch).

## Provenance

- Scoring method: Professor direct inspection 2026-09-21 (file reads + link-scan script + dump spot-checks), grounded in the 24-paper crew audit (`fix-log.md`).
- math-notation.md defects verified against summaries/dai2022.md + dump (Alg.5/7 p.5066) and summaries/cahyadi2022-clas-scheme.md (eq.6/eq.8 p.12).
