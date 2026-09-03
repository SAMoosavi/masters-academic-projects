---
title: "Signcryption"
aliases: [CLASC, CLSC, Certificateless Signcryption]
tags: [category, signcryption, encryption, signature]
---

# Signcryption (CLASC / CLSC)

> Combined encryption + signature in single operation. Provides confidentiality AND authentication simultaneously.

## CLASC vs CLSC

| Feature | CLASC (Aggregate) | CLSC (Single) |
|---------|-------------------|---------------|
| Signers | Multiple → 1 aggregate | Single |
| Confidentiality | ✓ | ✓ |
| Authentication | ✓ | ✓ |
| VANET Use | Batch encrypted messages | Single encrypted message |

## Papers

| Paper | Year | Type | Pairing-Free | Domain |
|-------|------|------|:---:|--------|
| [[dai2022]] | 2022 | CLASC | ✓ | Vehicular sensors |
| [[wu2025-signcryption]] | 2025 | CLASC | ✓ | VANET (fixes dai2022) |
| [[zhang2024]] | 2024 | CLSC | ✓ | IoMT |

## Security Properties
- **Confidentiality**: Only intended recipient can decrypt
- **Unforgeability**: No one can forge signatures
- **Non-repudiation**: Signer cannot deny signing
- **Public verifiability**: Third parties can verify without decrypting

## Related Categories
- [[CLAS]] — aggregate without encryption
- [[Pairing-Free]] — computational optimization
