# A Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs (wang2022)

## Bibliographic
- Authors: Huiwen Wang, Liangliang Wang, Kai Zhang, Jinguo Li, Yiyuan Luo | Year: 2022 | Venue: IEEE Access 10, pp.15605-15618 | DOI: 10.1109/ACCESS.2022.3147595

## Problem
- VANETs face tensions between vehicle privacy protection, authenticity of transmitted information, and bandwidth limits (p.1, Abstract).
- Prior CLAS schemes cannot resist malicious-but-passive KGC attacks, replay and link attacks, nor trace malicious vehicles' real identities (p.1, Abstract).
- Previous VANET CLAS security was proven only in the random oracle model (ROM), which may be insecure in actual implementation (p.1, Abstract; p.2, §I).
- Most CLAS schemes still suffer large verification delays and high communication overhead, motivating full aggregation with conditional privacy (p.1, Abstract).

## Method
### Setup
- KGC picks P, Q, master secret s with Ppub = sP and TRA picks tracking key k with K = kP, publishing params while s, k stay secret (p.6, §V.A).
$$
\begin{aligned}
&G_1, G_2: \text{cyclic groups of prime order } q \\
&P, Q \in G_1,\quad e: G_1 \times G_1 \to G_2 \\
&s \in \mathbb{Z}_q^*,\quad P_{pub} = sP \\
&k \in \mathbb{Z}_q^*,\quad K = kP \\
&H_1: G_1 \to \mathbb{Z}_q^* \\
&H_2: \{0,1\}^* \times G_1 \times G_1 \to \mathbb{Z}_q^* \\
&H_3: \{0,1\}^* \times \{0,1\}^* \times G_1^6 \to \mathbb{Z}_q^*
\end{aligned}
$$
### Pseudonym generation
- TRA assigns each vehicle pseudonym PIDi,j from true IDi and recovers IDi with tracking key k when tracing malicious vehicles (p.6, §V.B).
$$
\begin{aligned}
&t_{i,j} \in_R \mathbb{Z}_q^*,\quad T_{i,j} = t_{i,j}P \\
&PID_{i,1,j} = ID_i \oplus H_1(kP + T_{i,j}) \\
&PID_{i,j} = \{PID_{i,1,j}, T_{i,j}\}
\end{aligned}
$$
### Partial Private Key Extract
- KGC generates partial private key di as below and sends it to the vehicle via SSL (p.6, §V.C).
$$
\begin{aligned}
&r_i \in_R \mathbb{Z}_q^*,\quad R_i = r_i P \\
&k_i = H_2(PID_{i,j}, R_i) \\
&d_i = r_i + k_i \cdot s \bmod q
\end{aligned}
$$
### Set Secret Value and keys
- Vehicle picks secret xi with Xi = xiP, so public key is PKi = (Xi, Ri) and full private key is (di, xi) (p.6, §V.D).
$$
\begin{aligned}
&x_i \in_R \mathbb{Z}_q^*,\quad X_i = x_i P \\
&PK_i = (X_i, R_i),\quad SK_i = (d_i, x_i)
\end{aligned}
$$
### Signature
- OBU picks timestamp TSi and randomness ui, computes below, and sends (mi, TSi, PKi, PIDi,j, Ui, Vi, Wi) with each pseudonym used once (p.6, §V.E).
$$
\begin{aligned}
&u_i \in_R \mathbb{Z}_q^*,\quad U_i = u_i P,\quad V_i = u_i Q \\
&h_i = H_3(m_i \Vert TS_i, PID_{i,j}, U_i, V_i, W_i, PK_i) \\
&W_i = (d_i + h_i \cdot x_i) Q + V_i \\
&\sigma_i = (U_i, V_i, W_i)
\end{aligned}
$$
### Aggregate
- RSU sums the n components and forwards the aggregate sigma = (U, V, W) to the TMC (p.6, §V.G).
$$
\begin{aligned}
&U = \sum_{i=1}^n U_i,\quad V = \sum_{i=1}^n V_i \\
&W = \sum_{i=1}^n W_i,\quad \sigma = (U, V, W)
\end{aligned}
$$
### Verification
- RSU checks TSi freshness then single equation, and TMC checks all TSi then the aggregate equation with only two pairings (p.6, §V.F, §V.H).
$$
\begin{aligned}
&e(W_i, P) \stackrel{?}{=} e(R_i + k_i P_{pub} + h_i X_i + U_i, Q) \\
&e(W, P) \stackrel{?}{=} e(\sum R_i + \sum k_i P_{pub} + \sum h_i X_i + U, Q)
\end{aligned}
$$

