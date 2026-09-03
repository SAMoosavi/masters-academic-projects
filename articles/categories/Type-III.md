---
title: "Type-III Adversary Resistance"
aliases: [Type III, Collusion Resistance, Insider Collusion]
tags: [category, type-III, security, collusion]
---

# Type-III Adversary Resistance

> Resists the strongest adversary model: malicious KGC **colluding with** an insider signer. Most CLAS schemes fail here.

## Adversary Types

| Type | Adversary | Knowledge | Threat |
|------|-----------|-----------|--------|
| **Type I** | External attacker | Public keys | Replace keys, forge |
| **Type II** | Malicious KGC | Master key $s$ | Compute any $D_i$, forge |
| **Type III** | KGC + insider collusion | $s$ + one user's key | Forge for anyone |

## The Gap

Of 15 CLAS papers in our collection:
- **12** resist only Type I (or I+II)
- **3** resist Type I+II+III ← **only 20%**

## Papers with Type-III Resistance

| Paper | Year | Method | Validation |
|-------|------|--------|------------|
| [[wu2025-pseudonyms]] | 2025 | Generalized forking lemma proof | MIRACL library simulation |
| [[wu2025-collusion]] | 2025 | Enhanced key binding | NS3 + SUMO simulation |
| [[yue2025]] | 2025 | Aggregator signature mechanism | Performance experiments |

## Why Type III Is Rare

1. **Harder proofs**: Standard ROM proofs don't cover collusion
2. **Higher overhead**: Additional cryptographic bindings needed
3. **Less studied**: Most research focused on Type I/II
4. **Real threat**: KGC could be compromised by nation-state actors

## Related Categories
- [[CLAS]] — all aggregate schemes
- [[Detect-Invalid]] — finding malicious signers
