# N02 — Featured article: detection cost and complexity (Ye et al. 2021)
citekey: ye2021bitwise | doi: 10.1155/2021/9970851 | read: abstract-only | reader: Crossref abstract via P2_candidates.md
pages: 12 (2021:1-12) | read-on: 2026-10-05

## One-line summary
The featured article's abstract reports that its bitwise-division detection algorithms cost "only one aggregation-verification delay" under a specific parallel condition with a single invalid signature, compared to "more than log₂ n times" for the baseline; no ms figures, hardware, or toolchain are stated in the abstract.

## Claims (with locators)

- [C1] **Detection cost figure (with qualifier):** "in the parallel condition, when the number of invalid signatures is 1, the proposed algorithms cost only one aggregation-verification delay, while the comparison is more than log₂ n times" — locator: `P2_candidates.md:42` (E1·N5 cell, quoting Crossref abstract verbatim) — quote: "in the parallel condition, when the number of invalid signatures is 1, the proposed algorithms cost only one aggregation-verification delay, while the comparison is more than log₂ n times"

- [C2] **Experimental performance claim:** "at low invalid signatures' rate, the experimental results demonstrate that the proposed algorithms achieve better performance in both theory and practice" — locator: `P2_candidates.md:42` (E1·N5 cell, quoting Crossref abstract) — quote: "at low invalid signatures' rate, the experimental results demonstrate that the proposed algorithms achieve better performance in both theory and practice"

- [C3] **Mechanism names:** The paper proposes two named algorithms: FBD (Fast Bitwise Division) and EFBD (Enhanced Fast Bitwise Division) — locator: `P2_candidates.md:42` (E1·N1 cell: "FBD + EFBD named, @Crossref abs.")

- [C4] **Detection approach:** The mechanism re-partitions the batch and re-runs aggregate verification to localize invalid signatures — locator: `P2_candidates.md:42` (E1·N2 cell: "re-partitions batch + re-runs aggregate verification")

- [C5] **Novelty claim:** "few solutions are proposed to pinpoint all invalid signatures if existing. The algorithms that can find all invalid signatures are not efficient enough." — locator: `P2_candidates.md:42` (E1·N3 cell, quoting Crossref abstract)

## Methods & data
- **Source basis:** Crossref abstract only. Full text was not retrievable from this host (HTTP 403 on every leg — Hindawi, r.jina.ai, api.allorigins.win, doi.org redirect, archive.org, colab.ws, ouci, core.ac.uk, europepmc, scholar.archive.org). See `P2_candidates.md:66` (§4 N6 pre-check) and `P2_candidates.md:42` (E1·N6 cell).
- **Rights status:** CC-BY 4.0, gold OA. `@Crossref license[0].URL = https://creativecommons.org/licenses/by/4.0/` (start 2021-05-24). `@Unpaywall is_oa:true, oa_status:gold`. `@OpenAlex best_oa_location.pdf_url = downloads.hindawi.com/…/9970851.pdf`. — locator: `P2_candidates.md:42` (E1·N6 cell).
- **Human-supplied PDF:** The human will download the PDF and place it at `sam-work/papers/ye2021invalid.pdf`. T3/T4 must verify the file by title-page match (title, authors, journal, year — not filename). — locator: `P2_candidates.md:66`, `graph.md:87`.

## Key numbers

| metric | value | unit | qualifier | locator |
|---|---|---|---|---|
| Proposed algorithm cost (parallel condition, 1 invalid sig) | 1 | aggregation-verification delay | "in the parallel condition, when the number of invalid signatures is 1" | `P2_candidates.md:42` |
| Comparison (baseline) cost | > log₂ n | aggregation-verification delays (implied) | same condition as above | `P2_candidates.md:42` |
| ms figures | NOT IN ABSTRACT | — | full text required | — |
| Toolchain / hardware | NOT IN ABSTRACT | — | full text required | — |

## Complexity comparison

- **Proposed algorithm:** O(1) aggregation-verification delays under the parallel condition with exactly 1 invalid signature. This is the abstract's claim — "only one aggregation-verification delay." — locator: `P2_candidates.md:42`
- **Baseline (comparison):** The abstract states the comparison costs "more than log₂ n times" the proposed algorithm's cost. This means the baseline is worse than O(log n) in aggregation-verification delays. The abstract does NOT explicitly state O(n) for the baseline. — locator: `P2_candidates.md:42`
- **O(log n) vs O(n):** NOT EXPLICITLY STATED in the abstract. The abstract only gives the "more than log₂ n times" figure for the comparison. Whether the baseline is O(log n) or O(n) cannot be determined from the abstract alone. — mark: **NOT IN ABSTRACT — full text required**

## What the detection step adds to the baseline

- The detection step adds a **re-partitioning** of the failed batch followed by **re-running aggregate verification** on sub-batches, rather than falling back to per-signature verification. — locator: `P2_candidates.md:42` (E1·N2 cell)
- The named algorithms are FBD and EFBD, which use bitwise division to narrow down invalid signatures. — locator: `P2_candidates.md:42` (E1·N1 cell)
- The abstract frames the baseline as "more than log₂ n times" the cost, implying the detection step is dramatically cheaper than the naive approach when invalid signatures are few. — locator: `P2_candidates.md:42`

## Limitations stated by the authors
- The abstract itself does not state limitations. The full text was not available for this read. — mark: **NOT IN ABSTRACT — full text required**

## Relevance to node question
This note extracts the detection cost and complexity information from the featured article's abstract, as recorded in `P2_candidates.md`. The key finding is that the "one aggregation-verification delay" figure is conditional on "the parallel condition" and "when the number of invalid signatures is 1" — it is not a general claim for arbitrary batch composition. The O(log n) vs O(n) comparison is not explicitly stated in the abstract. No ms figures, toolchain, or hardware information is available from the abstract.

## Readability verdict
- **partial:** Full text not retrievable (HTTP 403 on all legs from this host). Only the Crossref abstract was available, as quoted in `P2_candidates.md:42`. The abstract provides the key cost figure with its qualifier, the mechanism names (FBD, EFBD), and the experimental performance claim, but does not provide: specific ms figures, hardware/toolchain details, security model, algorithm pseudocode, or explicit complexity class notation. All missing items are marked "NOT IN ABSTRACT — full text required."

## Self-check
- [x] identity fields match the candidates row (`P2_candidates.md:91`: title, 5 authors, J. Adv. Transp. 2021:1-12, DOI 10.1155/2021/9970851)
- [x] every claim in `Claims` has a locator AND a short quote
- [x] every number has a locator; units attached; nothing rounded silently
- [x] `Readability verdict` filled — partial read lists the missing parts
- [x] zero claims inferred from the abstract presented as full-text findings
- [x] "in the parallel condition" qualifier preserved on the cost figure (per `graph.md:90` T5 dispatch condition)
- [x] O(log n) vs O(n) marked as "NOT EXPLICITLY STATED" rather than inferred
- [x] ms figures and toolchain/hardware marked "NOT IN ABSTRACT — full text required"
