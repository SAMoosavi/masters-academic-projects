---
title: "Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT"
authors: "Zhang, Dong, Liu"
year: 2024
journal: "IEEE Internet of Things Journal"
volume: "11(3)"
pages: "4348-4361"
doi: "10.1109/JIOT.2023.3298840"
category: "CLS"
pairing: false
tags: [CLS, signcryption, pairing-free, ECC, IoMT]
---

# Zhang et al. (2024) — Summary

**Title:** Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT

**Authors:** Jianhong Zhang, Chenghe Dong, Yining Liu

**Published in:** IEEE Internet of Things Journal, Vol. 11, No. 3, pp. 4348-4361, 1 February 2024 (p. 4348–4361)

---

## Overview

This paper is an IoMT (Internet of Medical Things) scheme — not a VANET scheme — proposing a pairing-free certificateless signcryption (CLSC) scheme for secure physiological-data transmission between patients/devices and doctors/hospitals (p. 4348).

## Problem

In IoMT, patient physiological data must be transmitted with both confidentiality and source verifiability. Existing CLSC schemes either require expensive bilinear pairings or are insecure against Type I (malicious user / public key replacement) and Type II (malicious KGC) adversaries. The paper demonstrates a concrete Type I attack on Chen et al.'s [29] recent pairing-free CLSC scheme (p. 4348–4349, §I–II).

## Contributions

1. Shows Chen et al.'s CLSC scheme is vulnerable to Type I attacks — an adversary replaces the sender's public key with crafted values to forge a valid signcryptext (p. 4352, §VI).
2. Proposes a new pairing-free CLSC scheme using a "double zero-knowledge proof" technique that binds public keys to the verification equation, preventing public key replacement attacks (p. 4353, §VII.D).
3. Proves IND-CLSC-CCA2 (confidentiality) and EUF-CLSC-CMA (unforgeability) under Type I and Type II adversaries in the random oracle model, with tight security reduction (no forking lemma) (p. 4353–4358, §VIII).
4. Achieves public verification — anyone can verify a signcryptext without secret keys (p. 4353, §VII.F).

## Scheme (5 algorithms)

### Setup

- KGC generates ECC parameters $(E, q, P, G)$, picks master secret $s \in \mathbb{Z}_q$, computes $P_{pub} = sP$ (p. 4352–4353, §VII.A).
- Hash functions: $H_1: \{0,1\}^* \times G \times G \to \mathbb{Z}_q$, $H_2: \{0,1\}^* \times \{0,1\}^* \times G \times G \to \{0,1\}^{l_1}$, $H_3: G \times G \to \mathbb{Z}_q$, $H_4: G \times \{0,1\}^{l_1} \times G \times G \to \mathbb{Z}_q^*$ (p. 4353, §VII.D).

### Partial Private Key

- KGC picks $\alpha_i$, computes $T_i = \alpha_i P$, $h_i = H_1(ID_i, T_i, P_{pub})$, $d_{ID_i} = \alpha_i + s \cdot h_i$ (p. 4353, §VII.B).

### Key Generation

- Entity picks $x_{ID_i} \in \mathbb{Z}_q^*$, sets $sk_i = (x_{ID_i}, d_{ID_i})$, $pk_i = (Y_{ID_i} = x_{ID_i}P, T_i)$ (p. 4353, §VII.C).

### Signcryption (sender $ID_s \to$ receiver $ID_r$)

- Pick $u$, compute $U = uP$ (p. 4353, §VII.D).
- Compute $V = u \cdot h_r \cdot f_r \cdot Y_{ID_r} + h_s T_r + h_r P_{pub}$ (p. 4353, §VII.D).
- $Y = H_2(ID_r, ID_s, U, V)$, $c = Y \oplus m$ (p. 4353, §VII.D).
- $r = H_4(U, c, T_s, Y_{ID_s})$ (p. 4353, §VII.D).
- $\theta = u + r \cdot f_s \cdot x_{ID_s} + d_{ID_s}$ (p. 4353, §VII.D).
- Output $\delta = (U, \theta, c)$ (p. 4353, §VII.D).

### Unsigncryption

