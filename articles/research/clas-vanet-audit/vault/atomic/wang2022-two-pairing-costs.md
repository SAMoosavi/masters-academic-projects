---
title: Wang2022 two-pairing costs
aliases: [Wang2022 performance figures, two-pairing verification cost]
tags: [clas, vanet, wang2022, performance]
source:: [[wang2022-en]]
pages:: p.10
---
# Wang2022 two-pairing costs
- Aggregate verification needs only two bilinear pairings with zero map-to-point operations anywhere in the scheme (p.10).
- Signing costs 3Tmul + Tpa + Th approx 5.8518 ms under the MIRACL timing evaluation (p.10).
- Single-signature verification costs 2Tbp + 2Tmul + 3Tpa + 2Th approx 34.0828 ms with only two pairings (p.10).
- Aggregate verification costs 2Tbp + 2nTmul + 3nTpa + 2nTh approx 3.9352n + 30.1476 ms, scaling linearly and reported below prior schemes (p.10).
- Communication with G1 = 128 bytes and timestamp 4 bytes is 3x128 + 4 = 388 bytes single and 3x128 + 4n = 784 bytes aggregate at n = 100 (p.11).
- Practicability uses RSU capacity Rsc = p(dot)d/(Tver(dot)N(dot)v) with Tver = 34.0828 ms, d = 1000 m, N = 600-800 m, v = 5-20 m/s, about eight signatures per 300 ms (p.12).
- Security-attribute comparison in Table 2 reports this scheme satisfies all listed attributes while comparators satisfy only some (p.9).
## Links
- [[wang2022-sm-construction]]
- [[wang2022-sm-cdh-proofs]]
## Source
- source:: [[wang2022-en]] pp.10-12
