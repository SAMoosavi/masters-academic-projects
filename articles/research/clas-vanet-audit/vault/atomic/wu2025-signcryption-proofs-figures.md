---
title: Proofs and Figures (Wu 2025 Signcryption)
aliases: [wu2025-signcryption-proofs-figures]
tags: [clas, vanet, proof, performance]
source:: [[wu2025-signcryption-en]]
pages:: p.4, p.7-9
---
# Proofs and Figures
- IND-CCA2 confidentiality and EUF-CMA unforgeability games are formalized for Type-I/II adversaries with hash, key, signcrypt and unsigncrypt oracles plus challenge and forgery phases (p.4, Table 3).
- Confidentiality is reduced to CDH in the random oracle model (p.7–8, §6.1).
- Unforgeability is reduced to ECDL in the random oracle model via the forking lemma (p.8–9, §6.2).
- Extraction uses τ = (w∗ − w∗′)/(h2 − h2′) for instance (P, τP) (p.7–9, §6.1–6.2).
- Anonymity uses pseudonym ID = (αP, RID ⊕ H2(·)), with traceability and revocation claimed unlike Dai et al. which lacks unforgeability and revocation (p.2, Table 1; p.9, §6.3).
- Computation total is (5n+3)Tm + (5n+2)Ta with Tm = 0.5929 ms and Ta = 0.0052 ms, below pairing baselines using Tpsm = 1.9296 ms, Tbp = 4.5956 ms and Tmtp = 4.9050 ms (p.8, Table 4; p.9, Table 6).
- Communication is 92 bytes single (|G| + |Zq∗| + |m|) and n|G| + |Zq∗| + n|m| aggregate, versus 144 bytes [28], 140 bytes [20], 276 bytes [26] and 296 bytes [27] (p.9, Table 7).
## Links
[[wu2025-signcryption-dai-replacement-forgery]]
[[wu2025-signcryption-enhanced-ecc-signcrypt]]
## Source
source:: [[wu2025-signcryption-en]] (p.4-9)
