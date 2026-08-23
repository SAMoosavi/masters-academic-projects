# Consolidated Report: Security in VANETs — Attack Classification, Defense Solutions, Open Problems, and Future Works

*Sources: P1 = Farsimadan et al. 2025 — "A Review on Security Challenges in V2X Communications Technology for VANETs" (IEEE Access); P2 = Rahmawati Agustina et al. 2025 — "A Systematic Literature Review on Privacy Preservation in VANETs: Trends, Challenges, and Future Directions" (IEEE Access); P3 = Syla, Lala & Biberaj 2024 — "Vanet Security and Privacy – an Overview" (EIRP Proceedings).*

---

## 1. Categorization of Attacks

Unified taxonomy across all three papers, grouped by the security property violated.

### 1.1 Availability

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| DoS / DDoS | Overwhelming the network or an RSU with traffic to block legitimate service | P1, P2, P3 | Availability |
| Flooding | Broadcast storm / message flooding exhausting bandwidth | P3 | Availability |
| Memory-based DoS | Exhausting OBU/RSU memory resources | P2 | Availability |
| Jamming | RF interference on wireless channels (RKE, DSRC, cellular) | P1 | Availability |
| Blackhole | Malicious node drops all routed packets | P1, P3 | Availability |
| Dropping | Selective/complete packet dropping | P3 | Availability |

### 1.2 Confidentiality

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| Eavesdropping | Passive interception of wireless traffic (DSRC, LTE, UWB, etc.) | P1, P2, P3 | Confidentiality |
| Traffic analysis | Inferring behavior/relationships from traffic patterns | P1 | Confidentiality |
| Side-channel | Leaking secrets via timing/power/EM of TPD or OBU | P2 | Confidentiality |
| Hardware tampering | Physically extracting keys/data from equipment | P1 | Confidentiality |

### 1.3 Integrity / Authentication

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| Spoofing / Forgery | Forging identities or messages | P1, P3 | Integrity/Auth |
| Impersonation / Masquerade | Pretending to be another vehicle/RSU | P1, P3 | Integrity/Auth |
| Message tampering / manipulation | Altering transmitted data | P1, P2 | Integrity |
| Replay | Reusing captured valid messages | P1, P2 | Integrity/Auth |
| Man-in-the-Middle (MitM) | Intercepting/relaying traffic between parties | P1, P3 | Confidentiality/Integrity |
| False / bogus information | Injecting fabricated messages (e.g., phantom traffic) | P1, P2, P3 | Integrity |
| Illusion attack | Sensor-level manipulation causing false self-perceptions | P1 | Integrity |
| GPS spoofing / hidden vehicle | Faking position or suppressing presence | P1 | Integrity |
| Session hijacking | Taking over an established session | P1 | Auth |
| Malicious code | Injecting malware into nodes | P1 | Integrity |
| Sybil | Forging multiple fake identities | P1, P2, P3 | Auth/Trust |

### 1.4 Privacy

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| Identity disclosure / revealing | Exposing real vehicle identity | P1, P2 | Privacy |
| Tracking / location tracking | Tracing vehicle movement via pseudonyms/signals | P1, P2 | Privacy |
| Linkability | Linking multiple pseudonyms/messages to one vehicle | P2 | Privacy |
| Profiling | Building behavior/identity profiles over time | P3 | Privacy |
| Unauthorized / illegal access | Bypassing access control (incl. revocation gap) | P1, P2 | Privacy/Access control |

### 1.5 Trust / Misbehavior

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| Selfish behavior (message spoofing) | Dropping/altering relay duties for self-interest | P1 | Trust |
| Repudiation | Denying sent/received messages | P1 | Non-repudiation |
| Collusion | Coordinated cheating between nodes | P2 | Trust |
| Blackhole (as misbehavior) | Dropping packets to disrupt routing | P1, P3 | Trust/Availability |

### 1.6 Routing / Network-layer

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| Packet manipulation | Modifying packets in multi-hop (DSRC/WAVE) forwarding | P1 | Routing integrity |
| SDN controller attacks | Compromising SDN controller in SDVN | P2 | Network control |
| Routing attacks (AODV/GPSR) | Exploiting routing protocols (e.g., blackhole, dropping, flooding) | P3 | Routing |
| Multi-hop rebroadcast attacks | Exploiting insecure rebroadcast of safety messages | P1 | Routing/Integrity |

