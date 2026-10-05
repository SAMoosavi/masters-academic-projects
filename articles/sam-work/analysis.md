# Analysis — T10 synthesis

Inputs: 6 notes (0 full, 6 partial), candidates: `sam-work/P2_candidates.md`

## Direct answer (confidence: medium)

The featured article (Ye 2021, E1) is the only candidate that passes N1, N2, N3, N5 with hard locators and is rights-clear on N6. N4 (security model) is UNVERIFIED pending full text. The article proposes FBD/EFBD — bitwise-division algorithms that re-partition a failed aggregate batch and re-run aggregate verification to localize invalid signatures, costing "only one aggregation-verification delay" under a parallel condition with exactly 1 invalid signature (P2_candidates.md:42). Confidence is medium because the full text is not machine-retrieved; all claims derive from the Crossref abstract.

## Evidence table

| Note | Key claims | Locator | Readability |
|---|---|---|---|
| N01 | FBD+EFBD named; bitwise division; re-partitions batch; no authority in loop; VANET-native | P2_candidates.md:42,91 | partial (abstract-only) |
| N02 | "one aggregation-verification delay" (parallel, 1 invalid); baseline "> log₂ n times"; no ms/toolchain in abstract | P2_candidates.md:42 | partial (abstract-only) |
| N03 | Cui 2018: first ECC-based CLAS for VANETs; cheapest signing ≈0.4439 ms; all-or-nothing; O(n) fallback; broken by Kamil-Ogundoyin 2019 | lode2026.md:16; EfficientCertificateLessAggregate.md:73,101; REPORT-PF-CLAS-VANET.md:67 | partial (no full text) |
| N04 | Han 2022 eCLAS: pairing-free ECC, no detection advertised; Gong 2023 PCAS: 480-bit sig, 0.3368n+0.1652 ms agg verify, O(n) fallback | han:21,46; gong:17,44,48,60 | partial (Han abstract-only; Gong full) |
| N05 | Bellare 1998: O(1) batch verification, modular-exp test; Huang 2011: matrix-detection for bad sigs; both closed-access | P2_candidates.md:49,50 | partial (metadata + P2 screen) |
| N06 | 11 rejected candidates with N-failure criteria; L1/L2 pass N1 but fail N5/N6 | P2_candidates.md:43–55 | partial (P2 screen) |

## N1–N6 verdict table — Ye 2021 (E1)

| Criterion | Verdict | Evidence |
|---|---|---|
| N1 mechanism | **PASS** | FBD + EFBD named — P2_candidates.md:42 |
| N2 not-identity-tracing | **PASS** | Re-partitions batch + re-runs aggregate verification; "no authority in the loop" — P2_candidates.md:42 |
| N3 novelty | **PASS** | "few solutions are proposed to pinpoint all invalid signatures… not efficient enough" — P2_candidates.md:42 |
| N4 model+algs | **UNVERIFIED** | Abstract states no security model; full text 403 from this host — P2_candidates.md:42 |
| N5 cost | **PASS** | "only one aggregation-verification delay" (parallel, 1 invalid) + "more than log₂ n times" baseline — P2_candidates.md:42 |
| N6 full text | **P(rights)/UNVERIFIED(transport)** | CC-BY 4.0 gold OA; text not retrieved (403 on all legs) — P2_candidates.md:42 |

## Contradiction matrix

| # | Point | Side A | Side B | Assessment |
|---|---|---|---|---|
| 1 | Cui 2018 status | "first ECC-based CLAS for VANETs" — lode2026.md:16 | "found forgeable" (Kamil-Ogundoyin 2019) — lode2026.md:16 | Not contradictory: first ≠ secure |
| 2 | Ye 2021 cost figure | "only one aggregation-verification delay" — P2_candidates.md:42 | Qualifier: "in the parallel condition… 1 invalid" — P2_candidates.md:42 | Tension: headline number is conditional |
| 3 | Han 2022 detection | "not prominent" in abstract — han:46 | E2 fails N1 — P2_candidates.md:45 | Consistent: absence is inferential («نکته استنتاجی»), not proven |
| 4 | Gong 2023 detection | one-by-one re-verification fallback — gong:60 | E3 fails N1 — P2_candidates.md:46 | Consistent: fallback ≠ detection mechanism |
| 5 | Prior art vs. novelty | Bellare 1998 O(1) batch verify — P2_candidates.md:49 | Ye 2021 novelty is "division structure" — P2_candidates.md:42 | Consistent: Ye 2021 extends prior art |
| 6 | L1 status | "only CLAS-by-name scheme with named detection" — P2_candidates.md:109 | L1 fails N5/N6 — P2_candidates.md:43 | Not contradictory: has mechanism, fails cost+access |

