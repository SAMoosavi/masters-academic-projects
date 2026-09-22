---
title: ECAE pairing-free construction
aliases: [ECAE construction, pairing-free aggregate signing and verification]
tags: [ecae, wang2025, construction, aggregate, pairing-free, ndn-iot]
source:: [[wang2025-ecae-en]]
pages:: p.10
---
# ECAE pairing-free construction
- Setup publishes params=(q,G,P,P_pub,H1,H2,H3) with master secret s and P_pub=sP over cyclic group of prime order q (p.10).
- Pseudonym generation has KGC pick l_i with M_i=l_i P and N_i=l_i P_pub, masking AID_i=ID_i xor N_i and issuing PID_i={MID_i,T_i} via H1 (p.11).
- Key generation combines KGC partial key d_i=r_i+h_2i s with user secret x_i into SK_i=d_i+h_2i x_i and PK_i=(K_i,R_i) where K_i=h_2i X_i+R_i, verified by d_i P=R_i+h_2i P_pub (p.12-p.13).
- Signing picks u_i with U_i=u_i P, hashes h_3i=H3(m_i,PID_i,PK_i,U_i,t_i), and sets V_i=u_i+h_3i SK_i with sigma_i=(U_i,V_i) (p.13).
- Aggregation sums V=sum V_i and U=sum U_i into constant-size sigma=(U,V) regardless of signer count (p.13-p.14).
- Single verification checks V_i P=U_i+h_3i K_i+h_2i P_pub, and aggregate verification checks VP=U+sum(h_3i K_i+h_2i P_pub) (p.13-p.14).
- Construction uses only ECC scalar multiplication plus general hashes H1/H2/H3 with no bilinear pairings and no map-to-point hashes (p.4).
## Links
- [[wang2025-ecae-proofs]]
- [[wang2025-ecae-figures]]
## Source
- source:: [[wang2025-ecae-en]] p.10, p.11, p.12-p.14
