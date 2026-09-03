---
title: "ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments"
authors:
  - Cong Wang
  - Haoyu Wu
  - Yulong Gan
  - Rui Zhang
  - Maode Ma
year: 2025
doi: "https://doi.org/10.3390/e27050471"
journal: "Entropy"
tags:
  - certificateless-signature
  - aggregate-signature
  - ECC
  - NDN
  - IoT
relevance:
  - focus: "Scheme"
    note: "ECC-based CLAS for NDN-IoT eliminating bilinear pairings; up to 46.18% computation reduction; cross-domain comparison baseline"
---

# ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments

## Overview

This paper proposes ECAE, an efficient certificateless aggregate signature scheme based on elliptic curve cryptography (ECC) for Named Data Networking IoT (NDN-IoT). The scheme eliminates bilinear pairing operations using ECC and universal hash functions, achieving substantial efficiency gains. Security is formally proven under the random oracle model.

## Relevance

Relevant to the article research domain as it demonstrates how certificateless cryptography can be extended to IoT applications. The ECC-based approach without bilinear pairings offers efficiency insights for VANET CLAS design.

## Key Contributions

- Proposes ECAE scheme eliminating bilinear pairings through ECC and universal hash functions
- Partial private key distribution mechanism for KGC authentication
- Aggregate verification model reducing computation overhead by up to 46.18%
- Communication overhead reduced by 55.56% compared to state-of-the-art
- Formal security proofs under random oracle model

## Mathematical Notation

- G: Additive cyclic group on elliptic curve E over F_p
- P: Generator of G with order q
- s: KGC master secret, P_pub = sP
- User key: x_i (secret), P_i = x_iP (public), d_i = sH(ID_i) (partial private key)
- Aggregate: signatures compressed using ECC and universal hash functions
- Verification: pairing-free, uses ECC scalar multiplication only

## Protocol / Scheme

ECAE operates in phases: Setup (system parameters and master key), Key Generation (KGC issues partial private key, user generates secret value), Sign (ECC-based signing), Aggregate (compress multiple signatures), and Verify (pairing-free verification). The aggregate model enables batch verification at NDN routers.

## Security Analysis

Formally proven secure under ECDLP in the random oracle model. Resists forgery, replay, and man-in-the-middle attacks. The partial private key distribution mechanism ensures KGC authentication without key escrow.

## Performance

Substantial efficiency gains demonstrated: total computation overhead reduced by up to 46.18%, communication overhead reduced by 55.56% compared to state-of-the-art schemes. Eliminates expensive bilinear pairing operations, making it suitable for resource-constrained IoT devices.

## Strengths & Limitations

### Strengths
- Significant computation and communication overhead reduction
- Eliminates bilinear pairings for IoT efficiency
- Formal security proofs under standard assumptions
- Applicable to NDN-IoT architecture

### Limitations
- Random oracle model security may not capture all attack vectors
- NDN-specific optimizations may limit general applicability
- Focuses on IoT environments rather than VANET specifically
- Comparison scope may be limited

## Related Work

- [[tao2026|ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks]]
- [[han2022|eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication]]
