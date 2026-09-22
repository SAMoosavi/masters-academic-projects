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

This paper proposes an efficient certificateless aggregate signature (ECLAS) scheme for VANET and smart grid applications, built on ECC with time-validated pseudonyms and no bilinear pairings or map-to-point hashes (§4, pp.6–9; §5.3, p.15; §6, p.18).

## Relevance to Our Work

Relevant to the article as it demonstrates CLAS application in both VANET and smart grid contexts, with a time-validated pseudonym mechanism as a comparison point for conditional privacy-preservation (§1, p.3; §4.2, p.7).

## Key Contributions

- Proposes ECLAS scheme based on ECC for resource-constrained environments, precluding bilinear pairings and map-to-point hashes (§1, p.3; §6, p.18)
- Introduces time-validated pseudonym mechanism ($ID_i = (PID_1 \parallel PID_2 \parallel T_i)$) for conditional privacy-preservation (§4.2, p.7)
- Resolves KGC escrow problem through certificateless approach with vehicle-chosen secret $x_i$ added to the partial key (§1, p.3; §5.2, p.13)
- Demonstrates applicability to both VANET and smart grid scenarios with formal ROM security proofs under ECDL (§4, pp.6–9; §5.1, pp.10–11)

## Mathematical Notation

Paper-true construction (ECLAS, §4, pp.6–9). No bilinear pairing appears anywhere in the source PDF (pairing-free ECC only).

### Setup (§4.1, pp.6–7)

$$
\begin{aligned}
&p, q \text{ large primes},\quad E: y^2 = x^3 + ax + b \pmod p,\ a, b \in \mathbb{F}_p \text{ (p.6)} \\
&G = \langle P \rangle \text{ of order } q,\ P \in E \text{ (p.6)} \\
&\text{KGC master secret } \alpha \in \mathbb{Z}_q^*,\quad P_{pub} = \alpha P \text{ (p.6)} \\
&\text{TRA master secret } \beta \in \mathbb{Z}_q^*,\quad T_{pub} = \beta P \text{ (traceability key, p.7)} \\
&H_1: G \to \mathbb{Z}_q^*,\quad H_2, H_3: \{0,1\}^* \to \mathbb{Z}_q^* \text{ (p.7)} \\
&params = \{P, p, q, E, G, H_1, H_2, H_3, P_{pub}, T_{pub}\} \text{ preloaded in TPD/RSU (p.7)}
\end{aligned}
$$

### Pseudonym Generation (§4.2, p.7)

Vehicle $V_i$ with real identity $RID_i$ picks $k_i \in \mathbb{Z}_q^*$, computes $PID_1 = k_i P$, and sends $(RID_i, PID_1)$ to the TRA over a secure channel (p.7):

$$
\begin{aligned}
&PID_2 = RID_i \oplus H_1(\beta \cdot PID_1 \parallel T_i \parallel T_{pub}) \\
&ID_i = (PID_1 \parallel PID_2 \parallel T_i),\quad T_i = \text{validity period (p.7)} \\
&\text{Revocation as printed: } RID_i = PID_2 \oplus H_1(\beta \parallel T_i \parallel T_{pub}) \text{ (p.7; cf. generation with } \beta\cdot PID_1\text{ above — source-internal inconsistency)}
\end{aligned}
$$

### Partial Private Key Extract (§4.2, p.7)

KGC picks $d_i \in \mathbb{Z}_q^*$, computes $Q_{IDi} = d_i P$, and issues (p.7):

$$
psk_i = d_i + H_2(ID_i \parallel Q_{IDi}) \cdot \alpha \pmod p \text{ (p.7)}
$$

Vehicle checks authenticity via $psk_i \cdot P = Q_{IDi} + H_2(ID_i \parallel Q_{IDi}) \cdot P_{pub}$ (p.7). $(Q_{IDi}, psk_i)$ sent over a secure channel and stored in the tamper-proof device (p.7).

### Vehicle-Key Generation (§4.3, pp.7–8)

$$
vsk_i = x_i \in \mathbb{Z}_q^*,\quad vpk_i = x_i P,\quad sk_i = x_i + psk_i \text{ (full private key, pp.7–8)}
$$

