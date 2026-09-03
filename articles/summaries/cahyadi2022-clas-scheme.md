---
title: "A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET"
authors: "Cahyadi, Su, Yang, Hwang"
year: 2022
journal: "International Journal of Distributed Sensor Networks"
doi: "10.1177/15501329221080658"
tags: [CLAS, VANET, certificateless-signature, pairing-free, ECC, CDH, Type-I, Type-II]
---

# A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET

## Overview

This paper proposes a certificateless aggregate signature (CLAS) scheme tailored for VANET environments, addressing the challenge of authenticating large volumes of vehicle messages while minimizing verification overhead. The scheme prevents onboard unit (OBU) devices from leaking sensitive information during message transmission by applying CLAS methods to compress multiple signatures into a single aggregate.

The security of the proposed scheme is formally proven in the random oracle model (ROM) under the computational Diffie–Hellman (CDH) problem assumption, demonstrating resistance against both Type-I (external adversary) and Type-II (malicious KGC) adversaries. Performance evaluation confirms the scheme's suitability for resource-constrained VANET deployments where bandwidth, storage, and computation are limited.

## Relevance to Our Work

This is a foundational CLAS-for-VANET scheme that establishes baseline security requirements (Type I+II resistance) and performance metrics. Our work builds on and improves the efficiency and security guarantees of this scheme, particularly extending resistance to Type-III adversaries.

## Key Contributions

- First CLAS scheme in IJDSN specifically addressing VANET privacy through OBU-level protection
- Formal security proof under CDH assumption in ROM against Type I and II adversaries
- Performance evaluation demonstrating suitability for VANET constraints

## Mathematical Notation

Key generation:
- KGC generates master key $s \in \mathbb{Z}_q^*$ and master public key $P_{pub} = sP$
- Partial private key: $D_i = s \cdot H_1(ID_i)$ where $H_1: \{0,1\}^* \to G_1$
- Secret value: $x_i \in \mathbb{Z}_q^*$, public key: $PK_i = x_iP$
- Full private key: $SK_i = (D_i, x_i)$

Signature generation (on message $m_j$):
- Choose random $r_j \in \mathbb{Z}_q^*$
- Compute $R_j = r_jP$
- $h_j = H_2(m_j, ID_i, PK_i, R_j)$
- $S_j = r_j + h_j \cdot x_i \mod q$ (using secret value)

Aggregation:
$$\sigma = \sum_{j=1}^{n} S_j, \quad R = \sum_{j=1}^{n} R_j, \quad H = \prod_{j=1}^{n} h_j$$

Verification:
$$e(\sigma P, P) \stackrel{?}{=} e(R, P) \cdot e(H \cdot PK_i, P_{pub})$$

## Protocol / Scheme

1. **Setup**: KGC selects system parameters $(q, G_1, G_2, e, P, s, P_{pub})$ and hash functions
2. **Extract**: KGC computes partial private key $D_i = sH_1(ID_i)$ for user $i$
3. **SetKey**: User selects secret value $x_i$, computes public key $PK_i = x_iP$
4. **Sign**: For message $m_j$, signer picks $r_j$, computes $R_j = r_jP$, $h_j = H_2(m_j, ID, PK, R_j)$, $S_j = r_j + h_j x_i \mod q$
5. **Aggregate**: Aggregator computes $\sigma = \sum S_j$, $R = \sum R_j$
6. **Verify**: RSU checks pairing equation

## Security Analysis

- Resists Type-I adversary (external attacker without KGC secrets)
- Resists Type-II adversary (malicious KGC knowing master key)
- Proven in ROM under CDH assumption
- Conditional privacy via pseudonym mechanism

## Performance

- Computation: Pairing-based operations; aggregate verification reduces from $O(n)$ to $O(1)$ pairings
- Communication: Single aggregate signature regardless of number of signers
- Compared favorably with existing CLAS schemes in VANET scenarios

## Strengths & Limitations

- Strengths: Formal security proof, practical VANET model, conditional privacy
- Limitations: Relies on bilinear pairings (computationally expensive), does not resist Type-III adversaries

## Related Work

- [[cahyadi2022-survey|A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks]]
- [[zhang2014|Notes on the Security of Certificateless Aggregate Signature Schemes]]
