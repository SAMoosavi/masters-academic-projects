---
title: Iqbal2023 HECC Genus-2 Construction
aliases: [iqbal2023-hecc-construction]
tags: [clas, vanet, hecc, construction, pairing-free]
source:: [[iqbal2023-en]]
pages:: p.7-8
---
# Iqbal2023 HECC genus-2 construction

- Setup: DoT/TA picks genus-2 hyperelliptic curve Hyper over Fp with divisor D of 80 bits, private key Dot_p, public key Dot_pb = Dot_p . D, hashes H01/H02/H03, and params PB_frm = {Hyper, D, H01, H02, H03, Fp, Dot_pb} (p.7, §Setup).
- PRPKG: user picks G_usr, computes K_usr = G_usr . Dot_pb with EID_usr = E_K_usr(ID_usr) and F_usr = G_usr . D, then sends (EID_usr, F_usr) to DoT over the open channel (p.7, §PRPKG).
- PRPKG (DoT side): DoT recomputes K_usr = F_usr . Dot_p, recovers ID_usr, hashes H1_usr = H01(K_usr) and H2_usr = H02(EID_usr, F_usr, Dot_pb), picks J_usr, and returns encrypted PPKG_usr = E_K_usr(P_usr, L_usr) with P_usr = J_usr + Dot_p . H2_usr and L_usr = J_usr . D (p.7, §PRPKG).
- PRKG: user decrypts (P_usr, L_usr) and sets SK_usr = (G_usr, P_usr) with PK_usr = (F_usr, L_usr) (p.7, §PRKG).
- SIGG: OBU picks T_OBU, computes W_OBU = T_OBU . D, hashes H3_usr = H03(EID_usr, F_usr, L_usr, W_OBU), forms S_OBU = T_OBU + H3_usr . (G_usr + P_usr), and sends sigma = (S_OBU, W_OBU) to the RSU (p.7, §SIGG).
- SIGV: RSU recomputes H3_usr and H2_usr and accepts iff S_OBU . D - W_OBU = H3_usr . (F_usr + L_usr + H2_usr . Dot_pb), using only divisor scalar multiplication with no pairing (p.8, §SIGV).
- Aggregation generation and verification reuse the Han et al. eCLAS construction as cited for the batch phase (p.8, §SIGV).

## Links

[[iqbal2023-proofs]]
[[iqbal2023-figures]]

## Source

source:: [[iqbal2023-en]] (p.7-8)
