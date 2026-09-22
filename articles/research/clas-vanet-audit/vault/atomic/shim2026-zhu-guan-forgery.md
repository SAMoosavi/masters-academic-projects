---
title: Zhu–Guan Type I Forgery
aliases: [shim2026-zhu-guan-forgery]
tags: [clas, vanet, forgery, type-I, zhu-guan]
source:: [[shim2026-en]]
pages:: p.2-3
---
# Zhu–Guan Type I public-key-replacement forgery

- Victim Zhu–Guan [12] pairing-free CLAS uses group G of order q with generator P, master secret s with P_pub = sP and hashes H1–H4, with keys SK = (x, c) and PK = (X, A) (p.2, §2.1).
- Victim single-sign equation is $z_{i,j} = b_{i,j} + c_{i,j} + x_{i,j} \cdot h_{4i,j}$ with $B_{i,j} = b_{i,j}P$ (p.2, §2.1).
- Victim single-verify equation is $z_{i,j}P = B_{i,j} + A_{i,j} + h_{3i,j} \cdot P_{pub} + h_{4i,j} \cdot X_{i,j}$ (p.2, §2.1).
- Type I forgery replaces victim PK = (X, A) with adversary key $(X' = x'P, A' = a'P)$ and sets $B = -h3 \cdot P_{pub}$ independently of b with h3 over (PID, X', A') (p.3, §3.1).
- Forgery scalar $z = a' + x' \cdot h4$ passes verification by cancellation via $B + A' + h3 \cdot P_{pub} + h4 \cdot X' = A' + h4 \cdot X' = (a' + x' \cdot h4)P = zP$ (p.3, §3.1).
- Shim–Kwon diagnose the structural cause as linear verification combinations letting B cancel $h3 \cdot P_{pub}$ with missing binding between public keys and ephemeral randomness (p.4, §3.3).

## Links

[[shim2026-chen-guan-forgery]]
[[shim2026-h5-h6-patch]]

## Source

source:: [[shim2026-en]] (p.2-3)
