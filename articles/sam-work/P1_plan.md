# P1 — Leaf-Task Plan

Node: T1 · owner: sam-professor · reviewers: sam-supervisor (structural, advisory) → human ack · needs: T0 (approved)

Contract: `sam-work/P0_scope.md` (D1–D5 taxonomy, N1–N6 novelty criteria, 10-section report shape). Sizing: every node output ≤ ~150 lines; heavy read tasks are split, not looped.

## 1. Leaf tasks

### P2 — find & download (owner sam-doctor)

| id | one sentence | role | acceptance check | writes |
| --- | --- | --- | --- | --- |
| S1 | Screen the local corpus for CLAS/PF-CLAS papers that already claim an invalid-signature *detection/identification* mechanism. | featured-article hunt | ≥1 candidate with mechanism text; every row cites `proposal/summaries/<file>:<line>` | `sam-work/P2_candidates.md` |
| S2 | Run 5 query slots (below) against no-key scholarly endpoints + session `websearch`/`webfetch`, dedup by DOI. | featured-article hunt | ≥3 new candidates per non-local slot or a written "no result" line; DOI resolves | `sam-work/P2_candidates.md` (append) |
| S3 | Apply N1–N6 mechanically to every candidate; record a per-criterion verdict (PASS/FAIL + evidence locator). | shortlist filter | all 6 criteria scored for all candidates; no candidate carries a blank cell | `sam-work/P2_candidates.md` (append) |
| S4 | Acquire the featured + supporting full texts (OA/preprint/author copy) and write provenance. | download | every used source has `papers/<citekey>.pdf` **and** `papers/<citekey>.src.json`; 0 sources lacking either | `sam-work/P2_sources.md` |

### P3 — read/analyze (owner sam-master, one bounded source-group each)

| id | one sentence | role | acceptance check | writes |
| --- | --- | --- | --- | --- |
| R1 | Extract the featured article's detection mechanism: ≥3 named algorithms/equations, threat model, and what "detection" returns (which signature, or which identity). | featured mechanism | ≥3 named algs/equations quoted; ROM/SM + adversary type named; each claim carries page/section locator | `sam-work/notes/N01_<slug>.md` |
| R2 | Extract the featured article's detection cost: extra verifications, complexity class, and ms figures with the stated library/hardware. | cost column | every ms number carries toolchain+hardware; O(log n) vs O(n) stated explicitly or marked "not stated" | `sam-work/notes/N02_<slug>_cost.md` |
| R3 | Read the attacked/base CLAS it improves on (attack + countermeasure pairing, D5). | attacked scheme | attack described from the source, not from the featured article's summary of it | `sam-work/notes/N03_<slug>.md` |
| R4 | Read 2 local PF-CLAS baselines (Han 2022, Gong PCAS 2023) for the comparison rows and their stated detection gap. | baseline | ≥1 quoted line per scheme naming its missing-detection weakness | `sam-work/notes/N04_<slug>_baselines.md` |
| R5 | Read 1–2 **general** aggregate-signature detection papers (BLS rogue-key / bisection localization / cheater ID) for the prior-art axis. | prior art | mechanism is cryptographically operational (not TA identity lookup) — N2 test applied | `sam-work/notes/N05_<slug>_priorart.md` |
| R6 | Write the rejected-candidate table: every screened-out-but-relevant candidate with its failing N-criterion. | prior-art completeness | 1 row per rejected candidate; failure criterion named, not "not suitable" | `sam-work/notes/N06_<slug>_rejected.md` |

Each `N<nn>_*` file ≤150 lines. R1–R6 are dispatched to 6 distinct Masters; peer cross-check is cross-node (R1↔R2, R3↔R4).

## 2. Search strategy (S2)

Endpoints, all no-key: OpenAlex `api.openalex.org/works?search=`, Crossref `api.crossref.org/works?query.bibliographic=`, arXiv `export.arxiv.org/api/query`, Semantic Scholar unauthenticated `api.semanticscholar.org/graph/v1/paper/search`, Unpaywall `api.unpaywall.org/v2/<doi>?email=`, plus session `websearch` / `webfetch` for publisher pages. No `S2_API_KEY`, no `PARALLEL_API_KEY` (graph.md:13-14).

