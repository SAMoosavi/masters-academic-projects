---
title: "A privacy-preserving certificate-less aggregate signature scheme with detectable invalid signatures for VANETs"
authors:
  - Xiaoliang Wang
  - Peng Zeng
  - Guikai Liu
  - Kuan-Ching Li
  - Biao Hu
  - Francesco Palmieri
  - Yuzhen Liu
year: 2025
doi: "https://doi.org/10.1016/j.jisa.2025.104001"
journal: "Journal of Information Security and Applications"
tags:
  - certificateless-signature
  - aggregate-signature
  - detectable-invalid
  - V2V
  - VANET
relevance:
  - focus: "Scheme"
    note: "CLAS with detectable invalid signatures and conditional anonymity via pseudonyms; unique approach to signature validity detection"
---

# A Privacy-Preserving Certificate-Less Aggregate Signature Scheme with Detectable Invalid Signatures for VANETs

## Overview

This paper proposes an efficient CLAS scheme for VANETs that provides detectable invalid signatures. When aggregate verification fails, the scheme can efficiently identify which individual signatures are invalid and trace them to real identities. Security is proven under the CDH assumption in the random oracle model as EUF-ACMAs.

## Relevance

Introduces a novel approach to aggregate signature verification particularly relevant to the article VANET application. The detectable invalid property allows vehicles to identify and exclude invalid signatures during verification, improving overall system reliability.

## Key Contributions

- Proposes CLAS scheme with detectable invalid signature property
- Maintains EUF-ACMAs security under certificateless setting
- Supports conditional anonymity through pseudonym-based signing
- Efficient algorithm to detect invalid signatures with real identity tracing
- Performance advantage in computation overhead over existing schemes

## Mathematical Notation

- G: Additive cyclic group of prime order q
- P: Generator of G
- H_1, H_2, H_3, H_4: Cryptographic hash functions
- s: KGC master secret, P_pub = sP
- User key: x_i (secret), P_i = x_iP (public), d_i = sH_1(ID_i) (partial)
- Pseudonym: PID_i = H_2(ID_i, T_start, T_end), V_i = x_i H_1(PID_i)
- Sign: S_i = d_i H_1(PID_i) + x_i h_i + r_i, alpha_i = H_4(PID_i, S_i, M_i)
- Aggregate: S = sum S_i, alpha_agg = product alpha_i
- Detectable verify: recompute alpha_i' = H_4(PID_i, S_i, M_i) and check alpha_i = alpha_i'

## Protocol / Scheme

DI-CLAS extends standard CLAS with: (1) Detectable Invalid - each signature includes a verifiable component that allows detection of invalid signatures within aggregates; (2) Conditional Anonymity - vehicles sign using pseudonyms traceable to real identities by TRA when needed. Operates through Setup, Key Generation, Pseudonym Generation, Sign, Aggregate, Detectable Verify, and Trace phases.

## Security Analysis

Proven secure under EUF-ACMAs in the certificateless setting under CDH assumption in ROM. Provides unforgeability against adaptive chosen message attacks, conditional anonymity with TRA traceability, detectable invalid property without compromising security, and resistance to Type I and Type II adversary attacks.

## Performance

Claims efficient detectable verification with minimal overhead, scalable pseudonym management through TRA, practical for VANET deployment with real-time requirements, and reduced verification complexity through invalid signature detection.

## Strengths & Limitations

### Strengths
- Novel detectable invalid property improves system reliability
- Conditional anonymity with accountability through TRA
- Formal security proofs under standard certificateless model
- Practical for VANET with real-time verification needs

### Limitations
- TRA introduces a trusted third party dependency
- Pseudonym management adds complexity
- Detectable component may increase signature size
- Real-world TRA implementation challenges in VANET
