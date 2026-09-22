---
title: "CLAS/VANET Literature Map"
aliases: [Literature Map, Paper Index, CLAS Papers]
tags: [MOC, CLAS, VANET, literature-review]
created: 2026-09-01
---

# CLAS/VANET Literature Map

> Map of Content for all certificateless aggregate signature papers related to VANETs.

## By Year

### 2014
- [[zhang2014]] — Foundational CLAS cryptanalysis (4 attacks on Xiong et al.)

### 2021
- [[vallent2021]] — CLAS for VANET + smart grid

### 2022
- [[cahyadi2022-clas-scheme]] — CLAS scheme for VANET (Type I+II)
- [[cahyadi2022-survey]] — Comprehensive CLAS survey
- [[dai2022]] — Pairing-free CLASC for vehicular sensors
- [[han2022]] — eCLAS efficient pairing-free CLAS
- [[wang2022]] — Standard model CLAS

### 2023
- [[gong2023]] — PCAS cryptanalysis + improved scheme
- [[shim2023]] — KGC attack on Wang et al.
- [[xu2023]] — Security-enhanced CLAS
- [[yuan2023]] — Standard model CLAS
- [[zheng2023]] — Pairing-free CLAS (vulnerable to rogue key)

### 2024
- [[zhang2024]] — CLSC for IoMT

### 2025
- [[wang2025-ecae]] — ECAE for NDN-IoT
- [[wang2025-detectable]] — Detectable invalid signatures
- [[wei2025]] — PF-CLS attack class
- [[wu2025-pseudonyms]] — Type-III resistant, pseudonym CLAS
- [[wu2025-signcryption]] — Security-enhanced CLASC
- [[wu2025-collusion]] — Collusion-resistant, Type III (NS3+SUMO)
- [[yue2025]] — Rogue key attack fix

### 2026
- [[lode2026]] — ECC review + quantum-secure cryptanalysis
- [[shim2026]] — Type I forgery analysis, 5G-V2X
- [[tao2026]] — ES-CLAS fully aggregate (state-of-the-art efficiency)

## By Category

### Proposed CLAS Schemes
- [[cahyadi2022-clas-scheme]]
- [[gong2023]]
- [[han2022]]
- [[iqbal2023]]
- [[tao2026]]
- [[vallent2021]]
- [[wang2022]]
- [[wang2025-ecae]]
- [[wang2025-detectable]]
- [[wu2025-pseudonyms]]
- [[wu2025-collusion]]
- [[xu2023]]
- [[yuan2023]]
- [[yue2025]]
- [[zheng2023]]

### Cryptanalysis / Attacks
- [[zhang2014]]
- [[shim2023]]
- [[shim2026]]
- [[wei2025]]

### Signcryption
- [[dai2022]]
- [[wu2025-signcryption]]
- [[zhang2024]]

### Surveys / Reviews
- [[cahyadi2022-survey]]
- [[lode2026]]

## By Security Property

### Type-III Adversary Resistance
- [[wu2025-pseudonyms]]
- [[wu2025-collusion]]
- [[yue2025]]

### Standard Model Proofs
- [[wang2022]]
- [[yuan2023]]

### Pairing-Free ECC
- [[cahyadi2022-clas-scheme]]
- [[gong2023]]
- [[han2022]]
- [[tao2026]]
- [[wang2022]]
- [[wang2025-ecae]]
- [[wang2025-detectable]]
- [[wu2025-pseudonyms]]
- [[wu2025-collusion]]
- [[xu2023]]
- [[yuan2023]]
- [[yue2025]]
- [[zheng2023]]

## Key Benchmarks for Our Scheme

| Paper | Year | Key Metric | Value |
|-------|------|------------|-------|
| [[tao2026]] | 2026 | Computation reduction | ≥24.3% |
| [[wang2025-ecae]] | 2025 | Computation reduction | 46.18% |
| [[wang2025-ecae]] | 2025 | Communication reduction | 55.56% |
| [[gong2023]] | 2023 | Transmission reduction | 25% |
| [[gong2023]] | 2023 | Computation reduction | 16.56–25.34% |
| [[wu2025-collusion]] | 2025 | Adversary types | I + II + III |
| [[wu2025-pseudonyms]] | 2025 | Adversary types | I + II + III |
| [[wang2022]] | 2022 | Security model | Standard model |

## Signature Categories

- [[CLS]] — Certificateless Signature (non-aggregate)
- [[CLAS]] — Certificateless Aggregate Signature
- [[Pairing-Free]] — Schemes without bilinear pairings
- [[Detect-Invalid]] — Invalid/malicious signature detection
- [[Signcryption]] — Combined encryption + signature (CLASC/CLSC)
- [[Type-III]] — Type-III adversary resistance (collusion)
- [[Standard-Model]] — Proofs without random oracle model
- [[Cryptanalysis]] — Attack papers breaking existing schemes

## Companion Files

- [[protocols]] — Protocol step-by-step descriptions (crew-audited 2026-09-21)
- [[analysis-report]] — Cross-paper analysis and research gaps
- Formula source of truth: `summaries/<key>.md` Math sections + `schemes/<key>.md`
  (`math-notation.md` removed 2026-09-21 — it carried invented equations
  contradicting the audited summaries; do not regenerate from pre-audit data.
  Note: `aggregate.py` still contains its generator — update or retire it before
  any re-run.)

## Charts

![[comparison-charts/timeline.png]]
![[comparison-charts/categories.png]]
![[comparison-charts/security-comparison.png]]
![[comparison-charts/attack-resistance.png]]
