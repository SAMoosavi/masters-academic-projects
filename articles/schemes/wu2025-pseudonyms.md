[[wu2025-pseudonyms]]

## Setup

*(p.130)*

$$
\begin{aligned}
&\mathbb{G},\; P \in \mathbb{G},\; q = |\mathbb{G}| \\
&\alpha, \beta \in \mathbb{Z}_q^* \\
&P_{pub} = \alpha P,\quad T_{pub} = \beta P \\
&H_0, H_1, H_2, H_3, H_4 : \{0,1\}^* \rightarrow \mathbb{Z}_q^* \\
&\text{params} = \{G, P, q, P_{pub}, T_{pub}, H_0, H_1, H_2, H_3\}
\end{aligned}
$$

## Set Secret Value

*(p.130)*

$$
\begin{aligned}
&x_i \in \mathbb{Z}_q^* \\
&X_i = x_i P
\end{aligned}
$$

## Pseudonym Identity Generation

*(p.130)*

$$
\begin{aligned}
&u_i \in \mathbb{Z}_q^*,\quad U_i = u_i P \\
&VID_i = RID_i \oplus H_0(x_i T_{pub}) \\
&RID_i = VID_i \oplus H_0(\beta X_i) \\
&AID_i = RID_i \oplus H_0(\beta U_i, T_i) \\
&PID_i = (AID_i, T_i)
\end{aligned}
$$

## Partial Private Key Generation

*(p.130)*

$$
\begin{aligned}
&r_i \in \mathbb{Z}_q^*,\quad R_i = r_i P \\
&h_{2,i} = H_2(PID_i, X_i, R_i) \\
&PK_i = R_i + h_{2,i} X_i \\
&h_{1,i} = H_1(PID_i, PK_i, P_{pub}) \\
&psk_i = (r_i + \alpha \cdot h_{1,i}) \bmod q
\end{aligned}
$$

## Vehicle Key Generation

*(p.130)*

$$
\begin{aligned}
&sk_i = psk_i + h_{2,i} \cdot x_i \\
&PK_i = R_i + h_{2,i} X_i \\
&psk_i P = R_i + h_{1,i} P_{pub} \\
&RID_i = AID_i \oplus H_0(u_i T_{pub}, T_i)
\end{aligned}
$$

## Signature Generation

*(p.130)*

$$
\begin{aligned}
&t_i = \text{current timestamp} \\
&h_{3,i} = H_3(PID_i, PK_i, U_i, m_i, t_i) \\
&\sigma_i = (u_i + h_{3,i} \cdot sk_i) \bmod q
\end{aligned}
$$

## Signature Verification

*(p.130)*

$$
\begin{aligned}
&\sigma_i P \stackrel{?}{=} U_i + h_{3,i}(PK_i + h_{1,i} P_{pub})
\end{aligned}
$$

## Aggregate Signature

*(p.130)*

$$
\begin{aligned}
&\Xi_i = h_{3,i}^{-1}(\sigma_i P - U_i),\quad i = 1, \ldots, n \\
&\eta = H_4(\Xi_1, \Xi_2, \ldots, \Xi_n) \\
&\sigma_{agg} = \left(\sum_{i=1}^n \Xi_i,\; \eta\right)
\end{aligned}
$$

## Aggregate Verification

*(p.130)*

$$
\begin{aligned}
&h_{1,i} = H_1(PID_i, PK_i, P_{pub}),\quad i = 1, \ldots, n \\
&\Xi'_i = PK_i + h_{1,i} P_{pub},\quad i = 1, \ldots, n \\
&\sum \Xi_i \stackrel{?}{=} \sum_{i=1}^n \Xi'_i \\
&\eta \stackrel{?}{=} H_4(\Xi_1, \Xi_2, \ldots, \Xi_n)
\end{aligned}
$$
