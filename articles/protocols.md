# Protocol Descriptions — CLAS/VANET Schemes

> Regenerated 2026-09-21 by Professor merge from the 24 crew-audited
> `summaries/*.md` (22 Full-text + 2 Abstract-only). Each entry states its
> pairing family explicitly. Full equations live in `summaries/<key>.md` and
> `schemes/<key>.md`; this file is an index, not a source.

## Legend

- **[P]** pairing-based (bilinear map in verification) — 5 schemes
- **[PF]** pairing-free (ECC/HECC scalar multiplication only) — 15 constructions
- **[A]** Abstract-only (no verified construction) — 2 papers
- **[R]** review/cryptanalysis (no new construction)

## Cahyadi et al. 2022 — CLAS for Security and Privacy Protection in VANET [P]

*Source: [summaries/cahyadi2022-clas-scheme.md](summaries/cahyadi2022-clas-scheme.md) · Full-text (p.8–12)*

1. **Setup**: $G_1, G_2, \hat{e}: G_1 \times G_1 \to G_2$; KGC $a, P_{pub} = aP$; TRA $b, T_{pub} = bP$
2. **Registration**: TRA issues $Q_{ID_i}$, vehicle checks $\hat{e}(psk_{ID_i}, P) = \hat{e}(Q_{ID_i}, P_{pub})$
3. **Vehicle-Key-Gen**: $vsk = x_i$, $vpk = x_iP$
4. **Pseudonym-Gen**: TRA batch-issues one-time $(PID_i, K_i)$
5. **Sign**: $S_i = psk_{ID_i}K + vsk_{ID_i}P_{pub} + h_iu_iP_{rsui}$ (p.10)
6. **Verify**: $\hat{e}(S, P) = \hat{e}(PID_iD_i + vpk_{ID_i}, P_{pub}) \cdot \hat{e}(h_iU_i, P_{rsui})$ (eq.6, p.12)
7. **Aggregate-Verify**: summed form of eq.6 (eq.8, p.12); 583 bytes/msg

---

## Cahyadi & Hwang 2022 — Comprehensive Survey [R]

*Source: [summaries/cahyadi2022-survey.md](summaries/cahyadi2022-survey.md) · Full-text*

Generic eight-algorithm CLAS framework (Setup → PseudonymGen → Partial-Private-Key-Gen → … → Aggregate-Verify, pp.1268–1269 §3.1); break-fix chain table (Table 1, p.1270); cost tables (Table 3, pp.1272–1273). No concrete construction — survey only.

---

## Dai & Xu 2023 — Pairing-Free CLASC for Vehicular Sensor Networks [PF]

*Source: [summaries/dai2022.md](summaries/dai2022.md) · Full-text (Algorithms 1–7, pp.5065–5066)*

1. **Setup**: $G, q, P$, $P_{Pub} = sP$, $H_1, H_2, H_3$
2. **Extract**: $d_{ID} = y_{ID} + h_{ID}s$, check $d_{ID}P = Y_{ID} + h_{ID}P_{Pub}$
3. **SetKey**: $sk = (x_{ID}, d_{ID})$, $PK = (K_{ID}, Y_{ID})$, $K_{ID} = X_{ID} + Y_{ID}$
4. **Signcrypt**: $w_i = u_i + h_i(x_{ID_i} + d_{ID_i})$, $\sigma_i = (U_i, c_i, w_i)$
5. **Unsigncrypt/Verify**: $w_iP = U_i + h_i(K_{ID_i} + h_{ID_i}P_{Pub})$ (Alg.5)
6. **Aggregate-Verify**: $WP = \sum U_i + \sum h_i(K_{ID_i} + h_{ID_i}P_{Pub})$ (Alg.7)

---

## Gong et al. 2023 — PCAS [PF]

*Source: [summaries/gong2023.md](summaries/gong2023.md) · Full-text (LICLAS forgery §4.2 p.5; PCAS §5.2 pp.7–8)*

