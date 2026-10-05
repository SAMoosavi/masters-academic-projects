---
title: "Conditional Privacy-Preserving CLAS (Yuan et al. 2023)"
authors: "B. Yuan et al."
year: 2023
venue: "Mathematics (MDPI), Vol. 11, No. 23, 4766"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - conditional-privacy
  - KGC-attack
  - aggregate-signature
aliases:
  - Yuan2023
  - Conditional Privacy CLAS
---

# A New Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme

> [!abstract] Abstract
> Analyzes a conditional privacy-preserving CLAS scheme in the standard model for VANETs and demonstrates it is **not secure** — vulnerable to KGC attack and public key replacement attack. Proposes an improved scheme with security proof.

## Key Contributions

- **Cryptanalysis**: Shows existing scheme is vulnerable to KGC attack and public key replacement
- **Improved scheme**: Proposes a secure conditional privacy-preserving CLAS
- **Standard model**: Security proof in the standard model (not random oracle)
- **Conditional privacy**: TMC can trace malicious vehicles

## Malicious Detection Mechanism

> [!warning] Vulnerabilities Found
> The analyzed scheme has two critical vulnerabilities:
> 1. **KGC attack**: Malicious KGC can forge signatures
> 2. **Public key replacement**: Adversary can replace public keys

### Improved Security

The proposed improved scheme:
- Binds public keys to identities (prevents replacement)
- Uses key-dependent messages (resists KGC)
- TMC can trace real identities of malicious vehicles

## Comparison with Other Schemes

| Scheme | KGC Attack | Key Replacement | Conditional Privacy | Standard Model | Year |
|---|---|---|---|---|---|
| [[Yuan2023_Conditional-Privacy_MDPI\|Yuan2023]] (analyzed) | ❌ | ❌ | ✅ | ✅ | 2023 |
| [[Yuan2023_Conditional-Privacy_MDPI\|Yuan2023]] (improved) | ✅ | ✅ | ✅ | ✅ | 2023 |
| [[RelCLAS_Li2023_IEEE-IoT\|RelCLAS]] | ✅ | ✅ | ✅ | ❌ (ROM) | 2023 |
| [[CHAM-CLAS_Kabil2024_MDPI\|CHAM-CLAS]] | ✅ | ✅ | ✅ | ❌ (ROM) | 2024 |

## Notes

- **Standard model** security is stronger than random oracle model
- Conditional privacy: TMC can trace, others cannot
- Cited by 1+ papers as of 2025
- Highlights that many CLAS schemes have **undetected vulnerabilities**

## Related Papers

- [[RelCLAS_Li2023_IEEE-IoT]]
- [[CHAM-CLAS_Kabil2024_MDPI]]
- [[Cao2025_Security-Enhanced_Eprint]]
- [[Wang2025_Invalid-Signature-Detection_JISA]]
