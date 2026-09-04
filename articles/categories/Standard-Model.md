---
title: "Standard Model Proofs"
aliases: [Standard Model, no-random-oracle]
tags: [category, standard-model, security-proof]
---

# Standard Model Proofs

> Security proofs that do **not** rely on the Random Oracle Model (ROM). Stronger guarantees — ROM proofs may not translate to real implementations.

## Properties

- ROM: hash functions = random oracles, idealized, lower overhead
- Standard model: concrete hash properties, realistic, higher overhead
- Only 2 of 15 CLAS papers use standard model ($13\%$)
- Higher computation for stronger guarantees
- Standard model proofs are closer to real-world security

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[wang2022]] | 2022 | CLAS, CDHP assumption | ✓ | ✗ |
| [[yuan2023]] | 2023 | CLAS, CDHP assumption | ✓ | ✗ |

## Related Categories

- [[CLAS]] — all aggregate schemes
- [[Type-III]] — strongest adversary model
