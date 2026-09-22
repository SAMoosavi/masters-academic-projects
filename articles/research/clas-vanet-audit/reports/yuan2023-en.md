# A New Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs (yuan2023)

## Bibliographic

- Authors: Beibei Yuan, Hui Huang, Chenhuang Wu | Year: 2023 | Venue: Mathematics 11(23):4766 | DOI: 10.3390/math11234766 | 18 pages, CC BY.

## Problem

- VANETs form mobile networks from moving vehicles and transport facilities via wireless communication, improving traffic safety and intelligent transport, but face data-transmission security concerns that aggregate signature schemes can address (p.1).
- Recently proposed conditional privacy-preserving CLAS schemes for VANETs still carry security concerns, so this paper re-analyses one such scheme and finds KGC-attack and public-key-replacement vulnerabilities (p.1).
- The authors propose an improved scheme fixing these flaws, then give formal plus informal security assessments and a performance evaluation showing practical viability (p.1).

## Method

- The system has five entities (KGC, TRA, OBU, RSU, TMC) with pseudonyms PIDi,j and TRA-only traceability via tracking key k (pp.3–4, p.8).
- The improved construction has eight stages with new system key Z = H3(y_pub) and hash families H1–H5 (pp.7–8).
- Correctness of equations (3) and (4) follows by expanding d_i = r_i + k_i s and moving Z across the pairing (p.9).

### Setup

$$
\begin{aligned}
&e: G_1 \times G_1 \to G_2,\ q > 2^{\nu} % (p.8) \\
&y_{pub} = sP,\quad Z = H_3(y_{pub}) % (p.8) \\
&params = \lbrace G_1, G_2, q, e, P, Z, y_{pub}, H_1, H_2, H_3, H_4, H_5 \rbrace % (p.8)
\end{aligned}
$$

- KGC picks P in G1 and s in Zq* with y_pub = sP and Z = H3(y_pub) while TRA picks k with K = kP, and hash domains span H1–H5 as reported (p.8).

### Partial Private Key Extract

$$
\begin{aligned}
&r_i \in \mathbb{Z}_q^*,\quad R_i = r_i P % (p.8) \\
&k_i = H_2(PID_{i,j}, R_i) % (p.8) \\
&d_i = r_i + k_i \cdot s \bmod q % (p.8)
\end{aligned}
$$

- KGC selects r_i, computes R_i = r_i P and k_i = H2(PIDi,j, R_i), and issues d_i = r_i + k_i s mod q as the partial private key (p.8).

### Set Secret Value / Keys

$$
\begin{aligned}
&x_i \in \mathbb{Z}_q^*,\quad X_i = x_i P % (p.8) \\
&PK_i = (X_i, R_i),\quad \text{private key } (d_i, x_i) % (p.8)
\end{aligned}
$$

- The vehicle picks secret x_i, computes X_i = x_i P, publishes PKi = (X_i, R_i), and keeps (d_i, x_i) as the private key (p.8).

### Signature

$$
\begin{aligned}
&u_i \in \mathbb{Z}_q^*,\quad U_i = u_i P % (p.8) \\
&\varphi_i = H_4(y_{pub}, PK_i, U_i) % (p.8) \\
&h_i = H_5(m_i \| TS_i, PID_{i,j}, U_i, PK_i) % (p.8) \\
&W_i = (d_i \cdot \varphi_i + h_i \cdot x_i + u_i) \cdot Z % (p.8) \\
&\sigma_i = (U_i, W_i) % (p.8)
\end{aligned}
$$

- The signer picks timestamp TSi and random u_i with U_i = u_i P, then computes phi_i and h_i and outputs W_i = (d_i phi_i + h_i x_i + u_i) Z with single-use pseudonyms (p.8).

### Aggregate

$$
\begin{aligned}
&U = \sum_{i=1}^n U_i,\quad W = \sum_{i=1}^n W_i % (p.9) \\
&\sigma = (U, W) % (p.9)
\end{aligned}
$$

- The RSU sums n individual pairs into U = sum U_i and W = sum W_i and sends sigma = (U, W) to the TMC (p.9).

