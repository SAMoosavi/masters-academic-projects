---
title: Pairing-based CLAS construction (setup/keygen/sign/verify)
aliases: []
tags: [clas, vanet, cahyadi2022]
source:: [[cahyadi2022-clas-scheme-en]]
pages:: p.8–p.12
---
# Pairing-based CLAS construction (setup/keygen/sign/verify)
- The scheme is pairing-based over cyclic additive G1 and cyclic multiplicative G2 of prime order q with generator P and bilinear map ^e: G1 x G1 -> G2, with KGC master secret a and Ppub = aP, TRA secret b and Tpub = bP, and RSU keys Prsui = yiP (p.8).
- Construction is described as Setup, Registration, Partial-Private-Key-Gen, Vehicle-Key-Gen, Pseudonym-Gen, Sign, Verify, then Aggregate and Aggregate-Verify (p.8).
- Partial key is pskIDi = aQIDi with vehicle check ^e(pskIDi, P) = ^e(QIDi, Ppub), vehicle keys are vskIDi = xi and vpkIDi = xiP, and pseudonyms use Ci = h3(b, IDi, Ti'), PIDi = QIDiCi, Di = h4(PIDi), Ki = CiDi (p.9–p.10).
- Sign picks Ui = uiP and hi = h6(Mi, PIDi, vpkIDi, Ui, ti), then computes Si = pskIDiK + vskIDiPpub + hiu_iPrsui with signature si = (Ui, Si) broadcast as (Mi, PIDi, vpkIDi, si, ti) (p.10).
- Verify checks ti freshness, recomputes hi and Di = h4(PIDi), then checks eq. (6) ^e(S, P) = ^e(PIDiDi + vpkIDi, Ppub) · ^e(hiUi, Prsui) (p.12).
- Aggregate sums S = sum Si over n pairs into s = (U1..Un, S), and Aggregate-Verify checks eq. (8) ^e(S, P) = ^e(sum PIDiDi + vpkIDi, Ppub) · ^e(sum hiUi, Prsui) (p.12).
## Links
- [[cahyadi2022-clas-scheme-proofs]]
- [[cahyadi2022-clas-scheme-cost-privacy]]
## Source
- source:: [[cahyadi2022-clas-scheme-en]] p.8–p.12
