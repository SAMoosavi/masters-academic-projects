---
title: "Theta-V Signcrypt Construction with Public Verification in Zhang 2024"
aliases: []
tags: [clas, iomt, zhang2024]
source:: [[zhang2024-en]]
pages:: p.4353
---
# Theta-V Signcrypt Construction with Public Verification

- IoMT scope: wearable or implanted sensors collect physiological indicators such as heart rate and blood oxygen sent via cloud to doctors, and this construction protects that sensor-to-cloud-to-doctor flow (p.4348)
- Setup is pairing-free general-ECC only with KGC master secret s and P_pub = sP plus hashes H1–H4, hardness from Square-DH and CDH, with no bilinear map operator (p.4352)
- Keys bind public components via f_i = H3(Y_IDi, T_i): partial key d_IDi = alpha_i + s·h_i with T_i = alpha_i·P and h_i = H1(ID_i, T_i, P_pub), full secret sk_i = (x_IDi, d_IDi), public pk_i = (Y_IDi = x_IDi·P, T_i) (p.4353)
- Signcrypt (sender IDs to receiver IDr) picks u, outputs delta = (U, theta, c) at 3T_sm: U = uP, V = u·h_r·f_r·Y_IDr + h_s·T_r + h_r·P_pub, Y = H2(IDr, IDs, U, V), c = Y xor m, r = H4(U, c, T_s, Y_IDs), theta = u + r·f_s·x_IDs + d_IDs (p.4353)
- Unsigncrypt recomputes V' = (h_r·f_r·x_IDr + h_s·d_IDr)·U and Y' = H2(IDr, IDs, U, V'), recovers m' = c xor Y', then accepts only if theta·P = U + r'·(f_s·Y_IDs + T_s + h_s·P_pub) with r' = H4(U, c, T_s, Y_IDs) at 4T_sm (p.4353)
- Public verification needs no secrets: anyone checks theta·P = U + r'·(f_s·Y_IDs + T_s + h_s·P_pub) from the sender public key alone (p.4353)
- Key insight is theta = u + r·(f_s·x_IDs + d_IDs) as a double zero-knowledge proof that f_s·Y_IDs + T_s + h_s·P_pub is a scalar multiple of P, so replacing Y_IDs breaks verification (p.4353)

## Links

- [[zhang2024-square-dh-proofs]] — proofs reduce this theta-V construction to Square-DH (p.4353)
- [[zhang2024-figures-7tsm-640b]] — cost of this construction is 3T_sm plus 4T_sm (p.4359)

## Source

source:: [[zhang2024-en]] p.4353
