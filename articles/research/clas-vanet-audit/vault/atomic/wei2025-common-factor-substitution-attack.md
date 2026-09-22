---
title: Common Factor Substitution Attack (Wei et al. 2025)
aliases: [wei2025-common-factor-substitution-attack]
tags: [cls, iot, pf-cls, attack]
source:: [[wei2025-en]]
pages:: p.1, p.7-8
---
# Common Factor Substitution Attack
- Formalized as Definition 1: independent randoms scaled by a common factor so replaced keys and signatures still verify (p.8, §4.2).
- Forged keys are scaled by the system key with a matching forged scalar that passes verification for any message in Xiang/Du schemes (p.7, §4.1).
- Same attack breaks Karati by direct reference to the above forgery flow (p.8, §4.2).
- Pakniat–Vanda hardened with h1 over Q_ID to block Shim's forgery is still broken by the same common-factor attack (p.7-8, §4.2).
- Forgery passes verification for any user on any message in all four schemes including the Shim-hardened variant (p.7-8, §4.2).
- Vulnerability class is structural: forged components share no relation the verifier can check, so prior per-scheme patches do not remove it (p.8, §4.2).
- Scope is IoT-CLS single-signer only, not aggregate and not VANET, so the attack targets single signatures (p.1, §Abstract).
## Links
[[wei2025-enhanced-pf-cls-construction]]
[[wei2025-efficiency-figures]]
## Source
source:: [[wei2025-en]] (p.7-8)
