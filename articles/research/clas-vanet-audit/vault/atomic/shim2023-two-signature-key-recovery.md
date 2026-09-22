---
title: Two-Signature Key Recovery on Xiong
aliases: [shim2023-two-signature-key-recovery]
tags: [clas, vanet, key-recovery, framing]
source:: [[shim2023-en]]
pages:: p.6
---
# Two-signature key recovery on Xiong

- Anyone collecting two same-period authentication messages of vehicle Vj under one {A, PID, T, Spub} can recover keys (p.6, §III.D).
- The two signatures share delta with beta = delta + alpha Sj and beta' = delta + alpha' Sj, so their difference is (alpha − alpha')Sj (p.6, §III.D).
- The attacker recovers the vehicle secret as Sj = (beta − beta')(alpha − alpha')^{−1} from known scalars (p.6, §III.D).
- The attacker recovers the partial private key as delta = beta − alpha Sj (p.6, §III.D).
- With (Sj, delta) the attacker signs arbitrary messages under {A, PID, T} within the period Tj,i (p.6, §III.D).
- Framing holds because TA resolves the victim equation PID xor H(sA) = RID to the honest vehicle Vj for forgeries reusing A (p.6, §III.D).

## Links

[[shim2023-malicious-kgc-trapdoor]]
[[shim2023-eta-shift-forgery]]

## Source

source:: [[shim2023-en]] (p.6)