### 1.7 Physical / Hardware / Infrastructure & Communication Technologies

| Attack | Description | Papers | Property broken |
|---|---|---|---|
| Hardware tampering | Physical compromise of OBU/RSU | P1 | All |
| RKE attacks (replay, Hitag2 cloning, jamming, MitM, brute force) | Attacking remote keyless entry | P1 | Auth/Confidentiality |
| Jamming (physical) | RF interference | P1 | Availability |
| Femto/microcell attacks | Compromising small cells in LTE/C-V2X/5G | P1 | Integrity/Privacy |
| WSA attacks | Attacking WAVE Service Advertisements | P1 | Integrity/Availability |
| Evil Twin | Rogue Wi-Fi access point impersonation | P1 | Auth/Confidentiality |
| ZigBee config disclosure | Exposing ZigBee network configuration | P1 | Confidentiality |
| SPoF / compromised TA | Single point of failure if trust authority is compromised | P2 | Trust/Accountability |
| Privacy-authority problem | Central authority can resolve (trace) identities | P2 | Privacy |
| Quantum-computing threats | Future attacks on classical crypto (ECC) | P2 | Integrity/Auth |

---

## 2. Categorization of Defense Solutions

### 2.1 Cryptography & PKI
- **Defends against:** spoofing, forgery, MitM, replay, repudiation, message tampering, unauthorized access.
- **Notable schemes:** digital signatures + asymmetric crypto/certificates (P1, P3); TESLA++ (P1); AES encryption (P3); digital signatures + SHA hashing (P3); PKI + timestamping + secure logging for non-repudiation (P3); secure key exchange and dynamic keys (P3); identity-based signatures/crypto — IBC called "most viable" (P1, P3); threshold signature & threshold authentication (P1); RSS-based key generation (P1); CPPA schemes in P2 — certificateless, identity-based, ECC, lattice-based post-quantum, aggregate signatures, batch verification, signcryption, Schnorr multisig, and multifactor (password/PUF/biometric) auth; hash-based pseudonym issuance (P2, 73% of studies).
- **Strengths/limitations:** strong baseline integrity and authentication; crypto does not stop internal/behavioral attacks (P1); key/CA management and revocation are the weak points (P2, P3); quantum threat to ECC motivates lattice-based CPPA (P2).

### 2.2 Privacy-preserving mechanisms (pseudonyms, mix-zones, anonymity)
- **Defends against:** tracking, linkability, identity disclosure, profiling.
- **Notable schemes:** pseudonyms across all three papers; full **pseudonym life cycle** — issuance/usage/changing/resolution/revocation (P2, only ~12% implement all five stages); changing strategies per ETSI TR 103 415 — fixed parameter, randomness, silent period, vehicle-centric, density-based, mix zone (P2); mix-zones (P1, P2, P3); **batch pseudonym revocation via hash seeds** (P2); dynamic-input pseudonym generation (future, P2).
- **Strengths/limitations:** effective against tracking; hard to change with predictable/fixed inputs or intervals (P2); conditional revocation reintroduces traceability tension (P2, P3); privacy/efficiency tradeoff unresolved (all papers).

### 2.3 Authentication schemes (incl. conditional privacy)
- **Defends against:** Sybil, spoofing, impersonation, identity disclosure.
- **Notable schemes:** pseudonym-based / privacy-preserving authentication (P2, P3); conditional privacy (authority-traceable revocation) in WAVE (P3); zero-knowledge proofs (P3); batch authentication in 5G (P1); geographic-proximity Sybil detection (P1); certificate revocation (P3); identity-based threshold authentication (P1).
- **Strengths/limitations:** conditional privacy reconciles accountability and anonymity (P3); revocation implementation and the privacy-authority (resolution) problem remain hard (P2, P3).

### 2.4 Trust & reputation management
- **Defends against:** selfish/malicious behavior, blackhole, false/bogus information, repudiation.
- **Notable schemes:** weighted-sum trust (P1); Q-learning-based trust (P1); ant-colony secure routing (P1); fuzzy-logic blackhole detection (P1); incentive/payment–punishment mechanisms (P1); privacy-preserving trust protocols PPTM, BTMPP, PPRM, PPRU (P1); general trust management (P3).
- **Strengths/limitations:** good against internal misbehavior where crypto fails (P1); needs realistic evaluation data, which is scarce (P1).

