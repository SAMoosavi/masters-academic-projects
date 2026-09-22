---
title: "ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments"
authors: "Cong Wang, Haoyu Wu, Yulong Gan, Rui Zhang, Maode Ma"
year: 2025
journal: "Entropy"
doi: "10.3390/e27050471"
scope: "NDN-IoT (not VANET)"
tags: [certificateless-signature, aggregate-signature, ECC, NDN, NDN-IoT, IoT, scope-NDN-IoT-not-VANET]
---

# ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments

## Overview

Scope: NDN-IoT (not VANET). This paper proposes ECAE, an efficient certificateless aggregate signature scheme based on elliptic curve cryptography (ECC) for Named Data Networking IoT (NDN-IoT) (p.1). The scheme eliminates bilinear pairing operations and map-to-point hash functions using ECC and general hash functions, keeping signature length constant via aggregation (p.1, p.4–p.5). Security is formally proven under the random oracle model based on the ECDLP hardness assumption (p.1, p.14–p.17).

## Relevance to Our Work

Scope note: NDN-IoT only — not a VANET scheme (p.1). Relevant to the article research domain as it demonstrates how certificateless cryptography can be extended to IoT applications (p.1, p.4–p.5). The ECC-based approach without bilinear pairings offers efficiency insights transferable to VANET CLAS design (transferability is our interpretation, not a claim of the paper).

## Key Contributions

- Proposes ECAE scheme eliminating bilinear pairings through ECC and universal hash functions (p.1, p.4–p.5).
- Partial private key distribution mechanism with pseudonym-based identity authentication (p.1, p.11–p.13).
- Constant-size aggregate signature regardless of number of devices (p.4–p.5, p.22–p.23).
- Formal security proofs under random oracle model (ECDLP assumption) (p.14–p.17).
- Total computation overhead reduced by up to 46.18% (p.1, p.20).
- Communication overhead reduced by 55.56% compared to state-of-the-art (p.1, p.22).

## Network Model

Four entities: Key Generation Center (KGC), NDN Routers, Consumers, Producers (p.5, Fig.1).

- **KGC**: Public parameter distribution authority and key management center; generates and publishes system parameters, issues partial private keys (p.5–p.6).
- **NDN Router**: Verifies data packet authenticity and integrity; aggregates digital signatures from multiple terminal devices (p.6).
- **Consumer**: Data requester, sends Interest packets (p.6).
- **Producer**: Data generator using sensor devices (p.6).

## Mathematical Notation

### Setup

$$
\begin{aligned}
&G: \text{cyclic group of prime order } q,\quad P \in G: \text{generator} \\
&s \in \mathbb{Z}_q^*:\text{master secret},\quad P_{pub}=sP \\
&H_1:\{0,1\}^*\times G\rightarrow\mathbb{Z}_q^* \\
&H_2:\{0,1\}^*\times G\times G\rightarrow\mathbb{Z}_q^* \\
&H_3:\{0,1\}^*\times G\times G\times G\times G\rightarrow\mathbb{Z}_q^* \\
&params=(q,G,P,P_{pub},H_1,H_2,H_3) % (p.10)
\end{aligned}
$$

*(p.10, Sec. 3.1).*

### Pseudonym Generation

$$
\begin{aligned}
&\text{KGC selects: } l_i \in \mathbb{Z}_q^* \\
&M_i = l_i P,\quad N_i = l_i P_{pub} \\
&AID_i = ID_i \oplus N_i \\
&\text{KGC verifies: } ID_i' = AID_i \oplus sM_i,\quad ID_i' \stackrel{?}{=} ID_i \\
&MID_i = H_1(T_i, sAID_i) \oplus ID_i' \\
&PID_i = \{MID_i, T_i\} % (p.11)
\end{aligned}
$$

*(p.11, Alg.1/Fig.3).*

### Key Generation

$$
\begin{aligned}
&\text{User: } x_i \in \mathbb{Z}_q^*,\quad X_i = x_i P \\
&\text{KGC: } r_i \in \mathbb{Z}_q^*,\quad R_i = r_i P \\
&h_{2i} = H_2(PID_i, R_i, P_{pub}) \\
&d_i = r_i + h_{2i}s \pmod q \\
&D_i = (d_i, R_i) \\
&\text{User verifies: } d_i P \stackrel{?}{=} R_i + h_{2i} P_{pub} \\
&K_i = h_{2i}X_i + R_i \\
&SK_i = d_i + h_{2i}x_i \\
&PK_i = (K_i, R_i) % (p.12-p.13)
\end{aligned}
$$

*(p.12–p.13, Alg.2/Fig.4).*

### Signature

$$
\begin{aligned}
&u_i \in \mathbb{Z}_q^*,\quad U_i = u_i P \\
&h_{3i} = H_3(m_i, PID_i, PK_i, U_i, t_i) \\
&V_i = u_i + h_{3i}SK_i \pmod q \\
&\sigma_i = (U_i, V_i) % (p.13)
\end{aligned}
$$

