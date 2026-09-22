---
title: ECLAS construction
aliases: []
tags: [clas/vanet, vallent2021]
source:: [[vallent2021-en]]
pages:: p.6-9
---
# ECLAS construction
- Setup outputs primes $p, q$, curve $E$, group $G = \langle P \rangle$ of order $q$, master secrets $\alpha, \beta$ with $P_{pub} = \alpha P$ and $T_{pub} = \beta P$, hashes $H_1, H_2, H_3$, publishing $params$ preloaded in TPD and RSU, ECC-only with no pairings or map-to-point hashes (p.7).
- Pseudonym issuance runs over secure channels with $PID_1 = k_i P$, $PID_2 = RID_i \oplus H_1(\beta \cdot PID_1 \parallel T_i \parallel T_{pub})$ and $ID_i = (PID_1 \parallel PID_2 \parallel T_i)$ carrying validity period $T_i$ (p.7).
- KGC picks $d_i$, sets $Q_{IDi} = d_i P$ and issues $psk_i = d_i + H_2(ID_i \parallel Q_{IDi}) \cdot \alpha \pmod p$, verifiable by $psk_i \cdot P = Q_{IDi} + H_2(ID_i \parallel Q_{IDi}) \cdot P_{pub}$ and stored in the tamper-proof device (p.7).
- Vehicle picks secret $x_i$ as $vsk_i = x_i$, publishes $vpk_i = x_i P$ and forms full private key $sk_i = x_i + psk_i$ (p.8).
- Sign draws $r_i$ with $R_i = r_i P$, computes $h_i = H_3(M_i \parallel ID_i \parallel Q_{IDi} \parallel vpk_i \parallel R_i \parallel t_i)$ as eq.1, $S_i = h_i \cdot r_i + sk_i \pmod p$ as eq.2 and $\sigma_i = (R_i, S_i)$ as eq.3, transmitting $ID_i, Q_{IDi}, vpk_i, M_i, t_i, \sigma_i$ (p.8).
- Individual-Verify recomputes $h_{i,0} = H_2(ID_i \parallel Q_{IDi})$ as eq.4 and $h_i$ as eq.5, then checks $S_i \cdot P = h_i \cdot R_i + vpk_i + Q_{IDi} + h_{i,0} \cdot P_{pub}$ as eq.6 (p.8).
- Aggregate outputs concatenated $\sigma = (R_1, S_1), \ldots, (R_n, S_n)$ with $S = \sum S_i$ as eq.7, and Aggregate-Verify recomputes $h_{i,0}$ as eq.8 and $h_i$ as eq.9, then checks $S \cdot P = \sum h_i \cdot R_i + \sum vpk_i + \sum Q_{IDi} + \sum h_{i,0} \cdot P_{pub}$ as eq.10 (p.9).
- Caveat: aggregate-phase hash eq.9 is printed as $h_i = H_3(M_i \parallel ID_i \parallel vpk_i \parallel R_i \parallel t_i)$, dropping the $Q_{IDi}$ input present in eq.1 and eq.5, an as-printed inconsistency in the source (p.9).
## Links
- [[vallent2021-proofs-privacy]]
- [[vallent2021-performance-numbers]]
## Source
- source:: [[vallent2021-en]], p.9
