# Securing Fog Computing for Internet of Things Applications: Challenges and Solutions

A survey of security and privacy in fog-assisted IoT.

## Metadata

- **Title:** Securing Fog Computing for Internet of Things Applications: Challenges and Solutions
- **Authors:** Jianbing Ni (Univ. of Waterloo), Kuan Zhang (Univ. of Nebraska-Lincoln), Xiaodong Lin (Wilfrid Laurier Univ.), Xuemin (Sherman) Shen (Univ. of Waterloo)
- **Venue:** IEEE Communications Surveys & Tutorials (COMST)
- **DOI:** 10.1109/COMST.2017.2762345
- **Year:** 2017 (accepted for publication; vol. 20, no. 1, pp. 2489–2524, 2018)
- **Keywords:** Fog computing, Internet of Things, edge computing, security and privacy
- **Funding:** National Natural Science Foundation of China under Grant 61728102

## Abstract

IoT connects billions of physical objects to collect and exchange data for applications such as environmental monitoring, infrastructure management and home automation. IoT lacks features critical for some applications (low latency, location awareness, geographic distribution). Fog computing extends computing, storage and networking resources to the network edge to support these, but introduces security and privacy risks. The survey reviews fog computing architecture and features, the critical roles of fog nodes (real-time services, transient storage, data dissemination, decentralized computation), fog-assisted IoT applications, security and privacy threats and requirements, challenges to securing fog computing, state-of-the-art solutions, and open research issues.

## 1. Introduction and Motivation

- Cisco predictions: 50 billion connected devices by 2020; 500 billion by 2025. IoT data would reach 500 zettabytes by 2019 vs. 10.4 zettabytes of global data-center IP traffic. ~45% of IoT-created data would be stored/processed/analyzed at or near the network edge.
- Some IoT applications need fast response or involve private data; some produce large data volumes that burden networks.
- Fog computing brings services closer to end-users by pooling computing, storage and networking resources at the network edge. It reduces processing burden on resource-constrained devices, meets latency requirements of delay-sensitive applications, and overcomes bandwidth constraints of centralized services.
- Fog is a nontrivial extension of cloud computing, so security/privacy issues persist. Fog service providers may not be fully trusted; IoT devices are resource-constrained and easily hacked, broken or stolen.
- Fog's distinctive features (decentralization, mobility support, location awareness, low latency) create specific challenges. Conversely, fog is *more* secure than cloud in some ways: local data storage and non-real-time exchange with cloud centers. Fog nodes can act as proxies for end-devices to perform secure operations.
- Research on fog security/privacy is still early; the paper provides a systematic survey. Sections: II related works, III architecture/features/applications, IV security threats, V challenges and solutions, VI future directions, VII conclusions.

## 2. Related Works

- Yi et al.: fog definition, application scenarios (content delivery/caching, real-time video analytics, mobile big data analytics), issues (fog networking, computation offloading, resource management).
- Sarkar & Misra: theoretical modelling; latency/energy comparison. Varghese et al.: fog reduces average response time by 20% and data traffic between edge and cloud by 90%. Sarkar et al.: fog cuts response delay by 50% vs. cloud.
- Dantu et al.: feasibility of fog on Android phones. Varshney & Simmhan: use cases (urban surveillance, smart grid, drones) and fog vs edge vs cloud comparison. Perera et al.: smart-city scenarios and common fog features.
- Tao et al.: 5G V2G networks with fog/cloud. Markakis et al.: fog and mist for beyond-5G. Several works use smart gateways at the network edge for smart healthcare.
- Most earlier articles treat security only at a high level. Roman et al. [12] analyzed security threats, challenges and mechanisms across all edge paradigms (fog, mobile edge computing, mobile cloud computing): threats to network infrastructure, edge data centers, virtualization infrastructure and user devices, plus eight security challenges.
- Contribution of this survey: (i) evolution from cloud to fog; (ii) fog-assisted IoT applications classified by fog-node roles; (iii) security/privacy challenges and solutions; (iv) insights on what state-of-the-art solutions cannot address; (v) open research issues (location privacy, privacy exposure in data combination, rogue fog node/IoT detection, decentralized and scalable secure infrastructure).

## 3. Overview of Fog Computing

### 3.1 Evolution from Cloud to Fog

