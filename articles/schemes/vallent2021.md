[[vallent2021]]

## Setup (§4.1, pp.6–7)

$$
\begin{aligned}
&p, q \text{ large primes},\quad E: y^2 = x^3 + ax + b \pmod p,\ a, b \in \mathbb{F}_p \text{ (p.6)} \\
&G = \langle P \rangle \text{ of order } q,\ P \in E \text{ (p.6)} \\
&\text{KGC master secret } \alpha \in \mathbb{Z}_q^*,\quad P_{pub} = \alpha P \text{ (p.6)} \\
&\text{TRA master secret } \beta \in \mathbb{Z}_q^*,\quad T_{pub} = \beta P \text{ (traceability key, p.7)} \\
&H_1: G \to \mathbb{Z}_q^*,\quad H_2, H_3: \{0,1\}^* \to \mathbb{Z}_q^* \text{ (p.7)} \\
&params = \{P, p, q, E, G, H_1, H_2, H_3, P_{pub}, T_{pub}\} \text{ preloaded in TPD/RSU (p.7)}
\end{aligned}
$$

## Pseudonym Generation (§4.2, p.7)

$$
\begin{aligned}
&k_i \in \mathbb{Z}_q^*,\quad PID_1 = k_i P,\quad V_i \text{ sends } (RID_i, PID_1) \text{ over secure channel (p.7)} \\
&PID_2 = RID_i \oplus H_1(\beta \cdot PID_1 \parallel T_i \parallel T_{pub}) \text{ (p.7)} \\
&ID_i = (PID_1 \parallel PID_2 \parallel T_i),\quad T_i = \text{validity period (p.7)}
\end{aligned}
$$

## Partial Private Key Extract (§4.2, p.7)

$$
\begin{aligned}
&d_i \in \mathbb{Z}_q^*,\quad Q_{IDi} = d_i P \text{ (p.7)} \\
&psk_i = d_i + H_2(ID_i \parallel Q_{IDi}) \cdot \alpha \pmod p \text{ (p.7)} \\
&\text{Check: } psk_i \cdot P = Q_{IDi} + H_2(ID_i \parallel Q_{IDi}) \cdot P_{pub} \text{ (p.7)}
\end{aligned}
$$

$(Q_{IDi}, psk_i)$ sent over a secure channel and stored in the tamper-proof device (p.7).

## Set Secret Value (§4.3, pp.7–8)

$$
\begin{aligned}
&vsk_i = x_i \in \mathbb{Z}_q^*,\quad vpk_i = x_i P \text{ (pp.7–8)}
\end{aligned}
$$

## Set Private/Public Key (§4.3, pp.7–8)

$$
\begin{aligned}
&sk_i = x_i + psk_i \text{ (full private key, pp.7–8)} \\
&PK_i = (Q_{IDi}, vpk_i) \text{ (pp.7–8)}
\end{aligned}
$$

## Signature (§4.4, pp.7–8, eqs.1–3)

$$
\begin{aligned}
&r_i \in \mathbb{Z}_q^*,\quad R_i = r_i P \text{ (p.7)} \\
&h_i = H_3(M_i \parallel ID_i \parallel Q_{IDi} \parallel vpk_i \parallel R_i \parallel t_i) \quad \text{(eq.1, p.8)} \\
&S_i = h_i \cdot r_i + sk_i \pmod p \quad \text{(eq.2, p.8)} \\
&\sigma_i = (R_i, S_i) \quad \text{(eq.3, p.8)}
\end{aligned}
$$

Transmitted message is $(ID_i, Q_{IDi}, vpk_i, M_i, t_i, \sigma_i)$ (p.8).

## Aggregate (§4.6, pp.8–9, eq.7)

$$
\begin{aligned}
&S = \sum_{i=1}^{n} S_i \text{ (pp.8–9)} \\
&\sigma = (R_1, S_1), \ldots, (R_n, S_n) \text{ (concatenated aggregate, eq.7, pp.8–9)}
\end{aligned}
$$

## Individual Verification (§4.5, p.8, eqs.4–6)

$$
\begin{aligned}
&h_{i,0} = H_2(ID_i \parallel Q_{IDi}) \quad \text{(eq.4, p.8)} \\
&h_i = H_3(M_i \parallel ID_i \parallel Q_{IDi} \parallel vpk_i \parallel R_i \parallel t_i) \quad \text{(eq.5, p.8)} \\
&S_i \cdot P = h_i \cdot R_i + vpk_i + Q_{IDi} + h_{i,0} \cdot P_{pub} \quad \text{(eq.6, p.8)}
\end{aligned}
$$

## Aggregate Verification (§4.7, p.9, eqs.8–10)

$$
\begin{aligned}
&h_{i,0} = H_2(ID_i \parallel Q_{IDi}) \quad \text{(eq.8, p.9)} \\
&h_i = H_3(M_i \parallel ID_i \parallel vpk_i \parallel R_i \parallel t_i) \quad \text{(eq.9 as printed, p.9)} \\
&S \cdot P = \sum_{i=1}^{n} h_i \cdot R_i + \sum_{i=1}^{n} vpk_i + \sum_{i=1}^{n} Q_{IDi} + \sum_{i=1}^{n} h_{i,0} \cdot P_{pub} \quad \text{(eq.10, p.9)}
\end{aligned}
$$

> Caveat: the aggregate-phase hash (eq.9, p.9) is printed without the $Q_{IDi}$ input present in the signing/individual equations (eq.1/eq.5, p.8) — a source-internal inconsistency, not a transcription error.

## Provenance

- Mode: Full-text (source PDF read via pdftotext -layout, dump saved).
- Source key: AI8HZABG (Efficient certificate-less aggregate signature...pdf).
- Access date: 2026-09-21.
- Rewritten 2026-09-21 from corrected summaries/vallent2021.md (§4, pp.6–9); prior version's placeholders (`d_i = sH(ID_i)`, `SK_i = (d_i,x_i)`, `V_i`, `S_i = d_iH + x_i h_i + r_i`, `PID_i = H(...)`) replaced with paper-true construction.
