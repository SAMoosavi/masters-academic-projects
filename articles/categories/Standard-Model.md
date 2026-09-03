---
title: "Standard Model Proofs"
aliases: [Standard Model, no-random-oracle]
tags: [category, standard-model, security-proof]
---

# Standard Model Proofs

> Security proofs that do **not** rely on the Random Oracle Model (ROM). Stronger guarantees — ROM proofs may not translate to real implementations.

## ROM vs Standard Model

| Model | Assumption | Realism | Overhead |
|-------|------------|---------|----------|
| **ROM** | Hash functions = random oracles | Idealized | Lower |
| **Standard** | Concrete hash properties | Realistic | Higher |

## Papers with Standard Model Proofs

| Paper | Year | Scheme | Security Assumption |
|-------|------|--------|---------------------|
| [[wang2022]] | 2022 | CLAS | CDHP |
| [[yuan2023]] | 2023 | CLAS | CDHP |

## Why This Matters

- ROM is a **mathematical abstraction** — real hash functions aren't random oracles
- Standard model proofs are **closer to real-world security**
- Only 2 of 15 CLAS papers use standard model (13%)
- Trade-off: higher computation for stronger guarantees

## Related Categories
- [[CLAS]] — all aggregate schemes
- [[Type-III]] — strongest adversary model
