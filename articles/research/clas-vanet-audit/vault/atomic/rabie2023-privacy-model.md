---
title: Rabie2023 Privacy and Security Model
aliases: [rabie2023-privacy-model]
tags: [clas, hwmsn, rabie2023, privacy, proofs, ecdlp]
source:: rabie2023.pdf
pages:: p.51-77
---
# Rabie2023 privacy and security model

- Hardness rests on ECDLP and ECDHP over the elliptic-curve group, stated as the intractability of recovering $y$ from $beta = y alpha$ and of computing $alpha beta P$ (p.59).
- Threat model has two attackers: type I $xi1$ is a malicious user without central-server access control, type II $xi2$ is a malicious LMS/CMS that generates partial secret keys but cannot modify sensor public keys (p.60).
- The adversary game follows the [31] model with challenger $C$: the attacker owns the channel and may replay, modify, alter, delay, interleave and delete messages (p.60).
- Theorem 1 claims unforgeability under adaptive chosen-message attack assuming hard ECDLP, proved in the random-oracle model (p.66).
- Axiom 1 runs Game I for forger $xi1$ with hash queries $h1$–$h3$, create-node, partial-private-key, secret-key and signing queries, reducing forgery to ECDLP via the forking (Divarication) axiom (p.66-67).
- Theorem 2 claims resistance to existential forgery under aggregate-chosen attack, with challenger $beta2$ embedding ECDLP against forger $xi2$ (p.68).
- BAN-logic analysis sets seven objectives (Obj 1–7) over messages M1–M9 and derives S1–S23, concluding all objectives are achieved for batch authentication (p.69-70).
- Informal analysis claims data integrity via timestamp plus the $Xi = h4 . theta_i xor SKMSNi$ check, which is called highly intractable to forge (p.71).
- Anonymity claim: identities are encrypted by central and local servers so the attacker cannot tell which entity owns data even holding it (p.71).
- Traceability and unlinkability claim: pseudo-identities come from two distributed entities and are traceable only on conflicts with CMS authorization, while the random component keeps signatures unlinkable (p.71).
- Attack-resistance list covers replay, modification, impersonation/masquerading via two-way OTP-gated access, stolen-verifier-table, key escrow, man-in-the-middle, denial-of-service via halved batch verification time, and coalition resistance (p.71-72).
- Headline robustness claim is forgery, tampering and man-in-the-middle resistance from the security analysis (p.51).
- Own comparison table grants the proposed scheme every feature except revocability: integrity, authentication, anonymity, traceability, unlinkability, key-escrow resistance, impersonation, modification, masquerading, replay, MITM and DoS all ticked, revocability crossed (p.77).
- Interpretation: the formal proofs are game sketches whose extracted equations are garbled in the PDF text, so only the claimed reductions are reported here, not verified derivations (p.66-68).
- Interpretation: full privacy means both the random part and the secret-key part of the ciphertext data are protected, and one stolen partial key is useless since keys are built in distributed fashion (p.54).

## Links

- [[rabie2023-batch-construction]] — construction whose proofs are claimed here (p.64)
- [[rabie2023-figures]] — measured costs behind the efficiency claims (p.73)

## Source

- source:: rabie2023.pdf (p.51-77)
