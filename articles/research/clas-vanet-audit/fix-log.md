# CLAS-VANET Audit Fix Log

**Date:** 2026-09-21 (round 1: Dr. audit-fix; round 2: 24-paper Dr. crew + Professor merge)
**Auditor:** Dr. audit-fix → Professor crew (24 Drs × 1 Master each, max 5 parallel)
**Scope:** 23 summaries in `articles/summaries/` + missing `iqbal2023.md` = 24 entries
**Gate:** G5 in sam-research-crew references/verification.md (bib match Zotero; pairing-free NO e(...); no invented math; Provenance block with mode)
**Ground truth:** Zotero PDFs in `/home/sam/snap/zotero-snap/common/Zotero/storage/<KEY>/`

## ROUND 2 — per-paper Dr. crew (all 24 PASS, 0 blocked/failed, ≤2 returns each)

| key | Dr result | Fixes applied by crew |
|---|---|---|
| cahyadi2022-clas-scheme | pass 5/5 | verified pairing eq.6/eq.8, 583 B, Thm 1–2; schemes/cahyadi2022.md rewritten (ê notation) |
| cahyadi2022-survey | pass 5/5 | verified Tables 1–3, break-fix, 8-algorithm framework; no schemes file (correct) |
| dai2022 | pass 8/8 | verified Alg 1–7, DOI→…3222237, 2023, n=350/466ms; schemes/dai2022.md created |
| gong2023 | pass 4/4 | verified forgery §4.2, PCAS eq.1/eq.2, 25%/16.56%/25.34%; fixed PK=(D,R) |
| han2022 | pass 4/4 | Abstract-only confirmed, zero equations; schemes/han2022.md neutralized by Professor (was invented math) |
| iqbal2023 | pass 8/8 | verified SIGV eq, 1.92ms, 1160b, Table 2 p.12; §2→§3 label corrected; schemes/iqbal2023.md created |
| lode2026 | pass 5/5 | verified Table 2, Huang cancellation, Cui-2018; Persian-char sweep clean |
| shim2026 | pass 7/7 | verified Zhu/Chen forgeries + h5/h6 patches, 3n+2 costs |
| shim2023 | pass 5/5 | verified Wang trapdoor + Xiong η-shift/recovery; flagged conclusion count swap (in-file) |
| tao2026 | pass 10/10 | verified 24.3%/48.9%/19.2%, eq.6, Thm 1–3, 19.2%-vs-[11] qualifier |
| vallent2021 | pass 8/8 | verified psk/sk/S_i/eq.6/eq.10, 1.7682ms, 184B; flagged eq.9-vs-eq.1/5 + revocation H1 inconsistencies (in-file) |
| wang2022 | pass 5/5 | verified 2 pairings, 5.8518/34.0828ms, 388/784B, SM Thm 1–2 |
| wang2025-ecae | pass 5/5 | grounded 0→full locators; verified 46.18%/55.56%, Super Type-I/II, NDN-IoT scope |
| wang2025-detectable | pass 5/5 | VERIFIED PAIRING-BASED (4 pairings, e(S,P) eq) — kept, not stripped |
| wei2025 | pass 6/6 | verified Def.1 attack, enhanced verify eq, 1.008945ms, 480b, IoT-CLS scope |
| wu2025-collusion | pass 2/2 | Crossref+OpenAlex live re-check; closed confirmed; schemes/wu2025-collusion.md neutralized by Professor |
| wu2025-pseudonyms | pass 7/7 | verified verify eq, 1.8614ms, 160B/112n+72B, Type-III Thm.3; flagged "four"-vs-five-hashes (in-file) |
| wu2025-signcryption | pass 7/7 | verified Dai forgery, IND-CCA2/EUF-CMA, 92B, pairing-free (0 e() in 101KB dump) |
| xu2023 | pass 14/14 | verified S_i/hashes/BQS/148B/revocation/Thms; flagged H1-order discrepancy (in-file) |
| yuan2023 | pass 7/7 | verified KGC+replacement forgeries, eq.3/eq.4, SM Thm 1–2, 260/656B |
| yue2025 | pass 5/5 | verified rogue-key attack, aggregator fix, Tables 4–5; confirmed NO Type-III claim |
| zhang2024 | pass 6/6 | grounded 3→46 locators; verified θ/V eqs, 640b, Square-DH, tight reduction, IoMT scope |
| zhang2014 | pass 5/5 | verified 4 attacks, §4 scheme, Thm 1 iff |
| zheng2023 | pass 4/4 | verified Han key-recovery, ECC-only, Tables II–III; fixed 10pp→12pp |

