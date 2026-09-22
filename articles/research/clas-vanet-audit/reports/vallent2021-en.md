# Efficient Certificate-Less Aggregate Signature Scheme with Conditional Privacy-Preservation for VANETs Enhanced Smart Grid System

## Bibliographic
- Authors: Thokozani Felix Vallent, Damien Hanyurwimfura, Chomora Mikeka | Year: 2021 | Venue: Sensors, 21(9):2900 | DOI: 10.3390/s21092900 (p.1).
- Received 31 March 2021, accepted 9 April 2021, published 21 April 2021; correspondence to Chomora Mikeka, Department of Physics, Chancellor College, University of Malawi (p.1).

## Problem
- VANET traffic messages are broadcast in an open wireless environment, leaving the system inherently vulnerable to modification, impersonation and replay attacks, so sender authentication and message integrity are required (pp.1-2).
- Onboard units rebroadcast traffic messages every 100–300 ms with limited computation and storage, so authentication must rely on light cryptographic operations to keep latency low (p.2).
- VANET-enhanced smart-grid charging and dispatch decisions need real-time pricing and low communication latency, requiring authentication and aggregation that are both precise and efficient (p.1).
- Identity-based designs suffer the KGC key-escrow problem, motivating a certificateless design where the vehicle holds its own secret in addition to the KGC-issued partial key (p.3).
- The design must give anonymity and unlinkability to honest vehicles while keeping pseudonyms traceable and revocable by the trusted authority, and it must avoid costly bilinear pairings and map-to-point hash operations (p.2) (p.3).

## Method
- Setup: the TA with KGC and TRA outputs large primes $p, q$, curve $E: y^2 = x^3 + ax + b \pmod p$, group $G = \langle P \rangle$ of order $q$, master secrets $\alpha, \beta$ with $P_{pub} = \alpha P$ and $T_{pub} = \beta P$, hashes $H_1: G \to \mathbb{Z}_q^*$ and $H_2, H_3: \{0,1\}^* \to \mathbb{Z}_q^*$, publishing $params = \{P, p, q, E, G, H_1, H_2, H_3, P_{pub}, T_{pub}\}$ preloaded in TPD and RSU; the construction is ECC-only with no pairings or map-to-point hashes (pp.6-7) (p.3) (p.15) (p.18).
- Pseudonym and partial-key issuance run over secure channels: the vehicle sends $(RID_i, PID_1)$ with $PID_1 = k_i P$ for random $k_i$, the TRA returns $PID_2 = RID_i \oplus H_1(\beta \cdot PID_1 \parallel T_i \parallel T_{pub})$ with pseudonym $ID_i = (PID_1 \parallel PID_2 \parallel T_i)$ carrying validity period $T_i$, and the KGC picks $d_i$, sets $Q_{IDi} = d_i P$ and issues $psk_i = d_i + H_2(ID_i \parallel Q_{IDi}) \cdot \alpha \pmod p$, verifiable by $psk_i \cdot P = Q_{IDi} + H_2(ID_i \parallel Q_{IDi}) \cdot P_{pub}$ and stored in the tamper-proof device (p.7).
- Vehicle-Key-Generation: the vehicle picks a secret $x_i$ as $vsk_i = x_i$, publishes $vpk_i = x_i P$ and forms the full private key $sk_i = x_i + psk_i$ (pp.7-8).
- Sign: the vehicle takes a stored $ID_i$ and fresh timestamp $t_i$, draws $r_i$ with $R_i = r_i P$, computes $h_i = H_3(M_i \parallel ID_i \parallel Q_{IDi} \parallel vpk_i \parallel R_i \parallel t_i)$ as eq.1, $S_i = h_i \cdot r_i + sk_i \pmod p$ as eq.2 and $\sigma_i = (R_i, S_i)$ as eq.3, transmitting $ID_i, Q_{IDi}, vpk_i, M_i, t_i, \sigma_i$ (p.7) (p.8).
- Individual-Verify: the RSU checks validity periods $T_i$ and timestamp $t_i$, recomputes $h_{i,0} = H_2(ID_i \parallel Q_{IDi})$ as eq.4 and $h_i$ as eq.5, then checks $S_i \cdot P = h_i \cdot R_i + vpk_i + Q_{IDi} + h_{i,0} \cdot P_{pub}$ as eq.6 (p.8).
- Aggregate: the RSU collects $n$ pairs and outputs the concatenated $\sigma = (R_1, S_1), \ldots, (R_n, S_n)$ with $S = \sum S_i$ as eq.7, a concatenation of pairs rather than a constant-size aggregate (pp.8-9).
- Aggregate-Verify: the RSU recomputes $h_{i,0}$ as eq.8 and $h_i$ as eq.9 for all $i$, then checks $S \cdot P = \sum h_i \cdot R_i + \sum vpk_i + \sum Q_{IDi} + \sum h_{i,0} \cdot P_{pub}$ as eq.10 (p.9).
- Caveat: the aggregate-phase hash eq.9 is printed as $h_i = H_3(M_i \parallel ID_i \parallel vpk_i \parallel R_i \parallel t_i)$, dropping the $Q_{IDi}$ input present in signing and individual verification eq.1 and eq.5, an as-printed inconsistency in the source rather than a transcription change (p.9) (p.8).

