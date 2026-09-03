[[vallent2021]]

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
&d_i=s\cdot H_1(ID_i)
\end{aligned}
$$

## Set Secret Value

$$
\begin{aligned}
&x_i\in\mathbb{Z}_q^* \\
&P_i=x_i P
\end{aligned}
$$

## Set Private/Public Key

$$
\begin{aligned}
&SK_i=(d_i,x_i) \\
&PK_i=P_i
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&PID_i=H_1(ID_i,T_{start},T_{end}) \\
&V_i=x_i\cdot H_1(PID_i) \\
&r_i\in\mathbb{Z}_q^*,\quad R_i=r_i P \\
&h_i=H_2(M_i,PID_i,R_i) \\
&S_i=d_i\cdot H_1(PID_i)+x_i\cdot h_i+r_i\pmod q \\
&\sigma_i=(R_i,S_i)
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&S=\sum_{i=1}^n S_i,\quad R=\sum_{i=1}^n R_i \\
&\sigma=(R,S)
\end{aligned}
$$

## Verification

$$
\begin{aligned}
S P\stackrel{?}{=} R+\sum_{i=1}^n H_1(PID_i)\cdot P_{pub}+\sum_{i=1}^n h_i\cdot P_i
\end{aligned}
$$
