[[wang2025-detectable]]

## Setup
<!-- p.4, §3: G1, G2 of prime order q, e: G1 x G1 -> G2, P generator, t/Tpub, k/Kpub, y/Ypub, H0,4,5,6 -> Zq*, H1,2,3 -> G1 -->

$$
\begin{aligned}
&\mathbb{G}_1,\mathbb{G}_2:\text{groups of prime order }q,\quad e:\mathbb{G}_1\times\mathbb{G}_1\rightarrow\mathbb{G}_2 \\
&P\in\mathbb{G}_1:\text{generator} \\
&k\in\mathbb{Z}_q^*:\text{KGC master secret},\quad K_{pub}=kP \\
&t\in\mathbb{Z}_q^*:\text{TRA master secret},\quad T_{pub}=tP \\
&y\in\mathbb{Z}_q^*:\text{AS secret},\quad Y_{pub}=yP \\
&H_0:\{0,1\}^*\rightarrow\mathbb{Z}_q^* \\
&H_1:\{0,1\}^*\rightarrow\mathbb{G}_1 \\
&H_2:\{0,1\}^*\rightarrow\mathbb{G}_1 \\
&H_3:\{0,1\}^*\rightarrow\mathbb{G}_1 \\
&H_4:\{0,1\}^*\rightarrow\mathbb{Z}_q^* \\
&H_5:\{0,1\}^*\rightarrow\mathbb{Z}_q^* \\
&H_6:\{0,1\}^*\rightarrow\mathbb{Z}_q^*
\end{aligned}
$$

## Pseudonym Identity Generation
<!-- p.4, §3: TRA picks u_i, PIDi,1 = H0(t) xor u_i, PIDi,2 = IDi xor H0(u_i || TPi) -->

$$
\begin{aligned}
&u_i\in\mathbb{Z}_q^* \\
&PID_{i,1}=H_0(t)\oplus u_i,\quad PID_{i,2}=ID_i\oplus H_0(u_i\|TP_i) \\
&PID_i=(PID_{i,1},PID_{i,2},TP_i)
\end{aligned}
$$

## Partial Private Key Generation
<!-- p.4, §3: KGC computes Qi = H1(PIDi), di = kQi over secure channel -->

$$
\begin{aligned}
&Q_i=H_1(PID_i) \\
&d_i=kQ_i
\end{aligned}
$$

## User Key Generation
<!-- p.4, §3: vehicle picks xi, Xi = xiP -->

$$
\begin{aligned}
&x_i\in\mathbb{Z}_q^* \\
&X_i=x_iP
\end{aligned}
$$

## Signature
<!-- p.4–5, §3: Ri = riP, W = H2(Kpub || P), U = H3(Tpub || P), gi = H4(...Kpub...), hi = H5(...Tpub...), Si = riW + gixiU + hidi -->

$$
\begin{aligned}
&r_i\in\mathbb{Z}_q^*,\quad R_i=r_iP \\
&W=H_2(K_{pub}\|P),\quad U=H_3(T_{pub}\|P) \\
&g_i=H_4(PID_i\|m_i\|X_i\|K_{pub}\|T_i\|R_i) \\
&h_i=H_5(PID_i\|m_i\|X_i\|T_{pub}\|T_i\|R_i) \\
&S_i=r_iW+g_ix_iU+h_id_i \\
&\sigma_i=(R_i,S_i)
\end{aligned}
$$

## Aggregate
<!-- p.5, §3: RSU checks Ti, S = sum Si, R = sum Ri -->

$$
\begin{aligned}
&S=\sum_{i=1}^n S_i,\quad R=\sum_{i=1}^n R_i \\
&\sigma=(S,R)
\end{aligned}
$$

## Verification
<!-- p.5, §3: 4 pairings: e(S,P) = e(R,W) e(sum giXi, U) e(sum hiQi, Kpub) -->

$$
\begin{aligned}
&e(S,P)\stackrel{?}{=}e(R,W)\cdot e\!\left(\sum_{i=1}^n g_iX_i,U\right)\cdot e\!\left(\sum_{i=1}^n h_iQ_i,K_{pub}\right)
\end{aligned}
$$

## Invalid Signature Detection (Binary Search)
<!-- p.5, §3 Algorithm 1: verify left half; if pass recurse right only, else recurse left then re-verify left and conditionally recurse right; cf. Algorithm 2 [20,23] overhead -->

Algorithm 1 — `InvalidSignaturesDetection(L_1, L_2, low, high)`:

1. If $low=high$, append $L_1[low]$ to $L_2$ and return.
2. Compute $mid=\lfloor(low+high)/2\rfloor$.
3. Run `AggregateVerification` on $L_1[low..mid]$ ($\alpha$). If it passes ($\alpha==1$), recurse on $L_1[mid+1..high]$.
4. Otherwise, recurse on $L_1[low..mid]$, then re-run `AggregateVerification` on $L_1[low..mid]$ ($\lambda$). If it still fails ($\lambda==0$), recurse on $L_1[mid+1..high]$.

## Trace
<!-- p.5, §3: TRA recovers u_i = H0(t) xor PIDi,1, IDi = H0(u_i || TPi) xor PIDi,2 -->

$$
\begin{aligned}
&u_i=H_0(t)\oplus PID_{i,1} \\
&ID_i=H_0(u_i\|TP_i)\oplus PID_{i,2}
\end{aligned}
$$

## Provenance

- Full-text: Zotero local storage key ZNYGPD2R PDF (database: local Zotero storage; endpoint: https://doi.org/10.1016/j.jisa.2025.104001), extracted to research/clas-vanet-audit/sources/wang2025-detectable.txt (797 lines); verified against JISA 89 (2025) 104001
- Access date: 2026-09-21
