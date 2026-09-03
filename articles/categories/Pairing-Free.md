---
title: "Pairing-Free Schemes"
aliases: [Pairing-Free, pairing-free, no-bilinear-pairing]
tags: [category, pairing-free, ECC, efficiency]
---

# Pairing-Free Schemes

> Schemes eliminating expensive bilinear pairing operations $e: G_1 \times G_1 \to G_2$. Use only ECC scalar multiplication — critical for VANET resource constraints.

## Why Pairing-Free Matters

| Operation | Cost (relative) |
|-----------|----------------|
| Scalar multiplication | 1× |
| Bilinear pairing | 10–20× |
| Map-to-point hash | 5–10× |

Pairing-free schemes achieve **10–20× faster verification** than pairing-based schemes.

## Papers (13 of 24 are pairing-free)

### CLAS — Pairing-Free
| Paper | Year | ECC | Type III | Notable |
|-------|------|:---:|:---:|---------|
| [[cahyadi2022-clas-scheme]] | 2022 | ✓ | ✗ | Foundational |
| [[gong2023]] | 2023 | ✓ | ✗ | 25% reduction |
| [[han2022]] | 2022 | ✓ | ✗ | eCLAS, V2I |
| [[tao2026]] | 2026 | ✓ | ✗ | **SOTA efficiency** |
| [[vallent2021]] | 2021 | ✓ | ✗ | Smart grid |
| [[wang2022]] | 2022 | ✓ | ✗ | Standard model |
| [[wang2025-ecae]] | 2025 | ✓ | ✗ | 46% reduction |
| [[wang2025-detectable]] | 2025 | ✓ | ✗ | Invalid detection |
| [[wu2025-pseudonyms]] | 2025 | ✓ | ✓ | Type III, MIRACL |
| [[wu2025-collusion]] | 2025 | ✓ | ✓ | Type III, NS3+SUMO |
| [[xu2023]] | 2023 | ✓ | ✗ | Security-enhanced |
| [[yuan2023]] | 2023 | ✓ | ✗ | Standard model |
| [[yue2025]] | 2025 | ✓ | ✓ | Rogue key fix |
| [[zheng2023]] | 2023 | ✓ | ✗ | Rogue key vulnerable |

### CLS — Pairing-Free
| Paper | Year | Focus |
|-------|------|-------|
| [[wei2025]] | 2025 | IoT, novel attack class |

### Signcryption — Pairing-Free
| Paper | Year | Focus |
|-------|------|-------|
| [[dai2022]] | 2022 | CLASC for vehicular sensors |
| [[wu2025-signcryption]] | 2025 | Security-enhanced CLASC |
| [[zhang2024]] | 2024 | CLSC for IoMT |

### NOT Pairing-Free
| Paper | Year | Why |
|-------|------|-----|
| [[iqbal2023]] | 2023 | HECC (different curve, not pairing-free) |
| [[zhang2014]] | 2014 | Uses bilinear maps |

## Efficiency Comparison

| Scheme | Year | Computation Reduction | Pairing-Free |
|--------|------|----------------------|:---:|
| [[tao2026]] | 2026 | ≥24.3% | ✓ |
| [[wang2025-ecae]] | 2025 | 46.18% | ✓ |
| [[gong2023]] | 2023 | 16.56–25.34% | ✓ |

## Related Categories
- [[CLAS]] — all aggregate schemes
- [[CLS]] — non-aggregate schemes
