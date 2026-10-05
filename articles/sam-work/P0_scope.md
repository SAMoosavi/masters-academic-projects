# P0 — Scope Clarification

Node: T0 · owner: sam-professor · status: ready (human ack required)
Run question: "Find an article on detecting malicious signatures in CLAS and PF-CLAS (and other aggregate signature schemes) with a novel/useful idea, then analyze it and produce an Obsidian-compatible report."

## 1. Research question

**Which published mechanism explicitly detects, identifies, or attributes malicious or invalid signatures inside a certificateless (pairing-based or pairing-free) aggregate-signature batch, and what novel security idea makes that mechanism effective where prior CLAS/PF-CLAS schemes only offer all-or-nothing verification or identity-based tracing?**

One primary claim to answer, plus one comparison axis to fill (detection cost as a new column).

## 2. Scope boundaries

### In scope — "malicious/rogue signature detection" must be at least one of

| code | what it means | why in scope |
| --- | --- | --- |
| D1 | **Rogue-key / rogue-signature prevention or detection** (rogue public keys, rogue aggregate keys) | explicitly named by the human; the canonical attack class on aggregation |
| D2 | **Malicious-signer attribution** — identifying *which* member produced the bad signature (cheater identification, faulty/counterfeit signer tracing) | this is the open gap the local corpus records: Wu-Ye 2025 calls invalid-signature re-verification "too expensive … future work" the corpus lists Thumbur 2021 as having "no cheater/forger identification mechanism" (`:32`), Wu-Ye 2025 calls invalid-signature re-verification "too expensive … future work" (`:31`), and detection cost "does not exist in the literature" (`:109`) |
| D3 | **Malicious-aggregate detection** — catching a forged or tampered *aggregate* signature, not just a single signature | covers attacks where per-signer checking is bypassed |
| D4 | **Batch-verification failure handling** — a defined protocol for what the RSU/aggregator does after a batch verify fails (split-and-search, divide-and-conquer, robust aggregation) | the practical VANET form of D2/D3 |
| D5 | **New attack + countermeasure pair** against a named CLAS/PF-CLAS scheme, where the attack is what makes detection necessary | cryptanalysis-only papers without a detection angle are weak fits; attack+fix is the standard pairing |

Explicitly **not** a qualifying detection mechanism: TA/TRA identity tracing of a pseudonym, or key-revocation/blacklist alone. Reason: those are conditional-privacy mechanisms already present across the local corpus (Han 2022, Zheng 2023, PCAS 2023 — rows `REPORT-PF-CLAS-VANET.md:26-28`) and do not answer *which signature is bad*.

### In scope — schemes

- **Core:** CLAS (pairing-based, e.g. Wang 2022 / Yuan 2023 line) and **PF-CLAS** (Han 2022, Zheng 2023, PCAS/Gong 2023, ES-CLAS/Tao 2026, Wu-Ye 2025, Yue 2025).
- **Variants:** conditional-privacy CLAS, traceable CLAS, **only when** the mechanism is detection-relevant (D1–D5).
- **Baselines/contrast:** plain aggregate signatures (BLS-family, RSA-family) and non-aggregate schemes — allowed only as the *comparison* row that shows what CLAS lacks.
- **Domain:** VANET/V2X/IoV strongly preferred. IoT, smart grid, NDN-IoT, IoMT acceptable **only if** the report can argue the transfer to VANET RSUs (justified: same 600–2000 msg/s batch-verification bottleneck, `REPORT-PF-CLAS-VANET.md:10`).

## 3. Novelty criteria (checkable)

The selected article must satisfy **all** of N1–N6. Any FAIL → reject, do not lower the bar.

- **N1 — mechanism exists.** The paper contains a *named* mechanism (algorithm, equation, or protocol step) for detection/identification/attribution. Justification: without it we are reviewing opinions, not a scheme. Evidence to record: quoted section + equation number.
- **N2 — not merely identity tracing.** The mechanism must be cryptographically operational (e.g. proof element, pairing check, bisection protocol, hash-chain, per-signer tag), not just "query the authority for the pseudonym's identity". Justification: keeps the article distinct from the conditional-privacy line already covered locally.
- **N3 — novelty claim is defensible.** Either (a) first such mechanism for CLAS/PF-CLAS, or (b) a new attack on a specific named scheme plus its countermeasure, or (c) a detection cost/complexity result not published before. Evidence: the paper's own related-work or contribution statement, quoted verbatim.
- **N4 — concretely specified.** Security model named (ROM / SM, Type-I/Type-II/Type-III, EUF-CMA or aggregation-specific) and algorithms fully specified. Justification: unverifiable claims cannot enter a thesis report.
- **N5 — cost is reported.** The paper gives a security proof *or* a time/communication measurement covering the detection step (not only the happy path). Justification: criterion 2 of the local corpus's evaluation plan requires detection cost as a new comparison column; without numbers we cannot fill it.
- **N6 — full text obtainable.** Open access, preprint, or author copy retrievable. Justification: the Thumbur 2021 row in the local corpus is explicitly paywalled-incomplete (`REPORT-PF-CLAS-VANET.md:32`); a paywalled-only feature would block P3 reading.

