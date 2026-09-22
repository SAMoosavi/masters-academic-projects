---
title: "A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs"
authors: "Wanqing Wu, Feixiang Ye"
year: 2025
journal: "IEEE Internet of Things Journal"
volume: "12"
number: "1"
pages: "124-139"
doi: "10.1109/JIOT.2024.3459033"
tags: [CLAS, VANET, pseudonyms, pairing-free, ECC, Type-III, forking-lemma, MIRACL]
---

# A Secure and Efficient CLAS Authentication Scheme With Pseudonyms for VANETs

## Overview

Wu and Ye propose a certificateless aggregate signature (CLAS) authentication scheme with pseudonyms for VANETs, built on elliptic curve cryptography (ECC) with no bilinear pairing (pairing-free) (p.124, §Abstract). Trust is split between the KGC (master secret α) and the TA (master secret β); the scheme targets Type-I, Type-II and Type-III adversaries and introduces the generalized forking lemma to make the security proof transparent (p.124–125). The authors report lower computational and communication overhead than recent pairing-free CLAS peers, supported by MIRACL-library simulations (p.124, p.134–135).

## Relevance to Our Work

Interpretation: this is the direct benchmark for Type-III-resistant pairing-free CLAS — our scheme should compare security (Type-I+II+III) and overhead against it (p.124–125).

## Key Contributions

- Appendix cryptanalysis of schemes [30], [31], [33]: missing hash-bound parameters enable Type-I/II forgeries, and missing single-signature integrity checks enable Type-III collusion (p.125).
- Pairing-free ECC CLAS with pseudonyms: all hashes bind the necessary public parameters, and the aggregate algorithm uses collision-resistant H4 to check single-signature integrity (p.125).
- Generalized forking lemma (Algorithm 1, Lemma 1) made explicit to strengthen proof transparency; EUF-CMA under ECDLP in the ROM for Type-I/II (p.127, p.131–133).
- MIRACL simulation (2.10-GHz i7-12700, NIST P-192, 1000-round averages) shows lower overhead than seven pairing-free peers [26],[27],[28],[30],[31],[32],[33] (p.134–135).
- Two master keys, α (KGC) and β (TA), separating partial-key issuance from pseudonym tracing (p.130).

## Protocol / Scheme

1. **Setup**: KGC and TA pick α, β ∈ Z*_q, compute Ppub = αP, Tpub = βP; paper text says "four" hashes but enumerates five H0–H4 : {0,1}* → Z*_q; published params = {G, P, q, Ppub, Tpub, H0, H1, H2, H3} (H4 used later but absent from params) (p.130).
2. **Set Secret Value**: vehicle Vi picks xi ∈ Z*_q, sets Xi = xiP (p.130).
3. **PseudonymGen**: Vi picks ui ∈ Z*_q, computes Ui = uiP and VIDi = RIDi ⊕ H0(xiTpub), sends {Xi, Ui, VIDi}; TA recovers RIDi = VIDi ⊕ H0(βXi), computes AIDi = RIDi ⊕ H0(βUi, Ti) with validity period Ti, sets PIDi = {AIDi, Ti} (p.130).
4. **Partial Private Key**: KGC picks ri ∈ Z*_q, computes Ri = riP, h2,i = H2(PIDi, Xi, Ri), precomputes PKi = Ri + h2,iXi, h1,i = H1(PIDi, PKi, Ppub), sets pski = (ri + αh1,i) mod q, sends {PIDi, pski, Ri} (p.130).
5. **Vehicle Key Gen**: Vi recomputes PKi = Ri + h2,iXi, accepts iff pskiP = Ri + h1,iPpub and RIDi = AIDi ⊕ H0(uiTpub, Ti), then sets ski = pski + h2,i·xi with public key PKi (p.130).
6. **Sign**: Vi stamps ti, computes h3,i = H3(PIDi, PKi, Ui, mi, ti), σi = (ui + h3,i·ski) mod q, sends {PIDi, PKi, Ui, mi, ti, σi} (p.130).
7. **Verify**: RSU drops stale Ti/ti, recomputes h1,i, h3,i, accepts iff σiP = Ui + h3,i(PKi + h1,iPpub) (p.130).
8. **Aggregate**: RSU computes Ξi = h3,i^-1(σiP − Ui), η = H4(Ξ1,…,Ξn), σagg = (ΣΞi, η), forwards tuples plus σagg to AS (p.130).
9. **Aggregate Verify**: AS drops stale Ti/ti, recomputes h1,i and Ξ'i = PKi + h1,iPpub, accepts iff ΣΞi = ΣΞ'i and η = H4(Ξ1,…,Ξn) (p.130).

