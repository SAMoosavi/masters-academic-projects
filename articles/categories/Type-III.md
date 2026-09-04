---
title: "Type-III Adversary Resistance"
aliases: [Type III, Collusion Resistance, Insider Collusion]
tags: [category, type-III, security, collusion]
---

# Type-III Adversary Resistance

> Resists the strongest adversary model: malicious KGC **colluding with** an insider signer. Most CLAS schemes fail here.

## Properties

- Type I: external attacker with public keys — can replace keys, forge
- Type II: malicious KGC with master key $s$ — can compute any $D_i$, forge
- Type III: KGC + insider collusion with $s$ + one user's key — can forge for anyone
- Of 15 CLAS papers: 12 resist only Type I (or I+II), 3 resist Type I+II+III ($20\%$)
- Harder proofs: standard ROM proofs don't cover collusion
- Higher overhead: additional cryptographic bindings needed

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[wu2025-pseudonyms]] | 2025 | Generalized forking lemma proof, MIRACL library simulation | ✓ | ✓ |
| [[wu2025-collusion]] | 2025 | Enhanced key binding, NS3 + SUMO simulation | ✓ | ✓ |
| [[yue2025]] | 2025 | Aggregator signature mechanism, performance experiments | ✓ | ✓ |

## Related Categories

- [[CLAS]] — all aggregate schemes
- [[Detect-Invalid]] — finding malicious signers
- [[Cryptanalysis]] — attack papers
