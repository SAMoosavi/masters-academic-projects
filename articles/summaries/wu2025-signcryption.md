---
title: "A Security-Enhanced Certificateless Aggregate Signcryption Scheme for Vehicular Ad Hoc Networks"
authors: "Wanqing Wu, Junjie Chen"
year: 2025
journal: "Vehicular Communications"
doi: "10.1016/j.vehcom.2025.100897"
tags: [CLAS, signcryption, VANET, key-replacement-attack, ECC, confidentiality, unforgeability]
---

# A security-enhanced certificateless aggregate signcryption scheme for vehicular ad hoc networks

## Bibliographic

- Authors: Wanqing Wu, Junjie Chen (School of Cyber Security and Computer, Hebei University; Key Lab of High Trusted Information System in Hebei Province) | Year: 2025 | Venue: Vehicular Communications 53 (2025) 100897, Elsevier | DOI: https://doi.org/10.1016/j.vehcom.2025.100897 | Citations: not stated in source (p.1)

## Problem

VANETs are high-speed mobile wireless networks for intelligent transportation whose vehicles must periodically broadcast traffic messages at 100–300 ms intervals with confidentiality, anonymity, traceability and revocation (p.1, §1).
Pairing-free CLASC is promoted to reduce computational and communication overheads while enhancing security, yet most pairing-free schemes are practically insecure (p.1, Abstract; p.3, §2).
Dai et al.’s 2023 pairing-free CLASC for vehicular sensor networks is listed with confidentiality ✓ but unforgeability ✗, anonymity ✓ and revocation ✗ (p.2, Table 1).
The paper therefore tests Dai et al. against public-key-replacement adversaries and seeks a VANET-suitable enhanced scheme (p.1, Abstract; p.5, §4.2).

## Method

Dai et al.’s scheme is briefly reviewed and then subjected to explicit Type-I (A1) public-key-replacement forgeries on single messages (§4.2) and aggregates (§4.3) (p.4, §4.1; p.5, §4.2–4.3).
The single-message attack replaces PK with K′ = −h_ID·P_pub, picks random n′, forms N′ = n′P, Q′ = n′(K_AS + h_AS·P_pub), c′ = m′ ⊕ H2(·) and w′ = n′ to forge σ′ = (N′, c′, w′) accepted by the unsigncrypt check, and the aggregate variant sums W′ = Σw′ accepted by the aggregate check (p.5, §4.2–4.3).
A new ECC-based pairing-free CLASC is then built from System-Setup, Pseudonym-Generation, Partial-Private-Key-Extract, Set-Secret-Value, Set-Public/Private-Key, Signcrypt, Unsigncrypt, Aggregate, Aggregate-Unsigncrypt and Revocation-Key-Extract among KGC, TRA, RSU, AS and vehicles (p.5–6, §5.1–5.2).
Signcrypt/verify use only scalar multiplication, point addition and hashes with U_i = u_iP, Q_i = (u_i + r)(X_AS + Y_AS + h_AS·P_pub) where r = g(s_i), z_i = m_i ⊕ H3(·), w_i = u_i + x_i·h_i2 + d_i·h_i3 with h_i2 = H4(·) and h_i3 = H5(·), verified by w_iP = U_i + X_i·h_i2 + (Y_i + P_pub·h_IDi)h_i3 and aggregate WP = ΣU + Σ(Xh2 + Yh3) + P_pubΣh_IDh3, with no bilinear pairing operator in the construction (p.6, §5.2; p.7, §6.1).
IND-CCA2 confidentiality and EUF-CMA unforgeability games are formalized for Type-I/II adversaries with hash, key, signcrypt and unsigncrypt oracles plus challenge/forgery phases (p.4, Table 3).
Confidentiality is reduced to CDH and unforgeability to ECDL in the random oracle model, extracting τ = (w∗ − w∗′)/(h2 − h2′) for instance (P, τP) via the forking lemma (p.7–9, §6.1–6.2).
Computation is compared by operation counts with measured unit times and communication by byte sizes against schemes [20,26–28] with overhead figures (p.9–10, §7).

