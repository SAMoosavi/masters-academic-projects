[[zheng2023]]

## Setup

$$
\begin{aligned}
&P \in \mathbb{G},\quad s\in\mathbb{Z}_q^* \\
&P_{pub}=sP \\
&K_{pub}=s_2 P \\
&H_1:\{0,1\}^*\times\mathbb{G}\rightarrow\mathbb{Z}_q^* \\
&H_2:\{0,1\}^*\times\mathbb{G}\rightarrow\mathbb{Z}_q^* \\
&H_3:\{0,1\}^*\times\{0,1\}^*\times\mathbb{G}\times\mathbb{G}\times\{0,1\}^*\rightarrow\mathbb{Z}_q^*
\end{aligned}
$$

## Partial Private Key Extract

$$
\begin{aligned}
&d_i=s\cdot H_1(PID_i,X_i)
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
&SK_i=(d_i,x_i) \\
&PK_i=X_i
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&r_i\in\mathbb{Z}_q^*,\quad U_i=r_i P \\
&h_{2i}=H_2(PID_i,X_i) \\
&h_{3i}=H_3(M_i,PID_i,X_i,U_i,T_i) \\
&s_i=r_i+h_{2i}\cdot x_i+h_{3i}\cdot d_i\pmod q \\
&\sigma_i=(U_i,s_i)
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&s=\sum_{i=1}^n s_i \\
&\sigma=(U_1,\ldots,U_n,s)
\end{aligned}
$$

## Verification

$$
\begin{aligned}
sP\stackrel{?}{=}\sum_{i=1}^n W_i+\sum_{i=1}^n X_i\cdot h_{3i}
\end{aligned}
$$

where $W_i=h_{2i}\cdot K_{pub}$.
