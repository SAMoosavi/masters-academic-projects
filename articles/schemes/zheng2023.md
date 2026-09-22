[[zheng2023]]

## Setup

$$
\begin{aligned}
&P \in \mathbb{G},\quad a \in \mathbb{Z}_q^*,\quad b \in \mathbb{Z}_q^* \\
&K_{pub} = aP,\quad T_{pub} = bP \\
&H_1: \{0,1\}^* \times \mathbb{G} \times \mathbb{G} \rightarrow \mathbb{Z}_q^* \\
&H_2: \{0,1\}^* \times \mathbb{G} \times \mathbb{G} \times \mathbb{G} \times \{0,1\}^* \rightarrow \mathbb{Z}_q^* \\
&H_3: \{0,1\}^* \times \{0,1\}^* \times \mathbb{G} \times \mathbb{G} \times \mathbb{G} \times \{0,1\}^* \rightarrow \mathbb{Z}_q^*
\end{aligned}
$$

## Partial Private Key Extract

$$
\begin{aligned}
&r_i \in \mathbb{Z}_q^*,\quad R_i = r_i P \\
&h_{1i} = H_1(PID_i, R_i, K_{pub}) \\
&d_i = r_i + a \cdot h_{1i} \pmod q
\end{aligned}
$$

## Set Secret Value

$$
\begin{aligned}
&x_i \in \mathbb{Z}_q^* \\
&X_i = x_i P
\end{aligned}
$$

## Set Private/Public Key

$$
\begin{aligned}
&SK_i = (d_i, x_i) \\
&PK_i = (X_i, R_i)
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&u_i \in \mathbb{Z}_q^*,\quad U_i = u_i P \\
&h_{2i} = H_2(PID_i, X_i, K_{pub}, R_i, T_i) \\
&h_{3i} = H_3(PID_i, M_i, PK_i, U_i, T_i) \\
&s_i = u_i + d_i \cdot h_{2i} + x_i \cdot h_{3i} \pmod q \\
&\sigma_i = (U_i, s_i)
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&s = \sum_{i=1}^n s_i \pmod q \\
&U = \sum_{i=1}^n U_i \\
&\sigma = (U_1, \ldots, U_n, s)
\end{aligned}
$$

## Verification

Single:

$$
\begin{aligned}
&h_{1i} = H_1(PID_i, R_i, K_{pub}) \\
&h_{2i} = H_2(PID_i, X_i, K_{pub}, R_i, T_i) \\
&h_{3i} = H_3(PID_i, M_i, PK_i, U_i, T_i) \\
&s_i P \stackrel{?}{=} U_i + (R_i + h_{1i} \cdot K_{pub}) \cdot h_{2i} + X_i \cdot h_{3i}
\end{aligned}
$$

Aggregate:

$$
\begin{aligned}
&h_{1i} = H_1(PID_i, R_i, K_{pub}) \\
&h_{2i} = H_2(PID_i, X_i, K_{pub}, R_i, T_i) \\
&h_{3i} = H_3(PID_i, M_i, PK_i, U_i, T_i) \\
&U = \sum_{i=1}^n U_i \\
&sP \stackrel{?}{=} U + \sum_{i=1}^n (R_i + h_{1i} \cdot K_{pub}) \cdot h_{2i} + \sum_{i=1}^n X_i \cdot h_{3i}
\end{aligned}
$$

## Provenance

- Database + endpoint + params: local publisher-PDF read via Zotero storage key Z4RTIJNI, extracted with pdftotext -layout to research/clas-vanet-audit/sources/zheng2023.txt.
- Access date: 2026-09-21.
- Mode: Full-text.
