# A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs

## Bibliographic
- Authors: Qiuling Yue, Weijian Jiang, Hong Lei | Year: 2025 | Venue: Scientific Reports 15:23663 | DOI: 10.1038/s41598-025-08656-1 | Received 16 January 2025, Accepted 23 June 2025

## Problem
- Zheng et al.'s pairing-free CLAS for VANETs is vulnerable to ephemeral rogue-key attacks exploiting random nonces to derive an ephemeral rogue key. (p.1)
- The adversary forges an aggregate signature with this rogue key plus its own private key, and the forgery passes verification undetected. (p.1)
- Existing pairing-free CLAS schemes stay exposed to such forgery despite avoiding certificate-management overhead. (p.1)
- The paper fixes this with an aggregator's signature plus simultaneous verification of aggregator and aggregate signatures. (p.1)

## Method
- The scheme uses ECC under ECDLP with a fully trusted TA for identity recovery and pseudonyms and an honest-but-curious non-colluding KGC for partial keys. (p.3, §System assumptions)
- System params are {P,q,E,G,H0-H4,Kpub,Tpub} with master keys a (Kpub=aP) and b (Tpub=bP), and vehicles register Xi=xiP with TIDi=RIDi xor H0(xiTpub) for TA-issued PIDi. (p.7)
- The KGC issues Ri=riP, H2i=H2(PIDi||Ri||Kpub||Xi||Ti), di=ri+aH2i masked as Di=di xor H0(aXi) for vehicle recovery d'i=Di xor H0(Kpub xi). (p.7–p.8)
- Each vehicle signs ui, Ui=uiP, H3i=H3(Mi||PIDi||PKi||Kpub||Ti||ti), H4i=H4(Mi||PIDi||PKi||Ui||Ti||ti), si=ui+d'iH3i+xiH4i, sigma_i=(Ui,si). (p.8)
- The RSU aggregator adds its own signature over M0=(Uset,PKset,PIDset) as s0=u0+d0H30+H40x0 and outputs sigma=(U0..Un,s0,s) with s=sum si. (p.8–p.9)
- Verification is two-step: s0P=U0+(R0+H20Kpub)H30+H40X0, then sP=sum Ui+sum(Ri+KpubH2i)H3i+sum XiH4i+s0P. (p.9)
- Construction uses only scalar multiplication/addition and hashes to Zq* with no bilinear pairing e(...) in Sign/Aggregate/Verify. (p.8–p.9)

### Setup
$$
\begin{aligned}
&P \in \mathbb{G},\ q\ \text{prime},\ P\ \text{generator} \\
&H_0,H_1,H_2,H_3,H_4:\{0,1\}^*\to\mathbb{Z}_q^* \\
&a,b\in\mathbb{Z}_q^*\ (\text{KGC, TA masters}) \\
&K_{pub}=aP,\ T_{pub}=bP \\
&\text{params}=\{P,q,\mathbb{E},\mathbb{G},H_0..H_4,K_{pub},T_{pub}\}
\end{aligned}
$$ (p.7)

