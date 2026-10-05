# G6 — Scorecard

**Node:** T14 · **Scorer:** sam-scorer · **Date:** 2026-10-05
**Run:** CLAS/PF-CLAS invalid-signature detection · **Type:** strongest near-miss (OQ-4 armed, not fired)

## Dimension scores

| dimension | score | evidence |
|---|---|---|
| completeness | **3** | Report answers P0 (P6_approval.md:12-22), but T3-T9 are done-not-approved and T10-T12 have status discrepancies (graph.md:34-36 vs 50-52) |
| citation integrity | **5** | P6_approval.md:78-101 verified 5 claims digit-for-digit; P2_candidates.md:144 verified 23 DOIs; zero fabrications |
| analysis rigor | **5** | analysis.md:31-40 contradiction matrix, :11-18 evidence table with readability, :64-75 gap list |
| review quality | **4** | T2 review had 9 specific findings (graph.md:86-90), T12 FAIL was specific (graph.md:52), but T3-T9 lack explicit verdict chains (graph.md:27-33) |
| process adherence | **3** | T10-T12 status discrepancy (graph.md:34-36 vs 50-52), T3-T9 missing verdicts, but rework ≤ 2 and no skipped gates |
| efficiency | **4** | T4-T9 parallel dispatch (graph.md:49), no orphans/duplicates, but T7 failure caused supervisor rework (P7_audit.md:85) |

## Overall

**4.0** / 5.0 — (3+5+5+4+3+4) / 6 = 24/6 = 4.0

## Top 3 weaknesses

1. **Status table inconsistency** — T10/T11/T12 are `pending` in the node table (graph.md:34-36) but `done`/`failed` in the status table (graph.md:50-52). The two tables were not updated atomically.
2. **Missing verdict chains for T3–T9** — These nodes are `done` (graph.md:27-33) but have no explicit verdicts in the node table. P7 audit marks them "implicit in pipeline" (P7_audit.md:37-39), which violates the G3 requirement that verdicts be recorded in the node row.
3. **T7 agent execution failure** — Agent reported success but `N04_baselines.md` was not on disk. Supervisor had to create it directly (P7_audit.md:85). This is an agent reliability gap, not a process gap.

## Top 3 improvement proposals

1. **`.opencode/agents/sam-supervisor.md`** — Add a mandatory reconciliation step: after any status change, update the node table and status table in the same edit. Add a rule: "Never leave the node table and status table out of sync; a status change is incomplete until both tables reflect it."

2. **`.opencode/agents/sam-master.md`** — Add a file-existence self-check before reporting `done`: "Before flipping a node to `done`, verify the output file exists on disk and is non-empty. If the file is missing, report `failed` with the error, not `done`."

3. **`.opencode/skills/sam-research/SKILL.md`** — Add a rule to the G4 gate sweep: "Verify that every `done` node has a complete verdict chain in the node table, not just the status table. If verdicts are missing, append a clarification node to record them."

## Verification samples

### 5 report findings → note locators

| # | Report claim | Report line | Note locator | Verified? |
|---|---|---|---|---|
| 1 | Ye 2021, DOI 10.1155/2021/9970851 | 12 | P2_candidates.md:91 | ✓ |
| 2 | FBD/EFBD bitwise division | 26 | N01_featured_mechanism.md:12 | ✓ |
| 3 | "one aggregation-verification delay" | 34 | N02_featured_cost.md:10 | ✓ |
| 4 | Cui 2018 ≈0.4439 ms signing | 48 | N03_attacked_scheme.md:20 | ✓ |
| 5 | Gong 2023 PCAS 0.3368n+0.1652 ms | 43 | N04_baselines.md:34 | ✓ |

### 5 references → resolution

| # | DOI | Resolves? | Evidence |
|---|---|---|---|
| 1 | 10.1155/2021/9970851 | ✓ | P2_candidates.md:42,91 |
| 2 | 10.1016/j.ins.2018.03.060 | ✓ | P2_candidates.md:47 |
| 3 | 10.1109/jsyst.2021.3116029 | ✓ | P2_candidates.md:45 |
| 4 | 10.1016/j.adhoc.2023.103134 | ✓ | P2_candidates.md:46 |
| 5 | 10.1007/bfb0054130 | ✓ | P2_candidates.md:49 |

### Graph node verdict chains

| node | status | verdict chain | complete? |
|---|---|---|---|
| T0 | approved | supervisor PASS + human ack | ✓ |
| T1 | approved | supervisor PASS + human ack | ✓ |
| T2 | approved | professor PASS-with-conditions → T2-c1 | ✓ |
| T2-c1 | approved | professor PASS (9/9) | ✓ |
| T3 | done | — | ✗ missing |
| T4–T9 | done | — | ✗ missing |
| T10 | pending (status table: done) | — | ✗ missing + status discrepancy |
| T11 | pending (status table: done) | — | ✗ missing + status discrepancy |
| T12 | pending (status table: failed) | professor FAIL → T12-r1 | ✗ status discrepancy |
| T12-r1 | approved | professor PASS (5 claims) | ✓ |
| T13 | done | — | ✗ missing |
| T14 | ready | — | — (current node) |

## Applied changes

None — all improvements are proposals for the human to review.
