---
title: "A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs"
authors: "Wu W., Ye"
year: 2025
journal: "IEEE Internet of Things Journal"
doi: "10.1109/JIOT.2024.3459033"
tags: [CLAS, VANET, pseudonyms, pairing-free, ECC, Type-III, forking-lemma, MIRACL]
---

# A Secure and Efficient CLAS Authentication Scheme With Pseudonyms for VANETs

## Overview

This paper proposes a secure and efficient CLAS scheme with pseudonyms for VANETs, based on ECC construction without bilinear pairing. The key innovation is introducing the generalized forking lemma to enhance the transparency of the security proof process. The scheme withstands attacks from Type-I, Type-II, and Type-III adversaries — a significant security advancement over most existing schemes.

Performance analysis demonstrates lower computational and communication overhead compared to the latest pairing-free CLAS schemes. MIRACL cryptography library simulations confirm practical efficiency in real VANET environments.

## Relevance to Our Work

This is a direct competitor and benchmark — Type-III resistance with lower overhead. Our scheme should compare directly against this one for both security (Type I+II+III) and efficiency metrics.

## Key Contributions

- Type-III adversary resistance (rare in CLAS literature)
- Generalized forking lemma for transparent security proofs
- MIRACL library simulation for practical validation
- Lower overhead than latest pairing-free schemes

## Mathematical Notation

**ECC-based CLAS with pseudonyms:**
- KGC: $s$, $P_{pub} = sP$
- Pseudonym: $PID_i = H(ID_i \| r_i)$ for temporary identity
- Partial key: $D_i = sH(PID_i)$
- Secret value $x_i$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$

**Forking lemma application:**
- Security proof uses generalized forking lemma
- Reduces forgery to solving ECDLP
- Transparent proof process

## Protocol / Scheme

1. **Setup**: System parameters
2. **PseudonymGen**: TA generates pseudonyms for vehicles
3. **KeyGen**: KGC issues partial keys, vehicles choose secret values
4. **Sign**: Vehicle signs with pseudonym-based key
5. **Aggregate**: RSU combines signatures
6. **Verify**: Aggregate verification

## Security Analysis

- **Type I**: External adversary resistance ✓
- **Type II**: Malicious KGC resistance ✓
- **Type III**: Insider collusion resistance ✓
- EUF-CMA in ROM under ECDLP
- Generalized forking lemma proof

## Performance

- Computation: Lower than latest pairing-free schemes
- Communication: Reduced overhead
- MIRACL simulation confirms practical results

## Strengths & Limitations

- Strengths: Type III resistance, transparent proof, MIRACL validation, IEEE IoT Journal
- Limitations: ROM-based, no standard model proof

## Related Work

- [[tao2026|ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks]]
- [[wu2025-collusion|An Efficient Certificateless Aggregate Signature Scheme Resistant to Collusion Attacks for VANETs]]
- [[zheng2023|A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks]]
- [[xu2023|A Security-Enhanced Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme for VANETs]]
