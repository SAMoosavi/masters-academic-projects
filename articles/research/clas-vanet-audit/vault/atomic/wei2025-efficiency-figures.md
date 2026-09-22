---
title: Efficiency Figures (Wei et al. 2025)
aliases: [wei2025-efficiency-figures]
tags: [cls, iot, pf-cls, efficiency]
source:: [[wei2025-en]]
pages:: p.1, p.11-12
---
# Efficiency Figures
- Verification costs 3Tsm + 3Tpa = 1.008945 ms, below Feng/Ma at 1.343218 ms and Du/Xiang at 1.341176 ms (p.12, §7).
- Total cost is about 19.76–20.05% below Feng/Ma, Du/Xiang, and Pakniat comparators (p.12, §7).
- Signature size is |G| + |Z_q*| = 480 bits, half the communication of Pakniat's 840-bit signatures (p.12, §7).
- Benchmarks compare against six schemes and report sign/verify time plus signature size in Tables 1–2 (p.11-12, §7).
- Timings measured with MIRACL over 1000 runs on one desktop CPU (p.11-12, §7).
- Pairing-FREE cost profile: only ECC scalar multiplication and point addition counted, no e(...) pairing operations (p.11-12, §7).
- Scope is IoT-CLS single-signer only, NOT aggregate and NOT VANET, so figures do not cover aggregation or VANET mobility (p.1, §Abstract).
## Links
[[wei2025-enhanced-pf-cls-construction]]
[[wei2025-common-factor-substitution-attack]]
## Source
source:: [[wei2025-en]] (p.11-12)