| slot | query string | endpoint | N-filter emphasis |
| --- | --- | --- | --- |
| A (CLAS-native) | `"certificateless aggregate signature" "invalid signature" detection` | OpenAlex, Crossref | N1 (named alg) |
| B (PF/VANET) | `pairing-free certificateless aggregate signature VANET cheater identification` | Crossref, web | N3 (first for CLAS?) |
| C (**general**) | `aggregate signature batch verification "rogue key" detection BLS` | OpenAlex, arXiv | N1, N2 |
| C2 (**general**) | `aggregate signature "divide and conquer" localization invalid signature batch verification` | arXiv, Semantic Scholar | N1, N5 |
| C3 (**general**) | `aggregate signature "identifying the malicious signer" batch verification cheater` | OpenAlex, web | N2 (rejects TA-tracing) |
| D (attack+fix) | `certificateless aggregate signature cryptanalysis "public key replacement" countermeasure` | Crossref, web | N3(b) |

Slot C/C2/C3 exist so the featured article is **not** restricted to CLAS-by-name; OQ-2 (broader domains allowed) is why non-VANET hits from slot C are admissible if §7 transfer is argued.

Filter as a two-pass screen: pass 1 on N2 (cryptographically operational) + N1 (named mechanism) rejects most of the corpus cheaply; pass 2 on N4/N5/N6 is only run on survivors and decides featured vs. rejected. N6 is checked *first for the top-3* (S4 depends on it).

## 3. Parallelization

| wave | nodes | why concurrent |
| --- | --- | --- |
| P2 | S1 ‖ S2 → S3 → S4 | S1 (local) and S2 (external) are independent; S3 needs both; S4 needs the shortlist |
| P3 | R1 ‖ R2 ‖ R3 ‖ R4 ‖ R5 ‖ R6 | 6 Masters, one source-group each, ≤150 output lines each |
| P5 | T9 (analysis) → T10 (report) | strictly sequential; report cites `analysis.md` sections |

Peer-review pairing (cross-node, no extra nodes): R1↔R2 (mechanism vs. cost must agree), R3↔R4 (attacked scheme vs. baseline), R5↔R6 (prior art vs. rejected table). Pairing is a *structural* cross-check, not an independent error process — the Doctor's G3 pass remains the real check.

## 4. Shortlist rule

Rank by, in order: (1) N1–N6 all PASS; (2) D2/D4 hit over D1/D3/D5 hit (attribution beats detection beats cryptanalysis); (3) VANET domain hit over transfer-argued domain; (4) N5 cost *numerically present*; (5) recency (2020+). Tie inside a level → prefer the paper whose own related-work states the gap it closes (N3 evidence available verbatim), then the earlier one.

Every rejected-but-relevant candidate is written to `notes/N06_*` with the **named failing criterion** and its evidence line, so the report's §5 prior-art table is complete whether or not the featured article survives. If zero candidates pass all six → OQ-4 fires (see R2).

## 5. P5 synthesis map

| report.md section | fed by |
| --- | --- |
| 1 Abstract | `analysis.md` §1 (the one-paragraph answer) |
| 2 Problem | N04 (all-or-nothing gap), REPORT `:27`, `:109` |
| 3.1 Threat model | N01 |
| 3.2 Mechanism | N01 |
| 3.3 Security claim | N01, N03 |
| 3.4 Cost | N02 |
| 4 Comparison table (detection-cost column) | N02, N04, N05 |
| 5 Prior art | N05, N06, `P2_sources.md` |
| 6 What it does NOT solve | `analysis.md` contradictions matrix, fed by N01+N04+N05 |
| 7 Implications | N03, REPORT `:10`, `:27`, `:109` |
| 8 Limitations | `P2_candidates.md` search log, `P2_sources.md` paywall log |
| 9–10 References / AI disclosure | `P2_sources.md` + AI disclosure line |

`analysis.md` owns: evidence table (one row per note), N1–N6 verdict table, contradiction matrix, gap list. `report.md` may not contain a claim absent from `analysis.md` (G5).

## 6. Risk register (top 3)

