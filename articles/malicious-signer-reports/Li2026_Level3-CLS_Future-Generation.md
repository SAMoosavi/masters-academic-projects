---
title: "Level-3 Secure CLS Against Malicious KGC (Li et al. 2026)"
authors: "Li et al."
year: 2026
venue: "Future Generation Computer Systems (ScienceDirect)"
tags:
  - paper
  - CLS
  - certificateless
  - malicious-detection
  - malicious-KGC
  - KGC-trust-level
  - pairing-free
  - IoT
  - aggregate-signature
aliases:
  - Li2026
  - Level-3 PF-CLS
---

# Efficient Level-3 Secure Certificateless Signature Against Malicious KGC Attacks for IoT

> [!abstract] Abstract
> First pairing-free certificateless signature scheme achieving **both Girault's level-3 security and protection against malicious-but-passive KGC attacks**. Introduces an aggregate signature based on the proposed PF-CLS to enhance verification efficiency.

## Key Contributions

- **First Level-3 pairing-free CLS**: Highest KGC trust level without pairings
- **Malicious-but-passive KGC resistance**: Secure against KGC malicious from setup
- **Aggregate extension**: PF-CLS enables efficient batch verification
- **IoT-optimized**: Designed for resource-constrained IoT devices

## Security Model

> [!info] Level-3 Security
> Level-3 (Girault) means the KGC **cannot forge signatures** even if it was malicious from the beginning of the system setup. This is the strongest security notion in certificateless cryptography.

### Adversary Resistance

| Adversary Type | Master Key | Replace Public Key | Malicious from Setup | Resistance |
|---|---|---|---|---|
| Type-I (Signer) | ❌ | ✅ | N/A | ✅ |
| Type-II (KGC) | ✅ | ❌ | ❌ | ✅ |
| Malicious-but-passive KGC | ✅ | ❌ | ✅ | ✅ |

## Comparison with Other Schemes

| Scheme | KGC Level | Malicious KGC | Pairing-free | Aggregate | Year |
|---|---|---|---|---|---|
| [[Zhao2023_KGC-Level3_Wiley\|Zhao2023]] | Level 3 | ✅ | ✅ | ✅ | 2023 |
| [[Li2026_Level3-CLS_Future-Generation\|Li2026]] | Level 3 | ✅ | ✅ | ✅ | 2026 |
| [[RelCLAS_Li2023_IEEE-IoT\|RelCLAS]] | Level 2+ | ✅ | ✅ | ✅ | 2023 |
| [[CHAM-CLAS_Kabil2024_MDPI\|CHAM-CLAS]] | Level 2+ | ✅ | ✅ | ✅ | 2024 |

## Notes

- **First** scheme to achieve Level-3 + pairing-free + malicious-KGC resistance simultaneously
- Published in Future Generation Computer Systems (2026)
- Aggregate signature enhances verification efficiency for IoT
- Builds on [[Zhao2023_KGC-Level3_Wiley]]

## Related Papers

- [[Zhao2023_KGC-Level3_Wiley]]
- [[RelCLAS_Li2023_IEEE-IoT]]
- [[CHAM-CLAS_Kabil2024_MDPI]]
- [[Cao2025_Security-Enhanced_Eprint]]
