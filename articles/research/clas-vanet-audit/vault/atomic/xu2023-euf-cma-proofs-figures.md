---
title: EUF-CMA Proofs and Cost Figures
aliases: [xu2023-euf-cma-proofs-figures]
tags: [clas, vanet, xu2023, proofs]
source:: [[xu2023-en]]
pages:: pp.13489-13493
---
# EUF-CMA proofs and cost figures
- Proposed scheme is EUF-CMA secure against Type-I adversaries in Theorem 1 in the random oracle model under ECDLP via Game I simulation with the Forking Lemma (pp.13489-13491, §V).
- Proposed scheme is EUF-CMA secure against Type-II adversaries in Theorem 2 in the random oracle model under ECDLP via Game II simulation with the Forking Lemma (pp.13489-13491, §V).
- Proof coverage stays in the random oracle model under ECDLP with no standard-model proof (pp.13489-13491).
- Binary Quick Search Algorithm 1 identifies invalid signatures after a failed aggregate check so valid messages stay usable without full re-verification (p.13488).
- Single sign costs 1 scalar multiplication at about 0.3218 ms on MIRACL timings (p.13492).
- Single verify costs 4 multiplications plus 4 additions at about 1.2968 ms on MIRACL timings (p.13492).
- Aggregate verify costs $(2n+2)$ multiplications plus $(2n+2)$ additions at about $0.6484n + 0.6484$ ms on MIRACL timings (p.13492).
- Vehicle-to-RSU overhead is $(PID_i, t_i, PK_i, m_i, \sigma_i)$ at $2|G| + 3|\mathbb{Z}_q^*| + 2|t| = 148$ bytes with $|G| = 40$, $|\mathbb{Z}_q^*| = 20$, $|t| = 4$ (p.13493).
## Links
[[xu2023-chen-replacement-forgery]]
[[xu2023-enhanced-construction-bqs]]
## Source
source:: [[xu2023-en]] (pp.13489-13493)
