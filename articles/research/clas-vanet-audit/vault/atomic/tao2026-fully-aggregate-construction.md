---
title: ES-CLAS fully-aggregate construction
aliases: [ES-CLAS construction, fully-aggregate signing and verification]
tags: [clas, vanet, tao2026, construction, aggregate]
source:: [[tao2026-en]]
pages:: p.6
---
# ES-CLAS fully-aggregate construction
- Setup picks KGC secret s with Ppub=sP and TA trace key b with Tpub=bP, plus general hashes H1 and H2 (p.6).
- Registration issues pseudonym PID=(PID1,PID2) with TA verification, then KGC issues partial key Ri while vehicle picks secret xi with public key Ui=Ri·Ppub (p.6).
- Signing derives wi1 and wi2 via H1/H2 with timestamp T, sets Xi=xi wi1 Ppub and sg=(wi1 xi+wi2 Ri) mod q, sending {PID,VPKi,mi,T,Xi,sg} (p.6).
- Single verification checks timestamp freshness then sg·Ppub=Xi+wi2 Ui per equation (6), with RSU batch aggregate-verification each second (p.6).
- Construction aggregates various message signatures from different vehicles into a single signature to cut computation and communication overhead (p.1).
- Conditional traceability recovers RID via RIDi=PID2⊕H1(bPID1,PID1,ΔT) for registration and owner lookup (p.6).
## Links
- [[tao2026-ecdl-euf-cma-proofs]]
- [[tao2026-performance-figures]]
## Source
- source:: [[tao2026-en]] p.6
