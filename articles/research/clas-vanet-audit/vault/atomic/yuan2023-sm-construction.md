---
title: Yuan2023 SM CLAS construction
aliases: [Yuan2023 construction, SM signing aggregation and verification]
tags: [clas, vanet, yuan2023, construction, standard-model]
source:: [[yuan2023-en]]
pages:: pp.7-9
---
# Yuan2023 SM CLAS construction
- The system has five entities (KGC, TRA, OBU, RSU, TMC) with pseudonyms PIDi,j and TRA-only traceability via tracking key k, and the improved construction has eight stages with new system key Z = H3(y_pub) and hash families H1-H5 (pp.3-4) (pp.7-8).
- Setup uses pairing e: G1 x G1 -> G2 with q > 2^nu, y_pub = sP, Z = H3(y_pub), and params {G1, G2, q, e, P, Z, y_pub, H1-H5} (p.8).
- KGC selects r_i, computes R_i = r_i P and k_i = H2(PIDi,j, R_i), and issues d_i = r_i + k_i s mod q as the partial private key (p.8).
- The vehicle picks secret x_i, computes X_i = x_i P, publishes PKi = (X_i, R_i), and keeps (d_i, x_i) as the private key (p.8).
- The signer picks timestamp TSi and random u_i with U_i = u_i P, then computes phi_i = H4(y_pub, PKi, U_i) and h_i = H5(m_i || TSi, PIDi,j, U_i, PKi) and outputs W_i = (d_i phi_i + h_i x_i + u_i) Z (p.8).
- The RSU sums n individual pairs into U = sum U_i and W = sum W_i and sends sigma = (U, W) to the TMC (p.9).
- Single-signature check is e(W_i, P) = e((R_i + k_i y_pub) phi_i + h_i X_i + U_i, Z) after recomputing k_i, phi_i, h_i with timestamp freshness testing (p.8).
- Aggregate check is e(W, P) = e(sum (R_i + k_i y_pub) phi_i + sum h_i X_i + U, Z) with freshness testing before acceptance, and correctness of both equations follows by expanding d_i and moving Z across the pairing (p.9).
## Links
- [[yuan2023-kgc-replacement-forgeries]]
- [[yuan2023-sm-proofs-figures]]
## Source
- source:: [[yuan2023-en]] pp.7-9
