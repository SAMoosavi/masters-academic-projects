---
title: Dai Replacement Forgery (Wu 2025)
aliases: [wu2025-signcryption-dai-replacement-forgery]
tags: [clas, vanet, attack, forgery]
source:: [[wu2025-signcryption-en]]
pages:: p.1, p.2, p.5
---
# Dai Replacement Forgery
- Adversary is Type-I (A1) public-key-replacement attacker reviewed against Dai et al. on single messages and on aggregates (p.4, §4.1; p.5, §4.2–4.3).
- Replacement key is set as K′ = −h_ID·P_pub to cancel the KGC-bound term in verification (p.5, §4.2).
- Single forgery picks random n′, forms N′ = n′P, Q′ = n′(K_AS + h_AS·P_pub), c′ = m′ ⊕ H2(·) and w′ = n′ as σ′ = (N′, c′, w′) (p.5, §4.2).
- Forged single σ′ is accepted by the unsigncrypt check w′P = N′ + h′3(K′ + h_ID·P_pub) (p.5, §4.2).
- Aggregate forgery sums W′ = Σw′ into σ′ = ({N′, c′}, W′) accepted by W′P = ΣN + Σh3(K′ + h_ID·P_pub) at the AS (p.5, §4.3).
- Finding is summarized as "vulnerability to public key…" breaking Dai et al., listed with confidentiality ✓ but unforgeability ✗ (p.1; p.2, Table 1).
## Links
[[wu2025-signcryption-enhanced-ecc-signcrypt]]
[[wu2025-signcryption-proofs-figures]]
## Source
source:: [[wu2025-signcryption-en]] (p.4-5)
