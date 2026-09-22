---
title: Wang2025 detectable proofs and cost figures
aliases: [EUF-ACMAs CDH proofs, detectable CLAS performance comparison]
tags: [clas, vanet, wang2025-detectable, proofs]
source:: [[wang2025-detectable-en]]
pages:: p.5–9
---
# Wang2025 detectable proofs and cost figures
- Theorem 1 states the scheme is EUF-ACMAs under the ROM-based CDH assumption via Lemmas 1 and 2 (p.5, §4.1).
- Lemma 1 bounds Type-I success as eps' >= (1-zeta)^{qppk+qs}(1-(1-zeta)^n)eps after qppk partial-key, qupk user-key and qs signature queries (p.6, §4.1).
- Lemma 2 bounds Type-II success as eps' >= (1-zeta)^{qupk+qs}(1-(1-zeta)^n)eps with Kpub=kknownP and U=u(bP) embedding (p.6–7, §4.1).
- Conditional anonymity, unlinkability, traceability, replay resistance via Ti, impersonation resistance via CDH, and man-in-the-middle resistance are claimed with pseudonym and trace equations (p.7, §4.2).
- Signature generation costs 2Thtp+4Tpm ~= 27.94 ms given Tbp=3.23 ms, Thtp=4.43 ms and Tpm=4.77 ms, while aggregate verification costs 4Tbp+(n+2)Thtp+2nTpm, i.e. about 1418.78 ms at n=100 (p.8–9, §5–Table 3).
- At n=100 the scheme saves about 24.1% versus [27,30], about 25.0% versus [28], about 84.9% versus [31], about 34.5% versus [32] and about 35.8% versus [33] as claimed, while it is about 1.0% more expensive than [24] and about 0.5% more than [29]; only this scheme provides invalid-signature detection and [24,29] are marked insecure against Type-II (p.8–9, §5–Table 3).
- Interpretation: H6 is defined in Setup with H0,4,5,6 to Zq* (p.4, §3), yet signing, verification and proofs use only H1–H5 (p.4–7, §3–§4.1); similarly Ypub appears in params (p.4, §3), yet the verification equation uses only Kpub and Tpub (p.5, §3).
- Evaluation uses one desktop (i5-7300HQ, 8 GB, Windows 10, Java with JPBC) for timing Tbp, Thtp and Tpm (p.8, §5).
## Links
- [[wang2025-detectable-pairing-construction]]
- [[wang2025-detectable-detection-mechanism]]
## Source
- source:: [[wang2025-detectable-en]] p.5–9