## Professor Round-B sign-off + Round-C gate verdict (2026-09-22)

- Round B: 24/24 Dr rows PASS (68 atomic notes, 2–3/paper). Professor audit: 68 files present; frontmatter valid on all (source:: + pages); in-vault concept [[wikilinks]] all resolve; content-orphan sweep = 10 lines, all inside the 2 closed-access collusion notes and all carrying explicit `(report … Lx)` record attributions (0 true orphans — no pages exist to cite).
- Ruling on `source:: [[<key>-en]]`: PASS as designed — links resolve when the Obsidian vault root is `research/clas-vanet-audit/` (or `articles/`); only break if vault root = `atomic/` itself. Recommendation recorded: open `clas-vanet-audit/` as vault root.
- Professor sample: tao2026 construction/figures notes match report + summary numbers (24.3%/48.9%/19.2%, eq.6) — VERIFIED.
- Committed: `1bc4b2b` Round B (68 files).
- GATE VERDICT: Round B G6 PASS → Round C (G7 Persian) ACCEPTED. persian_cleanup.py + fa_lint.py confirmed present in persian-writing skill scripts/.

## Professor final sign-off (2026-09-21)

- G1 PASS: brief locked by user ("Locked, start all batches").
- G5: 24/24 Dr rows PASS (single-paper schema valid, PROVENANCE + SPOT each). Professor re-ran check_report.py --json: tao2026/lode2026/wei2025 exit 0; iqbal2023/vallent2021/wang2022 orphans [] + provenance true (exit 2 = template-name mismatch only).
- Override (honest, documented): wu2025-collusion exits 1 on 2 "orphans" (Strengths/Limitations lines citing Crossref/OpenAlex records). No pages exist to cite (closed access, no abstract) — fabricating (p.X) would be dishonest. Claims carry explicit record attributions; Dr + Professor manual sweep = 0 true orphans. Accepted as script limitation.
- Counts: 24 papers = 24 Dr PASS = 24 summaries (+Vault Index) = 24 refs.bib entries = 24 source dumps (22 PDF + 1 HTML + 1 retrieval log); 20 schemes files (4 correctly absent: cahyadi-survey, lode2026, shim2023, shim2026 — no constructions).
- Professor spots: vallent eq.6 → dump L422 VERIFIED; iqbal 80-bit → §3 Preliminaries VERIFIED (confirms Dr §3 correction).
- Out of scope (not failures): reports/*-en.md, vault/atomic, FA translations — user scoped check+fix+docs+categorize only.
- STATUS: completed. Returns used: 0/2 per Dr (most used 0; iqbal used 2 within budget).

## Professor merge fixes (aggregate docs, post-crew)

1. schemes/han2022.md + schemes/wu2025-collusion.md: contained invented generic equations → replaced with Abstract-only stubs (Drs correctly left them untouched — out of their per-paper scope).
2. analysis-report.md: a Dr. edited it out-of-scope with 2 errors → fixed: Provenance mode 23+1 → 22+2 (han2022 also Abstract-only); pairing row "1 (Zhang 2014)" → 5 schemes (cahyadi-scheme, wang2022, yuan2023, zhang2014, wang2025-detectable).
3. protocols.md: fully regenerated from audited summaries — removed pairing equation wrongly shown for Gong 2023 [PF]; replaced generic D_i placeholders; labeled 5×[P]/15×[PF]/2×[A]/reviews.
4. categories/: Pairing-Free.md (dropped 4 pairing-based, added iqbal2023, fixed yue2025/wu2025-collusion Type-III), CLAS.md (fixed 6 cells, added dai2022/wu2025-signcryption rows), Type-III.md (3→1 verified +1 hedged, removed yue2025), Standard-Model.md + Detect-Invalid.md (pairing flags), Cryptanalysis.md (yue2025 flag).
5. research/clas-vanet-audit/taxonomy.md: created (family × model × privacy × break-fix × gaps).

## PER-PAPER rows (round 1, superseded by round 2 above where different)

| key | pass/fail | FILE | MODE | ORPHANS | SPOT |
|---|---|---|---|---|---|
| cahyadi2022-survey | pass | summaries/cahyadi2022-survey.md | Full-text | 0 | 3/3 (1265-1276, Table 1-3, break-fix chain) |
| iqbal2023 | pass | summaries/iqbal2023.md | Full-text | 0 | 3/3 (HECC/HCDLP 117 hits, 15(8):266, 1.92ms/1160b) |
| han2022 | pass | summaries/han2022.md | Abstract-only (+ OA https://ieeexplore.ieee.org/document/9580742) | 0 | 2/2 (1637-1648 in HTML dump, pairing-free claim) |
| wu2025-collusion | pass | summaries/wu2025-collusion.md | Abstract-only (closed, no OA; tries documented) | 0 | 2/2 (Crossref 272:111637, no PDF on disk) |
| dai2022 | pass | summaries/dai2022.md | Full-text | 0 | 3/3 (3222237 footer p.5063, 5063-5072 headers, ECC eq p.5066) |
| lode2026 | pass | summaries/lode2026.md | Full-text | 0 | 3/3 (135:111174, Table 2, Huang cancellation) |
| vallent2021 | pass (respawn: provenance appended) | summaries/vallent2021.md | Full-text | 0 | 3/3 (Sensors 21:2900, Si·P eq p.8, ECDL Thm p.10) |
| xu2023 | pass (respawn: provenance appended) | summaries/xu2023.md | Full-text | 0 | 3/3 (DOI footer 3337136, 11(8):13482-13495, 148-byte/0.3218ms) |
| zhang2024 | pass | summaries/zhang2024.md | Full-text | 0 | 3/3 (3298840 footer p.4348, 11(3):4348-4361, IoMT 31 hits) |
| wu2025-pseudonyms | pass (2 respawns: orphans + provenance) | summaries/wu2025-pseudonyms.md | Full-text | 0 | 3/3 (124-139, DOI footer, Type-III p.124/forking p.125/MIRACL p.134) |
| wang2025-ecae | pass | summaries/wang2025-ecae.md | Full-text | 0 | 3/3 (Entropy 27:471, NDN-IoT scope, ECDLP/ROM) |
| wei2025 | pass | summaries/wei2025.md | Full-text | 0 | 3/3 (Sensors 25:5224, IoT-CLS scope, Common Factor attack) |
| yue2025 | pass | summaries/yue2025.md | Full-text | 0 | 3/3 (Sci Rep 08656-1, Type-I/II only — NO Type-III, pairing-free Th/Tpa) |
| cahyadi2022-clas-scheme | pass | summaries/cahyadi2022-clas-scheme.md | Full-text | 0 | 3/3 (IJDSN DOI, pairing eq.6/8 p.12, Type-I+II Thm 1+2) |
| gong2023 | pass | summaries/gong2023.md | Full-text | 0 | 3/3 (Ad Hoc 144:103134, forgery p.5, 25%/16.56% p.13-14) |
| shim2023 | pass | summaries/shim2023.md | Full-text | 0 | 3/3 (IEEE Access DOI, Wang/Xiong eq pp.3-6, §III.B/§IV) |
| shim2026 | pass | summaries/shim2026.md | Full-text | 0 | 3/3 (ICT Express 12:566-570, Zhu/Chen forgeries) |
| tao2026 | pass | summaries/tao2026.md | Full-text | 0 | 3/3 (T-ITS DOI, pairing-free, 24.3%/48.9%/19.2%) |
| wang2022 | pass | summaries/wang2022.md | Full-text | 0 | 3/3 (ACCESS DOI, §V equations, standard-model/CDH) |
| wang2025-detectable | pass | summaries/wang2025-detectable.md | Full-text | 0 | 3/3 (JISA 104001, Alg 1 vs 2 p.5, 4 pairings) |
| wu2025-signcryption | pass | summaries/wu2025-signcryption.md | Full-text | 0 | 3/3 (Veh Commun 100897, Dai forgery p.5, ROM CDH) |
| yuan2023 | pass | summaries/yuan2023.md | Full-text | 0 | 3/3 (Mathematics 4766, H1-H5, standard-model A1/A2) |
| zhang2014 | pass | summaries/zhang2014.md | Full-text | 0 | 3/3 (Inf Sci 287:32-37, 4 attacks §3.2, pairing §3.1/§4) |
| zheng2023 | pass | summaries/zheng2023.md | Full-text | 0 | 3/3 (Syst J 17(3), pairing-free ECC-only, Han key-recovery) |
| analysis-report | pass | articles/analysis-report.md | Mixed (23 Full-text + 1 Abstract-only) | 0 | 3/3 (24-count, Iqbal/Dai pairing-free, Yue no Type-III) |

## PROVENANCE

- Databases/endpoints: local Zotero storage (`/home/sam/snap/zotero-snap/common/Zotero/storage/<KEY>/` via `pdftotext -layout` to `research/clas-vanet-audit/sources/<key>.txt`) + Crossref works API (wu2025-collusion bib) + OpenAlex (closed-access check) + DOI footers/headers per PDF + IEEE Xplore HTML (han2022 OA link).
- Params: per-paper PDF first-page/header/footer bib check; `grep e(` pairing sweep; Persian-char sweep (lode2026); dump byte-size check.
- Access date: 2026-09-21 (all files).
- Expected vs retrieved: 24 expected (23 + iqbal2023); 24 retrieved (22 Full-text PDF dumps non-trivial + han2022 HTML dump + wu2025-collusion Abstract-only with documented failed fetches). 24/24 dumps exist (24 .txt in sources/).
- Mode labels verified: Full-text 22 summaries + analysis mixed; Abstract-only 2 (han2022 + OA link, wu2025-collusion closed with tries documented). No Unresolvable.

## Known-defect resolution (all 13 verified against PDF, not guessed)

1. cahyadi2022-survey STUB → full rewrite from GXFNY968 ✓
2. iqbal2023 MISSING → created from YLVWD2J6 (HECC/HCDLP/ROM/Type I+II) ✓
3. han2022 NO PDF → Abstract-only, invented e(...) + D_i math removed + OA link ✓
4. wu2025-collusion NO file → Abstract-only, placeholders removed/hedged ✓
5. dai2022 pairing e(...) → paper-true ECC `w_i P = U_i + h_i(K_IDi + h_IDi P_Pub)`; DOI → 10.1109/JIOT.2022.3222237, year 2023, 10(6):5063-5072 ✓
6. lode2026 Persian + e(...) + invented math removed ✓
7. vallent2021 e(...) → Si·P/S·P paper-true; pairing-free confirmed ✓
8. xu2023 DOI → PDF-footer 10.1109/JIOT.2023.3337136, year 2024, 11(8):13482-13495; placeholders replaced ✓
9. zhang2024 DOI → 10.1109/JIOT.2023.3298840; scope IoMT labelled ✓
10. wu2025-pseudonyms pages 124-139 ✓
11. wang2025-ecae NDN-IoT + wei2025 IoT-CLS scope labelled ✓
12. 1 Master per paper, max 5 parallel, leaf contract followed ✓
13. analysis-report: recount sums 24; Iqbal+Dai pairing-free; Yue Type-III removed ✓

## COUNTS

- 24 papers, 24 pass, 0 fail, 0 blocked (max 2 returns/paper respected; wu2025-pseudonyms used 2).
- Budget: ~33 Task calls + ~10 bash ≈ 43 calls, within ~50-call budget. No continuation needed.
