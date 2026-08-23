# Paper Summary Report

## A Review on Security Challenges in V2X Communications Technology for VANETs

**Authors:** Eslam Farsimadan, Leila Moradi, Francesco Palmieri (Senior Member, IEEE)
**Affiliation:** Department of Computer Science, University of Salerno, 84084 Fisciano, Italy
**Venue:** IEEE Access, Volume 13, pp. 31069–31094, 2025
**DOI:** 10.1109/ACCESS.2025.3541035
**Dates:** Received January 17, 2025; accepted February 6, 2025; published February 11, 2025; current version February 20, 2025
**License:** CC BY 4.0 (open access)
**Funding:** Project Security and Rights in the CyberSpace (SERICS), PNRR MUR Program (EU-NGEU), Grant PE00000014
**Associate Editor:** Barbara Masini

---

## 1. Abstract

This survey provides a systematic overview of security issues and countermeasures in V2X (Vehicle-to-Everything) communications for VANETs (Vehicular Ad-hoc Networks). It reviews studies from the last ten years, covering V2X architecture, main characteristics, communication models, applications, security challenges and requirements, an attack classification, and existing countermeasures (crypto/blockchain, machine learning, behavior/trust, identity, and 5G/6G-based solutions). The paper also lists open issues and future research directions, aiming to give scholars a clear landscape and roadmap of the V2X security academic frontier.

**Index Terms:** VANET, V2X communications, security, privacy, cyberattack, security solutions, cryptography, machine learning.

---

## 2. Introduction & Motivation

### 2.1 Background
- VANETs connect vehicles and road infrastructures to enhance safety and provide driving-related and entertainment services.
- Vehicles are equipped with wireless sensors, location equipment, cruise control, navigation facilities, related maps, and On-Board Units (OBUs).
- Road-Side Units (RSUs) exchange information with OBUs; a trusted authority provides centralized network management and supervision.
- VTL (Virtual Traffic Light) techniques, advanced navigation support, and fleet management are key traffic-control use cases built on V2X communication models: V2V, V2I, V2N, and V2P.

### 2.2 Why V2X Security Matters
- **1.19 million people die yearly** in vehicle crashes (WHO data), the leading cause of death for children and young adults.
- More than 50% of fatalities involve vulnerable road users (pedestrians, cyclists, motorcyclists).
- The UN Decade of Action for Road Safety 2021–2030 targets a ≥50% reduction in road traffic deaths by 2030.
- V2X is expected to significantly reduce roadway crashes through cooperation among infrastructure, vehicles, and pedestrians, but mass data collection/communication introduces serious **privacy and security** concerns; attackers can take control of vehicles, causing hazardous and life-threatening situations.

### 2.3 Four Key V2X Security Concerns

| Concern | Description |
|---------|-------------|
| **Unpredictable Threats & Attack Scenarios** | Remote communication, vehicle databases, roadside infrastructure, and vehicle parts can all be infiltrated; new attack techniques constantly emerge, so manufacturers cannot predict where hackers will strike next |
| **Limited Connectivity** | Most vehicles cannot receive timely over-the-air (OTA) security updates; disconnected cars remain vulnerable due to incomplete or missing updates |
| **Limited Computational Performance** | Vehicle computing power is far below that of modern computers; long vehicle lifespans mean equipment is often un-updatable, so heavy security solutions cannot run onboard |
| **Significant Risks to Driver/Passenger Safety** | Even a small number of compromised sensors or illegitimate messages can cause life-threatening vehicle faults |

### 2.4 Existing Surveys and Their Limitations
The paper positions itself against prior surveys ([11]–[27]) and identifies the gap it fills:

