# ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments — Scope: NDN-IoT (not VANET)

## Bibliographic
- Authors: Cong Wang, Haoyu Wu, Yulong Gan, Rui Zhang, Maode Ma (p.1)
- Year: 2025 (p.1)
- Venue: Entropy 27:471 (p.1)
- DOI: 10.3390/e27050471 (p.1)
- URL: https://doi.org/10.3390/e27050471 (p.1)
- Scope: NDN-IoT (not VANET) (p.1)

## Problem
- Scope: NDN-IoT (not VANET): the paper addresses signature authentication for Named Data Networking IoT, where name-based routing meets distributed IoT terminals (p.1).
- Resource-constrained IoT terminals struggle with certificate issuance, storage and revocation plus computationally intensive pairing operations under traditional PKI (p.1).
- NDN routers must support low-latency batch verification of concurrent producer responses during high-speed forwarding, while conventional per-packet verification scales linearly (p.1, p.4–p.5).
- Prior NDN-IoT solutions suffer pairing costs of about 20 times point multiplication, map-to-point hash overhead, linear aggregate growth, centralized trust with single points of failure, and weak anonymity, motivating a pairing-free lightweight framework (p.2–p.4, p.4).

## Method
- The scheme eliminates pairings via ECC plus general hash functions, with no bilinear pairings and no map-to-point hashes, keeping the aggregate length constant (p.1, p.4–p.5).
- The network model uses 4 entities: KGC as parameter and partial-key authority, NDN Router for authenticity check and aggregation, Consumer sending Interest packets, and Producer generating sensor data (p.5–p.6).
- System setup publishes params with master secret s and P_pub, then KGC issues pseudonyms PID_i for traceability and partial private keys d_i combined with user secrets into full keys SK_i and PK_i (p.10, p.11, p.12–p.13).
- Each device signs as sigma_i equal to pair U_i and V_i, routers aggregate into constant-size sigma equal to pair U and V with sums, and verification checks V times P against U plus weighted public terms (p.13–p.14, p.4–p.5).
- Formal security defines Super Type-I external adversary with key replacement and Super Type-II malicious KGC, proven unforgeable under ECDLP in the random oracle model via Theorems 1 and 2 using the Forking Lemma (p.8–p.9, p.14–p.17).
- Informal properties claimed are anonymity via PID_i, unlinkability across pseudonyms, message authentication at routers, conditional traceability and non-repudiation via KGC, replay resistance via nonces and timestamps, and perfect forward secrecy via independent u_i (p.17–p.18).
- Performance was measured on Raspberry Pi 3B+ with BCM2837B0 and Intel J1900 using Curve25519 with security parameter 256 (p.18–p.19).

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
&\text{KGC verifies: } ID_i' = AID_i \oplus sM_i,\quad ID_i' \stackrel{?}{=} ID_i \\ % (p.11)
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
Single form with locator (p.13–p.14):

$$
\begin{aligned}
V_i P = U_i + h_{3i}K_i + h_{2i}P_{pub} % (p.13-p.14)
\end{aligned}
$$

Aggregate form with locator (p.14):

$$
\begin{aligned}
VP = U + \sum_{i=1}^{n}\left(h_{3i}K_i + h_{2i}P_{pub}\right) % (p.14)
\end{aligned}
$$

## Key findings
- Total computation overhead is "reduced by up to 46.18% …" against state-of-the-art comparators (p.1, p.20).
- Communication overhead is reduced by 55.56% with signature length 2S_M equal to 640 bits (p.1, p.22–p.23).
- Aggregate signature sigma equal to pair U and V stays constant-size regardless of the number of terminal devices (p.4–p.5, p.13–p.14).
- Security is reduced to ECDLP in the random oracle model with Theorem 1 for Super Type-I and Theorem 2 for Super Type-II adversaries, both via the Forking Lemma (p.8–p.9, p.14–p.17).
- Four-entity model with KGC, NDN Router, Consumer and Producer assigns issuance to KGC and batch aggregation to routers (p.5–p.6).
- Evaluation on Raspberry Pi 3B+ plus Intel J1900 with Curve25519 under 256-bit parameter confirms lightweight behavior claimed for IoT terminals (p.18–p.19).
- Pairing-free construction removes bilinear pairings at about 20 times point-multiplication cost and map-to-point hashes in favor of general hashes (p.4).

## Limitations
- Security proofs hold in the random oracle model only, and the paper notes a move to the standard model would need stronger assumptions or heavier construction (p.23).
- Measured gains depend on aggregation window, hardware parallelism, topology and KGC distribution per the future-work discussion, so figures are conditional rather than universal (p.23).
- The design is NDN-IoT specific and was not evaluated for VANET mobility, beacon rates or roadside-unit constraints (p.1).
- Pseudonym traceability and revocation rely on an honest KGC holding master secret and stored triples, leaving KGC compromise and cross-domain trust unresolved (p.5–p.6, p.11, p.17).

## Related Work
- Edge-computing authentication offloads work to edge nodes, with NIoTE aggregation and caching but pairing-heavy group signatures and a centralized gateway single point of failure, for corpus contrast see [[cahyadi2022-survey]] (pp.2–3).
- Blockchain-based NDN authentication stores hashed keys or policies on chain, improving auditability but adding retrieval delay and pairing overhead unsuitable for large scale, for corpus contrast see [[gong2023]] (pp.2–3).
- Certificateless signatures remove certificates yet prior pairing-based variants keep the pairing bottleneck, while some ECDLP variants stay too complex for constrained devices and hardware-only speedups lack algorithm-level attack resistance, for corpus contrast see [[shim2023]] (pp.3–4).
- Batch and aggregate authentication reduces per-packet checks, but identity-based escrow, centralized authorities and fragile security-efficiency trade-offs remain open, for corpus contrast see [[wang2025-detectable]] (pp.3–4).

## Provenance
- Database + endpoint + params: MDPI Entropy via DOI 10.3390/e27050471, PDF text dump at research/clas-vanet-audit/sources/wang2025-ecae.txt cross-checked against audited ground-truth summary at summaries/wang2025-ecae.md.
- Access date: 2026-09-21 / 2026-09-22.
- Expected vs retrieved: expected full text of Wang et al. Entropy 27:471 with 25 pages, retrieved matching citation block and full sections from abstract through performance evaluation.
- Warnings: scope is NDN-IoT only and must not be cited as a VANET result; all numbers and equations reuse audited summary locators with no new notation; construction is pairing-free so no bilinear notation is used.
- Mode: Full-text
