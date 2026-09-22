---
title: Type-I/II proofs and privacy properties
aliases: []
tags: [clas/vanet, vallent2021]
source:: [[vallent2021-en]]
pages:: p.10-13
---
# Type-I/II proofs and privacy properties
- Theorem 1 states security against Type-1 adversary in the random oracle model under ECDL intractability in $G$, with Create, Sign and Hash queries $q_c, q_s, q_h$ (p.10).
- Theorem 2 states security against Type-2 malicious-KGC adversary in the random oracle model under ECDL intractability in $G$ (p.11).
- Anonymity holds with $ID_i$ hiding $RID_i$ recoverable only with TRA secret $\beta$ (p.12).
- Traceability holds with a revocation list maintained by the trusted authority (p.13).
- Unlinkability follows from fresh $k_i$ randomness per pseudonym (p.13).
- Replay resilience follows from $t_i$ freshness checks on received messages (p.13).
- Escrow resistance holds since $sk_i = x_i + d_i + H_2(ID_i \parallel Q_{IDi}) \cdot \alpha$ includes the vehicle secret $x_i$ unknown to the KGC (p.13).
## Links
- [[vallent2021-eclas-construction]]
- [[vallent2021-performance-numbers]]
## Source
- source:: [[vallent2021-en]], p.13
