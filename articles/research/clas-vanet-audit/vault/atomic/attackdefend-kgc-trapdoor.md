---
title: KGC trapdoor attack and defend (pairing-free transfer)
aliases: [attackdefend-kgc-trapdoor]
tags: [clas, vanet, attack, defend, kgc-attack, pf-clas]
source:: [[shim2023-en]]
pages:: p.5
---
# KGC trapdoor — attack idea and defend

- Attack idea: malicious-but-passive KGC publishes trapdoored `Q = alpha P` keeping `alpha`, collects one `sigma_i = (Ui, Vi, Wi)` under victim `{PKi, PIDi,j}` (p.5, §III.A).
- Attack equation: `Wi - alpha hi Xi - Vi = di Q` since `hi xi Q = alpha hi Xi`, then forge `Wi' = di Q + alpha hi' Xi + Vi'` on any `m'` (p.5, §III.A).
- Forgery passes `e(Wi', P) = e(Ri + ki Ppub + hi' Xi + Ui', Q)` and frames victim via `IDi = PIDi,1,j xor H1(kP + Ti,j)` (p.5, §III.A).
- Same pattern in Zhang2014 `Q = tP` honest-but-curious (§3.2.1 p.34) and malicious (§3.2.2 pp.34-35), and Yuan2023 `Q = lP` KGC forgery `Wi0 = l(Ri + ki Ppub + hi0 Xi + Ui0)` (pp.6-7).
- Why defend works: hide `Q` via `H4: G1 -> G1`, use `H4(Q)` so `log_P(Q)` unknown (p.7, §IV).
- Pairing-free transfer: same linear `Si P = ... + hi0 Ppub` structure exists in PF-CLAS; defend with `Z = H3(y_pub)`, `Wi = (di phi + hi xi + ui) Z` (pp.8-9), or double-master `alpha/beta` + `h1 = H1(PID, PK, Ppub)` check `pski P = Ri + h1 Ppub` (p.130).
- PF applicability: YES — ECC-only, no pairing needed for attack or patch.

## Links

[[shim2023-eta-shift-forgery]]
[[shim2023-two-signature-key-recovery]]
[[attackdefend-collusion-type3]]
[[attackdefend-replacement-cancellation]]
[[yuan2023-kgc-replacement-forgeries]]
[[zhang2014-malicious-kgc-collusion]]

## Source

source:: [[shim2023-en]] (p.5)
source:: [[zhang2014-en]] (pp.34-35)
source:: [[yuan2023-en]] (pp.6-9)
