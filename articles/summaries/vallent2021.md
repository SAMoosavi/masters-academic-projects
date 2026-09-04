---
title: "Efficient Certificate-Less Aggregate Signature Scheme with Conditional Privacy-Preservation for VANETs Enhanced Smart Grid System"
authors: "Thokozani Felix Vallent, Damien Hanyurwimfura, Chomora Mikeka"
year: 2021
journal: "Sensors"
doi: "10.3390/s21092900"
tags: [certificateless-signature, aggregate-signature, ECC, IoT, smart-grid]
---

# Efficient Certificate-Less Aggregate Signature Scheme with Conditional Privacy-Preservation for VANETs Enhanced Smart Grid System

## Overview

This paper proposes an efficient certificateless aggregate signature (ECLAS) scheme for VANET and smart grid applications. The scheme uses Elliptic Curve Cryptography (ECC) for efficiency and incorporates time-validated pseudonyms to enhance privacy and security. It addresses the KGC escrow problem and provides formal security proofs.

## Relevance to Our Work

Relevant to the article as it demonstrates CLAS application in both VANET and smart grid contexts. The time-validated pseudonym approach offers an alternative privacy mechanism that the article may consider for comparison.

## Key Contributions

- Proposes ECLAS scheme based on ECC for resource-constrained environments
- Introduces time-validated pseudonym mechanism for privacy preservation
- Resolves KGC escrow problem through certificateless approach
- Demonstrates applicability to both VANET and smart grid scenarios

## Mathematical Notation

### Setup

$$
\begin{aligned}
&G: \text{Additive cyclic group on elliptic curve } E \text{ over } \mathbb{F}_p \\
&P: \text{Base point of } G \text{ with order } q \\
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
&PID_i = H(ID_i, T_{start}, T_{end}) \\
&V_i = x_i H(PID_i) \\
&S_i = d_i H(PID_i) + x_i h_i + r_i \\
&h_i = H(M_i, PID_i, R_i)
\end{aligned}
$$

### Aggregate (CLAS)

$$
\begin{aligned}
&\sigma = \sum_{i=1}^n S_i
\end{aligned}
$$

### Verification

$$
\begin{aligned}
e(\sigma P, P) \stackrel{?}{=} e\left(\sum R_i, P\right) \cdot e\left(\sum h_i(PK_i) + H_1(ID_i), P_{pub}\right)
\end{aligned}
$$

## Protocol / Scheme

1. **Setup**: System parameters and master key generation
2. **KeyGen**: KGC issues partial private key, user generates secret value
3. **PseudonymGen**: Generate time-validated pseudonyms for vehicles
4. **Sign**: Vehicle signs message with pseudonym-based key
5. **Aggregate**: Combine multiple signatures
6. **Verify**: Aggregate verification

## Security Analysis

- Proven secure under ECDHP assumption
- Resists Type I attacks (public key replacement)
- Resists Type II attacks (malicious KGC)
- Resists replay attacks (through timestamp validation)
- Resists tracking attacks (through pseudonym rotation)

## Performance

- ECC-based operations (smaller key sizes than RSA)
- Minimal pairing operations
- Efficient pseudonym generation and validation
- Suitable for resource-constrained IoT devices

## Strengths & Limitations

- Strengths: Dual applicability to VANET and smart grid scenarios, privacy enhancement through time-validated pseudonyms, ECC-based efficiency suitable for IoT deployment, formal security proofs under standard assumptions
- Limitations: Pseudonym management adds complexity, time synchronization requirement may be challenging, comparison with other schemes may not be comprehensive, smart grid integration details may need further elaboration

## Related Work

- [[cahyadi2022-clas-scheme|A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET]]
