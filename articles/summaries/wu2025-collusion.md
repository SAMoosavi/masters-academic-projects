---
title: "An Efficient Certificateless Aggregate Signature Scheme Resistant to Collusion Attacks for VANETs"
authors: "Wu W., Heng"
year: 2025
journal: "Computer Networks"
doi: "10.1016/j.comnet.2025.111637"
tags: [CLAS, VANET, collusion-resistance, Type-III, ECC, pairing-free, NS3, SUMO]
---

# An Efficient CLAS Resistant to Collusion Attacks for VANETs

## Overview

This paper proposes a security-enhanced CLAS scheme resistant to Type-III adversary attacks (insider collusion between KGC and vehicles). Existing schemes typically focus on Type I and II but fail against Type III. The scheme is based on ECC without bilinear pairing, and is proven EUF-CMA under ROM against Type I, II, and III adversaries.

Uniquely, the authors use MIRACL cryptography library for experiments and conduct joint NS3 (v3.27) + SUMO traffic generator simulations, providing realistic VANET performance data.

## Relevance to Our Work

This is the most comprehensive security evaluation — resisting all three adversary types with real simulation. Our scheme should compare directly. The NS3+SUMO simulation methodology is a gold standard for VANET evaluation.

## Key Contributions

- CLAS resisting Type I, II, AND III adversaries (rare achievement)
- MIRACL library experimental validation
- NS3 + SUMO joint simulation for realistic VANET performance
- Lower communication and computational overhead vs. related works

## Mathematical Notation

**ECC-based CLAS (collusion-resistant):**
- KGC: $s$, $P_{pub} = sP$
- User: $D_i = sH(ID_i)$, $x_i$, $PK_i = x_iP$
- Sign: Modified algorithm preventing collusion
- Aggregate: $\sigma = \sum \sigma_i$
- Verification: Pairing-free equation

**Type III resistance mechanism:**
- Additional binding between KGC-issued key and user's secret value
- Prevents KGC from colluding with user to forge signatures

## Protocol / Scheme

1. **Setup**: System parameters
2. **KeyGen**: Enhanced key generation preventing collusion
3. **Sign**: Signing with collusion resistance
4. **Aggregate**: Signature aggregation
5. **Verify**: Aggregate verification
6. **Simulate**: NS3 + SUMO realistic evaluation

## Security Analysis

- **Type I**: External adversary resistance ✓
- **Type II**: Malicious KGC resistance ✓
- **Type III**: Collusion resistance ✓
- EUF-CMA in ROM under ECDLP

## Performance

- MIRACL library experiments confirm efficiency
- NS3 + SUMO simulation: realistic VANET metrics
- Lower overhead than related works

## Strengths & Limitations

- Strengths: Triple adversary resistance, real simulation, comprehensive security, Computer Networks journal
- Limitations: ROM-based, no standard model proof

## Related Work

- [[tao2026|ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks]]
- [[wu2025-pseudonyms|A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs]]
- [[yue2025|A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs]]
- [[zheng2023|A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks]]
