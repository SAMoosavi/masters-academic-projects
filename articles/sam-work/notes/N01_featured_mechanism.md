# N01 — Invalid Signatures Searching Bitwise Divisions-Based Algorithm for VANETs (2021)

citekey: ye2021bitwise | doi: 10.1155/2021/9970851 | read: abstract-only | reader: P2_candidates.md (secondary, quoting Crossref abstract)
pages: 12 (2021:1-12) | read-on: 2026-10-05

## One-line summary

A VANET-specific bitwise-division algorithm (FBD/EFBD) that localizes invalid signatures within a failed aggregate batch, achieving one aggregation-verification delay when only one signature is invalid (in parallel condition, at low invalid rate).

## Claims (with locators)

- [C1] The paper proposes two named algorithms: **FBD** and **EFBD** (full expansions NOT IN ABSTRACT). — locator: `P2_candidates.md:42` (N1 cell) — quote: "FBD + EFBD named, @Crossref abs."
- [C2] The core idea is **bitwise division** to search for invalid signatures within a batch. — locator: `P2_candidates.md:91` (title) — quote: "Invalid Signatures Searching Bitwise Divisions-Based Algorithm for Vehicular Ad-Hoc Networks"
- [C3] The paper addresses the gap that "few solutions are proposed to pinpoint all invalid signatures" and existing algorithms "are not efficient enough." — locator: `P2_candidates.md:42` (N3 cell) — quote: "few solutions are proposed to pinpoint all invalid signatures if existing. The algorithms that can find all invalid signatures are not efficient enough."
- [C4] The mechanism **re-partitions the batch** and re-runs aggregate verification to isolate invalid signatures. — locator: `P2_candidates.md:42` (N2 cell) — quote: "re-partitions batch + re-runs aggregate verification, 'one aggregation-verification delay'; no authority in the loop"
- [C5] Detection returns the **invalid signatures themselves** (localization), not signer identity. — locator: `P2_candidates.md:42` (D-code D2+D4) — quote: "D2+D4" (attribution + batch-failure handling)
- [C6] The paper is **VANET-native** (no transfer argument needed). — locator: `P2_candidates.md:91` — quote: "for Vehicular Ad-Hoc Networks"
- [C7] The mechanism requires **no authority in the loop** (no TA/RSU interaction for detection). — locator: `P2_candidates.md:42` (N2 cell) — quote: "no authority in the loop"

## Methods & data

**Detection mechanism (FBD + EFBD):**
- The algorithm uses **bitwise division** to narrow down invalid signatures in a batch. When aggregate verification fails, instead of rejecting the entire batch, it recursively divides the batch and re-verifies subsets to isolate the bad signatures. — locator: `P2_candidates.md:42` (N2 cell) — quote: "re-partitions batch + re-runs aggregate verification"
- **FBD** and **EFBD** are the two named variants (expansions NOT IN ABSTRACT — full text required). — locator: `P2_candidates.md:42` (N1 cell)
- The mechanism is **cryptographically operational** (not identity tracing): it uses mathematical verification, not authority lookup. — locator: `P2_candidates.md:42` (N2 cell) — quote: "no authority in the loop"

**Threat model:**
- The paper addresses the scenario where an aggregate signature batch contains **one or more invalid signatures** mixed with valid ones. — locator: `P2_candidates.md:42` (N5 cell) — quote: "when the number of invalid signatures is 1"
- The threat is **batch rejection**: without detection, the entire batch is discarded, losing valid signatures and wasting bandwidth. — locator: `P2_candidates.md:42` (N3 cell) — quote: "few solutions are proposed to pinpoint all invalid signatures"
- **NOT IN ABSTRACT**: specific adversary type (Type-I/II/III), attack model (EUF-CMA, etc.), and whether the threat includes malicious RSUs, replay, or Sybil attacks. Full text required.

**What detection returns:**
- The **invalid signatures** (or their indices) within the batch. — locator: `P2_candidates.md:42` (D-code D2+D4)
- **NOT IN ABSTRACT**: whether detection also reveals the signer's identity/pseudonym. Full text required.

## Named algorithms/equations (≥3 required)