## Key findings
- Theorem 1 states the scheme secure against Type-1 adversary in the random oracle model under ECDL intractability in $G$, with Create, Sign and Hash queries $q_c, q_s, q_h$ (p.10).
- Theorem 2 states the scheme secure against Type-2 malicious-KGC adversary in the random oracle model under ECDL intractability in $G$ (p.11).
- Privacy analysis claims anonymity with $ID_i$ hiding $RID_i$ recoverable only with TRA secret $\beta$, traceability with a revocation list, unlinkability from fresh $k_i$ randomness, replay resilience by $t_i$ freshness, and escrow resistance since $sk_i = x_i + d_i + H_2(ID_i \parallel Q_{IDi}) \cdot \alpha$ includes the vehicle secret $x_i$ (pp.12-13).
- Signing costs $2T_{e.m} + T_h \approx 0.8841$ ms and individual verification costs the same, while aggregate verification costs $2nT_{e.m} + nT_h \approx 0.8841n$ ms, using no pairings or map-to-point hashes (pp.15-16).
- Combined sign plus individual-verify load is $1.7682$ ms, reported as the best among the six compared schemes (pp.15-16).
- Communication overhead is $184$ bytes per sent message, with $ID_i, Q_{IDi}, vpk_i, R_i$ in $G$ at $40$ B each plus $S_i$ at $20$ B plus $4$ B timestamp, lower than the Horng and Malhi designs and on par with the Cui, Xiong and Kamil designs (pp.17-18).
- Batch verification delay scales linearly with $n$, and the comparison at $n = 2000$ signatures favors ECLAS (pp.16-17).

## Limitations
- Pseudonym plus partial-key issuance runs over secure channels, unlike open-channel designs such as Iqbal2023 (p.7).
- The aggregate output is a concatenation of pairs rather than a constant-size aggregate (pp.8-9).
- The aggregate-phase hash eq.9 inconsistently drops $Q_{IDi}$ relative to eq.1 and eq.5 (p.9) (p.8).
- Evaluation is analytic using execution times borrowed from prior MIRACL measurements, not a deployment measurement (p.15).
- The Cui design has slightly lower signing cost but was found to have security flaws, while ECLAS satisfies the stated requirements and withstands KGC escrow (pp.15-16).

## Related Work
- This audit pairs the present ECC-only scheme with its pairing-based counterpart [[cahyadi2022-clas-scheme]]; Vallent and coauthors review prior CLAS lines, including pairing-based proposals, in their related-works discussion (pp.3-4).
- Tables 2, 4 and 5 position ECLAS against Alazzawi, Bayat, Malhi, Horng, Cui, Xiong, Tzeng and Kamil designs on security features, computation cost and communication overhead (pp.13-18).

## Provenance
- Database + endpoint: local PDF text dump at research/clas-vanet-audit/sources/vallent2021.txt plus publisher record at https://www.mdpi.com/1424-8220/21/9/2900.
- Zotero storage key: AI8HZABG; ground-truth summary summaries/vallent2021.md, with equations copied from that summary with locators intact and no new math.
- Bib verification: Vallent, Hanyurwimfura, Mikeka, Sensors 21(9):2900, DOI 10.3390/s21092900, confirmed against the PDF header and citation block.
- Access date: 2026-09-22, with dump created 2026-09-21.
- Mode: Full-text.
