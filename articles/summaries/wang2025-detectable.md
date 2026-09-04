---
title: "A privacy-preserving certificate-less aggregate signature scheme with detectable invalid signatures for VANETs"
authors: "Xiaoliang Wang, Peng Zeng, Guikai Liu, Kuan-Ching Li, Biao Hu, Francesco Palmieri, Yuzhen Liu"
year: 2025
journal: "Journal of Information Security and Applications"
doi: "10.1016/j.jisa.2025.104001"
tags: [certificateless-signature, aggregate-signature, detectable-invalid, V2V, VANET]
---

# A Privacy-Preserving Certificate-Less Aggregate Signature Scheme with Detectable Invalid Signatures for VANETs

## Overview

This paper proposes an efficient CLAS scheme for VANETs that provides detectable invalid signatures. When aggregate verification fails, the scheme can efficiently identify which individual signatures are invalid and trace them to real identities. Security is proven under the CDH assumption in the random oracle model as EUF-ACMAs.

## Relevance to Our Work

Introduces a novel approach to aggregate signature verification particularly relevant to the article VANET application. The detectable invalid property allows vehicles to identify and exclude invalid signatures during verification, improving overall system reliability.

## Key Contributions

- Proposes CLAS scheme with detectable invalid signature property
- Maintains EUF-ACMAs security under certificateless setting
- Supports conditional anonymity through pseudonym-based signing
- Efficient algorithm to detect invalid signatures with real identity tracing
- Performance advantage in computation overhead over existing schemes

## Mathematical Notation

### Setup

$$
\begin{aligned}
&G: \text{Additive cyclic group of prime order } q \\
&P: \text{Generator of } G \\
&H_1, H_2, H_3, H_4: \text{Cryptographic hash functions} \\
&s: \text{KGC master secret},\quad P_{pub} = sP
\end{aligned}
$$

### Partial Private Key Extract

$$
\begin{aligned}
&d_i = sH_1(ID_i)
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
&PID_i = H_2(ID_i, T_{start}, T_{end}) \\
&V_i = x_i H_1(PID_i) \\
&S_i = d_i H_1(PID_i) + x_i h_i + r_i \\
&\alpha_i = H_4(PID_i, S_i, M_i)
\end{aligned}
$$

### Aggregate (CLAS)

$$
\begin{aligned}
&S = \sum_{i=1}^n S_i,\quad \alpha_{agg} = \prod_{i=1}^n \alpha_i
\end{aligned}
$$

### Verification

$$
\begin{aligned}
&\text{Detectable verify: recompute } \alpha_i' = H_4(PID_i, S_i, M_i) \text{ and check } \alpha_i = \alpha_i'
\end{aligned}
$$

## Protocol / Scheme

1. **Setup**: System parameters and master key generation
2. **KeyGeneration**: KGC issues partial private key, user generates secret value
3. **PseudonymGeneration**: TRA generates pseudonyms for vehicles
4. **Sign**: Vehicle signs message using pseudonym-based key
5. **Aggregate**: Combine multiple signatures
6. **Detectable Verify**: Verify aggregate and identify invalid signatures
7. **Trace**: TRA reveals real identity from pseudonym when needed

## Security Analysis

- Proven secure under EUF-ACMAs in the certificateless setting under CDH assumption in ROM
- Provides unforgeability against adaptive chosen message attacks
- Conditional anonymity with TRA traceability
- Detectable invalid property without compromising security
- Resistance to Type I and Type II adversary attacks

## Performance

- Efficient detectable verification with minimal overhead
- Scalable pseudonym management through TRA
- Practical for VANET deployment with real-time requirements
- Reduced verification complexity through invalid signature detection

## Strengths & Limitations

- Strengths: Novel detectable invalid property improves system reliability, conditional anonymity with accountability through TRA, formal security proofs under standard certificateless model, practical for VANET with real-time verification needs
- Limitations: TRA introduces a trusted third party dependency, pseudonym management adds complexity, detectable component may increase signature size, real-world TRA implementation challenges in VANET

## Related Work

- [[cahyadi2022-clas-scheme|A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET]]
- [[tao2026|ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks]]
