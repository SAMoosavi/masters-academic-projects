---
title: "RelCLAS: Malicious KGC-Resistant Certificateless Aggregate Signature"
authors: "Xincheng Li et al."
year: 2023
venue: "IEEE Internet of Things Journal, Vol. 10"
doi: "10.1109/JIOT.2023.3285402"
tags:
  - paper
  - CLAS
  - certificateless
  - VANET
  - malicious-detection
  - malicious-KGC
  - aggregate-signature
aliases:
  - RelCLAS
  - Li2023 RelCLAS
---

# RelCLAS: A Reliable Malicious KGC-Resistant Certificateless Aggregate Signature Protocol for Vehicular Ad Hoc Networks

> [!abstract] Abstract
> RelCLAS addresses the **malicious KGC (Key Generation Center)** problem in certificateless aggregate signature (CLAS) schemes for VANETs. Uses a **key accumulator** to store partial public keys, preventing the KGC from forging valid signatures. Provides formal security proof and demonstrates efficiency through simulations.

## Key Contributions

- **Malicious KGC resistance**: Key accumulator mechanism prevents KGC from generating valid signatures on behalf of vehicles
- **Formal security proof**: Proven secure against Type-I and Type-II adversaries
- **Efficient aggregation**: Maintains the aggregation property of CLAS while adding security
- **VANET-optimized**: Designed for resource-constrained vehicular environments

## Malicious Detection Mechanism

> [!info] Core Mechanism
> Vehicles select their own **partial public keys** and store them in a **key accumulator**. The KGC cannot forge signatures because it doesn't know the vehicle's secret value, and the accumulator ensures the partial public key is bound to the vehicle's identity.

### Security Model

| Adversary Type | Capability | RelCLAS Resistance |
|---|---|---|
| Type-I (Malicious signer) | Can replace public key, doesn't know master key | ✅ Resistant |
| Type-II (Malicious KGC) | Knows master key, cannot replace public key | ✅ Resistant (key accumulator) |

## Comparison with Other Schemes

| Scheme | Malicious KGC | Revocation | Pairing-free | Year |
|---|---|---|---|---|
| [[li2023-relclas|RelCLAS]] | ✅ | ❌ | ✅ | 2023 |
| [[guo2024-drclas|DRCLAS]] | ✅ | ✅ (dynamic) | ✅ | 2024 |
| [[wang2022-clasrm|CLASRM]] | ✅ | ✅ (cuckoo filter) | ✅ | 2022 |
| [[kabil2024-cham-clas|CHAM-CLAS]] | ✅ | ❌ | ✅ | 2024 |

## Notes

- **Key accumulator** is the novel contribution — different from traditional PKI binding
- Resists **malicious-but-passive KGC** attacks (Au et al., 2006)
- Does NOT provide explicit revocation mechanism (unlike DRCLAS/CLASRM)
- Cited by 27+ papers as of 2025

## Related Papers

- [[guo2024-drclas]]
- [[wang2022-clasrm]]
- [[kabil2024-cham-clas]]
- [[zhao2023-level3-cls]]
- [[li2026-level3-cls]]
