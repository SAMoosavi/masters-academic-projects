# GSIS: A Secure and Privacy-Preserving Protocol for Vehicular Communications

**Authors:** Xiaodong Lin, Xiaoting Sun, Pin-Han Ho, Xuemin Shen (University of Waterloo)
**Venue:** IEEE Transactions on Vehicular Technology, Vol. 56, No. 6, November 2007
**DOI:** 10.1109/TVT.2007.906878

## Overview

The paper identifies unique security and privacy-preservation design requirements for communications between devices in vehicular ad hoc networks (VANETs), then proposes **GSIS**, a secure and privacy-preserving protocol that combines **Group Signature** (GS) and **Identity (ID)-based Signature** techniques. GSIS guarantees security and conditional privacy while providing traceability of each vehicle when an authority needs to reveal a message sender's identity in dispute events. Extensive ns-2 simulation verifies its efficiency, effectiveness, and applicability in different road systems. This is claimed to be the first study handling both security and conditional privacy in VANETs through a cryptographic approach.

## Motivation

- Vehicles equipped with onboard units (OBUs) communicate with each other (inter-vehicle communication, IVC) and with roadside units (RSUs) located at critical points (traffic lights, signs), forming a VANET; RSUs may connect to the Internet backbone.
- VANETs are subject to many security threats and service abuses; malicious behavior (message modification, replay) can be fatal to other users.
- **Conditional privacy** is required: private information (driver's name, license plate, speed, position, maker, model, VIN, traveling routes, and their relationships) must be protected from regular users, yet authorities must be able to reveal sender identities in disputes such as crime/car-accident investigations (to find witnesses).
- At the time, only very limited prior work had tackled VANET security and privacy.

## Background and Preliminaries

### Bilinear pairing
- An admissible bilinear map is ê: G1 × G2 → GT over groups of same prime order q, satisfying **bilinearity** (ê(U^a, V^b) = ê(U, V)^ab), **nondegeneracy** (ê(P1, P2) ≠ 1), and **computability**.
- A bilinear parameter generator Gen(k) outputs the system parameters; with G1 = G2 it simplifies to a quintuple (q, P1, G1, GT, ê).
- Underlying hard problems: **CDH** (compute P1^ab from P1^a, P1^b), **DDH** (decide ab = c mod q — easy in G1 via pairing test), and **BDH** (compute ê(P1,P1)^abc from P1^a, P1^b, P1^c).
- Pairing-based schemes save bandwidth (smaller signatures) vs. RSA/ElGamal and enable IBC.

### Group signature security
A secure group signature must be correct, anonymous, and unlinkable, and traceable under certain circumstances. Additional features preferred for IVC: **role separation** (membership manager vs. tracing manager), **group membership revocation**, and **high efficiency** (small signatures/cost). Many earlier group signature schemes failed unlinkability, were forgeable/traceable, or were non-revocable with indivisible manager roles — so the paper adopts the **Boneh–Boyen–Shacham (BBS) short group signature scheme** [34].

## Related Work

- Most earlier IVC studies addressed application feasibility, MAC-layer performance, or routing — very few tackled security/privacy.
- **[3] (Raya & Hubaux):** each vehicle holds a pool of ~**43,800 anonymous certificates**, randomly choosing one per signed message; traceability via a unique electronic ID. Conditional privacy is met but the scheme is inefficient and unscalable: the ID management authority must keep every certificate for every vehicle (a huge database, 43,800 certs × millions of cars), and tracing a malicious message requires an exhaustive database search.
- **[4] (Vehicle Safety Communications Project):** short-lived anonymous certificates, blindly signed by a CA (handles "insider" attack) and discarded after use; a **linkage marker** lets escrow authorities link certificates to one vehicle; revocation via updating the certificate revocation list (CRL). Disadvantage: the CRL grows quickly — large CRL size (memory) and slow lookup.
- **GSIS differs:** provides security, privacy, *and* traceability with a considerably smaller CRL (171 b per revoked vehicle instead of 43,800 kB), making it practically deployable.

## Threat Model

Eight attack types are identified:
1. **Bogus information attack** — sending fake messages (e.g., fake traffic-jam reports) to manipulate traffic.
2. **Unauthorized preemption attack** — illegally manipulating traffic-light preemption to get priority.
3. **Message replay attack** — replaying previously valid messages to disturb traffic.
4. **Message modification attack** — altering source or content (position/time) of messages to escape liability.
5. **Impersonation attack** — pretending to be another vehicle or an RSU.
6. **RSU replication attack** — capturing/relocating a compromised RSU to broadcast fake traffic info.
7. **Denial-of-service (DoS) attack** — flooding the channel with irrelevant bulk messages (RF jamming / layer-2 flooding).
8. **Movement tracking** — eavesdropping on the open medium and tracing vehicles via position/movement-pattern analysis.

DoS is excluded from scope (already extensively studied); the paper focuses on the other security/privacy issues.

## Desired Requirements

1. **Data origin authentication and integrity** — all RSU- and OBU-sent messages verifiable and unaltered.
2. **Anonymous user authentication** — verify a user is legitimate without revealing the real ID.
3. **Vehicle anonymity** — sender's vehicle ID transparent to normal receivers while still providing position info.
4. **RSU ID exposure** — RSUs present their identities openly (locations, offered services); no privacy needed.
5. **Prevention of RSU replication** — countermeasures against compromised/relocated RSUs.
6. **Vehicle ID traceability** — authorities can reveal real sender identities in disputes.
7. **Efficiency** — minimal per-packet communication overhead and per-vehicle processing latency.

## System and Adversarial Model

- Three network entities: the **TM** (tracing manager, e.g., law authorities), the **MM** (membership manager — the Transportation Regulation Center, TRC), and mobile **OBUs** on vehicles. All vehicles register with the MM and are preloaded with public system parameters and their private key before joining.
- Adversaries can intercept any message (strongest scenario). Message *confidentiality* is not needed (everyone has the right to the content), so every message is **digitally signed** for integrity/authenticity/nonrepudiation.
- Design is split into two categories with different requirements:
  - **OBU–OBU:** contradiction between anonymity (from regular users) and traceability (by authorities). Traditional public-key certificates embed ID info, so group signatures are used — senders sign anonymously, authorities can recover identity.
  - **RSU–OBU:** RSU messages have no privacy requirement, so an **ID-based signature (IBS)** is used with the RSU's identifier string (location, unique number, code) — or an emergency vehicle's license plate number — as the public key. This greatly simplifies certificate management. Emergency-vehicle OBUs are treated like RSUs.

## The GSIS Protocol

### System Setup
- TM generates the bilinear groups: cyclic groups G1, G2 of prime order p with generators g1, g2, computable isomorphism ψ(g2) = g1, and bilinear map ê: G1 × G2 → GT. Assumptions: **strong Diffie–Hellman (SDH)** on (G1, G2) and **linear Diffie–Hellman** on G1.
- TM picks h ∈ G1, h0 ∈ G2, secrets ξ1, ξ2 ∈ Z*p with u^ξ1 = v^ξ2 = h, and h1 = h0^ξ1, h2 = h0^ξ2. TM's private key is **gmskt = (ξ1, ξ2)**; system params (G1, G2, GT, g1, g2, g, p, ψ, ê, u, v, h, h0, h1, h2) go to the TRC.
- TRC (MM) picks γ ∈ Z*p as its private key **gmskm**, sets w = Ppub = g2^γ, chooses hash functions H: {0,1}* → Z*p and H1: {0,1}* × GT → Z*p, and publishes **param** and group public key **gpk = (g1, g2, g, w)**.

### Security Protocol Between OBUs (Group Signature)

Message format (Table II): Group ID + message ID + payload (100 B, per [4]) + timestamp (anti-replay) + OBU signature of the first four fields + TTL (timer controlling message lifetime to avoid flooding).

Five phases:
1. **Membership registration** — MM computes xi = H(γ, IDi) and Ai = g1^(1/(γ+xi)) for vehicle i, storing the pair (Ai, IDi). (xi need not be stored since it is recomputable from γ and IDi.)
2. **Signing** — pick α, β ∈ Z*p; compute T1 = u^α, T2 = v^β, T3 = Ai·h^(α+β); δ1 = xi·α, δ2 = xi·β; pick blinding values rα, rβ, rxi, rδ1, rδ2; compute commitments R1–R5; challenge c = H(M, T1, T2, T3, R1, R2, R3, R4, R5); compute sα = rα + cα, sβ = rβ + cβ, sxi = rxi + c·xi, sδ1 = rδ1 + c·δ1, sδ2 = rδ2 + c·δ2; signature **σ = (T1, T2, T3, c, sα, sβ, sxi, sδ1, sδ2)**.
3. **Verification** — check the timestamp is within the allowable window; recompute (R̃1–R̃5) and c̃ from σ; accept iff c̃ = c (message valid and unaltered, sent by a trusted group member).
4. **Membership traceability** — TM validates the signature, then recovers **Ai = T3 / (T1^ξ1 · T2^ξ2)**; MM looks up Ai in its (Ai, IDi) records to find the real identity.
5. **Membership revocation** — hybrid mechanism:
   - **Case 1 (|RL| < threshold Tτ):** verifier-local revocation (VLR) — MM publishes RL = {A1, …, Ab}; each verifier runs Algorithm 1: for each Ai in RL check ê(T3/Ai, h0) = ê(T1, h1)·ê(T2, h2); if any matches, the signer is revoked.
   - **Case 2 (|RL| ≥ Tτ):** key updating — MM publishes RL = {(A*1, x1), …, (A*b, xb)} with A*i = g2^(1/(γ+xi)) ∈ G2 (A*i = ψ(Ai)); unrevoked vehicles and the group public key are locally updated:
     - **Lemma 1:** gpknew = (ĝ1, ĝ2, ĝ, ŵ) with ĝ1 = g1^(1/y), ĝ2 = g2^(1/y), ĝ = ê(ĝ1, ĝ2), ŵ = ĝ2^γ, where y = ∏(γ + xi) over revoked keys. (Proof: Appendix A.)
     - **Lemma 2:** an unrevoked vehicle updates its private key to (Â, x0) with Â = A^(1/y). (Proof: Appendix B.)
   - Rationale: VLR verification time grows linearly with the RL size, while key updating costs rekeying overhead at all unrevoked vehicles — the threshold Tτ trades these off.

**Message length:** p is a 170-b prime; G1 elements are 171 b; Lsig = 192 B. **Lmsg_OBU = 2 + 2 + 100 + 4 + 192 + 1 = 301 B.**

### Security Protocol Between RSUs and OBUs (ID-Based Signature)

Message format (Table III): type ID + message ID + payload (100 B) + timestamp + signature + ID (40 B, the sender's public key) + TTL. The RSU's ID (Table IV) contains a unique serial number, physical location, and message attribute/type; for emergency vehicles it can be the license plate number plus vehicle type and municipality.

Three phases:
1. **Private key generation** — TRC computes **SIDi = g1^(1/(γ+H(IDi)))** for each RSU's identifier string and delivers it over a secure channel.
2. **Signing** — pick random x ∈ Z*p; r = g^x ∈ GT; hσ = H1(M, r); Sσ = SIDi^(1/(x+hσ)); signature **σ = (hσ, Sσ)** ∈ Z*p × G1.
3. **Verification** — the receiver (i) compares the RSU's claimed physical location with its own (reject if beyond transmission range), (ii) checks the type ID matches the message property, (iii) checks the timestamp window, then (iv) computes **h̃σ = H1(M, ê(Sσ, g2^H(IDi) · Ppub · g^(−hσ)))** and accepts iff h̃σ = hσ.

**Message length:** Lsig = 43 B; **Lmsg_RSU = 2 + 2 + 100 + 4 + 43 + 40 + 1 = 192 B.**

**RSU-side security analysis** (beyond the provably secure IBS of [27], which ensures unforgeability, authentication, data integrity, and nonrepudiation):
- **RSU replication attack prevention:** the "ID" field carries the RSU's original physical location and type; an OBU discards messages whose claimed location is farther than the RSU's transmission range, and rejects type mismatches (e.g., a curve-speed-warning RSU cannot send "road under construction").
- **Replay attack prevention:** the timestamp/time-window check in verification drops stale messages.

## Security Properties and Analysis

**OBU–OBU (group signature) security** [referencing BBS [34]]:
- **Correctness:** a valid group member's signature always passes verification.
- **Unforgeability:** only a valid group member can sign for the group; forgery contradicts the SDH assumption.
- **Anonymity:** identifying the actual signer from σ is computationally hard for everyone except the group manager; by the linear Diffie–Hellman assumption the underlying interactive protocol is zero-knowledge, so σ reveals no signer information.
- **Unlinkability:** deciding whether two valid signatures come from the same group member is computationally hard.
- **Traceability:** the group manager can always recover the signer (via Ai = T3/(T1^ξ1·T2^ξ2)).
- **Revocation:** supported by the two revocation mechanisms.
- **Non-repudiation** of OBU messages follows from digital signing (any verifier can authenticate messages, per the problem formulation).

**RSU–OBU (ID-based signature) security:** unforgeability, authentication, data integrity, nonrepudiation (from [27]), plus RSU-replication and replay prevention as above.

## Performance Evaluation

Simulated in **ns-2** with two realistic road systems: (1) a **city-traffic scenario** — the Afton Oaks area of Houston, TX, generated via the TIGER database mobility model, vehicles moving between intersections at road speed limits of 35–75 mi/h (fluctuating ±5 mi/h); (2) a **straight bidirectional six-lane highway** with speeds 100 ± 10 mi/h. RSUs every 500 m, broadcasting every 300 ms. Crypto delays measured with the **MIRACL** library: group-signature **signing 3.6 ms**, group-signature **verification 7.2 ms** (one-pairing vs. two-pairing bottleneck), ID-based signature **verification 3.6 ms**.

Metrics: average message delay (avgDMsg) and average message loss ratio (avgLR); traffic load is measured as the average number of neighboring vehicles within communication range (captures density–range interaction better than vehicles/km²). Only security-protocol-induced loss is counted (messages dropped when the queue is full).

Results:
- **Impact of traffic load (Figs. 3–4):** end-to-end delay stays ~**22 ms** regardless of load — well below the 100-ms maximum allowable latency from [4]. Loss ratio grows with load, reaching **68%** at load up to 150 (only in severe jams; acceptable since messages are repetitively sent); normal loads (<50 neighbors) achieve ~**20% loss ratio**.
- **Impact of signature verification delay (Figs. 5–6):** delay and loss ratio increase with cryptographic cost; loss rises sharply past a threshold latency. Performance across city and highway is very close, demonstrating **stability and insensitivity to road system and traffic load**.

**Membership revocation/tracing efficiency (vs. [3]):**
- Revocation: [3] must place all 43,800 anonymous certificates of a compromised vehicle on the CRL (**43,800 kB**; an X.509 cert ≈ 1 kB). GSIS needs only one Ai per vehicle — **171 b** on the CRL. Savings grow with the number of revoked vehicles; the CRL is distributable to OBUs/RSUs, avoiding centralized lookups.
- Tracing: [3] requires keeping all certificates for every vehicle (**43,800 kB × n**, n possibly millions of cars). GSIS keeps only an (Ai, real ID) table per vehicle — **307 b** (136-b ID, the 17-character VIN, plus 171-b Ai) — i.e., **307 b × n**, a significant storage saving.

## Limitations

- **DoS attacks are out of scope** (deferred to existing literature).
- Group-signature signing/verification cost one/two pairings (~3.6/7.2 ms); loss ratio degrades sharply once verification latency exceeds a threshold, so per-message crypto cost matters at high load.
- VLR verification time grows linearly with the number of revoked vehicles (addressed by the hybrid key-update switch, which itself imposes rekeying overhead on all unrevoked vehicles).
- Confidentiality is deliberately not provided (by design, since message content is public); the work is a 2007 design — no formal proofs of the full protocol are given (security analysis is inherited from the referenced schemes [34], [27], with the revocation lemmas proven in appendices).

## Conclusion and Future Work

GSIS provides security, privacy, and efficient traceability via group signatures without the overhead of managing huge certificate stores, and reduces public-key/certificate management via ID-based signatures for RSUs and emergency vehicles. Simulations on city and highway scenarios show low message delay and loss ratio even with large cryptographic latency. Future work: reduce communication overhead with a more efficient broadcast authentication protocol such as **TESLA** (one-way hash-chain-based MAC keys).

## Key Numbers at a Glance

| Item | Value |
|---|---|
| OBU message length | 301 B (signature 192 B) |
| RSU message length | 192 B (signature 43 B, ID 40 B) |
| Group signature signing / verification | 3.6 ms / 7.2 ms |
| IBS verification | 3.6 ms |
| End-to-end delay | ~22 ms (limit 100 ms) |
| Loss ratio | 68% at load 150; ~20% at load < 50 |
| CRL entry per vehicle | 171 b vs. 43,800 kB in [3] |
| Tracing storage per vehicle | 307 b vs. 43,800 kB × n in [3] |