### 2.5 AI/ML & IDS
- **Defends against:** DoS/jamming, intrusions, spoofing, CAN-bus attacks, misbehavior.
- **Notable schemes:** misbehavior/IDS detection (P1); jamming detection (P1); CAN-bus attack detection (P1); GAN-based attack-signal generation (P1); RL physical-layer authentication (P1); driver ID verification (P1); federated learning (P1); rate limiting + anomaly detection (P3); AI/ML anomaly detection flagged as future direction (P3).
- **Strengths/limitations:** adaptable to novel attacks (P1, P3); federated-learning approaches are vulnerable to data poisoning/adversarial attacks (P1).

### 2.6 Blockchain
- **Defends against:** key-management SPoF, revocation gaps, tampering, trust deficit.
- **Notable schemes:** key management and trust management (P1); position-certificate V2V + FL integration (P1); decentralization, smart-contract revocation (P2, 13% of studies, roles KR1–KR14); recommended adoption (P3).
- **Strengths/limitations:** removes single points of trust (P2); scalability/time-complexity and multi-tenancy concerns unresolved (P1, P2).

### 2.7 Emerging-tech (cloud, fog, 5G/6G, edge, SDVN)
- **Defends against:** infrastructure/SPoF attacks, scalability limits, inefficient authentication.
- **Notable schemes:** 5G/6G AUSF/SEAF/ARPF, network slicing, SDN/NFV, batch authentication (P1); CVGuard (DDoS), FPAP, SUC for RKE, DSRC+VLC hybrid, Het-Net, time-hopping UWB (P1); cloud (5.3%), fog (4.4%), hybrid, IoT and SDVN models (P2); cloud + edge computing (P3); TA splitting into TRA + KGC to remove SPoF (P2).
- **Strengths/limitations:** promising for scalability (P1, P2); 5G/6G multi-tenancy security and blockchain integration under-solved (P1); fog/cloud/hybrid limits identified (P2).

### 2.8 Network-level
- **Defends against:** DoS/flooding, routing attacks, infrastructure failure.
- **Notable schemes:** redundancy and load balancing (P3); IDS and health checks (P3); rate limiting + anomaly detection (P3); network segmentation (P3); redundant paths (P3); hierarchical/clustering routing (P3); CA + signatures (P3).
- **Strengths/limitations:** pragmatic resilience (P3); overview-level, not quantitatively evaluated (P3).

### 2.9 Hardware-based (supporting layer)
- **Defends against:** side-channel, key extraction, device compromise.
- **Notable schemes:** TPD, PUFs, biometrics as multifactor anchors (P2).
- **Strengths/limitations:** strengthens key custody; adds cost and management burden (P2).

---

## 3. Cross-paper Analysis — Agreements, Unique Contributions, Gaps

### 3.1 What all three agree on
- **Core attack set:** eavesdropping, spoofing/forgery, DoS, Sybil, MitM, tracking/privacy violation appear in all three.
- **Pseudonym + mix-zone privacy:** all three treat pseudonym changing and mix-zones as the central vehicle-privacy defense.
- **Security–privacy (and privacy–efficiency) tradeoff:** uniformly flagged as the central unresolved tension.
- **PKI/crypto authentication baseline:** all three assume certificate/signature-based authentication as the foundation.
- **Conditional privacy / revocation tension:** traceability for accountability vs. anonymity is recognized in all three.
- **Blockchain and cloud/fog as emerging directions** are acknowledged in all three.

