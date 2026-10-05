---
title: "Pairing-Free CLS with KGC Trust Level 3 (Zhao et al. 2023)"
authors: "Hong Zhao, Xinyu Zhang, Zhaobin Li, Zhanzhen Wei"
year: 2023
venue: "Wireless Communications and Mobile Computing (Wiley)"
doi: "10.1155/2023/9884050"
tags:
  - paper
  - CLS
  - certificateless
  - malicious-detection
  - malicious-KGC
  - KGC-trust-level
  - pairing-free
  - aggregate-signature
aliases:
  - Zhao2023
  - KGC Level 3 CLS
---

# An Efficient Pairing-Free Certificateless Signature Scheme with KGC Trust Level 3 for Wireless Sensor Network

> [!abstract] Abstract
> Achieves **Girault's level-3 security** (highest KGC trust level) in a pairing-free certificateless signature scheme. Resists **malicious-but-passive KGC attacks**. Demonstrates scalability to aggregate signatures.

## Key Contributions

- **KGC Trust Level 3**: Highest security level — KGC cannot forge signatures even with master key
- **Malicious-but-passive KGC resistance**: Secure against KGC that is malicious from system setup
- **Pairing-free**: No bilinear pairings
- **Aggregate extension**: Signature form supports aggregation (Schnorr-like: $v_i = u_i + h_i s_i$)

## Security Model

> [!info] KGC Trust Levels
> | Level | Meaning |
> |---|---|
> | Level 1 | KGC cannot replace public keys |
> | Level 2 | KGC cannot forge signatures with master key |
> | **Level 3** | **KGC cannot forge even if malicious from setup** |

### Adversary Model

| Adversary | Description | Resistance |
|---|---|---|
| Type-I (Malicious signer) | No master key, can replace public key | ✅ |
| Type-II (Malicious KGC) | Has master key, cannot replace public key | ✅ |
| Malicious-but-passive KGC | Malicious from system setup | ✅ |

## Comparison with Other Schemes

| Scheme | KGC Level | Malicious KGC | Pairing-free | Year |
|---|---|---|---|---|
| [[Zhao2023_KGC-Level3_Wiley\|Zhao2023]] | Level 3 | ✅ | ✅ | 2023 |
| [[Li2026_Level3-CLS_Future-Generation\|Li2026]] | Level 3 | ✅ | ✅ | 2026 |
| [[RelCLAS_Li2023_IEEE-IoT\|RelCLAS]] | Level 2+ | ✅ | ✅ | 2023 |
| [[CHAM-CLAS_Kabil2024_MDPI\|CHAM-CLAS]] | Level 2+ | ✅ | ✅ | 2024 |

## Notes

- **Level 3** is the strongest security notion in certificateless cryptography
- Based on **Thumbur et al.** scheme — Schnorr-like signature form
- Aggregate signature capability demonstrated
- Cited by 9+ papers as of 2025

## Related Papers

- [[Li2026_Level3-CLS_Future-Generation]]
- [[RelCLAS_Li2023_IEEE-IoT]]
- [[CHAM-CLAS_Kabil2024_MDPI]]
- [[Cao2025_Security-Enhanced_Eprint]]
