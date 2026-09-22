# Pairing-Free Certificateless Aggregate Signcryption for Vehicular Sensor Networks (dai2022)

## Bibliographic
- Authors: Dai, Cong; Xu, Zhongwei | Year: 2023 | Venue: IEEE Internet of Things Journal 10(6), pp. 5063-5072 | DOI: 10.1109/JIOT.2022.3222237

## Problem
- Vehicles in VSNs exchange urgent or sensitive data over open V2V/V2I wireless channels exposed to impersonation, tampering, and tracking risks (p.5063, Abstract).
- Prior CLASC constructions rely on costly bilinear pairings and MapToPoint hashes, which burden constrained OBUs and RSUs (p.5063, §I-A).
- Existing pairing-free ECC CLASC schemes stay vulnerable to ESL attacks and miss required properties such as forward secrecy and traceability (p.5064, §II).
- Rush-hour traffic surges demand simultaneous authentication of multisource data with single aggregated verification to cut congestion and cost (p.5063, §I-A).

## Method
### Setup
- KGC initializes cyclic ECC group, master key pair, and hashes H1/H2/H3 as public params with no pairings anywhere (p.5065, Algorithm 1).
$$
\begin{aligned}
&G \text{ order } q, P \text{ generator} \\
&s \in Z_q^*, P_{Pub} = sP \\
&H_1,H_2,H_3:\{0,1\}^* \to Z_q^* \\
&params=\{G,q,P,P_{Pub},H_1,H_2,H_3\}
\end{aligned}
$$
### Partial-key extract
- KGC issues partial key d_ID from fresh y_ID bound to ID via H1, checked by receiver with ECC equation (p.5065, Algorithm 2).
$$
\begin{aligned}
&y_{ID} \in_R Z_q^*, Y_{ID}=y_{ID}P \\
&h_{ID}=H_1(ID,Y_{ID},P_{Pub}) \\
&d_{ID}=y_{ID}+h_{ID}s \bmod q
\end{aligned}
$$
- Registration sanity check uses d_ID P equality before accepting partial keys (p.5067, §IV-C).
$$
d_{ID}P=Y_{ID}+h_{ID}P_{Pub}
$$
### Set secret value
- Entity sets secret x_ID and combined K_ID with key pair sk_ID and PK_ID locally (p.5065, Algorithm 3).
$$
\begin{aligned}
&x_{ID} \in_R Z_q^*, X_{ID}=x_{ID}P \\
&K_{ID}=X_{ID}+Y_{ID} \\
&sk_{ID}=(x_{ID},d_{ID}) \\
&PK_{ID}=(K_{ID},Y_{ID})
\end{aligned}
$$
### Signcrypt
- Sender randomizes u_i from dual nonces, derives session K_i to receiver, then encrypts m_i and binds w_i signature (p.5066, Algorithm 4).
$$
\begin{aligned}
&u_{i,1},u_{i,2} \in_R Z_q^* \\
&u_i=(u_{i,1}x_{ID_i}+u_{i,2}d_{ID_i}) \\
&\times (x_{ID_i}+d_{ID_i})^{-1} \\
&U_i=u_iP \\
&h_{ID_B}=H_1(ID_B,Y_{ID_B},P_{Pub}) \\
&K_i=u_i(K_{ID_B}+h_{ID_B}P_{Pub}) \\
&z_i=H_2(ID_B,U_i,K_i,t_i) \\
&c_i=m_i \oplus z_i \\
&h_i=H_3(m_i,ID_i,PK_{ID_i},U_i,K_i,t_i) \\
&w_i=u_i+h_i(x_{ID_i}+d_{ID_i}) \bmod q \\
&\sigma_i=(U_i,c_i,w_i)
\end{aligned}
$$
### Unsigncrypt and individual verification
- Receiver recomputes K_i and m_i via DEC, then checks ECC equation with scalar multiplication only and no pairings (p.5066, Algorithm 5).
$$
\begin{aligned}
&K_i=(x_{ID_B}+d_{ID_B})U_i \\
&m_i=c_i \oplus z_i
\end{aligned}
$$
$$
w_iP=U_i+h_i(K_{ID_i}+h_{ID_i}P_{Pub})
$$
### Aggregate
- RSU sums w_i into single W while keeping per-source U_i and c_i for many-to-one forwarding (p.5066, Algorithm 6).
$$
\begin{aligned}
&W=\sum w_i \\
&\sigma=(\{U_i,c_i\},W)
\end{aligned}
$$
### Aggregate verification
- AS decrypts each m_i via DEC then verifies whole batch with one aggregated ECC equation (p.5066, Algorithm 7).
$$
\begin{aligned}
&WP=\sum U_i \\
&+\sum h_i(K_{ID_i}+h_{ID_i}P_{Pub})
\end{aligned}
$$

## Key findings
- Scheme achieves IND-CCA2 confidentiality under CDH in ROM against Type-I and Type-II adversaries (p.5067, Theorem 1).
- Scheme achieves EUF-CMA unforgeability under ECDL in ROM via Forking Lemma games for both adversary types (p.5069, Theorem 2).
- ProVerif under Dolev-Yao confirms key and message delivery with reachability and event-order queries succeeding (p.5069, §V-A).
- Informal analysis adds nonrepudiation, forward secrecy, MITM/DoS/replay/ESL resistance, and pseudonym conditional traceability (p.5070, §V-B).
- For n=350, aggregate unsigncryption takes 466.4302 ms, beating prior schemes by up to 92.99% computation efficiency (p.5071, §VI).
- Aggregation cuts about a quarter of cost: 24.78% time and 24.93% size savings at n=350 versus individual handling (p.5071, §VI).

## Limitations
- Timing figures assume 160-bit elements and messages on MIRACL with I7-4770 3.40 GHz and 4 GB setup (pp.5070-5071, §VI-B).
- Traffic load assumes DSRC safety messages every 300 ms yielding about 350 messages per second for 100 vehicles (p.5070, §VI-B).
- Comparison covers only four CLASC schemes for IoT with output size as communication proxy, not live VANET deployment (p.5070, §VI).
- Misbehavior filtering and blockchain record-keeping are sketched without measured overhead or voting latency analysis (p.5067, §IV-C).

## Related Work
- [[wu2025-signcryption]] security-enhanced CLASC for VANETs as pairing-based predecessor contrasted with this pairing-free design (p.5064, §II).
- [[zhang2024]] pairing-free certificateless signcryption for IoMT as adjacent ECC signcryption baseline in related schemes (p.5064, §II).

## Provenance
- Database + endpoint + params: IEEE Xplore DOI endpoint for 10.1109/JIOT.2022.3222237 plus local full-text dump read via pdftotext-layout
- Access date: 2026-09-22 (local dump retrieved 2026-09-21, report built 2026-09-22)
- Expected-vs-retrieved: expected 10-page article pp.5063-5072; retrieved full 10-page PDF text pp.5063-5072 in full
Full-text
