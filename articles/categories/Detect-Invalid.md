---
title: "Detect Invalid/Malicious Signatures"
aliases: [Invalid Signature Detection, Detect Malicious, Find Bad Signatures]
tags: [category, detection, invalid-signature, malicious]
---

# Detect Invalid/Malicious Signatures from CLAS

> When aggregate verification fails, identifying **which** individual signatures are invalid and **who** signed them. Critical for VANET accountability.

## The Problem

In CLAS, $n$ signatures are aggregated into one $\sigma$. If verification fails:
- ❌ Traditional: RSU rejects all — no idea who forged
- ✅ Detection: Test individual $\sigma_i$ → identify malicious vehicle → trace identity

## Papers Addressing Detection

### Direct Detection Focus
| Paper | Year | Detection Method | Trace Identity |
|-------|------|------------------|:---:|
| [[wang2025-detectable]] | 2025 | Test individual $\sigma_i$ against $e(\sigma_i P, P) = e(R_i, P) \cdot e(h_i PK_i + D_i, P_{pub})$ | ✓ |

### Cryptanalysis Identifying Malicious Signers
| Paper | Year | What They Detect | Method |
|-------|------|------------------|--------|
| [[shim2023]] | 2023 | KGC forging signatures | Malicious-but-passive KGC attack |
| [[shim2026]] | 2026 | Public key replacement forgery | Type I forgery analysis |
| [[zhang2014]] | 2014 | Coalition attacks | Insider + KGC collusion |
| [[wei2025]] | 2025 | Forged signatures (Type I) | Novel attack class |

### Traceability (Conditional Privacy)
| Paper | Year | Trace Mechanism |
|-------|------|-----------------|
| [[tao2026]] | 2026 | Lightweight conditional traceability — TA reveals real identity |
| [[wu2025-pseudonyms]] | 2025 | Pseudonym-based traceability |
| [[wu2025-collusion]] | 2025 | Pseudonym-based traceability |
| [[yue2025]] | 2025 | Aggregator signature for accountability |

## Detection Algorithm (from wang2025-detectable)

```
Input: aggregate σ, all R_i, all (ID_i, PK_i, h_i)
1. Check aggregate: e(σP, P) =? e(R, P) · ∏e(h_iPK_i + D_i, P_pub)
2. If FAIL → detection phase:
3. For each i from 1 to n:
4.   Check: e(σ_iP, P) =? e(R_i, P) · e(h_iPK_i + D_i, P_pub)
5.   If FAIL → vehicle i is malicious
6.   Output (ID_i, PK_i) as identified attacker
```

## Why This Matters for VANETs

1. **Accountability**: Malicious vehicles must be identified, not just rejected
2. **Safety**: False safety messages → accidents; need to trace source
3. **Legal**: Evidence for traffic violations requires identity
4. **Efficiency**: Detection only runs when verification fails (rare)

## Related Categories
- [[CLAS]] — all aggregate signature schemes
- [[Pairing-Free]] — computational optimization
