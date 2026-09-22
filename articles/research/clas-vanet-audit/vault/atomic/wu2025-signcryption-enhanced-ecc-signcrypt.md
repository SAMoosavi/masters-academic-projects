---
title: Enhanced ECC Signcrypt Construction (Wu 2025)
aliases: [wu2025-signcryption-enhanced-ecc-signcrypt]
tags: [clas, vanet, construction, signcryption]
source:: [[wu2025-signcryption-en]]
pages:: p.5-7
---
# Enhanced ECC Signcrypt Construction
- Scheme spans System-Setup, Pseudonym-Generation, Partial-Private-Key-Extract, Set-Secret-Value, Set-Public/Private-Key, Signcrypt, Unsigncrypt, Aggregate, Aggregate-Unsigncrypt and Revocation-Key-Extract among KGC, TRA, RSU, AS and vehicles (p.5–6, §5.1–5.2).
- Signcrypt and verify use only scalar multiplication, point addition and hashes with U_i = u_iP (p.6, §5.2; p.7, §6.1).
- Sender mask is Q_i = (u_i + r)(X_AS + Y_AS + h_AS·P_pub) where r = g(s_i), and ciphertext part is z_i = m_i ⊕ H3(·) (p.6, §5.2).
- Signature scalar is w_i = u_i + x_i·h_i2 + d_i·h_i3 with h_i2 = H4(·) and h_i3 = H5(·) (p.6, §5.2).
- Single verification is w_iP = U_i + X_i·h_i2 + (Y_i + P_pub·h_IDi)h_i3 with no bilinear pairing operator in the construction (p.6, §5.2; p.7, §6.1).
- Aggregate verification is WP = ΣU + Σ(Xh2 + Yh3) + P_pubΣh_IDh3 (p.6, §5.2).
- Identity privacy uses pseudonym ID = (αP, RID ⊕ H2(·)) with traceability and revocation via TRA and KGC roles (p.6, §5; p.9, §6.3).
## Links
[[wu2025-signcryption-dai-replacement-forgery]]
[[wu2025-signcryption-proofs-figures]]
## Source
source:: [[wu2025-signcryption-en]] (p.5-7)
