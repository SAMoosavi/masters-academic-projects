---
title: A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET
authors: Cahyadi, Su, Yang, Hwang
year: 2022
journal: International Journal of Distributed Sensor Networks
doi: 10.1177/15501329221080658
tags:
  - CLAS
  - VANET
  - certificateless-signature
  - bilinear-pairing
  - CDH
  - Type-I
  - Type-II
---
# A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET

## Bib verification

- Journal is International Journal of Distributed Sensor Networks, 2022, Vol. 18(5), DOI 10.1177/15501329221080658 (p.1).
- Authors are Eko Fajar Cahyadi, Tzu-Wei Su, Chou-Chen Yang and Min-Shiang Hwang (p.1).
- Received 30 August 2021, accepted 6 January 2022 (p.1).

## Overview

This paper proposes a certificateless aggregate signature (CLAS) scheme for VANET that applies CLAS to stop OBU devices leaking sensitive information when sending messages (p.1).

The scheme is pairing-based: it uses a bilinear map ^e: G1 x G1 -> G2 over a cyclic additive G1 and cyclic multiplicative G2 of prime order q with generator P (p.8).

It claims existential unforgeability against Type-1 (A1) and Type-2 (A2) adversaries in the random oracle model under the computational Diffie-Hellman (CDH/CDHP) assumption (p.1).

## Relevance to Our Work

Interpretation: this is a baseline pairing-based CLAS-for-VANET with explicit Type I+II ROM/CDH proofs and measured Sign/Verify/Aggregate-Verify plus 583-byte communication figures, useful as the comparison point for our audit (p.1, p.13, p.18–p.19).

## Scheme entities

- VANET infrastructure is OBU, RSU and trusted authority, i.e. trace authority (TRA) plus key generator center (KGC) (p.2).
- TRA registers RSU and vehicle, generates pseudonyms, and traces real identity in disputes; KGC produces system parameters and partial private keys for RSUs and vehicles (p.2).
- RSU talks to OBU over open insecure wireless and to TRA over a secure channel (p.2).
- The construction is described as Setup, Registration, Partial-Private-Key-Gen, Vehicle-Key-Gen, Pseudonym-Gen, Sign, Verify, then Aggregate and Aggregate-Verify (p.8).

## Mathematical Notation

Notation follows Table 2 of the paper (p.8).

| Symbol | Definition |
|--------|-----------|
| G1 | Cyclic additive group (p.8) |
| G2 | Cyclic multiplicative group (p.8) |
| q | Prime order of G1 and G2 (p.8) |
| P | Generator of G1 (p.8) |
| ^e | Bilinear pairing ^e: G1 x G1 -> G2 (p.8) |
| H(.) | MapToPoint hash H: {0,1}* -> G1 (p.8) |
| h(.), h1..h6 | One-way hashes {0,1}* -> Zq* (p.8) |
| a, Ppub | KGC master secret and public key Ppub = aP (p.8) |
| b, Tpub | TRA secret and public key Tpub = bP (p.8) |
| yi, Prsui | RSU secret and public key Prsui = yiP (p.8) |
| IDi | Vehicle identity (p.8) |
| QIDi | H(IDi, ri) with random ri in Zq* (p.8) |
| PIDi | Vehicle pseudo-identity (p.8) |
| pskIDi | Vehicle partial private key (p.8) |
| vskIDi, vpkIDi | Vehicle private/public keys (p.8) |

### Setup

$$
\begin{aligned}
&G1, G2 \text{ of prime order } q,\; P \in G1,\; \hat{e}: G1 \times G1 \rightarrow G2 \;(p.8) \\
&\text{KGC picks } a \in Zq^*,\; P_{pub} = aP \;(p.8) \\
&\text{TRA picks } b \in Zq^*,\; T_{pub} = bP;\; \text{each RSU picks } y_i,\; P_{rsui} = y_iP \;(p.8) \\
&h_1 \ldots h_6: \{0,1\}^* \rightarrow Zq^* \;(p.8) \\
&params = \{q, G1, G2, P, \hat{e}, P_{pub}, h_1 \ldots h_6, P_{rsui}\} \text{ preloaded into TPD} \;(p.8) \\
\end{aligned}
$$

### Partial Private Key Extract

$$
psk_{ID_i} = aQ_{ID_i} \;(p.9)
$$

Vehicle checks legality via ^e(pskIDi, P) = ^e(QIDi, Ppub) (p.9).

### Vehicle-Key-Gen

$$
vsk_{ID_i} = x_i,\quad vpk_{ID_i} = x_iP,\; x_i \in Zq^* \;(p.9)
$$

### Pseudonym-Gen

