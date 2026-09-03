[[wu2025-pseudonyms]]

## Setup

$$
\begin{aligned}
&P \in \mathbb{G},\quad s\in\mathbb{Z}_q^* \\
&P_{pub}=sP \\
&H_{1,2,3}:\{0,1\}^*\rightarrow\mathbb{Z}_q^*
\end{aligned}
$$

## Partial Private Key Extract

$$
\begin{aligned}
&PID_i=H_1(ID_i\|r_i) \\
&D_i=s\cdot H_2(PID_i)
\end{aligned}
$$

## Set Secret Value

$$
\begin{aligned}
&x_i\in\mathbb{Z}_q^* \\
&X_i=x_i P
\end{aligned}
$$

## Set Private/Public Key

$$
\begin{aligned}
&SK_i=(D_i,x_i) \\
&PK_i=X_i
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&r_i\in\mathbb{Z}_q^*,\quad R_i=r_i P \\
&h_i=H_3(m_i,PID_i,X_i,R_i) \\
&\sigma_i=r_i+h_i(x_i+D_i)\pmod q
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&\sigma=\sum_{i=1}^n\sigma_i,\quad R=\sum_{i=1}^n R_i \\
&\sigma_{agg}=(\sigma,R)
\end{aligned}
$$

## Verification

$$
\begin{aligned}
\sigma P\stackrel{?}{=} R+\sum_{i=1}^n h_i(X_i+D_i)
\end{aligned}
$$