### Pseudonym identity generation
$$
\begin{aligned}
&x_i\in\mathbb{Z}_q^*,\ X_i=x_iP \\
&TID_i=RID_i\oplus H_0(x_iT_{pub}) \\
&TA:RID_i=TID_i\oplus H_0(bX_i) \\
&PID_i=RID_i\oplus H_1(bX_i,T_i,t'_i)
\end{aligned}
$$ (p.7)

### Partial private key extract
$$
\begin{aligned}
&r_i\in\mathbb{Z}_q^*,\ R_i=r_iP \\
&H_{2i}=H_2(PID_i\|R_i\|K_{pub}\|X_i\|T_i) \\
&d_i=r_i+a\cdot H_{2i} \\
&D_i=d_i\oplus H_0(a\cdot X_i)
\end{aligned}
$$ (p.7–p.8)

### Vehicle key generation
$$
\begin{aligned}
&d'_i=D_i\oplus H_0(K_{pub}\cdot x_i) \\
&H_{2i}=H_2(PID_i\|R_i\|K_{pub}\|X_i\|T_i\|t_i) \\
&d'_iP=R_i+H_{2i}\cdot K_{pub} \\
&SK_i=(x_i,d'_i),\ PK_i=(X_i,R_i)
\end{aligned}
$$ (p.7–p.8)

### Signature
$$
\begin{aligned}
&u_i\in\mathbb{Z}_q^*,\ U_i=u_iP \\
&H_{3i}=H_3(M_i\|PID_i\|PK_i\|K_{pub}\|T_i\|t_i) \\
&H_{4i}=H_4(M_i\|PID_i\|PK_i\|U_i\|T_i\|t_i) \\
&s_i=u_i+d'_i\cdot H_{3i}+x_i\cdot H_{4i} \\
&\sigma_i=(U_i,s_i)
\end{aligned}
$$ (p.8)

### Individual verification
$$
\begin{aligned}
&s_iP=U_i+(R_i+H_{2i}\cdot K_{pub})\cdot H_{3i} \\
&\quad+X_i\cdot H_{4i}
\end{aligned}
$$ (p.8)

### Aggregate with aggregator signature
$$
\begin{aligned}
&M_0=(U_{set},PK_{set},PID_{set}) \\
&U_0=u_0P \\
&H_{30}=H_3(M_0\|PID_0\|PK_0\|K_{pub}\|t_{set}) \\
&H_{40}=H_4(M_0\|PID_0\|PK_0\|U_0\|t_{set}) \\
&s_0=u_0+d_0\cdot H_{30}+H_{40}\cdot x_0 \\
&s=\sum_{i=0}^{n}s_i \\
&\sigma=(U_0,..,U_n,s_0,s)
\end{aligned}
$$ (p.8–p.9)

### Two-step aggregate verification
$$
\begin{aligned}
&s_0P=U_0+(R_0+H_{20}\cdot K_{pub})\cdot H_{30} \\
&\quad+H_{40}\cdot X_0 \\
&sP=\sum U_i+\sum(R_i+K_{pub}\cdot H_{2i})\cdot H_{3i} \\
&\quad+\sum X_i\cdot H_{4i}+s_0P
\end{aligned}
$$ (p.9)

## Key findings
- Table 1 gives the scheme pairing-free status (yes) versus pairing-based Wang/Mei/Zhong/Kumar (no), with ephemeral rogue-key resistance (yes) where Zheng et al. fail (no). (p.2, Table 1)
- The fix is described as "simultaneous verification of both…" aggregator and aggregate signatures to block rogue-key forgery. (p.1)
- Security is argued for exactly two attacker types — key-replacing vehicles without the KGC key and malicious KGC without key replacement — plus selective/ephemeral rogue-key attackers; no Type-III model is stated. (p.9–p.10, §Security analysis)
- Individual Sign costs 2Th+Tpm and individual Verify 3Th+3Tpa+4Tpm; aggregate Verify costs 3(n+1)Th+4(n+1)Tpa+(3n+5)Tpm with no Tbp/Thtp pairing terms. (p.11, Table 4)
- Communication per message is 3|G|+3|Zq*| with |G|=320 bits and |Zq*|=160 bits (pairing |G1|=1024 bits for competitors only), timestamps omitted; the p.12 text value 4|G|+3|Zq*| describes Zheng et al. senders, not our row. (p.12–p.13, Table 5)
- The authors conclude the scheme is "unforgeable against two types of attackers…" under ECDLP with negligible aggregator-signature overhead. (p.14)

## Limitations
- The underlying CLS unforgeability proof is delegated to Zheng et al. rather than re-proven; only the XOR-protection and aggregator-signature delta plus rogue-key mitigation are argued directly. (p.10, §Security analysis)
- Aggregate verification costs slightly more than Zheng et al. (extra s0 term: 3(n+1)Th+4(n+1)Tpa+(3n+5)Tpm) as the price of the countermeasure. (p.11, Table 4)
- The threat model covers only the two stated attacker types plus ephemeral rogue-key/selective-key attacks, with no Type-III adversary; the TA is fully trusted and never compromised. (p.3, p.9–p.10)
- The KGC is honest-but-curious and non-colluding, so KGC-user collusion lies outside the proven model. (p.3, §System assumptions)

## Related Work
- [[zheng2023]] — vulnerable pairing-free CLAS fixed by this paper's aggregator-signature countermeasure.
- [[wu2025-collusion]] — collusion-resistant CLAS comparator for VANETs.
- [[wu2025-pseudonyms]] — pseudonym-based CLAS authentication comparator for VANETs.

## Provenance
- Database + endpoint + params: Zotero local storage / key V2SN7KC2 (publisher PDF via Nature Scientific Reports DOI 10.1038/s41598-025-08656-1)
- Access date: 2026-09-21
Full-text