| Survey | Focus | Limitation |
|--------|-------|------------|
| [11] | V2X security in cellular networks & V2X authentication | No recent ML-based developments |
| [12], [13] | V2X security vulnerabilities, risks, issues | Outdated mitigation strategies; no ML, 5G/6G, or blockchain |
| [14], [15] | Intrusion & misbehavior detection in vehicular networks | Narrow scope |
| [16] | 5G security characteristics/standards for V2X | No recent ML-based solutions |
| [17] | Anonymous authentication & trust management | Narrow scope |
| [18] | V2X vulnerabilities and traditional security mechanisms | General |
| [19] | State-of-the-art V2X security mechanisms | No 5G-V2X or ML-based defense; no safety-critical attack solutions |
| [20] | V2X characteristics & standardization methods | Ignores RKE (remote keyless entry) and database security |
| [21] | Trust management focus | Does not cover other considerations |
| [22] | EU pilot V2X initiatives, ETSI ITS standards | No crypto/ML-based solutions |
| [23] | Recent V2X security enhancements | No infrastructure/clustering security; no 5G solutions |
| [24] | IoV privacy/security, 6G enablers | Focuses on 6G; lacks other aspects/countermeasures |
| [25] | ML approaches for 6G vehicular networks | No cryptography discussion |
| [26] | Systematic review of vehicular connectivity & V2X | No crypto/ML solutions; no attack classification |
| [27] | History of IoV, V2X threats, security technologies | Missing RKE/database challenges; no attack classification |

### 2.5 Main Contributions
1. Comprehensive, well-organized overview of V2X applications, issues, and requirements.
2. Investigation and classification of V2X communication attacks/vulnerabilities and their countermeasures.
3. Evaluation of state-of-the-art defensive methodologies, including effectiveness and limitations.
4. Identification of future research directions, particularly regarding security.

---

## 3. V2X Architecture & Characteristics

### 3.1 Communication Models (V2X)

| Type | Description |
|------|-------------|
| **V2V** (Vehicle-to-Vehicle) | Direct communication between vehicles |
| **V2I** (Vehicle-to-Infrastructure) | Communication between vehicles and road infrastructure (RSUs) |
| **V2N** (Vehicle-to-Network) | Communication between vehicles and network/cloud |
| **V2P** (Vehicle-to-Pedestrian) | Communication between vehicles and pedestrians (vulnerable road users) |

### 3.2 Network Infrastructure Components
The overall network is formed by two sub-networks:
- **Intra-vehicle sub-network:** sensors inside the vehicle connected via Ethernet, ZigBee, WiFi, or Bluetooth.
- **Inter-vehicle sub-network:** vehicle-to-surrounding-device communication, comprising four units:
  - **OBUs** — on-board data processing and interaction with surrounding units
  - **RSUs** — roadside infrastructure units holding local topology data to serve road users
  - **Road Users** — motorcyclists, bikers, pedestrians, skaters
  - **Central/Cloud Server** — controls all road users, traffic, and roadways

### 3.3 Key V2X Characteristics
- High mobility and dynamic network topology (dense urban vehicle populations necessitate tiny cells)
- Variable network density; event-driven or periodic exchange of tiny messages
- No power limits; critical nature and extensive scalability of the network
- Extensive computational processing; vehicle driver protection requirements
- Extremely low end-to-end latency and high reliability for safety applications (e.g., cooperative autonomous driving)
- Deployment scenarios and traffic characteristics differ from other DSRC/cellular applications (short connection times, frequent vehicle arrival/departure)

### 3.4 V2X Applications
Applications are divided into four categories (Table 2 in the paper): **(i)** safety-support, **(ii)** traffic management and road efficiency, **(iii)** information/comfort/infotainment, and **(iv)** autonomous driving and intelligent traffic systems.

| Category | Examples |
|----------|----------|
| **Safety-support** | Forward collision warning, do-not-pass warning, queue warning, curve speed warning, protecting vulnerable road users, real-time situational awareness in lane change/merging |
| **Traffic management / road efficiency** | Optimal speed advice, speed harmonization, traffic flow control |
| **Information / infotainment** | Parking discovery, passenger entertainment, multimedia content |
| **Autonomous driving / ITS** | Cooperative autonomous driving, platooning |

---

## 4. Security Challenges in V2X

### 4.1 Infrastructure Security Challenges
OBUs interact with RSUs (V2I); RSUs authenticate OBUs and grant Internet access. Both OBUs and RSUs are subject to malicious activity.