$$
C_i = h_3(b, ID_i, T_i'),\quad PID_i = Q_{ID_i}C_i,\quad D_i = h_4(PID_i),\quad K_i = C_iD_i \;(p.9–p.10)
$$

TRA encrypts batches ((PIDi,1,Ki,1)...(PIDi,n,Ki,n), j, Ti') under vpkIDi and sends via RSU; vehicle checks j' = h5(QIDi, Ti') (p.10).

### Sign

$$
U_i = u_iP \in G1,\; u_i \in Zq^* \;(p.10)
$$

$$
h_i = h_6(M_i, PID_i, vpk_{ID_i}, U_i, t_i) \;(p.10)
$$

$$
S_i = psk_{ID_i}K + vsk_{ID_i}P_{pub} + h_iu_iP_{rsui} \;(p.10)
$$

Signature is si = (Ui, Si) on Mi; broadcast is (Mi, PIDi, vpkIDi, si, ti) (p.10).

### Verify (eq. 6)

$$
\hat{e}(S, P) = \hat{e}(PID_iD_i + vpk_{ID_i}, P_{pub}) \cdot \hat{e}(h_iU_i, P_{rsui}) \;(p.12)
$$

RSU first checks ti freshness, recomputes hi and Di = h4(PIDi), then checks eq. (6) (p.12).

### Aggregate (eq. 7)

$$
S = \sum_{i=1}^{n} S_i \;(p.12)
$$

RSU aggregates n pairs into s = (U1..Un, S) and sends (M1..Mn, PID1..PIDn, vpkID1..vpkIDn, s, t1..tn) to AS (p.12).

### Aggregate-Verify (eq. 8)

$$
\hat{e}(S, P) = \hat{e}\left(\sum_{i=1}^{n} PID_iD_i + vpk_{ID_i}, P_{pub}\right) \cdot \hat{e}\left(\sum_{i=1}^{n} h_iU_i, P_{rsui}\right) \;(p.12)
$$

## Security Analysis

- Proven existentially unforgeable against A1 in ROM under CDH intractability (Theorem 1) (p.13).
- Proven existentially unforgeable against A2 in ROM under CDH intractability (Theorem 2, proof sketched as comparable to Type-1) (p.16).
- Type-1 adversary is an outsider without master key; Type-2 takes the KGC role with master key access; both get CreateUser/Reveal/ReplaceKey oracles in Game-1/Game-2 (p.6).
- Comparison table marks Ours as withstanding A1 and A2 while the six listed VANET CLAS rivals fail at least A2 (p.13).
- Mutual authentication between vehicle and TRA uses encrypted request hE_Tpub(m, OTP, IDi, Ti, vpkIDi)i with OTP = h2(passIDi || QIDi || Ti) and passIDi = h1(ri, nonce) (p.9).
- Conditional privacy via TRA-issued one-time PIDi; TRA can reveal real identity on dispute (p.2).
- Claims resistance to replay (timestamps ti/Ti), MITM (mutual auth + per-message PIDi), masquerade (attacker lacks pskIDi, Ki) and impersonation (reduction to CDHP) (p.17).
- Claims pseudonymity, identity privacy, untraceability, unlinkability and user-location privacy from single-use PIDi batches (p.16–p.17).

## Performance

- Costs use PC = 3.21 ms (pairing), SC = 0.39 ms (scalar mult in G1), HC = 0.09 ms (MapToPoint), Tate pairing 159-bit MNT, 80-bit security, i7 3.07 GHz (p.18).
- Ours: Sign 3SC = 1.17 ms (p.18).
- Ours: Verify 3PC + 2SC = 10.41 ms (p.18).
- Ours: Aggregate-Verify 3PC + 2nSC = (9.63 + 0.78n) ms (p.18).
- Verify equation cost is split as ^e(PIDiDi, Ppub) x ^e(vpkIDi, Ppub) x ^e(hiUi, Prsui) = 3PC plus PIDiDi and hiUi = 2SC (p.19).
- Communication uses G1 = 128 bytes, Zq/hash = 20 bytes, timestamp = 4 bytes, VANET message = 67 bytes (p.19).
- Ours broadcasts Mi, ti, (PIDi, vpkIDi, si = (Ui, Si) in G1), total 583 bytes single / 583n bytes for n messages, smallest in Table 5 (p.19).

## Strengths & Limitations

- Strength: full A1+A2 proof plus mutual authentication, anonymity, unlinkability, traceability, replay and impersonation resistance in one comparison table (p.13).
- Strength: lowest communication (583 bytes vs 715–735 bytes rivals) and best Verify/Aggregate-Verify among compared CDHP schemes (p.18–p.19).
- Limitation: Verify and Aggregate-Verify still need 3 pairings, the dominant cost (p.18–p.19).
- Interpretation: the paper never analyses a Type-III (malicious TRA/RSU collusion) adversary, so no Type-III claim can be grounded in it (p.6, p.13).

## Provenance

- Mode: Full-text (local Zotero storage key YZ5IPBAG via pdftotext -layout; database: local Zotero storage, endpoint: pdftotext -layout dump path).
- Access date: 2026-09-21.
- Dump: articles/research/clas-vanet-audit/sources/cahyadi2022-clas-scheme.txt (1265 lines).
- Pairing equations kept because the paper is pairing-based (^e in Setup/Verify/Aggregate-Verify); no pairing-free rewrite applied.
