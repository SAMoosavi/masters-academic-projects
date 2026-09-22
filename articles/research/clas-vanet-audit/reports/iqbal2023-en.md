# An Efficient and Secure Certificateless Aggregate Signature Scheme for Vehicular Ad hoc Networks

## Bibliographic
- Authors: Iqbal et al. | Year: 2023 | Venue: Future Internet 15, 266 | DOI: 10.3390/fi15080266 | Citations: n/a

## Problem
- VANET V2X messaging over open wireless channels faces bogus-message injection to RSUs and OBUs, so authenticity and integrity must be verified before use (p.2, §Introduction).
- PKI certificates add management and verification cost, ID-based schemes suffer key escrow, and classic certificateless issuance assumes a secure channel for partial keys (p.2, §Introduction).
- RSUs and OBUs have limited computing and storage, so authentication must stay efficient while providing authentication and nonrepudiation for the sender (p.3, §Introduction).
- Existing CLAS options are either not fully secured or entail high computation cost, motivating an HECC-based CLAS for vehicle-to-RSU authentication at 80-bit key size (p.1, §Abstract).

## Method
- Setup: DoT/TA picks genus-2 hyperelliptic curve Hyper over Fp, divisor D, private key Dot_p, and publishes Dot_pb with hash functions and params PB_frm (p.7, §Setup).
- PRPKG: user sends encrypted identity EID_usr plus F_usr over the open channel and DoT returns encrypted pair (P_usr, L_usr), removing the secure-channel assumption (p.7, §PRPKG).
- PRKG: user sets secret key SK_usr as (G_usr, P_usr) and public key PK_usr as (F_usr, L_usr) from local secret plus DoT contribution (p.7, §PRKG).
- SIGG: vehicle OBU picks T_OBU, computes W_OBU and H_3usr, forms S_OBU with (G_usr + P_usr), and sends sigma as (S_OBU, W_OBU) to RSU (pp.7–8, §SIGG).
- SIGV: RSU checks the divisor scalar-multiplication equation S_OBU·D − W_OBU against H_3usr scaled sum, and batches vehicles via aggregation (p.8, §SIGV).
- Aggregation generation and verification follow Han et al. eCLAS construction as cited for the batch phase (p.8, §SIGV).
Setup equations copied from Mathematical Notation (p.7, §Setup):
$$
\begin{aligned}
&Hyper \text{ (genus-2 hyperelliptic curve over } F_p), \quad D \text{ (divisor)} \\ % (p.7)
&Dot_p \in F_p \text{ (DoT/TA private key)}, \quad Dot_{pb} = Dot_p \cdot D \text{ (public key)} \\ % (p.7)
&H_{01}, H_{02}, H_{03} \text{ (hash functions)} \\ % (p.7)
&PB_{frm} = \{Hyper, D, H_{01}, H_{02}, H_{03}, F_p, Dot_{pb}\} % (p.7)
\end{aligned}
$$
PRPKG equations copied from Mathematical Notation (p.7, §PRPKG):
$$
\begin{aligned}
&G_{usr} \in F_p, \quad K_{usr} = G_{usr} \cdot Dot_{pb}, \quad EID_{usr} = E_{K_{usr}}(ID_{usr}) \\ % (p.7)
&F_{usr} = G_{usr} \cdot D, \quad \text{user sends } (EID_{usr}, F_{usr}) \text{ to DoT} \\ % (p.7)
&K_{usr} = F_{usr} \cdot Dot_p, \quad H_{1usr} = H_{01}(K_{usr}) \\ % (p.7)
&H_{2usr} = H_{02}(EID_{usr}, F_{usr}, Dot_{pb}) \\ % (p.7)
&J_{usr} \in F_p, \quad P_{usr} = J_{usr} + Dot_p \cdot H_{2usr}, \quad L_{usr} = J_{usr} \cdot D % (p.7)
\end{aligned}
$$
PRKG, SIGG and SIGV equations copied from Mathematical Notation (pp.7–8, §SIGV):
$$
\begin{aligned}
&SK_{usr} = (G_{usr}, P_{usr}) \\ % (p.7)
&PK_{usr} = (F_{usr}, L_{usr}) \\ % (p.7)
&T_{OBU} \in F_p, \quad W_{OBU} = T_{OBU} \cdot D \\ % (pp.7–8)
&H_{3usr} = H_{03}(EID_{usr}, F_{usr}, L_{usr}, W_{OBU}) \\ % (pp.7–8)
&S_{OBU} = T_{OBU} + H_{3usr} \cdot (G_{usr} + P_{usr}), \quad \sigma = (S_{OBU}, W_{OBU}) % (pp.7–8)
\end{aligned}
$$
$$
S_{OBU} \cdot D - W_{OBU} \stackrel{?}{=} H_{3usr} \cdot (F_{usr} + L_{usr} + H_{2usr} \cdot Dot_{pb}) % (p.8)
$$

## Key findings
- Total computation cost is 1.92 ms (0.96 ms sign + 0.96 ms verify), lowest among the four compared schemes (p.13, §6.2).
- Communication cost is |m| + 2|n| = 1160 bits, lowest among the four compared schemes in Table 6 (p.14, §6.3).
- Security-attribute comparison gives YES on all of UF1, UF2, SA, RA and PPK while comparators meet UF1/UF2 but not SA, RA or PPK (p.12, §6.1).
- Unforgeability against Type 1 forger FGR1 is proven in ROM under HCDLP with challenger given D and HDLP = x·D to extract x (pp.9–10, §Theorem 1).
- Unforgeability against Type 2 forger FGR2 is proven in ROM under HCDLP following the same divisor-log extraction game (pp.10–11, §Theorem 2).
- Sender and receiver anonymity hold via encrypted identities with partial-key delivery over an open channel without secure-channel issuance (p.1, §Abstract).

## Limitations
- Security proofs cover only Type-I/II forgers in the random oracle model under HCDLP without standard-model or stronger adversary analysis (pp.9–11, §Theorems).
- Aggregate generation and verification reuse the Han et al. eCLAS construction rather than introducing a new aggregation proof (p.8, §SIGV).
- Performance evaluation is analytic MIRACL timing on one desktop CPU, not a VANET deployment or network measurement (p.13, §6.2).
- HECC 80-bit genus-2 claims rest on the paper-stated equivalence level without independent key-size or side-channel evaluation (p.5, §3).

## Related Work
- [[gong2023]] — pairing-free CLAS cryptanalysis and improvement for VANETs, comparator context for Type-I/II claims.
- [[cahyadi2022-clas-scheme]] — certificateless aggregate signature for VANET privacy, one of the Table 5 and Table 6 comparators.
- [[han2022]] — eCLAS construction reused for the aggregate generation and verification phase in §5.

## Provenance
- Database + endpoint + params: MDPI publisher PDF via DOI 10.3390/fi15080266, Future Internet 15, 266, open-access PDF.
- Access date: 2026-09-21; Source key: YLVWD2J6; text dump: research/clas-vanet-audit/sources/iqbal2023.txt; audit ground truth: summaries/iqbal2023.md.
- Expected-vs-retrieved: expected 17-page MDPI article via DOI matched retrieved publisher PDF content and text dump line count.
- Mode: HECC divisor arithmetic only, verified full text with Theorems pp.9–11 and Table 2 p.12.

Full-text
