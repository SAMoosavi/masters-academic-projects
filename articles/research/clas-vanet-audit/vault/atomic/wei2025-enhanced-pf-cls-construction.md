---
title: Enhanced PF-CLS Construction (Wei et al. 2025)
aliases: [wei2025-enhanced-pf-cls-construction]
tags: [cls, iot, pf-cls, construction]
source:: [[wei2025-en]]
pages:: p.8-11
---
# Enhanced PF-CLS Construction
- Setup selects EC additive group G of order q with generator P, master key s, P_pub = sP, params (G, q, P, P_pub, H1, H2) (p.8, §5).
- Partial key binds both key parts to P_pub via h1 = H1(ID, X_ID, R_ID, P_pub) and d_ID = r_ID + h1·s with R_ID = r_ID·P (p.8, §5).
- Full keys are SK_ID = (x_ID, d_ID) and PK_ID = (X_ID, R_ID) with X_ID = x_ID·P (p.8, §5).
- Signing is Schnorr-style: t random, T = tP, h2 = H2(m, ID, X_ID, R_ID, T), v = t + h2·(x_ID + d_ID), output τ = (T, v) (p.8, §5).
- Verification is a single equation: recompute h1, h2 and accept iff vP = T + h2·(X_ID + R_ID + h1·P_pub) (p.8, §5).
- Pairing-FREE construction uses only ECC scalar multiplication, point addition, modular arithmetic, and hashes — no e(...) operator anywhere (p.8, §5).
- Proven EUF-CMA secure against super Type I and Type II adversaries in ROM under ECDLP via the forking lemma (Theorems 1–2) (p.9-11, §6).
- Scope is IoT-CLS single-signer only, not aggregate and not VANET, so no aggregation or batch verification is included (p.8, §5).
## Links
[[wei2025-common-factor-substitution-attack]]
[[wei2025-efficiency-figures]]
## Source
source:: [[wei2025-en]] (p.8-11)
