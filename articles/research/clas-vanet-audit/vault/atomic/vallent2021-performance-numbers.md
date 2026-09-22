---
title: Performance numbers (1.7682 ms / 184 B)
aliases: []
tags: [clas/vanet, vallent2021]
source:: [[vallent2021-en]]
pages:: p.15-18
---
# Performance numbers (1.7682 ms / 184 B)
- Signing costs $2T_{e.m} + T_h \approx 0.8841$ ms using no pairings or map-to-point hashes (p.15).
- Individual verification costs the same $2T_{e.m} + T_h \approx 0.8841$ ms (p.16).
- Aggregate verification costs $2nT_{e.m} + nT_h \approx 0.8841n$ ms, scaling linearly with $n$ (p.16).
- Combined sign plus individual-verify load is $1.7682$ ms, reported as the best among the six compared schemes (p.16).
- Communication overhead is $184$ bytes per sent message, with $ID_i, Q_{IDi}, vpk_i, R_i$ in $G$ at $40$ B each plus $S_i$ at $20$ B plus $4$ B timestamp (p.17).
- The $184$ B overhead is lower than the Horng and Malhi designs and on par with the Cui, Xiong and Kamil designs (p.18).
- Batch verification delay scales linearly with $n$, and the comparison at $n = 2000$ signatures favors ECLAS (p.17).
## Links
- [[vallent2021-eclas-construction]]
- [[vallent2021-proofs-privacy]]
## Source
- source:: [[vallent2021-en]], p.17
