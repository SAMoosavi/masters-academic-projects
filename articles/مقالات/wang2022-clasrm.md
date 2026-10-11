---
title: "CLASRM: CLAS with Revocation Mechanism for 5G VANETs"
authors: "Zhihua Wang, Haofan Wang, Yongjian Wang, Xiaolong Yang"
year: 2022
venue: "Wireless Communications and Mobile Computing (Wiley)"
doi: "10.1155/2022/3646960"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - revocation
  - 5G
  - aggregate-signature
aliases:
  - CLASRM
  - Wang2022 CLASRM
---

# CLASRM: A Lightweight and Secure Certificateless Aggregate Signature Scheme with Revocation Mechanism for 5G-Enabled Vehicular Networks

> [!abstract] Abstract
> CLASRM proposes a lightweight CLAS scheme with a **revocation mechanism** suitable for 5G-enabled vehicular networks. Uses a **cuckoo filter** to efficiently revoke malicious vehicles and prevent their access to the VANET.

## Key Contributions

- **Cuckoo filter-based revocation**: Efficient data structure for revocation list management
- **5G-optimized**: Designed for 5G-enabled VANET infrastructure
- **Lightweight**: Suitable for resource-constrained vehicles
- **Conditional privacy**: Vehicles can be traced and revoked when malicious

## Malicious Detection Mechanism

> [!info] Cuckoo Filter Revocation
> A **cuckoo filter** is used to store the revocation list. When a vehicle is detected as malicious, its identity is added to the cuckoo filter. Verification checks whether the signer is in the revocation list.

### Properties

| Property | Cuckoo Filter Advantage |
|---|---|
| Space efficiency | ~10x smaller than Bloom filter for same FPR |
| Deletion support | Supports deletion (unlike Bloom filter) |
| Lookup speed | $O(1)$ lookup |
| False positive rate | Configurable, typically < 3% |

## Comparison with Other Schemes

| Scheme | Malicious KGC | Revocation | Revocation Type | Pairing-free | Year |
|---|---|---|---|---|---|
| [[li2023-relclas|RelCLAS]] | ✅ | ❌ | N/A | ✅ | 2023 |
| [[guo2024-drclas|DRCLAS]] | ✅ | ✅ | Dynamic (EFBD) | ✅ | 2024 |
| [[wang2022-clasrm|CLASRM]] | ✅ | ✅ | Cuckoo filter | ✅ | 2022 |
| [[kabil2024-cham-clas|CHAM-CLAS]] | ✅ | ❌ | N/A | ✅ | 2024 |

## Notes

- **Cuckoo filter** is the key difference from DRCLAS (which uses EFBD)
- Cuckoo filter supports **deletion** — useful when vehicles are reinstated
- Cited by 18+ papers as of 2025
- Does NOT explicitly address malicious KGC (unlike RelCLAS)

## Related Papers

- [[li2023-relclas]]
- [[guo2024-drclas]]
- [[kabil2024-cham-clas]]
- [[wang2025-detectable]]
