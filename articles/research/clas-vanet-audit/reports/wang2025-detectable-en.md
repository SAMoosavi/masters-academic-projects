# A privacy-preserving certificate-less aggregate signature scheme with detectable invalid signatures for VANETs (Wang et al. 2025)

## Bibliographic

- Authors: Xiaoliang Wang, Peng Zeng, Guikai Liu, Kuan-Ching Li, Yuzhen Liu, Biao Hu, Francesco Palmieri (p.1)
- Year: 2025 | Venue: Journal of Information Security and Applications, vol. 89, article 104001 (p.1)
- DOI: 10.1016/j.jisa.2025.104001, available online 18 February 2025 (p.1)
- Corresponding author: Kuan-Ching Li, kuancli@pu.edu.tw (p.1)

## Problem

VANETs improve traffic efficiency but face reliable message exchange and privacy-preserving concerns (p.1, §Abstract).
Under resource-limited conditions many signed safety messages must be verified in a short period (p.1, §Abstract).
Vehicles broadcast safety messages every 100–300 ms under DSRC, while one-by-one verification costs bandwidth and computation (p.2, §1).
Some existing CLAS schemes lack an efficient invalid-signature detector or carry unnecessary verification overhead when aggregate verification fails (p.1–2, §Abstract–§1.2).

## Method

- Two-layer system model: AS plus TAs (KGC and TRA) form the upper layer while RSUs plus vehicles with OBUs communicating via DSRC form the lower layer (p.3, §2.4).
- Setup builds G1, G2 of prime order q with pairing e and generator P, picks t with Tpub=tP, k with Kpub=kP, y with Ypub=yP, and seven hashes H0,4,5,6 to Zq* and H1,2,3 to G1 (p.4, §3).
- TRA picks random ui and sets PIDi,1=H0(t) xor ui and PIDi,2=IDi xor H0(ui || TPi), outputting PIDi=(PIDi,1, PIDi,2, TPi) (p.4, §3).
- KGC computes Qi=H1(PIDi) and di=kQi over a secure channel, while the vehicle picks xi and sets Xi=xiP (p.4, §3).
- The vehicle picks ri with Ri=riP and forms W, U, gi, hi with Si=riW+gi xiU+hi di and sigma_i=(Ri, Si) (p.4–5, §3).
- RSU checks timestamps Ti, sums S=sum Si and R=sum Ri, and AS checks the aggregate equation with a correctness derivation (p.5, §3).
- On failure AS runs Algorithm 1 binary search that splits the group and verifies the left subgroup, recursing only where needed, unlike Algorithm 2 from [20,23] which re-aggregates and re-verifies the right subgroup unnecessarily (p.5, §3).
- TRA recovers ui=H0(t) xor PIDi,1 and IDi=H0(ui || TPi) xor PIDi,2 for accountability (p.5, §3).

### Setup (copied from audited summary, locators intact)

Setup uses a symmetric pairing with the following params (p.4, §3).

$$
\begin{aligned}
&e: G_1 \times G_1 \to G_2,\quad P \in G_1 % (p.4, §3) \\
&T_{pub}=tP,\quad K_{pub}=kP,\quad Y_{pub}=yP % (p.4, §3) \\
&H_{0,4,5,6}\to Z_q^*,\quad H_{1,2,3}\to G_1 % (p.4, §3)
\end{aligned}
$$

### Pseudonym and keys (copied from audited summary, locators intact)

Pseudonyms and keys follow the TRA/KGC issue flows (p.4, §3).

$$
\begin{aligned}
&PID_{i,1}=H_0(t)\oplus u_i % (p.4, §3) \\
&PID_{i,2}=ID_i\oplus H_0(u_i\|TP_i) % (p.4, §3) \\
&Q_i=H_1(PID_i),\quad d_i=kQ_i % (p.4, §3) \\
&X_i=x_iP % (p.4, §3)
\end{aligned}
$$

### Signature and aggregate verification (copied from audited summary, locators intact)

Signing forms Si below with sigma_i=(Ri, Si) (p.4–5, §3).

