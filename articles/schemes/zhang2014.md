[[zhang2014]]

## Setup

$$
\begin{aligned}
&e:\mathbb{G}_1\times\mathbb{G}_2\rightarrow\mathbb{G}_T \text{ (bilinear pairing)} \\
&P_1\in\mathbb{G}_1,\quad P_2\in\mathbb{G}_2,\quad s\in\mathbb{Z}_q^* \\
&P_{pub}=sP_1 \\
&H_1,H_2:\{0,1\}^*\rightarrow\mathbb{G}_1
\end{aligned}
$$

## Partial Private Key Extract

$$
\begin{aligned}
&D_i=s\cdot H_1(ID_i)
\end{aligned}
$$

## Set Secret Value

$$
\begin{aligned}
&x_i\in\mathbb{Z}_q^* \\
&P_i=x_i P_1
\end{aligned}
$$

## Set Private/Public Key

$$
\begin{aligned}
&SK_i=(D_i,x_i) \\
&PK_i=P_i
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&r_i\in\mathbb{Z}_q^*,\quad R_i=r_i P_1 \\
&h_i=H_2(m_i,ID_i,P_i,R_i) \\
&\sigma_i=D_i+(x_i+h_i) r_i^{-1}\pmod q
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&\sigma=\prod_{i=1}^n\sigma_i \\
&\sigma_{agg}=\sigma
\end{aligned}
$$

## Verification

$$
\begin{aligned}
e(\sigma,P_1)\stackrel{?}{=}\prod_{i=1}^n e(H_1(ID_i),P_{pub})\cdot e(P_i,R_i)
\end{aligned}
$$
