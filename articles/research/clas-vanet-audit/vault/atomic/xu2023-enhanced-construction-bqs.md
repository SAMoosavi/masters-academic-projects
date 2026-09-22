---
title: Enhanced Pairing-Free Construction with BQS
aliases: [xu2023-enhanced-construction-bqs]
tags: [clas, vanet, xu2023, construction]
source:: [[xu2023-en]]
pages:: pp.13487-13489
---
# Enhanced pairing-free construction with BQS
- Setup uses additive curve group $G = \langle P \rangle$ of prime order $q$ on $E: y^2 = x^3 + ax + b \pmod p$, master $s$ with $P_{pub} = sP$ and tracing secret $t$ with $T_{pub} = tP$ plus hashes $H_0$-$H_4$ (p.13487, §V).
- Pseudonym generation sets $AID_{i,1} = f_i P$, $AID_{i,2} = f_i T_{pub}$, $MID_i = VID_i \oplus AID_{i,2}$, with TA recovering $VID_i = MID_i \oplus tAID_{i,1}$ and issuing $PID_i = \{AID_{i,3}, \Delta T_i\}$ (pp.13487-13488, §V).
- Partial-key generation picks $r_i$, sets $R_i = r_i P$ and $d_i = r_i + s h_{1i}$, checked by $d_i P = R_i + h_{1i} P_{pub}$ (p.13488, §V).
- Vehicle key generation picks secret $x_i$, sets $X_i = x_i P$, $SK_i = (x_i, d_i)$ and $PK_i = (X_i, R_i)$ (p.13488, §V).
- Signing picks $k_i$, sets $K_i = k_i P$ with $h_{2i} = H_2(PID_i, m_i, t_i, K_i, PK_i, P_{pub})$ and $h_{3i} = H_3(PID_i, m_i, PK_i, K_i, h_{2i})$, then $S_i = k_i + h_{2i} x_i + h_{3i} d_i$ and $\sigma_i = (K_i, S_i)$ (p.13488, §V).
- Aggregation sums $S = \sum_{i=1}^{n} S_i$ and $K = \sum_{i=1}^{n} K_i$ into $\sigma = \{K, S\}$ for the application server (pp.13488-13489, §V).
- Single check $\alpha_i = S_i P - K_i - h_{2i} X_i - h_{3i}(R_i + h_{1i} P_{pub})$ accepts iff $\alpha_i = 0$, and aggregate check $\alpha = SP - K - \sum h_{2i} X_i - \sum h_{3i}(R_i + h_{1i} P_{pub})$ accepts iff $\alpha = 0$ (p.13488, §V).
- On $\alpha^* \neq 0$, AS plus RSU run Binary Quick Search Algorithm 1 to isolate invalid signatures and send bad PIDs to TA for $VID$ reveal (pp.13488-13489, §V).
- Revocation extension only adds $S_i = k_i + h_{2i} x_i + h_{3i} d_i + h_{4i} z_i$ with $Z_i = z_i P$ and $h_{4i} = H_4(PID_i, m_i, t_i, Z_i)$ (p.13494, §VII).
## Links
[[xu2023-chen-replacement-forgery]]
[[xu2023-euf-cma-proofs-figures]]
## Source
source:: [[xu2023-en]] (pp.13487-13489)
