---
title: Ephemeral rogue-key attack and aggregator defend
aliases: [attackdefend-rogue-key]
tags: [clas, vanet, attack, defend, rogue-key, pf-clas]
source:: [[yue2025-en]]
pages:: p.1
---
# Rogue-key — attack idea and defend

- Attack idea: exploit signature randomness `Ui` to derive ephemeral rogue key, forge aggregate with rogue key + own private key that passes undetected (p.1).
- Table 1: Zheng `pairing-free yes / rogue no`, ours `yes/yes` (p.2, Table 1).
- Victim sign: `si = ui + d'i H3i + xi H4i`, `H3i = H3(Mi||PIDi||PKi||Kpub||Ti||ti)`, `H4i = H4(Mi||PIDi||PKi||Ui||Ti||ti)` (p.8).
- Why defend works: aggregator signs `M0 = (Uset, PKset, PIDset)` with `s0 = u0 + d0 H30 + H40 x0`, outputs `sigma = (U0..Un, s0, s)`, `s = sum s0..sn` (pp.8-9).
- Two-step verify: `s0 P = U0 + (R0 + H20 Kpub)H30 + H40 X0`, then `sP = sum Ui + sum(Ri + Kpub H2i)H3i + sum Xi H4i + s0 P` (p.9).
- Cost: `3|G| + 3|Zq*|` vs Zheng `4|G| + 3|Zq*|` (pp.12-13, Table 5); model Type-I-like + Type-II-like only, no Type-III (pp.9-10).
- PF applicability: YES — ECC-only `Th/Tpa/Tpm`, no `Tbp/Thtp` (p.11, Table 4).

## Links

[[yue2025-rogue-key-attack]]
[[yue2025-aggregator-signature-fix]]
[[yue2025-cost-figures]]
[[zheng2023-ecc-only-construction]]
[[attackdefend-sum-cancellation]]

## Source

source:: [[yue2025-en]] (pp.1-9)
source:: [[zheng2023-en]] (p.3827)