## Key findings

- Dai et al. is breakable: “vulnerability to public key…” (p.1), shown by an A1 forgery whose replaced-key single σ′ satisfies w′P = N′ + h′3(K′ + h_ID·P_pub) and aggregate σ′ = ({N′, c′}, W′) satisfies W′P = ΣN + Σh3(K′ + h_ID·P_pub) and is accepted by the AS (p.5, §4.2–4.3).
- The proposed scheme is IND-CCA2 confidential under the CDH assumption in the random oracle model (p.7–8, §6.1).
- The proposed scheme is EUF-CMA unforgeable under the ECDL assumption in the random oracle model via the forking lemma (p.8–9, §6.2).
- It claims confidentiality, unforgeability, anonymity via pseudonym ID = (αP, RID ⊕ H2(·)), plus traceability and revocation, unlike Dai et al. which lacks unforgeability and revocation (p.2, Table 1; p.9, §6.3; p.6, §5).
- Computation total is (5n+3)Tm + (5n+2)Ta with Tm = 0.5929 ms and Ta = 0.0052 ms, below pairing baselines using Tpsm = 1.9296 ms, Tbp = 4.5956 ms and Tmtp = 4.9050 ms (p.8, Table 4; p.9, Table 6).
- Communication is 92 bytes single (|G| + |Zq∗| + |m|) and n|G| + |Zq∗| + n|m| aggregate, versus 144 bytes [28], 140 bytes [20], 276 bytes [26] and 296 bytes [27] (p.9, Table 7).

## Limitations

The authors state future work should explore why insecure schemes can “still provide security proof…” (p.10) under the current security model (p.10, §8).
The confidentiality and unforgeability proofs hold only in the random oracle model assuming ECDLP and CDHP hardness (p.9, §6.3).
Performance evidence is analytic operation counts, timings and byte sizes rather than live VANET/DSRC deployment measurements (p.9–10, §7).
Interpretation: revocation and traceability are established by construction rather than by measured revocation cost or adversarial testing beyond the A1/A2 games (p.6, §5; p.9, §6.3).

## Tables / Figures

- Table 1: related pairing-based vs pairing-free CLASC/CLSC schemes with confidentiality/unforgeability/anonymity/revocation marks (p.2).
- Table 2: notation for params, group, keys, hashes, identities, messages, timestamps and ciphertexts (p.3).
- Table 3: IND-CCA2 and EUF-CMA game phases for Game I/II adversaries (p.4).
- Fig. 1: VANET system model; Fig. 2: the proposed CLASC scheme flow (p.3; p.5).
- Table 4: unit runtimes for pairing vs ECC operations; Figs. 3–5: aggregate-unsigncrypt, total-computation and communication comparisons (p.8–9).
- Tables 5–7: curve/point-size params and computation/communication cost formulas with byte totals (p.10).

## Why it matters here

Bibliography is verified as Vehicular Communications 53 (2025) 100897 with DOI 10.1016/j.vehcom.2025.100897, authors Wanqing Wu and Junjie Chen of Hebei University, and Dai et al. [12] as IEEE Internet Things J. 10(6) (2023) 5063–5072 (p.1; p.11, Ref. [12]).
Pairing-free status is verified because the proposed Signcrypt/Aggregate/Unsigncrypt equations use only ECC scalar multiplication and addition, with no pairing operator, while pairings appear only for baseline costings (p.6, §5.2; p.8–9, §7).
The Dai cryptanalysis claim is verified by the explicit A1 steps computing K′ = −h_ID·P_pub and forged single σ′ plus aggregate σ′ accepted under the respective checks (p.5, §4.2–4.3).
Interpretation: this makes the paper a directly usable [[key-replacement-attack]] precedent for our audit of pairing-free CLAS/VANET claims (p.5, §4.2).

## Provenance

- Database + endpoint + params: local Zotero store key BI625HQ9 via publisher PDF path; pdfinfo 11 pages; pdftotext -layout full dump to sources/wu2025-signcryption.txt (101725 chars).
- Access date: 2026-09-21.
- Mode: Full-text.
