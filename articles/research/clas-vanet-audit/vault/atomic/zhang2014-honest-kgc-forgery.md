---
title: Honest KGC Forgery on Xiong CLAS
aliases: [zhang2014-honest-kgc-forgery]
tags: [clas, vanet, forgery]
source:: [[zhang2014-en]]
pages:: p.34
---
# Honest-but-curious KGC forgery

- Xiong et al.'s CLAS runs over groups G1, G2 of prime order q with pairing e^: G1 x G1 -> G2, base points P, Q, master key Ppub = sP, and hashes H1: {0,1}* -> G1 and H2: {0,1}* -> Zq* (p.33-34, §3.1).
- Each signer computes Vi = pskIDi + hi · ri · Ppub + hi · xIDi · Q with Ui = riP and hi = H2(mi, IDi, upkIDi, Ui) (p.34, §3.1).
- Individual verification checks e^(Vi, P) = e^([QIDi + hi · Ui], Ppub) e^(hi · upkIDi, Q), with aggregation V = ΣVi and a matching AggregateVerify equation (p.34, §3.1).
- The attacker here is an honest-but-curious KGC that follows setup but knows the master secret s (p.34, §3.2.1).
- The KGC queries the Sign oracle on a known message m'n, then recovers xIDn · Q from V'n − pskIDn − h'n·s·U'n divided over h'n (p.34, §3.2.1).
- With xIDn · Q recovered, the KGC forges (Un, Vn) on a fresh message mn, combines it with n − 1 oracle signatures, and passes AggregateVerify, giving universal forgery (p.34, §3.2.1).

## Links

[[zhang2014-malicious-kgc-collusion]]
[[zhang2014-short-aggregate-scheme]]

## Source

source:: [[zhang2014-en]] (p.34)