*(p.13, Alg.3).*

### Aggregate

$$
\begin{aligned}
&V = \sum_{i=1}^{n}V_i \\
&U = \sum_{i=1}^{n}U_i \\
&\sigma = (U, V) % (p.13-p.14)
\end{aligned}
$$

*(p.13–p.14, Alg.4).*

### Verification

**Single:** (p.13–p.14).

$$
\begin{aligned}
V_i P = U_i + h_{3i}K_i + h_{2i}P_{pub} % (p.13-p.14)
\end{aligned}
$$

**Aggregate:** (p.14).

$$
\begin{aligned}
VP = U + \sum_{i=1}^{n}\left(h_{3i}K_i + h_{2i}P_{pub}\right) % (p.14)
\end{aligned}
$$

## Protocol / Scheme

1. **System Initialization**: KGC generates master secret s, public key P_pub, and system params (p.10).
2. **Pseudonym Generation**: KGC generates pseudonym PID_i for each ED_i to prevent traffic analysis attacks; KGC stores {PID_i, M_i, AID_i} for traceability (p.11).
3. **Key Generation**: ED_i selects secret value x_i, KGC issues partial private key d_i; full private key SK_i = d_i + h_{2i}x_i, public key PK_i = (K_i, R_i) (p.12–p.13).
4. **Signature**: ED_i computes σ_i = (U_i, V_i) using random nonce u_i and private key SK_i (p.13).
5. **Aggregation**: NDN router compresses n signatures into σ = (U, V) where U = ΣU_i, V = ΣV_i (p.13–p.14).
6. **Verification**: V·P = U + Σ(h_{3i}K_i + h_{2i}P_{pub}) (p.14).

## Security Analysis

### Formal Security

- **Theorem 1**: Existentially unforgeable against Super Type-I adversary (external adversary who can replace public keys) under ECDLP in random oracle model (p.8–p.9, p.14–p.15).
- **Theorem 2**: Existentially unforgeable against Super Type-II adversary (malicious KGC with master key) under ECDLP in random oracle model (p.8–p.9, p.16–p.17).
- Both proofs use the Forking Lemma (p.15, p.16–p.17).

### Informal Security Properties

- **Anonymity**: True identity hidden behind pseudonym PID_i = {MID_i, T_i} (p.17).
- **Unlinkability**: Different pseudonyms used for each interaction, no connection between old and new (p.17).
- **Message Authentication**: Every message signed before sending, NDN router verifies signature (p.17).
- **Conditional Traceability**: KGC can trace real identity via ID_i = AID_i ⊕ sM_i (p.17).
- **Non-repudiation**: KGC can identify real identity through pseudonym of malicious device (p.17).
- **Resistance to Replay Attacks**: Random numbers and timestamps in all interactions (p.17–p.18).
- **Perfect Forward Secrecy**: Temporary random number u_i independent of private key, recovering u_i from U_i requires solving ECDLP (p.18).

## Performance

- Total computation overhead reduced by up to 46.18% compared to existing schemes (p.1, p.20).
- Communication overhead reduced by 55.56% (signature length: 2S_M = 640 bits) (p.1, p.22–p.23).
- Signature length remains constant regardless of number of terminal devices (p.4–p.5, p.22).
- Eliminates expensive bilinear pairing operations (pairing ≈ 20× cost of point multiplication) (p.4).
- Evaluated on Raspberry Pi 3B+ (BCM2837B0) and Intel J1900 with Curve25519 (λ=256) (p.18–p.19).

## Strengths & Limitations

- Strengths: Pairing-free design for IoT efficiency, constant-size aggregate signatures, formal security proofs under both Type I/II adversaries, pseudonym-based anonymity with KGC traceability, perfect forward secrecy (p.1, p.4–p.5, p.14–p.18).
- Limitations: Security proven in random oracle model only (paper notes ROM-to-standard-model transition would need stronger assumptions or heavier construction) (p.23); measured performance depends on aggregation window, hardware parallelism, topology and KGC distribution (per future-work discussion) (p.23); NDN-specific design, not evaluated for VANET (p.1).

## Provenance

- Mode: Full-text (single mode label for this report).
- Database + endpoint + params: Zotero local storage, key JJ8JTUPK, PDF file "Wang et al. - 2025 - ECAE An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT E.pdf".
- Access date: 2026-09-21.
- Bibliography verified against PDF citation block (p.1): Wang, C.; Wu, H.; Gan, Y.; Zhang, R.; Ma, M. ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments. Entropy 2025, 27, 471. https://doi.org/10.3390/e27050471.
- Pairing check: scheme is pairing-free (no invented e(...) notation; none present in summary, none needed — PDF states pairing-free and avoids bilinear pairings) (p.1, p.4–p.5).