- Compute $V' = (h_r \cdot f_r \cdot x_{ID_r} + h_s \cdot d_{ID_r}) \cdot U$, $Y' = H_2(ID_r, ID_s, U, V')$, recover $m' = c \oplus Y'$ (p. 4353, §VII.E).
- Verify: $\theta P \stackrel{?}{=} U + r' \cdot (f_s \cdot Y_{ID_s} + T_s + h_s \cdot P_{pub})$ (p. 4353, §VII.E).

### Public Verification

- Anyone computes $r' = H_4(U, c, T_s, Y_{ID_s})$ and checks $\theta P \stackrel{?}{=} U + r' \cdot (f_s \cdot Y_{ID_s} + T_s + h_s \cdot P_{pub})$ using only the sender's public key, with no secret keys needed (p. 4353, §VII.F).

## Key Insight

The value $\theta = u + r(f_s \cdot x_{ID_s} + d_{ID_s})$ is a zero-knowledge proof that $f_s \cdot Y_{ID_s} + T_s + h_s \cdot P_{pub}$ is a scalar multiple of $P$. Since $T_s$ is derived from KGC's $\alpha_i$ and $Y_{ID_s}$ is the entity's own value, both are bound to $P$. An adversary cannot replace $Y_{ID_s}$ with an arbitrary value and still satisfy the verification equation (p. 4353, §VII.D).

## Security

- **Confidentiality (IND-CLSC-CCA2):** Reduces to Square-DH assumption. Both Type I and Type II adversaries cannot distinguish ciphertexts (p. 4353–4356, §VIII).
- **Unforgeability (EUF-CLSC-CMA):** Reduces to Square-DH assumption. Both Type I and Type II adversaries cannot forge valid signcryptexts (p. 4356–4358, §VIII).
- Tight reduction — does not use Pointcheval-Stern forking lemma (p. 4359–4360, §IX.C).

## Performance (vs. 5 recent CLSC schemes)

| Scheme | Signcrypt | Unsigncrypt | Total | Ciphertext (bits) | Pairing-free | Secure |
|--------|-----------|-------------|-------|-------------------|-------------|--------|
| Chen et al. [29] (2023) | (split n/a) | (split n/a) | $6T_{sm}$ (p. 4359) | 1120 (p. 4359) | Yes (p. 4359) | No, Type I (p. 4359–4360) |
| Du et al. [28] (2021) | $4T_{sm} + T_{inv}$ (p. 4359) | $5T_{sm}$ (p. 4359) | $9T_{sm} + T_{inv}$ (p. 4359) | 640 (p. 4359) | Yes (p. 4359) | No, Type II (p. 4359–4360) |
| Dai-Xu [27] (2023) | $3T_{sm}$ (p. 4359) | $5T_{sm}$ (p. 4359) | $8T_{sm}$ (p. 4359) | 640 (p. 4359) | Yes (p. 4359) | No, Type I (p. 4359–4360) |
| Gong et al. [5] (2022) | $3T_{psm} + T_{inv}$ (p. 4359) | $2T_{psm} + T_p$ (p. 4359) | $5T_{psm} + T_{inv} + T_p$ (p. 4359) | 1344 (p. 4359) | No (p. 4359) | No, Type I (p. 4359–4360) |
| Chen et al. [26] (2022) | $3T_{psm}$ (p. 4359) | $2T_{psm} + 5T_p$ (p. 4359) | $5T_{psm} + 5T_p$ (p. 4359) | 3392 (p. 4359) | No (p. 4359) | No, Type I (p. 4359–4360) |
| **This scheme** | $3T_{sm}$ (p. 4359) | $4T_{sm}$ (p. 4359) | $7T_{sm}$ (p. 4359) | 640 (p. 4359) | **Yes** (p. 4359) | **Yes** (p. 4359–4360) |

The proposed scheme has the lowest computation cost among secure schemes and the smallest ciphertext size (640 bits = 57.14% of Chen et al. [29]) (p. 4359, §IX.A–B).

## Notation

| Symbol | Meaning |
|--------|---------|
| $T_{sm}$ | Scalar multiplication on general ECC (p. 4359) |
| $T_{psm}$ | Scalar multiplication on bilinear pairing group (p. 4359) |
| $T_p$ | Bilinear pairing operation (p. 4359) |
| $T_{inv}$ | Modular inverse (p. 4359) |
| $ID_i$ | Entity identity (p. 4353) |
| $P_{pub}$ | KGC's master public key (p. 4352–4353) |
| $d_{ID_i}$ | Partial private key from KGC (p. 4353, §VII.B) |
| $x_{ID_i}$ | Entity's secret value (p. 4353, §VII.C) |
| $f_i = H_3(Y_{ID_i}, T_i)$ | Hash binding public key components (p. 4353, §VII.D) |

## Bibliographic Verification

- Correct DOI per PDF footer is `10.1109/JIOT.2023.3298840` (Digital Object Identifier line); the previous file value `10.1109/JIOT.2023.3293498` is rejected against the source PDF (p. 4348).
- Journal headers on every page: IEEE Internet of Things Journal, VOL. 11, NO. 3, 1 FEBRUARY 2024, article page range 4348-4361 (p. 4348–4361).
- First-page header shows 4348 and last content header shows 4361, confirming the article page range (p. 4348–4361).
- Manuscript received 4 July 2023; accepted 21 July 2023; date of publication 25 July 2023; date of current version 24 January 2024 (p. 4348).
- Scope is IoMT throughout (31 IoMT mentions, 0 VANET mentions in source text dump); the two "vehicular" hits are cited references only ([27]-[28]). Construction uses general ECC scalar multiplication only — pairing-free, with no bilinear map operator in the proposed scheme (p. 4348–4361).

## Provenance

- Mode: Full-text (source PDF read via `pdftotext -layout`, full dump saved).
- Source key: ZCLEKD7V (`Zhang et al. - 2024 - Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT.pdf`).
- Access date: 2026-09-21.
- What changed: (1) corrected DOI `10.1109/JIOT.2023.3293498` → `10.1109/JIOT.2023.3298840` per PDF footer (p. 4348); added volume 11(3) and pages 4348-4361 per running headers (p. 4348–4361); (2) labelled scope IoMT (not VANET) in frontmatter tags and Overview first line; confirmed pairing-free with no bilinear operator in summary equations.
