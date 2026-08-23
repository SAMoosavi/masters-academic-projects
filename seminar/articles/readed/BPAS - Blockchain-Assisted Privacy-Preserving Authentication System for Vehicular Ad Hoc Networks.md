# BPAS: Blockchain-Assisted Privacy-Preserving Authentication System for Vehicular Ad Hoc Networks

- **Authors:** Qi Feng, Debiao He, Sherali Zeadally, Kaitai Liang
- **Venue:** IEEE Transactions on Industrial Informatics (TII)
- **DOI:** 10.1109/TII.2019.2948053 (accepted 2019)
- **Keywords:** Authentication, blockchain, smart contract, vehicular ad-hoc networks

## Abstract

VANETs support real-time traffic information services (intelligent routing, weather monitoring, emergency call), but the accuracy and credibility of transmitted messages is paramount since lives may depend on it. The paper introduces **BPAS** (Blockchain-Assisted Privacy-Preserving Authentication System), which provides automatic authentication in VANETs while preserving vehicle privacy. It is efficient and scalable, requires **no online registration centre** (except for system initialization and vehicle registration), and supports **conditional tracing** and **dynamic revocation** of misbehaving vehicles. An in-depth security analysis and a performance evaluation based on a **Hyperledger Fabric** prototype show it is an efficient solution for decentralized authentication in VANETs.

## Motivation

