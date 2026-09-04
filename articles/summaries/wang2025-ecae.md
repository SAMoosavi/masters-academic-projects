---
title: "ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments"
authors: "Cong Wang, Haoyu Wu, Yulong Gan, Rui Zhang, Maode Ma"
year: 2025
journal: "Entropy"
doi: "10.3390/e27050471"
tags: [certificateless-signature, aggregate-signature, ECC, NDN, IoT]
---

# ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments

## Overview

This paper proposes ECAE, an efficient certificateless aggregate signature scheme based on elliptic curve cryptography (ECC) for Named Data Networking IoT (NDN-IoT). The scheme eliminates bilinear pairing operations using ECC and universal hash functions, achieving substantial efficiency gains. Security is formally proven under the random oracle model.

## Relevance to Our Work

Relevant to the article research domain as it demonstrates how certificateless cryptography can be extended to IoT applications. The ECC-based approach without bilinear pairings offers efficiency insights for VANET CLAS design.

## Key Contributions

- Proposes ECAE scheme eliminating bilinear pairings through ECC and universal hash functions
- Partial private key distribution mechanism for KGC authentication
- Aggregate verification model reducing computation overhead by up to 46.18%
- Communication overhead reduced by 55.56% compared to state-of-the-art
- Formal security proofs under random oracle model

## Mathematical Notation

### Setup

$$
\begin{aligned}
&G: \text{Additive cyclic group on elliptic curve } E \text{ over } \mathbb{F}_p \\
&P: \text{Generator of } G \text{ with order } q \\
&s: \text{KGC master secret},\quad P_{pub} = sP
\end{aligned}
$$

### Partial Private Key Extract

$$
\begin{aligned}
&d_i = sH(ID_i)
\end{aligned}
$$

### Set Secret Value

$$
\begin{aligned}
&x_i \in \mathbb{Z}_q^* \\
&P_i = x_iP
\end{aligned}
$$

### Set Private/Public Key

$$
\begin{aligned}
&SK_i = (d_i, x_i) \\
&P_i = x_iP
\end{aligned}
$$

### Signature

$$
\begin{aligned}
&\text{ECC-based signing using scalar multiplication only}
\end{aligned}
$$

### Aggregate (CLAS)

$$
\begin{aligned}
&\text{Signatures compressed using ECC and universal hash functions}
\end{aligned}
$$

### Verification

$$
\begin{aligned}
&\text{Pairing-free, uses ECC scalar multiplication only}
\end{aligned}
$$

## Protocol / Scheme

1. **Setup**: System parameters and master key generation
2. **KeyGeneration**: KGC issues partial private key, user generates secret value
3. **Sign**: ECC-based signing
4. **Aggregate**: Compress multiple signatures
5. **Verify**: Pairing-free verification at NDN routers

## Security Analysis

- Formally proven secure under ECDLP in the random oracle model
- Resists forgery, replay, and man-in-the-middle attacks
- Partial private key distribution mechanism ensures KGC authentication without key escrow

## Performance

- Total computation overhead reduced by up to 46.18%
- Communication overhead reduced by 55.56% compared to state-of-the-art schemes
- Eliminates expensive bilinear pairing operations
- Suitable for resource-constrained IoT devices

## Strengths & Limitations

- Strengths: Significant computation and communication overhead reduction, eliminates bilinear pairings for IoT efficiency, formal security proofs under standard assumptions, applicable to NDN-IoT architecture
- Limitations: Random oracle model security may not capture all attack vectors, NDN-specific optimizations may limit general applicability, focuses on IoT environments rather than VANET specifically

## Related Work

- [[tao2026|ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks]]
- [[han2022|eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication]]