| Attack | Description | Countermeasures |
|--------|-------------|-----------------|
| **DDoS** | Attacker floods RSU with redundant information, preventing it from functioning | CVGuard security structure [35]; SDN-based DDoS detection [36] |
| **Malware** | RSU system is infected | CVGuard detection/protection |
| **Impersonation** | Attacker masquerades as OBUs or RSUs | Authentication: Fast Pre-distribution Authentication Protocol (FPAP) [37], lightweight group-key V2I authentication (LVAP) [34], dynamic split private key between vehicle and assistance device [38] |
| **Eavesdropping** | Attacker obtains access to private information | Authentication mechanisms; network slicing and network isolation (SDN separates data/control planes) [39]–[41] |

### 4.2 Database Security Challenges
Connected vehicles transmit data to cloud-based and on-board databases. Big data in VANETs is grouped into four classes [42]: GPS data, autonomous driving data, vehicle mobile network data, and sensing data; or into three categories [43]: vehicle-centric, user-centric (gender, age, history, education), and location-centric (routes, traffic).

| Threat | Target | Countermeasure |
|--------|--------|----------------|
| DoS, replay, hacking, session key disclosure, masquerade [44] | Cloud-based vehicle databases | Vehicle authentication before sender/receiver communication (thwarts impersonation, replay, manipulation, masquerading — but not tested vs. session-key disclosure/DoS) [44] |
| Eavesdropping, tampering | On-board / vehicular cloud databases | Hierarchical database cryptographic system [43] |
| Data theft after system infiltration | Cloud-stored vehicle data | Anonymous/cloud-storage authentication allowing data removal if the vehicular system is infiltrated [45] |

### 4.3 Remote Communication Technology Security

#### Remote Keyless Entry (RKE) Systems
- **Overview:** rolling-code signals prevent replay attacks [46]; however, limited cryptographic keys are used (e.g., Volkswagen Group [47]).
- **Vulnerabilities:** rolling-code techniques vulnerable to eavesdropping and RKE cloning; outdated methods/equipment, implementation errors, and poor cryptographic algorithms; the **Hitag2** cipher used in some RKE systems is broken [49].
- **Attacks:** jamming, man-in-the-middle, brute force, replay [48].
- **Countermeasures:** Secret Unknown Cipher (SUC) technique for clone-resistant controllers [50]; more robust, jamming-resistant receivers [46]; safe crypto and secure key distribution [47]; security-conscious symmetric-key RKE protocol resisting replay/MiM/brute force [51]; gradual transition to AES-based methods [49].

#### DSRC / WAVE (Dedicated Short-Range Communications / Wireless Access in Vehicular Environments)
- **Overview:** IEEE 802.11p-based; guarantees high-priority communication delays under tens of milliseconds [53].
- **Vulnerabilities:** attacker can acquire the broadcast timetable, causing unnoticed communication conflicts; WAVE Service Advertisement (WSA) is susceptible to availability and security attacks [54]; DSRC bandwidth insufficient for future V2X.
- **Countermeasures:** hybrid IEEE 802.11p + Visible Light Communication (VLC) platform [55] (still vulnerable to replay/packet manipulation); hybrid authentication for RSU–OBU over 802.11p [56]; WSA solutions [54]; Heterogeneous Network (Het-Net) combining DSRC + LTE + Wi-Fi [52].

#### Cellular Networks (LTE-V, C-V2X, 5G-NR)
- **Vulnerabilities:** limited DSRC bandwidth motivates LTE-V, C-V2X, and 5G-NR [11]; LTE signaling messages lack cryptographic safeguards [59]; comprehensive LTE attacks include eavesdropping, jamming, and attacks from exploited femtocells/unlicensed base stations [57]; encoding/network-authentication weaknesses [60]; C-V2X challenges analyzed in [61].
- **Countermeasures:** mitigations/preventive actions for LTE [57]; SDN and NFV to enhance LTE security [62]; lightweight key management (ARKS-AKA) for node authentication [63]; further countermeasures in [11], [60], [61].

#### ZigBee
- **Overview:** short-range, low-data-rate, low-power standard in ISM bands (used e.g. in Forward Collision Warning Systems); Bluetooth is also used to link smartphones to telematics/infotainment but is complex, fragmented, and under-examined [64]–[66].
- **Vulnerabilities:** three practical attacks — attackers obtain in-range device configuration info; several systems remain unencrypted; attackers retransfer traffic for replay attacks [67].
- **Countermeasures:** intrusion detection solutions; establishing network keys before installation; time-stamping in cryptographic algorithms; rotating device IDs instead of static IDs; avoid pre-loaded/factory-generated keys; provide per-device network security keys [67], [68].