- Cloud computing offers on-demand centralized, shared, scalable computing and storage, but centralization creates large physical separation between IoT devices and the cloud → increased latency/jitter; cloud cannot access local contextual information (local network condition, mobility patterns, precise location).
- Fog computing was introduced by Cisco in 2012: "an extension of the cloud computing paradigm that provides computation, storage, and networking services between end devices and traditional cloud servers."
- Extended definition (Vaquero & Rodero-Merino): "a scenario where a huge number of heterogeneous, ubiquitous and decentralized devices communicate and potentially cooperate among them and with the network to perform storage and processing tasks without the intervention of third parties." Key ingredients: ubiquity, decentralization, improved network capabilities, cooperation among fog nodes.
- Fog is not a replacement for the cloud but a complement: transient storage and local analysis at fog nodes, permanent storage and global analysis in the cloud. Fog as a Service (FaaS) is an emerging business model.
- Standardization: Cisco IOx framework (application hosting across routers/switches/computing modules) and Fog Director; ISO/IEC 20248 for RFID/barcode verification via AIDC; OpenFog Consortium; F-RAN (fog-radio access network); SDN-based fog-over-C-RAN for 5G.

### 3.2 Fog vs Cloud vs Edge

| Feature | Cloud | Fog |
|---|---|---|
| Latency | High (eventual consistency) | Low (locality) |
| Explicit mobility | N/A | Yes |
| Architecture | Centralization | Decentralization |
| Service access | Through core | At the edge / on handheld devices |
| Local awareness | N/A | Yes |
| Geographic distribution | N/A | Yes |
| Scalability | Average | High |
| # of users/devices | Tens/hundreds of millions | Tens of billions |
| Content generation | Central location | Anywhere |

- **Fog vs Edge:** both push services/storage/compute to the network edge. Edge computing targets the edge of the *cellular* network (e.g., base stations). Fog computing is an end-to-end horizontal architecture distributing control, computing, networking and storage along the cloud-to-device continuum; it is decentralized, offers a seamless continuum of services, and supports various applications through wired/wireless access.

### 3.3 Architecture of Fog Computing

Two categories:

1. **Cloud-Fog-Device framework** (three layers): device layer, fog layer, cloud layer.
2. **Fog-Device framework** (two layers): device layer and fog layer.

Layers arranged in increasing order of computing/storage capability. Communication via wired (Ethernet, optical fiber) and wireless (Bluetooth, LTE, ZigBee, NFC, IEEE 802.11 a/b/c/g/n, satellite) technologies; virtualization (NFV, SDN) enables network virtualization and traffic engineering. Layers can connect to public authorities (certificate authority, key generation center, judges, police) that handle detected threats.

- **Device layer:** mobile IoT devices (wearables, smart phones, smart watches, smart glasses, vehicles) and fixed IoT devices (sensors, RFID tags). Devices have limited computing/storage/bandwidth; their job is data collection and reporting to the upper layer.
- **Fog layer:** network equipment augmented with computation (routers, bridges, gateways, switches, base stations) and local servers (industrial controllers, embedded servers, mobile phones, cameras) — these are *fog nodes*, deployable anywhere (smartphone, factory floor, roadside unit, vehicle, power pole). Nodes are one/two hops from devices and hold regional knowledge. In Cloud-Fog-Device they provide transient storage/real-time analysis and periodically forward data summaries upward; in Fog-Device they cooperate without cloud (e.g., decentralized vehicular navigation, indoor floor plan reconstruction, smart traffic lights, local content distribution).
- **Cloud layer:** consolidated platform for global analysis, virtualization-based isolation, policy sending to fog layer.

### 3.4 Features of Fog Computing

Five distinguished features:
- **Location awareness:** fog node locations let services target devices in specific regions.
- **Geographic distribution:** nodes deployed along highways, base stations, museums, points of interest to maintain high-quality data streams from moving devices.
- **Low latency:** local decisions without the cloud, giving millisecond responses.
- **Large-scale IoT application support:** manages billions of devices (environment monitoring, power grid, water treatment, climate monitoring).
- **Decentralization:** no central server; fog nodes self-organize.

General characteristics (Bonomi et al.): mobility support, predominance of wireless access, heterogeneity, online analytics, interplay with the cloud.

### 3.5 Fog-Assisted IoT Applications (by Fog-Node Role)

