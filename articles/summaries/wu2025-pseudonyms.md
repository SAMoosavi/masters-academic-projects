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

This paper proposes a secure and efficient CLAS scheme with pseudonyms for VANETs, based on ECC construction without bilinear pairing. The key innovation is introducing the generalized forking lemma to enhance the transparency of the security proof process. The scheme withstands attacks from Type-I, Type-II, and Type-III adversaries — a significant security advancement over most existing schemes. Performance analysis demonstrates lower computational and communication overhead compared to the latest pairing-free CLAS schemes. MIRACL cryptography library simulations confirm practical efficiency in real VANET environments.

## Relevance to Our Work

This is a direct competitor and benchmark — Type-III resistance with lower overhead. Our scheme should compare directly against this one for both security (Type I+II+III) and efficiency metrics.

## Key Contributions

- Type-III adversary resistance (rare in CLAS literature)
- Generalized forking lemma for transparent security proofs
- MIRACL library simulation for practical validation
- Lower overhead than latest pairing-free schemes

## Mathematical Notation

### Setup

$$
\begin{aligned}
&s \in \mathbb{Z}_q^*,\quad P_{pub} = sP
\end{aligned}
$$

### Partial Private Key Extract

$$
\begin{aligned}
&D_i = sH(PID_i)
\end{aligned}
$$

### Set Secret Value

$$
\begin{aligned}
&x_i \in \mathbb{Z}_q^* \\
&PK_i = x_iP
\end{aligned}
$$

### Set Private/Public Key

$$
\begin{aligned}
&SK_i = (D_i, x_i) \\
&PK_i = x_iP
\end{aligned}
$$

### Signature

$$
\begin{aligned}
&PID_i = H(ID_i \| r_i) \\
&\sigma_i = r_i + h_i(x_i + D_i) \pmod q
\end{aligned}
$$

### Aggregate (CLAS)

$$
\begin{aligned}
&\sigma = \sum_{i=1}^n \sigma_i
\end{aligned}
$$

### Verification

$$
\begin{aligned}
&\text{Pairing-free equation}
\end{aligned}
$$

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
