---
title: Yuan2023 KGC and replacement forgeries on Wang et al.
aliases: [Yuan2023 cryptanalysis, KGC forgery and public-key replacement]
tags: [clas, vanet, yuan2023, forgery, kgc-attack, replacement-attack]
source:: [[yuan2023-en]]
pages:: pp.6-7
---
# Yuan2023 KGC and replacement forgeries on Wang et al.
- The cryptanalysed baseline is Wang et al. (2022) conditional privacy-preserving CLAS in the standard model (pp.5-6).
- This paper re-analyses one such recently proposed scheme and reports KGC-attack and public-key-replacement vulnerabilities in it (p.1).
- Wang et al. signing is logically incorrect because h_i hashes W_i before W_i is computed, and the fix hashes without W_i (p.6).
- KGC forgery on Wang et al. works because KGC knows l with Q = lP and forges W_i0 = l(R_i + k_i Ppub + h_i0 X_i + U_i0) passing equation (1) (pp.6-7).
- Public-key replacement on Wang et al. works by replacing X_i with X_i0 = x_i0 P and setting U_i0 = u_i0 P - (R_i + k_i Ppub) with W_i0 = (h_i0 x_i0 + u_i0) Q (p.7).
## Links
- [[yuan2023-sm-construction]]
- [[yuan2023-sm-proofs-figures]]
## Source
- source:: [[yuan2023-en]] pp.6-7
