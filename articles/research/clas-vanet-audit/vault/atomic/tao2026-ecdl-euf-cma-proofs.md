---
title: ES-CLAS ECDL EUF-CMA proofs
aliases: [ES-CLAS security proof, Type-I Type-II unforgeability]
tags: [clas, vanet, tao2026, proofs, euf-cma, ecdl, rom]
source:: [[tao2026-en]]
pages:: p.7-p.9
---
# ES-CLAS ECDL EUF-CMA proofs
- Claim is existential unforgeability under adaptive chosen-message attack based on the ECDL problem (p.1).
- Proof is set in the random oracle model with simulated collision-resistant H1/H2 oracles, not in the standard model (p.7).
- Main result is given via Theorem 1 plus Type-I and Type-II Theorems 2-3 under ECDL intractability (p.7-p.9).
- Stated theorems cover Type-I and Type-II adversaries, with H1/H2 simulated oracles used in the reductions (p.7-p.8).
- No separate collusion or Type-III theorem is stated in the proof section (p.7-p.8).
- Interpretation: the proved scope is Type-I/II EUF-CMA in the random oracle model rather than standard-model or collusion coverage (p.7-p.9).
## Links
- [[tao2026-fully-aggregate-construction]]
- [[tao2026-performance-figures]]
## Source
- source:: [[tao2026-en]] p.7-p.9
