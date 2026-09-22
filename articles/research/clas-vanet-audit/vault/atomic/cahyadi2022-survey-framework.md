---
title: CLAS 8-Algorithm Framework (Cahyadi 2022 Survey)
aliases: [cahyadi2022-survey-framework, 8-algorithm CLAS framework]
tags: [clas, vanet, framework, survey]
source:: [[cahyadi2022-survey-en]]
pages:: p.1268-1272
---

# CLAS 8-algorithm framework for VANETs

- Generic framework has eight algorithms: Setup, PseudonymGen, PartialPrivateKeyGen, VehicleKeyGen, Sign, Verify, Aggregate, AggregateVerify (p.1268-1269, §3.1).
- RSU acts as verifier of single signatures and aggregator of many signatures into one aggregate (p.1268-1269, §3.1).
- Application server acts as aggregate verifier of the RSU-aggregated signature (p.1267, §2.1; p.1268-1269, §3.1).
- Topology is two layers: upper TA (KGC plus tracking authority TRA) with application server, lower RSUs and OBUs, with TRA/KGC fully trusted and RSUs semi-trusted honest-but-curious (p.1267, §2.1).
- Adversary model splits Type-1 (key replacement, no master secret) versus Type-2 (master secret, no key replacement) with Game-1/Game-2 existential unforgeability (p.1269-1272, §3.2).
- Five oracles define the games: CreateUser, RevealPartialPrivateKey, RevealPrivateKey, ReplaceKey, Sign (p.1269-1272, §3.2).
- Seven requirements S1–S7 frame the model: non-repudiation, identity privacy-preserving, message authentication, traceability, replay-attack resistance, unlinkability, impersonation-attack resistance (p.1268, §2.6).

## Links

- [[cahyadi2022-survey-break-fix-chain]]

## Source

- source:: [[cahyadi2022-survey-en]] (p.1268-1272, §3.1-§3.2)
