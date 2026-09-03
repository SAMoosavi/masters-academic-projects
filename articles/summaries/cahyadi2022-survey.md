---
title: "A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks"
authors: "Cahyadi, Hwang"
year: 2022
journal: "IETE Technical Review"
doi: "10.1080/02564602.2021.2017800"
tags: [CLAS, VANET, survey, certificateless-signature, taxonomy]
---

# A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks

## Overview

This comprehensive survey reviews the state of certificateless aggregate signature (CLAS) schemes specifically designed for vehicular ad-hoc networks. The paper provides a systematic taxonomy of existing CLAS approaches, categorizing them by security model, cryptographic foundation, and VANET integration strategy.

The survey identifies critical security challenges in VANETs including authentication, privacy preservation, and bandwidth constraints. It evaluates how different CLAS schemes address these challenges, comparing bilinear pairing-based and pairing-free approaches. The authors highlight open research problems including post-quantum resilience, scalability for 5G/6G environments, and practical deployment considerations.

## Relevance to Our Work

This survey serves as the primary literature review reference for our article. It establishes the taxonomy and comparison framework we adopt, and identifies the specific gaps (Type-III resistance, efficiency, standard model proofs) that our work addresses.

## Key Contributions

- Comprehensive taxonomy of CLAS schemes for VANETs (2008–2022)
- Systematic comparison of security properties across schemes
- Identification of open research challenges and future directions
- Analysis of pairing-based vs. pairing-free trade-offs

## Mathematical Notation

The survey catalogs the following generic CLAS framework:

**Certificateless Signature (CLS) foundation:**
- Public key: $PK = xP$ where $x$ is user's secret value
- Private key: $(D_{user}, x)$ where $D_{user} = sH_1(ID)$ from KGC

**Aggregate signature construction:**
- Individual signatures $(S_i, R_i)$ for messages $m_i$
- Aggregate: $\sigma_{agg} = \sum_{i=1}^n S_i$
- Verification: $e(\sigma_{agg}P, P) = \prod e(R_i, P) \cdot e(\sum h_i PK_i, P_{pub})$

**Security assumptions cataloged:**
- Computational Diffie-Hellman (CDH)
- Elliptic Curve Discrete Logarithm (ECDL)
- Bilinear Diffie-Hellman (BDH)

## Protocol / Scheme

The survey describes the generic CLAS protocol flow for VANETs:

1. **System Setup**: KGC initializes with master secret/public key pair
2. **Vehicle Registration**: TA registers vehicles, KGC issues partial private keys
3. **Key Generation**: Vehicles combine partial private key with chosen secret value
4. **Message Signing**: Vehicles sign safety messages with their full private key
5. **Aggregation**: RSU or aggregator combines multiple signatures
6. **Batch Verification**: RSU verifies aggregate signature in constant time

## Security Analysis

The survey categorizes attacks into:
- **Type-I**: External adversary replacing public keys
- **Type-II**: Malicious KGC using master key
- **Type-III**: Insider collusion (KGC + vehicle)
- **Replay, impersonation, modification attacks**

Key finding: Most surveyed schemes resist only Type-I and Type-II; Type-III resistance is rare.

## Performance

The survey compares computation and communication overhead across schemes, noting:
- Pairing-based schemes: higher security but higher computation
- Pairing-free ECC schemes: lower cost, suitable for VANETs
- Hyperelliptic curve schemes: smaller keys but less studied

## Strengths & Limitations

- Strengths: Comprehensive coverage, clear taxonomy, identifies research gaps
- Limitations: Covers literature up to 2022 only; does not include 2023–2026 advances

## Related Work

- [[cahyadi2022-clas-scheme|A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET]]
- [[lode2026|A Comprehensive Review of ECC-based Certificateless Aggregate Signature for VANETs and Cryptanalysis of Quantum-Secure CLAS]]