**1) Real-Time Services:**
- *Smart traffic lights:* fog node detects ambulance/police flashing lights via cameras, changes signals; detects pedestrians/bicycles and vehicle speed/distance via road sensors; neighboring nodes coordinate collision warnings.
- *Healthcare and activity tracking:* fall detection for stroke patients, sudden cardiac death prediction, patient alarms and in-hospital care.
- *Decentralized vehicular navigation:* upgraded roadside units as fog nodes maintain traffic info and cooperatively compute driving paths.
- Others: home energy management, augmented reality/gaming, indoor location/navigation, network resource management.

**2) Transient Storage:** fog nodes temporarily keep device data (typically 1–2 hours), then discard or forward summaries to the cloud, cutting communication overhead.
- *Edge content caching* (web response time reduced ~20%), *shopping cart management*, *software and credential updating* (e.g., vehicle ECUs obtain updates via on-board fog nodes).

**3) Data Dissemination:** fog nodes act as intermediate nodes (aggregation, forwarding, routing), deduplicating data and selecting audiences.
- *Energy consumption collection* via AMRC (Advanced Metering Regional Collector) aggregating smart-meter readings for the operation center; *local content distribution* (traffic info, ads, parking navigation); *fog-based malware defense*.

**4) Decentralized Computation:** multiple fog nodes cooperatively execute computation for cloud and users.
- *Computation offloading* (cloud → fog → smart devices), *aided computation* (e.g., fog helps verify bilinear-pairing-based signatures, computes homomorphic authenticators), *big data analytics* (e.g., missing-child search via distributed video analytics, results reported to cloud instead of raw data).

Table III catalogs fog-assisted applications across smart city components: smart transportation, smart grid, smart healthcare, smart industry, and others (crowdsensing, emergency alerts, anomaly detection, proximity detection, location verification, vehicular data scheduling).

## 4. Security Threats in Fog Computing

Fog is considered more secure than cloud (local transient storage/analysis reduces dependency on Internet; non-real-time cloud exchange hinders eavesdropping), but still inherits cloud risks. Fog nodes/clouds are honest-but-curious, possibly malicious. Cloud examples of data leakage: Google, Amazon, Yahoo incidents.

### 4.1 Attacks on Fog Computing

1. **Forgery:** forging identities, profiles, fake information; wastes bandwidth/storage/energy.
2. **Tampering:** dropping, delaying or modifying transmitted data; hard to detect given wireless channel conditions and mobility.
3. **Spam:** unwanted/false content; consumes network resources, misleads users, leaks privacy.
4. **Sybil:** manipulating fake identities or abusing pseudonyms to compromise fog computing (e.g., incorrect crowdsensing reports, invading private information).
5. **Jamming:** flooding channels/computing resources with bogus messages to block legitimate use.
6. **Eavesdropping:** capturing and reading packets (effective if data unencrypted).
7. **Denial-of-Service (DoS):** flooding fog nodes with superfluous requests; fog nodes are far more vulnerable than the cloud due to limited resources.
8. **Collusion:** two or more parties (fog nodes, devices, cloud) cooperate to deceive or defraud others.
9. **Man-in-the-Middle:** attacker secretly relays/modifies data between two parties that believe they communicate directly (feasible if a gateway is compromised or replaced by a fake one).
10. **Impersonation:** pretending to be a legitimate user to use services, or impersonating a fog node to offer fake/phishing services.

### 4.2 Privacy in Fog Computing

Four aspects:
- **Identity privacy:** name, address, phone, visa/license numbers, public-key certificates; disclosed via authentication submissions.
- **Data privacy:** data exposed on fog nodes or in transit reveals preference, occupation, address, health status, political inclination.
- **Usage privacy:** usage patterns (e.g., smart-meter readings reveal sleeping/absence schedules).
- **Location privacy:** accessing a nearby fog node reveals the user's rough position; multi-fog access exposes trajectories.

### 4.3 IoT Devices as a Source of Threats

Resource-constrained, poorly protected devices are easily hacked, broken or stolen and become distributed attack sources. Example: October 2016 DDoS against Dyn from unsecured home routers and surveillance cameras, disrupting Twitter, Netflix, Amazon and PayPal. Kaspersky Lab detected ~3.5 million malware pieces on >1 million devices in 2014 (credential theft for network access).

## 5. Securing Fog: Challenges and Solutions

### 5.1 Real-Time Services