| # | risk | pre-decided response |
| --- | --- | --- |
| R1 | **N6 paywall blocks the featured article.** Both leading local candidates are closed-access (Wang 2025 JISA/Elsevier, `refrence.bib:339-345`; Xu 2023 IEEE IoT-J, `SecurityEnhancedConditionalPrivacyPreserving.md:9`), and the only local PDF pointer is dead — `refrence.bib:349` names `/home/sam/snap/zotero-snap/.../ZNYGPD2R/…pdf`, and that directory does not exist on this machine. | Run the N6 check **before** S4 (top-3 OA sweep: OpenAlex `best_oa_location.pdf_url`, Unpaywall, arXiv, author copy). If the winner is unobtainable, take the next-ranked passing candidate rather than lowering N6. If none is obtainable, fire **OQ-4**. |
| R2 | **No CLAS-native mechanism passes N1–N6 at all** (e.g. detection exists but N3 novelty or N5 cost fails). | **OQ-4 fires at the end of S3, not later.** The run continues: featured slot = strongest near-miss, `report.md` §3 is reframed as "the strongest near-miss and exactly which criterion it fails", and N06's N-failure table becomes §6's core. The 10-section shape is unchanged — a documented negative result is a deliverable (`P0_scope.md:103`). |
| R3 | **Detection-cost numbers exist but are not comparable** — different toolchains coexist in the corpus (MIRACL vs JPBC vs Charm; `REPORT-PF-CLAS-VANET.md:97-105`, notably `T_bp≈3.23ms` JPBC at `:99` vs `T_bp≈10.32ms` JPBC at `:100`; and `wangPrivacypreservingCertificatelessAggregate2025.md:31`). | The detection-cost column is filled **asymptotically first** (extra verifications; O(log n) vs O(n)), with ms only where toolchain+hardware match a baseline. Non-matching cells are written `n/a (different toolchain)` — never converted or silently dropped. R2's acceptance check enforces this. |

## 7. Proposed node rows (Supervisor appends; I do not edit `graph.md`)

| id | title | agent | skills | needs | output | reviewers | status | verdicts |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| T2 | Screen local corpus + run search slots A–D, apply N1–N6 | sam-doctor | sam-search, sam-research | T1 | sam-work/P2_candidates.md | sam-professor | pending | — |
| T3 | Acquire featured + supporting full texts with provenance | sam-doctor | sam-read, sam-research | T2 | sam-work/P2_sources.md | sam-professor | pending | — |
| T4 | Read featured article: detection mechanism and threat model | sam-master | sam-read, sam-research | T3 | sam-work/notes/N01_featured_mechanism.md | sam-master(peer) → sam-doctor | pending | — |
| T5 | Read featured article: detection cost and complexity | sam-master | sam-read, sam-research | T3 | sam-work/notes/N02_featured_cost.md | sam-master(peer) → sam-doctor | pending | — |
| T6 | Read the attacked scheme (attack + countermeasure) | sam-master | sam-read, sam-research | T3 | sam-work/notes/N03_attacked_scheme.md | sam-master(peer) → sam-doctor | pending | — |
| T7 | Read PF-CLAS baselines for comparison rows | sam-master | sam-read, sam-research | T3 | sam-work/notes/N04_baselines.md | sam-master(peer) → sam-doctor | pending | — |
| T8 | Read general aggregate-signature detection prior art | sam-master | sam-read, sam-research | T3 | sam-work/notes/N05_priorart_general.md | sam-master(peer) → sam-doctor | pending | — |
| T9 | Write the rejected-candidate N-failure table | sam-master | sam-read, sam-research | T2 | sam-work/notes/N06_rejected.md | sam-master(peer) → sam-doctor | pending | — |
| T10 | Synthesize evidence table, contradictions, gaps into `analysis.md` | sam-doctor | sam-collect-analyze, sam-research | T4,T5,T6,T7,T8,T9 | sam-work/analysis.md | sam-professor | pending | — |
| T11 | Draft the 10-section Persian RTL `report.md` | sam-doctor | sam-report, scientific-writing, sam-research | T10 | sam-work/report.md | sam-professor | pending | — |
| T12 | Final scientific approval of the report (G5) | sam-professor | sam-research, sam-report, scientific-writing | T11 | sam-work/P6_approval.md | sam-supervisor (structural) → human ack | pending | — |
| T13 | Process audit of the run (G7) | sam-supervisor | sam-research | T12 | sam-work/P7_audit.md | sam-professor | pending | — |
| T14 | Score the run and propose improvements (G6) | sam-scorer | sam-research | T13 | sam-work/scorecard.md | sam-supervisor (advisory); final word human | pending | — |

## 8. G2 self-check

- [x] file exists at declared path, non-empty (this file)
- [x] every local-corpus claim carries a path + line locator; no paper is cited that lacks a verified locator
- [x] no TODO/TBD/placeholder; queries are proposals, not citations
- [x] `sam-research` consulted (node schema, 9 fields, review-chain hierarchy, G2 checklist)