#### Wi-Fi and WiMAX
- **Vulnerabilities:** Tesla Model S hacked remotely because the Wi-Fi SSID passcode was stored in plain text — enabling hotspot impersonation and traffic diversion [69]; IEEE 802.11 interleaved convolutional coding is jamming-susceptible [70]; Evil Twin attacks link users unknowingly to rogue access points [71]; DoS attacks against the WPA 4-way handshake [72]; WiMAX faces MiM, RF interference, RF jamming, replay, eavesdropping, and DoS [73].
- **Countermeasures:** random encrypted combinations against Wi-Fi jamming [70]; detection via a different gateway than the actual access point [71]; WPA DoS solutions [72]; NIST WiMAX countermeasures across client device security, confidentiality/integrity protection, authentication/authorization, and upgrades/updates/patches [73].

#### Ultra WideBand (UWB)
- **Overview:** transfers significant data at different rates on a band >7 GHz wide with low power consumption; recommended for PEPS replay prevention, autonomous-vehicle off-road localization, EV localization, and outdoor localization [74]–[76].
- **Vulnerabilities:** low-power UWB platforms cannot sustain encryption overhead and are vulnerable to eavesdropping [77].
- **Countermeasures:** time-hopping (non-cryptographic) to secure UWB transmitters/receivers against eavesdropping [77].

---

## 5. Security Requirements for V2X
Because wireless broadcast is intrinsically susceptible to replay, forgery, and eavesdropping, V2X must satisfy: availability, confidentiality, authentication, integrity, authorization, and privacy.