### Sign (§4.4, pp.7–8, eqs.1–3)

Vehicle picks stored pseudonym $ID_i$ and fresh timestamp $t_i$, selects $r_i \in \mathbb{Z}_q^*$, computes $R_i = r_i P$ (p.7):

$$
\begin{aligned}
&h_i = H_3(M_i \parallel ID_i \parallel Q_{IDi} \parallel vpk_i \parallel R_i \parallel t_i) \quad \text{(eq.1, p.8)} \\
&S_i = h_i \cdot r_i + sk_i \pmod p \quad \text{(eq.2, p.8)} \\
&\sigma_i = (R_i, S_i) \quad \text{(eq.3, p.8)}
\end{aligned}
$$

Transmitted message is $(ID_i, Q_{IDi}, vpk_i, M_i, t_i, \sigma_i)$ (p.8).

### Individual Verify (§4.5, p.8, eqs.4–6)

RSU checks validity periods $T_i$ and timestamp $t_i$, recomputes $h_{i,0} = H_2(ID_i \parallel Q_{IDi})$ (eq.4, p.8) and $h_i$ (eq.5, p.8), then checks (eq.6, p.8):

$$
S_i \cdot P = h_i \cdot R_i + vpk_i + Q_{IDi} + h_{i,0} \cdot P_{pub} \quad \text{(eq.6, p.8)}
$$

### Aggregate (§4.6, pp.8–9, eq.7)

RSU collects $n$ pairs and outputs the concatenated aggregate $\sigma = (R_1, S_1), \ldots, (R_n, S_n)$ with $S = \sum_{i=1}^{n} S_i$ (eq.7, pp.8–9).

### Aggregate Verify (§4.7, p.9, eqs.8–10)

RSU recomputes $h_{i,0}$ (eq.8, p.9) and $h_i$ (eq.9, p.9) for all $i$, then checks (eq.10, p.9):

$$
S \cdot P = \sum_{i=1}^{n} h_i \cdot R_i + \sum_{i=1}^{n} vpk_i + \sum_{i=1}^{n} Q_{IDi} + \sum_{i=1}^{n} h_{i,0} \cdot P_{pub} \quad \text{(eq.10, p.9)}
$$

> Caveat: the paper's aggregate-phase hash (eq.9, p.9) is printed as $h_i = H_3(M_i \parallel ID_i \parallel vpk_i \parallel R_i \parallel t_i)$, dropping the $Q_{IDi}$ input present in the signing/individual equations (eq.1/eq.5, p.8) — an incorporates-as-printed inconsistency in the source, not a transcription error.

## Protocol / Scheme (§4, pp.6–9)

1. **Setup**: TA (KGC + TRA) generates $p, q, E, G, P$, master secrets $\alpha, \beta$, hashes $H_1, H_2, H_3$, publishes params preloaded in TPD/RSU (§4.1, pp.6–7)
2. **PseudonymGen**: vehicle sends $(RID_i, PID_1)$; TRA returns $ID_i = (PID_1 \parallel PID_2 \parallel T_i)$; KGC derives $(Q_{IDi}, psk_i)$ — all over secure channels (§4.2, p.7)
3. **Vehicle-KeyGen**: vehicle picks $x_i$, sets $vpk_i = x_i P$, $sk_i = x_i + psk_i$ (§4.3, pp.7–8)
4. **Sign**: pick $r_i$, compute $R_i$, $h_i$ (eq.1), $S_i$ (eq.2), output $\sigma_i = (R_i, S_i)$ with $(ID_i, Q_{IDi}, vpk_i, M_i, t_i)$ (§4.4, pp.7–8)
5. **Individual Verify**: check $T_i, t_i$, recompute $h_{i,0}, h_i$, check eq.6 (§4.5, p.8)
6. **Aggregate**: RSU collects $n$ pairs into $\sigma$ with $S = \sum S_i$ (§4.6, pp.8–9)
7. **Aggregate Verify**: recompute all hashes, check eq.10 (§4.7, p.9)

## Security Analysis (§5.1–5.2, pp.10–13)

