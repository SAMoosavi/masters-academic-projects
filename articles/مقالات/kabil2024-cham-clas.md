---
title: "CHAM-CLAS: Chameleon Hashing-Based Identity Authentication"
authors: "Ahmad Kabil, Heba Aslan, Marianne A. Azer, Mohamed Rasslan"
year: 2024
venue: "Cryptography (MDPI), Vol. 8, No. 3, 43"
doi: "10.3390/cryptography8030043"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - traceability
  - chameleon-hash
  - aggregate-signature
aliases:
  - CHAM-CLAS
  - Kabil2024 CHAM-CLAS
---

# CHAM-CLAS: A Certificateless Aggregate Signature Scheme with Chameleon Hashing-Based Identity Authentication for VANETs

> [!abstract] Abstract
> CHAM-CLAS uses **chameleon hashing** for identity authentication, providing **traceability** of network participants. Prevents repudiation attacks and fake identity attacks. Ensures revoked vehicles are denied access to the VANET. Cryptanalysis of Xiong's CLAS scheme revealed vulnerabilities to partial key replacement and identity replacement attacks.

## Key Contributions

- **Chameleon hashing**: Provides controlled traceability — only the trapdoor holder (TRA) can trace
- **Identity authentication**: Prevents fake identity attacks
- **Repudiation prevention**: Signers cannot deny their signatures
- **Revocation check**: Revoked vehicles are denied access

## Malicious Detection Mechanism

> [!info] Chameleon Hash Properties
> Chameleon hashing allows a designated party (TRA) with the trapdoor to find collisions. This enables:
> 1. **Traceability**: TRA can reveal the real identity of a malicious vehicle
> 2. **Non-repudiation**: The hash binds the signature to the vehicle's identity
> 3. **Revocation**: Revoked identities are rejected during verification

### Security Properties

| Property | Mechanism |
|---|---|
| Traceability | Chameleon hash trapdoor (TRA only) |
| Non-repudiation | Signature bound to identity |
| Revocation denial | Verification checks revocation list |
| EUF-CMA security | Proven against Type-II adversary (ECDLP hard in ROM) |

## Comparison with Other Schemes

| Scheme | Malicious KGC | Revocation | Traceability | Pairing-free | Year |
|---|---|---|---|---|---|
| [[li2023-relclas|RelCLAS]] | ✅ | ❌ | ❌ | ✅ | 2023 |
| [[guo2024-drclas|DRCLAS]] | ✅ | ✅ (dynamic) | ❌ | ✅ | 2024 |
| [[wang2022-clasrm|CLASRM]] | ✅ | ✅ (cuckoo filter) | ❌ | ✅ | 2022 |
| [[kabil2024-cham-clas|CHAM-CLAS]] | ✅ | ✅ | ✅ (chameleon hash) | ✅ | 2024 |

## Notes

- **Chameleon hash** is the key innovation — enables traceability without sacrificing privacy
- TRA (Traffic Authority) is the only party that can trace — conditional privacy
- Cited by 8+ papers as of 2025
- Cryptanalysis of Xiong's scheme revealed **partial key replacement** and **identity replacement** attacks

## Related Papers

- [[li2023-relclas]]
- [[guo2024-drclas]]
- [[wang2022-clasrm]]
- [[cao2025]]
