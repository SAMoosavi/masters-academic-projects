---
title: "Privacy-Preserving CLAS with Invalid Signature Detection (Wang et al. 2025)"
authors: "X. Wang et al."
year: 2025
venue: "Journal of Information Security and Applications (JISA), Vol. 104001"
doi: "10.1016/j.jisa.2025.104001"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - invalid-signature-detection
  - privacy-preserving
  - aggregate-signature
aliases:
  - Wang2025
  - Invalid Signature Detection CLAS
---

# A Privacy-Preserving Certificate-Less Aggregate Signature Scheme with Invalid Signature Detection

> [!abstract] Abstract
> Proposes an efficient CLAS scheme that not only fulfills security requirements in VANETs but also provides an **improved algorithm to detect invalid signatures with the corresponding real identities**. Addresses the gap where batch verification fails but the malicious signer cannot be identified.

## Key Contributions

- **Invalid signature detection**: Identifies which specific signature in an aggregate is invalid
- **Real identity revelation**: When a dispute arises, the TMC can determine the malevolent vehicle's real identity
- **Privacy-preserving**: Conditional privacy — only TMC can trace
- **Efficient**: Maintains batch verification efficiency

## Malicious Detection Mechanism

> [!info] Invalid Signature Isolation
> When batch verification fails, the scheme can identify the specific invalid signature(s) and reveal the real identity of the malicious vehicle. This addresses the **accountability gap** in many CLAS schemes.

### Detection Process

1. **Batch verification**: Multiple signatures verified together
2. **Failure isolation**: If verification fails, identify invalid signature(s)
3. **Identity revelation**: TMC uses its trapdoor to reveal real identity
4. **Dispute resolution**: Malicious vehicle is held accountable

## Comparison with Other Schemes

| Scheme | Invalid Detection | Identity Revelation | Privacy | Pairing-free | Year |
|---|---|---|---|---|---|
| [[Wang2025_Invalid-Signature-Detection_JISA\|Wang2025]] | ✅ | ✅ (TMC) | Conditional | ✅ | 2025 |
| [[DRCLAS_Guo2024_Vehicular-Communications\|DRCLAS]] | ✅ (EFBD) | ❌ | Conditional | ✅ | 2024 |
| [[CLASRM_Wang2022_Wiley\|CLASRM]] | ❌ | ❌ | Conditional | ✅ | 2022 |
| [[CHAM-CLAS_Kabil2024_MDPI\|CHAM-CLAS]] | ❌ | ✅ (TRA) | Conditional | ✅ | 2024 |

## Notes

- **Key innovation**: Invalid signature detection with identity revelation
- TMC (Traffic Management Centre) is the trusted party for tracing
- Addresses the **accountability** gap in [[DRCLAS_Guo2024_Vehicular-Communications]] and [[CLASRM_Wang2022_Wiley]]
- Cited by 16+ papers as of 2025

## Related Papers

- [[DRCLAS_Guo2024_Vehicular-Communications]]
- [[CLASRM_Wang2022_Wiley]]
- [[CHAM-CLAS_Kabil2024_MDPI]]
- [[RelCLAS_Li2023_IEEE-IoT]]
