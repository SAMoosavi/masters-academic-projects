---
title: Yuan2023 SM proofs and performance figures
aliases: [Yuan2023 CDHP proofs, Yuan2023 costs and communication]
tags: [clas, vanet, yuan2023, proofs, cdph, performance]
source:: [[yuan2023-en]]
pages:: pp.10-15
---
# Yuan2023 SM proofs and performance figures
- Theorems 1-2 state unforgeability in the standard model under CDHP against A1 (external, key-replacing) and A2 (internal, master-key-holding) via Lemmas 1-2 (pp.10-12).
- The paper claims seven informal properties: authentication, nonrepudiation, anonymity, unlinkability, traceability, anti-replay, and anti-impersonation (pp.12-13).
- Signing costs 2Tmul + 2Th ~= 2.3046 ms, reported as the lowest among the six compared schemes (pp.13-14).
- Single verification costs 2Tbp + 3Tmul + 3Tpa + 3Th ~= 24.1875 ms, less than four comparators but slightly more than Wang et al. at 23.0352 ms (pp.13-14).
- Aggregate verification costs 2Tbp + 3nTmul + 3nTpa + 3nTh ~= 3.5397n + 20.6478 ms with scaling plotted against signature count (pp.13-14).
- Communication is 2|G1| + timestamp = 260 bytes per signature and 2|G1| + n timestamps = 656 bytes at n = 100, equal to Kamil et al. and below the other comparators (pp.14-15).
## Links
- [[yuan2023-kgc-replacement-forgeries]]
- [[yuan2023-sm-construction]]
## Source
- source:: [[yuan2023-en]] pp.10-15
