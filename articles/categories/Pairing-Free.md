---
title: "Pairing-Free Schemes"
aliases: [Pairing-Free, pairing-free, no-bilinear-pairing]
tags: [category, pairing-free, ECC, efficiency]
---

# Pairing-Free Schemes

> Schemes eliminating expensive bilinear pairing operations $e: G_1 \times G_1 \to G_2$. Use only ECC scalar multiplication — critical for VANET resource constraints.

## Properties

- Scalar multiplication: $1\times$ cost (baseline)
- Bilinear pairing: $10\text{--}20\times$ cost
- Map-to-point hash: $5\text{--}10\times$ cost
- Pairing-free schemes achieve $10\text{--}20\times$ faster verification than pairing-based schemes

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[cahyadi2022-clas-scheme]] | 2022 | Foundational VANET CLAS | ✓ | ✗ |
| [[gong2023]] | 2023 | PCAS, 25% overhead reduction | ✓ | ✗ |
| [[han2022]] | 2022 | eCLAS, V2I optimized | ✓ | ✗ |
| [[tao2026]] | 2026 | ES-CLAS, $\geq 24.3\%$ reduction, SOTA efficiency | ✓ | ✗ |
| [[vallent2021]] | 2021 | VANET + smart grid | ✓ | ✗ |
| [[wang2022]] | 2022 | Standard model CLAS | ✓ | ✗ |
| [[wang2025-ecae]] | 2025 | NDN-IoT, 46% computation reduction | ✓ | ✗ |
| [[wang2025-detectable]] | 2025 | Invalid signature detection | ✓ | ✗ |
| [[wu2025-pseudonyms]] | 2025 | Type I+II+III, MIRACL validated | ✓ | ✓ |
| [[wu2025-collusion]] | 2025 | Type I+II+III, NS3+SUMO | ✓ | ✓ |
| [[xu2023]] | 2023 | Security-enhanced CLAS | ✓ | ✗ |
| [[yuan2023]] | 2023 | Standard model CLAS | ✓ | ✗ |
| [[yue2025]] | 2025 | Rogue key fix, aggregator sig | ✓ | ✓ |
| [[zheng2023]] | 2023 | Rogue key vulnerable | ✓ | ✗ |
| [[wei2025]] | 2025 | IoT CLS, novel attack class | ✓ | ✗ |
| [[dai2022]] | 2022 | CLASC for vehicular sensors | ✓ | ✗ |
| [[wu2025-signcryption]] | 2025 | Security-enhanced CLASC | ✓ | ✗ |
| [[zhang2024]] | 2024 | CLSC for IoMT | ✓ | ✗ |

## Related Categories

- [[CLAS]] — all aggregate schemes
- [[CLS]] — non-aggregate schemes
- [[Signcryption]] — combined encryption + signature
