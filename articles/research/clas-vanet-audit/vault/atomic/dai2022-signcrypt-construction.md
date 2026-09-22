---
title: "Pairing-Free Signcrypt Construction in Dai 2022"
aliases: []
tags: [clas, vanet, dai2022]
source:: [[dai2022-en]]
pages:: p.5065-5066
---
# Pairing-Free Signcrypt Construction

- KGC starts a cyclic ECC group with master secret s and public P_Pub = sP plus hashes H1, H2, H3, using scalar multiplication only (p.5065)
$$
\begin{aligned}
&G \text{ order } q, P \text{ generator} \\
&s \in Z_q^*, P_{Pub} = sP \\
&H_1,H_2,H_3:\{0,1\}^* \to Z_q^* \\
&params=\{G,q,P,P_{Pub},H_1,H_2,H_3\}
\end{aligned}
$$
- KGC picks a fresh y_ID tied to ID through H1 and forms partial key d_ID as y_ID plus h_ID times s mod q (p.5065)
$$
\begin{aligned}
&y_{ID} \in_R Z_q^*, Y_{ID}=y_{ID}P \\
&h_{ID}=H_1(ID,Y_{ID},P_{Pub}) \\
&d_{ID}=y_{ID}+h_{ID}s \bmod q
\end{aligned}
$$
- A joining party stays valid only if d_ID P matches Y_ID plus h_ID times P_Pub (p.5067)
$$
d_{ID}P=Y_{ID}+h_{ID}P_{Pub}
$$
- All parties pick a local secret x_ID, publish X_ID = x_ID P, and form K_ID = X_ID plus Y_ID, holding a secret pair (x_ID, d_ID) and a public pair (K_ID, Y_ID) (p.5065)
$$
\begin{aligned}
&x_{ID} \in_R Z_q^*, X_{ID}=x_{ID}P \\
&K_{ID}=X_{ID}+Y_{ID} \\
&sk_{ID}=(x_{ID},d_{ID}) \\
&PK_{ID}=(K_{ID},Y_{ID})
\end{aligned}
$$
- A sender draws two nonces u_i,1 and u_i,2, builds u_i and U_i = u_i P, wraps m_i as c_i = m_i xor z_i, and binds w_i = u_i plus h_i times the sum of x_IDi and d_IDi (p.5066)
$$
\begin{aligned}
&u_{i,1},u_{i,2} \in_R Z_q^* \\
&u_i=(u_{i,1}x_{ID_i}+u_{i,2}d_{ID_i}) \\
&\times (x_{ID_i}+d_{ID_i})^{-1} \\
&U_i=u_iP \\
&h_{ID_B}=H_1(ID_B,Y_{ID_B},P_{Pub}) \\
&K_i=u_i(K_{ID_B}+h_{ID_B}P_{Pub}) \\
&z_i=H_2(ID_B,U_i,K_i,t_i) \\
&c_i=m_i \oplus z_i \\
&h_i=H_3(m_i,ID_i,PK_{ID_i},U_i,K_i,t_i) \\
&w_i=u_i+h_i(x_{ID_i}+d_{ID_i}) \bmod q \\
&\sigma_i=(U_i,c_i,w_i)
\end{aligned}
$$
- A recipient builds K_i from its own sum times U_i, unwraps m_i = c_i xor z_i, and grants validity only if w_i P matches U_i plus h_i times the sum of K_IDi and h_IDi P_Pub (p.5066)
$$
\begin{aligned}
&K_i=(x_{ID_B}+d_{ID_B})U_i \\
&m_i=c_i \oplus z_i
\end{aligned}
$$
$$
w_iP=U_i+h_i(K_{ID_i}+h_{ID_i}P_{Pub})
$$
- RSU adds all w_i into a solo W with matching pairs of U_i and c_i, and AS clears a full batch in a solo check with WP matching the sum of U_i plus the sum of h_i times the sum of K_IDi and h_IDi P_Pub (p.5066)
$$
\begin{aligned}
&W=\sum w_i \\
&\sigma=(\{U_i,c_i\},W)
\end{aligned}
$$
$$
\begin{aligned}
&WP=\sum U_i \\
&+\sum h_i(K_{ID_i}+h_{ID_i}P_{Pub})
\end{aligned}
$$

## Links

- [[dai2022-security-proofs]] — proofs show why this construction stands firm (p.5067)
- [[dai2022-performance-figures]] — timing runs show cost of this construction (p.5071)

## Source

source:: [[dai2022-en]] p.5065-5066
