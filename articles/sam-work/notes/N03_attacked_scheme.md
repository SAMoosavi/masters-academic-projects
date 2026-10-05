# N03 — Cui et al. 2018: base scheme attacked by Ye 2021 (CLAS w/o pairings for VANET)
citekey: Cui2018 | doi: 10.1016/j.ins.2018.03.060 | read: abstract-only (full text NOT available) | reader: Crossref API + local corpus
pages: 15 (Inf. Sci. vol. 451-452, pp. 1-15) | read-on: 2026-10-05

## One-line summary
Cui et al. 2018 is the first pairing-free ECC-based CLAS for VANETs; it is the host/base scheme that Ye 2021 (E1) targets with its FBD/EFBD invalid-signature detection algorithms, and it is already broken by Type-2 forgery (Kamil–Ogundoyin 2019) and Type-2 adversary attack (Kumar–Sharma 2018).

## Identity (from Crossref metadata)
- Title: "An efficient certificateless aggregate signature without pairings for vehicular ad hoc networks" — locator: Crossref `title`
- Authors: Jie Cui, Jing Zhang, Hong Zhong, Runhua Shi, Yan Xu — locator: Crossref `author`
- Journal: Information Sciences, vol. 451-452, pp. 1-15, July 2018 — locator: Crossref `container-title`, `volume`, `page`, `published-print`
- DOI: 10.1016/j.ins.2018.03.060 — locator: Crossref `DOI`
- Citations: 119 (as of Crossref 2026-09-29) — locator: Crossref `is-referenced-by-count`

## Claims (with locators)

### A. What the base scheme does
- [C1] Cui 2018 is the **first ECC-based CLAS for VANETs** that uses only general one-way hashes and V2I batch verification, with **no pairings and no MapToPoint** — locator: `lode2026.md:16` (summary of Lode & Pinapati 2026) — quote: "Cui 2018 gave the first ECC-based CLAS for VANETs with only general one-way hashes and V2I batch verification and no pairings or MapToPoint"
- [C2] Cui 2018 is the **first pairing-free ECDLP-based scheme** in the surveyed list, using **partial aggregation** with RSU batch verification — locator: `cahyadi2022-survey.md:24` (summary of Cahyadi & Hwang 2022) — quote: "Cui et al. [19] (2018) is the first pairing-free ECDLP scheme in the list, using partial aggregation with RSU batch verification (p.1270, Table 1; p.1273, Table 3)"
- [C3] Cui 2018 has the **cheapest signing cost** among compared schemes: ≈ 0.4439 ms signing, ≈ 1.3298 ms individual verify, ≈ 6.2973n ms aggregate verify — locator: `EfficientCertificateLessAggregate.md:73` (Vallent 2021 summary, Table 4) — quote: "Cui [13] | ≈ 0.4439 ms | ≈ 1.3298 ms | ≈ 6.2973n ms"
- [C4] Cui 2018 communication overhead: **184 bytes per message**, 184n bytes for n messages — locator: `EfficientCertificateLessAggregate.md:88` (Vallent 2021 summary, Table 5) — quote: "Cui [13] | 184 | 184n"

### B. Limitations and attacks on Cui 2018
- [C5] Cui 2018 was **found forgeable** by Kamil & Ogundoyin (2019) — locator: `lode2026.md:16` — quote: "later found forgeable via Kamil et al. (p.9, p.13)"
- [C6] Kumar & Sharma (2018) **cryptanalysed Cui 2018**, showing **insecurity against Type-2 adversary attack** — locator: `cahyadi2022-survey.md:25` — quote: "Kumar–Sharma [20] cryptanalyse Cui et al. [19], showing insecurity against Type-2 adversary attack (p.1270, Table 1)"
- [C7] Kamil & Ogundoyin (2019) **cryptanalysed Cui 2018 for Type-2 forgery** — locator: `cahyadi2022-survey.md:29` — quote: "Kamil–Ogundoyin [24] (2019) is a pairing-free full-aggregation scheme that cryptanalyses Cui et al. [19] for Type-2 forgery (p.1270, Table 1)"
- [C8] Cui 2018 is listed among **already-broken** PF-CLAS schemes — locator: `attackdefend-unattacked-inventory.md:18` — quote: "Already broken (exclude from this list): ... Cui2018 ..."
- [C9] Vallent 2021 notes Cui has the cheapest signing cost **but was found to have security flaws** — locator: `EfficientCertificateLessAggregate.md:79` — quote: "فقط Cui [13] هزینه امضا کمی پایین‌تر دارد ولی در [23] ناامن اعلام شده" (only Cui has slightly lower signing cost but is declared insecure in [23])

