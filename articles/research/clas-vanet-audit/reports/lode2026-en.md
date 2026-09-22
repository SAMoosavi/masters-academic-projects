# A Comprehensive Review of ECC-based Certificateless Aggregate Signature for VANETs and Cryptanalysis of Quantum-Secure CLAS

## Bibliographic
- Authors: Vijaya Lode, Anil Pinapati | Year: 2026 | Venue: Computers and Electrical Engineering 135:111174 | DOI: https://doi.org/10.1016/j.compeleceng.2026.111174 (p.1)

## Problem
VANETs need authenticated safety messages under ultra-low latency, but PKI certificate management is too heavy and ID-based keys suffer full key escrow (p.2).
Certificateless aggregate signatures promise one short verifiable aggregate for many vehicle messages with split trust between KGC and user (p.1).
Pairing-based CLAS keeps falling to stronger adversary models while pairings remain too costly for OBUs, so the field moved to pairing-free ECC CLAS (p.8-9).
No prior survey consolidates the resulting break-and-fix cycle of ECC-CLAS under one framework, which motivates this critical review (p.2).
The paper also asks whether the recent Huang quantum-secure CLAS aggregate is really sound (pp.1-2).

## Method
The authors define ECC preliminaries with the curve equation labeled Eq 1 over finite fields plus ECDLP, ECCDH and ECDDH hardness assumptions (p.4).
They fix a generalized 8-algorithm ECC-CLAS framework using framework names only, namely Setup, PseudoIdGen, PartialPrivatekeyGen, VehicleKeyGen, Sign, Verify, AggregateSign and AggregateVerify (p.5).
They define Type-I outsider, Type-II malicious KGC and Type-III colluding-insider adversaries with Game-1, Game-2 and Game-3 EUF-CMA closures (pp.5-6).
They list requirements P1-P9 plus Type-I, Type-II and Type-III resistance including message-injection and signature-swapping resistance (p.7).
They formalize attack math with Table 2 notation for P, alpha and P_pub, ID_i, psk_i, x_i, PK_i, D_i, H1 and H2, r_i and R_i (p.9).
They recapitulate Huang CL-Sign outputs (c_i, Z_i), timestamped CL-Verify, additive Aggregate-Sign sum and Aggregate-Verify sum plus norm bound, then demonstrate Delta cancellation (pp.12-13).
They compare ECC-CLAS designs in Table 3 and score security and cost in Table 4 and Table 5 using T_sm, T_ssm, T_pa, T_mm and T_h (pp.13-18).

## Key findings
- Pairing-based CLAS lineage from Castro-Dahab 2007 to Xiong 2013 constant-pairing verification is surveyed as background with flawed or broken proofs and forgeries (pp.7-8).
- Cui 2018 gave the first ECC-based CLAS for VANETs with only general one-way hashes and V2I batch verification and no pairings or MapToPoint, later found forgeable in Kamil 2019 analysis (p.9, p.13).
- Three recurring mathematical flaws drive the cycle: weak identity and message binding in hashes, linear structures letting KGC embed trapdoors or isolate user secrets, and aggregate checks over sums only (p.11).
- Huang aggregate uses sigma_agg as the sum of z_i and verifies the summed relation plus a global norm bound beta_ver (p.12).
- Cancellation attack sets z1_prime as z1 plus Delta and z2_prime as z2 minus Delta so the sum and its norm bound are unchanged while individual contributions are altered or neutralized (pp.12-13).
- The attack succeeds because aggregation is additive and the norm check is aggregate-only, so plus-Delta and minus-Delta tampering cancels in the final output (p.13).
- Proposed mitigation aggregates weighted sums with fresh random coefficients r_i per signature so paired perturbations no longer cancel (p.13).
- Table 4 shows only a few ECC-CLAS designs resist all of Type-I, Type-II and Type-III while most fail at least one adversary class (p.17).
- Table 5 costs scale near-linearly in n with T_sm, T_pa and T_h dominating, and dense loads of hundreds of messages per RSU can exceed the 100-300 ms safety window and turn infeasible past about n above 500 (pp.17-19).
- Hardening with key-validation checks adds roughly 30-50 percent signing cost over fragile designs (p.19).

## Limitations
- The work is a survey plus cryptanalysis and proposes no complete new scheme beyond the randomized-coefficient mitigation sketch (p.2, p.13).
- There is no agreed unified security model across works, with mixed random-oracle claims that block direct comparison (p.19).
- Empirical validation on real OBU and RSU hardware is missing, since simulations omit network delay, memory limits, concurrent load and channel loss (p.19).
- Revocation keeps a privacy-efficiency trade-off unresolved and most schemes lack a way to catch malicious-aggregator misbehavior (p.19).
- Long-term ECDLP exposure to Shor algorithm threatens ECC-CLAS and calls for hybrid or post-quantum redesign (p.19).

## Related Work
- [[gong2023]] -- Gong 2023 pairing-free CLAS cryptanalysis of the Liu scheme with ECC-only design, listed as a Table 3 break-and-fix entry (pp.13-16).
- [[han2022]] -- Han 2022 effective non-certificate aggregate signature without pairings, listed in Table 3 and later analyzed by Zheng in 2023 (pp.13-16).
- [[vallent2021]] -- Vallent 2021 safe and practical CLAS with time-limited pseudonyms for VANETs, listed as a Table 3 application entry (pp.13-16).
- [[wang2022]] -- Wang 2022 aggregate signature design with trusted registration authority support, scored in Table 4 and Table 5 comparisons (pp.13-18).
- [[zheng2023]] -- Zheng 2023 security analysis of the Han scheme proving its flaws, listed as a Table 3 cryptanalysis entry (pp.13-16).
- [[cahyadi2022-survey]] -- Cahyadi survey 2022 extensive review of certificateless aggregate signature mechanisms for VANETs, cited as background review work (p.4).

## Provenance
- Database + endpoint + params: local text dump at research/clas-vanet-audit/sources/lode2026.txt, paper_key lode2026, DOI 10.1016/j.compeleceng.2026.111174 resolved via publisher PDF
- Access date: 2026-09-22
- Coverage: full-text dump spans pages 1 to 20 including Tables 1 to 5 and Figures 1 to 3 with no section skipped
Full-text