1. **FBD** (expansion not in abstract) — locator: `P2_candidates.md:42` (N1 cell)
2. **EFBD** (expansion not in abstract) — locator: `P2_candidates.md:42` (N1 cell)
3. **Bellare-Garay-Rabin batch verification** (prior art, reference #4 of E1) — locator: `P2_candidates.md:32` — quote: "E5 `bellare1998fastbatch` 10.1007/bfb0054130 (Bellare, Garay, Rabin — canonical fast batch verification)"
4. **Huang-Lin-Leu matrix-detection** (prior art, reference of E1) — locator: `P2_candidates.md:32` — quote: "E6 `huang2011matrix` 10.1109/ccp.2011.46 (Huang, Lin, Leu — batch of *bad* signatures, matrix detection)"
5. **Ferng et al. messages-classification dynamic batch verification** (prior art, reference of E1) — locator: `P2_candidates.md:32` — quote: "E14 `ferng2021dynamicbatch` 10.1109/tmc.2019.2952105 (messages-classification dynamic batch verification, VANET)"

**Equations:**
- **NOT IN ABSTRACT**: no equations visible. Full text required.

## Key numbers

- **One aggregation-verification delay** when number of invalid signatures = 1 (in parallel condition). — locator: `P2_candidates.md:42` (N5 cell) — quote: "when the number of invalid signatures is 1, the proposed algorithms cost only one aggregation-verification delay"
- **Comparison baseline**: more than log₂ n times. — locator: `P2_candidates.md:42` (N5 cell) — quote: "while the comparison is more than log₂ n times"
- **Qualifier**: "in the parallel condition" and "at low invalid signatures' rate" — locator: `P2_candidates.md:42` (N5 cell)

## Security model

- **UNVERIFIED** — the abstract does not name a security model (ROM/SM), adversary type, or security definition. — locator: `P2_candidates.md:42` (N4 cell) — quote: "U — @Crossref abs. states no security model; full text 403 (Cloudflare) from this host"
- **NOT IN ABSTRACT**: ROM vs SM, Type-I/II adversary, EUF-CMA vs EUF-ACMA, underlying hardness assumption. Full text required.

## Limitations stated by the authors

- The "one aggregation-verification delay" figure holds only **"in the parallel condition"** and **"at low invalid signatures' rate"** — not for arbitrary batch composition. — locator: `P2_candidates.md:42` (N5 cell) and `P2_candidates.md:93` — quote: "the 'one aggregation-verification delay' figure holds 'in the parallel condition' and 'at low invalid signatures' rate'"

## Relevance to node question

This is the **featured article** (E1, top rank). It is the only candidate that:
- Has a named detection mechanism (FBD/EFBD) — N1 PASS
- Is not identity-tracing (no TA in loop) — N2 PASS
- States the gap it closes — N3 PASS
- Is VANET-native — no transfer needed
- Has numerical cost for the detection step — N5 PASS
- Is rights-clear (CC-BY 4.0) — N6 rights PASS

N4 (security model) is **UNVERIFIED** pending full text. If N4 fails, E1 becomes the strongest near-miss (OQ-4 armed, not fired).

## Readability verdict

- **partial**: Full text NOT available (transport blocked, 403 on every leg from this host). All content derived from Crossref abstract as quoted in `P2_candidates.md:42,91,93`. The following are missing and require full text:
  - Full expansions of FBD and EFBD acronyms
  - Detailed algorithm pseudocode/equations
  - Security model (ROM/SM), adversary type, hardness assumption
  - Experimental setup (library, hardware, simulation parameters)
  - Whether detection reveals signer identity or only signature index
  - Formal security proof

## Self-check

- [x] identity fields match the candidates row (`P2_candidates.md:91`)
- [x] every claim in `Claims` has a locator AND a short quote
- [x] every number has a locator; units attached; nothing rounded silently
- [x] `Readability verdict` filled — partial reads list the missing parts
- [x] zero claims inferred from the abstract presented as full-text findings

## Handoff

- Note path: `sam-work/notes/N01_featured_mechanism.md`
- Readability verdict: **partial** (abstract-only, full text unavailable)
- 3 most decision-relevant claims:
  1. FBD + EFBD are the named detection algorithms (N1 PASS)
  2. Detection re-partitions batch + re-runs aggregate verification, no authority in loop (N2 PASS)
  3. Security model UNVERIFIED — abstract states no ROM/SM/adversary type (N4 gate)
- Contradiction flag: none (no earlier note contradicts this)
