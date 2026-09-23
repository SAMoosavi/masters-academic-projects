---
title: LICLAS forgery and PCAS defend
aliases: [attackdefend-liclas-forgery]
tags: [clas, vanet, attack, defend, forgery, pf-clas, pcas]
source:: [[gong2023-en]]
pages:: p.5
---
# LICLAS forgery — attack idea and defend

- Attack idea: Liu LICLAS signing `Wi` design flaw recombined into valid forged signature (p.5, §4.2).
- Victim scope: HWMSN CLAS reused as VANET comparator (p.1, Abstract).
- Why defend works (PCAS): `w_i = [h3(d + alpha x) + y1 h4]`, `Y = sum h4 Y1`, `w = sum wi` (p.8, §5.2).
- Verify ECC-only: `wi P - h4 Y1 = h3 D + h1 Ppub`, `wP - Y = sum(h3 D + h1 Ppub)` Eq.1/2 (p.8, §5.2).
- Gains at equal `O(n)`: `-25%` transmission, `-16.56%/-25.34%` computation vs LICLAS (pp.13-14).
- Proof: EUF-CMA ROM under ECDLP Type-I/II Lemmas 1-4 + Type-III/IV analysis (pp.9-12).
- PF applicability: YES — no pairing, no Map-to-Hash.

## Links

[[gong2023-liclas-forgery]]
[[gong2023-pcas-construction]]
[[gong2023-efficiency-gains]]
[[attackdefend-replacement-cancellation]]

## Source

source:: [[gong2023-en]] (pp.5-8)