### 3.2 Unique contributions per paper
- **P1 (Farsimadan):** only paper detailing **technology-specific attacks** (RKE, DSRC/WAVE WSA, LTE/C-V2X/5G femtocell, ZigBee, Wi-Fi/WiMAX Evil Twin, UWB) and a deep **ML/DL defense catalog** (GAN, RL, FL, driver-ID verification); only one to split attacks into **selfish vs. malicious behavioral** classes and to cover the **illusion attack, GPS spoofing, and hidden-vehicle** attacks; most explicit on **5G/6G architectures** and on **evaluation-realism/dataset scarcity**.
- **P2 (Rahmawati):** only paper providing **SLR statistics** (Kitchenham protocol; 594→113 primary studies 2019–2024; 71% standard model; 73% hash-based issuance; 37% OBU-generated pseudonyms; ~12% full 5-stage life cycle; tech mapping: blockchain 13%, cloud 5.3%, fog 4.4%); only one to formalize the **pseudonym life cycle**, ETSI TR 103 415 changing strategies, **CPPA taxonomy incl. post-quantum lattice**, batch revocation via hash seeds, **TA splitting (TRA+KGC)**, and to surface **quantum threats, side-channel, collusion, SDN-controller attacks, the privacy-authority problem, and the revocation gap**.
- **P3 (Syla):** only overview with **dedicated attack sections** and the **network-level defense catalog** (redundancy, segmentation, load balancing, health checks, rate limiting); only one to champion **IBC as "most viable"**, emphasize **non-repudiation via PKI + timestamping + secure logging**, use **zero-knowledge proofs**, and to name **routing-protocol attacks (AODV/GPSR)** and **privacy-regulation compliance**.

### 3.3 Gaps (appearing in only one paper)
- **Only P1:** illusion attack, GPS spoofing, hidden-vehicle attack, RKE attacks (Hitag2 cloning), femtocell attacks, Evil Twin, WSA attacks, ZigBee config disclosure, UWB eavesdropping, WSA/packet manipulation, hardware tampering, session hijacking, malicious code, repudiation, selfish behavior, DSRC+VLC hybrid, RSS-based key generation, threshold auth, incentive mechanisms.
- **Only P2:** linkability, side-channel, collusion, memory-based DoS, SDN-controller attacks, quantum-computing threats, SPoF/compromised TA, privacy-authority problem, revocation gap, multifactor (password/PUF/biometric) CPPA, lattice post-quantum schemes, batch hash-seed revocation, TA splitting, silent-period/density-based changing strategies.
- **Only P3:** routing-protocol attacks (AODV/GPSR) as a named class, flooding and dropping as explicit attacks, network segmentation/load balancing/redundant paths, secure logging for non-repudiation, IBC preference, ZKP, privacy-regulation compliance.

---

## 4. Open Problems (Consolidated & Deduplicated)

**Privacy vs. security/efficiency tradeoff**
- Security–privacy tradeoff and privacy–efficiency tradeoff (P1, P2, P3); pseudonym predictability from fixed inputs and predictable change intervals (P2); no single best changing strategy identified (P2); privacy-authority (resolution) problem — authority must trace identities for accountability (P2).

**RSU/TA trust & SPoF**
- RSU dependence and trust in infrastructure (P1); SPoF and compromised-TA risk (P2); privacy-authority concentration (P2).

**Revocation & accountability**
- Revocation gap between pseudonym change and revocation enforcement (P2); certificate-revocation implementation difficulty (P3); privacy vs. accountability (P3); crypto cannot stop internal attacks (P1).

**Scalability & performance**
- V2X deployment cost (P1); multi-tenancy in 5G/6G and blockchain scalability/time complexity (P1, P2); scalability in dense urban traffic (P3); resource-constrained OBU/RSU devices (P3); complete life cycle without performance loss (P2).

**Evaluation realism & datasets**
- Inadequate V2X data for security reporting and unrealistic evaluations with non-public datasets (P1); informal (non-formal) privacy-analysis dominance in the literature (P2).

**ML robustness**
- Federated-learning robustness to data poisoning and adversarial examples (P1).

**Wireless/physical layer**
- Persistent wireless vulnerabilities: eavesdropping, MitM, Evil Twin (P1).

**Standardization & governance**
- 5G authentication efficiency (P1); privacy-regulation compliance (P3); routing-protocol (AODV/GPSR) vulnerabilities (P3); high mobility and dynamic topology (P3); lack of unified security frameworks across ITS layers (P3).

---

## 5. Future Works (Consolidated & Deduplicated)

**Hybrid architectures**
- Combine DSRC+VLC, Het-Net (P1); hybrid blockchain/cloud/fog/edge architectures (P2, P3); 5G/6G with SDN/NFV and network slicing (P1); adaptive 5G/6G security mechanisms (P1).

