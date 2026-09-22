---
title: "ECC-Only Construction"
aliases: [zheng2023-ecc-only-construction]
tags: [clas, vanet, zheng2023, construction]
source:: [[zheng2023-en]]
pages:: p.3827-3828
---
# ECC-Only Construction
- Uses one ECC group G of order q with generator P in params {P, q, E, G, h1, h2, h3, Kpub, Tpub} set (p.3827)
- Holds master keys a and b with Kpub = aP and Tpub = bP plus three hashes to Zq (p.3827)
- Issues partial key di = ri + a * h1i with Ri = ri * P plus user secret xi with Xi = xi * P (p.3827)
- Signs as si = ui + di * h2i + xi * h3i with Ui = ui * P (p.3827)
- Aggregates as s = sum si with U = sum Ui (p.3827)
- Single check is si * P = Ui + (Ri + h1i * Kpub) * h2i + Xi * h3i with point addition only (p.3827)
- Aggregate check is s * P = U + sum (Ri + h1i * Kpub) * h2i + sum Xi * h3i total (pp.3827-3828)
## Links
[[zheng2023-han-key-recovery-attack]]
[[zheng2023-tables-figures]]
## Source
source:: [[zheng2023-en]]
pages:: p.3827-3828
