---
title: Short Aggregate CLAS Construction
aliases: [zhang2014-short-aggregate-scheme]
tags: [clas, vanet, construction]
source:: [[zhang2014-en]]
pages:: p.36
---
# Short-aggregate replacement scheme

- The replacement CLAS takes the Chen et al. short signature, proved existentially unforgeable under CDH in the random oracle model, as its basic CLS (p.36, §4).
- Setup runs over additive G1 and multiplicative GT with pairing e: G1 x G1 -> GT, master secret s, master public key P0 = sP, verifier key Y = yP, and hashes H0: {0,1}* -> Zq*, H1: {0,1}* -> G1, H2: {0,1}* -> G1, H: {0,1}* -> {0,1}^l (p.35-36, §4).
- PartialPrivateKeyExtract picks random x and sets dID = x + s·H0(ID, pkID,2, P0) with pkID,2 = xP (p.36, §4).
- SetSecretValue picks rID and SetPublicKey sets pkID = (pkID,1, pkID,2) with pkID,1 = rID·P (p.36, §4).
- Sign sets T1 = H1(m, ID, pkID, P0) and T2 = H2(m, ID, pkID, P0) and outputs S = rID·T1 + dID·T2 (p.36, §4).
- Verify checks e^(S, P) = e^(pkID,1, T1) e^(pkID,2 + h·P0, T2) with h = H0(ID, pkID,2, P0) (p.36, §4).
- Aggregation computes r = H(e^(r1, Y), …, e^(rn, Y)) with the verifier public key Y, and AggregateVerify recomputes hj, TIDj,1, TIDj,2 and checks r against H(e^(y·pkID1,1, TID1,1) e^(pkID1,2 + h1·P0, y·TID1,2), …) (p.36, §4).
- Theorem 1 states the aggregate is valid if and only if every individual signature is valid assuming H collision-resistant, proved by expanding e^(rj, Y) = e^(rj, yP) in both directions (p.36, §4).

## Links

[[zhang2014-honest-kgc-forgery]]
[[zhang2014-malicious-kgc-collusion]]

## Source

source:: [[zhang2014-en]] (p.36)
