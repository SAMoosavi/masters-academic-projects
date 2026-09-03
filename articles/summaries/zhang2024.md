---
title: "Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT"
authors: "Zhang J., Dong, Liu"
year: 2024
journal: "IEEE Internet of Things Journal"
doi: "10.1109/JIOT.2023.3298840"
tags: [CLSC, IoMT, pairing-free, ECC, zero-knowledge, confidentiality, unforgeability]
---

# Efficient Pairing-Free Certificateless Signcryption for IoMT

## Overview

This paper proposes an efficient pairing-free certificateless signcryption (CLSC) scheme for secure data transmission in the Internet of Medical Things (IoMT). Based on zero-knowledge proof principles, the scheme provides confidentiality and unforgeability under Type I and Type II attacks while achieving lower computational and communication overhead with public verifiability.

While focused on IoMT rather than VANETs, the certificateless signcryption techniques are transferable to VANET contexts where both encryption and authentication are needed.

## Relevance to Our Work

Demonstrates CLSC techniques applicable to resource-constrained environments. The zero-knowledge proof approach for signcryption is relevant for VANET privacy. Performance benchmarks provide comparison targets.

## Key Contributions

- Pairing-free CLSC using zero-knowledge proof
- Confidentiality + unforgeability under Type I and II attacks
- Lower overhead than five recent CLSC schemes
- Public verifiability

## Mathematical Notation

**Zero-knowledge CLSC:**
- Signcrypt: $\sigma = (c, S)$ where $c$ is ciphertext and $S$ is signature
- Uses ECC scalar multiplication only
- No bilinear pairings
- Public verification of signature component

## Protocol / Scheme

1. **Setup**: System parameters
2. **KeyGen**: User key generation
3. **Signcrypt**: Combined encryption + signature
4. **Unsigncrypt + Verify**: Joint decryption and verification
5. **Public verify**: Third-party verification without decryption

## Security Analysis

- Confidentiality under chosen ciphertext attack
- Unforgeability under chosen message attack
- Type I and Type II resistance
- Public verifiability

## Performance

- Outperforms five recent CLSC schemes
- Lower computation and communication costs
- Pairing-free construction

## Strengths & Limitations

- Strengths: Zero-knowledge approach, public verifiability, IEEE IoT Journal
- Limitations: IoMT not VANET, signcryption not pure aggregate signature

## Related Work

- [[dai2022|Pairing-Free Certificateless Aggregate Signcryption Scheme for Vehicular Sensor Networks]]
- [[wu2025-signcryption|A Security-Enhanced Certificateless Aggregate Signcryption Scheme for Vehicular Ad Hoc Networks]]