### Verification

$$
\begin{aligned}
&e(W_i, P) = e((R_i + k_i \cdot y_{pub}) \cdot \varphi_i + h_i \cdot X_i + U_i, Z) % (p.8) \\
&e(W, P) = e(\sum (R_i + k_i y_{pub}) \varphi_i + \sum h_i X_i + U, Z) % (p.9)
\end{aligned}
$$

- Single-signature check is equation (3) after recomputing k_i, phi_i, and h_i and testing timestamp freshness (p.8).
- Aggregate check is equation (4) over the summed terms with freshness testing before acceptance (p.9).

## Key findings

- Wang et al. signing is logically incorrect because h_i hashes W_i before W_i is computed, and the fix hashes without W_i (p.6).
- KGC forgery on Wang et al. works because KGC knows l with Q = lP and forges W_i0 = l(R_i + k_i Ppub + h_i0 X_i + U_i0) passing equation (1) (pp.6–7).
- Public-key replacement on Wang et al. works by replacing X_i with X_i0 = x_i0 P and setting U_i0 = u_i0 P − (R_i + k_i Ppub) with W_i0 = (h_i0 x_i0 + u_i0) Q (p.7).
- Theorems 1–2 state unforgeability in the standard model under CDHP against A1 (external, key-replacing) and A2 (internal, master-key-holding) via Lemmas 1–2 (pp.10–12).
- The paper claims seven informal properties: authentication, nonrepudiation, anonymity, unlinkability, traceability, anti-replay, and anti-impersonation (pp.12–13).
- Signing costs 2Tmul + 2Th ~= 2.3046 ms, reported as the lowest among the six compared schemes (pp.13–14).
- Single verification costs 2Tbp + 3Tmul + 3Tpa + 3Th ~= 24.1875 ms, less than four comparators but slightly more than Wang et al. at 23.0352 ms (pp.13–14).
- Aggregate verification costs 2Tbp + 3nTmul + 3nTpa + 3nTh ~= 3.5397n + 20.6478 ms with scaling plotted against signature count (pp.13–14).
- Communication is 2|G1| + timestamp = 260 bytes per signature and 2|G1| + n timestamps = 656 bytes at n = 100, equal to Kamil et al. and below the other comparators (pp.14–15).
- RSU capacity uses Rsc = p d / (Tver N v) with coverage d = 1000 m, N vehicles in 800 m, speed 5–20 m/s, and Tver stated as 34.0827 ms (p.15).

## Limitations

- Corrupted-signature localization still needs one-by-one or bisection search plus a penalty mechanism for repeat offenders (p.9).
- Aggregate verification grows with 3n multiplications, additions, and hashes, so batch cost rises linearly in n (pp.13–14).
- Interpretation: the Tver value of 34.0827 ms in the Rsc paragraph differs from the Table 4 single-verification figure of 24.1875 ms, so the stated Rsc inputs should be reused with care (pp.14–15).

## Related Work

- Wang et al. (2022) conditional privacy-preserving CLAS in the standard model is the cryptanalysed baseline scheme; see [[summaries/wang2022]] (pp.2–3, pp.5–6).
- Shim (2023) independently attacked the same Wang et al. scheme for KGC attacks and logical errors; see [[summaries/shim2023]] (p.3).
- Prior CLAS lineage (Boneh et al. aggregation, Al-Riyami–Paterson certificateless crypto, Gong et al. among others) is surveyed as background; see [[summaries/gong2023]] for one lineage member (p.3).

## Provenance

- Database + endpoint + params: MDPI Mathematics via DOI https://doi.org/10.3390/math11234766; publisher PDF fetched once; local text dump at research/clas-vanet-audit/sources/yuan2023.txt (pdftotext-layout, 948 lines)
- Access date: 2026-09-22
- Expected vs retrieved: expected 18-page open-access article Mathematics 2023, 11, 4766; retrieved matching text spanning pp.1–18
- Warnings: none; pairing equations use the reported standard-model bilinear map

Full-text