1. **Setup**: $T_{pub} = s_1P$, $P_{pub} = s_2P$, $H, H_1$–$H_4$ (no pairings, no Map-to-Hash)
2. **KeyGen**: $d_{i,j} = r_i + s_2h_{1i,j}$; $D_{i,j} = R_i + \alpha_{i,j}X_i$
3. **Sign**: ECC scalar-mult signing with pseudonym $pseu_{i,j}$ (p.8)
4. **Verify**: $w_iP - h_{4i}Y_{1i} = h_{3i}D + h_1P_{pub}$ form, Eq.(1) (p.8)
5. **Aggregate-Verify**: summed form Eq.(2) (p.8); −25% transmission, −16.56%/−25.34% computation vs LICLAS

---

## Han et al. 2022 — eCLAS [A]

*Source: [summaries/han2022.md](summaries/han2022.md) · Abstract-only (+ OA link)*

Abstract-level flow only: vehicles sign distinct messages → signatures aggregate into one short signature → RSU verifies (V2I). No verified equations (no PDF).

---

## Iqbal et al. 2023 — HECC CLAS [PF]

*Source: [summaries/iqbal2023.md](summaries/iqbal2023.md) · Full-text (§5 Fig.3, pp.6–8)*

1. **Setup**: genus-2 hyperelliptic curve, divisor $D$, $Dot_{pb} = Dot_p \cdot D$
2. **PRPKG** (open channel): user sends $(EID_{usr}, F_{usr})$; DoT returns encrypted $(P_{usr}, L_{usr})$
3. **PRKG**: $SK = (G_{usr}, P_{usr})$, $PK = (F_{usr}, L_{usr})$
4. **SIGG**: $S_{OBU} = T_{OBU} + H_{3usr}(G_{usr} + P_{usr})$, $\sigma = (S_{OBU}, W_{OBU})$
5. **SIGV**: $S_{OBU} \cdot D - W_{OBU} = H_{3usr}(F_{usr} + L_{usr} + H_{2usr} \cdot Dot_{pb})$ (p.8)
6. Aggregation follows eCLAS [29]; 1.92 ms / 1160 bits

---

## Lode & Pinapati 2026 — ECC-CLAS Review + Quantum-Secure Cryptanalysis [R]

*Source: [summaries/lode2026.md](summaries/lode2026.md) · Full-text*

Reviews pairing-based → pairing-free ECC → HECC → quantum-resistant CLAS; Table 2 notation (p.9); Huang-cancellation break of quantum-secure CLAS (pp.12–13). No new construction.

---

## Shim & Kwon 2026 — Aggregate-Signature CPPA Cryptanalysis [R]

*Source: [summaries/shim2026.md](summaries/shim2026.md) · Full-text (5 pp.)*