**1) Identity Authentication** — challenge: heterogeneous trust domains, user mobility, latency. Solutions:
- Cooperative authentication [89], [90]: eliminates redundant per-user authentication effort; fog nodes should share authentication results.
- Anonymous authentication [91]–[93]: pseudonyms, group signatures, k-anonymity hide identity; limitation — de-anonymization attacks and difficulty keeping connections alive under high mobility (e.g., Ni et al. use data retrieval at roadside units for parking navigation).
- *Insight:* cooperative fog-node authentication is needed; anonymity is insufficient against de-anonymization.

**2) Access Control** — challenge: decentralized domains, mobile users, multiple devices per user. Solutions:
- Role-based access control (RBAC) [95]; attribute-based access control (ABAC) built on attribute-based encryption [96] (example policy: ("PhD student" OR "Master student") AND "ECE department").
- Device/key management for BYOD environments [97]–[99] (seldom achieved).
- *Insight:* distributed access control with user mobility and dynamic device management is needed; new-device onboarding and old-device revocation must be consistent across fog nodes.

**3) Lightweight Protocols Design** — challenge: IoT devices lack computational power; heavy crypto adds latency. Solutions:
- Lightweight cryptography standardized in ISO/IEC 29192: block ciphers, hash functions, stream ciphers, one-pass authentication ciphers; lightweight ECC [102].
- *Insight:* symmetric-key lightweight design is mature, but public-key solutions on RFIDs/sensors remain an open problem; lightweight schemes may be insufficient against curious fog nodes.

**4) Intrusion Detection** — challenge: detect malicious activity on devices and fog nodes in a heterogeneous, decentralized architecture. Solutions:
- HIDS [103], [104] (host kernel/file system/behavior monitoring); NIDS [105], [106] (network traffic analysis, DoS/port scan detection); DIDS [107], [108] (distributed, communicating sensors); Liu et al. [109] secure intelligent traffic-light control against DoS using computational Diffie–Hellman puzzles; ML/data-analysis for false-data-injection detection in smart grids [110].
- *Insight:* balance local and global defense; autonomous detection on each node; share behavior features among fog nodes — hard in a decentralized architecture.

**5) Resilience to Sybil Attacks** — challenge: attackers blend with normal users. Solutions:
- Social-based: Quercia & Hailes [111] (community matching); Park et al. [112] (vehicular mobility correlation with roadside units in space/time); cryptography: Lin [113] group-signature-based scheme linking multiple signatures on an event to one Sybil user; Liang et al. [114] trustworthy service evaluation limiting Sybil review.
- *Insight:* single-fog-node data is insufficient; fog-node cooperation is critical; homomorphic encryption could hide data but is too heavy for fog nodes.

**6) Trust Management** — challenge: fog nodes have different trust levels; choosing trustworthy cooperation partners. Solutions:
- Evidence-based trust model [115], [116] (public key/credential/address as evidence); monitoring-based trust model [117]–[120] (past interaction behavior; direct + indirect evidence, feedback aggregation, subjective trustworthiness); reputation management for MANET [121], VANET [122], delay-tolerant networks [123], mobile crowdsensing [124].
- *Insight:* needs to be decentralized, situation-specific and scalable/consistent under node dynamics and mobility.

### 5.2 Transient Storage

**1) Sensitive Data Identification and Protection** — challenge: sensitivity is subjective and context-dependent (e.g., a location sensor on a person vs. a greyhound; a police accident video vs. the same event captured by nearby vehicles). Encrypting everything is blind and costly.
- *Insight:* identify sensitive data first; leakage sources everywhere (clothes, watches, shoes, jewelry, contact lenses with microphones/cameras).

**2) Data Integrity Protection** — challenge: users lose physical control; attackers modify/delete evidence (e.g., accident forensics video on a roadside fog node); honest-but-curious nodes discard rarely accessed data for monetary reasons. Solutions:
- Provable data possession (PDP) protocols [126]–[128] supporting public verification, dynamic updating, privacy preservation, batch verification, multi-cloud operation.
- *Insight:* not directly usable — fog storage is transient, data may span multiple fog nodes due to mobility, and cross-device verification tags cannot be aggregated.