**Post-quantum & quantum-resilience**
- Quantum-resilient pseudonyms and lattice-based post-quantum CPPA (P2).

**AI-driven defense**
- Robust privacy-preserving federated learning against poisoning/adversarial input (P1); AI/ML anomaly detection (P3); defense against evolving spoofing/MitM/replay/DoS variants (P1).

**Open datasets & realistic evaluation**
- Open-source, realistic V2X datasets (P1); traffic-flow physics consistency checks to validate message plausibility (P1); formal privacy analysis with tools such as ProVerif (P2).

**Multi-hop & wireless security**
- Secure multi-hop rebroadcast (P1); robust wireless mechanisms against eavesdropping/MitM/Evil Twin (P1); robust solutions for high mobility (P3).

**Cost & performance**
- V2X cost reduction (P1); complete 5-stage pseudonym life cycle without performance loss (P2).

**Pseudonym mechanisms**
- Dynamic-input pseudonym generation and adaptable changing strategies (P2); reduce RSU/infrastructure dependence (P1).

**Standardization & collaboration**
- Unified security frameworks across ITS layers (P3); industry/research/policy collaboration and interdisciplinary approaches (P3).

---

## 6. Quick Reference Table

| Attack | Best defense solution(s) | Papers |
|---|---|---|
| DoS / DDoS / flooding | Rate limiting + anomaly detection, IDS, network redundancy/segmentation, CVGuard, SDN/NFV | P1, P3 |
| Jamming | Jamming-detection ML, frequency-hopping (time-hopping UWB), DSRC+VLC hybrid, Het-Net | P1 |
| Eavesdropping / traffic analysis | Encryption (AES), digital signatures, RSS-based key generation, time-hopping UWB | P1, P2, P3 |
| Spoofing / impersonation / masquerade | PKI certificates, digital signatures, IBC, batch verification, intrusion detection | P1, P3 |
| MitM | Authentication + certs, secure key exchange, encryption, IBC | P1, P3 |
| Replay | Timestamping, TESLA++, nonce-based auth, batch verification | P1, P2, P3 |
| Message tampering / manipulation | Digital signatures + SHA, hash-based integrity, misbehavior detection | P1, P2 |
| False / bogus information / illusion attack | Traffic-flow physics consistency checks, trust/reputation scoring, fuzzy blackhole detection | P1, P3 |
| Sybil | Batch verification, geographic-proximity Sybil detection, pseudonym issuance controls, threshold auth | P1, P2, P3 |
| Tracking / linkability / identity disclosure | Pseudonym life cycle, mix-zones, silent-period/density-based changing, conditional privacy | P1, P2, P3 |
| Unauthorized / illegal access | Certificate-based access control, multifactor (password/PUF/biometric), TPD | P1, P2 |
| Selfish behavior / repudiation | Incentive/payment–punishment, trust & reputation mgmt, PKI + timestamping + secure logging (non-repudiation) | P1, P3 |
| Blackhole / dropping / routing attacks | Ant-colony routing, trust management, hierarchical/clustering routing, IDS | P1, P3 |
| Hardware tampering / side-channel | TPD, PUFs, biometrics, physical-hardening | P1, P2 |
| SPoF / compromised TA | TA splitting (TRA + KGC), blockchain-based key/trust mgmt, decentralization | P2 |
| Revocation gap | Batch pseudonym revocation via hash seeds, blockchain smart-contract revocation, certificate revocation | P1, P2, P3 |
| SDN controller attacks | SDN/NFV security, network segmentation, redundancy | P2, P1 |
| RKE attacks (replay/cloning/jamming) | SUC, secure key exchange, dynamic keys | P1 |
| Evil Twin / rogue Wi-Fi | Robust wireless mechanisms, authentication of APs, encryption | P1 |
| Quantum-computing threats | Lattice-based post-quantum CPPA, quantum-resilient pseudonyms | P2 |
| Privacy-authority problem | Conditional privacy schemes, TA splitting, formal privacy analysis (ProVerif) | P2 |
| Internal/malicious nodes | Misbehavior/IDS detection, ML/DL (GAN, RL), federated learning, trust management | P1 |
