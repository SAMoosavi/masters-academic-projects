# A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs

## Bibliographic
- Authors: Wanqing Wu, Feixiang Ye | Year: 2025 | Venue: IEEE Internet of Things Journal 12(1):124-139 | DOI: 10.1109/JIOT.2024.3459033

## Problem
Many certificateless aggregate signature (CLAS) authentication schemes with pseudonyms for VANETs promise data integrity, source authentication and privacy-preserving, yet even state-of-the-art schemes are reported as either not entirely secure or inefficient (p.124, §Abstract). On security, Type-I outsiders tamper intercepted messages to forge valid signatures, Type-II compromised KGCs impersonate vehicles to forge at scale, and Type-III colluders aggregate invalid single signatures into a valid aggregate, with the listed peers failing each class (p.125). On efficiency, bilinear-pairing constructions inflate cost because a pairing operation and its group elements are reported as 20 times longer and 3 times larger than ECC scalar multiplication and elements at the 80-bit security level (p.125). The paper therefore proposes a pairing-free ECC CLAS with pseudonyms targeting Type-I, Type-II and Type-III resistance with lower overhead for resource-constrained VANETs, proved with an explicit generalized forking lemma and MIRACL simulations (p.124–125).

## Method
Setup initializes two master secrets α (KGC) and β (TA) with Ppub = αP and Tpub = βP, where the paper text says "four" hashes but enumerates five H0–H4 and the published params list only H0–H3 while H4 is used later in aggregation (p.130). TA issues pseudonyms via Ui = uiP and VIDi = RIDi ⊕ H0(xiTpub), then recovers RIDi and sets AIDi = RIDi ⊕ H0(βUi, Ti) with validity period Ti as PIDi = (AIDi, Ti) (p.130). KGC issues partial keys via Ri = riP with h2,i = H2(PIDi, Xi, Ri), precomputed PKi = Ri + h2,iXi, and pski = (ri + αh1,i) mod q with h1,i = H1(PIDi, PKi, Ppub) (p.130). Vehicles accept pski iff pskiP = Ri + h1,iPpub with PIDi validity checks, then set ski = pski + h2,i·xi with public key PKi (p.130). Signing stamps ti with h3,i = H3(PIDi, PKi, Ui, mi, ti) and σi = (ui + h3,i·ski) mod q, verified iff σiP = Ui + h3,i(PKi + h1,iPpub) after Ti/ti freshness checks (p.130). Aggregation computes Ξi = h3,i^-1(σiP − Ui) with tag η = H4(Ξ1,…,Ξn) as σagg, verified iff the sums match and η equals H4 over recomputed values, using only ECC scalar multiplication and addition with no bilinear pairing anywhere (p.130, p.124, p.127). Security is proved EUF-CMA under ECDLP in the ROM for Type-I/II via the explicit generalized forking Algorithm 1 and Lemma 1, Type-III via H4 collision-resistance, and evaluated by MIRACL simulation on a 2.10-GHz i7-12700 with NIST P-192 over 1000-round averages against seven pairing-free peers (p.127, p.131–135).

$$
\begin{aligned}
&\alpha, \beta \in \mathbb{Z}_q^* \\
&P_{pub} = \alpha P,\quad T_{pub} = \beta P \\
&H_0, H_1, H_2, H_3, H_4 : \{0,1\}^* \rightarrow \mathbb{Z}_q^* \\
&\text{params} = \{G, P, q, P_{pub}, T_{pub}, H_0, H_1, H_2, H_3\}
\end{aligned}
$$

*Setup equations and params as published (p.130).*

$$
\begin{aligned}
&U_i = u_i P,\quad VID_i = RID_i \oplus H_0(x_i T_{pub}) \\
&RID_i = VID_i \oplus H_0(\beta X_i) \\
&AID_i = RID_i \oplus H_0(\beta U_i, T_i),\quad PID_i = (AID_i, T_i)
\end{aligned}
$$

*Pseudonym equations; note RIDi (real identity) is distinct from Ri = riP (KGC nonce point) (p.130).*

$$
\begin{aligned}
&h_{2,i} = H_2(PID_i, X_i, R_i) \\
&PK_i = R_i + h_{2,i} X_i \\
&h_{1,i} = H_1(PID_i, PK_i, P_{pub}) \\
&psk_i = (r_i + \alpha \cdot h_{1,i}) \bmod q
\end{aligned}
$$

*Partial-key equations with PKi precomputed before hashing h1,i (p.130).*

$$
\begin{aligned}
&sk_i = psk_i + h_{2,i} \cdot x_i \\
&PK_i = R_i + h_{2,i} X_i \\
&psk_i P = R_i + h_{1,i} P_{pub}\ \text{(validity check)}
\end{aligned}
$$

*Key equations and partial-key check (p.130).*

$$
\begin{aligned}
&h_{3,i} = H_3(PID_i, PK_i, U_i, m_i, t_i) \\
&\sigma_i = (u_i + h_{3,i} \cdot sk_i) \bmod q
\end{aligned}
$$

