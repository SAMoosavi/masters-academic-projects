---
title: Rogue-key attack on Zheng CLAS
aliases: [Zheng ephemeral rogue-key vulnerability, rogue-key forgery]
tags: [clas, vanet, yue2025, attack, rogue-key]
source:: [[yue2025-en]]
pages:: p.1-p.2
---
# Rogue-key attack on Zheng CLAS
- Zheng et al. pairing-free CLAS for VANETs is vulnerable to ephemeral rogue-key attacks exploiting random nonces to derive an ephemeral rogue key (p.1)
- The adversary forges an aggregate signature with this rogue key plus its own private key (p.1)
- The forgery passes verification undetected (p.1)
- Existing pairing-free CLAS schemes stay exposed to such forgery despite avoiding certificate-management overhead (p.1)
- Table 1 marks ephemeral rogue-key resistance as no for Zheng et al. versus yes for this scheme (p.2, Table 1)
## Links
- [[yue2025-aggregator-signature-fix]]
- [[yue2025-cost-figures]]
## Source
- source:: [[yue2025-en]] (p.1-p.2)
