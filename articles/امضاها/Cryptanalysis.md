---
title: "Cryptanalysis & Attacks"
aliases: [Attacks, Cryptanalysis, Security Analysis]
tags: [category, cryptanalysis, attacks, security]
---

# Cryptanalysis & Attacks

> Papers that break existing schemes rather than propose new ones. Critical for establishing security requirements.

## Properties

- Always check KGC attacks — master key enables universal forgery
- Public key binding is critical — hash must include $PK$ and $P_{pub}$
- Coalition attacks are practical — insider + KGC = most destructive
- Rogue key attacks are subtle — ephemeral keys can bypass verification

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[zhang2014]] | 2014 | 4 attacks on Xiong et al. CLAS (coalition, honest-but-curious KGC, insider) | ✗ | ✗ |
| [[shim2023]] | 2023 | KGC + forgery attacks on Wang et al. CLAS and Xiong et al. CLS | ✗ | ✗ |
| [[shim2026]] | 2026 | Type I forgery on Zhu-Guan, Chen-Guan | ✗ | ✗ |
| [[wei2025]] | 2025 | Novel forged signature attack (Type I) on PF-CLS class | ✓ | ✗ |
| [[gong2023]] | 2023 | Forgery attack + improved scheme on LICLAS | ✓ | ✗ |
| [[yue2025]] | 2025 | Rogue key attack on Zheng et al. CLAS (NO Type-III claim) | ✓ | ✗ |
| [[wu2025-signcryption]] | 2025 | Public key replacement on Dai et al. CLASC | ✓ | ✗ |

## Related Categories

- [[CLAS]] — target schemes
- [[Type-III]] — strongest adversary model
- [[Detect-Invalid]] — finding forged signatures
