---
title: "Security-Enhanced Pairing-Free CLAS (Cao et al. 2025)"
authors: "Z. Cao et al."
year: 2025
venue: "IACR ePrint 2025/495"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - pairing-free
  - forgery-attack
  - aggregate-signature
aliases:
  - Cao2025
  - Security-Enhanced PF-CLAS
---

# A Security-Enhanced Pairing-Free Certificateless Aggregate Signature Scheme

> [!abstract] Abstract
> Shows that Zheng et al.'s CLAS scheme is **insecure against forgery attacks** — an adversary can sign any message while the verifier cannot detect the fraud. Proposes a security-enhanced pairing-free CLAS scheme that fixes this vulnerability.

## Key Contributions

- **Cryptanalysis**: Identifies forgery vulnerability in Zheng et al.'s scheme
- **Security enhancement**: Proposes a revised scheme resistant to forgery
- **Pairing-free**: No bilinear pairings required
- **Fraud detection**: Verifier can detect forged signatures

## Malicious Detection Mechanism

> [!warning] Forgery Vulnerability in Zheng et al.
> The original scheme allows an adversary to:
> 1. Sign any message without knowing the private key
> 2. The forged signature passes verification
> 3. The verifier **cannot detect** the fraud

### Enhanced Verification

The proposed scheme adds verification steps that:
- Bind the signature to the signer's identity
- Prevent signature malleability
- Enable detection of forged signatures

## Comparison with Other Schemes

| Scheme | Forgery Detection | Malicious KGC | Pairing-free | Year |
|---|---|---|---|---|
| Zheng et al. | ❌ (vulnerable) | ❌ | ✅ | 2023 |
| [[Cao2025_Security-Enhanced_Eprint\|Cao2025]] | ✅ | ✅ | ✅ | 2025 |
| [[RelCLAS_Li2023_IEEE-IoT\|RelCLAS]] | ✅ | ✅ | ✅ | 2023 |
| [[CHAM-CLAS_Kabil2024_MDPI\|CHAM-CLAS]] | ✅ | ✅ | ✅ | 2024 |

## Notes

- **Critical finding**: Many CLAS schemes may have undetected forgery vulnerabilities
- Cited by 2+ papers as of 2025
- Highlights the importance of rigorous security analysis

## Related Papers

- [[RelCLAS_Li2023_IEEE-IoT]]
- [[CHAM-CLAS_Kabil2024_MDPI]]
- [[Zhao2023_KGC-Level3_Wiley]]
- [[Li2026_Level3-CLS_Future-Generation]]