## Detection cost comparison

### Asymptotic (extra verifications / aggregation-verification delays)

| Scheme | Detection cost | Fallback on batch failure | Locator |
|---|---|---|---|
| Ye 2021 FBD/EFBD | O(1) delays (parallel, 1 invalid) | Re-partition + re-verify subsets | P2_candidates.md:42 |
| Ye 2021 baseline | > log₂ n times | — | P2_candidates.md:42 |
| Cui 2018 | — | O(n) individual re-verification | REPORT-PF-CLAS-VANET.md:67 |
| PCAS (Gong 2023) | — | O(n) one-by-one re-verification | gong:60 |
| Bellare 1998 | O(1) batch verification | — | P2_candidates.md:49 |

**Note:** O(log n) vs O(n) for Ye 2021's baseline is NOT EXPLICITLY STATED in the abstract — N02:38.

### ms figures (only where toolchain matches: MIRACL, 80-bit security)

| Scheme | Sign | Verify | Aggregate verify | Locator |
|---|---|---|---|---|
| Cui 2018 | ≈0.4439 ms | ≈1.3298 ms | ≈6.2973n ms | EfficientCertificateLessAggregate.md:73 |
| PCAS (Gong 2023) | 0.1706 ms | 0.6690 ms | 0.3368n + 0.1652 ms | gong:48 |
| Ye 2021 | NOT IN ABSTRACT | NOT IN ABSTRACT | NOT IN ABSTRACT | — |

## Gap list

1. **Ye 2021 full text** — not machine-retrieved (403 on all legs); human-supplied PDF expected at `sam-work/papers/ye2021invalid.pdf` — P2_candidates.md:66
2. **FBD/EFBD full expansions** — not in abstract; full text required — N01:77
3. **Security model (N4)** — ROM/SM, adversary type, hardness assumption not in abstract — N01:79
4. **Algorithm pseudocode/equations** — not in abstract — N01:78
5. **Experimental setup** — library, hardware, simulation parameters not in abstract — N01:80
6. **Detection output** — whether detection reveals signer identity or only signature index — not in abstract — N01:81
7. **Han 2022 cost figures** — not in local snapshot (paywalled sections V–VI) — N04:30
8. **Bellare 1998 / Huang 2011 full texts** — closed access — N05:40
9. **Cui 2018 full text** — paywalled, no OA copy — N03:59
10. **L1 (Wang 2025) full text** — closed access — P2_candidates.md:67

## Trace appendix

Every claim in this analysis traces to a note locator. Key traces:
- "FBD + EFBD named" → N01:12 → P2_candidates.md:42
- "one aggregation-verification delay" → N02:10 → P2_candidates.md:42
- "no authority in the loop" → N01:18 → P2_candidates.md:42
- "few solutions… not efficient enough" → N01:14 → P2_candidates.md:42
- "first ECC-based CLAS" → N03:18 → lode2026.md:16
- "≈0.4439 ms signing" → N03:20 → EfficientCertificateLessAggregate.md:73
- "all-or-nothing" → N03:32 → EfficientCertificateLessAggregate.md:101
- "O(n) fallback" → N03:33 → REPORT-PF-CLAS-VANET.md:67
- "480 bits" → N04:51 → gong:44
- "0.3368n + 0.1652 ms" → N04:53 → gong:48
- "O(1) batch verification" → N05:14 → P2_candidates.md:49
- "matrix-detection" → N05:22 → P2_candidates.md:50
