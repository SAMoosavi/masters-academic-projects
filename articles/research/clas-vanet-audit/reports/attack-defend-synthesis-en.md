# Attack and Defend Synthesis for Pairing-Free CLS/CLAS in VANETs

## Bibliographic

- Synthesis of 24-paper CLAS-for-VANET audit (22 Full-text + 2 Abstract-only: han2022, wu2025-collusion), built from `reports/*-en.md` and `vault/atomic/attackdefend-*.md` (2026-09-21 audit).
- Attack sources: Zhang et al. 2014 Inf. Sci. 287:32-37 DOI 10.1016/j.ins.2014.07.019 (p.32); Shim 2023 IEEE Access 11:33956-33963 DOI 10.1109/ACCESS.2023.3263738 (p.1); Shim & Kwon 2026 ICT Express 12:566-570 DOI 10.1016/j.icte.2026.02.012 (p.1); Gong et al. 2023 Ad Hoc Netw. 144:103134 (p.1); Zheng et al. 2023 IEEE Syst. J. 17:3822-3833 (p.3822); Yue et al. 2025 Sci. Rep. 15:23663 (p.1); Xu et al. 2024 IEEE IoT-J 11:13482-13495 (pp.13485-13487); Wu & Chen 2025 Veh. Commun. 53:100897 (p.5); Wei et al. 2025 Sensors 25:5224 (pp.7-8); Yuan et al. 2023 Mathematics 11:4766 (pp.6-7); Lode & Pinapati 2026 Comput. Electr. Eng. 135:111174 (pp.12-13); Wu & Ye 2025 IEEE IoT-J 12:124-139 (p.130).
- Defend sources: PCAS §5.2 p.8, Yuan §5 pp.8-9, Xu §V p.13488, Yue pp.8-9, Wu-Ye p.130 + Thm.3 pp.133-134, Wei §5 p.8, Shim-Kwon §3.3 p.4.
- Atomic notes: [[attackdefend-kgc-trapdoor]], [[attackdefend-collusion-type3]], [[attackdefend-replacement-cancellation]], [[attackdefend-eta-key-recovery]], [[attackdefend-common-factor]], [[attackdefend-liclas-forgery]], [[attackdefend-rogue-key]], [[attackdefend-sum-cancellation]], [[attackdefend-unattacked-inventory]].

## Problem

- VANET CLAS must compress `n` vehicle signatures into one aggregate while resisting Type-I replacement, Type-II/KGC, and Type-III collusion under ECDLP in ROM, yet most pairing-free proposals fall to linear-cancellation forgeries (p.1, Abstract Shim2023; p.32, Zhang2014).
- Pairing-based to pairing-free migration kept the same linear verify shape `sP = U + h(R + h1 Ppub) + ...`, so KGC-trapdoor, replacement, eta-shift, common-factor, rogue-key and sum-cancellation attacks transfer to PF-ECC without needing any pairing (p.4, §3.3 Shim2026; p.8, §5 Wei2025).
- Field needs one place mapping each attack idea to its minimal defend patch, which papers each attack already breaks, and which PF-CLS/PF-CLAS schemes remain unattacked as targets (p.11, Lode2026 gaps; p.19, cost/latency bounds).

## Method

