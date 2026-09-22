# ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks

## Bibliographic
- Authors: Qi Tao, Xiaohui Cui | Year: 2026 | Venue: IEEE T-ITS Vol. 27 No. 3 March 2026 pp. 2858-2870 | DOI: 10.1109/TITS.2025.3650665 (p.1)

## Problem
Prior CLAS authentication solved only a few VANET security problems but "can't resist forgery attacks…" (p.1), and its computation and communication cost is not sufficiently low, affecting efficient delivery of emergency traffic messages (p.1). The paper briefly reviews the efficient and secure CLAS scheme [11], then demonstrates its security weaknesses and gives a concrete instance (p.2, §Introduction). Resource-constrained RSU devices and vehicles need lower overhead while protecting user privacy and tracking accident vehicles (p.2, §Introduction). The goal is a fully aggregate scheme that aggregates various message signatures from different vehicles into a single signature to reduce computation and communication overhead (p.1).

## Method
The system model uses five entities — TA, TMC server, KGC, RSUs, and OBU-equipped vehicles — across application and management layers (p.4, §System Model). Setup has the KGC pick secret s with Ppub=sP, the TA pick trace key b with Tpub=bP, and publish two general one-way hashes H1:{0,1}*×G×G→Zq* and H2:{0,1}*×{0,1}*×G→Zq* (p.6, §Proposed scheme). Registration issues pseudonym PID=(PID1,PID2) with TA verification, then the KGC issues partial key Ri while the vehicle picks secret xi with public key Ui=Ri·Ppub (p.6, §Proposed scheme). Signing computes wi1 and wi2 via H1/H2 with timestamp T, sets Xi=xi wi1 Ppub and sg=(wi1 xi+wi2 Ri) mod q, and sends {PID,VPKi,mi,T,Xi,sg} (p.6, §Proposed scheme).

Single verification checks timestamp freshness then sg·Ppub=Xi+wi2 Ui per equation (6), while the RSU aggregate-verifies batches received every second and forwards only valid traffic (p.6, §Proposed scheme). Conditional traceability lets the TMC recover the vehicle RID via RIDi=PID2⊕H1(bPID1,PID1,ΔT) and retrieve registration/owner information (p.6, §Proposed scheme). Security is proved as existential unforgeability under adaptive chosen-message attack in the random oracle model under ECDL intractability, via Theorem 1 plus Type-I/II Theorems 2–3 (p.7-p.9, §Security Proof). Evaluation fixes an 80-bit bilinear map on a supersingular curve for the compared schemes only and measures per-operation timings for signing, single verification, and batch verification (p.10, §Performance evaluation).

## Key findings
- The scheme uses general one-way hash operations instead of expensive map-to-point hash functions (p.1).
- Map-to-point hash and bilinear pairings with high cost were not adopted in the ES-CLAS construction (p.2).
- It inherits CLAS characteristics by aggregating various message signatures from different vehicles into a single signature (p.1).
- A lightweight conditional traceability method lets the traffic management department reveal the real identity of malicious vehicles (p.1).
- The scheme is proved existential unforgeability under adaptive chosen-message attack based on the ECDL problem (p.1).
- Performance analysis claims it will reduce at least 24.3% in computation cost than compared schemes [6],[11],[12],[13],[14],[15] (p.1-p.2).
- Single-message signing improvement is about 65.5%, 56.3%, 48.8%, 49.1%, 56%, and 24.3% over schemes [6],[11],[12],[13],[14],[15] respectively (p.11).
- Batch aggregate verification of 100 messages improves about 74.6%, 48.9%, 48.9%, 66.9%, 51.7%, and 50% over the same six schemes (p.11).
- The conclusion restates signature and verification overhead decreased by about 24.3% and 48.9% respectively, with communication cost down about 19.2% versus scheme [11] (p.12, §Conclusion).

## Limitations
Security is proved in the random oracle model with simulated collision-resistant H1/H2 oracles, not in the standard model (p.7, §Security Proof). Stated theorems cover Type-I and Type-II adversaries under ECDL intractability, with no separate collusion/Type-III theorem stated in the proof section (p.7-p.8, §Security Proof). Cost numbers assume an 80-bit supersingular-curve setting with fixed per-operation timings plus good-network lossless transmission, limiting generalization beyond those assumptions (p.10-p.11, §Performance evaluation). Interpretation: the headline 24.3% is the minimum margin across six comparators rather than a uniform gain over every scheme (p.11).

## Related Work
The paper reviews Thumbur et al. [11] as the efficient and secure CLAS baseline and then demonstrates its signature weakness with a concrete forgery instance (p.2, §Introduction). It surveys pairing-based and pairing-free CLAS efforts including Mei et al. [6], Ali et al. [12], Kumar-Sharma [13], Kamil-Ogundoyin [14], and Zhou et al. [15] alongside earlier compact-aggregation work, noting unresolved forgery and overhead gaps (p.2-p.3, §Related Work). It positions ES-CLAS against these six comparators [6],[11],[12],[13],[14],[15] in the later computation and communication evaluation (p.10-p.12, §Performance evaluation).

## Provenance
- Database + endpoint + params: local Zotero storage key UL3LUSKE for DOI 10.1109/TITS.2025.3650665, PDF extracted with pdftotext -layout, no network endpoint used.
- Access date: 2026-09-21.
- Expected vs retrieved: expected IEEE T-ITS 27(3):2858-2870 pairing-free fully-aggregate paper; retrieved matching 894-line dump with identical bibliographic, construction, and at-least-24.3% claims.
- Warnings: IEEE licensed-download watermark lines present; minor PDF-to-text equation spacing noise, verified against audited summary without new derivation.
- Mode: Full-text
