---
title: "A Security-Enhanced Certificateless Aggregate Signcryption Scheme for Vehicular Ad Hoc Networks"
authors: "Wu W., Chen"
year: 2025
journal: "Vehicular Communications"
doi: "10.1016/j.vehcom.2025.100897"
tags: [CLAS, signcryption, VANET, key-replacement-attack, ECC, confidentiality, unforgeability]
---

# A Security-Enhanced Certificateless Aggregate Signcryption for VANETs

## Overview

This paper conducts a security analysis of Dai et al.'s pairing-free CLASC scheme, revealing its vulnerability to public key replacement attacks. The authors then propose a security-enhanced certificateless aggregate signcryption (CLASC) scheme that provides both confidentiality and unforgeability against adaptive chosen ciphertext/message attacks in ROM. The enhanced scheme satisfies all security attributes required for VANETs while demonstrating superior computational and communication efficiency compared to related signcryption schemes.

## Relevance to Our Work

This paper fixes a vulnerability in Dai et al. (2022) — showing that even published CLAS/signcryption schemes can have critical flaws. The signcryption approach is relevant for VANET scenarios requiring both encryption and authentication.

## Key Contributions

- Security analysis exposing public key replacement attack on Dai et al.'s CLASC
- Security-enhanced CLASC scheme
- Confidentiality + unforgeability under adaptive chosen ciphertext/message attack
- Superior efficiency vs. related schemes

## Mathematical Notation

### Setup

$$
\begin{aligned}
&\text{Adversary replaces public key: } PK_i' = PK_i + \Delta \\
&\text{Algebraic manipulation allows signature forgery during unsigncrypt}
\end{aligned}
$$

### Signature

$$
\begin{aligned}
&\text{Signcrypt: Encrypt and sign simultaneously using ECC}
\end{aligned}
$$

### Aggregate (CLAS)

$$
\begin{aligned}
&\sigma_{agg} = \sum_{i=1}^n \sigma_i
\end{aligned}
$$

### Verification

$$
\begin{aligned}
&\text{Unsigncrypt + verify: Combined decryption and verification}
\end{aligned}
$$

## Protocol / Scheme

1. **Attack analysis**: Public key replacement on Dai et al.
2. **Enhanced signcrypt**: Combined encryption + signature with ECC
3. **Aggregate**: Multiple signcryptions combined
4. **Unsigncrypt + verify**: Joint decryption and verification

## Security Analysis

- Confidentiality under adaptive chosen ciphertext attack
- Unforgeability under adaptive chosen message attack
- Resists public key replacement attacks
- ROM-based proof

## Performance

- Superior computational efficiency vs. related schemes
- Lower communication overhead
- Pairing-free ECC construction

## Strengths & Limitations

- Strengths: Fixes real vulnerability, comprehensive security, efficiency gains
- Limitations: ROM-based, signcryption not pure aggregate signature

## Related Work

- [[dai2022|Pairing-Free Certificateless Aggregate Signcryption Scheme for Vehicular Sensor Networks]]