- Rebuilt 7 attack families from audited reports + dumps, one atomic note per family with `attack equation + why-defend + PF-transfer` and `source:: [[*-en]] p.X` grounding (2026-09-21 audit).
- KGC trapdoor: `Q = alpha P`, `Wi - alpha hi Xi - Vi = di Q`, `Wi' = di Q + alpha hi' Xi + Vi'` passing `e(Wi',P) = e(Ri + ki Ppub + hi' Xi + Ui', Q)` (p.5, §III.A Shim2023); same as Zhang2014 `Q = tP` (pp.34-35) and Yuan2023 `Q = lP` (pp.6-7).
- Replacement cancellation: Zhu-Guan `B = -h3 Ppub`, `z = a' + x' h4` with `B + A' + h3 Ppub + h4 X' = zP` (p.3, §3.1 Shim2026); Chen-Guan `theta = b - x' h4`, `c' = theta + x' h4'` reusing `B` (pp.3-4, §3.2); Xu `Kl' = zl P - h2l Ppub` (pp.13486-13487); Dai `K' = -h_ID Ppub` (p.5, Wu-Chen2025).
- Eta/key-recovery: `eta = alpha - alpha'`, `A' = A + eta Spub` (pp.5-6, §III.C); `S = (beta-beta')(alpha-alpha')^-1`, `delta = beta - alpha S` (p.6, §III.D Shim2023).
- Common-factor: `X* = x* Ppub, R* = r* Ppub, T* = t* Ppub` per Def.1 (p.8, Wei2025) plus Han `dm = a h2m` recovery (p.3827, Zheng2023).
- Rogue-key: ephemeral `Ui`-derived rogue key + own key passes undetected (p.1, Yue2025); fixed by aggregator `s0` over `M0 = (Uset,PKset,PIDset)` with two-step `s0 P` then `sP` (pp.8-9, Yue2025).
- Sum-cancellation: `z1' = z1 + Delta, z2' = z2 - Delta` sum + `beta_ver` unchanged (pp.12-13, Lode2026); fixed by `eta = H4(X1..Xn)` (p.130, Wu-Ye2025) or weighted `sum ri zi` (p.13, Lode2026).
- Inventory split PF-CLS (single) vs PF-CLAS (aggregate) vs PF-CLSC (signcryption) with pairing-family labels from `protocols.md` index (pp.6-9).

## Key findings

- KGC trapdoor is blocked by hiding `Q` via `H4(Q)` (p.7, §IV Shim2023) and in PF by `Z = H3(y_pub)`, `Wi = (di phi + hi xi + ui) Z` (pp.8-9, Yuan2023) or `h1 = H1(PID,PK,Ppub)` + `pskP = R + h1 Ppub` check (p.130, Wu-Ye2025).
- Coalition/Type-III is blocked by verifier-key `r = H(e(r1,Y),...)` iff-every-single-valid theorem (p.36, Zhang2014) and in PF by `Xi = h3i^-1(siP-Ui)`, `eta = H4(..)` reducing forgery to `H4` collision Thm.3 (pp.133-134, Wu-Ye2025).
- Replacement is blocked by `h5 = H5(PID,X,A,B)`, `h6 = H6(..)`, `z = h5 b + h6 c + x h4` at `3n+2` mults (p.4, §3.3 Shim2026), and in PF-CLS by `h1 = H1(ID,X,R,Ppub)`, `vP = T + h2(X + R + h1 Ppub)` (p.8, Wei2025).
- Eta/key-recovery is blocked by `w = H1(PID||T||A)`, `alpha = H2(M||PID||Spub||A||t)` + fresh randomness per sign (p.7, §IV Shim2023).
- LICLAS `Wi` flaw is blocked by PCAS `wi = [h3(d + alpha x) + y1 h4]`, `Y = sum h4 Y1`, `wP - Y = sum(h3 D + h1 Ppub)` with `-25%/-16.56%/-25.34%` gains (p.8, §5.2; pp.13-14, Gong2023).
- Rogue-key is blocked by aggregator signature `s0` + two-step verification at `3|G| + 3|Zq*|` with Type-I/II-only model, no Type-III claim (pp.8-9; pp.12-13 Table 5, Yue2025).
- Sum-cancellation is blocked by weighted aggregation or `H4` integrity tag, with `+30-50%` hardening cost and `n > 500` exceeding `100-300 ms` safety window (p.13; pp.17-19, Lode2026).
- Breaks confirmed: Liu-LICLAS, Han-eCLAS, Zheng2023, Dai22, Chen[19], Zhu-Guan24, Chen-Guan25, Xiang/Du/Karati/Pakniat-CLS, Xiong-CPPA-D, Cui2018, Huang-QS (see per-attack notes above).
- Unbroken PF-CLAS targets: Tao-Cui 2026 ES-CLAS (p.1), Vallent 2021 ECLAS eq.2 p.8 (eq.9 p.9 drops `Q_IDi`), Xu 2024 + BQS p.13488, Wu-Ye 2025 p.130, Gong PCAS p.8, Wu-Chen enhanced p.6, Yue 2025 pp.8-9, Iqbal HECC p.8 (reuses eCLAS[29]); PF-CLS target: Wei enhanced p.8; Abstract-only Han2022/Wu-Heng untestable.