### C. The gap Ye 2021 addresses (FBD/EFBD countermeasure in context of Cui 2018)
- [C10] Ye 2021 (E1) cites Cui 2018 **only as a host scheme** for FBD/EFBD; Cui 2018 has **no detection algorithm of its own** — locator: `P2_candidates.md:47` (E7 row) — quote: "cited by E1 only as a *host scheme* for FBD/EFBD; no detection algorithm of its own"
- [C11] The **all-or-nothing** property: in Cui 2018 (and similar linear-aggregation schemes), aggregate verification is a single summed equation; if one signature is invalid, the **entire batch is rejected** with no information about which vehicle is at fault — locator: `EfficientCertificateLessAggregate.md:101` (Vallent 2021 summary, describing the structural weakness of the same linear aggregation family) — quote: "اگر یک امضا خراب باشد، کل بسته رد می‌شود و هیچ اطلاعاتی درباره اینکه کدام خودرو متخلف است داده نمی‌شود (all-or-nothing)"
- [C12] The fallback after batch failure is **O(n) individual re-verification** — expensive for RSU — locator: `REPORT-PF-CLAS-VANET.md:67` — quote: "پس از شکست تأیید تجمعی به بازتأیید پرهزینه‌ی O(n) تک‌به‌تک نیاز دارند"
- [C13] Ye 2021's FBD/EFBD algorithms address exactly this gap: they find **all invalid signatures** in a failed batch with **one aggregation-verification delay** when there is only 1 invalid signature (parallel condition), vs. more than log₂ n times for prior algorithms — locator: `P2_candidates.md:42` (E1 row, N5 cell, from Crossref abstract) — quote: "in the parallel condition, when the number of invalid signatures is 1, the proposed algorithms cost only one aggregation-verification delay, while the comparison is more than log₂ n times"

### D. What makes the base scheme "all-or-nothing"
- [C14] The linear aggregation structure (single summed verification equation) means the verifier can only check the **sum** of all signatures, not individual contributions — locator: `EfficientCertificateLessAggregate.md:101` — quote: "Aggregate Verify فقط یک معادله جمعی است"
- [C15] This is a **structural weakness** of the entire linear-aggregation CLAS family (including Cui 2018), not a bug that can be patched without changing the verification equation — locator: `EfficientCertificateLessAggregate.md:101` — quote: "خطی بودن aggregation یک نقطه ضعف برای تشخیص متخلف است"

## Methods & data
- Cui 2018 uses ECC-based pairing-free cryptography with partial aggregation and RSU batch verification — locator: `cahyadi2022-survey.md:24`
- Performance benchmarked in Vallent 2021 (MIRACL library, 80-bit security): signing ≈ 0.4439 ms, individual verify ≈ 1.3298 ms, aggregate verify ≈ 6.2973n ms — locator: `EfficientCertificateLessAggregate.md:73`
- Communication: 184 bytes/message — locator: `EfficientCertificateLessAggregate.md:88`

## Key numbers
- Signing cost: ≈ 0.4439 ms — locator: `EfficientCertificateLessAggregate.md:73` (Table 4, Vallent 2021)
- Individual verify: ≈ 1.3298 ms — locator: `EfficientCertificateLessAggregate.md:73`
- Aggregate verify: ≈ 6.2973n ms — locator: `EfficientCertificateLessAggregate.md:73`
- Communication overhead: 184 bytes/message, 184n bytes for n messages — locator: `EfficientCertificateLessAggregate.md:88` (Table 5, Vallent 2021)
- Citation count: 119 — locator: Crossref `is-referenced-by-count` (2026-09-29)

## Limitations stated by the authors
- NOT AVAILABLE — full text required. The Crossref record contains no abstract field, and the full text is paywalled (Elsevier TDM license, no OA copy found in local corpus).

## Relevance to node question
Cui 2018 is the **base/host scheme** that Ye 2021 (the featured article) builds upon. Ye 2021 does not fix Cui 2018's Type-2 forgery vulnerability (that was already done by Kamil–Ogundoyin 2019); instead, Ye 2021 addresses the **all-or-nothing detection gap** that is structural to Cui 2018's linear aggregation. The FBD/EFBD algorithms are designed to plug into existing CLAS schemes (like Cui 2018) to add efficient invalid-signature localization without requiring O(n) fallback.

## Readability verdict
- **partial**: Full text of Cui 2018 is NOT available (paywalled, no OA copy in local corpus). All claims are derived from: (1) Crossref metadata (identity, no abstract), (2) secondary summaries in `proposal/summaries/` (Lode 2026, Cahyadi 2022, Vallent 2021), and (3) the P2_candidates.md screening row. The specific attack details (Type-2 forgery mechanics, exact verification equation of Cui 2018) are NOT AVAILABLE from these sources and would require the full text.

## Self-check
- [x] identity fields match the candidates row (E7: Cui et al. 2018, Inf. Sci., DOI 10.1016/j.ins.2018.03.060)
- [x] every claim in `Claims` has a locator AND a short quote
- [x] every number has a locator; units attached; nothing rounded silently
- [x] `Readability verdict` filled — partial read, full text missing
- [x] zero claims inferred from the abstract presented as full-text findings (no abstract exists in Crossref record; all claims from secondary sources with locators)