| Requirement | Description |
|-------------|-------------|
| **Availability** | Communications delivered to intended receivers in a well-timed way; requires lightweight, low-cost cryptography; authorized objects must access the system at any time/location, including during DoS attacks |
| **Data Confidentiality** | Data between V2X units must be encrypted/safeguarded; since V2X data is largely public, confidentiality may not be the top priority except for occupant privacy |
| **Authentication** | Distinguishes valid objects from malicious entities; subdivided into **message authentication** (packet origin/integrity) and **user/source authentication** (entity validity) |
| **Data Integrity** | Data validated timely to detect manipulation, alteration, or deletion during transmission |
| **Authorization & Access Control** | Legal V2X elements access appropriate services per predefined policies/rules |
| **Privacy, Anonymity & Untraceability** | Anonymity is a subclass of privacy; must satisfy **untraceability** (a vehicle's activities cannot be tracked) and **unlinkability** (an unauthorized party cannot associate a vehicle with its driver/owner); RSUs can infringe location privacy during authentication |
| **Trust** | An entity's confidence in another network component; trust computation cooperates with availability and privacy to enable protected data transmission and assure truthfulness between vehicles |

---

## 6. Classification of V2X Security Attacks
The paper classifies attacks into **five categories** (following [20], [81]): attacks on infrastructure, attacks on software/hardware, attacks on privacy, data trust attacks, and attacks based on behavioral patterns. Two illustrative examples: hacking an RSU to force hard braking events, and sending a compromised Basic Safety Message (BSM) to cause an accident.

### 6.1 Attacks on Infrastructure

| Attack | Description | Countermeasure |
|--------|-------------|----------------|
| **Session Hijacking** | Attacker takes control of a session after authentication | Public key infrastructure; RSU checks vehicle identity with trust authority before sharing keys |
| **DDoS** | Primary coordinator controls many bots flooding the system with hostile packets | Strong authentication and node-level digital signatures |
| **Unauthorized Access** | Malicious entities access services without permissions, stealing private info (identity, position, plate) | Confidentiality via pseudonyms — each vehicle holds multiple key pairs, refreshed through RSUs [82] |
| **Hardware Tampering** | Malicious automotive-manufacturer insiders manipulate hardware during maintenance | Trusted Platform Module (TPM) [83] |
| **Masquerade** | Attacker uses an authorized identity to build blackholes/fake data packets or acts as a fake emergency vehicle | Non-repudiation mechanisms |

### 6.2 Attacks on Software and Hardware

| Attack | Description | Countermeasure |
|--------|-------------|----------------|
| **DoS** | Disrupts availability; e.g., flooding the control channel so RSUs/OBUs cannot process data | Digital signatures and authentication (e.g., **Tesla++** with symmetric encryption and delayed key disclosure); short-lifetime public/private key pairs with hash functions (TEAM) [85] |
| **Spoofing & Forgery** | Attacker gives erroneous position information (precise location is critical) | Signed warning messages, vehicular PKI, group communications, non-cryptographic checksums, plausibility checks, onboard radar/cryptographic certificates [86], [87] |
| **Man-in-the-Middle** | Attacker inserts between/intercepts receiver–sender interaction; harms authenticity, non-repudiation, integrity | Strong authentication and secure cryptography [88]; collaborative message authentication [89] |
| **Brute Force** | Searching procedures to violate network identification | Key generation techniques and robust encryption not crackable in reasonable time [90] |

### 6.3 Attacks on Privacy

| Attack | Description | Countermeasure |
|--------|-------------|----------------|
| **Identity Revealing** | Vehicle occupants' identity data compromised | Authentication systems with privacy-preserving techniques |
| **Location Tracking** | Attacker tracks vehicle position and route over time | Temporary and anonymous keys |

### 6.4 Data Trust Attacks
Main types: message tampering, masquerading, hidden vehicle, replay, and illusion attacks. More common in V2I.

| Attack | Description | Countermeasure |
|--------|-------------|----------------|
| **Message Tampering** | Alteration, deletion, modification, or construction of existing data | Data correlation method and challenge-response authentication; group signature framework with authenticity, anonymity, accountability, integrity, probabilistic signature verification, access control [93] |
| **Hidden Vehicle** | False location alerts from hidden vehicles causing accidents (GPS spoofing) | Trust management strategy (e.g., ART) [94] |
| **Illusion Attack** | Attacker legitimately connects and spreads incorrect/fake information | Positioning system with authorized-only signatures; differential tracking to detect irregular location changes [95] |

### 6.5 Attacks Based on Behavioral Patterns

#### Selfish Attacks

| Attack | Description | Countermeasure |
|--------|-------------|----------------|
| **Message Spoofing** | (Covered in 6.2) | — |
| **Traffic Analysis** | Passive monitoring and analysis of gathered information to launch later attacks | Dynamic anonymous key configurations varying with vehicle speed; pseudonyms or group signatures [93], [96] |
| **Eavesdropping** | Passive listening/observation without detection; compromises data secrecy | Privacy-preserving procedures and encryption; asymmetric cryptography with non-disclosure routing [97]; symmetric encryption for beacons [96] |
| **Repudiation** | Node refuses to communicate; tracking events are lost | Trusted hardware ensuring only authorized changes [98] |

#### Malicious Attacks

| Attack | Description | Countermeasure |
|--------|-------------|----------------|
| **DoS** | (Covered in 6.2) | — |
| **Message Replay** | Replaying previously delivered packets (e.g., beacons to track positions) | Timestamps on critical messages, transmission-time timestamps, digital signatures with sequence numbers [86] |
| **Sybil** | Creating many vehicles with similar identifiers to deceive others | Position verification, certificate/location/lifetime checks with reporting to the nearest certification authority [99]; geographic proximity/platoon-dispersion detection [148] |
| **Malicious Code** | Transferring worms, Trojan horses, spyware, viruses to attack base stations/vehicular network; collects data on trusted vehicles | Strong security and privacy-preservation systems with advanced malware detection |
| **Blackhole** | Attacker collects messages but does not transmit them; routing reports not updated | Hybrid intrusion detection mechanisms and secure routing topologies |

---

## 7. Solutions for Securing V2X Communications
Solutions are classified into **five types** based on security mechanism (Table 10).

### 7.1 Cryptography and Blockchain-Based Solutions
Defend primarily against external (unauthorized-entity) threats via encryption.

| Approach | Key Features |
|----------|-------------|
| **Lightweight Secure Navigation** | Lightweight secure navigation model for VANETs [100] |
| **Enhanced Encryption Standards** | Security and privacy of users via improved encryption [101] |
| **Multiple Operational Channels** | Encrypted information transmission across several channels [102] |
| **Cryptographic Mix-Zones** | **OTIBAAGKA** — mix-zone establishment resistant to malicious eavesdroppers [103] |
| **Blockchain Key Management** | Secure key exchange across heterogeneous security managers via blockchain [104] |
| **Signal-Based Key Generation** | Randomness from received signal strength; shared secret keys between vehicles with low collision probability [105], [106] |
| **Anonymous Authentication** | Secure, straightforward anonymous authentication for V2X [107]; lightweight smart-card-based anonymous auth in two stages (information + user) [108]; pseudonym + identity-based signature model [109] |
| **Blockchain-Based V2V** | Position certificates from beacons; trust level determined via a mining phase (broadcast + mining) [110] |
| **Blockchain for ITS** | Blockchain as middleware for secure communications and payments among ITS participants [111] |
| **Blockchain Information Security** | Distributed blockchain structure for V2X information transmission, avoiding cloud-server bottlenecks [112] |
| **Blockchain Trust Management** | Vehicle trust values stored in blockchain and shared among RSUs [113] |
| **Blockchain + IoT/V2X, Blockchain + SDN** | Focused surveys on blockchain-IoT-V2X security [115] and blockchain/SDN-based vehicular networks [116] |

### 7.2 Machine Learning and Deep Learning Solutions
ML/DL provide data-driven, reusable detection rules across different vehicular communication systems, replacing hand-written rule-based intrusion detection.

| Approach | Application |
|----------|-------------|
| **CNN + LSTM** | Robust detection using temporally and geographically distinct data streams [117], [118] |
| **Data-Centric Misbehavior Detection** | Internet of Vehicles misbehavior detection [119] |
| **Unsupervised Learning** | Radio frequency jamming detection in V2X [127] |
| **ML for Cruise Control** | Detecting four attack types on velocity, acceleration, position, velocity-position [128] |
| **Unsupervised Learning (CAN bus)** | DoS and three in-vehicle network attack detection via CAN-bus feature extraction [129] |
| **Live Network Traffic Analysis** | Vulnerability detection from live network traffic packets [84] |
| **Blockchain + Federated Learning** | Secure information transmission with provider privacy [114] |
| **Collaborative Learning** | Vehicles sharing experiences for malicious vehicle detection (raises privacy concerns) [120] |
| **Fuzzy Logic + ML Trust** | Trust computation assessing accuracy/integrity of event messages and transmitters [121] |
| **Q-Learning** | Trustworthiness evaluation of automated driving vehicles via indirect/direct examination (TROVE) [131], [160] |
| **GANs** | Generating statistically identical synthetic intrusion signals for testing detection systems |
| **Reinforcement Learning** | Physical (PHY) authentication against spoofing [132]; optimal secure routing policy in software-defined vehicular networks [133] |
| **CNNs** | Real-time driving environment segmentation as a fallback against irrational actions after GPS spoofing [122] |
| **Recurrent Deep Neural Networks / probabilistic ML / DL** | Vehicle speed and path prediction [123], [124]; traffic flow forecasting in vehicular cloud [125] |
| **Driver Identification** | Multi-class linear discriminant analysis on acceleration/deceleration [130]; 10 ML models to identify the true user/driver with minimal features (friction torque, intake air pressure) [126] |

### 7.3 Behavior, Trust, and Privacy Solutions
Complement cryptography by monitoring nodes' activity and behavior.

| Approach | Description |
|----------|-------------|
| **Weighted-Sum Trust** | Trust evaluated by allocating weights to trust components; malicious behavior reduces trust toward zero |
| **RSU-Based + Vehicle-Based Trust** | Two trust metrics (T-VNets) for local trust evaluation via node observation [134] |
| **Ant Colony Optimization** | Isolating non-cooperative (packet-dropping) nodes, finding shortest trusted route [135] |
| **Similarity Mining** | Discovering similarities between vehicles and message packets (same event/place/time ⇒ equal trust) [136] |
| **AODV Trusted Area** | Trusted-area determination using the Ad-Hoc On-Demand Distance Vector routing algorithm, with RSUs monitoring packet routing [137] |
| **Context-Aware Trust** | Three security checks: trusted source/path, malicious nodes along route, legitimate packet content (trust per neighborhood/road segment) [138] |
| **Distributed Authentication** | Verifier nodes examine message validity; non-verifiers rely on results (most-even, N-nearest, hybrid selection) [139] |
| **Payment/Punishment System** | Credit rewards for cooperating nodes, stimulation of truth-telling [140] |
| **Trust-Based Routing** | Two stages: distributed trust measurement + secure/trusted path transfer (TROUVE) [141] |
| **Trust/Privacy Survey** | Survey of pseudonymity-based location privacy and trust management, with simulator overviews [142] |
| **PPTM** | Privacy-preserving trust management for emergency message dissemination in space-air-ground-integrated vehicular networks (SAGIVNs) [143] |
| **BTMPP** | Balancing trust management and privacy preservation via bloom filter-based private set intersection [144] |
| **PPRM** | Lightweight privacy preservation with reputation management for mobile crowd-sensing (identity/location/reputation/sensing-data privacy; three-factor reputation updating) [145] |
| **PPRU** | Privacy-preserving reputation updating for cloud-assisted vehicular networks using ECC and Paillier; honest-but-curious cloud service provider [146] |
| **Fuzzy Logic** | Fuzzy-rule-based models for detecting packet-dropping (blackhole) assaults [147] |

### 7.4 Identity-Based Solutions
Tackle attacks that abuse user identities (privacy breaches, Sybil attacks) under an anonymous identity environment.

| Approach | Description |
|----------|-------------|
| **Anonymous Identity Trust** | Trust management protecting VANETs against messages with phony times and locations [149] |
| **Group ID Privacy** | Privacy-preserving trust mechanism collecting vehicle behavior data using a group ID instead of real identity [150] |
| **Pseudonym-Based + Threshold Signature + Geographic Proximity** | Three-strategy scheme [91]: private/pseudonym key pairs across domain boundaries; threshold signature to recover a malicious vehicle's identity and prevent compromise propagation; threshold authentication distinguishing malicious behavior from malfunctioning |
| **Geographic Proximity** | Detecting Sybil identities when the infiltrated node and its Sybil identities remain in proximity over time [148] |
| **Pseudonym-Trace Defense** | Protection against eavesdropping where an attacker traces a target vehicle via a specific pseudonym [92] |

### 7.5 5G and 6G-Enabled V2X Solutions
5G/6G compensate for 802.11p, DSRC, and LTE-V2X drawbacks (802.11p is the current V2X link layer but its traditional security cannot meet ultra-low-latency/high-reliability demands without high operating cost [16]).

| Feature | Description |
|---------|-------------|
| **5G Security Architecture Components** | AUSF, SCMF, ARPF, PCF, SEAF; native authentication support (unlike 3G/4G) — a primary difference of 5G |
| **Programmability & Slicing** | NFV, SDN, and network slicing enable innovative security mechanisms; security provided via architecture and supporting technologies [115], [163], [164]; 5G provides availability, integrity, authentication, confidentiality, and lower-layer integrity protection |
| **DSSS and FHSS** | Direct-Sequence and Frequency-Hopping Spread Spectrum alleviate jamming/DoS at lower layers |
| **5G-V2X Authentication Scheme** | Registration list + elliptic-curve public-key cryptography with only two lightweight hash operations; low authentication latency at high vehicle density, but assumes reliable access points [153] |
| **Decentralized Misbehavior Detection** | Addresses internal attacks (position falsification, false warnings) by authenticated vehicles in 5G-based V2X [154] |
| **Cross-Border Slicing Security** | Overview of 5G-V2X slicing use cases and cross-border slicing attack challenges [155] |
| **Batch Authentication** | Anonymous batch authentication and key exchange — RSUs authenticate a group of vehicles simultaneously to relieve computational load (for 6G-enabled VANETs) [156] |
| **6G Edge Computing** | Federated learning for computational offloading and resource management in 6G-V2X vehicular edge computing, updating edge devices' data [157] |
| **6G-IoAV** | 6G cellular communication supporting the Internet of Autonomous Vehicles and next-gen connected/autonomous vehicle applications; investigation of 6G-IoAV security challenges [158] |

---

## 8. Open Issues
Key open issues identified by the paper:

1. **Inadequate V2X Data:** Distributed misbehavior detection requires central aggregation of data from different components/layers, but transmission to a central unit causes high resource consumption and delay, violating V2X performance requirements; RSU/MEC servers are sparsely deployed due to cost.
2. **RSU Reliability & Trust:** RSUs are treated as fully trusted in centralized security mechanisms, yet they are sometimes inaccessible and remain susceptible to attacks.
3. **Simulation Limitations:** Current simulators poorly represent real V2X complexity and dynamics; most research assumes idealized conditions, and most datasets are not publicly available, hindering reproducibility.
4. **Multi-Hop Communication Security:** In multi-hop V2I/V2V, DSRC units rebroadcast received data; reliability and resilience to network congestion (e.g., spreading a Certificate Revocation List, CRL) must be addressed.
5. **Wireless Communication Vulnerability:** Securing wireless V2X communication against eavesdropping, MiM, and Evil Twin attacks remains open.
6. **Cost Barriers:** Advanced V2X technology raises vehicle costs; upgrades and buyer education add to deployment costs, so economical solutions are needed.
7. **Federated Learning Robustness:** FL-based models depend on server–client structure and remain susceptible to adversarial strategies and data poisoning; local ML models can be poisoned.
8. **Multi-Tenant Security:** 5G/6G cloud-native technologies enable multi-tenancy (operators, road authorities, OEMs, municipalities, service providers) and network-as-a-service, introducing new end-to-end security and trust issues; blockchain could provide cross-tenant interoperability but adds time complexity — scaling encryption/decryption of distributed ledgers is an open problem.

---

## 9. Future Research Directions

1. Use **traffic physics and consistency checks** (traffic flow theory) to overcome V2X deployment constraints.
2. Solve RSU reliability/accessibility/security problems or propose **proactive solutions avoiding dependence on RSU reachability** for security updates.
3. Build **open-source datasets** accessible to the research community and run realistic simulations of V2X characteristics.
4. Address security in **multi-hop DSRC rebroadcasting** scenarios (reliability, congestion).
5. Develop robust security mechanisms for **wireless vehicular communications** (esp. against message spoofing, MiM, replay, DoS, DDoS).
6. Reduce the **total cost** of V2X procurement and deployment.
7. Design **robust, privacy-preserving federated learning** models that withstand malicious and adversarial activities.
8. Develop **adaptive security mechanisms for 5G/6G-V2X** integration (traditional trust/privacy/security strategies may be inadequate).
9. Find novel solutions for **emerging attack types** (spoofing, MiM, replay, DoS, DDoS).
10. Address threats to **remote communication technologies and databases**.

---

## 10. Conclusion

This survey comprehensively reviewed research on V2X architecture, characteristics, communication models, applications, threats, vulnerabilities, and countermeasures, covering the last ten years of literature. Solutions were categorized into five types: (1) cryptography and blockchain-based, (2) machine learning and deep learning-based, (3) behavior, trust, and privacy-based, (4) identity-based, and (5) 5G and 6G-enabled. The paper identifies open issues and future research directions, providing a landscape and roadmap for researchers in V2X communication security.

---

## 11. Key References (Selected)

| Ref | Topic |
|-----|-------|
| [5] | Survey on security attacks in VANETs |
| [11] | Authentication issues for cellular-assisted V2X |
| [16] | Integration of VANET and 5G security |
| [20] | Security issues and challenges in V2X (Ghosal & Conti) |
| [22] | Security and privacy issues in V2X (EU/ETSI perspective) |
| [81] | VANET security challenges and solutions |
| [110] | Blockchain for secure message exchange in VANET |
| [117] | Deep neural network for in-vehicle intrusion detection |
| [142] | Recent advances in vehicular network security, trust, and privacy |
| [151] | 5G V2X services: security and privacy |
| [159] | ML-based misbehavior detection for 5G and beyond vehicular networks |

---

*Report generated from: Farsimadan, E., Moradi, L., & Palmieri, F. (2025). A Review on Security Challenges in V2X Communications Technology for VANETs. IEEE Access, 13, pp. 31069–31094.*
