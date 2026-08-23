# RAISE: An Efficient RSU-Aided Message Authentication Scheme in Vehicular Communication Networks

- **Authors:** Chenxi Zhang, Xiaodong Lin, Rongxing Lu, and Pin-Han Ho
- **Affiliation:** Electrical and Computer Engineering, University of Waterloo, Canada
- **Venue:** IEEE ICC 2008 (978-1-4244-2075-9/08)
- **Keywords:** Vehicular ad hoc networks, security, privacy, scalability

## Abstract

Addressing security and privacy is a prerequisite for a market-ready vehicular communication network. Prior studies addressed most of these issues but largely ignored **scalability**: when traffic density grows, a vehicle cannot verify all signatures from its neighbors in time, causing message loss, and communication overhead balloons. This paper introduces **RAISE** (RSU-Aided message authentication SchemE), in which roadside units (RSUs) verify the authenticity of vehicle messages and notify the results back to vehicles. The scheme uses **k-anonymity** so an adversary cannot associate a message with a particular vehicle. Simulations show RAISE significantly outperforms previous schemes in message loss ratio and delay.

## Motivation

- VANETs: vehicles equipped with OBUs communicate with each other (IVC) and with RSUs over DSRC (IEEE 802.11p), periodically broadcasting speed, location, acceleration, etc. for safety (accident/emergency-braking/traffic-jam warnings) and entertainment applications.
- Security requirements: message integrity, sender authentication against impersonation, and user privacy (identity, position, movement track must be hidden from third parties).
- Existing schemes: Raya et al. pre-load vehicles with many anonymous public/private key pairs and short-lived certificates; Lin et al. (GSIS) use a group signature scheme (one key pair per vehicle, single group public key); Lu et al. (ECPP) have RSUs issue temporary certificates with conditional privacy; Zhang et al. (IBV) use identity-based batch verification with a tamper-proof device; Freudiger et al. (mix zones) and Sampigethaya et al. (AMOEBA) address location privacy.
- **Key problem:** these schemes neglect scalability. Per the IEEE 1609.2 standard, each message carries a 125-byte certificate + 56-byte ECDSA signature attached to a 69-byte message (181 bytes overhead). With 50–200 vehicles in range and 100–300 ms message intervals, a receiver must verify ~200–2000 messages/second plus certificates. PKI and group-signature verification are far too slow, so the security protocol itself is not scalable to traffic density.

## System Model

Two-layer hierarchical model:
- **Upper layer:** Application servers (ASs) connected to RSUs via secure channels (e.g., TLS, wired or wireless). ASs provide application data; RSUs act as gateways to the lower layer.
- **Lower layer:** RSUs and vehicles (the focus of the paper).

**Assumptions:**
1. RSUs are trusted and hard to compromise.
2. RSUs have higher computation capability than vehicles.
3. Only IVC message authentication when an RSU is available; RSUs are deployed at high-density locations (intersections, traffic bottlenecks). Sparse areas fall back to PKI.
4. RSU communication range can exceed vehicle range, so some vehicles can hear an RSU even when the RSU cannot hear them.

## Threat Model / Security Objectives

- **Message integrity and source authentication:** messages delivered unaltered, origin authenticated against impersonation.
- **Low communication overhead and fast verification:** small overhead and acceptable latency; many signatures verifiable in a short interval.
- **Conditional privacy preservation:** identities hidden from normal receivers during authentication, yet authorities can trace a sender (e.g., for liability investigation).
- **Prevention of internal attacks:** a vehicle's keying material must not reveal other vehicles' key materials.

## The RAISE Scheme

Core idea: when a vehicle detects an RSU nearby, it associates with it; the RSU assigns a **shared symmetric secret key** and a **pseudo ID**. Vehicles authenticate messages with a fast **HMAC** code instead of a PKI signature; the RSU verifies the HMACs and broadcasts authenticity notices. If a vehicle cannot recognize a received message, it falls back to the traditional PKI-based scheme.

### Symmetric Key Establishment

- Vehicle Vi detects RSU Ri (e.g., via Hello message) and performs mutual authentication plus Diffie-Hellman key agreement secured by public-key signatures:
  - Vi → R: g^a, {g^a}SK_Vi, C_Vi
  - R → Vi: IDi || g^b, {IDi || g^a || g^b}SK_R, C_R
  - Vi → R: {g^b}SK_Vi
  - Shared key: Ki ← g^ab.
- The RSU assigns pseudo identity IDi (uniquely linked to Ki) and maintains an **ID-Key table** (ID, Key, Certificate, Time-of-last-message Ti). Stale records are deleted after a pre-defined freshness threshold. Vehicles renew anonymous certificates when leaving an RSU's range.

### Hash Aggregation (message authentication process)

1. Vi computes HMAC(IDi||Mi) with Ki and one-hop broadcasts IDi || Mi || HMAC(IDi||Mi). Only the RSU (and Vi) knows Ki, so only the RSU can verify.
2. The RSU checks IDi is in its ID-Key table and verifies the HMAC with Ki; invalid packets are dropped.
3. For each valid message the RSU computes H(IDi||Mi) and aggregates all hashes into a single signed packet: HAggt = H(ID1||M1) || ... || H(IDn||Mn), signs it with its private key SK_R, and broadcasts HAggt || {HAggt}SK_R.
4. Aggregation is batched within a release interval (e.g., 10 ms) to amortize the single signature across n messages.

### Verification

- Vehicles buffer received messages (Mi, IDi, H(IDi||Mi)) without verifying immediately.
- On receiving the signed HAggt packet, a vehicle verifies the RSU's signature once, then checks whether each buffered H(IDi||Mi) appears in HAggt. If found → message consumed (authentic). If not found in two successive aggregates → message regarded as invalid.
- Vehicles only verify the RSU's certificate during initial association, avoiding per-message certificate verification.