- Proven secure against Type-I adversary in ROM under ECDL intractability (Theorem 1, p.10)
- Proven secure against Type-II (malicious KGC) adversary in ROM under ECDL intractability (Theorem 2, p.11)
- Anonymity/identity privacy via pseudonym $ID_i$ hiding $RID_i$; recovering $RID_i$ needs TRA master secret $\beta$ (ECDL-hard from $T_{pub} = \beta P$) (§5.2, p.12)
- Traceability: TRA recovers $RID_i$ from $PID_2$ when needed and records it on the revocation list (§5.2, p.12)
- Unlinkability: fresh $PID_1 = k_i P$ randomness per transmission makes captures look random and unrelated (§5.2, pp.12–13)
- Replay-attack resilience via timestamp $t_i$ freshness check; invalid timestamps rejected (§5.2, p.13)
- Key-escrow resistance: vehicle adds secret $x_i$ so neither TRA nor KGC alone can generate full $sk_i = x_i + d_i + H_2(ID_i \parallel Q_{IDi})\alpha$ (§5.2, p.13)

## Performance (§5.3, pp.15–17)

- Signing costs $2T_{e.m} + T_h \approx 0.8841$ ms, individual verification the same, aggregate verification $2nT_{e.m} + nT_h \approx 0.8841n$ ms — no pairings or map-to-point hashes (Table 4, pp.15–16)
- Combined sign + individual-verify load $1.7682$ ms, reported best among the six compared schemes (pp.15–16)
- Communication overhead 184 bytes per message ($ID_i, Q_{IDi}, vpk_i, R_i \in G$ at 40 B each $= 160$ B $+ S_i \in \mathbb{Z}_q^*$ at 20 B $+$ 4 B timestamp) — lower than [27,54], on par with [13,55] (§5.3.2, p.17; Table 5, p.18)
- Batch verification delay scales linearly with $n$; comparison at $n = 2000$ signatures favors ECLAS (Fig. 3, pp.16–17)

## Strengths & Limitations

- Strengths: dual VANET + smart-grid applicability; TRA-traceable pseudonyms with validity period; ECC-only construction with the lowest reported sign/verify cost in its comparison set (pp.15–16, Table 4)
- Limitations: pseudonym + partial-key issuance runs over secure channels (unlike open-channel designs such as Iqbal2023); aggregate output is a concatenation of pairs rather than a constant-size aggregate (§4.6, pp.8–9); aggregate-phase hash (eq.9, p.9) inconsistently drops $Q_{IDi}$ (see caveat above); evaluation is analytic (Table 3 timings), not a deployment measurement (p.15, §5.3)

## Related Work

- [[cahyadi2022-clas-scheme|A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET]]

## Provenance
- Mode: Full-text (source PDF read via pdftotext -layout, dump saved).
- Database/endpoint: local PDF dump research/clas-vanet-audit/sources/vallent2021.txt (Zotero storage key AI8HZABG) + publisher record https://www.mdpi.com/1424-8220/21/9/2900.
- Source key: AI8HZABG (Efficient certificate-less aggregate signature...pdf).
- Access date: 2026-09-21.
- Bib verification: Sensors 21(9):2900, https://www.mdpi.com/1424-8220/21/9/2900 — confirmed vs PDF.
- What changed: removed copy-pasted e(...) verification, replaced with paper-true Si·P/S·P equations; fixed ECDHP→ECDL; respawn: provenance appended 2026-09-21.
- Fix 2026-09-21 (audit round 2): rewrote Setup/Pseudonym/Partial-Key/Vehicle-Key/Sign/Aggregate sections with paper-true equations — prior version had invented placeholders (`d_i = sH(ID_i)`, tuple key `SK_i = (d_i,x_i)`, `V_i = x_i H(PID_i)`, `S_i = d_i H(PID_i) + x_i h_i + r_i`, `PID_i = H(ID_i,T_start,T_end)`); paper-true per §4 pp.6–9: `psk_i = d_i + H_2(ID_i‖Q_IDi)·α`, `sk_i = x_i + psk_i`, `S_i = h_i·r_i + sk_i` (eq.2, p.8), `ID_i = (PID_1‖PID_2‖T_i)` (p.7). Flagged source-internal eq.9 vs eq.1/eq.5 hash-input inconsistency (p.9 vs p.8).
