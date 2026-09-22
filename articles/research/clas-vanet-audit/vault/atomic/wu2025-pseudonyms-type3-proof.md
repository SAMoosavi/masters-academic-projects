---
title: Wu-Ye Type-III proof and forking lemma
aliases: [wu2025-pseudonyms-type3-proof, generalized forking Algorithm 1 Lemma 1]
tags: [clas, vanet, wu2025, proof, type-III, forking-lemma]
source:: [[wu2025-pseudonyms-en]]
pages:: p.127, p.131-134
---
# Wu-Ye Type-III proof and forking lemma
- Type-III collusion aggregating at least one invalid single into a valid aggregate reduces to breaking H4 collision-resistance, since distinct Ξj vs recomputed inputs must collide to pass both aggregate checks per Theorem 3 (p.133-134).
- Type-I EUF-CMA in the ROM under ECDLP holds with challenger success at least δ/8eq0 extracted from two forked forgeries via H1 forking per Theorem 1 (p.131-132).
- Type-II EUF-CMA in the ROM under ECDLP holds with challenger success at least δ/8eq0 via H2 forking with challenge identity embedded as Xi = aP per Theorem 2 (p.132-133).
- Generalized forking Algorithm 1 with Lemma 1 succeeds with probability at least ε/8 when q > 8qH/ε, making the Type-I/II proof steps explicit (p.127).
- Theorems 1–2 prove EUF-CMA only in the random oracle model under ECDLP with no standard-model variant stated (p.131-133).
## Links
- [[wu2025-pseudonyms-construction]]
- [[wu2025-pseudonyms-figures]]
## Source
- source:: [[wu2025-pseudonyms-en]] p.127, p.131-134
