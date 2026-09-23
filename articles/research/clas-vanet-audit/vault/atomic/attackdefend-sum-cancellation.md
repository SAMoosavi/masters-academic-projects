---
title: Additive sum cancellation and H4 defend
aliases: [attackdefend-sum-cancellation]
tags: [clas, vanet, attack, defend, aggregation, pf-clas]
source:: [[lode2026-en]]
pages:: p.12-13
---
# Sum cancellation — attack idea and defend

- Attack idea (Huang QS-CLAS): aggregate `sigma_agg = sum zi`, verify summed relation + global norm `beta_ver` (p.12).
- Set `z1' = z1 + Delta`, `z2' = z2 - Delta` so sum + norm unchanged while contributions altered/neutralized (pp.12-13).
- Succeeds because aggregation additive + norm check aggregate-only (p.13).
- Same class: Li[31] `sigma1+gamma, sigma2-gamma` plain-sum collusion (p.138-139 per wu2025-pseudonyms App.).
- Why defend works: weighted sums with fresh `ri` per signature so paired perturbations no longer cancel (p.13).
- Why defend works (PF-ECC): `eta = H4(X1..Xn)`, `sigma_agg = (sum Xi, eta)` + equality + hash check (p.130).
- Cost note: hardening + `30-50%` signing vs fragile designs (p.19); `n > 500` exceeds `100-300 ms` window (pp.17-19).
- PF applicability: YES — affects every `S = sum Si` PF-CLAS without integrity tag.

## Links

[[lode2026-huang-cancellation-break]]
[[wu2025-pseudonyms-type3-proof]]
[[attackdefend-collusion-type3]]
[[attackdefend-rogue-key]]

## Source

source:: [[lode2026-en]] (pp.12-19)
source:: [[wu2025-pseudonyms-en]] (p.130)
