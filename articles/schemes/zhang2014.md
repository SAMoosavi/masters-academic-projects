[[zhang2014]]

## Setup

$$
\begin{aligned}
&e:\mathbb{G}_1\times\mathbb{G}_1\rightarrow\mathbb{G}_T \text{ (bilinear pairing)} \\
&P\in\mathbb{G}_1,\quad P_0\in\mathbb{G}_1 \\
&x\in\mathbb{Z}_q^*,\quad P_{pub}=xP \\
&Y=yP \text{ (verifier's key)} \\
&H_0:\{0,1\}^*\times\mathbb{G}_1\times\mathbb{G}_1\rightarrow\mathbb{Z}_q^* \\
&H_1:\{0,1\}^*\times\mathbb{G}_1\times\mathbb{G}_1\times\mathbb{G}_1\times\{0,1\}^*\rightarrow\mathbb{G}_1 \\
&H_2:\mathbb{G}_1\times\cdots\rightarrow\{0,1\}^*
\end{aligned}
$$

## Partial Private Key Extract

$$
\begin{aligned}
&d_{ID}=x+s\cdot H_0(ID,pk_{ID,2},P_0)
\end{aligned}
$$

## Set Secret Value

$$
\begin{aligned}
&x_{ID}\in\mathbb{Z}_q^* \\
&X_{ID}=x_{ID}\cdot P
\end{aligned}
$$

## Set Private/Public Key

$$
\begin{aligned}
&sk_{ID}=(x_{ID},d_{ID}) \\
&pk_{ID}=(pk_{ID,1},pk_{ID,2})=(x_{ID}\cdot P,\ d_{ID}\cdot P)
\end{aligned}
$$

## Signature

$$
\begin{aligned}
&r_{ID}\in\mathbb{Z}_q^* \\
&T_1=r_{ID}\cdot P,\quad T_2=r_{ID}\cdot P_0 \\
&h=H_1(ID,pk_{ID},T_1,T_2,m) \\
&S=r_{ID}\cdot T_1+d_{ID}\cdot T_2 \\
&\sigma=(T_1,T_2,S,h)
\end{aligned}
$$

## Aggregate

$$
\begin{aligned}
&r_i=H_2(e(T_{1i},Y)) \\
&r=H_2(r_1,\ldots,r_n) \text{ (collision-resistant hash)}
\end{aligned}
$$

## Verification

$$
\begin{aligned}
&e(S,P)\stackrel{?}{=}e(pk_{ID,1},T_1)\cdot e(pk_{ID,2}+h\cdot P_0,T_2)
\end{aligned}
$$
