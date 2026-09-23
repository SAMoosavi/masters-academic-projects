---
title: Eta-shift forgery and two-signature key recovery and defend
aliases: [attackdefend-eta-key-recovery]
tags: [cls, vanet, attack, defend, forgery, key-recovery, pf-cls]
source:: [[shim2023-en]]
pages:: p.5-6
---
# Eta-shift + key recovery — attack idea and defend

- Attack idea (1 signature): from one bcast compute `eta = alpha - alpha'`, shift `A' = A + eta Spub`, emit valid untraceable msg on new `(M',t')` in same `{A,PID,T}` context (pp.5-6, §III.C).
- Verify holds: `beta' P = A' + w Ppub + alpha' Spub` while TA trace `PID xor H(sA')` fails (pp.5-6, §III.C).
- Attack idea (2 signatures): from two same-period `T` msgs solve `S = (beta-beta')(alpha-alpha')^-1`, `delta = beta - alpha S` (p.6, §III.D).
- After recovery attacker signs arbitrary msgs and frames victim since `PID xor H(sA) = RID` still resolves to victim (p.6, §III.D).
- Root cause: no integrity binding of `A` in `H1/H2`, reuse of `{A,PID,T,Spub}` within period (p.7, §IV).
- Why defend works: `w = H1(PID||T||A)`, `alpha = H2(M||PID||Spub||A||t)` plus fresh random per signing (p.7, §IV).
- PF applicability: YES — PF-CLS equation `beta P = A + w Ppub + alpha Spub` is ECC-only.

## Links

[[shim2023-eta-shift-forgery]]
[[shim2023-two-signature-key-recovery]]
[[shim2023-malicious-kgc-trapdoor]]
[[attackdefend-common-factor]]

## Source

source:: [[shim2023-en]] (pp.5-7)