*Signing equations with fresh timestamp ti (p.130).*

$$
\begin{aligned}
&\sigma_i P = U_i + h_{3,i}(PK_i + h_{1,i} P_{pub})
\end{aligned}
$$

*Single-signature verification equation (p.130).*

$$
\begin{aligned}
&\Xi_i = h_{3,i}^{-1}(\sigma_i P - U_i) \\
&\eta = H_4(\Xi_1, \ldots, \Xi_n) \\
&\sigma_{agg} = \left(\sum_{i=1}^n \Xi_i,\; \eta\right)
\end{aligned}
$$

*Aggregation equations with collision-resistant H4 tag (p.130).*

$$
\begin{aligned}
&\Xi'_i = PK_i + h_{1,i} P_{pub} \\
&\sum \Xi_i \stackrel{?}{=} \sum \Xi'_i,\quad \eta \stackrel{?}{=} H_4(\Xi_1, \ldots, \Xi_n) \quad \text{(p.130)}
\end{aligned}
$$

*Aggregate checks; Ξ'i denotes AS-recomputed values (paper reuses Ξi) (p.130).*

## Key findings
- Type-I EUF-CMA in the ROM under ECDLP holds with challenger success at least δ/8eq0 extracted from two forked forgeries via H1 forking (Theorem 1) (p.131–132).
- Type-II EUF-CMA in the ROM under ECDLP holds with challenger success at least δ/8eq0 via H2 forking with challenge identity embedded as Xi = aP (Theorem 2) (p.132–133).
- Type-III collusion aggregating at least one invalid single into a valid aggregate is reduced to breaking H4 collision-resistance, since distinct Ξj ≠ Ξ'j inputs must collide to pass both aggregate checks (Theorem 3) (p.133–134).
- Generalized forking Algorithm 1 with Lemma 1 succeeds with probability at least ε/8 when q > 8qH/ε, making the Type-I/II proof steps explicit (p.127).
- Signing costs 1Th ≈ 0.0018 as reported (p.135).
- Single verification σiP = Ui + h3,i(PKi + h1,iPpub) costs 2Tpa + 3Tsm + 2Th ≈ 1.8614 as reported (p.135).
- n-aggregate verification costs (2n−1)Tpa + nTsm + (n+1)Th ≈ 0.6272n − 0.0028 as reported (p.135).
- Element sizes are |G| = 48 bytes, |Z*q| = 24 bytes, timestamp 8 bytes and small integer 4 bytes, giving a single message of 160 bytes and n aggregates of 112n + 72 bytes with mi excluded (p.135).
- MIRACL/C++/VS2022 simulation with NIST P-192 and 1000-round averages plus posted GitHub code shows lower overhead than the seven pairing-free peers, with only the proposed scheme resisting all three adversary types in Table II (p.134–135).
- Appendix cryptanalysis shows peer [30] Type-I forgery via h2,i lacking Ui, peer [33] Type-II forgery via h3,i lacking Ppub, and peer [31] Type-III γ-shift collusion against plain-sum aggregation fixed by the H4 integrity tag (p.137–139, p.125).

## Limitations
Theorems 1–2 prove EUF-CMA only in the random oracle model under ECDLP with no standard-model variant stated (p.131–133). Post-failure identification of which single signatures are invalid after an aggregate verification failure is listed as future work rather than provided, since current detection costs are prohibitively high (p.136). Under the zero-trust principle, semi-trusted aggregate nodes such as RSUs and their potential attacks with matching security models are listed as future work rather than modeled (p.136).

## Related Work
- Ref [30] (Zheng et al.): Appendix Type-I forgery via h2,i lacking Ui binding, whose fix is binding every public parameter in the hash (p.137, p.139).
- Ref [33] (Xiong et al.): Appendix Type-II forgery via h3,i lacking Ppub binding, whose fix is binding the master public key in the hash (p.138–139).
- Ref [31] (Li et al.): Appendix Type-III γ-shift collusion (σ1+γ, σ2−γ) against plain-sum aggregation, whose fix is H4 integrity detection (p.138–139).
- Peers [26], [27], [28], [32] are all ECC-based and pairing-free comparators in Table II, of which [26], [27], [32] fail Type-I and [26], [27], [28], [32] fail Type-III while only the proposed scheme resists all three types (p.134).

## Provenance
- Database + endpoint + params: IEEE Xplore DOI 10.1109/JIOT.2024.3459033, PDF text extracted to research/clas-vanet-audit/sources/wu2025-pseudonyms.txt via pdftotext -layout, grounded against summaries/wu2025-pseudonyms.md.
- Access date: 2026-09-22.
- Bib verification: IEEE Internet of Things Journal vol. 12 no. 1 pp. 124–139; received 24 June 2024, published 12 September 2024 per article footer (p.124).
- Mode: Full-text
