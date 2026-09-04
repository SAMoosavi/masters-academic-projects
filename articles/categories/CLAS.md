---
title: "CLAS — Certificateless Aggregate Signature"
aliases: [Certificateless Aggregate Signature, CLAS]
tags: [category, CLAS, VANET, signature]
---

# CLAS — Certificateless Aggregate Signature

> Combines $n$ individual signatures from different signers on different messages into a single short signature. Core primitive for VANET batch authentication.

## Properties

- $n$ signers $\to$ 1 aggregate signature $\sigma = \sum_{i=1}^{n} \sigma_i$
- Verification in constant time regardless of $n$
- Reduces communication overhead (1 signature vs $n$)
- RSU verifies all vehicles in one operation

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[cahyadi2022-clas-scheme]] | 2022 | Foundational VANET CLAS | ✓ | ✗ |
| [[gong2023]] | 2023 | PCAS, 25% overhead reduction | ✓ | ✗ |
| [[han2022]] | 2022 | eCLAS, V2I optimized | ✓ | ✗ |
| [[iqbal2023]] | 2023 | HECC-based (hyperelliptic) | ✗ | ✗ |
| [[tao2026]] | 2026 | ES-CLAS, $\geq 24.3\%$ reduction, SOTA | ✓ | ✗ |
| [[vallent2021]] | 2021 | VANET + smart grid | ✓ | ✗ |
| [[wang2022]] | 2022 | Standard model CLAS | ✓ | ✗ |
| [[wang2025-ecae]] | 2025 | NDN-IoT, 46% computation reduction | ✓ | ✗ |
| [[wang2025-detectable]] | 2025 | Invalid signature detection | ✓ | ✗ |
| [[wu2025-pseudonyms]] | 2025 | Type I+II+III, MIRACL validated | ✓ | ✓ |
| [[wu2025-collusion]] | 2025 | Type I+II+III, NS3+SUMO | ✓ | ✓ |
| [[xu2023]] | 2023 | Security-enhanced CLAS | ✓ | ✗ |
| [[yuan2023]] | 2023 | Standard model CLAS | ✓ | ✗ |
| [[yue2025]] | 2025 | Rogue key fix, aggregator sig | ✓ | ✓ |
| [[zheng2023]] | 2023 | Vulnerable to rogue key | ✓ | ✗ |

## Related Categories

- [[CLS]] — non-aggregate variant
- [[Pairing-Free]] — computational optimization
- [[Detect-Invalid]] — invalid signature detection
- [[Signcryption]] — combined encryption + signature
- [[Cryptanalysis]] — attack papers
