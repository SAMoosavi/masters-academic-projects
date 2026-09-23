---
title: Common-factor substitution attack and defend (PF-CLS)
aliases: [attackdefend-common-factor]
tags: [cls, iot, attack, defend, pf-cls, type-I]
source:: [[wei2025-en]]
pages:: p.7-8
---
# Common-factor substitution — attack idea and defend

- Attack idea (Def.1): forged `X*, R*, T*` from independent randoms scaled by common factor so replaced keys + signatures still verify (p.8, Def.1).
- Breaks Xiang/Du via keys scaled by system key with matching forged scalar for any message (p.7, §4.1).
- Breaks Karati by same flow (p.8, §4.2).
- Hardened Pakniat-Vanda with `h1` over `Q_ID` blocking Shim forgery still falls to `X* = x* Ppub1, R* = r* Ppub1, Q* = q* Ppub1` (pp.7-8, §4.2).
- Structural cause: forged components share no relation verifier can check (p.8, §4.2).
- Related: Zheng2023 §V.B Han key-recovery `dm = a h2m`, `Tm = h2m^-1`, `a = Tm dm` (p.3827).
- Why defend works: bind both halves `h1 = H1(ID, X_ID, R_ID, Ppub)`, `d = r + h1 s`, `v = t + h2(x+d)`, `vP = T + h2(X + R + h1 Ppub)` (p.8, §5).
- PF applicability: YES — template for PF-CLS; aggregate version = try same scaling on `(Xi,Ri,Ui)` in CLAS.

## Links

[[wei2025-common-factor-substitution-attack]]
[[wei2025-enhanced-pf-cls-construction]]
[[zheng2023-han-key-recovery-attack]]
[[attackdefend-eta-key-recovery]]

## Source

source:: [[wei2025-en]] (pp.7-8)
source:: [[zheng2023-en]] (p.3827)
