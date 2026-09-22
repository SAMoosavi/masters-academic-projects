---
title: h5/h6 Hash-Binding Patches
aliases: [shim2026-h5-h6-patch]
tags: [clas, vanet, patch, hash-binding, aggregate-verification]
source:: [[shim2026-en]]
pages:: p.4
---
# h5/h6 hash-binding patches

- Shim–Kwon Sec 3.3 proposal patches victim Zhu–Guan as $z = h5 \cdot b + h6 \cdot c + x \cdot h4$ with $zP = h5 \cdot B + h6 \cdot A + h3 \cdot P_{pub} + h4 \cdot X$ (p.4, §3.3).
- Hash domains h5 = H5(PID, X, A, B) and h6 = H6(PID, X, A, B) bind public keys and ephemeral randomness, with h6·A added specifically against insider collusion (p.4, §3.3).
- Shim–Kwon Sec 3.3 proposal patches victim Chen–Guan as $c = h5 \cdot b + h6 \cdot vsk + x \cdot h4$ with $cP = h5 \cdot B + h6 \cdot (U + h3 \cdot P_{pub}) + h4 \cdot X$ (p.4, §3.3).
- Chen–Guan h5 and H6 range over (PID, P_pub, vpk, B, X, m, t), stopping reuse because the recovered h5·b + h6·vsk quantity depends on the original message and randomness (p.4, §3.3).
- Restored security costs about 3n + 2 scalar multiplications for n aggregates, judged inefficient for dense real-time VANET with a non-linear next-generation paradigm left as future work (p.4, §3.3; p.4–5, §4).

## Links

[[shim2026-zhu-guan-forgery]]
[[shim2026-chen-guan-forgery]]

## Source

source:: [[shim2026-en]] (p.4)
