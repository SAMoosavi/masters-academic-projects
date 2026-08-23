# Paper Summary Report

## DIVA: A DID-based reputation system for secure transmission in VANETs using IOTA

**Authors:** Angelo Feraudo, Nicolò Romandini, Carlo Mazzocca, Rebecca Montanari, Paolo Bellavista
**Affiliation:** Department of Computer Science and Engineering, University of Bologna, Italy
**Journal:** Computer Networks, Volume 244, 2024, Article 110332 (Elsevier, open access, CC BY)
**DOI:** [10.1016/j.comnet.2024.110332](https://doi.org/10.1016/j.comnet.2024.110332)
**Funding:** SERICS (PE00000014) under MUR National Recovery and Resilience Plan, EU NextGenerationEU

---

## 1. Abstract

This paper proposes **DIVA**, a Decentralized Identifier (DID)-based reputation system for secure vehicle-to-vehicle (V2V) communication in Vehicular Ad-hoc Networks (VANETs). The system leverages the **IOTA Tangle** (a DAG-based distributed ledger) for tamper-proof storage of reputation scores and uses **DIDs** for decentralized vehicle identification. DIVA computes reputation scores by analyzing both safety and non-safety messages exchanged among vehicles and Road Side Units (RSUs), in compliance with **ETSI** standards. The experimental results, obtained on an extended dataset of realistic V2V messages made publicly available to the research community, show DIVA effectively identifies malicious contributors with an accuracy of approximately **90%** across various scenarios.

---

## 2. Motivation & Problem Statement

VANETs are essential components of Intelligent Transportation Systems (ITS), enabling vehicles to exchange road-related messages for safety, traffic optimization, and pedestrian protection. However, **V2V communications lack effective and efficient security solutions** that ensure the trustworthiness of transmitted content. Key challenges:

- **Message forgery:** Attackers may forge messages with false/misleading information, potentially causing accidents or misrouted vehicles.
- **Eavesdropping:** Passive attacks to gather sensitive information about vehicles and traffic.
- **Dynamic topology & pseudonyms:** Frequent network changes and temporary identifiers make reputation tracking difficult.
- **Latency requirements:** Reputation computation must not introduce significant delays for latency-sensitive VANET applications.
- **Limitations of existing solutions:** Most reputation-based systems (1) do not verify the truthfulness of the content inside standard-defined message structures, and (2) perform score computation directly on vehicles, generating non-negligible delays.

---

## 3. Background

### 3.1 VANET
- Self-organizing networks using vehicles (equipped with **On Board Units, OBUs**) as mobile nodes; **RSUs** provide service access.
- Communication technologies: **IEEE 802.11p** and **Cellular V2X (C-V2X)**.
  - **IEEE 802.11bd**: next-gen standard based on 802.11ac (Wi-Fi 5), promising ~2x performance of 802.11p in throughput, latency, reliability, and range, with backward compatibility; LDPC coding and Midambles yield message-delivery reliability of ~88% vs ~75% for 802.11p.
  - **C-V2X (3GPP)**: PC5 interface for direct V2V, Uu interface for cellular infrastructure; Release 14 broadcast only, Release 16 (New Radio V2X) adds unicast/groupcast.
- Message standards: **WAVE/BSM** (US) vs **ETSI ITS-G5/CAM** (Europe).
- **GeoNetworking Protocol**: geographical routing for message dissemination.

### 3.2 Decentralized Identifiers (DIDs) & Verifiable Credentials (VCs)
- DIDs uniquely identify entities without centralized identity providers; each DID (URI + method identifier + method-specific identifier) resolves to a machine-readable **DID Document** (JSON-LD) containing public keys, service endpoints, authentication parameters, timestamps, metadata.
- **VCs**: cryptographically verifiable, tamper-proof claims issued by trusted issuers (e.g., Ministry of Transport, Department of Motor Vehicles); ecosystem of holders, issuers, verifiers, and a verifiable data registry.
- **Verifiable Presentations (VPs)**: signed methods for holders to present their VCs and prove ownership.

### 3.3 Distributed Ledger Technologies (DLTs)
- **Blockchain**: blocks linked by hash pointers; linear chain; tamper detection by breaking the chain.
- **DAG (e.g., IOTA Tangle)**: directed acyclic graph of transactions; transactions validated by the nodes they reference; no miners/validators/middlemen.
- **Permissionless vs permissioned**: DIVA employs a **permissioned DAG-based ledger**, where only a restricted set of nodes is authorized to publish and read transactions.
- **IOTA**: DAG-based DLT for scalability with blockchain-level security; supports **zero-value transactions** that need no validation (no double-spend risk), greatly reducing information-sharing latency; can be deployed as private or public network; distinguishes clients (submit transactions) from nodes (verify and attach). Two special node types:
  - **Coordinator**: produces trusted milestones that confirm transactions (temporary, to be removed in future updates).
  - **Permanode**: keeps the full transaction history, useful when constrained devices prune the Tangle.

---

## 4. DIVA Architecture

### 4.1 System Components
| Component | Role |
|-----------|------|
| **Edge Nodes** | Small data centers at the network edge; interconnect via a **5G core network**; maintain the IOTA Tangle and an internal reputation table (fields: `vehicle_did`, `repScore`) for fast responses without querying the ledger; compute and update reputation scores via ledger transactions. |
| **Vehicles** | Uniquely identified by DIDs; equipped with OBUs; exchange CAM/DENM messages over IEEE 802.11p (V2V and V2I). |
| **Trusted Authority (TA)** | Identity Provider (e.g., Ministry of Transport, authorized inspection center) that registers DIDs on the ledger, periodically verifies vehicles' legal compliance (detecting physical tampering), and issues VCs. |
| **RSUs** | Integral, trusted infrastructure components that verify message reliability and provide trusted road data; **not all RSUs have sensors** — some act only as relay nodes. |

Key design points:
- Reputation is computed at **edge nodes**, offloading vehicles from computation overhead and delays.
- A vehicle can obtain the reputation of other participants **only if its own reputation exceeds a given threshold** (access control).
- Where RSU sensors are absent (relay-only RSUs), the system assumes **the majority of vehicles are benign**.

### 4.2 Communication Requirements
1. **Confidentiality** — protect information from unauthorized access/eavesdropping.
2. **Integrity** — detect message tampering or alteration.
3. **Authentication** — communication only with trusted, authenticated entities.
4. **Privacy** — no entity can infer the real identity of a vehicle user.
5. **Traceability** — messages traceable to their origin; accountability and legal action support; deterrent against attackers.
6. **Non-repudiation** — a vehicle cannot deny sending a message.

---

## 5. Threat Model

Assessed using the **Dolev–Yao model** (attacker can intercept any message, initiate communication with any entity, act as intended receiver). Considered attacks:

1. **Eavesdropping Attack** — unauthorized access to sensitive data (locations, personal details, messages).
2. **Replay Attack** — capturing and retransmitting previously recorded messages to mislead vehicles (traffic management, collision avoidance, cooperative driving).
3. **Forgery Attack** — impersonating legitimate users/entities by forging messages.
4. **Sybil Attack** — creating multiple fake identities to disrupt routing, manipulate traffic, or spread false information.

---

## 6. The DIVA Scheme

Operations: **registration**, **V2X communication**, and **reputation update**.

### 6.1 Registration
1. Vehicle generates a DID and submits it to the TA.
2. TA verifies the vehicle is compliant (not stolen/altered); records the DID and DID Document on the ledger.
3. TA issues a **VC** confirming registration and returns it to the vehicle.
4. Vehicle generates a **VP** attached to each communication as proof of identity/VC ownership.

DIDs and VCs are fully anonymous (no traceable link to the vehicle or user), preserving privacy.

### 6.2 V2X Communications
Two message categories (ETSI-compliant, IEEE 802.11p based):
- **CAM** (non-safety, periodic): position, speed, activated systems; exchanged periodically V2V and V2I; disseminated via **Single-Hop Broadcasting**.
- **DENM** (safety, exceptional situations): accidents, road closures, event detection; contains originator, situation description, detection time, event location; disseminated via **GeoBroadcasting** (hop-by-hop to destination area, then rebroadcast).

Each edge node can intercept transmitted messages within the VANET, verify the attached VP, evaluate the received information, and refresh the involved vehicles' reputations.

### 6.3 Reputation Computation

Reputation `r_DID ∈ [0, 1]`. Messages from sensor-equipped RSUs are treated as **inherently accurate** — a definitive reference point for verifying vehicle messages.

**Inputs/thresholds (Algorithm 1):**
- `τ_eventType` — message freshness threshold (depends on event type);
- `τ_sitQuality` — situation information-quality threshold (DENM information quality ranges 0–7; low-quality or excessively dated messages are excluded from reputation computation);
- `τ_cam` — time window for CAM coherency (set to 600 s in experiments; adjustable by edge-node area);
- `δ_eventType` — spatial threshold (distance) for event similarity;
- `ω_rSU`, `ω_msg` — weights for RSU coherence and message coherency; `defScore` — default score.

**Scoring steps (outlier detection):**
1. `rsuScore = ω_rSU × defScore`; `msgCohScore = ω_msg × defScore`.
2. Load previous reputation (or default if none).
3. If message is outside the edge node's managed area → skip.
4. If message is **incoherent with RSU data** → `repScore -= rsuScore`.
5. **CAM coherency (Algorithm 2):** loads the source's CAMs within the `τ_cam` window; computes the percentage of CAMs whose position is within `δ_eventType` (Euclidean distance) of the DENM event position. If `camCoh < 10` → penalize (`- msgCohScore`); if `10 ≤ camCoh ≤ 30` → neutral; if `> 30` → reward (`+ msgCohScore`).
6. **DENM similarity (Algorithm 3):** centroid-based detection of duplicate/similar events via a time centroid `τ_centroid` and a distance centroid `δ_centroid` (initialized with the first DENM, updated by averaging). Events of the same type whose detection time and position fall within `τ_eventType` / `δ_eventType` of the centroids are similar. If `len(similarEvents) > 2` → penalize (spam/duplicate); else → reward.
7. Update reputation of the source DID.

**Reputation update (Eq. 1):**
```
(r_DID)_t = α × (r_DID)_{t-1} + β × ((r_DID)_{t-1} + repScore)
```
- `(r_DID)_t` updated score, `(r_DID)_{t-1}` previous score; α and β shape relative influence and are constrained so **α + β = 1**.
- Reputation degradation depends on the type of misbehavior via the corresponding weight (e.g., `ω_msg` for message coherency); weights can be tuned per edge-node geographical area.

### 6.4 Reputation Storage
- Final scores are stored in the Tangle via **zero-value transactions** (no validation needed, minimal latency).
- Conflict-free assumption: edge nodes are positioned far enough apart that a vehicle cannot communicate with two nodes simultaneously; the time to traverse from one node's coverage to another exceeds the reputation-update time.
- To request reputation data, a vehicle must present its **VP** — only authorized users (with valid credentials) can access reputations, excluding contributions from malicious vehicles.

---

## 7. Implementation Details

- **Simulation environment:** 5 edge nodes connected via a 5G core network; **OMNeT++** with the **Artery** VANET framework and the **Simu5G** 5G library.
  - **Artery**: VANET simulator in OMNeT++; integrates **SUMO** for road-traffic modeling; used to collect ETSI-compliant V2V messages.
  - **Simu5G**: realistically models the 5G core network and Radio Access Network (RAN).
- **Dataset:** first ETSI-compliant V2V message dataset, publicly available.
  - Scenario from [11]: limited-sight (foggy) zone near the **Ingolstadt Nord highway junction, Germany**; a car performs an emergency stop → collision risk → DENMs broadcast; CAMs from the area also collected.
  - **DENM dataset** features: source, situation_eventType, detection_time, simulation_time, eventPos_lat/long/alt.
  - **CAM dataset** features: source, referencePositionLat/Long/Alt, simulationTime.
  - **Malicious instances:** a subset of sources is selected and noise injected into detection time, longitude, latitude, altitude — each value perturbed independently by sampling a normal distribution centered at zero with std dev matched to that column's own deviation (keeps values realistic; varying distortion per message makes detection harder).
- **DIVA algorithm:** Python script processing every DENM in the dataset; experiments run on a Linux VM with 16 CPUs and 32 GB RAM.
- **Code & data released:** [MMw-Unibo/DIVA](https://github.com/MMw-Unibo/DIVA) and [MMw-Unibo/ETSI-V2V-Dataset](https://github.com/MMw-Unibo/ETSI-V2V-Dataset) (Zenodo DOI 10.5281/zenodo.10522096).

---

## 8. Evaluation

### 8.1 Experimental Setup
- Threshold selection uses three aggregation metrics — **mode, median, mean** — over distances between the vehicle and the event position, computed from the benign dataset; `τ_cam = 600 s`.
- Performance: vary α/β (β incremented by 0.1 from 0 to 1, ten runs) and the percentage of malicious sources; a source whose reputation falls below threshold `τ_repScore` is flagged malicious. Reported metrics: TPR, TNR, FPR, FNR (20% malicious sources for threshold study).

### 8.2 Threshold Selection (Table 4, α = β = 0.5, 20% malicious)
| Threshold | Event type | TPR | TNR | FPR | FNR |
|-----------|-----------|-----|-----|-----|-----|
| **Mode** | dangerousEndOfQueue | 100 | 49.51 | 50.49 | 0 |
| Mode | collisionRisk | 87.23 | 92.80 | 7.20 | 12.77 |
| Mode | trafficCondition | 100 | 78.48 | 21.52 | 0 |
| **Mode Total** | | **99.93** | **78.14** | **21.86** | **0.07** |
| **Median** | dangerousEndOfQueue | 100 | 49.51 | 50.49 | 0 |
| Median | collisionRisk | 78.72 | 92.80 | 7.20 | 21.28 |
| Median | trafficCondition | 100 | 78.48 | 21.52 | 0 |
| **Median Total** | | **99.89** | **78.14** | **21.86** | **0.11** |
| **Mean** | dangerousEndOfQueue | 100 | 100 | 0 | 0 |
| Mean | collisionRisk | 61.70 | 100 | 0 | 38.30 |
| Mean | trafficCondition | 100 | 100 | 0 | 0 |
| **Mean Total** | | **99.80** | **100** | **0** | **0.20** |

- **Mode** yields the best TPR (99.93%) but acts conservatively, rejecting ~20% of benign messages.
- **Mean** perfectly identifies all non-malicious messages (TNR 100%, FPR 0%) but can leave some events (e.g., collisionRisk, TPR 61.70%) unprotected.
- "Total" is dominated by trafficCondition events, the most frequent DENM type.

### 8.3 DIVA Performance
- **Mean threshold (best):** for β ∈ [0.2, 0.6], incorrectly identified messages approach **zero**; for lower β, misclassification rises to ~20% (new score has minimal influence).
- **With 30% malicious sources:** ~**94%** accuracy for β > 0.3.
- **With 40% malicious sources:** ~**89%** accuracy for β > 0.3.
- **Mode threshold:** conservative; accurately detects malicious messages but discards ~**40%** of total messages (including benign), rising to ~50% with the highest malicious-source counts.
- Best overall discrimination is achieved for **β ∈ [0.4, 0.6]**; assigning malicious vehicles low reputations lets benign vehicles filter them from V2V communications.
- **Latency:** negligible (a few microseconds for 5 edge nodes) — zero-value Tangle transactions need no validation, so propagation latency equals that of a broadcast message; number of nodes doesn't affect this one-to-one metric. Real-world deployments (~a few hundred city-scale nodes) are deemed feasible.

---

## 9. Security Analysis

### 9.1 Communication Requirements
| Requirement | DIVA Solution |
|-------------|---------------|
| Confidentiality | Road info is public by nature; sensitive data (location, direction) encrypted end-to-end with the receiver's public key from the DID Document |
| Integrity | Messages signed with sender's private key (unforgeable signatures); reputation stored in the tamper-proof Tangle |
| Authentication | VPs prove a valid TA-issued VC and correct signing; reputation score gives historical quality awareness; messages below the reputation threshold are discarded |
| Privacy | DIDs act as pseudonyms; not mappable to user identity |
| Traceability | All information processed to compute reputations; participants with sub-threshold reputations are marked malicious and filtered from further updates |
| Non-repudiation | All communications signed; public keys in DID Documents on the Tangle; private key only held by the sender |

### 9.2 Resistance to Attacks
- **Eavesdropping:** Public info is harmless; sensitive data encrypted; reusing an intercepted VP to spread false info is prevented by digital signatures (attacker lacks the sender's private key).
- **Replay:** Edge node checks message timestamps and discards stale messages; the sender embeds a **unique random challenge** in its VP to prevent VP reuse with another verifier.
- **Forgery:** Requires the private key of an authorized vehicle or computing the secret key — computationally infeasible with **Elliptic Curve Cryptography (ECC)**.
- **Sybil:** One DID per vehicle; mass registration would require owning as many physical vehicles as identities (impractical); once reputations drop below threshold, all their messages are discarded, narrowing the attack window to the time needed to fall under the threshold.

---

## 10. Comparison with Related Work (Baselines)

### 10.1 Blockchain-based
- **BDRA (Li et al.):** double-layer blockchain (RSUs layer + per-area consortium blockchain) + DIDs for registration/authentication and reputation feedback. *Gap:* no verification of message truthfulness — exploitable if all vehicles are malicious.
- **BRS4VANET (Fernandes et al.):** consortium blockchain + smart contracts; RSUs compute reputations from vehicle feedback; pseudo-anonymous certificates revoked below threshold. *Gap:* certificate revocation is not specified.
- **BARS (Lu et al.):** blockchain-based anonymous reputation system; pseudonyms from public keys; direct + indirect interactions; reputation in a certificate; public key revoked at zero reputation. *Gap:* no message-truthfulness verification.
- **Yang et al.:** Bayesian-inference trust management; each vehicle rates each message, RSUs aggregate into blockchain blocks. *Gap:* uses vehicle identity numbers for identification, potentially compromising privacy.

### 10.2 DAG-based
- **Partitioned DAG (Li et al. 2022):** local-consistency ledger for vehicular reputation. *Gap:* needs extra data structures for intermediate reputation calculations (scalability overhead); neglects identification and communication concerns.
- **SIoV privacy mechanism (Li et al. 2022):** DAG-based reputation for mutual supervision. *Gap:* focuses on privacy, not on how reputation is estimated/updated.
- **Du et al.:** DAG-based information sharing with reputation-based rate control to resist chain attacks. *Gap:* no reputation-based reputation estimation described (rate control only).

### 10.3 DIVA's Novelty
First comprehensive **DID-based reputation system built on IOTA** with full **ETSI compliance**, message-truthfulness verification against RSU and CAM/DENM cross-checks, a publicly available ETSI-compliant dataset, and evaluation in 5G-enabled deployment scenarios — addressing the truthfulness and on-vehicle-computation gaps common to existing solutions.

---

## 11. Limitations

- **Conflict-free storage assumption:** relies on edge nodes being spatially separated so a vehicle never simultaneously updates with two nodes — reasonable at city scale but unverified at dense/deployment boundaries.
- **Permissioned ledger:** only a restricted node set may read/write, reducing decentralization compared with public ledgers.
- **Threshold trade-offs:** the mean threshold leaves the collisionRisk event largely unprotected (TPR 61.70%); the mode threshold discards ~40% of benign messages. Accuracy (~90% abstract / ~99% at specific thresholds) is threshold- and scenario-dependent.
- **RSU dependence:** without sensor-equipped RSUs, the system must assume most vehicles are benign (relay-only RSUs cannot anchor verification).
- **Evaluation scale:** latency measured only for 5 edge nodes; city-scale deployments are argued but not directly measured.
- **Reputation access gating:** a vehicle must itself hold a sufficient reputation to query others' reputations — a cold-start hurdle for new/low-reputation vehicles.
- **Anonymity vs traceability tension:** fully anonymous DIDs/VCs complicate real-world legal accountability despite on-ledger traceability of DIDs.

---

## 12. Conclusions

- DIVA successfully **identifies and mitigates malicious contributions** in VANETs, achieving an accuracy of around **99% when specific thresholds are employed** (≈90% across broader scenarios), while enhancing trustworthiness and security among previously unknown vehicles.
- The Tangle introduces minimal overhead, and reputation computation is fully offloaded to edge nodes.
- **Future work:** use DIVA as a **labeling algorithm** to produce a labeled dataset for training a machine-learning model that detects other misbehaving vehicles.

---

## 13. Key Contributions

1. **Novel DID-based reputation scheme** for VANETs, fully compliant with ETSI standards.
2. **First extensive ETSI-compliant V2V communication dataset**, openly released to the community.
3. **DIVA implementation** and extensive evaluation against the dataset and in 5G-enabled deployment scenarios, showcasing effectiveness in handling malicious contributions.

---

## 14. Available Resources

- **Dataset:** [GitHub - MMw-Unibo/ETSI-V2V-Dataset](https://github.com/MMw-Unibo/ETSI-V2V-Dataset)
- **Code:** [GitHub - MMw-Unibo/DIVA](https://github.com/MMw-Unibo/DIVA)
- **Zenodo:** [DIVA-ReputationAlgorithm (DOI:10.5281/zenodo.10522096)](http://dx.doi.org/10.5281/zenodo.10522096)

---

## 15. Glossary of Key Terms

| Abbreviation | Definition |
|--------------|------------|
| CAM | Cooperative Awareness Message (periodic, non-safety) |
| DAG | Directed Acyclic Graph |
| DENM | Decentralized Environmental Notification Message (safety) |
| DID | Decentralized Identifier |
| DLT | Distributed Ledger Technology |
| ECC | Elliptic Curve Cryptography |
| OBU | On Board Unit |
| RSU | Road Side Unit |
| TA | Trusted Authority |
| VANET | Vehicular Ad-hoc NETwork |
| VC | Verifiable Credential |
| VP | Verifiable Presentation |
| V2V / V2I / V2X | Vehicle-to-Vehicle / -Infrastructure / -Everything |

---

## 16. Summary for Seminar Presentation

### Core Innovation
DIVA combines **DIDs** for decentralized vehicle identification with the **IOTA Tangle** for tamper-proof reputation storage and **edge nodes** for offloaded computation — a lightweight, scalable, ETSI-compliant reputation system that verifies the *truthfulness of message content*, not just its origin.

### How It Works
1. Vehicles register DIDs with a Trusted Authority and receive VCs; VPs authenticate every message.
2. Edge nodes intercept CAMs/DENMs and cross-check them against RSU data, the source's CAM history (coherency %), and centroids of similar events (duplicate detection).
3. Reputation `r ∈ [0,1]` is updated via `α·old + β·(old + repScore)` and stored as zero-value IOTA transactions; vehicles below threshold are filtered out.

### Key Advantages
- **Decentralized** reputation storage on IOTA (DAG, zero-value transactions, minimal overhead).
- **Truthfulness-aware:** verifies content against RSU + CAM/DENM consistency, unlike most baselines.
- **Compliant:** follows ETSI standards (CAM/DENM, ITS-G5, GeoNetworking).
- **Efficient:** edge computing removes vehicle-side computation delays.
- **Transparent:** public dataset and open-source implementation.

### Results Highlights
- **Detection accuracy:** ~90% overall; ~99% (TPR) with mode threshold; zero FPR with mean threshold.
- **Robustness:** ~94% accuracy with 30% malicious, ~89% with 40% malicious sources.
- **Low overhead:** negligible latency (microseconds); latency independent of node count.

### Trade-offs / Open Issues
- Mean threshold misses some collisionRisk events; mode threshold discards many benign messages.
- Permissioned ledger, RSU-dependence, and conflict-free edge-node assumption are simplifying constraints.
- Future ML-based misbehavior detection using DIVA-labeled data.

---

*Report generated on: 2026-08-13*
*Source: Feraudo et al. (2024). DIVA: A DID-based reputation system for secure transmission in VANETs using IOTA. Computer Networks, 244, 110332.*
