# Security Analysis of Conditional Privacy-Preserving Authentication Schemes for VANETs (Shim 2023)

## Bibliographic

- Authors: Kyung-Ah Shim (Member, IEEE), National Institute for Mathematical Sciences, Daejeon, South Korea | Year: 2023 | Venue: IEEE Access, Volume 11, pp. 33956–33963 | DOI: 10.1109/ACCESS.2023.3263738
- Dates: received 17 February 2023, accepted 20 March 2023, published 3 April 2023, current version 7 April 2023 (p.1, header)
- Victim schemes cryptanalyzed: Wang et al. CLAS [25] and Xiong et al. CLS CPPA-D [26] (p.1, Abstract; p.8, References)
- Keywords: certificateless signature, certificateless aggregate signature, forgery attack, key recovery attack, malicious-but-passive KGC attack (p.1, Index Terms)

## Problem

- VANET safety messaging needs authenticity and integrity over open channels while preserving driver anonymity with TA traceability in disputes, which conditional privacy-preserving CLS/CLAS schemes claim to provide (p.1–2, §I).
- Most proposed CLS/CLAS schemes were later found insecure against Type I, Type II, malicious-but-passive KGC, or universal forgery attacks, and several relied on random-oracle proofs that may fail under concrete hash instantiation (p.2, §I).
- Wang et al. [25] proposed a new CLAS-based conditional privacy-preserving authentication scheme and Xiong et al. [26] proposed a new CLS-based one (CPPA-D), both claiming unforgeability and traceability for VANETs (p.2, §I).
- This paper breaks both: malicious-but-passive KGC attacks on Wang et al. plus forgery and key-recovery attacks on Xiong et al., where the KGC or anyone forges valid signatures for any vehicle that TA cannot trace, then discusses causes and countermeasures (p.1, Abstract; p.2, §I).

## Method

### Wang et al. victim setup and keys (copied from audited summary, re-verified vs dump)

- Wang setup: KGC picks prime-order groups with bilinear map plus random P, Q, s with Ppub = sP, TRA picks tracking key k with K = kP, and both publish params while s, k stay secret (p.2, §II.A).

$$
\begin{aligned}
&q > 2^{\nu}\ \text{prime},\ G_1, G_2\ \text{order } q % (p.2, §II.A) \\
&e: G_1 \times G_1 \rightarrow G_2 % (p.2, §II.A) \\
&P, Q \in_R G_1,\ s \in_R \mathbb{Z}_q^*,\ P_{pub} = sP % (p.2, §II.A) \\
&k \in_R \mathbb{Z}_q^*\ (\text{TRA key}),\ K = kP % (p.2, §II.A) \\
&\text{params} = (G_1, G_2, q, e, P, Q, P_{pub}, H_1, H_2, H_3) % (p.2, §II.A) \\
\end{aligned}
$$

- Wang keys: KGC issues partial key di = ri + ki*s for Ri = ri*P with ki = H2(PIDi,j, Ri), the vehicle picks xi with Xi = xi*P, and TRA traces IDi from the pseudonym with tracking key k (p.3, §II.A).

$$
\begin{aligned}
&R_i = r_i P,\ k_i = H_2(PID_{i,j}, R_i) % (p.3, §II.A) \\
&d_i = r_i + k_i s \bmod q,\ X_i = x_i P % (p.3, §II.A) \\
&PK_i = (X_i, R_i),\ SK_i = (d_i, x_i) % (p.3, §II.A) \\
&ID_i = PID_{i,1,j} \oplus H_1(kP + T_{i,j}) % (p.3, §II.A) \\
\end{aligned}
$$

### Wang et al. victim signing and verification (victim equations, legitimate pairing use)

- Wang signing: the vehicle picks fresh ui, forms Ui = ui*P with Vi = ui*Q, hashes hi over message, timestamp, pseudonym, signature parts and public key, and outputs sigma_i = (Ui, Vi, Wi) with Wi = (di + hi*xi)Q + Vi (p.3, §II.A).

$$
\begin{aligned}
&U_i = u_i P,\ V_i = u_i Q % (p.3, §II.A) \\
&h_i = H_3(m_i \Vert TS_i, PID_{i,j}, U_i, V_i, W_i, PK_i) % (p.3, §II.A) \\
&W_i = (d_i + h_i x_i)Q + V_i % (p.3, §II.A) \\
\end{aligned}
$$

- Wang verification (victim equations): RSU checks freshness then the single pairing equation, and TMC checks the summed aggregate pairing equation over U = sum Ui, V = sum Vi, W = sum Wi (p.3, §II.A).

