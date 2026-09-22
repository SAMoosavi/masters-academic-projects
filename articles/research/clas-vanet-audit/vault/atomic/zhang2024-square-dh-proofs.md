---
title: "Square-DH IND-CCA2 and EUF-CMA Proofs in Zhang 2024"
aliases: []
tags: [clas, iomt, zhang2024]
source:: [[zhang2024-en]]
pages:: p.4353
---
# Square-DH IND-CCA2 and EUF-CMA Proofs

- IoMT scope: proofs cover the physiological-data flow from resource-constrained wearable sensors to doctors via cloud against Type I key-replacement and Type II malicious-KGC foes (p.4348)
- Confidentiality holds as IND-CLSC-CCA2 under both Type I and Type II adversaries in the random oracle model reduced to Square-DH (p.4355)
- Unforgeability holds as EUF-CLSC-CMA under both Type I and Type II adversaries in the random oracle model reduced to Square-DH (p.4356)
- Proof structure is Lemmas 1–4 covering Type I plus Type II for confidentiality and unforgeability in the random oracle model (p.4353)
- Reduction is tight with no forking lemma, unlike schemes [26]–[29] with loose reductions, giving stronger guarantees at equal hardness (p.4359)
- Only the proposed scheme is both pairing-free and secure against Type I and Type II attacks among the six compared, while [5], [26], [27], [29] fail Type I and [28] fails Type II (p.4360)

## Links

- [[zhang2024-theta-v-signcrypt-public-verification]] — proofs argue safety of that theta-V construction (p.4353)
- [[zhang2024-figures-7tsm-640b]] — tight-reduction claim sits beside the efficiency comparison (p.4359)

## Source

source:: [[zhang2024-en]] p.4353-4358
