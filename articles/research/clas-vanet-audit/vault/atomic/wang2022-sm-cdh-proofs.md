---
title: Wang2022 SM CDH proofs
aliases: [Wang2022 Type-I/II proofs, SM EUF-CMA CDH reduction]
tags: [clas, vanet, wang2022, proofs]
source:: [[wang2022-en]]
pages:: p.7
---
# Wang2022 SM CDH proofs
- Scheme is EUF-CMA secure against Type I adversaries (public-key replacement, no master secret) in the SM by reduction to CDHP per Theorem 1/Lemma 1 (p.7).
- Scheme is EUF-CMA secure against Type II adversaries, i.e. malicious-but-passive KGC holding master secret s, in the SM by reduction to CDHP per Theorem 2/Lemma 2 (p.8).
- Type-II coverage answers prior CLAS inability to resist malicious-but-passive KGC attacks claimed in the security-attribute comparison (p.9).
- Table 2 reports this scheme satisfies all listed security attributes while comparators satisfy only some (p.9).
- Comparators are ROM-proven versus this SM-proven scheme, addressing ROM insecurity in actual implementation (p.9).
## Links
- [[wang2022-sm-construction]]
- [[wang2022-two-pairing-costs]]
## Source
- source:: [[wang2022-en]] pp.7-9
