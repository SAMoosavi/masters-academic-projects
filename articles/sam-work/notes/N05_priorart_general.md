# N05 — General aggregate-signature detection prior art (Bellare 1998 · Huang 2011)
citekey: bellare1998fastbatch / huang2011matrix | doi/url: 10.1007/bfb0054130 · 10.1109/ccp.2011.46 | read: abstract-only (metadata + P2 screen) | reader: Crossref API + P2_candidates.md
pages: 236–250 (Bellare) · 299–306 (Huang) | read-on: 2026-10-05

## One-line summary
Two non-CLAS prior-art anchors for batch invalid-signature handling: Bellare-Garay-Rabin 1998 (fast batch verification, O(1) delay, modular-exponentiation test) and Huang-Lin-Leu 2011 (matrix-detection for a batch of *bad* signatures). Both are cryptographic operational mechanisms (not TA identity lookup), both predate CLAS, and both are closed-access — used here for the report's §5 prior-art axis only.

## Claims (with locators)

### Bellare, Garay, Rabin 1998 — E5
- [C1] Title: *Fast batch verification for modular exponentiation and digital signatures* — locator: Crossref `10.1007/bfb0054130` `title` field — quote: "Fast batch verification for modular exponentiation and digital signatures"
- [C2] Venue: EUROCRYPT'98, LNCS vol 1403, pp. 236–250, Springer Berlin Heidelberg — locator: Crossref `container-title` + `page` + `publisher` — quote: "Advances in Cryptology — EUROCRYPT'98" / "236-250"
- [C3] Mechanism class: batch-verification algorithm using a modular-exponentiation test; no authority in the loop — locator: `P2_candidates.md:49` (E5 row, N1 + N2 cells) — quote: "batch-verification algorithm" / "modular-exponentiation test, no authority"
- [C4] Cost result: O(1) batch-verification delay is the paper's central result — locator: `P2_candidates.md:49` (N5 cell) + `P2_candidates.md:107` — quote: "O(1) delay is the paper's whole result" / "the O(1)-batch-delay result the featured paper's FBD/EFBD extends to bad-signature localization"
- [C5] Prior-art status: 1998, superseded; cited by E1 (Ye 2021) as reference #4 of its 26 references, not claimed new — locator: `P2_candidates.md:49` (N3 cell) + `P2_candidates.md:32` + `P2_candidates.md:107` — quote: "1998; superseded, cited by E1 as the ancestor, not claimed new"
- [C6] Access: closed, no OA — locator: `P2_candidates.md:49` (N6 cell) — quote: "@Unpaywall `closed`, no OA"
- [C7] Citation count: 266 (Crossref `is-referenced-by-count`) — locator: Crossref `10.1007/bfb0054130` — quote: "is-referenced-by-count: 266"

### Huang, Lin, Leu 2011 — E6
- [C8] Title: *Verification of a Batch of Bad Signatures by Using the Matrix-Detection Algorithm* — locator: Crossref `10.1109/ccp.2011.46` `title` field — quote: "Verification of a Batch of Bad Signatures by Using the Matrix-Detection Algorithm"
- [C9] Venue: 2011 First International Conference on Data Compression, Communications and Processing (CCP), pp. 299–306, IEEE — locator: Crossref `container-title` + `page` + `publisher` — quote: "2011 First International Conference on Data Compression, Communications and Processing" / "299-306"
- [C10] Mechanism class: matrix-detection batch algorithm using a linear-algebra test; no authority in the loop — locator: `P2_candidates.md:50` (E6 row, N1 + N2 cells) — quote: "matrix-detection batch algorithm" / "linear-algebra test, no authority"
- [C11] Prior-art status: 2011 predecessor; E1's novelty is the *division* structure, not batch-of-bad-signature detection itself — locator: `P2_candidates.md:50` (N3 cell) — quote: "2011 predecessor; E1's novelty is the *division* structure, not batch-of-bad-signature detection itself"
- [C12] Access: closed, no OA — locator: `P2_candidates.md:50` (N6 cell) — quote: "@Unpaywall `closed`"
- [C13] Citation count: 3 (Crossref `is-referenced-by-count`) — locator: Crossref `10.1109/ccp.2011.46` — quote: "is-referenced-by-count: 3"
- [C14] Role in report: closest non-CLAS D2 mechanism; shows the idea predates CLAS → keeps the report's novelty claim honest — locator: `P2_candidates.md:108` — quote: "the closest non-CLAS D2 mechanism; shows the idea predates CLAS → keeps the report's novelty claim honest"