Zhu–Guan forgery ($B = -h_3P_{pub}$) and Chen–Guan forgery ($\theta = b_i - x'_ih_{4i}$); hash-binding patches ($h_5, h_6$). Cryptanalysis only.

---

## Shim 2023 — CPPA Cryptanalysis [R]

*Source: [summaries/shim2023.md](summaries/shim2023.md) · Full-text*

Malicious-but-passive KGC trapdoor ($Q = \alpha P$) breaking Wang et al.; one-signature η-shift and two-signature key-recovery breaking Xiong et al. (pp.5–6). Victim equations use pairings (victims' constructions). Cryptanalysis only.

---

## Tao & Cui 2026 — ES-CLAS Fully Aggregate [PF]

*Source: [summaries/tao2026.md](summaries/tao2026.md) · Full-text (Fig.3 p.5; eq.6 p.6)*

1. **Setup**: general one-way hashes only (no map-to-point, no pairings)
2. **Extract/KeyGen**: certificateless key pair with timestamped pseudonym
3. **Sign**: single ECC signing equation, eq.(6) verification (p.6)
4. **Aggregate**: full aggregation into one $(U, V)$-style aggregate
5. **Verify/Trace**: single aggregate check + lightweight TA traceability; −24.3% computation

---

## Vallent et al. 2021 — ECLAS for VANET + Smart Grid [PF]

*Source: [summaries/vallent2021.md](summaries/vallent2021.md) · Full-text (§4 pp.6–9, eqs.1–10)*

1. **Setup**: $E: y^2 = x^3 + ax + b$, KGC $\alpha/P_{pub}$, TRA $\beta/T_{pub}$, $H_1, H_2, H_3$ (pp.6–7)
2. **Pseudonym/PPK**: $ID_i = (PID_1‖PID_2‖T_i)$; $psk_i = d_i + H_2(ID_i‖Q_{IDi}})\alpha$ (p.7)
3. **Vehicle-KeyGen**: $vpk_i = x_iP$, $sk_i = x_i + psk_i$ (pp.7–8)
4. **Sign**: $h_i = H_3(\ldots)$ (eq.1), $S_i = h_ir_i + sk_i$ (eq.2), $\sigma_i = (R_i, S_i)$ (p.8)
5. **Individual Verify**: $S_iP = h_iR_i + vpk_i + Q_{IDi} + h_{i,0}P_{pub}$ (eq.6, p.8)
6. **Aggregate-Verify**: summed form (eq.10, p.9); 184 bytes/msg
7. Caveat: source eq.9 drops $Q_{IDi}$ vs eq.1/eq.5 (paper inconsistency, p.9 vs p.8)

---

## Wang et al. 2022 — Standard-Model CLAS [P]

*Source: [summaries/wang2022.md](summaries/wang2022.md) · Full-text (§V p.6; 2 pairings §VII.B p.10)*

1. **Setup**: $params = \{G_1, G_2, q, e, P, Q, P_{pub}, H_1, H_2, H_3\}$ (no random oracles)
2. **PseudonymGen**: $PID_{i,j} = \{ID_i \oplus H_1(kP + T_{i,j}), T_{i,j}\}$
3. **PPKGen/KeyGen**: $d_i = r_i + k_is$; $PK_i = (X_i, R_i)$
4. **Sign**: $W_i = (d_i + h_ix_i)Q + V_i$, $\sigma_i = (U_i, V_i, W_i)$
5. **Verify**: $e(W_i, P) = e(R_i + k_iP_{pub} + h_iX_i + U_i, Q)$ (eq.1, p.6)
6. **Aggregate-Verify**: summed form (eq.2, p.6); 2 pairings, zero map-to-point; 388 B / 784 B@n=100

---

## Wang C. et al. 2025 — ECAE for NDN-IoT [PF]

*Source: [summaries/wang2025-ecae.md](summaries/wang2025-ecae.md) · Full-text · scope NDN-IoT, NOT VANET*

1. **Setup**: $P_{pub} = sP$, $H_1, H_2, H_3$ (p.10)
2. **PseudonymGen**: $PID_i = \{MID_i, T_i\}$
3. **KeyGen**: $SK_i = d_i + h_{2i}x_i$, $PK_i = (K_i, R_i)$ (pp.12–13)
4. **Sign**: $V_i = u_i + h_{3i}SK_i$, $\sigma_i = (U_i, V_i)$
5. **Verify**: $V_iP = U_i + h_{3i}K_i + h_{2i}P_{pub}$ (pp.13–14)
6. **Aggregate-Verify**: $VP = U + \sum(h_{3i}K_i + h_{2i}P_{pub})$; constant-size aggregate; −46.18%/−55.56%

---

## Wang X. et al. 2025 — Detectable Invalid Signatures [P]

*Source: [summaries/wang2025-detectable.md](summaries/wang2025-detectable.md) · Full-text (§3 pp.4–5; 4 pairings)*

1. **Setup/KeyGen**: pairing-based CLAS key issuance
2. **Sign**: $S_i = r_iW + g_ix_iU + h_id_i$ (pp.4–5)
3. **Verify**: $e(S,P) = e(R,W)\,e(\sum g_iX_i,U)\,e(\sum h_iQ_i,K_{pub})$ — 4 pairings (p.5)
4. **Aggregate + Detect**: aggregate check, then Alg.1 vs Alg.2 invalid-signature search (p.5)

---

## Wei et al. 2025 — PF-CLS for IoT (single-signer, NOT aggregate) [PF]

*Source: [summaries/wei2025.md](summaries/wei2025.md) · Full-text (Def.1 p.8; §5 p.8)*

1. **Attack**: Common Factor Substitution ($X^*, R^*, T^*$ independent randoms, Def.1 p.8)
2. **Enhanced Sign**: modified ECC signing
3. **Verify**: $vP = T + h_2(X_{ID} + R_{ID} + h_1P_{pub})$ (p.8)
4. IoT-CLS scope — single signer, no aggregation; 480-bit signatures

---

## Wu & Heng 2025 — Collusion-Resistant CLAS [A]

*Source: [summaries/wu2025-collusion.md](summaries/wu2025-collusion.md) · Abstract-only (closed)*

No verified construction. Hedged claims only: Type-I/II/III resistance, MIRACL + NS3/SUMO evaluation. Unverified pending PDF.

---

## Wu & Ye 2025 — Pseudonym CLAS [PF]

*Source: [summaries/wu2025-pseudonyms.md](summaries/wu2025-pseudonyms.md) · Full-text (pp.124–139)*

1. **Setup**: four/five hashes $H_0$–$H_4$ (paper says "four", lists five, p.130)
2. **PseudonymGen**: $VID_i = RID_i \oplus H_0(x_iT_{pub})$ style pseudonyms (p.130)
3. **KeyGen**: partial + secret binding with $H_4$-collision Type-III argument (Thm.3, pp.133–134)
4. **Sign/Verify**: $\sigma_iP = U_i + h_{3,i}(PK_i + h_{1,i}P_{pub})$ (p.130)
5. **Aggregate-Verify**: summed form; generalized forking lemma (Alg.1/Lemma 1, p.127); 160 B / 112n+72 B

---

## Wu & Chen 2025 — Security-Enhanced CLASC [PF]

*Source: [summaries/wu2025-signcryption.md](summaries/wu2025-signcryption.md) · Full-text (§5.2 p.6)*

1. **Attack**: Dai et al. CLASC falls to Type-I public-key replacement (§4.2–4.3 p.5)
2. **Enhanced Signcrypt**: ECC-only combined encrypt+sign (no pairings, §5.2 p.6)
3. **Aggregate/Unsigncrypt**: $W$-summed aggregate, joint decrypt+verify; 92-byte signcryptions
4. IND-CCA2/CDH + EUF-CMA/ECDL in ROM via forking lemma (§6 pp.7–9)

---

## Xu et al. 2024 — Security-Enhanced CLAS [PF]

*Source: [summaries/xu2023.md](summaries/xu2023.md) · Full-text (§V pp.13487–13489)*

1. **Setup**: $P_{pub} = sP$, $T_{pub} = tP$, $H_0$–$H_4$ (p.13487)
2. **PseudonymGen**: $AID/MID/PID$ issue with $\Delta T_i$ (pp.13487–13488)
3. **PPKGen/KeyGen**: $d_i = r_i + sh_{1i}$; $SK_i = (x_i, d_i)$, $PK_i = (X_i, R_i)$ (p.13488)
4. **Sign**: $S_i = k_i + h_{2i}x_i + h_{3i}d_i$, $\sigma_i = (K_i, S_i)$ (p.13488)
5. **Verify**: $\alpha_i = S_iP - K_i - h_{2i}X_i - h_{3i}(R_i + h_{1i}P_{pub}) = 0$ (p.13488)
6. **Aggregate-Verify + BQS**: summed check + Binary Quick Search, Alg.1 (p.13488)
7. Revocation extension with $z_i$ (§VII, p.13494); 148 bytes/msg

---

## Yuan et al. 2023 — Standard-Model CLAS [P]

*Source: [summaries/yuan2023.md](summaries/yuan2023.md) · Full-text (cryptanalysis §4 pp.6–7; scheme §5 pp.7–9)*

1. **Attack**: KGC forgery ($Q = lP$ trapdoor) + public-key replacement on prior SM scheme (§4)
2. **Setup**: $y_{pub} = sP$, $Z = H_3(y_{pub})$, $H_1$–$H_5$ (pp.7–8)
3. **Sign**: $W_i = (d_i\varphi_i + h_ix_i + u_i)Z$, $\sigma_i = (U_i, W_i)$ (p.8)
4. **Verify**: $e(W_i, P) = e((R_i + k_iy_{pub})\varphi_i + h_iX_i + U_i, Z)$ (eq.3, pp.8–9)
5. **Aggregate-Verify**: summed form (eq.4, p.9); SM Theorems 1–2 under CDHP; 260 B / 656 B@n=100

---

## Yue et al. 2025 — Lightweight CLAS with Aggregator Signature [PF]

*Source: [summaries/yue2025.md](summaries/yue2025.md) · Full-text*

1. **Attack**: ephemeral/temporary rogue-key forgery on Zheng et al. via signature randomness
2. **Fix**: aggregator adds its own signature; simultaneous verification of aggregate + aggregator signature
3. **Costs**: Table 4 computation (ECC-only, no $T_{bp}/T_{htp}$), Table 5 communication (ours $3|G| + 3|\mathbb{Z}_q^*|$ vs Zheng $4|G| + 3|\mathbb{Z}_q^*|$)
4. Type-I/II only — NO Type-III claim

---

## Zhang et al. 2024 — Pairing-Free CLSC for IoMT [PF]

*Source: [summaries/zhang2024.md](summaries/zhang2024.md) · Full-text (§VII.D–F p.4353) · scope IoMT, NOT VANET*

1. **Setup/KeyGen**: ECC certificateless keys with zero-knowledge-proof binding idea
2. **Signcrypt**: $\theta = u + r \cdot f_s \cdot x_{IDs} + d_{IDs}$ (p.4353)
3. **Unsigncrypt/Verify**: $\theta P = U + r'(f_sY_{IDs} + T_s + h_sP_{pub})$ — publicly verifiable by anyone (p.4353)
4. $7T_{sm}$ total, 640-bit ciphertexts; IND-CLSC-CCA2 + EUF-CLSC-CMA, tight reduction without forking lemma

---

## Zhang et al. 2014 — Xiong-CLAS Cryptanalysis + New Scheme [P]

*Source: [summaries/zhang2014.md](summaries/zhang2014.md) · Full-text (§3.2 p.34; §4 pp.35–36)*

1. **Attack 1**: honest-but-curious KGC 4-stage forgery recovering $x_{ID_n}Q$ (§3.2.1 p.34)
2. **Attack 2**: malicious-but-passive KGC sets $Q = tP$ at setup (§3.2.2 pp.34–35)
3. **Attacks 3–4**: insider-signer collusion, insider + malicious-KGC collusion (most destructive)
4. **New scheme**: $T_1 = H_1(\ldots)$, $T_2 = H_2(\ldots)$, $S = r_{ID}T_1 + d_{ID}T_2$; short aggregate valid iff every individual signature valid (Theorem 1, §4 pp.35–36)

---

## Zheng et al. 2023 — Security-Enhanced Pairing-Free CLAS [PF]

*Source: [summaries/zheng2023.md](summaries/zheng2023.md) · Full-text (§V.B p.3827; §VI.A p.3827)*

1. **Attack**: Han key-recovery ($d_m = a \cdot h_{2m}$, $T_m = h_{2m}^{-1}$) (§V.B p.3827)
2. **Setup/KeyGen**: ECC-only params (scalar-mult/point-add, zero $e(\ldots)$ in construction)
3. **Sign/Verify/Aggregate**: pairing-free signing with revised key binding (§VI.A p.3827)
4. EUF-CMA in ROM; §VII Tables II–III timings (pp.3830–3831); later shown rogue-key vulnerable (Yue 2025)

---

## Provenance (Professor merge)

- Mode: aggregate index — 22 Full-text + 2 Abstract-only sources (han2022, wu2025-collusion carry no construction here).
- Access date: 2026-09-21.
- What changed (crew round 2): rebuilt every entry from the audited summaries — removed the pairing-based verification equation previously shown for Gong 2023 [PF]; replaced generic $D_i = sH(ID_i)$ / "pairing-free equation" placeholders with paper-true equations or explicit Abstract-only caveats; labeled the 5 pairing-based schemes [P]; fixed Yue 2025 (no Type-III); scoped ECAE/Wei/Zhang2024 out of VANET.
