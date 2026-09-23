---
title: Collusion and Type-III gamma-shift attack and defend
aliases: [attackdefend-collusion-type3]
tags: [clas, vanet, attack, defend, collusion, type-III, pf-clas]
source:: [[zhang2014-en]]
pages:: p.35
---
# Collusion / Type-III — attack idea and defend

- Attack idea: two insiders exchange `r1 Ppub, r2 Ppub`, set `V1 = psk1 + h2 r2 Ppub + h1 x1 Q`, `V2 = psk2 + h1 r1 Ppub + h2 x2 Q` so each `(Ui, Vi)` invalid yet `V1+V2` passes aggregate (p.35, §3.2.3).
- Stronger: dishonest `Un` publishes `bP = aP - sum upk` + colluding KGC with `Q = tP` forges `V = sum psk + sum hi ri Ppub + sum hi t upk` without others' keys (p.35, §3.2.4).
- PF variant: `sigma1+gamma, sigma2-gamma` plain-sum shift; Huang QS-CLAS `z1'=z1+Delta, z2'=z2-Delta` sum + global norm `beta_ver` unchanged (pp.12-13).
- Why defend works: aggregate valid iff every single valid via verifier-key bound `r = H(e(r1,Y),...)` (p.36, §4).
- Why defend works (PF): `Xi = h3i^-1(si P - Ui)`, `eta = H4(X1..Xn)`, check `sum Xi = sum Xi'` + `eta` reduces Type-III to `H4` collision (pp.133-134, Thm.3).
- Lightweight alternative: weighted `sum ri zi` with fresh `ri` so `+Delta/-Delta` no longer cancel (p.13).
- PF applicability: YES — all plain `S = sum Si` PF-CLAS vulnerable.

## Links

[[attackdefend-kgc-trapdoor]]
[[attackdefend-sum-cancellation]]
[[wu2025-pseudonyms-type3-proof]]
[[zhang2014-malicious-kgc-collusion]]
[[lode2026-huang-cancellation-break]]

## Source

source:: [[zhang2014-en]] (p.35)
source:: [[wu2025-pseudonyms-en]] (pp.133-134)
source:: [[lode2026-en]] (pp.12-13)
