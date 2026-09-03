---
title: "Cryptanalysis & Attacks"
aliases: [Attacks, Cryptanalysis, Security Analysis]
tags: [category, cryptanalysis, attacks, security]
---

# Cryptanalysis & Attacks

> Papers that break existing schemes rather than propose new ones. Critical for establishing security requirements.

## Attack Taxonomy

| Attack | Target | Paper |
|--------|--------|-------|
| **KGC attack** (malicious-but-passive) | Wang et al. CLAS | [[shim2023]] |
| **Forgery + key recovery** | Xiong et al. CLS | [[shim2023]] |
| **Public key replacement** (Type I) | Zhu-Guan, Chen-Guan | [[shim2026]] |
| **Coalition attack** | Xiong et al. CLAS | [[zhang2014]] |
| **Honest-but-curious KGC** | Xiong et al. CLAS | [[zhang2014]] |
| **Insider + malicious KGC** | Xiong et al. CLAS | [[zhang2014]] |
| **Forged signature (Type I)** | PF-CLS class | [[wei2025]] |
| **Forged signature** | LICLAS | [[gong2023]] |
| **Rogue key attack** | Zheng et al. CLAS | [[yue2025]] |
| **Public key replacement** | Dai et al. CLASC | [[wu2025-signcryption]] |

## Papers

| Paper | Year | Target | Result |
|-------|------|--------|--------|
| [[zhang2014]] | 2014 | Xiong et al. | 4 concrete attacks |
| [[shim2023]] | 2023 | Wang et al., Xiong et al. | KGC + forgery attacks |
| [[shim2026]] | 2026 | Zhu-Guan, Chen-Guan | Type I forgery |
| [[wei2025]] | 2025 | PF-CLS class | Novel attack method |
| [[gong2023]] | 2023 | LICLAS | Forgery attack + improved scheme |
| [[yue2025]] | 2025 | Zheng et al. | Rogue key attack |
| [[wu2025-signcryption]] | 2025 | Dai et al. | Public key replacement |

## Lessons Learned

1. **Always check KGC attacks** — master key enables universal forgery
2. **Public key binding is critical** — hash must include $PK$ and $P_{pub}$
3. **Coalition attacks are practical** — insider + KGC = most destructive
4. **Rogue key attacks are subtle** — ephemeral keys can bypass verification

## Related Categories
- [[CLAS]] — target schemes
- [[Type-III]] — strongest adversary model
- [[Detect-Invalid]] — finding forged signatures
