# Zhang et al. (2024) — Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT

> Jianhong Zhang, Chenghe Dong, Yining Liu
> IEEE Internet of Things Journal, Vol. 11, No. 3, February 2024

## Setup

*Source: (p. 4352–4353, §VII.A).*

$$
\begin{aligned}
&\text{Input: security parameter } \lambda \\
&(E, q, P, G): E \text{ elliptic curve over } \mathbb{F}_p,\; G \text{ additive group of order } q,\; \text{generator } P \\
&s \xleftarrow{\$} \mathbb{Z}_q: \text{master secret key} \\
&P_{pub} = sP \\
&H_1: \{0,1\}^* \times G \times G \rightarrow \mathbb{Z}_q \\
&H_2: \{0,1\}^* \times \{0,1\}^* \times G \times G \rightarrow \{0,1\}^{l_1} \\
&H_3: G \times G \rightarrow \mathbb{Z}_q \\
&H_4: G \times \{0,1\}^{l_1} \times G \times G \rightarrow \mathbb{Z}_q^* \\
&\text{Param} = \{q, G, P, P_{pub}, H_1, H_2, H_3, H_4\}
\end{aligned}
$$

## Partial Private Key

*Source: (p. 4353, §VII.B).*

$$
\begin{aligned}
&\alpha_i \xleftarrow{\$} \mathbb{Z}_q \\
&T_i = \alpha_i P \\
&h_i = H_1(ID_i, T_i, P_{pub}) \\
&d_{ID_i} = \alpha_i + s \cdot h_i \pmod{q} \\
&\text{Partial private key: } (d_{ID_i}, T_i)
\end{aligned}
$$

## Public/Private Key Generation

*Source: (p. 4353, §VII.C).*

$$
\begin{aligned}
&x_{ID_i} \xleftarrow{\$} \mathbb{Z}_q^* \\
&sk_i = (x_{ID_i}, d_{ID_i}) \\
&Y_{ID_i} = x_{ID_i} P \\
&pk_i = (Y_{ID_i}, T_i)
\end{aligned}
$$

## Signcryption

*Source: (p. 4353, §VII.D).*

Sender with identity $ID_s$, public key $pk_s = (Y_{ID_s}, T_s)$ sends message $m$ to receiver with identity $ID_r$, public key $pk_r = (Y_{ID_r}, T_r)$:

$$
\begin{aligned}
&u \xleftarrow{\$} \mathbb{Z}_q,\quad U = uP \\
&h_r = H_1(ID_r, T_r, P_{pub}) \\
&h_s = H_1(ID_s, T_s, P_{pub}) \\
&f_s = H_3(Y_{ID_s}, T_s) \\
&f_r = H_3(Y_{ID_r}, T_r) \\
&V = u \cdot h_r \cdot f_r \cdot Y_{ID_r} + h_s T_r + h_r P_{pub} \\
&Y = H_2(ID_r, ID_s, U, V) \\
&c = Y \oplus m \\
&r = H_4(U, c, T_s, Y_{ID_s}) \\
&\theta = u + r \cdot f_s \cdot x_{ID_s} + d_{ID_s} \pmod{q} \\
&\delta = (U, \theta, c)
\end{aligned}
$$

## Unsigncryption

*Source: (p. 4353, §VII.E).*

Receiver with identity $ID_r$, public key $pk_r$, private key $sk_r = (x_{ID_r}, d_{ID_r})$:

$$
\begin{aligned}
&V' = (h_r \cdot f_r \cdot x_{ID_r} + h_s \cdot d_{ID_r}) \cdot U \\
&Y' = H_2(ID_r, ID_s, U, V') \\
&m' = c \oplus Y' \\
&r' = H_4(U, c, T_s, Y_{ID_s}) \\
&\text{Verify: } \theta P \stackrel{?}{=} U + r' \cdot (f_s \cdot Y_{ID_s} + T_s + h_s \cdot P_{pub}) \\
&\text{Accept } m' \text{ if valid, else output } \bot
\end{aligned}
$$

## Public Verification

*Source: (p. 4353, §VII.F).*

Anyone can verify a signcryptext $\delta = (U, \theta, c)$ using the sender's public key $(T_s, Y_{ID_s})$:

$$
\begin{aligned}
&r' = H_4(U, c, T_s, Y_{ID_s}) \\
&\text{Verify: } \theta P \stackrel{?}{=} U + r' \cdot (f_s \cdot Y_{ID_s} + T_s + h_s \cdot P_{pub})
\end{aligned}
$$

where $f_s = H_3(Y_{ID_s}, T_s)$ and $h_s = H_1(ID_s, T_s, P_{pub})$.

## Provenance

- Mode: Full-text (equations transcribed strictly from the verified summary, which is grounded in the source PDF dump, pp. 4352–4353).
- Source key: ZCLEKD7V (`Zhang et al. - 2024 - Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT.pdf`).
- Access date: 2026-09-21.