## Mathematical Notation

### Setup

$$
\begin{aligned}
&\alpha, \beta \in \mathbb{Z}_q^* \\
&P_{pub} = \alpha P,\quad T_{pub} = \beta P \\
&H_0, H_1, H_2, H_3, H_4 : \{0,1\}^* \rightarrow \mathbb{Z}_q^* \\
&\text{params} = \{G, P, q, P_{pub}, T_{pub}, H_0, H_1, H_2, H_3\}
\end{aligned}
$$

*Setup equations and params as published (p.130).*

### Pseudonym

$$
\begin{aligned}
&U_i = u_i P,\quad VID_i = RID_i \oplus H_0(x_i T_{pub}) \\
&RID_i = VID_i \oplus H_0(\beta X_i) \\
&AID_i = RID_i \oplus H_0(\beta U_i, T_i),\quad PID_i = (AID_i, T_i)
\end{aligned}
$$

*Pseudonym equations; note RIDi (real identity) is distinct from Ri = riP (KGC nonce point) (p.130).*

### Partial Private Key

$$
\begin{aligned}
&h_{2,i} = H_2(PID_i, X_i, R_i) \\
&PK_i = R_i + h_{2,i} X_i \\
&h_{1,i} = H_1(PID_i, PK_i, P_{pub}) \\
&psk_i = (r_i + \alpha \cdot h_{1,i}) \bmod q
\end{aligned}
$$

*Partial-key equations with PKi precomputed before hashing h1,i (p.130).*

### Private/Public Key

$$
\begin{aligned}
&sk_i = psk_i + h_{2,i} \cdot x_i \\
&PK_i = R_i + h_{2,i} X_i \\
&psk_i P = R_i + h_{1,i} P_{pub}\ \text{(validity check)}
\end{aligned}
$$

*Key equations and partial-key check (p.130).*

### Signature

$$
\begin{aligned}
&h_{3,i} = H_3(PID_i, PK_i, U_i, m_i, t_i) \\
&\sigma_i = (u_i + h_{3,i} \cdot sk_i) \bmod q
\end{aligned}
$$

*Signing equations with fresh timestamp ti (p.130).*

### Verification

$$
\begin{aligned}
&\sigma_i P = U_i + h_{3,i}(PK_i + h_{1,i} P_{pub})
\end{aligned}
$$

*Single-signature verification equation (p.130).*

### Aggregate

$$
\begin{aligned}
&\Xi_i = h_{3,i}^{-1}(\sigma_i P - U_i) \\
&\eta = H_4(\Xi_1, \ldots, \Xi_n) \\
&\sigma_{agg} = \left(\sum_{i=1}^n \Xi_i,\; \eta\right)
\end{aligned}
$$

*Aggregation equations with collision-resistant H4 tag (p.130).*

### Aggregate Verification

$$
\begin{aligned}
&\Xi'_i = PK_i + h_{1,i} P_{pub} \\
&\sum \Xi_i \stackrel{?}{=} \sum \Xi'_i,\quad \eta \stackrel{?}{=} H_4(\Xi_1, \ldots, \Xi_n)
\end{aligned}
$$

*Aggregate checks; Ξ'i denotes AS-recomputed values (paper reuses Ξi) (p.130).*

## Security Analysis

