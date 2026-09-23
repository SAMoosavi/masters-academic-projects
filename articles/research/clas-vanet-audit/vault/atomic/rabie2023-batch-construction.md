---
title: Rabie2023 Distributed Batch CLAS Construction
aliases: [rabie2023-batch-construction]
tags: [clas, hwmsn, rabie2023, construction, ecc, batch]
source:: rabie2023.pdf
pages:: p.51-65
---
# Rabie2023 distributed batch CLAS construction

- Domain is healthcare wearable WMSNs, not VANETs: sensors on patient bodies report to doctors over open wireless channels (p.51).
- Pairing family is pairing-free ECC: the scheme uses ECC public-key cryptography with no bilinear pairing and no map-to-point hash, only point addition, XOR and generic one-way hashes (p.54).
- Comparator table confirms the pairing-free label: the proposed row reads ECDLP, non-bilinear pairing, full aggregation, safe (p.72).
- System has five entities: wearable sensor nodes (WeMSN), zonal node (ZN), central medical server (CMS), local medical server (LMS) and certified medical expert (CME) (p.60).
- System initialization sets CMS master key $psi$ with $Cpub = psi P$, LMS key $Omega$ with $Lpub = Omega P$, ZN key $lambda$ with $Tpub = lambda P$, plus hashes $h0$–$h3$ and public Params (p.61-62).
- Deployment installs a masked identity per sensor node derived as $Qi = MSNID xor h0(psi Qi || ti || Cpub)$ with validity period $ti$, traceable back only on conflicts via Eq. (3) (p.62-63).
- Distributed key generation splits partial keys: LMS picks $phi$ and CMS picks $gamma$, each sends its part to the ZN aggregator, which appends $PPKi = PPKk + PPKj$ and $Qi = Ql xor Qm$ and installs $(Qi, PPKi)$ on the node (p.63-64).
- Full private key is $SKMSNi = {delta_i, PPKi}$ with node public key $SMSNPPKi = delta_i P$, where $delta_i$ is the node secret (p.64).
- Signature generation signs message $Mi$ with masked identity, secret key and timestamp, producing $Xi = h4 . theta_i xor SKMSNi$ and signature $tau_i$ sent to the ZN aggregator (p.64).
- Aggregation follows Boneh et al. at the ZN in batch fashion, outputting aggregated certificateless signature pairs Eq. (9) to the LMS for verification (p.64).
- Aggregate verification at the LMS first checks timestamp liveness and revocation lists, then runs the batch equations of Algorithm 6, Eqs. (10)–(13) (p.65).
- No central server does verification: the design drops reliance on a centralized medical server and alleviates central tendency over medical servers by verifying in distributed fashion (p.51).
- Interpretation: the VANET relevance is one passing sentence claiming the scheme is conducive for vehicular communications, with no vehicular evaluation anywhere in the paper (p.54).

## Links

- [[rabie2023-privacy-model]] — threat and proof claims for this construction (p.60)
- [[rabie2023-figures]] — measured costs of this construction (p.73)

## Source

- source:: rabie2023.pdf (p.51-65)
