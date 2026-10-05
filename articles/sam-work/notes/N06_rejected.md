# N06 — Rejected-candidate N-failure table

Node: T9 · owner: sam-master · needs: T2 · date: 2026-10-05
Source: `sam-work/P2_candidates.md` §3 (S3 screen), §6 (recommendation), §7 (supporting roles)

## Table

| # | Candidate | DOI | Failing criterion | Evidence line | Role in report |
|---|---|---|---|---|---|
| E2 | Han et al. 2022, eCLAS, IEEE SysJ | 10.1109/jsyst.2021.3116029 | **N1** — no invalid-signature detection mechanism advertised | `hanECLASEfficientPairingFree2022.md:46` — mechanism "not advertised" in abstract + visible section list; marked «(نکته استنتاجی)» | baseline (all-or-nothing contrast) |
| E3 | Gong, Gao, Guo 2023, PCAS, AdHocNetw | 10.1016/j.adhoc.2023.103134 | **N1** — no detection mechanism; per-signature re-verification is the fallback | `gongPCASCryptanalysisImprovement2023.md:60` — authors state re-verify one-by-one is the (expensive) fallback | baseline / attacked scheme |
| E4 | Malhi & Batra 2015, CLAS for VANET, DMTCS | 10.46298/dmtcs.2106 | **N1** — no detection mechanism; E1 reference only | `P2_candidates.md:48` — "no detection mechanism; E1 reference only" | base scheme |
| E7 | Cui et al. 2018, CLAS w/o pairings for VANET, Inf. Sci. | 10.1016/j.ins.2018.03.060 | **N1** — no detection algorithm of its own; host scheme for FBD/EFBD | `P2_candidates.md:47` — "cited by E1 only as a *host scheme* for FBD/EFBD; no detection algorithm of its own" | base scheme of featured |
| E9 | Zhan, Wang, Lu 2021, cryptanalysis of PF-CLAS, IoT-J | 10.1109/jiot.2020.3033337 | **N1** — attack + improved scheme; no detection mechanism | `PDFCryptanalysisCompact2026.md:13` — describes the break, no detection mechanism | rejected (cryptanalysis) |
| E10 | Shim 2024, cryptanalysis of compact CLAS, IEEE Access | 10.1109/access.2024.3416954 | **N1** — countermeasure is per-signer values; no D2 mechanism | `PDFCryptanalysisCompact2026.md:30` — countermeasure is sending per-signer values; no D2 mechanism | rejected (cryptanalysis) |
| E11 | Kabil et al. 2024, CHAM-CLAS, *Cryptography* | 10.3390/cryptography8030043 | **N1** — identity authentication, not invalid-signature detection; **N2** — identity tracing (excluded by P0 §2) | `P2_candidates.md:53` — @Crossref title/abstract: "Chameleon Hashing-Based **Identity Authentication**"; N2: "identity tracing, exactly what P0 §2 excludes" | rejected |
| E12 | LCP-CLAS 2026, *Entropy* | 10.3390/e28030258 | **N1** — conditional privacy, no invalid-signature mechanism; **N2** — conditional privacy only | `P2_candidates.md:54` — @OpenAlex title/abstract: lattice-based *conditional privacy*, no invalid-signature mechanism | rejected |
| E13 | Wang, Chen, Long, Wang 2016, cryptanalysis of a CLAS, S&C | 10.1002/sec.1421 | **N1** — cryptanalysis only | `P2_candidates.md:55` — "cryptanalysis only, @Crossref" | rejected (cryptanalysis) |
| L1 | Wang et al. 2025, JISA 89:104001 | 10.1016/j.jisa.2025.104001 | **N5** — no ms figure for Algorithm 1 (detection step); **N6** — closed access, no OA | `P2_candidates.md:43` — N5: "ms are Sign + AggregateVerify only; Algorithm 1 (`:19`) has **no** ms figure"; N6: "@Unpaywall `is_oa:false, oa_status:closed`" | prior art only |
| L2 | Xu et al. 2024, IEEE IoT-J 11(8):13482-13495 | 10.1109/jiot.2023.3337136 | **N3** — novelty claim is for the attack, not the identification algorithm; **N5** — costs are sign/single/agg only; **N6** — closed access, no OA | `P2_candidates.md:44` — N3: "`:48` the novelty claim is for the **attack**, not the identification algorithm"; N5: "`:38-43` costs are sign/single/agg only"; N6: "@Unpaywall `is_oa:false, oa_status:closed`" | prior art only |

## Notes

- **Two-pass screen**: per `P1_plan.md:46`, candidates hard-failing N1 (or N2) at pass 1 are not carried into pass 2 (N4/N5/N6). The `—` cells in P2 §3 mean *not reached*, not *unexamined* (`P2_candidates.md:58`).
- **E2's N1 failure is inferential**: `hanECLASEfficientPairingFree2022.md:46` marks the absence as «(نکته استنتاجی)» — the mechanism is not advertised in the abstract or visible section list, but this is not a proven absence in the full paper.
- **L1 and L2** are the only rejected candidates that passed N1 (both have D2/D4 mechanisms) but failed on cost evidence (N5) and/or access (N6). They remain relevant as prior art.
- **E5, E6, E14** also appear in P2 §3 with F cells (N3/N5/N6) but are classified as *prior art* in §6/§7, not as rejected candidates. They are excluded from this table per the T9 scope.

## Self-check

- [x] file exists at `sam-work/notes/N06_rejected.md`, non-empty
- [x] every claim carries a source locator (file:line or P2 §row)
- [x] no placeholder text
- [x] 1 row per rejected candidate (11 rows)
- [x] failure criterion named (N1, N2, N3, N5, N6 — not "not suitable")
- [x] sam-read skill consulted
