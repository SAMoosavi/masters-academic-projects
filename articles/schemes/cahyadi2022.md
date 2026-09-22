[[cahyadi2022-clas-scheme]]

## Setup

$$
\begin{aligned}
&G1, G2 \text{ of prime order } q,\; P \in G1,\; \hat{e}: G1 \times G1 \rightarrow G2 \\
&\text{KGC picks } a \in Zq^*,\; P_{pub} = aP \\
&\text{TRA picks } b \in Zq^*,\; T_{pub} = bP;\; \text{each RSU picks } y_i,\; P_{rsui} = y_iP \\
&h_1 \ldots h_6: \{0,1\}^* \rightarrow Zq^* \\
&params = \{q, G1, G2, P, \hat{e}, P_{pub}, h_1 \ldots h_6, P_{rsui}\} \text{ preloaded into TPD}
\end{aligned}
$$

## Extract

$$
\begin{aligned}
&Q_{ID_i} = H(ID_i, r_i),\; r_i \in Zq^* \\
&psk_{ID_i} = aQ_{ID_i}
\end{aligned}
$$

Vehicle checks legality via $\hat{e}(psk_{ID_i}, P) = \hat{e}(Q_{ID_i}, P_{pub})$.

## SetKey

$$
\begin{aligned}
&vsk_{ID_i} = x_i,\quad vpk_{ID_i} = x_iP,\; x_i \in Zq^* \\
&C_i = h_3(b, ID_i, T_i'),\quad PID_i = Q_{ID_i}C_i \\
&D_i = h_4(PID_i),\quad K_i = C_iD_i
\end{aligned}
$$

TRA encrypts batches $((PID_{i,1}, K_{i,1}) \ldots (PID_{i,n}, K_{i,n}), j, T_i')$ under $vpk_{ID_i}$ and sends via RSU, with $j = h_5(Q_{ID_i}, T_i')$; vehicle checks $j' = h_5(Q_{ID_i}, T_i')$.

## Sign

$$
\begin{aligned}
&u_i \in Zq^*,\quad U_i = u_iP \in G1 \\
&h_i = h_6(M_i, PID_i, vpk_{ID_i}, U_i, t_i) \\
&S_i = psk_{ID_i}K_i + vsk_{ID_i}P_{pub} + h_iu_iP_{rsui} \\
&s_i = (U_i, S_i)
\end{aligned}
$$

Vehicle broadcasts $(M_i, PID_i, vpk_{ID_i}, s_i, t_i)$.

## Aggregate

$$
\begin{aligned}
&S = \sum_{i=1}^{n} S_i
\end{aligned}
$$

RSU aggregates $n$ pairs into $s = (U_1 \ldots U_n, S)$ and sends $(M_1 \ldots M_n, PID_1 \ldots PID_n, vpk_{ID_1} \ldots vpk_{ID_n}, s, t_1 \ldots t_n)$ to AS.

## Verify

Single (eq. 6):

$$
\begin{aligned}
\hat{e}(S_i, P) \stackrel{?}{=} \hat{e}(PID_iD_i + vpk_{ID_i},\; P_{pub}) \cdot \hat{e}(h_iU_i,\; P_{rsui})
\end{aligned}
$$

RSU first checks $t_i$ freshness, recomputes $h_i$ and $D_i = h_4(PID_i)$, then checks eq. (6).

Aggregate (eq. 8):

$$
\begin{aligned}
\hat{e}(S, P) \stackrel{?}{=} \hat{e}\!\left(\sum_{i=1}^{n} PID_iD_i + vpk_{ID_i},\; P_{pub}\right) \cdot \hat{e}\!\left(\sum_{i=1}^{n} h_iU_i,\; P_{rsui}\right)
\end{aligned}
$$

## Trace

TRA registered each vehicle $(ID_i, Q_{ID_i}, pass_{ID_i})$ at registration, issues one-time $PID_i$ batches, and reveals the real $ID_i$ behind a disputed $PID_i$ (conditional privacy / traceability).

## Provenance

- Mode: Full-text (rewritten strictly from corrected summaries/cahyadi2022-clas-scheme.md; database: local Zotero storage key YZ5IPBAG, endpoint: pdftotext -layout dump path).
- Access date: 2026-09-21.
- Dump: research/clas-vanet-audit/sources/cahyadi2022-clas-scheme.txt (1265 lines).
