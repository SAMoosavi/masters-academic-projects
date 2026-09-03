[[iqbal2023]]

## Setup

$$
\begin{aligned}
&\text{Genus-}g \text{ hyperelliptic curve over } \mathbb{F}_q \\
&J_C(\mathbb{F}_q) \text{ of order } n,\quad P \text{ of prime order } n \\
&s\in\mathbb{Z}_n^*,\quad P_{pub}=[s]P \\
&H_{1,2,3}:\{0,1\}^*\rightarrow\mathbb{Z}_n^*
\end{aligned}
$$

## Partial Private Key Extract

$$
\begin{aligned}
&D_i=[s]H_1(ID_i)
\end{aligned}
$$

## Set Secret Value

$$
\begin{aligned}
&x_i\in\mathbb{Z}_n^* \\
&PK_i=[x_i]P
\end{aligned}
$$

## Set Private/Public Key

$$
\begin{aligned}
&SK_i=(D_i,x_i) \\
&PK_i=[x_i]P
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&r_i\in\mathbb{Z}_n^*,\quad R_i=[r_i]P \\
&h_i=H_2(m_i\|ID_i\|R_i) \\
&\sigma_i=r_i+h_i(x_i+D_i)\pmod n
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&\sigma=\sum_{i=1}^n\sigma_i\pmod n,\quad R=\sum_{i=1}^n R_i \\
&\sigma_{agg}=(R,\sigma)
\end{aligned}
$$

## Verification

$$
\begin{aligned}
[\sigma]P\stackrel{?}{=} R+\sum_{i=1}^n[h_i]\cdot PK_i+\sum_{i=1}^n[H_1(ID_i)]\cdot P_{pub}
\end{aligned}
$$
