# PCAS: Cryptanalysis and Improvement of Pairing-Free Certificateless Aggregate Signature Scheme With Conditional Privacy Preservation for VANETs (Gong, Gao, Guo 2023)

## Bibliographic

- Authors: Ziyan Gong, Tianhan Gao, Nan Guo | Year: 2023 | Venue: Ad Hoc Networks, volume 144, article 103134 | DOI: 10.1016/j.adhoc.2023.103134
- Affiliations: School of Software Engineering and School of Computer Science and Engineering, Northeastern University, Shenyang, China (p.1, header)
- Article history: received 26 June 2022, revised 11 December 2022, accepted 28 February 2023, available online 5 March 2023, Elsevier (p.1, Article Info)
- Length and keywords: 17 pages; CLAS, VANETs, conditional privacy preservation, ECC, batch verification (p.1, header)

## Problem

VANETs broadcast safety messages over open channels and face sniffing, modification, replay, injection and impersonation attacks, so message authentication plus driver-privacy protection is required (p.1, §1).
CLAS is presented as the multi-user authentication approach that removes certificate management of PKC and key escrow of IBC (p.1, Abstract).
Liu et al. [18] proposed LICLAS for HWMSN sensors and claimed existential forgery security under the CDH assumption, which this paper disputes (p.5, §4.2).
The paper shows an ordinary node holding only public material can recombine a valid signature into a forged signature on a new message, so LICLAS cannot resist forgery attacks (p.5–6, §4.2).
The open problem is therefore a low-overhead CLAS for VANET vehicle authentication with conditional privacy that survives such forgery without heavyweight operations (p.1, Abstract; p.2, Contributions).

## Method

- Forgery setup: the adversary A0 is an ordinary node holding only the system params, the pseudonym, the public key and one valid signature on a known message with timestamp (p.5, §4.2).
- Forgery hashes: A0 hashes the old message and the new message with current timestamp under H1–H4, then derives scalar weights from the old and new hash values to reweight each signature component (p.5, §4.2).
- Forgery output: A0 reuses the original first signature component and outputs a recombined scalar that satisfies the verification equation, and the paper derives correctness to confirm acceptance (p.5–6, §4.2).
- PCAS setup: TA picks s1 with T_pub = s1*P and KGC picks s2 with P_pub = s2*P, publishing params with ECC group of prime order q and hashes H, H1–H4 (p.7, §5.2).
- PCAS key issue and signing: KGC issues partial secrets verifiable in ECC arithmetic, the vehicle adds its own secret, and signing plus aggregation use only scalar multiplication and point addition (p.8, §5.2).
- PCAS proof and privacy: unforgeability is reduced to ECDLP in the random oracle model via the forking lemma, while pseudonyms with TA-only mapping give conditional privacy plus timestamp checks (p.9–12, §5.3.3–5.3.4; p.12, §5.4).
- PCAS evaluation method: timings use MIRACL with T_ecsm = 0.1652 ms and the Table 7 operation counts, with Veins/OMNeT++/SUMO simulation agreeing with the analysis (p.13–15, §6.1–6.2).

### Setup (copied from audited summary, locators intact)

Setup definitions below follow the paper System Initialization params with T_pub = s1*P and P_pub = s2*P over an ECC group of prime order q (p.7, §5.2).

$$
\begin{aligned}
&P \in \mathbb{G},\quad s_1,s_2\in\mathbb{Z}_q^* \\
&T_{pub}=s_1 P,\quad P_{pub}=s_2 P \\
&H:\mathbb{G}\times\mathbb{G}\rightarrow\{0,1\}^* \\
&H_1:\mathbb{G}\times\{0,1\}^*\times\{0,1\}^*\times\mathbb{G}\times\mathbb{G}\rightarrow\mathbb{Z}_q^* % (p.7, §5.2) \\
&H_2:\mathbb{G}\times\{0,1\}^*\times\{0,1\}^*\times\mathbb{G}\rightarrow\mathbb{Z}_q^* % (p.7, §5.2) \\
&H_3:\{0,1\}^*\times\mathbb{G}\times\{0,1\}^*\times\{0,1\}^*\times\mathbb{G}\rightarrow\mathbb{Z}_q^* % (p.7, §5.2) \\
&H_4:\{0,1\}^*\times\mathbb{G}\times\{0,1\}^*\times\{0,1\}^*\times\mathbb{G}\times\{0,1\}^*\rightarrow\mathbb{Z}_q^* % (p.7, §5.2)
\end{aligned}
$$

Hash domains above are the paper stated System Initialization domains; in use the pseudonym tuple is passed as the first argument (p.7, §5.2).

### Partial private key, secret value, key pair (copied from audited summary, locators intact)

Partial-key generation picks r_i, sets R_i = r_i*P, hashes the pseudonym and computes the partial secret d_{i,j} = r_i + s2*h_{1i,j} (p.8, §5.2).

$$
\begin{aligned}
&r_i\in\mathbb{Z}_q^*,\quad R_i=r_i P \\
&h_{1i,j}=H_1(pseu_{i,j},R_i,P_{pub}) \\
&d_{i,j}=r_i+s_2\cdot h_{1i,j} \\
&psk_{i,j}=(d_{i,j},R_i)
\end{aligned}
$$

Each vehicle picks its own secret x_i and publishes X_i = x_i*P (p.8, §5.2).

$$
\begin{aligned}
&x_i\in\mathbb{Z}_q^* \\
&X_i=x_i P
\end{aligned}
$$

The vehicle binds its secret to the partial key via alpha_{i,j} = H2(pseu_{i,j}, X_i) and D_{i,j} = R_i + alpha_{i,j}*X_i, keeping (d_{i,j}, x_i) secret (p.8, §5.2).

