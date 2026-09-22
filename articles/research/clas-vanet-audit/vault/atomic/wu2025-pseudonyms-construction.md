---
title: Wu-Ye pseudonym CLAS construction
aliases: [wu2025-pseudonyms-construction, pairing-free pseudonym sign verify aggregate]
tags: [clas, vanet, wu2025, construction, pseudonym, pairing-free]
source:: [[wu2025-pseudonyms-en]]
pages:: p.130
---
# Wu-Ye pseudonym CLAS construction
- Setup holds KGC secret α with Ppub = αP and TA secret β with Tpub = βP over ECC group G with hashes H0–H4 (p.130).
- TA issues pseudonym via Ui = uiP and VIDi = RIDi ⊕ H0(xi Tpub), then sets AIDi = RIDi ⊕ H0(βUi, Ti) with PIDi = [AIDi, Ti] (p.130).
- KGC issues partial key via Ri = riP with h2,i = H2(PIDi, Xi, Ri), PKi = Ri + h2,i Xi, and pski = [ri + α h1,i] mod q with h1,i = H1(PIDi, PKi, Ppub) (p.130).
- Vehicle accepts pski iff pski P = Ri + h1,i Ppub with PIDi validity check, then sets ski = pski + h2,i · xi with public key PKi (p.130).
- Signing stamps ti with h3,i = H3(PIDi, PKi, Ui, mi, ti) and σi = [ui + h3,i · ski] mod q (p.130).
- Single verification checks Ti/ti freshness, then accepts iff σi P = Ui + h3,i [PKi + h1,i Ppub] (p.130).
- Aggregation computes Ξi = h3,i^-1 [σi P − Ui] with tag η = H4[Ξ1, …, Ξn] as σagg, verified iff sums match and η equals H4 over recomputed values, using only scalar multiplication and addition (p.130).
## Links
- [[wu2025-pseudonyms-type3-proof]]
- [[wu2025-pseudonyms-figures]]
## Source
- source:: [[wu2025-pseudonyms-en]] p.130
