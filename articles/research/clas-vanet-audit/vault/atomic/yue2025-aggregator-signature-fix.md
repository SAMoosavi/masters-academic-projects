---
title: Aggregator-signature fix with two-step verification
aliases: [aggregator signature countermeasure, simultaneous verification]
tags: [clas, vanet, yue2025, fix, aggregate]
source:: [[yue2025-en]]
pages:: p.8-p.9
---
# Aggregator-signature fix with two-step verification
- Each vehicle signs with si built as si=ui+d'iH3i+xiH4i with sigma_i as (Ui,si) (p.8)
- The RSU aggregator adds its own signature over M0 covering Uset, PKset and PIDset, with s0 built as s0=u0+d0H30+H40x0 (p.8-p.9)
- The aggregate output is sigma as (U0..Un,s0,s) with s built as s=sum si (p.8-p.9)
- Verification first checks the aggregator signature with s0P built as s0P=U0+(R0+H20Kpub)H30+H40X0 (p.9)
- Verification then checks the aggregate with sP built as sP=sum Ui+sum(Ri+KpubH2i)H3i+sum XiH4i+s0P (p.9)
- The fix is described as simultaneous verification of both aggregator and aggregate signatures to block rogue-key forgery, argued for exactly two attacker types plus selective and ephemeral rogue-key attackers (p.1, p.9-p.10)
## Links
- [[yue2025-rogue-key-attack]]
- [[yue2025-cost-figures]]
## Source
- source:: [[yue2025-en]] (p.8-p.9)
