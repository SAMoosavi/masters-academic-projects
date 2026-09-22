---
title: "Han Key-Recovery Attack"
aliases: [zheng2023-han-key-recovery-attack]
tags: [clas, vanet, zheng2023, attack]
source:: [[zheng2023-en]]
pages:: p.3827
---
# Han Key-Recovery Attack
- Han et al. pairing-free CLAS is attacked in Section V as motivation for a rebuilt scheme in Section VI (p.3826)
- Victim partial key has form dm = a * h2m with master secret a as factor (p.3827)
- Malicious node derives h2m and its modular inverse Tm = h2m inverse mod q (p.3827)
- Malicious node wins master secret via a = Tm * dm (p.3827)
- Report frames this as master-key privacy loss (p.3827)
## Links
[[zheng2023-ecc-only-construction]]
[[zheng2023-tables-figures]]
## Source
source:: [[zheng2023-en]]
pages:: p.3827
