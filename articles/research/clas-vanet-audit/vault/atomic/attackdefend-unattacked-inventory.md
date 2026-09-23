---
title: Unattacked PF schemes inventory (PF-CLS vs PF-CLAS)
aliases: [attackdefend-unattacked-inventory]
tags: [clas, cls, vanet, inventory, pf-clas, pf-cls, gaps]
source:: [[tao2026-en]]
pages:: p.1
---
# Unattacked inventory — PF-CLS vs PF-CLAS

- Scope rule: `[PF-CLAS]` aggregate, `[PF-CLS]` single-signer, `[PF-CLSC]` signcryption; all ECC/HECC-only, no `e(.,.)` in construction (pp.6-9 per protocols index).
- PF-CLAS not yet broken: Tao-Cui 2026 ES-CLAS fully-aggregate `-24.3%` Type-I/II only (p.1; pp.7-9); Vallent 2021 ECLAS `Si = hi ri + ski` eq.2 p.8, eq.9 drops `Q_IDi` — try replacement (p.9 vs p.8).
- PF-CLAS not yet broken: Xu 2024 `Si = ki + h2 xi + h3 di` + BQS Alg.1 p.13488, Type-I/II only — try Type-III/gamma (pp.13489-13491).
- PF-CLAS not yet broken: Wu-Ye 2025 `si P = Ui + h3(PKi + h1 Ppub)` + `eta = H4(..)` Type-I/II/III (p.130; pp.131-134) — strongest, no break.
- PF-CLAS not yet broken: Gong PCAS (p.8), Wu-Chen enhanced `wi P = Ui + Xi h2 + (Yi + Ppub h_ID)h3` (p.6), Yue 2025 aggregator `s0` (pp.8-9), Iqbal HECC `S D - W = H3(F+L+H2 Dot_pb)` p.8 but aggregation reuses eCLAS[29].
- Out-of-scope unbroken PF: Wang-ECAE NDN-IoT (pp.12-14), Zhang2024 IoMT `theta P = U + r'(fs Y + T + hs Ppub)` p.4353.
- Abstract-only untestable: Han2022 eCLAS, Wu-Heng collusion — no equations (Abstract-only).
- PF-CLS not yet broken: Wei enhanced `vP = T + h2(X + R + h1 Ppub)` `h1 = H1(ID,X,R,Ppub)` (p.8, §5) — single only, use CFS template for CLAS test.
- Already broken (exclude from this list): Liu-LICLAS, Han-eCLAS, Zheng2023, Dai22, Chen[19], Zhu-Guan, Chen-Guan, Xiang/Du/Karati/Pakniat-CLS, Xiong-CPPA-D, Cui2018, Huang-QS.

## Links

[[tao2026-fully-aggregate-construction]]
[[vallent2021-eclas-construction]]
[[xu2023-enhanced-construction-bqs]]
[[wu2025-pseudonyms-construction]]
[[gong2023-pcas-construction]]
[[wu2025-signcryption-enhanced-ecc-signcrypt]]
[[yue2025-aggregator-signature-fix]]
[[iqbal2023-hecc-construction]]
[[wei2025-enhanced-pf-cls-construction]]

## Source

source:: [[tao2026-en]] (p.1)
source:: [[vallent2021-en]] (pp.8-9)
source:: [[xu2023-en]] (p.13488)
source:: [[wu2025-pseudonyms-en]] (p.130)