**3) Secure Data Sharing** — challenge: encrypted data blocks sharing. Solutions:
- Proxy re-encryption [129]–[132] (atomic proxy cryptography, unidirectional schemes on bilinear maps, chosen-ciphertext secure and conditional variants).
- Attribute-based encryption: CP-ABE [134] (policy in ciphertext) and KP-ABE [135] (policy in key); applications to cloud storage [136], e-health records [137], fog communications [138], fine-grained access with revocation [139], key-delegation-abuse-resistant CP-ABE [140], leakage-resilient functional encryption [141].
- Key-aggregate encryption [142]–[144] (constant-size aggregate key for a set of ciphertexts; key-aggregate searchable and time-bound variants).
- *Insight:* bilinear-pairing overhead is a bottleneck for IoT devices; key management and fine-grained sharing with privacy remain open.

### 5.3 Data Dissemination

**1) Privacy-Preserving Data Aggregation** — challenge: encrypted per-device data must be aggregated without revealing individuals. Solutions:
- Additively homomorphic encryption: Paillier [145], BGN [146]; used in smart metering, mobile social networks; Lu et al. [150] Paillier + CRT + one-way hash chain for hybrid-device aggregation with early false-data filtering; Wang et al. [151] anonymous aggregation via Castagnos–Laguillaumie; full homomorphic encryption [152]–[154] enables computation on ciphertexts but is impractical; one-way trapdoor permutation for time-series aggregation [155]; key distribution/agreement for session keys [156], [157].
- Signature aggregation: aggregate signatures [158], [159]; multi-signature, sequential aggregate, key-homomorphic signatures [160]–[164] for n users on the same message.
- *Insight:* no efficient multikey-homomorphic signature aggregates n users' signatures on n distinct messages; needs pre-shared info.

**2) Secure Data Search** — challenge: search encrypted transient data. Solutions:
- Symmetric searchable encryption [165]–[170], [176], [177]: fuzzy keyword search, ranked keyword search, oblivious RAM / blind storage for forward and access-pattern privacy; k-NN-based privacy-preserving queries for fog-enhanced LBS [170].
- Asymmetric searchable encryption [171]–[175]: PEKS, designated tester, conjunctive keywords, predicate encryption, hidden-vector encryption (but access pattern exposed).
- *Insight:* whether a fog node returns matching data can disclose user presence/trajectory; preserving data and user privacy in encrypted search remains hard.

**3) Secure Content Distribution** — challenge: personalized/broadcast content may reveal preferences; dynamic receiver sets. Solutions:
- Secure service discovery [178], [179] (services discoverable only by authorized users, no preference disclosure); broadcast encryption [180]–[182]; anonymous broadcast encryption [183] for receiver anonymity.
- *Insight:* dynamic joins/leaves make key update and revocation challenging; anonymous broadcast in dynamic environments is significant.

**4) Privacy-Preserving Packet Forwarding** — challenge: intermediate fog nodes observe flows and infer sender-receiver relationships (e.g., a patient's physician domain revealing the disease). Solutions:
- Lin et al. [184] content-oriented + contextual privacy against global eavesdropping (e-health); social-based forwarding for VANETs [185]; social-tier-assisted forwarding preserving receiver-location privacy [186].
- *Insight:* fog nodes observe global data flow and can re-identify anonymized senders via mobility patterns.

### 5.4 Decentralized Computation

**1) Verifiable Computation** — challenge: users and cloud cannot fully trust fog computation results. Solutions:
- Garble-circuit-based non-interactive verifiable computation [187], [188]; FHE-based [189]; public verifiable computation via CP-ABE [190]; signatures of correct computation [191]; multi-client non-interactive [192], [193]; publicly verifiable delegation [194].
- *Insight:* errors from one fog node can propagate; intermediate and final results need verification, and misbehaving nodes must be traceable.

**2) Secure Aided Computation** — challenge: devices cannot hand secrets to fog nodes for expensive operations (signature generation, decryption). Solutions:
- Server-aided computation [195]–[197] (modular/group exponentiation); server-aided verification [198], [199] (BLS-based [200]); server-aided encryption [201], function evaluation [202], key exchange [203]; fog as trusted third party for dummy positions to protect location [204].
- *Insight:* fog tasks are more complex than exponentiation/signature verification; multi-fog aided computation (e.g., data deduplication and key-homomorphic signature aggregation [163]) is promising.

**3) Secure Big Data Analysis** — challenge: privacy during data mining/ML; de-identification is breakable; algorithms reveal correlations. Solutions:
- Fully homomorphic encryption [152], [153], [207]–[209] (frequent-item-set mining, infection analysis, clinical decision support with Paillier threshold decryption + neural networks).
- Differential privacy [206], [210]–[213]: noise injection; deep learning with DP [210]; dynamic DP for distributed classification [211]; local differential privacy for crowdsourcing [212], heavy-hitter mining [213].
- *Insight:* FHE overhead is intolerable on IoT devices/fog nodes; existing DP schemes assume centralized storage — decentralized DP for fog is open.

