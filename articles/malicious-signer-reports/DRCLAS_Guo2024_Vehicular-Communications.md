---
title: "DRCLAS: Dynamic Revocation Certificateless Aggregate Signature"
authors: "Rongxing Guo et al."
year: 2024
venue: "Vehicular Communications, Vol. 47, 100763"
doi: "10.1016/j.vehcom.2024.100763"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - revocation
  - dynamic-revocation
  - aggregate-signature
aliases:
  - DRCLAS
  - Guo2024 DRCLAS
---

# DRCLAS: An Efficient Certificateless Aggregate Signature Scheme with Dynamic Revocation in Vehicular Ad Hoc Networks

> [!abstract] Abstract
> DRCLAS solves the problem of **malicious vehicles interfering with communication** and inefficient verification in VANETs. Uses the **EFBD (Efficient Filter-Based Detection) algorithm** to achieve **invalid signature tracking** and **dynamic revocation** of malicious vehicles. Based on elliptic curve cryptography (ECC) without bilinear pairings.

## Key Contributions

- **Dynamic revocation**: Malicious vehicles are revoked in real-time using EFBD algorithm
- **Invalid signature tracking**: Uses binary search to identify invalid signatures within aggregate
- **Pairing-free**: ECC-based, no bilinear pairings required
- **Efficient verification**: Maintains batch verification capability

## Malicious Detection Mechanism

> [!info] EFBD Algorithm
> The **Efficient Filter-Based Detection (EFBD)** algorithm tracks invalid signatures within an aggregate. When a batch verification fails, binary search is used to isolate the specific invalid signature(s), and the corresponding malicious vehicle is dynamically revoked.

### Revocation Process

1. **Detection**: Batch verification fails → EFBD isolates invalid signature
2. **Identification**: Binary search identifies the malicious signer
3. **Revocation**: Vehicle's credentials are revoked dynamically
4. **Update**: Revocation list is broadcast to all vehicles

## Comparison with Other Schemes

| Scheme | Malicious KGC | Revocation | Revocation Type | Pairing-free | Year |
|---|---|---|---|---|---|
| [[RelCLAS_Li2023_IEEE-IoT\|RelCLAS]] | ✅ | ❌ | N/A | ✅ | 2023 |
| [[DRCLAS_Guo2024_Vehicular-Communications\|DRCLAS]] | ✅ | ✅ | Dynamic (EFBD) | ✅ | 2024 |
| [[CLASRM_Wang2022_Wiley\|CLASRM]] | ✅ | ✅ | Cuckoo filter | ✅ | 2022 |
| [[CHAM-CLAS_Kabil2024_MDPI\|CHAM-CLAS]] | ✅ | ❌ | N/A | ✅ | 2024 |

## Notes

- **EFBD** is the key innovation — enables efficient identification of malicious signers in aggregate
- **Binary search** for invalid signature isolation is $O(\log n)$ vs $O(n)$ naive approach
- Cited by 17+ papers as of 2025
- Addresses the **revocation gap** in RelCLAS

## Related Papers

- [[RelCLAS_Li2023_IEEE-IoT]]
- [[CLASRM_Wang2022_Wiley]]
- [[CHAM-CLAS_Kabil2024_MDPI]]
- [[Wang2025_Invalid-Signature-Detection_JISA]]
