---
title: Chen et al. Public-Key Replacement Forgery
aliases: [xu2023-chen-replacement-forgery]
tags: [clas, vanet, xu2023, forgery]
source:: [[xu2023-en]]
pages:: pp.13486-13487
---
# Chen et al. public-key replacement forgery
- VANET messages require authenticity and integrity with vehicle privacy over open wireless links, motivating scrutiny of prior CLAS claims (p.13482).
- Many certificateless aggregate schemes still face forgery gaps such as inability to resist replacement attacks and high computation cost (p.13482).
- Chen et al. CPP-CLAS [19] in particular cannot resist a public-key replacement attack by an external Type-I adversary (pp.13486-13487, §IV).
- The Type-I adversary forges Chen et al. [19] by replacing $PK_l^*$ with $R_l^*$ and setting $K_l' = z_l^* P - h_{2l}^* P_{pub}$ (pp.13486-13487, §IV).
- The forged component $V_l^* = u_l^* + z_l^* h_{3l}^*$ passes aggregate verification under the replaced key (pp.13486-13487, §IV).
- This paper gives an explicit attack algorithm for that flaw before proposing its security-enhanced pairing-free scheme (p.13482).
## Links
[[xu2023-enhanced-construction-bqs]]
[[xu2023-euf-cma-proofs-figures]]
## Source
source:: [[xu2023-en]] (pp.13486-13487)
