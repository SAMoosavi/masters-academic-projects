---
title: "Security Analysis of CLAS (Shim et al. 2023)"
authors: "K.-A. Shim et al."
year: 2023
venue: "IEEE Access / Cryptography"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - cryptanalysis
  - malicious-KGC
  - aggregate-signature
aliases:
  - Shim2023
  - Shim Security Analysis
---

# Security Analysis and Conditional Privacy-Preserving CLAS (Shim et al.)

> [!abstract] Abstract
> Shim et al. demonstrated that a conditional privacy-preserving CLAS scheme in the standard model for VANETs is **vulnerable to malicious-but-passive KGC attacks**. This work is foundational in identifying the KGC trust problem in CLAS schemes.

## Key Contributions

- **Malicious-but-passive KGC attack**: Showed that a provably secure CLAS scheme is vulnerable
- **KGC trust problem**: Highlighted that KGC cannot be fully trusted in certificateless cryptography
- **Foundation for RelCLAS**: This attack motivated the development of [[RelCLAS_Li2023_IEEE-IoT]]

## Malicious Detection Mechanism

> [!danger] Malicious-but-Passive KGC Attack
> The attack assumes the KGC is **already malicious at the beginning of the system setup phase**. The KGC can:
> 1. Generate malicious system parameters
> 2. Use the master key to forge signatures
> 3. The forged signatures pass verification

### Impact

This attack is **critical** because:
- The KGC is a trusted party in certificateless cryptography
- If the KGC is malicious from the start, all security guarantees break
- Many CLAS schemes did not consider this attack model

## Comparison with Other Schemes

| Scheme | Malicious KGC | Attack Model | Year |
|---|---|---|---|
| Shim et al. (analyzed) | ❌ | Malicious-but-passive | 2023 |
| [[RelCLAS_Li2023_IEEE-IoT\|RelCLAS]] | ✅ | Malicious-but-passive | 2023 |
| [[Zhao2023_KGC-Level3_Wiley\|Zhao2023]] | ✅ | Malicious-but-passive | 2023 |
| [[Li2026_Level3-CLS_Future-Generation\|Li2026]] | ✅ | Malicious-but-passive | 2026 |

## Notes

- **Foundational work** — motivated the entire RelCLAS line of research
- Malicious-but-passive KGC is the **strongest attack model** for certificateless schemes
- Any new CLAS scheme MUST consider this attack
- Cited by 10+ papers as of 2025

## Related Papers

- [[RelCLAS_Li2023_IEEE-IoT]]
- [[Zhao2023_KGC-Level3_Wiley]]
- [[Li2026_Level3-CLS_Future-Generation]]
- [[Cao2025_Security-Enhanced_Eprint]]
