---
title: Tables 4-5 computation and communication figures
aliases: [Sign Verify cost figures, aggregate communication size]
tags: [clas, vanet, yue2025, numbers, performance]
source:: [[yue2025-en]]
pages:: p.11-p.13
---
# Tables 4-5 computation and communication figures
- Individual Sign costs 2Th+Tpm and individual Verify costs 3Th+3Tpa+4Tpm (p.11, Table 4)
- Aggregate Verify costs 3(n+1)Th+4(n+1)Tpa+(3n+5)Tpm with no pairing terms (p.11, Table 4)
- Aggregate verification costs slightly more than Zheng et al. by the extra s0 term as the price of the countermeasure (p.11, Table 4)
- Communication per message is 3|G|+3|Zq*|, with |G| 320 bits and |Zq*| 160 bits and timestamps omitted (p.12-p.13, Table 5)
- The text value 4|G|+3|Zq*| describes Zheng et al. senders, not this scheme row (p.12-p.13, Table 5)
- The scheme is pairing-free in Sign, Aggregate and Verify with only scalar multiplication, addition and hashes to scalars (p.8-p.9)
## Links
- [[yue2025-rogue-key-attack]]
- [[yue2025-aggregator-signature-fix]]
## Source
- source:: [[yue2025-en]] (p.11-p.13)