- Type-I (outsider replaces PKi, no α): EUF-CMA in ROM under ECDLP; challenger extracts α from two forked forgeries with probability at least δ/8eq0 (Theorem 1) (p.131–132).
- Type-II (malicious KGC holds α, cannot replace PKi): EUF-CMA in ROM under ECDLP via H2 forking (Theorem 2) (p.132–133).
- Type-III (holds all ski, aggregates ≥1 invalid single into valid aggregate): reduced to breaking H4 collision-resistance (Theorem 3) (p.133–134).
- Adversary capabilities and EUF-CMA games (Game-I/II/III) as defined in the security model (p.129).
- Generalized forking algorithm GF (Algorithm 1) and Lemma 1: forking succeeds with probability at least ε/8 when q > 8qH/ε (p.127).
- Pairing-free throughout: construction uses only ECC scalar multiplication/addition, no bilinear map appears (p.124, p.127).

## Performance

- All seven peers [26],[27],[28],[30],[31],[32],[33] are ECC-based and pairing-free; only the proposed scheme resists all three adversary types (Table II) (p.134).
- Signing costs 1Th ≈ 0.0018 as reported (p.135).
- Single verification σiP = Ui + h3,i(PKi + h1,iPpub) costs 2Tpa + 3Tsm + 2Th ≈ 1.8614 as reported (p.135).
- n-aggregate verification costs (2n−1)Tpa + nTsm + (n+1)Th ≈ 0.6272n − 0.0028 as reported (p.135).
- Element sizes: |G| = 48 bytes, |Z*q| = 24 bytes, timestamp 8 bytes, small integer 4 bytes; single message 160 bytes; n aggregates 112n + 72 bytes (mi excluded) (p.135).
- Simulation on MIRACL/C++/VS2022 with NIST P-192, 1000-round averages; code posted on GitHub (p.134–135).

## Strengths & Limitations

- Strength: Type-III collusion resistance via H4 integrity tag, rare among peers (p.125, p.133–134).
- Strength: transparent generalized-forking-lemma proofs with explicit GF algorithm and Lemma 1 (p.127, p.131–133).
- Strength: MIRACL simulation plus posted code for practical validation (p.134–135).
- Strength: KGC/TA trust separation via two master keys α, β (p.130).
- Strength: IEEE Internet of Things Journal venue, vol. 12 no. 1 (p.124).
- Limitation: proofs are ROM-only with no standard-model variant (Theorems 1–2 assume random oracles) (p.131–133).
- Limitation: post-failure identification of invalid singles is listed as future work, not provided (p.136).
- Limitation: semi-trusted (zero-trust) aggregate nodes such as RSUs are listed as future work, not modeled (p.136).

## Related Work

- Ref [30] (Zheng et al.): Appendix Type-I forgery via h2,i lacking Ui; fix is binding every public parameter in the hash (p.137, p.139).
- Ref [33] (Xiong et al.): Appendix Type-II forgery via h3,i lacking Ppub; fix is binding the master public key in the hash (p.138–139).
- Ref [31] (Li et al.): Appendix Type-III γ-shift collusion (σ1+γ, σ2−γ) against plain-sum aggregation; fix is H4 integrity detection (p.138–139).
- Vault-only benchmarks not cited in the paper (not paper claims, no locator): [[tao2026]], [[wu2025-collusion]].

## Provenance

- Mode: Full-text.
- Database + endpoint: Zotero local store (key 8ABM5M6N) extracted via pdftotext -layout + pdfinfo.
- Access date: 2026-09-21.
- Bib verification: IEEE Internet of Things Journal, vol. 12 no. 1, pp. 124–139; DOI 10.1109/JIOT.2024.3459033 per article footer; received 24 June 2024, published 12 September 2024 (p.124).
- What changed (2026-09-21 pass): grounded every bullet/prose claim with locators (was 9); corrected Setup hash-count wording (paper says "four", enumerates five) and params omitting H4; verified RIDi-vs-Ri distinction; confirmed no bilinear map present; added reported timing/size numbers with locators; recorded ROM-only and future-work limitations.
