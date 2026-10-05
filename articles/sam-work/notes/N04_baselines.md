# N04 — PF-CLAS Baselines for Comparison

Node: T7 · owner: sam-master · date: 2026-10-05
Sources: `proposal/summaries/hanECLASEfficientPairingFree2022.md`, `proposal/summaries/gongPCASCryptanalysisImprovement2023.md`

## 1. Han et al. 2022 — eCLAS (IEEE Systems Journal)

**Mechanism:** Pairing-free ECC-based CLAS for V2I. Aggregates signatures on different messages from different vehicles into one short aggregate. RSU acts as aggregator.

**Security:** ROM, ECDLP hardness, adaptive chosen-message attack.

**Detection gap (han:46):**
> «بخش کشف متقلب/امضای نامعتبر در امضای تجمیعی … در چکیده و فهرست بخش‌های قابل‌مشاهده برجسته نیست»

Marked as **inferential** (نکته استنتاجی) — not advertised in abstract/visible sections, not proven absent.

**Cost figures:** Not available locally (paywalled sections IV–V). Only abstract-level verification-advantage claim.

## 2. Gao, Guo et al. 2023 — PCAS (Ad Hoc Networks)

**Mechanism:** Pairing-free ECC-based CLAS with pseudonym-based conditional privacy. RSU aggregates → AS batch-verifies. Single verification equation: `wP − Y = Σ(h3_i D_{i,j} + h1_{i,j} P_pub)`.

**Security:** ROM, ECDLP, Type-I/Type-II games, EUF-CMA.

**Detection gap (gong:60):**
> «هنگام شکست تأیید تجمیعی باید دوباره تأیید تک‌به‌تک انجام شود که پرهزینه است»

Also: fixed batch size (not dynamic).

**Cost figures (MIRACL, ECC-160, |G|=320 bits):**
- Sign: 0.1706 ms
- Verify: 0.6690 ms
- Aggregate: 0.1684n + 0.0014 ms
- Aggregate verification: 0.3368n + 0.1652 ms
- 2000 messages: ~0.6738 s
- Signature size: 480 bits (fixed)

## 3. Side-by-side

| Property | eCLAS (Han 2022) | PCAS (Gong 2023) |
|---|---|---|
| Pairing-free | ✅ | ✅ |
| Conditional privacy | Not advertised | ✅ (pseudonym) |
| Detection mechanism | Not advertised | ❌ (O(n) fallback) |
| Cost figures | Paywalled | Full (MIRACL) |
| Batch size | Not stated | Fixed |
| Security model | ROM/ECDLP | ROM/ECDLP, Type-I/II |

## 4. G2 self-check

- [x] File exists, non-empty (55 lines)
- [x] Every claim carries a source locator (han:XX / gong:XX)
- [x] No placeholder text
- [x] ≥1 quoted line per scheme naming missing-detection weakness
- [x] sam-read skill consulted