## Limitations

- All defends except Yuan2023/Wang2022 are ROM-only under ECDLP/CDH with forking-lemma proofs, no standard-model PF-CLAS and no post-quantum proof in corpus (pp.131-133 Wu-Ye2025; pp.10-12 Gong2023; p.19 Lode2026).
- Hardened verification costs `3n+2` mults (p.4, Shim2026) or `+30-50%` signing (p.19, Lode2026), judged heavy for dense 5G-V2X toward 6G without a concrete next-gen construction (pp.4-5, §§3.3-4 Shim2026).
- Yue aggregator fix adds `s0` overhead and assumes fully-trusted TA plus honest-but-curious non-colluding KGC, leaving TA-compromise and KGC-user collusion outside the model (p.3; pp.9-10, Yue2025).
- Xu BQS and Wang-detectable Alg.1/2 isolate invalid singles only after aggregate failure with linear `3n` work, plus penalty/bisection handling uncaptured in cost tables (p.9 Xu2024; p.5 Wang-detectable).
- Inventory is corpus-bounded (24 papers, 2026-09-21 dumps); absence of a published break is not immunity, especially Tao/Vallent/Xu/Iqbal plain-sum schemes flagged above as first to test with gamma/rogue/CFS attacks.

## Related Work

- KGC/coalition base: [[zhang2014-en]] 4-attacks + short-aggregate `S = rID T1 + dID T2` Thm.1 (pp.34-36); [[shim2023-en]] Wang trapdoor + Xiong eta/recovery (pp.5-7); [[yuan2023-en]] SM KGC + replacement + `Z` fix (pp.6-9).
- Replacement/rogue chain: [[shim2026-en]] Zhu/Chen forgeries + `h5/h6` patch (pp.3-4); [[xu2023-en]] Chen forgery + BQS (pp.13486-13488); [[wu2025-signcryption-en]] Dai forgery + enhanced CLASC (pp.5-6); [[yue2025-en]] Zheng rogue + aggregator `s0` (pp.1-9); [[zheng2023-en]] Han recovery + ECC construction (p.3827).
- Class breaks: [[wei2025-en]] CFS Def.1 + `H1(ID,X,R,Ppub)` fix (pp.7-8); [[gong2023-en]] LICLAS forgery + PCAS (pp.5-8); [[lode2026-en]] Huang cancellation + weighted fix (pp.12-13); [[wu2025-pseudonyms-en]] `eta = H4(..)` Type-III Thm.3 (pp.130-134).
- Unattacked constructions: [[tao2026-en]], [[vallent2021-en]], [[iqbal2023-en]], [[wang2025-ecae-en]], [[zhang2024-en]], [[han2022-en]] (Abstract-only), [[wu2025-collusion-en]] (Abstract-only).
- Atomic evidence: [[attackdefend-kgc-trapdoor]], [[attackdefend-collusion-type3]], [[attackdefend-replacement-cancellation]], [[attackdefend-eta-key-recovery]], [[attackdefend-common-factor]], [[attackdefend-liclas-forgery]], [[attackdefend-rogue-key]], [[attackdefend-sum-cancellation]], [[attackdefend-unattacked-inventory]].

## Provenance

- Mode: Full-text synthesis — no new equations, all copied from audited `summaries/*.md` + `reports/*-en.md` with locators preserved.
- Endpoints: local `research/clas-vanet-audit/sources/*.txt` dumps + `reports/*-en.md` + `vault/atomic/*.md`; no Zotero re-read, no network fetch.
- Access date: 2026-09-23.
- Expected-vs-retrieved: expected 7 attack families + defend patches + PF-CLS vs PF-CLAS inventory; retrieved 8 attackdefend notes + 1 inventory note + this report, all wikilinked with `source::` + pages.
- Warnings: Abstract-only han2022/wu2025-collusion carry no construction; out-of-scope wang2025-ecae/wei2025/zhang2024 labeled, not VANET evidence; `CANNOT` means no published break in corpus, not proven immunity.
