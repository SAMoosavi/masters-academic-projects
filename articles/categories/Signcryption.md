---
title: "Signcryption"
aliases: [CLASC, CLSC, Certificateless Signcryption]
tags: [category, signcryption, encryption, signature]
---

# Signcryption (CLASC / CLSC)

> Combined encryption + signature in single operation. Provides confidentiality AND authentication simultaneously.

## Properties

- CLASC (aggregate): multiple signers $\to$ 1 aggregate ciphertext + signature
- CLSC (single): single signer $\to$ single ciphertext + signature
- Confidentiality: only intended recipient can decrypt
- Unforgeability: no one can forge signatures
- Non-repudiation: signer cannot deny signing
- Public verifiability: third parties can verify without decrypting

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[dai2022]] | 2022 | CLASC for vehicular sensors | ✓ | ✗ |
| [[wu2025-signcryption]] | 2025 | Security-enhanced CLASC, fixes dai2022 | ✓ | ✗ |
| [[zhang2024]] | 2024 | CLSC for IoMT | ✓ | ✗ |

## Related Categories

- [[CLAS]] — aggregate without encryption
- [[Pairing-Free]] — computational optimization
