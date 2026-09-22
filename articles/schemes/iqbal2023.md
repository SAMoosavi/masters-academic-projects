[[iqbal2023]]

## Setup

$$
\begin{aligned}
&Hyper \text{ (genus-2 hyperelliptic curve over } F_p), \quad D \text{ (divisor)} \\
&Dot_p \in F_p \text{ (DoT/TA private key)}, \quad Dot_{pb} = Dot_p \cdot D \text{ (public key)} \\
&H_{01}, H_{02}, H_{03} \text{ (hash functions)} \\
&PB_{frm} = \{Hyper, D, H_{01}, H_{02}, H_{03}, F_p, Dot_{pb}\}
\end{aligned}
$$

## Partial Private Key Extract (PRPKG)

$$
\begin{aligned}
&G_{usr} \in F_p, \quad K_{usr} = G_{usr} \cdot Dot_{pb}, \quad EID_{usr} = E_{K_{usr}}(ID_{usr}) \\
&F_{usr} = G_{usr} \cdot D, \quad \text{user sends } (EID_{usr}, F_{usr}) \text{ to DoT (open channel)} \\
&K_{usr} = F_{usr} \cdot Dot_p, \quad H_{1usr} = H_{01}(K_{usr}) \\
&H_{2usr} = H_{02}(EID_{usr}, F_{usr}, Dot_{pb}) \\
&J_{usr} \in F_p, \quad P_{usr} = J_{usr} + Dot_p \cdot H_{2usr}, \quad L_{usr} = J_{usr} \cdot D \\
&\text{DoT returns } PPKG_{usr} = E_{K_{usr}}(P_{usr}, L_{usr}) \text{ over open channel}
\end{aligned}
$$

## Set Private/Public Key (PRKG)

$$
\begin{aligned}
&SK_{usr} = (G_{usr}, P_{usr}) \\
&PK_{usr} = (F_{usr}, L_{usr})
\end{aligned}
$$

## Signature (SIGG, by OBU)

$$
\begin{aligned}
&T_{OBU} \in F_p, \quad W_{OBU} = T_{OBU} \cdot D \\
&H_{3usr} = H_{03}(EID_{usr}, F_{usr}, L_{usr}, W_{OBU}) \\
&S_{OBU} = T_{OBU} + H_{3usr} \cdot (G_{usr} + P_{usr}), \quad \sigma = (S_{OBU}, W_{OBU})
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&\text{Aggregate signature generation and verification follow Han et al. eCLAS [29]} \\
&\text{(individual } \sigma = (S_{OBU}, W_{OBU}) \text{ verified via the divisor equation below)}
\end{aligned}
$$

## Verification (SIGV, by RSU)

$$
\begin{aligned}
&S_{OBU} \cdot D - W_{OBU} \stackrel{?}{=} H_{3usr} \cdot (F_{usr} + L_{usr} + H_{2usr} \cdot Dot_{pb})
\end{aligned}
$$

## Provenance

- Mode: Full-text
- Source: publisher PDF via Zotero storage key YLVWD2J6, dump at research/clas-vanet-audit/sources/iqbal2023.txt
- Accessed: 2026-09-21
- Access date: 2026-09-21
- Database/endpoint: MDPI publisher PDF via doi 10.3390/fi15080266, Zotero storage key YLVWD2J6
- What changed: replaced generic ECC template with HECC divisor construction verified against §5, pp.6–8 (no bilinear pairing anywhere)
