[[cahyadi2022-clas-scheme]]

## Setup

$$
\begin{aligned}
&P \in \mathbb{G},\quad s\in\mathbb{Z}_q^* \\
&P_{pub}=sP \\
&H_1:\{0,1\}^*\rightarrow\mathbb{G},\quad H_2:\{0,1\}^*\rightarrow\mathbb{Z}_q^*
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
&r_j\in\mathbb{Z}_q^*,\quad R_j=r_j P \\
&h_j=H_2(m_j,ID_i,PK_i,R_j) \\
&S_j=r_j+h_j x_i\pmod q \\
&\sigma_j=(R_j,S_j)
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&S=\sum_{j=1}^n S_j,\quad R=\sum_{j=1}^n R_j \\
&\sigma=(R,S)
\end{aligned}
$$

## Verification

$$
\begin{aligned}
e(S,P)\stackrel{?}{=} e(R,P)\cdot e\!\left(\sum_{j=1}^n h_j\cdot PK_i,\;P_{pub}\right)
\end{aligned}
$$
