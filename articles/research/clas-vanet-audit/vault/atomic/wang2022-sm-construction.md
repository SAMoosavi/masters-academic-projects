---
title: Wang2022 SM CLAS construction
aliases: [Wang2022 construction, SM CLAS signing and verification]
tags: [clas, vanet, wang2022, construction]
source:: [[wang2022-en]]
pages:: p.6
---
# Wang2022 SM CLAS construction
- Setup picks master secret s with Ppub = sP and tracking key k with K = kP over groups G1, G2 of prime order q with pairing e: G1 x G1 -> G2 (p.6).
- TRA assigns pseudonym PIDi,j = {PIDi,1,j, Ti,j} with PIDi,1,j = IDi xor H1(kP + Ti,j) and Ti,j = ti,jP, recovering IDi with key k when tracing (p.6).
- KGC issues partial private key di = ri + ki·s mod q with Ri = riP and ki = H2(PIDi,j, Ri), sent via SSL (p.6).
- Vehicle picks secret xi with Xi = xiP, so public key is PKi = (Xi, Ri) and full private key is (di, xi) (p.6).
- Signing picks ui with Ui = uiP and Vi = uiQ, hashes hi = H3(mi || TSi, PIDi,j, Ui, Vi, Wi, PKi), and sets Wi = (di + hi·xi)Q + Vi with sigma_i = (Ui, Vi, Wi) (p.6).
- Single verification checks e(Wi, P) = e(Ri + ki Ppub + hi Xi + Ui, Q) and aggregate verification checks e(W, P) = e(sum Ri + sum ki Ppub + sum hi Xi + U, Q) with U, V, W summed over n (p.6).
## Links
- [[wang2022-sm-cdh-proofs]]
- [[wang2022-two-pairing-costs]]
## Source
- source:: [[wang2022-en]] p.6
