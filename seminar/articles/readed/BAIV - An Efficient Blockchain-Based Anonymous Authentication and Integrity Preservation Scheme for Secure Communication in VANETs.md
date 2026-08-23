# BAIV: An Efficient Blockchain-Based Anonymous Authentication and Integrity Preservation Scheme for Secure Communication in VANETs

**Authors:** Azees Maria, Arun Sekar Rajasekaran, Fadi Al-Turjman, Chadi Altrjman, Leonardo Mostarda

**Publication:** Electronics (MDPI) 2022, 11, 488. DOI: [10.3390/electronics11030488](https://doi.org/10.3390/electronics11030488)

**Timeline:** Received 24 December 2021; Accepted 4 February 2022; Published 8 February 2022

**Keywords:** authentication; blockchain; integrity; security; revocation

---

## Abstract

Intelligent transport systems (ITS) have improved the driving experience in vehicular ad-hoc networks (VANETs), but providing low computational cost with high serving capability remains critical. In conventional VANETs, a vehicle moving from one roadside unit (RSU) region to another must be re-authenticated by each successive RSU, increasing computational complexity. BAIV addresses this by integrating blockchain with VANET so that a vehicle can be authenticated **without the involvement of a trusted authority (TA)**. Blockchain also preserves message integrity and user privacy. Unlike prior blockchain-based schemes, which lacked **conditional anonymity**, BAIV introduces conditional privacy to revoke malicious vehicles in case of disputes and prevent further damage to the VANET system. The scheme provides anonymous authentication, privacy, and integrity preservation with conditional tracking. Security analysis demonstrates defense against common threats, and the performance evaluation shows the scheme's competence relative to similar methods.

---

## 1. Motivation and Problem Statement

- VANETs are distributed, self-organizing networks of moving vehicles; they share critical information (emergency-center proximity, hospitals, police stations, weather/driving conditions) and support two communication types: **V2R** (vehicle-to-RSU, wired) and **V2V** (vehicle-to-vehicle, open wireless medium).
- Communication over the open wireless medium is vulnerable to hacking and modification; without security measures, the system is exposed to **impersonation attacks, bogus message attacks**, etc.
- Required security measures: anonymous authentication, privacy, integrity preservation, and non-repudiation. If a legitimate user turns out to be malicious, the TA must reveal the fake identity via a **conditional revoking mechanism**.
- Most existing work relies on PKI; cryptosystems used are RSA and **ECC (elliptic curve cryptography)**. ECC is preferred for its smaller key size and better performance. Security rests on the discrete logarithm problem (DLP).
- **Core problem:** in existing systems, vehicles and RSUs register with a TA, and every handover to a new RSU region requires re-authentication — more computation time and degraded network performance.
- **Solution idea:** integrate blockchain into the VANET, exploiting blockchain features: immutability, decentralization, distributed ledgers, consistency, security, integrity, and transparency.

## 2. Contributions

1. **Anonymous authentication** to check the legitimacy of both vehicles and RSUs.
2. **Blockchain-based handover authentication** for vehicles in roaming (eliminates repeated re-authentication).
3. **Conditional privacy** to revoke disobedient vehicles at any time.
4. **Integrity preservation** to guard communicated messages against modification attacks.

The scheme uses **bilinear pairing of points on an elliptic curve** integrated with blockchain, achieving anonymous authentication and message integrity with low computation. Digital signatures and hashing authenticate legitimate users; a hash function checks message integrity (sender broadcasts message + hash; receivers recompute and compare the hash — accepted only on match).

---

## 3. Related Work (Summary)

| Year | Author(s) | Scheme | Limitation noted |
|------|-----------|--------|------------------|
| 2016 | Sharma et al. [15] | VANET communication model (MATLAB) | No security focus |
| 2017 | Deeksha et al. [16] | Survey of security threats/countermeasures | Survey only |
| 2018 | Lu et al. [17] | Blockchain-based anonymous reputation (BARS) | High communication/computation cost |
| 2018 | Dai et al. [18] | Learning-based OBU protocol with hotbooting | Does not address computation/communication costs |
| 2019 | Lu et al. [19] | Blockchain-based privacy preservation with multiple certificates | High computation (distributed authentication) |
| 2020 | Feng et al. [20] | Blockchain-assisted privacy-preserving authentication (BPAS) | Vulnerable to replay attacks |
| 2020 | Kouicem et al. [21] | Consortium-blockchain data sharing | High storage cost, low efficiency |
| 2020 | Ma et al. [22] | Blockchain key management on bivariate polynomial | Considerable latency |
| 2020 | Li et al. [23] | Blockchain location-privacy with trust-based algorithm | High communication/computation |
| 2020 | Lin et al. [24] | Conditional privacy via certificates (BCPPA) | High computation for cert generation/verification |
| 2020 | El-Salakawy et al. [25] | Blockchain data management | Large block size |
| 2020 | Liu et al. [26] | Blockchain unlinkable authentication (BUA) | Latency and storage costs |
| — | Yang et al. [27] | Cloud-computing privacy-preserving scheme | No efficient revocation |
| — | Hatzivasilis et al. [30] | Mobile trust resource-sharing framework | No efficient anonymous authentication |

**Key takeaway:** most prior schemes incur high computational/storage costs and few support efficient revocation with conditional anonymity — the gap BAIV fills.

---

## 4. System Model

The system model comprises **three main entities**: TA, RSU, and OBU. Blockchain is an independent network; all RSUs and the TA connect to it independently.

### 4.1 Trusted Authority (TA)
- Superior unit of the VANET system; responsible for supervision of the whole system.
- Registers RSUs, OBUs, and vehicle users; assigns each a unique registration ID; manages and preserves the integrity of the database and software information.
- Generates the public and private keys.
- Plays a key role in **revoking malicious vehicle users** based on a conditional tracking mechanism.
- RSUs within the TA's region connect to the TA through a wired medium.

### 4.2 Roadside Unit (RSU)
- Computing device installed along roads, in parking lots, or at crossroads/junctions; provides local connectivity to vehicles in range.
- Uses **IEEE 802.11p** (DSRC) for short-range dedicated communication; interconnected with neighboring RSUs and the TA via wired network, and to vehicles wirelessly.
- Provides location-based information to authenticated vehicles; receives credentials from the TA.

### 4.3 Onboard Unit (OBU)
- Every intelligent vehicle is equipped with an OBU for vehicle-to-vehicle communication.
- Implanted with GPS (latitude, longitude, time data) and data recorders that record crash information (similar to an aircraft black box).

### 4.4 Blockchain
- Blocks form a distributed ledger; transactions are immutable and non-tamperable.
- Each block links to the previous block via its hash (SHA-256 hash codes); modifying one block affects the entire chain; data are transparent and fully decentralized (no third-party governing body).
- After successful anonymous authentication of a vehicle, that information is stored on the blockchain, so **no re-authentication by subsequent RSUs** is required (low computation time, higher system efficiency).

---

## 5. Threat Model

Two attacker types: **internal (insider)** attackers performing malicious activities inside the VANET, and **external** attackers. The work focuses mainly on the **external attacker**. Attacks considered:

1. **Impersonation attack** — adversary pretends to be a legitimate vehicle user or RSU to access sensitive information.
2. **Fake message (bogus message) attack** — adversary sends bogus messages; the victim acts on false information, leading to disaster.
3. **Privacy revealing attack** — leakage of entity privacy/sensitive information.
4. **Masquerading attack** — adversary steals original login/password and gains unauthorized access.
5. **Forgery attack** — adversary forges the certificate/signature of an authenticated user/RSU.

---

## 6. Proposed BAIV Scheme

Seven phases: system initialization, vehicle registration, RSU registration, anonymous authentication of a vehicle user, anonymous authentication of an RSU, secure message transmission with integrity preservation, and revocation.

### 6.1 Notations
| Notation | Meaning |
|----------|---------|
| TA | Trusted authority |
| y² = x³ + ax + b mod q | Finite elliptic curve equation |
| P, Q | Points on the finite elliptic curve |
| q | Large prime number |
| Zq* | Non-zero elements of the finite field Zq, [1, ..., q−1] |
| α, β, γi | Random numbers chosen from Zq* by TA |
| Tpub | Public key of TA (Tpub = αP) |
| Tver | Verification key of TA (Tver = βP) |
| H: {0,1}* | Secure hash function |
| A_ID1, A_ID2 | First/second authentication IDs for a vehicle user |
| D_IDv | Dummy identity of a vehicle user |
| VID1, VID2 | First/second verification IDs for an RSU |
| D_IDR | Dummy identity of an RSU |
| θi | Signature of a message |
| mi / mi* | Original message / false message |
| ti | Timestamp |
| xi, ui | Random numbers chosen by RSU/user |
| s1, s2 | Short life keys of RSU |
| ⊕ | XOR operation |
| A = e(P, Q)^γi | Value stored in blockchain for verification |

### 6.2 System Initialization
TA chooses the finite elliptic curve y² = x³ + ax + b mod q (q large prime), points P and Q, and random numbers α, β ∈ Zq*. Computes:
- Public key: Tpub = αP
- Verification key: Tver = βP
- Hash function H: {0,1}* → Zq*

Publishes public parameters: **(Tpub, Tver, H, P, Q, e(P,Q), q)** to all users and RSUs.

### 6.3 Registration of Vehicles
1. User submits original credentials (phone number, personal ID, address) to the TA.
2. TA chooses γi ∈ Zq* and computes the first authentication ID: **A_ID1 = γi(α + β)**.
3. TA chooses a dummy vehicle ID **D_IDv ∈ Zq***; dummy identities are mapped to real identities **only in the TA**, so captured dummy identities reveal zero knowledge about the real identity.
4. TA computes the second authentication ID: **A_ID2 = H(D_IDv × A_ID1)**.
5. TA returns **(γi, A_ID1, A_ID2)** to the vehicle securely and stores **(D_IDv, A)** in the blockchain, where **A = e(P, Q)^γi**.

### 6.4 Registration of an RSU
1. TA computes the first verification ID: **VID1 = (1/(α+β)) · Q**.
2. TA chooses a dummy ID **D_IDR ∈ Zq*** and computes the second verification ID: **VID2 = H(D_IDR × VID1)**.
3. TA secretly stores **(VID1, VID2, β)** in the RSU.

### 6.5 Anonymous Authentication of a Vehicle User
1. Vehicle OBU sends **γiP** to the RSU.
2. RSU sends **D_IDR·P** to the OBU.
3. User computes k = γi · D_IDR · P; RSU independently computes k = D_IDR × γiP.
4. User computes **k1 = A_ID1 ⊕ H(k)** and sends k1 to the RSU.
5. RSU recovers **A_ID1 = k1 ⊕ H(k)**, then computes **e(A_ID1P, VID1)** and checks it against A stored on the blockchain — authentication without TA involvement.

**Proof of correctness:**
```
e(A_ID1P, VID1) = e(γi(α+β)P, (1/(α+β))Q) = e(P,Q)^γi(α+β)/(α+β) = e(P,Q)^γi = A ✓
```
6. RSU fetches D_IDv from the blockchain and builds an authentication receipt **AR = (D_IDR, D_IDv, H(D_IDR, D_IDv))**, broadcast to all upcoming RSUs to avoid frequent re-authentication.
7. RSU sends **k2 = A_ID1 ⊕ D_IDR** to the user, who extracts **D_IDR = A_ID1 ⊕ k2**.

### 6.6 Anonymous Authentication of an RSU
RSU chooses xi ∈ Zq* and computes:
- ui = xiP
- ϕi = H(A_ID1 × Tpub)
- λi = (xi + ϕiβ) mod q
- s1 = D_IDR ⊕ λi  (short-life key)
- s2 = A_ID2 ⊕ ϕi   (short-life key)

RSU sends (ui, s1, s2) to the user. The user retrieves λi and ϕi and checks:
```
λiP = (ui + ϕi Tver)
```
**Proof:** λiP = (xi + ϕiβ)P = xiP + ϕiβP = ui + ϕi Tver ✓
If satisfied, the user accepts the RSU and obtains location-based information.

### 6.7 Secure Message Transmission and Integrity Preservation
Sender vehicle chooses µi, ai ∈ Zq* and computes:
1. X1 = µi Tpub
2. Y1 = λi Tpub
3. ℘ = X1 + Y1
4. Ai = ai Tpub
5. δi = H(mi × Ai)
6. **ηi = δi(ai + µi + λi) mod q**

The message signature is **θi = (Ai, mi)**; uniqueness of the signature preserves integrity. Sender transmits **(ηi, ti, mi, θi, ℘, D_IDv)** where ti is the timestamp.

Receiver computes δi = H(mi × Ai) and verifies:
```
ηi Tpub = δi(Ai + ℘)
```
**Proof:** ηi Tpub = δi(ai + µi + λi)Tpub = δi(Ai + X1 + Y1) = δi(Ai + ℘) ✓
If satisfied, message mi is accepted; otherwise rejected.

### 6.8 Revocation
- If a vehicle broadcasts false information mi*, other vehicles forward **(ti, mi*, θi, D_IDv)** to the TA through the RSU.
- TA revokes the vehicle and sends **(D_IDv, H(D_IDv, β))** to all RSUs.
- Each RSU computes F = H(D_IDv, β); if F matches the received value, D_IDv is stored in the RSU's block list and the vehicle is barred from further communication.

---

## 7. Security Analysis (Properties Achieved)

| Property | How it is achieved |
|----------|--------------------|
| **Impersonation resistance** | γi and D_IDR are chosen and transferred securely offline by the TA; adversary cannot compromise TA credentials. |
| **Message modification resistance** | ηi = δi(ai + µi + λi) mod q binds message and signature; recovering ai/λi requires solving the DLP, so mi and ηi cannot be altered. |
| **Fake/bogus message resistance** | D_IDv supplied securely by TA; ℘ depends on random µi and λi (which involves hashed H(A_ID1 × Tpub)); hard via DLP. |
| **Message integrity & unlinkability** | New signature θi = (Ai, mi) per message with fresh random ai; signatures can't be modified, and successive messages are unlinkable. |
| **Replay attack resistance** | Every message carries a timestamp ti; stale messages beyond the valid time interval are discarded. |
| **Conditional tracking / revocation** | Malicious vehicles identified by (ti, mi*, θi, D_IDv); TA revokes and RSUs add D_IDv to block lists. |
| **Conditional privacy preservation** | Only dummy identities (D_IDv, D_IDR) are used during communication; mapped to real identities only in TA — zero knowledge leaks even if captured. |
| **Non-repudiation** | Offline registration with original credentials; authenticated entities cannot deny their actions. |

---

## 8. Performance Evaluation

### 8.1 Setup
- **Platform:** Cygwin 1.7.35, Core i7 3.4 GHz, 8 GB memory, GCC 4.9.2.
- **Library:** Pairing-based cryptography (PBC library).
- Operation execution times (ms): point addition (Exa) = 0.011, point multiplication (Exm) = 2.4, hashing (Exh) = 0.01, pairing (Exp) = 2.9, XOR (Exxor) = 0.01.
- Execution periods computed over 100 random simulations (averaged).

### 8.2 Computational Cost (Comparison with Prior Schemes)

| Scheme | Single user & single RSU (ms) | n users & n RSUs (ms) |
|--------|-------------------------------|------------------------|
| Azees et al. [35] | 2Exp + 5Exm = **17.8** | (1 + n)Exp + 5nExm |
| X. Lin et al. [36] | 3Exp + 9Exm = **30.3** | 3nExp + (3 + 6n)Exm |
| Zhang et al. [37] | 3Exp + 4Exm + 3Exh = **18.33** | 3nExp + (2n + 2)Exm + 3nExh |
| R. Lu et al. [38] | 4Exp + 10Exm = **35.6** | (3 + n)Exp + (4 + 6n)Exm |
| **BAIV (proposed)** | **4Exm + Exp + Exa + 3Exxor = 12.54** | **4nExm + nExp + nExa + 3nExxor** |

**Key results:**
- BAIV is the fastest: **12.54 ms** for single user/RSU authentication (vs 17.8–35.6 ms for others), mainly because it needs only **one pairing operation** while prior schemes require 2–4.
- Throughput: ≈ **80 vehicle users authenticated per second** per RSU; ≈ **4800 users per minute**.
- For authenticating 100 users: BAIV requires **1291 ms**, while the compared schemes consume **more than 1375 ms** (Figure 7).
- With blockchain, only initial authentication is performed per car; subsequent RSUs fetch authenticated data from the blockchain — no re-authentication, significantly reducing cost.
- RSUs should be placed every ~300 m (wireless range limits), interconnected via the wireless network.

### 8.3 RSU Service Providing Capability
- Serving capability is the successful service provided to vehicle users in an RSU's coverage region; authentication time per user is Δ = 12.54 ms, and total capability is expressed as a function of the number N of authenticated users (Figure 8).
- As the number of vehicle users increases, computation time increases and the RSU serving-capability ratio decreases.

---

## 9. Conclusion and Future Work

- Blockchain provides authenticity for the vehicle user **without TA involvement**; re-authentication by subsequent RSUs is completely evaded via stored blockchain data.
- Vehicles verify RSUs anonymously before trusting location-based information; messages are exchanged via an efficient handover mechanism.
- Signatures + timestamps preserve integrity and resist replay attacks; the scheme tolerates non-repudiation, impersonation, bogus/fake message, and message alteration attacks.
- Performance is evaluated on computational cost and RSU serving capability.

**Future work:** batch authentication integrated with artificial intelligence for low computational cost during authentication; security issues for 6G and edge computing; a lightweight ECC-based revocation scheme; identity-based verification for groups of vehicles; and focus on message delay and message transmission loss.

---

## 10. Limitations / Observations

- **No formal security proof** — only informal security analysis of attack resistance.
- **Pairing-based cryptography** — though only one pairing is needed, bilinear pairing is still computationally heavier than pure ECC operations; the approach assumes pairing-capable hardware.
- **Blockchain overhead not quantified** — the paper does not measure storage cost, block propagation delay, or ledger maintenance cost of the blockchain.
- **Replay defense is timestamp-only** — no explicit nonce/session binding beyond timestamp validity is described.
- **Revocation is TA-centric** — revocation still requires the trusted authority to trigger the block-list update, and the paper notes no revocation latency analysis.
- **Simulation-based evaluation only** — no real-world testbed or field trial; results assume single-user sequential authentication (no batch verification), which is also flagged as future work.

---

## References (Selected)
- [35] Azees, M.; Vijayakumar, P.; Deboarh, L.J. EAAP: Efficient Anonymous Authentication with Conditional Privacy-Preserving Scheme for VANETs. *IEEE Trans. Intell. Transp. Syst.* 2017, 18, 2467–2476.
- [36] Lin, X.; Sun, X.; Ho, P.-H.; Shen, X. GSIS: A Secure and Privacy-Preserving Protocol for Vehicular Communications. *IEEE Trans. Veh. Technol.* 2007, 56, 3442–3456.
- [37] Zhang, C.; Lu, R.; Lin, X.; Ho, P.-H.; Shen, X. An Efficient Identity-Based Batch Verification Scheme for Vehicular Sensor Networks. *IEEE INFOCOM* 2008.
- [38] Lu, R.; et al. Pseudonym Changing at Social Spots: An Effective Strategy for Location Privacy in VANETs. *IEEE Trans. Veh. Technol.* 2012, 61, 86–96.

Full reference list (40 entries) available in the paper (DOI: 10.3390/electronics11030488).