$$
\begin{aligned}
&SK_{i,j}=(d_{i,j},x_i) \\
&PK_{i,j}=(D_{i,j},R_i) \text{ where } D_{i,j}=R_i+\alpha_{i,j}X_i
\end{aligned}
$$

### Signature, aggregate, verification (copied from audited summary, locators intact)

Signing picks fresh y_{1i}, forms Y_{1i} = y_{1i}*P, hashes to h_{3i}, h_{4i} and computes the scalar w_i below with no heavyweight operator used anywhere (p.8, §5.2).

$$
\begin{aligned}
&y_{1i} \in \mathbb{Z}_q^* \\
&Y_{1i} = y_{1i}P \\
&\alpha_{i,j} = H_2(pseu_{i,j}, X_i) \\
&h_{3i} = H_3(m_i, pseu_{i,j}, Y_{1i}) \\
&h_{4i} = H_4(m_i, pseu_{i,j}, PK_{i,j}, t_i) \\
&w_i = [h_{3i}(d_{i,j} + \alpha_{i,j} \cdot x_i) + y_{1i} \cdot h_{4i}] \mod q \\ % (p.8, §5.2)
&\sigma_i = (Y_{1i}, w_i)
\end{aligned}
$$

The RSU aggregates by weighting each Y_{1i} with its h_{4i} and summing the scalars, outputting sigma = (Y, w) (p.8, §5.2).

$$
\begin{aligned}
&Y = \sum_{i=1}^n h_{4i} Y_{1i},\quad w = \sum_{i=1}^n w_i
\end{aligned}
$$

Single verification checks Eq. (1) and aggregate verification checks Eq. (2) using only ECC scalar multiplication and point addition, with no heavyweight operator on either side (p.8, §5.2; p.13, Table 3 pairing-free row).

$$
\begin{aligned}
w_i P - h_{4i} Y_{1i} &\stackrel{?}{=} h_{3i} D_{i,j} + h_{1i,j} P_{pub} \\
wP - Y &\stackrel{?}{=} \sum_{i=1}^n (h_{3i} D_{i,j} + h_{1i,j} P_{pub})
\end{aligned}
$$

## Key findings

- LICLAS [18] is forgeable: an ordinary node recombines a valid signature into a legal signature on a new message, since "still cannot resist the forgery" holds for its W_i design (p.5–6, §4.2).
- PCAS is a revised ECC-based CLAS for VANET vehicle authentication with new key generation and signing plus pseudonyms, using no Map-to-Hash operations and supporting RSU batch verification (p.2, Contributions; p.7–8, §5.2).
- Single (Theorem 1) and aggregate (Theorem 2) verification correctness hold by expanding w_i*P minus h_{4i}*Y_{1i} to h_{3i}*D_{i,j} plus h_{1i,j}*P_pub (p.8–9, §5.3.1–5.3.2).
- PCAS is existentially unforgeable against adaptive chosen-message attacks in the random oracle model under ECDLP, via Lemmas 1–2 for Type-I and Lemmas 3–4 for Type-II single and aggregate forgeries plus Type-III/IV analyses (p.9–12, §5.3.3–5.3.4).
- PCAS meets message authentication, integrity, non-repudiation, identity privacy, unlinkability, traceability and replay, impersonation, modification, man-in-the-middle and malicious-KGC resistance (p.12, §5.4).
- Transmission overhead falls 25% for one message (480 bit versus 640 bit) and 25% for 2000 messages at fixed aggregate size under equal security level (p.13, §6.1, Tables 4–5).
- Computation overhead falls 16.56% for one message (sign 0.1706 ms plus verify 0.6690 ms) and 25.34% for 2000 messages at identical O(1) sign/verify and O(n) aggregate complexity, with Veins delay about 25% below [18] at 500 messages (p.14–15, §6.1–6.2, Tables 7–9).

## Limitations

The authors state pseudonym generation is too complicated with too many entity interactions, leaving efficient self-computed pseudonyms to future work (p.16, §7).
The authors note failed aggregate verification forces re-verification with large overhead, alongside fixed rather than dynamic batch sizes and expired or unverified BSM buildup under dense traffic (p.16, §7).
Interpretation: the unforgeability proofs assume the random oracle model and ECDLP hardness with the forking lemma, so guarantees rest on those idealizations (p.9, §5.3.3).
Interpretation: efficiency evidence rests on MIRACL timings and Veins/OMNeT++/SUMO simulation rather than field deployment, so real-road behavior is untested (p.13–15, §6.1–6.2).

## Related Work

- The paper positions PCAS against pairing-based schemes [24,33,34] and ECC-based schemes [17,18,35], with transmission compared in Table 4 and computation in Table 7 (p.13–14, §6.1).
- Direct baseline is Liu et al. [18] LICLAS for HWMSNs, the cryptanalysis target improved into PCAS for VANETs with revised W_i and key generation (p.5–6, §4.2; p.7–8, §5.2).
- Vault neighbours for follow-up (navigation only, not paper claims): [[iqbal2023]] and [[cahyadi2022-clas-scheme]] (paper comparison set, p.13–14, §6.1).

## Provenance

- Database + endpoint + params: ScienceDirect (Elsevier) via DOI 10.1016/j.adhoc.2023.103134; publisher PDF; local full-text dump at research/clas-vanet-audit/sources/gong2023.txt
- Access date: 2026-09-22
- Coverage: Full-text verified, 17 pages, frontmatter metadata matching header and Article Info (p.1)

Mode: Full-text
