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
- Crew-audited 2026-09-21: only 2 of 24 papers CLAIM Type-III — 1 verified (Wu & Ye 2025), 1 hedged Abstract-only (Wu & Heng 2025, needs PDF). Yue 2025 does NOT claim Type-III (rogue-key focus only).
- Harder proofs: standard ROM proofs don't cover collusion
- Higher overhead: additional cryptographic bindings needed

## Papers in This Category

| Paper | Year | Focus | Pairing-Free | Type III |
|-------|------|-------|:---:|:---:|
| [[wu2025-pseudonyms]] | 2025 | Generalized forking lemma proof, MIRACL library simulation (VERIFIED Full-text) | ✓ | ✓ |
| [[wu2025-collusion]] | 2025 | Claims collusion resistance — Abstract-only, UNVERIFIED pending PDF | ✓ | ✗* |

\* Hedged — see `summaries/wu2025-collusion.md`. Do not cite as established.

## Related Categories

- [[CLAS]] — all aggregate schemes
- [[Detect-Invalid]] — finding malicious signers
- [[Cryptanalysis]] — attack papers