$$
\begin{aligned}
&e(W_i, P) = e(R_i + k_i P_{pub} + h_i X_i + U_i, Q) % (p.3, §II.A) \\
&U = \sum U_i,\ V = \sum V_i,\ W = \sum W_i % (p.3, §II.A) \\
&e(W, P) = e(\sum R_i + \sum k_i P_{pub} + \sum h_i X_i + U, Q) % (p.3, §II.A) \\
\end{aligned}
$$

### Xiong et al. victim keys, signing, verification (victim equations)

- Xiong keys: TA publishes para with Ppub = sP, issues pseudo-identity PID = RID xor H(a*Ppub) with partial key delta = a + w*s for A = a*P and w = H1(PID||T) checkable via delta*P = A + w*Ppub, and the vehicle picks secret Sj with Spub = Sj*P (p.3–4, §II.B).

$$
\begin{aligned}
&\text{para} = (p, q, P, P_{pub}, H, H_1, H_2),\ P_{pub} = sP % (p.3, §II.B) \\
&A_{j,i} = a_{j,i}P,\ PID_{j,i} = RID_j \oplus H(a_{j,i} P_{pub}) % (p.3, §II.B) \\
&w_{j,i} = H_1(PID_{j,i} \Vert T_{j,i}) % (p.3, §II.B) \\
&\delta_{j,i} = a_{j,i} + w_{j,i}s \bmod q,\ S_{pub,j} = S_j P % (p.3, §II.B) \\
\end{aligned}
$$

- Xiong signing and verification (victim equations): the vehicle signs beta = delta + alpha*S with alpha = H2(M||PID||Spub||t) in broadcast message <A, M, PID, T, Spub, beta, t>, and recipients check timestamp freshness then beta*P = A + w*Ppub + alpha*Spub (p.4, §II.B).

$$
\begin{aligned}
&\alpha_{j,i} = H_2(M_{j,i} \Vert PID_{j,i} \Vert S_{pub,j} \Vert t_{j,i}) % (p.4, §II.B) \\
&\beta_{j,i} = \delta_{j,i} + \alpha_{j,i} S_j \bmod q % (p.4, §II.B) \\
&\beta_{j,i}P = A_{j,i} + w_{j,i}P_{pub} + \alpha_{j,i}S_{pub,j} % (p.4, §II.B) \\
\end{aligned}
$$

### Attack procedures and causes

- Wang KGC trapdoor and extraction: the malicious KGC publishes Q = alpha*P keeping alpha, collects one valid sigma_i, and recovers di*Q = Wi − alpha*hi*Xi − Vi since hi*xi*Q equals alpha*hi*Xi (p.5, §III.A).

$$
\begin{aligned}
&Q = \alpha P\ (\text{KGC trapdoor } \alpha) % (p.5, §III.A) \\
&W_i - \alpha h_i X_i - V_i = d_i Q % (p.5, §III.A) \\
&W_i' = d_i Q + \alpha h_i' X_i + V_i' % (p.5, §III.A) \\
&e(W_i', P) = e(R_i + k_i P_{pub} + h_i' X_i + U_i', Q) % (p.5, §III.A) \\
\end{aligned}
$$

- Wang forgery and framing: with (alpha, di*Q) the KGC forges sigma_i' = (Ui', Vi', Wi') on any message under the victim {PKi, PIDi,j} that passes single verification, so TRA tracing IDi from the pseudonym frames the honest vehicle (p.5, §III.A).
- Wang aggregation incorrectness: aggregate verification needs ki = H2(PIDi,j, Ri) and hi = H3(mi||TSi, PIDi,j, Ui, Vi, Wi, PKi) per signer, but {Ui, Vi, Wi} are never transmitted with sigma = (U, V, W), so the algorithm is unexecutable and sending all 3n elements equals sending n individual signatures (p.5, §III.B).
- Xiong one-signature eta-shift forgery: from one broadcast message anyone computes eta = alpha − alpha' for a new (M', t'), shifts A' = A + eta*Spub, and emits a valid message satisfying beta'*P = A' + w*Ppub + alpha'*Spub that TA cannot trace since H(sA') differs from H(sA) (p.5–6, §III.C).

$$
\begin{aligned}
&\eta = \alpha_{j,i} - \alpha_{j,i}' % (p.5, §III.C) \\
&A_{j,i}' = A_{j,i} + \eta S_{pub,j} % (p.5, §III.C) \\
&\beta_{j,i}'P = A_{j,i}' + w_{j,i}P_{pub} + \alpha_{j,i}'S_{pub,j} % (p.5, §III.C) \\
\end{aligned}
$$

