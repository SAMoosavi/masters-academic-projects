---
title: "Detect-Invalid — Invalid Signature Detection"
aliases: [Invalid Signature Detection, Detect Malicious, Find Bad Signatures]
tags: [category, detection, invalid-signature, malicious]
---

# Detect-Invalid — Invalid Signature Detection

> When aggregate verification fails, identifying **which** individual signatures are invalid and **who** signed them. Critical for VANET accountability.

## Properties

- Traditional CLAS: RSU rejects all — no idea who forged
- Detection approach: test individual $\sigma_i$ to identify malicious vehicle and trace identity
- Detection only runs when verification fails (rare) — low overhead
- Accountability: malicious vehicles must be identified, not just rejected
- False safety messages $\to$ accidents; need to trace source
- Evidence for traffic violations requires identity

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[wang2025-detectable]] | 2025 | Test individual $\sigma_i$ against $e(\sigma_i P, P) = e(R_i, P) \cdot e(h_i PK_i + D_i, P_{pub})$ | ✓ | ✗ |
| [[shim2023]] | 2023 | KGC forging signatures, malicious-but-passive KGC attack | ✗ | ✗ |
| [[shim2026]] | 2026 | Public key replacement forgery, Type I forgery analysis | ✗ | ✗ |
| [[zhang2014]] | 2014 | Coalition attacks, insider + KGC collusion | ✗ | ✗ |
| [[wei2025]] | 2025 | Forged signatures (Type I), novel attack class | ✓ | ✗ |
| [[tao2026]] | 2026 | Lightweight conditional traceability, TA reveals real identity | ✓ | ✗ |
| [[wu2025-pseudonyms]] | 2025 | Pseudonym-based traceability | ✓ | ✓ |
| [[wu2025-collusion]] | 2025 | Pseudonym-based traceability | ✓ | ✓ |
| [[yue2025]] | 2025 | Aggregator signature for accountability | ✓ | ✓ |

## Related Categories

- [[CLAS]] — all aggregate signature schemes
- [[Pairing-Free]] — computational optimization
- [[Cryptanalysis]] — attack papers identifying malicious signers
