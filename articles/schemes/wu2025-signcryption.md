[[wu2025-signcryption]]

## Setup (p.6, §5.2)

Source: System-Setup (p.6, §5.2).

$$
\begin{aligned}
&G(F_q) \text{ elliptic-curve group of prime order } q \text{ with generator } P \\
&\mu \in \mathbb{Z}_q^*,\quad P_{pub} = \mu P \\
&H_1:\{0,1\}^* \rightarrow \mathbb{Z}_q^*,\quad H_2:\{0,1\}^* \rightarrow \{0,1\}^{l_1},\quad H_3:\{0,1\}^* \rightarrow \{0,1\}^{l_2} \\
&H_4, H_5:\{0,1\}^* \rightarrow \mathbb{Z}_q^* \\
&params = \{G, P, q, P_{pub}, H_1, H_2, H_3, H_4, H_5\}
\end{aligned}
$$

## Pseudonym-Generation (p.6, §5.2; p.9, §6.3)

Source: Pseudonym-Generation (p.6, §5.2); Anonymity analysis (p.9, §6.3).

$$
\begin{aligned}
&\alpha_i \in_R \mathbb{Z}_q^*,\quad ID_{i,1} = \alpha_i P \\
&ID_{i,2} = RID_i \oplus H_2(\mu ID_{i,1}, P_{pub}, t_i) \\
&ID_i = (ID_{i,1}, ID_{i,2})
\end{aligned}
$$

Trace: $RID_i = ID_{i,2} \oplus H_2(\mu ID_{i,1}, P_{pub}, t_i)$ (p.6, §5.1; p.9, §6.3).

## Partial Private Key Extract (p.6, §5.2)

Source: Partial-Private-Key-Extract (p.6, §5.2).

$$
\begin{aligned}
&y_{ID_i} \in_R \mathbb{Z}_q^*,\quad Y_{ID_i} = y_{ID_i} P \\
&h_{ID_i} = H_1(ID_i, Y_{ID_i}, P_{pub}) \\
&d_{ID_i} = y_{ID_i} + \mu h_{ID_i} \pmod q
\end{aligned}
$$

Output $(d_{ID_i}, Y_{ID_i})$ over a secure channel (p.6, §5.2).

## Set Secret Value (p.6, §5.2)

Source: Set-Secret-Value (p.6, §5.2).

$$
x_{ID_i} \in_R \mathbb{Z}_q^*
$$

## Set Private/Public Key (p.6, §5.2)

Source: Set-Public/Private-Key (p.6, §5.2).

$$
\begin{aligned}
&X_{ID_i} = x_{ID_i} P \\
&SK_{ID_i} = (x_{ID_i}, d_{ID_i}),\quad PK_{ID_i} = (X_{ID_i}, Y_{ID_i})
\end{aligned}
$$

## Revocation-Key-Extract (p.6, §5.2)

Source: Revocation-Key-Extract (p.6, §5.2); correctness proof $g(s_i) = r$ (p.7, §6.1).

$$
\begin{aligned}
&r \in_R \mathbb{Z}_q^*,\quad R = rP \\
&s_i \in_R \mathbb{Z}_q^* \text{ per vehicle},\quad g(x) = \prod_{i=1}^{n}(x - s_i + r) = a_0 + a_1 x + \cdots + x^n \\
&RPK = \{R, a_0, a_1, \ldots, a_{n-1}\}
\end{aligned}
$$

Revoked vehicle $s_m$ removed, fresh $r'$ with $R' = r'P$ and $g'(x) = \prod(x - s_i + r')$ published (p.6, §5.1; p.9, §6.3).

## Signcrypt (p.6, §5.2)

Source: Signcrypt (p.6, §5.2).

$$
\begin{aligned}
&u_i \in_R \mathbb{Z}_q^*,\quad U_i = u_i P \\
&r = g(s_i),\quad h_{ID_{AS}} = H_1(ID_{AS}, Y_{ID_{AS}}, P_{pub}) \\
&Q_i = (u_i + r)(X_{ID_{AS}} + Y_{ID_{AS}} + h_{ID_{AS}} P_{pub}) \\
&n_i = H_3(ID_{AS}, U_i, Q_i, t_i),\quad z_i = n_i \oplus m_i \\
&h_{i2} = H_4(ID_i, PK_{ID_i}, U_i, Q_i, m_i, t_i) \\
&h_{i3} = H_5(m_i, PK_{ID_i}, Q_i, U_i) \\
&w_i = u_i + x_{ID_i} h_{i2} + d_{ID_i} h_{i3} \pmod q \\
&\sigma_i = (U_i, z_i, w_i)
\end{aligned}
$$

## Unsigncrypt / Individual Verification (p.6, §5.2)

Source: Unsigncrypt (p.6, §5.2).

$$
\begin{aligned}
&Q_i = (U_i + R)(x_{ID_{AS}} + d_{ID_{AS}}),\quad n_i = H_3(ID_{AS}, U_i, Q_i, t_i),\quad m_i = z_i \oplus n_i \\
&h_{i2} = H_4(ID_i, PK_{ID_i}, U_i, Q_i, m_i, t_i),\quad h_{i3} = H_5(m_i, PK_{ID_i}, Q_i, U_i) \\
&h_{ID_i} = H_1(ID_i, Y_{ID_i}, P_{pub})
\end{aligned}
$$

$$
w_i P \stackrel{?}{=} U_i + X_{ID_i} h_{i2} + (Y_{ID_i} + h_{ID_i} P_{pub}) h_{i3}
$$

## Aggregate (p.6–7, §5.2)

Source: Aggregate (p.6–7, §5.2).

$$
W = \sum_{i=1}^{n} w_i,\quad \sigma = (\{U_i, z_i \mid 1 \le i \le n\}, W)
$$

## Aggregate Verification (p.7, §5.2)

Source: Aggregate-Unsigncrypt (p.7, §5.2) with per-message $Q_i, m_i$ as above.

$$
W P \stackrel{?}{=} \sum_{i=1}^{n} U_i + \sum_{i=1}^{n}(X_{ID_i} h_{i2} + Y_{ID_i} h_{i3}) + P_{pub} \sum_{i=1}^{n} h_{ID_i} h_{i3}
$$

## Provenance

- Mode: Full-text (equations transcribed from research/clas-vanet-audit/sources/wu2025-signcryption.txt, Veh Commun 53:100897).
- Source key: wu2025-signcryption (publisher PDF via Zotero key BI625HQ9).
- Access date: 2026-09-21.
