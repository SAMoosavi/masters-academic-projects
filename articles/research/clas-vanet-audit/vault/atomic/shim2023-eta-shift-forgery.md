---
title: Eta-Shift Forgery on Xiong
aliases: [shim2023-eta-shift-forgery]
tags: [clas, vanet, forgery, untraceability]
source:: [[shim2023-en]]
pages:: p.5-6
---
# Eta-shift forgery on Xiong

- Anyone holding a single broadcast message <A, M, PID, T, Spub, beta, t> can forge, since VANET messages are public (p.5, §III.C).
- The attacker hashes a new message and timestamp alpha' = H2(M' || PID || Spub || t') and forms the shift eta = alpha − alpha' (p.5, §III.C).
- The attacker shifts the commitment as A' = A + eta Spub, keeping {PID, T, Spub} unchanged (p.5, §III.C).
- The forged tuple <A', M', PID, T, Spub, beta, t'> satisfies the victim verification equation beta P = A' + w Ppub + alpha' Spub (p.5-6, §III.C).
- It is untraceable because TA computes PID xor H(sA') with s(aj,i + eta Sj)P, which differs from the original H(sA) bound to PID (p.6, §III.C).
- Hence the attacker produces valid signatures on any incorrect information that TA cannot trace to the real identity (p.6, §III.C).

## Links

[[shim2023-malicious-kgc-trapdoor]]
[[shim2023-two-signature-key-recovery]]

## Source

source:: [[shim2023-en]] (p.5-6)