- Vehicles connect via wireless communication (DSRC) in V2V and V2I modes; messages inform collision avoidance, routing, traffic lighting, etc.
- Due to the openness of wireless communication, malicious entities may intercept, relay, or tamper with messages. Fraudulent traffic/position reports can cause traffic chaos or accidents, and nodes may misbehave.
- Two core needs: **secure authentication** of messages and **conditional anonymity** (a vehicle's private info visible only to a trusted authority, with accountability when fake messages cause harm).
- Prior privacy-preserving authentication protocols are highly dependent on a **centralized server**:
  - **PKI-based** solutions need a certificate authority — cumbersome certificate management, large key/certificate storage, high management (query/revocation) cost.
  - **ID-based (IBC)** solutions rely on a key generation centre — vulnerable to the **key escrow** problem and need a secure channel.
  - Hybrid schemes mitigate drawbacks but are still not scalable.
- Blockchain is an append-only, decentralized ledger that can bring "trust" and "auto-check" to VANETs — automatic message-credibility checking, behavior monitoring, and immutable tracing of communication records.
- Research question: *can we build a blockchain-assisted distributed authentication system for VANETs with privacy-preserving features?*

## Related Work (Baselines)

- **PKI-based:** Raya & Hubaux [17] used anonymous certificates (AC); Lu et al. [19] added temporary ACs for unlinkability; Calandriello et al. [18] simplified certificate management with group signatures + baseline pseudonyms; Wasef et al. [20] proposed EMAP (PKI + hash-based MAC). All suffer from the PKI weaknesses listed above.
- **IBC-based:** Shamir [25] introduced IBC; Zhang et al. [21] used it for lightweight message authentication; Chim et al. [22] enhanced privacy with two shared secrets but remained vulnerable to impersonation (per Horng et al. [9]); He et al. [24] and Li et al. [10] improved IBC for VANETs. Inherent key-escrow and secure-channel drawbacks remain.
- **Blockchain-based:** Rowan et al. [26] proposed blockchain-based PKI with physical side-channels (security issues due to autonomous-vehicle requirement); Dorri et al. [27] used blockchain with changeable public keys (membership management and scalability limits); Lu et al. [28] and Kchaou et al. [29] built reputation/trust-management frameworks on blockchain (strong accountability but **cannot prevent malicious behavior beforehand**).

The paper does **not** provide a quantitative performance comparison against these baselines; the comparison is qualitative (drawn from related work).

## System Model

Three layers:
1. **Upper layer — Trusted authority (TA):** trusted third party responsible for system initialization, smart-contract deployment, vehicle registration and revocation. Assumed to have considerable computation/communication capability and to never collude with other parties.
2. **Bottom layer — Vehicles and RSUs:** vehicles equipped with tamper-proof **on-board units (OBUs)** (preloaded info assumed safe); RSUs are roadside infrastructure that receive, verify, and relay instant messages.
3. **Extended layer — Smart contracts and blockchain:** a **consortium blockchain** (Hyperledger Fabric) maintained by **blockchain managers** (consensus nodes). Permitted nodes can query states verified by a majority of managers.

Five participants:
- **TA:** initialization, contract deployment, registration, revocation.
- **Vehicle:** services for the driver, communicates wirelessly via OBU.
- **RSU:** roadside infrastructure, relays verified messages to traffic control centre / other vehicles.
- **Smart contract:** loads a **Vehicle Public Key Table (VPKT)** aggregating "identity–public key" relationships; provides automatic, timely feedback on public key queries (on-chain code, executed/verified by blockchain managers).
- **Blockchain:** consortium blockchain handling transaction states and smart contracts among managers via a consensus algorithm.

Assumptions: TA authenticates vehicle owners and preloads authenticators in OBUs **offline**; vehicles/RSUs use DSRC; only the TA can deploy/update/revoke smart contracts; managers verify all transactions and new smart-contract states before committing.

## Threat Model / Design Goals

- **Single registration** — each vehicle registers only once before messaging.
- **Message authentication** — RSUs/vehicles can verify originator identity, message integrity, and timeliness.
- **Privacy preservation** — real identity invisible to RSUs/vehicles/adversaries analyzing transcripts.
- **Traceability** — TA can trace a real identity when malicious behavior occurs (e.g., fake messages).
- **Three-factor security** — adversary cannot extract info about the three secret authenticators (OBU, password, biometrics).
- **No online registration center** — authentication must not depend on the registration centre being online.
- **Resistance to cyber attacks** — offline password guessing, replay, vehicle impersonation, and DDoS.

## Building Blocks

1. **Fuzzy extractor** (Dodis et al. [30]) — biometrics-based key extraction: `Gen(BiO) = (σ, ρ)` extracts a high-entropy secret σ and public string ρ; `Rep(BiO', ρ) = σ` recovers σ if sample distance `dis(BiO, BiO') < τ`.
2. **Attribute-based encryption (ABE)** (CP-ABE, Bethencourt et al. [31]) — access-tree policy Ψ over attributes; algorithms `TSetup, AttrEnc, AKeyGen, AKeyDel, Decrypt`. Used to encrypt a vehicle's blinded identity so only blockchain managers whose attributes satisfy Ψ can decrypt it.
3. **Blockchain and smart contracts** — Hyperledger Fabric (consortium blockchain) chosen for efficient transactions, Turing-complete chaincode, and built-in access control. Smart contracts expose ABIs (insert/update/revoke/query) for the **VPKT**. Only the TA and blockchain managers may query the VPKT.

## Proposed BPAS Scheme

### 1. System Initialization (by TA)
- **ECC initialization:** generates `ECParams = {q, a, b, n, P, Ppub, H1, H2}` over curve `E(q): y² = x³ + ax + b mod q`, generator P of group `G_EC`, system public key `Ppub = s·P` with secret `s`, hash functions H1, H2.
- **ABE initialization:** defines access structure Ψ and attribute set A; runs `ABE.TSetup` and `ABE.AKeyGen`; issues each blockchain manager a delegated sub-key via `ABE.AKeyDel` based on its attributes.
- **Blockchain initialization:** starts a consortium blockchain with **PBFT** consensus among pre-authenticated managers; deploys an access control list (READ, RECORD) in Hyperledger Fabric.

### 2. Smart Contract Deployment
TA compiles and deploys the VPKT-management smart contracts; after verification by managers they get unique addresses and can be invoked by permitted transactions.

### 3. Vehicle Registration (over a secure channel, offline)
1. Owner picks identity `V_ID`, password `pw`, imprints biometrics; computes `(σ, ρ) ← Gen(BiO)`; submits `{V_ID, pw, σ, ρ}`.
2. TA computes: blinded identity `AID = V_ID ⊕ H1(sk·Ppub)` with secret key `sk = H2(V_ID || s)`; `K = H1(V_ID || pw || σ)`; public key `VPK = sk·P`.
3. TA loads `{K, ρ, ABEParams, ECParams, Ψ, V_ID, AID}` into the tamper-proof OBU and uploads `{AID, VPK}` into the smart contract via the `insertVPKT(AID, VPK)` ABI (private transaction).

### 4. Login and Message Authentication
1. Owner enters `pw'` and biometrics `BiO'`; OBU computes `σ' ← Rep(BiO', ρ)` and checks `K = H1(V_ID || pw' || σ')`. On success it encrypts the blinded identity `Υ ← ABE.AttrEnc(AID)`, picks random `r`, computes `R = r·P`, `α = H2(Υ || R || M || T1)`, `ω = r + α·sk mod n`, and broadcasts `{Υ, M, R, T1, ω}`.
2. Receiver checks timestamp `T1` freshness, then submits a transaction with `Υ` to the blockchain managers requesting the associated public key.
3. Managers satisfying Ψ decrypt via `ABE.Decrypt` to obtain `AID` and look up `VPK` in the VPKT.
4. Receiver computes `α' = H2(Υ || R || M || T1)` and **accepts iff** `ω·P = R + α'·VPK`; otherwise rejects.
- **Correctness:** since `VPK = sk·P` and `ω = r + α·sk mod n`, we get `ω·P = (r + α·sk)·P = R + α·VPK`. Any modification is detected immediately.

### 5. Vehicle Revocation
TA calls `revokeVPKT(AID)` to delete the vehicle's tuple from the VPKT. OBU contents cannot be modified after initialization, so credential changes require revoking the old account and starting a new registration. **Mandatory access control (MAC)** ensures only the TA can change VPKT state, preventing malicious deletion/amendment.

## Security Properties (Analysis)

- **Single registration:** after registration, vehicles authenticate without TA involvement.
- **Message authentication:** forgery of valid transcripts prevented by hash collision resistance and the ECDLP; modifications detected.
- **Privacy preservation:** ABE hides `V_ID`; blockchain managers act as *mixers* (decrypt ciphertext to masked AID for the query), giving **unlinkability**; the blinding factor in `AID = V_ID ⊕ H1(sk·s·P)` is a Diffie–Hellman tuple, so under the CDH assumption no malicious entity (RSU, vehicle, third party) can recover the real identity.
- **Traceability:** only the TA and the associated vehicle can reveal the real identity from records stored in the blockchain; accountability is credible due to blockchain data integrity.
- **Three-factor security:** OBU is tamper-proof; broadcast messages contain no password/biometric information, so neither can be guessed/extracted by eavesdroppers.
- **No online registration center:** RSUs/vehicles verify signatures via the decentralized smart contracts; TA is offline during authentication.
- **Resistant to:** offline password guessing (no password info in transcripts), replay (timestamps + ABE indistinguishability + random r), vehicle impersonation (owner check `K` + secret key `sk` inside OBU), and DDoS (blockchain consensus prevents illegal transactions; ABI queries execute automatically even when parts of the network are blocked).

## Evaluation Methodology

1. **Crypto primitive timing:** Ubuntu 18.04 laptop, Intel Core i7-6700 @3.40 GHz, 2 GB RAM; ECC operations implemented with the **RELIC** library; ABE instantiated via **cpabe-toolkit**.
2. **Prototype:** Hyperledger network initialized with **Hyperledger Composer v0.20.7** on AWS (Intel Xeon Skylake 6133 @2.5 GHz, 2 cores, Ubuntu 16.04). Smart contracts written in JavaScript deployed over a 4-node LAN (192.168.0.1–192.168.0.4): (1) **orderer** node (consensus, MSP setup), (2)(3) **peer** docker containers (v18.09.3, keep ledger copies), (4) **CA** node issuing identities/certificates (provides anonymity/unlinkability for transactions).

### Results

Basic operations (average time, µs):

| Operation | Time (µs) |
|---|---|
| Point addition | 0.184 |
| Scalar multiplication | 64.99 |
| Integer multiplication | 0.179 |
| Hash | 0.296 |

ABE operations (average time, µs):

| Operation | Time (µs) |
|---|---|
| ABE.TSetup | 130.00 |
| ABE.KeyDel | 224.19 |
| ABE.AttrEnc | 390.87 |
| ABE.Decrypt | 77.02 |

Per-phase cost: login = 1 `Rep` + 1 hash; message generation = 1 ABE encryption + 1 point multiplication + 1 integer multiplication + 1 hash; public-key query = 1 ABE decryption + blockchain tasks; message verification = 1 hash + 2 point multiplications + 1 point addition.

End-to-end phase running times (s):

| Step | Running time (s) |
|---|---|
| Registration (TA) | 2.466 |
| Login and message signing (Vehicle) | 0.457 |
| Query public key (RSU) | 0.302 |
| Message authentication (Vehicle) | 0.130 |
| Revocation (TA) | 2.338 |

Breakdown by operation type (s): the Hyperledger operations dominate Registration (0.131 basic + 2.335 Hyperledger) and Revocation (2.338 Hyperledger); ABE dominates Login & message signing (0.39 ABE) and Query public key (0.077 ABE + 0.225 Hyperledger); Message authentication is pure basic ops (0.13). Total authentication time is constant.

## Limitations

- **ABE operations are the performance bottleneck** — the paper suggests substituting an "existing and more efficient" ABE scheme could reduce cost.
- **Registration and revocation take a few seconds each**; impact is limited since they are infrequent and offline.
- **No batch verification** — each message is verified individually (left to future work).
- Still requires a **centralized TA** for initialization, registration, and revocation.
- No quantitative comparison against PKI/IBC/other blockchain baselines is provided.
- VPKT queries are answered through blockchain managers, which introduces a per-authentication on-chain round trip.

## Conclusion & Future Work

BPAS shows blockchain can deliver decentralized, privacy-preserving authentication with the TA offline. Future work: extend BPAS to support **batch verification of multiple messages** to optimize verification and reduce resource consumption, and explore **flexible privacy-preserving mechanisms** to meet differing VANET security needs in practice.