### 5.5 Summary of Challenges and Solutions

Table IV maps each fog-node role to its security challenges and solution families: Identity/Cooperative/Anonymous Authentication, RBAC/ABAC/Device-Key Management, Lightweight Crypto, HIDS/NIDS/DIDS, Mobile & Crypto Sybil Defense, Evidence/Monitoring Trust + Reputation, Symmetric/Asymmetric Encryption, Provable Data Possession, Proxy Re-encryption/ABE/Key-Aggregate Encryption, Homomorphic Encryption/One-way Trapdoor Permutation/Key Distribution/Homomorphic Signature, Symmetric/Asymmetric Searchable Encryption, Secure Service Discovery/Broadcast/Anonymous Broadcast Encryption, Privacy-preserving Packet Forwarding, Privately/Publicly Verifiable Computation, Server-aided variants, FHE and Differential Privacy.

Fig. 5 illustrates the correlation between fog's unique features and the reasons existing solutions cannot be directly applied.

## 6. Open Issues and Future Research Directions

1. **Location privacy preservation:** fog's localization inherently exposes users (wearable device locations, cloud learning rough regions from fog-node geography; a user can be re-identified with 90% probability from four spatio-temporal points). Global anonymity degrades to local anonymity; protecting location is very difficult.
2. **Detection of rogue fog nodes and IoT devices:** fog nodes vulnerable to distributed DoS and wireless jamming [12]; MitM feasible when a gateway is compromised/replaced [214]; devices can be forced to reveal keys; even legitimate nodes may go rogue (broadcasting rumors, colluding to manipulate crowdsensing). Detection is hard because trust models vary, and the dynamic distributed environment makes blacklists infeasible. Reliable anomaly intrusion detection per node is proposed; existing IDS detect only external attacks with some probability.
3. **Privacy exposure in data combination:** seemingly benign data becomes sensitive when combined (pharmacy purchase + credit-card center info links health status and identity; social + health data for infection analysis, e.g., WeChat proximity/contact detection). Tradeoff between functional data combination and privacy; differential privacy and FHE are still immature; levels of privacy protection for data combination are needed.
4. **Decentralized and scalable secure infrastructure:** no trusted leader to determine node trustworthiness; traditional security mechanisms are inefficient (credential replication vs. single point of storage); distributed computation correctness unguaranteed; compatibility of partial solutions uncertain. **Blockchain** [216] is proposed to maintain distributed log files recording events/messages among cloud, fog nodes and IoT devices, enabling misbehavior discovery and building authentication/reputation frameworks — though storage overhead on a single fog node is heavy.

## 7. Conclusions

Fog computing is a new decentralized architecture that extends cloud storage, computing and networking to the edge to support extremely large-scale IoT applications, but it confronts traditional security threats that raise new challenges. The survey: reviewed architecture and features; discussed the four fog-node roles and promising IoT applications; presented security attacks and privacy-exposure risks; reviewed state-of-the-art solutions and insights on remaining problems; identified open research issues (location privacy, rogue node detection, data-combination privacy, decentralized secure infrastructure) as the most promising directions.

## Key Takeaways

- Fog ≠ edge computing: fog is a decentralized, end-to-end horizontal architecture along the cloud-to-device continuum; edge is cellular-network-edge-centric.
- Fog nodes serve four roles — real-time services, transient storage, data dissemination, decentralized computation — each with its own security challenges.
- Threats are organized as 10 attack types (forgery, tampering, spam, Sybil, jamming, eavesdropping, DoS, collusion, MitM, impersonation) and 4 privacy dimensions (identity, data, usage, location).
- Most cloud solutions (PDP, ABE, proxy re-encryption, searchable encryption, verifiable computation, differential privacy) are not directly applicable to fog because of its decentralization, mobility, heterogeneity and limited node resources.
- Future work centers on location privacy, rogue node detection, privacy in data combination, and blockchain-based secure infrastructure.

---

*Summary based on full text of: Ni, Zhang, Lin, Shen, "Securing Fog Computing for Internet of Things Applications: Challenges and Solutions," IEEE Communications Surveys & Tutorials, DOI 10.1109/COMST.2017.2762345.*