## Key findings
- Scheme is EUF-CMA secure against Type I adversaries (public-key replacement, no master secret) in the SM by reduction to CDHP (Theorem 1/Lemma 1) (p.7, §VI.A).
- Scheme is EUF-CMA secure against Type II adversaries, i.e. malicious-but-passive KGC holding master secret s, in the SM by reduction to CDHP (Theorem 2/Lemma 2) (p.8, §VI.A).
- Aggregate verification needs only two bilinear pairings with zero map-to-point operations anywhere in the scheme (p.1, Abstract; p.2, §I; p.10, §VII.B).
- Signing costs 3Tmul + Tpa + Th approx 5.8518 ms under the MIRACL timing evaluation (p.10, §VII.B).
- Single-signature verification costs 2Tbp + 2Tmul + 3Tpa + 2Th approx 34.0828 ms with only two pairings (p.10, §VII.B).
- Aggregate verification costs 2Tbp + 2nTmul + 3nTpa + 2nTh approx 3.9352n + 30.1476 ms, scaling linearly and reported below prior schemes (p.10, §VII.B).
- Communication with G1 = 128 bytes and timestamp 4 bytes is 3x128 + 4 = 388 bytes single and 3x128 + 4n = 784 bytes aggregate at n = 100 (p.11, §VII.C).
- Practicability uses RSU capacity Rsc = p(dot)d/(Tver(dot)N(dot)v) with Tver = 34.0828 ms, d = 1000 m, N = 600-800 m, v = 5-20 m/s, about eight signatures per 300 ms (p.12, §VII.D).
- Security-attribute comparison in Table 2 reports this scheme satisfies all listed attributes while comparators satisfy only some, and notes comparators are ROM-proven versus this SM-proven scheme (p.9, §VII.A).

## Limitations
- Aggregate communication is slightly larger than schemes [15] and [20] (784 vs 656 bytes at n = 100), acknowledged as traded against lower computation and SM proofs (p.12, §VII.C).
- Per-message timestamps TSi checked by RSU/TMC are the sole stated replay defense, so correctness depends on clock synchronization and freshness windows (p.6, §V.F, §V.H; p.8, §VI.B).
- Evaluation is analytic (MIRACL timings plus Rsc formula) rather than large-scale live VANET deployment measurement per the reported method (pp.9-12, §VII.B-D).

## Related Work
- Design rationale combines Mei et al. [15] (conditional privacy-preserving CLAS with four pairings in aggregate verification, ROM-proven) with Deng et al. [38] (first SM-proven CLAS, lacking replay resistance and VANET anonymity) (p.3, §III).
- Performance comparators are prior CLAS schemes [9], [15], [18]-[22] evaluated in Tables 4-5 and Figs. 5-7 for computation and communication overhead (p.10, §VII.B-C).

## Provenance
- Database + endpoint + params: IEEE Xplore DOI endpoint for 10.1109/ACCESS.2022.3147595 plus local full-text dump read via pdftotext-layout with no params beyond DOI
- Access date: 2026-09-22 (local dump retrieved 2026-09-21, report built 2026-09-22)
- Expected-vs-retrieved: expected 14-page article pp.15605-15618; retrieved full 14-page PDF text pp.15605-15618 in full
Full-text