## Methods & data
- **Bellare 1998**: batch-verification algorithm for modular exponentiation and digital signatures. The O(1)-delay result is the paper's whole contribution (`P2_candidates.md:49` N5). The test is a modular-exponentiation check — cryptographic, not identity-based (`P2_candidates.md:49` N2). Algorithms fully specified at LNCS/CRYPTO grade (`P2_candidates.md:49` N4).
- **Huang 2011**: matrix-detection algorithm that verifies a batch of *bad* signatures — i.e. it detects which signatures in a batch are invalid. The test is a linear-algebra (matrix) check — cryptographic, not identity-based (`P2_candidates.md:50` N2). Algorithm specified (`P2_candidates.md:50` N4). No measurement in the resolved record (`P2_candidates.md:50` N5).

## Key numbers
- Bellare 1998 page range = 236–250 — locator: Crossref `page` field
- Huang 2011 page range = 299–306 — locator: Crossref `page` field
- Bellare 1998 citation count = 266 — locator: Crossref `is-referenced-by-count`
- Huang 2011 citation count = 3 — locator: Crossref `is-referenced-by-count`
- Bellare 1998 reference position in E1 (Ye 2021) = #4 of 26 — locator: `P2_candidates.md:107`

## Limitations stated by the authors
- Neither paper's full text was retrieved (both closed-access, `P2_candidates.md:49,50` N6). All mechanism descriptions derive from the P2 screen's N1/N2/N4 cells and Crossref metadata — not from reading the papers' algorithm sections. No author-stated limitations are available.

## Relevance to node question
The node asks for 1–2 general (non-CLAS) aggregate-signature detection papers. These two are the canonical anchors:

1. **Bellare 1998** is the O(1)-batch-delay ancestor. E1's FBD/EFBD extends this to *bad-signature localization* (`P2_candidates.md:107`). It is D4 (batch-failure handling) but not D2 (attribution) — it verifies a batch fast but does not identify which signer is bad.
2. **Huang 2011** is the closest non-CLAS D2 mechanism — it detects a batch of bad signatures via matrix detection (`P2_candidates.md:108`). It is the direct conceptual predecessor of E1's division-based search, but uses linear algebra rather than divide-and-conquer.

**Why prior art but not CLAS-native**: Neither paper is certificateless. Bellare 1998 is a general batch-verification result for modular exponentiation / digital signatures (RSA-type, EUROCRYPT'98). Huang 2011 is a general batch-of-bad-signatures result (CCP, IEEE). Neither addresses the certificateless setting (no key-generation center, no partial-private-key problem), neither is VANET-specific, and neither is cited by the CLAS corpus as a CLAS mechanism. They establish that *fast batch verification* and *batch bad-signature detection* predate CLAS — so E1's novelty is the **division structure** applied to CLAS in VANETs, not the general idea of batch detection (`P2_candidates.md:50` N3).

## Readability verdict
- **partial**: Full text not retrieved for either paper (closed access, confirmed by `P2_candidates.md:49,50` N6 cells). All claims are sourced from P2_candidates.md screen cells and Crossref metadata (title, venue, page range, citation count). No algorithm pseudocode, no security proof, no experimental data from the papers themselves is claimed. The mechanism descriptions ("modular-exponentiation test", "matrix-detection", "linear-algebra test") are the P2 screen's characterizations (`P2_candidates.md:49,50` N1/N2), not direct quotes from the papers.
