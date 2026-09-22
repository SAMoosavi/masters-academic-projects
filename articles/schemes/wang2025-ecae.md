[[wang2025-ecae]] — ECAE, NDN-IoT (not VANET); pairing-free, no e(...) notation.

## Setup

$$
\begin{aligned}
&G: \text{cyclic group of prime order } q,\quad P \in G: \text{generator} \\
&s \in \mathbb{Z}_q^*:\text{master secret},\quad P_{pub}=sP \\
&H_1:\{0,1\}^*\times G\rightarrow\mathbb{Z}_q^* \\
&H_2:\{0,1\}^*\times G\times G\rightarrow\mathbb{Z}_q^* \\
&H_3:\{0,1\}^*\times G\times G\times G\times G\rightarrow\mathbb{Z}_q^* \\
&params=(q,G,P,P_{pub},H_1,H_2,H_3) % (p.10)
\end{aligned}
$$

## Pseudonym Generation

$$
\begin{aligned}
&\text{KGC selects: } l_i \in \mathbb{Z}_q^* \\
&M_i = l_i P,\quad N_i = l_i P_{pub} \\
&AID_i = ID_i \oplus N_i \\
&\text{KGC verifies: } ID_i' = AID_i \oplus sM_i,\quad ID_i' \stackrel{?}{=} ID_i \\
&MID_i = H_1(T_i, sAID_i) \oplus ID_i' \\
&PID_i = \{MID_i, T_i\} % (p.11)
\end{aligned}
$$

## Key Generation

$$
\begin{aligned}
&\text{User: } x_i \in \mathbb{Z}_q^*,\quad X_i = x_i P \\
&\text{KGC: } r_i \in \mathbb{Z}_q^*,\quad R_i = r_i P \\
&h_{2i} = H_2(PID_i, R_i, P_{pub}) \\
&d_i = r_i + h_{2i}s \pmod q \\
&D_i = (d_i, R_i) \\
&\text{User verifies: } d_i P \stackrel{?}{=} R_i + h_{2i} P_{pub} \\
&K_i = h_{2i}X_i + R_i \\
&SK_i = d_i + h_{2i}x_i \\
&PK_i = (K_i, R_i) % (p.12-p.13)
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&u_i \in \mathbb{Z}_q^*,\quad U_i = u_i P \\
&h_{3i} = H_3(m_i, PID_i, PK_i, U_i, t_i) \\
&V_i = u_i + h_{3i}SK_i \pmod q \\
&\sigma_i = (U_i, V_i) % (p.13)
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&V = \sum_{i=1}^{n}V_i \\
&U = \sum_{i=1}^{n}U_i \\
&\sigma = (U, V) % (p.13-p.14)
\end{aligned}
$$

## Verification

### Single

$$
\begin{aligned}
&V_i P = U_i + h_{3i}K_i + h_{2i}P_{pub} % (p.13-p.14)
\end{aligned}
$$

### Aggregate

$$
\begin{aligned}
VP = U + \sum_{i=1}^{n}\left(h_{3i}K_i + h_{2i}P_{pub}\right) % (p.14)
\end{aligned}
$$