- Xiong two-signature key recovery: from two same-period messages anyone solves Sj = (beta − beta')(alpha − alpha')^{−1} then delta = beta − alpha*Sj, signs arbitrary messages, and frames the victim since TA still resolves PID xor H(sA) = RID to the honest vehicle (p.6, §III.D).

$$
\begin{aligned}
&S_j = (\beta_{j,i} - \beta_{j,i}')(\alpha_{j,i} - \alpha_{j,i}')^{-1} % (p.6, §III.D) \\
&\delta_{j,i} = \beta_{j,i} - \alpha_{j,i} S_j % (p.6, §III.D) \\
\end{aligned}
$$

- Causes and countermeasures: Wang fails because computing (ri + ki*s)Q from (ri + ki*s)P and Q is CDH-hard only while log_P(Q) is hidden, so hide Q via H4: G1 → G1 and use H4(Q); Xiong fails for lack of Aj,i integrity binding and randomness reuse, so bind Aj,i into w = H1(PID||T||A) and alpha = H2(M||PID||Spub||A||t) with fresh randomness per signing (p.7, §IV).

## Key findings

- Wang et al. CLAS falls to a malicious-but-passive KGC that sets Q = alpha*P, extracts di*Q from a single collected signature, and forges valid signatures on arbitrary messages that frame the traced vehicle (p.5, §III.A).
- Wang et al. aggregate verification is incorrect as specified because per-signer (Ui, Vi, Wi) values needed for ki and hi are not transmitted, and the only fix costs 3n group elements, which removes any aggregation benefit (p.5, §III.B).
- Xiong et al. CLS falls to a 1-signature forgery by anyone: the eta-shift A' = A + eta*Spub yields a valid signature on any new message within the same {A, PID, T} context that TA cannot trace to the real identity (p.5–6, §III.C).
- Xiong et al. CLS falls completely given 2 same-period signatures: anyone recovers the full private material Sj = (beta − beta')(alpha − alpha')^{−1} and delta = beta − alpha*Sj, enabling arbitrary forgery that frames the honest vehicle (p.6, §III.D).
- The conclusion swaps the counts ("recover … from only one signature and forged … from two signatures"), contradicting the body where forgery needs 1 signature (§III.C) and key recovery needs 2 (§III.D) (p.7, §V vs p.5–6, §III.C–D).
- Root causes confirmed: unhidden algebraic structure of Q, no integrity binding of Aj,i in H1/H2, and reuse of {A, PID, T, Spub} across signings within period Tj,i instead of fresh randomness per signature (p.7, §IV).

## Limitations

- The paper proposes no new or repaired scheme and gives no experimental validation, benchmarks, or simulations; it is purely a cryptanalytic paper with attack computations only (pp.1–8).
- Only 2 schemes are analyzed (Wang et al. CLAS and Xiong et al. CPPA-D), so generality of the findings to other CLS/CLAS designs is not established (p.2, §I; p.7, §V).
- Interpretation: the stated Wang countermeasure (replace Q by H4(Q) with H4: G1 → G1) is a sketch without a revised construction or security proof, so its effectiveness is unproven (p.7, §IV.A).
- Interpretation: the paper's own conclusion text misstates the 1-signature forgery versus 2-signature key-recovery counts given in the body, which weakens the reliability of its summary claims (p.7, §V vs p.5–6, §III.C–D).

## Related Work

- Victim paper [25]: Wang et al., "A conditional privacy-preserving certificateless aggregate signature scheme in the standard model for VANETs," IEEE Access vol. 10, pp. 15605–15618, 2022 — the CLAS attacked in §III.A–B; see [[wang2022]].
- Victim paper [26]: Xiong et al., "CPPA-D: Efficient conditional privacy-preserving authentication scheme with double-insurance in VANETs," IEEE Trans. Veh. Technol. vol. 70, no. 4, pp. 3456–3468, 2021 — the CLS attacked in §III.C–D.
- Background: CLS/CLAS line from Al-Riyami–Paterson [4] through aggregate signatures [7] and VANET CPPA schemes [8–17], plus ROM-security and cryptanalysis literature [18–24]; type I / type II / malicious-but-passive KGC adversary classes follow [25][26]; see [[zhang2014]] for CLAS security notes.

## Provenance

- Database + endpoint + params: IEEE Xplore via DOI 10.1109/ACCESS.2023.3263738; publisher PDF fetched once; local full-text dump at research/clas-vanet-audit/sources/shim2023.txt (pdftotext-layout, 559 lines)
- Access date: 2026-09-22
- Coverage: Full-text verified, IEEE Access Volume 11 (2023), pp. 33956–33963, 8 pages including references

Mode: Full-text