**Deliverable scope: ONE featured article + 3–6 supporting sources.** The featured article carries the analysis; supporting sources supply prior art, the attacked scheme, and the comparison baselines. Stated explicitly because "find an article" could be read as single-source; the report cannot establish novelty (N3) from one paper alone.

## 4. Acceptance criteria for the final report (checkable)

1. `sam-work/report.md` exists, has YAML frontmatter (`title`, `tags`, `date`, `aliases`), and renders in Obsidian.
2. Section 1 states the answer to the §1 question in ≤5 sentences, explicitly, not deferred.
3. The featured article has: problem, threat model, mechanism walk-through with ≥3 named equations/algorithms, security claim + its assumptions, cost figures.
4. Every claim carries a locator: file path in `sam-work/notes/` + page/section/line, or DOI/URL.
5. ≥3 supporting sources cited with an explicit role (prior art / attacked scheme / baseline).
6. A comparison table with a **detection-cost column** (extra verifications, O(log n) vs O(n), ms at stated n) — the gap the local corpus names.
7. A "what it does NOT solve" subsection — the honesty requirement; N-level claims must not be inflated.
8. Limitations section (search coverage, paywalls, no independent re-implementation).
9. AI disclosure statement at the end.
10. Reference list = exactly the sources used, each with a verification status.

## 5. Out of scope

- Pure-performance PF-CLAS papers with no detection/security novelty (excluded: they are the corpus, not the target).
- Conditional privacy / pseudonym management as the *primary* contribution.
- Schemes outside cryptographic signature aggregation (blockchain consensus, VANET MAC/hybrid auth) unless used as a one-line contrast.
- Building a new scheme or re-implementing the featured paper's code — this run *analyzes*; it does not innovate. Justification: the question asks for analysis of a published idea.
- Meta-research on the pipeline itself (that is P8 / scorecard).

## 6. Deliverable shape

Path: `sam-work/report.md` (single file, no build step).

Required sections, in order:

```
--- (frontmatter: title, tags, date, aliases) ---
# <title>
## 1. چکیده / Abstract          (one-paragraph answer to §1)
## 2. The Problem: why aggregate verification is all-or-nothing
## 3. The Featured Article
   3.1 Threat model & assumptions
   3.2 The detection/attribution mechanism (mechanism walk-through)
   3.3 Security claim and what it actually proves
   3.4 Cost: what the detection step adds
## 4. Comparison Table (incl. detection-cost column)
## 5. Prior art & supporting sources (with role per source)
## 6. What it does NOT solve  (contradictions + limits)
## 7. Implications for this thesis (PF-CLAS / VANET RSU)
## 8. Limitations of this review
## 9. References (verification status per entry)
## 10. AI Disclosure
```

Obsidian requirements: `[[wikilinks]]` to `sam-work/notes/N*_*.md`, one H1, no HTML tables (use Markdown tables), Persian RTL body with Latin technical terms untouched.

**Language default (reversible, one line): Persian RTL body — justified by the repo, proposal, and thesis being Persian (`AGENTS.md`: "All content is in Persian (RTL)"); English preserved for scheme names, equations, and citations. See OQ-1.**

## 7. Open questions for the human

| id | question | default I will proceed with if no answer |
| --- | --- | --- |
| OQ-1 | Report body: Persian or English? | **Persian RTL**, English terms untouched (stated above) |
| OQ-2 | Hard-restrict to VANET, or allow IoT/smart-grid when the transfer argument holds? | **Allow** broader domains, VANET transfer argued in §7 |
| OQ-3 | Is 3–6 supporting sources the right supporting budget? | **Yes**, 3–6 |
| OQ-4 | If no article passes N1–N6, what is the fallback — report the *strongest near-miss* with a written N-failure table, or stop? | **Report the near-miss with an explicit N-failure table** (a documented negative result is still a deliverable) |

Defaults are chosen so the run proceeds unblocked; each affects only P2+ and can be changed without redoing P0.

## 8. G2 self-check

- [x] file exists at declared path, non-empty
- [x] no TODO/TBD/placeholder text
- [x] every local-corpus claim carries a file path + line range; no external citation asserted without a verified locator
- [x] `sam-research` consulted (node schema, G2 checklist, review chain `sam-supervisor` → human ack)
