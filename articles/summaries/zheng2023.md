---
title: "A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks"
authors: "Zheng, Luo, Zhang, Peng, Feng"
year: 2023
journal: "IEEE Systems Journal"
doi: "10.1109/JSYST.2022.3220869"
tags: [CLAS, VANET, pairing-free, ECC, security-enhanced, provable-security]
---

# A Security-Enhanced Pairing-Free CLAS for VANETs

## Overview

This paper proposes an efficient, privacy-preserving, and pairing-free CLAS scheme with enhanced security for VANETs. The scheme addresses the main challenge of protecting data authenticity while enhancing computational efficiency in resource-constrained VANET environments. Security is proven in ROM against adaptive chosen message attacks. The performance evaluation demonstrates the scheme's appropriateness for VANET scenarios, with improved security over existing pairing-free constructions.

## Relevance to Our Work

This is the scheme that Yue et al. (2025) found vulnerable to rogue key attacks. It's an important reference for both its design and its vulnerability. Our scheme should address the rogue key attack it exposes.

## Key Contributions

- Efficient pairing-free CLAS with enhanced security
- Privacy-preserving construction
- Performance evaluation for VANET suitability
- Formal security proof in ROM

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
&D_i = sH(ID_i)
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
&r_i \in \mathbb{Z}_q^*,\quad U_i = r_i P \\
&h_{2i} = H_2(PID_i, X_i) \\
&h_{3i} = H_3(M_i, PID_i, X_i, U_i, T_i) \\
&s_i = r_i + h_{2i} \cdot x_i + h_{3i} \cdot d_i \pmod q \\
&\sigma_i = (U_i, s_i)
\end{aligned}
$$

### Aggregate (CLAS)

$$
\begin{aligned}
&s = \sum_{i=1}^n s_i
\end{aligned}
$$

### Verification

$$
\begin{aligned}
sP \stackrel{?}{=} \sum_{i=1}^n W_i + \sum_{i=1}^n X_i h_{3i} \quad \text{where } W_i = h_{2i} K_{pub}
\end{aligned}
$$

## Protocol / Scheme

1. **Setup**: System parameters
2. **KeyGen**: Vehicle key generation
3. **Sign**: Message signing
4. **Aggregate**: Signature aggregation
5. **Verify**: Pairing-free aggregate verification

## Security Analysis

- EUF-CMA in ROM under ECDLP
- Enhanced security over previous pairing-free schemes
- Privacy preservation via pseudonyms

## Performance

- Pairing-free: efficient computation
- Appropriate for VANET resource constraints
- Enhanced security without significant overhead increase

## Strengths & Limitations

- Strengths: Security-enhanced, pairing-free, IEEE Systems Journal
- Limitations: Vulnerable to rogue key attacks (shown by Yue 2025), ROM-based, Type III not addressed

## Related Work

- [[yue2025|A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs]]
- [[wu2025-pseudonyms|A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs]]
- [[wu2025-collusion|An Efficient Certificateless Aggregate Signature Scheme Resistant to Collusion Attacks for VANETs]]
