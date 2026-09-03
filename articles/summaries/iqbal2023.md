---
title: "An Efficient and Secure Certificateless Aggregate Signature Scheme for Vehicular Ad Hoc Networks"
authors: "Iqbal, Zubair, Khan, Ullah, Ur-Rehman, Shvetsov, Noor"
year: 2023
journal: "Future Internet"
doi: "10.3390/fi15080266"
tags: [CLAS, VANET, hyperelliptic-curve, HECC, pairing-free, security]
---

# An Efficient and Secure CLAS Scheme Based on Hyperelliptic Curve Cryptography for VANETs

## Overview

This paper proposes a CLAS scheme based on hyperelliptic curve cryptography (HECC) for secure vehicle-to-RSU communication in VANETs. The key innovation is using HECC instead of standard ECC, which provides smaller key sizes while maintaining equivalent security levels. The scheme enables vehicles to share identities via open wireless channels without revealing them to unauthorized participants.

Security analysis through ROM proves unforgeability against Type-1 (FGR1) and Type-2 (FGR2) forgers under the hyperelliptic curve discrete logarithm problem (HCDLP). The scheme outperforms relevant existing schemes in both computational cost and communication overhead while maintaining high security.

## Relevance to Our Work

This paper introduces an alternative cryptographic foundation (HECC) for CLAS. While most schemes use ECC, HECC offers smaller keys. It's relevant for our comparison of different cryptographic approaches.

## Key Contributions

- First HECC-based CLAS scheme for VANETs
- Partial private key distribution via open channels with identity secrecy
- Proven unforgeable against Type 1 and Type 2 forgers
- More efficient than existing schemes in computation and communication

## Mathematical Notation

**HECC-based construction:**
- Curve: genus-$g$ hyperelliptic curve over $\mathbb{F}_q$
- Jacobian group $J_C(\mathbb{F}_q)$ of order $n$
- Generator $P$ of prime order $n$

**Key generation:**
- KGC: $s \in \mathbb{Z}_n^*$, $P_{pub} = [s]P$
- Partial key: $D_i = [s]H(ID_i)$
- Secret value $x_i$, public key $PK_i = [x_i]P$

**Signing:**
- Random $r_i \in \mathbb{Z}_n^*$
- $R_i = [r_i]P$
- $h_i = H(m_i \| ID_i \| R_i)$
- $\sigma_i = r_i + h_i(x_i + D_i) \mod n$

**Aggregation:**
$$\sigma = \sum_{i=1}^n \sigma_i \mod n$$

## Protocol / Scheme

1. **Setup**: HECC parameter generation
2. **Extract**: KGC issues partial private key
3. **KeyGen**: Vehicle generates secret value and public key
4. **Sign**: Sign message using HECC operations
5. **Aggregate**: Sum individual signatures
6. **Verify**: Check against aggregated value

## Security Analysis

- Unforgeable against FGR1 (external adversary) and FGR2 (malicious KGC)
- Based on HCDLP hardness
- ROM security proof

## Performance

- Smaller key sizes than ECC-based schemes (HECC advantage)
- Lower computation and communication overhead than comparable schemes

## Strengths & Limitations

- Strengths: Novel HECC approach, smaller keys, strong security guarantees
- Limitations: HECC less widely deployed than ECC, limited practical adoption

## Related Work

- [[cahyadi2022-clas-scheme|A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET]]
- [[wei2025|A New Efficient and Provably Secure Certificateless Signature Scheme Without Bilinear Pairings for the Internet of Things]]