### Coverage requirement

Because the RSU must hear every message a vehicle receives, the RSU–vehicle (RVC) distance limit is set to **twice** the IVC distance limit (600 m vs 300 m in simulation), feasible since RSU/OBU power is dynamically configurable under 802.11p. IVC power must not be too high to avoid packet collisions under CSMA/CD.

### Privacy Preservation via k-Anonymity

- Without ID change, an adversary could trace a vehicle's trajectory by its unchanged pseudo ID.
- RAISE applies **k-anonymity**: the RSU assigns the **same pseudo ID to a group of k vehicles**; an adversary tracing one pseudo ID gets lost after the group passes an intersection. k can be as large as all vehicles in RSU range (equivalent to vehicles having no identity at all).
- Even with shared pseudo IDs, the RSU can still identify a sender: each pseudo ID maps to k distinct symmetric keys. The RSU tries all k keys against HMAC(Mi); a match identifies the sender's key and its anonymous certificate in the ID-Key table (supporting traceability). If no key matches, the message is dropped.
- Internal attacks: even if a vehicle is compromised and its key exposed, the adversary cannot distinguish vehicles sharing the same pseudo ID, so it cannot trace other vehicles' movements.

## Evaluation (ns-2 simulation)

- **Setup:** RSU at an intersection; 30–200 vehicles associate; inter-vehicle distance 7.5–15 m; IVC/RVC ranges 300/600 m; messages every 300 ms; MAC layer simulated with IEEE 802.11a at 6 Mb/s; RSU broadcasts aggregate every 10 ms.
- **Baselines:** group signature scheme (GSIS, MNT curve, 163-bit p, ~11 ms verification) and standard PKI/ECDSA scheme (224-bit, ~3.87 ms verification).
- **Metrics:** message loss ratio LR = (1/N)Σ(M_app_i/M_mac_i); message delay MD = average (T_recv − T_send) over all sender–receiver pairs.

### Results

- **Message loss ratio vs. traffic load:** loss rises with traffic load for all schemes; group signature has the highest loss, PKI in the middle, **RAISE the lowest**. Most RAISE losses come from the two-hop wireless transmission, not cryptographic delays.
- **Message delay vs. traffic load:** group signature has the highest delay (slow signature verification); PKI and RAISE yield nearly the same delay, well below the maximum allowable latency. RAISE's delay is dominated by the RSU's packet release interval (10 ms); lowering the interval reduces delay at the cost of more overhead/contention.
- **Communication overhead:** ECDSA = 181 bytes/message (cert + signature); group signature = 184 bytes/message; RAISE = 128 + 128 + (56+2)/n bytes (HMAC from vehicle + hash from RSU + one ECDSA signature and header shared over n batched messages). RAISE's overhead is **24.94% of PKI** and **23.64% of the group signature scheme**. Overhead drops sharply as the release interval grows from 2 ms to 10 ms, then flattens; overhead rises ~0.3 MB per 50 additional vehicles (per minute).

## Comparison with Baselines

| Scheme | Signature/overhead | Loss ratio | Delay | Privacy |
|---|---|---|---|---|
| PKI/ECDSA [11] | 181 B/message, per-message verification | Medium | Low (near RAISE) | Pseudo-identity, short-lived keys |
| Group signature (GSIS) [6] | 184 B/message, ~11 ms verify | Highest | Highest | Strong anonymity (no identity revealed) |
| **RAISE** | 128 bits HMAC + aggregated hashes, one RSU signature per batch | **Lowest** | Low (≈ PKI) | **k-anonymity** (conditional privacy, traceable by RSU) |

## Security Analysis / Properties

- Integrity & source authentication: only a key-holding vehicle can generate a valid HMAC; tampered messages fail HMAC verification and are dropped; the RSU's ID-Key table maps each key to a sender identity.
- Fast verification: only the RSU's certificate is verified during association; no per-message public-key verification, yielding lowest loss ratio.
- Low overhead: HMAC requires no certificate transmission.
- Identity privacy: pseudo IDs plus k-anonymity prevent mapping a message to a specific vehicle.
- Internal attack resistance: a compromised vehicle's key cannot reveal other vehicles sharing the same pseudo ID.

## Limitations / Considerations

- **Requires RSU coverage:** the scheme works only where RSUs are available (high-density areas); elsewhere it falls back to the PKI-based scheme.
- **Trust in RSUs:** RSUs must be trusted and difficult to compromise; the RSU learns/traces all sender identities.
- **Two-hop delay & loss:** vehicles depend on the RSU's aggregate packets, so losses at the RSU–vehicle hop and the release interval dominate delay; an RSU with a shorter listen range than its transmit range cannot authenticate messages it never receives (mitigated by doubling RVC range).
- **Computation at RSU:** the RSU must verify HMACs of all vehicles and try up to k keys per message under k-anonymity, placing the load on the (more powerful) infrastructure rather than vehicles.
- **Privacy ceiling:** maximum anonymity is when all vehicles share one ID; increased k raises RSU-side key-search cost.

## Conclusions

RAISE offloads message verification from resource-constrained vehicles to trusted, more powerful RSUs, replacing per-message public-key operations with fast HMAC plus batched, aggregated authenticity notices. It yields the lowest message loss ratio and lowest communication overhead compared with PKI and group-signature schemes, with delay comparable to PKI and far below the allowed maximum, while preserving conditional privacy via k-anonymity and resisting internal attacks. Supported by NSERC, Canada.

---

*Summary of: Zhang, Lin, Lu, Ho, "RAISE: An Efficient RSU-Aided Message Authentication Scheme in Vehicular Communication Networks," IEEE ICC 2008.*
