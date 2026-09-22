# Taxonomy — CLAS-for-VANET Crew Audit (2026-09-21)

> Professor merge from 24 crew-audited summaries (22 Full-text + 2 Abstract-only:
> han2022, wu2025-collusion). Every paper below is verified against its Zotero PDF.

## 1. By construction family

| Family | Papers (n) | Notes |
|---|---|---|
| Pairing-based CLAS | 5: cahyadi2022-clas-scheme, wang2022, yuan2023, zhang2014, wang2025-detectable | Bilinear ê in verification; older/standard-model/detection designs |
| Pairing-free ECC CLAS | 13: gong2023, han2022[A], tao2026, vallent2021, wu2025-pseudonyms, wu2025-collusion[A], xu2023, yue2025, zheng2023, dai2022*, wu2025-signcryption*, zhang2024*, wang2025-ecae† | Scalar-mult only; [A]=Abstract-only; *=signcryption; †=NDN-IoT |
| HECC CLAS | 1: iqbal2023 | Genus-2, 80-bit, HCDLP |
| Single-signer CLS (no aggregation) | 1: wei2025 | IoT scope; attack + enhanced scheme |
| Surveys / reviews | 2: cahyadi2022-survey, lode2026 | Framework + break-fix tables; quantum-secure cryptanalysis |
| Cryptanalyses (no new construction) | 2: shim2023, shim2026 | KGC / replacement / recovery forgeries |

## 2. By security model

| Model | Papers |
|---|---|
| ROM + ECDLP/CDH, Type-I/II | cahyadi2022-clas-scheme, gong2023, iqbal2023 (HCDLP), tao2026, vallent2021, xu2023, yue2025, zheng2023, dai2022, wu2025-signcryption, zhang2024, wei2025, wang2025-ecae, han2022[A] |
| Standard model (CDHP) | wang2022, yuan2023 |
| Type-III (collusion) proven | wu2025-pseudonyms (Thm.3, H4-collision) |
| Type-III claimed, UNVERIFIED | wu2025-collusion[A] |

## 3. By privacy mechanism

- **Pseudonym + TA traceability**: cahyadi2022-clas-scheme, gong2023, tao2026, vallent2021, wang2022, wu2025-pseudonyms, xu2023, yuan2023, yue2025, zheng2023, dai2022, wu2025-signcryption, wang2025-detectable, wang2025-ecae, zhang2024
- **Open-channel encrypted identity (no secure channel)**: iqbal2023 (unique)
- **Invalid-signature identification**: wang2025-detectable (Alg.1 vs 2), xu2023 (Binary Quick Search)

## 4. Break-fix chains (attack → patch)

1. Xiong et al. 2013 → Zhang et al. 2014 (4 coalition attacks + new scheme)
2. LICLAS (HWMSN) → Gong et al. 2023 PCAS (forgery §4.2)
3. Wang et al. CLAS / Xiong et al. CLS → Shim 2023 (malicious-KGC + recovery)
4. Prior SM scheme → Yuan et al. 2023 (KGC + replacement forgery)
5. Chen et al. [19] → Xu et al. 2024 (replacement forgery, BQS)
6. Zheng et al. 2023 → Yue et al. 2025 (rogue-key → aggregator signature)
7. Dai et al. 2022 → Wu & Chen 2025 (replacement → enhanced CLASC)
8. PF-CLS class → Wei et al. 2025 (Common Factor Substitution → enhanced scheme)
9. Han et al. eCLAS → Zheng et al. 2023 (key recovery) → Yue et al. 2025
10. Zhu–Guan / Chen–Guan → Shim & Kwon 2026 (Type-I replacement → hash binding)

## 5. Gaps

- Type-III coverage: 1 verified + 1 hedged of 24 (4–8%)
- Standard model: 2 of 24 (wang2022, yuan2023 — both pairing-based)
- Deployment validation: analytic/MIRACL timings only; one NS3+SUMO claim unverified (wu2025-collusion[A])
- Post-quantum: only Lode 2026 survey (negative result)
- Out-of-scope but in-corpus: wang2025-ecae (NDN-IoT), wei2025 (IoT-CLS), zhang2024 (IoMT-CLSC) — labeled, not VANET evidence

## Provenance

- Mode: aggregate index over 22 Full-text + 2 Abstract-only summaries.
- Access date: 2026-09-21. Ground truth: `/home/sam/snap/zotero-snap/common/Zotero/storage/<KEY>/` + `research/clas-vanet-audit/sources/*.txt` (24 dumps).
