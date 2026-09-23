---
title: Public-key replacement cancellation attack and defend
aliases: [attackdefend-replacement-cancellation]
tags: [clas, vanet, attack, defend, type-I, replacement, pf-clas]
source:: [[shim2026-en]]
pages:: p.3
---
# Replacement cancellation — attack idea and defend

- Attack idea (Zhu-Guan): replace `PK = (X,A)` with `(X'=x'P, A'=a'P)`, set `B = -h3 Ppub` with `h3` over `(PID,X',A')`, set `z = a' + x' h4` (p.3, §3.1).
- Cancellation: `B + A' + h3 Ppub + h4 X' = A' + h4 X' = zP` passes `zP = B + A + h3 Ppub + h4 X` (p.3, §3.1).
- Attack idea (Chen-Guan): replace `(U,R)` with `(U'=R'+h3 X', R')`, query post-replacement oracle for `(B,c)`, reuse `theta = b - x' h4` to forge `c' = theta + x' h4'` on any `m',t'` with same `B` (pp.3-4, §3.2).
- Same class: Xu2024 on Chen[19] `Kl' = zl P - h2l Ppub` (pp.13486-13487); Wu-Chen2025 on Dai22 `K' = -h_ID Ppub, w' = n'` (p.5, §4.2-4.3); Yuan2023 `U0 = u0 P - (R + k Ppub)` (p.7).
- Why defend works: bind all into hash `h5 = H5(PID,X,A,B)`, `h6 = H6(...)`, `z = h5 b + h6 c + x h4`, `zP = h5 B + h6 A + h3 Ppub + h4 X` (p.4, §3.3).
- Cost of patch: about `3n+2` scalar mults for `n` aggregates (p.4, §3.3).
- PF applicability: YES — all victims are PF-ECC; fix is hash-only, no pairing.

## Links

[[shim2026-zhu-guan-forgery]]
[[shim2026-chen-guan-forgery]]
[[shim2026-h5-h6-patch]]
[[attackdefend-kgc-trapdoor]]
[[xu2023-chen-replacement-forgery]]
[[wu2025-signcryption-dai-replacement-forgery]]

## Source

source:: [[shim2026-en]] (pp.3-4)
source:: [[xu2023-en]] (pp.13486-13487)
source:: [[wu2025-signcryption-en]] (p.5)
source:: [[yuan2023-en]] (p.7)