$$
\begin{aligned}
&R_i=r_iP,\quad W=H_2(K_{pub}\|P) % (p.4–5, §3) \\
&U=H_3(T_{pub}\|P) % (p.4–5, §3) \\
&g_i=H_4(PID_i\|m_i\|X_i\|K_{pub}\|T_i\|R_i) % (p.4–5, §3) \\
&h_i=H_5(PID_i\|m_i\|X_i\|T_{pub}\|T_i\|R_i) % (p.4–5, §3) \\
&S_i=r_iW+g_ix_iU+h_id_i % (p.4–5, §3)
\end{aligned}
$$

Aggregate verification checks 4 pairings as below (p.5, §3).

$$
\begin{aligned}
&S=\sum S_i,\quad R=\sum R_i % (p.5, §3) \\
&e(S,P)=e(R,W)\,e(\sum g_iX_i,U)\,e(\sum h_iQ_i,K_{pub}) % (p.5, §3)
\end{aligned}
$$

## Key findings

- Theorem 1 states the scheme is EUF-ACMAs under the ROM-based CDH assumption via Lemmas 1 and 2 (p.5, §4.1).
- Lemma 1 bounds Type-I success as eps' >= (1-zeta)^{qppk+qs}(1-(1-zeta)^n)eps after qppk partial-key, qupk user-key and qs signature queries (p.6, §4.1).
- Lemma 2 bounds Type-II success as eps' >= (1-zeta)^{qupk+qs}(1-(1-zeta)^n)eps with Kpub=kknownP and U=u(bP) embedding (p.6–7, §4.1).
- Algorithm 1 detects invalid signatures and TRA outputs the corresponding real identities, avoiding the redundant right-subgroup verification shown in Algorithm 2 (p.5, §3).
- Signature generation costs 2Thtp+4Tpm ~= 27.94 ms given Tbp=3.23 ms, Thtp=4.43 ms and Tpm=4.77 ms (p.8, §5).
- Aggregate verification costs 4Tbp+(n+2)Thtp+2nTpm, i.e. about 1418.78 ms at n=100 (p.8–9, §5–Table 3).
- At n=100 the scheme saves about 24.1% versus [27,30], about 25.0% versus [28], about 84.9% versus [31], about 34.5% versus [32] and about 35.8% versus [33] as claimed, while it is about 1.0% more expensive than [24] and about 0.5% more than [29]; only this scheme provides invalid-signature detection and [24,29] are marked insecure against Type-II (p.8–9, §5–Table 3).
- Conditional anonymity, unlinkability, traceability, replay resistance via Ti, impersonation resistance via CDH, and man-in-the-middle resistance are claimed with pseudonym and trace equations (p.7, §4.2).

## Limitations

- The authors state future work extends the approach to e-healthcare and optimizes toward pairing-free CLAS with a better detector (p.9, §6).
- Interpretation: H6 is defined in Setup with H0,4,5,6 to Zq* (p.4, §3), yet signing, verification and proofs use only H1–H5 (p.4–7, §3–§4.1).
- Interpretation: Ypub appears in params (p.4, §3), yet the verification equation uses only Kpub and Tpub (p.5, §3).
- Evaluation uses one desktop (i5-7300HQ, 8 GB, Windows 10, Java with JPBC) for timing Tbp, Thtp and Tpm (p.8, §5).

## Related Work

- Binary-tree detection priors [20,23,36]: when aggregate verification fails the verifier must detect invalid signatures with the corresponding real identities, but prior algorithms carry unnecessary re-verification overhead (p.2, §1.2; p.5, §3).
- Performance comparison set [24,27–33] in Table 3, of which [24,29] are marked insecure against Type-II attackers while only this scheme provides invalid-signature detection (p.8–9, §5–Table 3).
- CLAS lineage from Boneh et al. [34] aggregate signatures and Gong et al. [35] CLAS schemes and security model (p.2, §1.1).
- Vault neighbours for follow-up (navigation only, not paper claims): [[han2022]] and [[wang2022]] (detection-algorithm lineage [20,23], p.2, §1.2; p.5, §3).

## Provenance

- Database + endpoint + params: ScienceDirect (Elsevier) via DOI 10.1016/j.jisa.2025.104001; publisher PDF; local full-text dump at research/clas-vanet-audit/sources/wang2025-detectable.txt
- Access date: 2026-09-22
- Coverage: Full-text verified, 10 journal pages, frontmatter metadata matching header and Article Info (p.1)

Mode: Full-text
