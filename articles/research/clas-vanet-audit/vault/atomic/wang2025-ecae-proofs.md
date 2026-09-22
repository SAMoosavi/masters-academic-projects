---
title: ECAE Super Type-I/II ROM proofs
aliases: [ECAE security proofs, Super adversary Forking Lemma proofs]
tags: [ecae, wang2025, proofs, ecdlp, rom, ndn-iot]
source:: [[wang2025-ecae-en]]
pages:: p.8-p.9
---
# ECAE Super Type-I/II ROM proofs
- Formal model defines Super Type-I external adversary with key-replacement ability and Super Type-II malicious KGC adversary (p.8-p.9).
- Theorem 1 proves unforgeability against Super Type-I adversary under ECDLP in the random oracle model via the Forking Lemma (p.14-p.17).
- Theorem 2 proves unforgeability against Super Type-II adversary under ECDLP in the random oracle model via the Forking Lemma (p.14-p.17).
- Reductions program H1/H2/H3 oracles and extract the ECDLP solution from two forged signatures on the same commitment (p.14-p.17).
- Informal properties claimed are anonymity via PID_i, unlinkability across pseudonyms, and message authentication at routers (p.17-p.18).
- Conditional traceability and non-repudiation rely on KGC stored triples, with replay resistance via nonces/timestamps and forward secrecy via independent u_i (p.17-p.18).
## Links
- [[wang2025-ecae-construction]]
- [[wang2025-ecae-figures]]
## Source
- source:: [[wang2025-ecae-en]] p.8-p.9, p.14-p.18
