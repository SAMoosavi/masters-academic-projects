# N04 — PF-CLAS baselines for comparison rows (Han 2022 eCLAS, Gong 2023 PCAS)

citekey: hanECLASEfficientPairingFree2022 / gongPCASCryptanalysisImprovement2023
doi: 10.1109/JSYST.2021.3116029 / 10.1016/j.adhoc.2023.103134
read: partial (abstract + intro snapshot for Han; full summary for Gong) | reader: read tool (local notes)
read-on: 2026-10-05

## Source files (local notes)
- `han` = proposal/summaries/hanECLASEfficientPairingFree2022.md
- `gong` = proposal/summaries/gongPCASCryptanalysisImprovement2023.md

## One-line summary
Two local pairing-free CLAS baselines: eCLAS (Han 2022) aggregates signatures on different messages from different vehicles with a verification-advantage claim but no cost numbers in the snapshot; PCAS (Gong 2023) adds pseudonym-based conditional privacy, batch verification at AS, and full cost figures, but its aggregate-failure path requires expensive one-by-one re-verification.

---

## 1. Han 2022 — eCLAS (IEEE Systems Journal)

### Mechanism
- Pairing-free CLAS built on ECC (no bilinear pairing), targeting V2I communication — locator: han:21 — quote: "eCLAS از ECC (Elliptic Curve Cryptography) بدون عملیات pairing استفاده می‌کند"
- Aggregates individual signatures on **different messages from different vehicles** into one short aggregate signature — locator: han:23 — quote: "امضاهای فردی روی پیام‌های مختلف از وسایل نقلیه مختلف به یک امضای کوتاه واحد تجمیع می‌شوند"
- RSU acts as aggregator in a V2I scenario with tamper-proof OBUs — locator: han:24–25
- Security proven in the Random Oracle Model under ECDLP, resilient to adaptive chosen-message attack — locator: han:30–32

### Detection gap
- Cheater/forger identification in the aggregate is **not prominent** in the visible abstract/section list — locator: han:46 — quote: "بخش کشف متقلب/امضای نامعتبر در امضای تجمیعی (cheater/forger identification) که برای کاربرد عملی RSU لازم است، در چکیده و فهرست بخش‌های قابل‌مشاهده برجسته نیست"
- Conditional privacy is not explicitly confirmed in the snapshot (only inferred) — locator: han:33

### Cost figures
- **Not available** in the local snapshot: exact computation/communication overhead numbers are in paywalled sections V–VI — locator: han:38 — quote: "اعداد دقیق هزینه محاسباتی/ارتباطی … در نسخه ذخیره‌شده موجود نیست"
- Only abstract-level claim: verification advantage over existing schemes — locator: han:37

---

## 2. Gong 2023 — PCAS (Ad Hoc Networks)

### Mechanism
- Pairing-free CLAS on ECC; avoids bilinear pairing and Map-to-Point hash — locator: gong:17 — quote: "هیچ عملیات bilinear pairing و Map-to-Point-hash ندارد"
- Entities: OBU, RSU, AS, KGC (partial key, secret `s2`), TA (tracing, secret `s1`) — locator: gong:18
- Pseudonym-based conditional privacy: `pid_{i,j} = RID_i ⊕ H(s1·K_{i,j}, T_{i,j})`; only TA can trace — locator: gong:19
- Signature: `σ_i = (Y1_i, w_i)` with `w_i = [h3_i(d_{i,j} + α_{i,j}x_i) + y1_i·h4_i] mod q` — locator: gong:22–24
- RSU aggregates `n` signatures: `Y = Σ h4_i·Y1_i`, `w = Σ w_i`; AS verifies with one equation `wP − Y = Σ(h3_i·D_{i,j} + h1_i·P_pub)` — locator: gong:25–27
- Security: ROM + ECDLP via forking lemma; Type I/II/IV adversary games — locator: gong:35–37

### Detection gap
- On aggregate verification failure, the scheme falls back to **one-by-one re-verification** (expensive) — locator: gong:60 — quote: "هنگام شکست تأیید تجمیعی باید دوباره تأیید تک‌به‌تک انجام شود که پرهزینه است"
- Batch size is **fixed, not dynamic** — locator: gong:60 — quote: "اندازه‌ی دسته (batch size) ثابت است نه پویا"
- No built-in cheater identification to avoid the O(n) re-verification — locator: gong:60

### Cost figures
- Signature size: **480 bits** (`|G| + |Z_q*|`), fixed for single and aggregate — locator: gong:44
- vs Liu [18]: 640 bits → **25% reduction** (1 and 2000 messages) — locator: gong:45–46
- PCAS timing: sign **0.1706 ms**, verify **0.6690 ms**, aggregate **0.1684n + 0.0014 ms**, aggregate verification **0.3368n + 0.1652 ms** — locator: gong:48
- vs Liu [18]: **16.56%** (1 msg) and **25.34%** (2000 msgs) computation reduction — locator: gong:50
- 2000-message verification delay: PCAS ≈ **0.6738 s** vs [18] ≈ 1.014 s — locator: gong:51
- MIRACL primitives: `T_ecsm = 0.1652 ms`, `T_bpsm = 4.8726 ms`, `T_bp = 4.4410 ms` — locator: gong:42

---

## 3. Side-by-side comparison

| Property | eCLAS (Han 2022) | PCAS (Gong 2023) |
|---|---|---|
| Pairing-free | Yes (ECC) — han:21 | Yes (ECC) — gong:17 |
| Aggregation | Different messages, different vehicles — han:23 | Batch at RSU, verify at AS — gong:25–27 |
| Conditional privacy | Not explicit in snapshot — han:33 | Pseudonym-based, TA traces — gong:19 |
| Cheater detection | Not prominent — han:46 | Re-verify one-by-one on failure — gong:60 |
| Signature size | Not in snapshot — han:38 | 480 bits fixed — gong:44 |
| Verification cost | Not in snapshot — han:38 | 0.3368n + 0.1652 ms — gong:48 |
| Security model | ROM, ECDLP, ACMA — han:30–32 | ROM, ECDLP, forking lemma — gong:35–37 |

## 4. Relevance to T7 (comparison rows)
- eCLAS provides a verification-advantage baseline but **no local cost numbers** — comparison must cite its abstract claim only.
- PCAS provides concrete cost figures (480-bit signature, 0.3368n + 0.1652 ms aggregate verification) and a clear detection gap (O(n) re-verification on batch failure) that a new cheater-detecting scheme can target.

## Readability verdict
- Han 2022: **partial** — only abstract, metadata, and intro paragraphs available; sections IV–V (scheme details, security proof, evaluation tables) are paywalled and absent from the snapshot (han:11, han:38).
- Gong 2023: **full** — local summary covers mechanism, security, and evaluation with specific numbers.

## Self-check
- [x] identity fields match candidates row (DOIs, venues)
- [x] every claim has a locator (file:line) and short quote
- [x] every number has a locator; units attached
- [x] readability verdict filled
- [x] zero claims inferred from abstract presented as full-text findings (Han gaps explicitly marked as inference)
