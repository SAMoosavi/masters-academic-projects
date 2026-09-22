---
title: Chen–Guan Type I Forgery
aliases: [shim2026-chen-guan-forgery]
tags: [clas, vanet, forgery, type-I, chen-guan]
source:: [[shim2026-en]]
pages:: p.2-4
---
# Chen–Guan Type I public-key-replacement forgery

- Victim Chen–Guan [13] uses biometric BID with seeds, PID as encrypted identity plus timestamp, secret x with X = xP, partial key R = rP and d = r + s·h3, and full keys vsk = x·h3 + d with vpk = (U = R + h3·X, R) (p.2–3, §2.2).
- Victim single-sign equation is $c_i = b_i + vsk_i + x_i \cdot h_{4i}$ with $B_i = b_iP$ (p.2–3, §2.2).
- Victim single-verify equation is $c_iP = B_i + U_i + h_{3i} \cdot P_{pub} + h_{4i} \cdot X_i$ (p.2–3, §2.2).
- Type I forgery replaces victim vpk = (U, R) with $(U' = R' + h3 \cdot X', R')$ using fresh r' and x', then queries the allowed post-replacement signing oracle under the replaced key for (B, c) (p.3–4, §3.2).
- Reusable value theta = b − x'·h4 is extracted from the oracle response for forging new signatures (p.3–4, §3.2).
- Forgery on arbitrary new m' and t' as $c' = theta + x' \cdot h4'$ with the same B passes $B + U' + h3 \cdot P_{pub} + h4' \cdot X' = c'P$ without the victim partial private key (p.3–4, §3.2).

## Links

[[shim2026-zhu-guan-forgery]]
[[shim2026-h5-h6-patch]]

## Source

source:: [[shim2026-en]] (p.2-4)
