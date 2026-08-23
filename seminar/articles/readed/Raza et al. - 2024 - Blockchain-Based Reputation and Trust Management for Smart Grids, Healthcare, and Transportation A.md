# Summary: Blockchain-Based Reputation and Trust Management for Smart Grids, Healthcare, and Transportation: A Review

**Paper**: Raza, A., Badidi, E., Hayajneh, M., Barka, E., & El Harrouss, O. (2024). "Blockchain-Based Reputation and Trust Management for Smart Grids, Healthcare, and Transportation: A Review"
**Journal**: IEEE Access, Volume 12, pp. 196887–196913
**DOI**: 10.1109/ACCESS.2024.3521428
**License**: Creative Commons Attribution 4.0

**Authors**: Abir Raza, Elarbi Badidi, Mohammad Hayajneh, Ezedin Barka, Omar El Harrouss
**Affiliation**: College of Information Technology, United Arab Emirates University (UAEU), Al Ain, United Arab Emirates
**Corresponding author**: Elarbi Badidi (ebadidi@uaeu.ac.ae)

**Dates**: Received 13 November 2024; accepted 17 December 2024; published 23 December 2024; current version 31 December 2024.
**Funding**: Supported by the United Arab Emirates University (UAEU) Program for Advanced Research (UPAR), Grant code G00003443.

**Index terms**: Blockchain, consensus algorithm, cryptography, distributed ledger technology (DLT), smart city, smart grid, trust management, vehicular ad-hoc network (VANET).

---

## Executive Summary

This systematic review examines blockchain-based reputation and trust management mechanisms across the three fundamental components of a smart city: energy (smart grids), healthcare, and transportation (VANETs). The authors analyzed 51 research papers published between 2018–2023 (76% from refereed journals, 24% from tier-1 international conference proceedings) drawn from IEEE Xplore, Google Scholar, and Scopus. The investigation reveals that existing trust schemes are **resource-constrained** and encounter **scalability limitations, high energy consumption, and incompatibility with existing systems**. The paper contributes: (1) an introduction to blockchain as a distributed ledger for privacy and security applications, (2) a comparison of consensus algorithms on fault tolerance, performance, decentralization, scalability, and resource consumption, (3) a comprehensive review of value-based decentralized trust management models for smart grids, healthcare, and transportation, and (4) a discussion of major implementation challenges and open issues.

---

## 1. Introduction & Motivation

### Problem Statement
- Smart cities rely on intelligent devices, applications, and digital networks collaborating for public good; residents participate via smart devices (smartphones, wearables).
- Exponential data generated from intelligent interactions raises security and privacy concerns (social engineering attacks, network breaches, data masking threats).
- A pressing challenge is selecting **trusted participants** — not all smart devices are trustworthy and some may degrade service quality or harm the network.
- Service providers must adopt a trust management mechanism to ensure the legitimacy of intelligent devices and protect critical applications from malicious and unauthorized users.

### Why This Survey?
- Most existing trust management techniques for smart cities are **centralized** — they rely on a single server/centralized authority storing identity attributes and authorization policies (single point of failure, massive overhead when many nodes communicate with the central server).
- Malicious-device infiltration is a significant challenge that can disrupt city services.
- Existing trust schemes are limited in functionality, efficacy, and scalability; many are resource-intensive (e.g., subjective-logic opinion triangles in [9]) or vulnerable when hosted on edge/cloud (network anomalies, attacks).
- Blockchain technology (BCT) is emerging as a decentralized, consistent, and tamper-proof foundation for trust management; a comprehensive cross-domain survey was still missing.

### Key Contributions
1. **Blockchain Technology Introduction**: Implementation as a distributed ledger for privacy and security applications.
2. **Consensus Algorithm Comparison**: Customary algorithms compared on five key aspects — fault tolerance, performance, degrees of decentralization, scalability, and resource consumption.
3. **Comprehensive Review**: Value-based decentralized trust management models with blockchain for smart grids, healthcare, and transportation.
4. **Research Challenges**: Major challenges and open issues when implementing blockchain-based trust management systems.

---

## 2. Research Methodology

The review followed a systematic three-stage methodology (Figure 1): Stage 1 – Planning the review; Stage 2 – Conducting the review; Stage 3 – Reporting the review.

### Research Questions
| # | Question |
|---|----------|
| RQ1 | What are the fundamentals of blockchain technology, its operating principles, and how does it affect data sharing in various domains? |
| RQ2 | Could blockchain be a viable platform for sharing intelligence and information between government agencies and the private sector? |
| RQ3 | What are blockchain technology's most commonly employed trust management models and consensus algorithms? |
| RQ4 | What theoretical frameworks or models are commonly employed to study blockchain-based trust management in smart city contexts? |
| RQ5 | What are the open research challenges and potential future research directions for blockchain-based trust management implementations in smart city environments? |

### Search Strategy
- **Databases**: IEEE Xplore, Google Scholar, Scopus.
- **Keywords**: "trust management" + "blockchain" in title/abstract/keywords; refined with "certificate," "authentication," "safe communication," and domain terms "Smart Grids," "Healthcare AND IoMT," "VANET AND Vehicles."
- **Search strings**:
  - Search 1: Blockchain trust management smart grids
  - Search 2: Blockchain trust management healthcare IoMT
  - Search 3: Blockchain trust management VANET vehicles

### Inclusion / Exclusion Criteria
- **Inclusion**: Year range 2018–2023; journal articles and conference papers; English language.
- **Exclusion**: Papers before 2018; papers with no citations; non-English manuscripts; overlapping papers.

### Selection & Screening
- Two-stage screening: (1) manual review of titles/abstracts/keywords for relevance and non-repetition; (2) full-text review against inclusion/exclusion criteria.
- **51 research papers** selected (including bibliographic reviews).
- 76% published in refereed journals; 24% in tier-1 international conference proceedings.
- **Search challenges**: limited literature on blockchain-assisted smart grids; "trust management" was often used interchangeably with "authentication"; had to settle for lesser-cited papers in smart grids and smart healthcare due to limited availability.

### Information Extraction & Reporting
Papers were categorized per domain and studied in full detail, segregated by adopted methodology, key features, strengths, and limitations.

---

## 3. Blockchain Ecosystem and Its Applications

*Addresses RQ1 (blockchain fundamentals) and RQ2 (intelligence sharing).*

### 3.1 Blockchain Technology
- Blockchain is a **peer-to-peer network** enabling secure transaction execution without a trusted third party.
- Logically it is a **backward-linked list of blocks** (Figure 2). Each block includes a **header**, **certificates**, and the **previous block's hash** (which itself contains the previous hash, and so on).
  - Block header: block ID, generator's ID, block signature, block hash, timestamp.
  - Block certificate: certificate ID, node's ID, node's public key, certificate hash, timestamp.
- A node uses a **digital signature (private-key cryptography)** to create a transaction; transactions are secured by an encryption code composed of transaction information, sender, and receiver.
- **Six-layer architecture** (Figure 3, per [25], [26]): hardware/infrastructure layer, data layer, network layer, consensus layer, incentive layer, and contract layer — together producing a tamper-resistant chain replicated across the network.

### 3.2 Blockchain Types
1. **Permissioned (private)**: Managed by users eligible to authenticate transactions; only closed-group members have write privileges (outsiders may read). Examples: Hyperledger Fabric (business framework), GemOS, MultiChain.
2. **Permissionless (public)**: All transactions visible to all nodes; any node can participate in consensus to validate a transaction.
3. **Consortium (hybrid)**: A "semi-private" hybrid granted to a group of approved individuals/organizations; all participating nodes can join consensus but only selected nodes confirm a block. Example: consortium blockchains built on Ethereum.

### 3.3 Blockchain Challenges
BCT remains relatively new and faces bottlenecks in design, implementation, and protocols:
- Design complexity
- Governance and regulations
- Privacy and security
- Interoperability
- Fork problem
- Scalability
- Storage capacity
- Computational complexity
- Energy consumption

### 3.4 Applications of Blockchain
- **Smart city operations**: intelligent transport systems, smart construction, energy, education, security; decentralized data-management platforms for Internet of Vehicles (IoV); auction mechanisms for IoV resource allocation; secure/decentralized energy trading for smart mobility and electric vehicles (EVs).
- **Bitcoin and finance**: blockchain was first proposed as Bitcoin's distributed ledger to solve double-spending; applications now extend far beyond crypto into smart contracts and smart grids. Three generations: Blockchain 1.0 (digital currencies), 2.0 (digital finance), 3.0 (digital society).
- **Privacy preservation**: tamper-proof storage (data cannot be modified); smart contracts; securities trading and post-trading ownership records; a legitimate disruptor for healthcare, banking, and cybersecurity.
- **Security applications**: secure storage and recovery systems; safe data sharing between applications and end users; encrypted IoT wearable preferences; blockchain DNS (decentralized, counters censorship and DNS spoofing); incentivized resource sharing in content delivery networks (CDNs); secure Wi-Fi hotspot access via signed credentials on the blockchain; intrusion detection (detecting malicious nodes, empowering trust management).

### 3.5 Blockchain for Intelligence Sharing
- Cryptography gives high data integrity; transactions are traceable, transparent, immutable, and verifiable; traditional cyber threat intelligence (CTI) systems can be interfered with.
- A blockchain-inspired threat intelligence sharing model overcomes centralization via **consensus, decentralization, and traceability**.
- **Decentralized intelligent network edges (DINEs)**: blockchain-inspired frameworks preserve edge knowledge sharing in heterogeneous IoT, protecting against eavesdropping, data tampering, DoS, and man-in-the-middle attacks.
- **EHR systems**: centralized models are vulnerable to single-point and insider attacks; HIPAA (1996) mandates patient-data accuracy, confidentiality, integrity, audit, and accountability. A blockchain-based distributed ledger is presented as the ultimate need of threat-intelligence philosophy for health data.

---

## 4. Trust Management

*Addresses RQ3.*

### 4.1 Overview
- Trust management (TM) comprises **information collection, trust-related content storage, trust calculation, trust maintenance, and decision-making** [58], [59]. It solves security problems in heterogeneous, open, distributed, dynamic networks.
- Trust is the first line of defense among security dimensions: **trust, traceability, privacy, integrity, and availability** [62].
- Core components of a trustworthy smart environment: **identity management, access control, and mutual authentication** (else vulnerable to identity theft, unauthorized access, data alteration).
- Blockchain stores trust degrees in blocks to realize dynamic authentication of users/devices.

### 4.2 Trust Management Taxonomy
**By design goals (Wang et al. [64])**: decision models, evaluation models, management models (survey focuses on management models).

**By TMS type [61], [65]**: recommendation-based, prediction-based, reputation-based, policy-based.

**By architecture (Figure 5, [61])**:
1. **Centralized**: TM module on a high-processing server/central authority. Pros: full bird's-eye view of the network. Cons: single point of failure, lacks scalability, high server-maintenance cost.
2. **Decentralized**: no central authority; trust calculated by every node or a set of nodes. Pros: eliminates single point of failure. Cons: massive computation and energy overheads on individual nodes.
3. **Semi-centralized**: combination — a central authority manages the network while some distributed nodes perform trust tasks. Pros: overcomes most disadvantages of both extremes.

**Trust calculation (inference) methods [66]**: Bayesian inference, fuzzy reasoning, maximum likelihood, weighted average, grey reasoning.

**Common implementation techniques**: certificate generation; cryptography (ECC, ECDSA, SAS, SHA-256, SSE, PKI, etc.); Bayesian inference; fuzzy logic; trust values (rating/reputation).

### 4.3 Cryptographic Techniques in Trust Management

#### Diffie-Hellman
- Asymmetric public-key encryption for securely exchanging keys over a public channel.
- **Advantages**: high security — the key is never directly transmitted over the channel.
- **Challenges**: key generation consumes high energy, memory, and time; overhead of key exchange hurts performance/scalability as vehicle count grows; highly vulnerable to man-in-the-middle attacks; integration with complementary methods can enhance VANET suitability.

#### Elliptic Curve Cryptography (ECC)
- Asymmetric public-key cryptography with public/private keys.
- **Advantages**: smaller encryption/decryption keys, more suitable for vehicle communication and more efficient than traditional methods.
- **Challenges**: still significant computational requirements for resource-constrained devices (in-vehicle units IVUs, roadside units RSUs); high energy consumption for battery-powered components; energy scales with execution complexity and big data in vehicular networks; vulnerable to side-channel attacks and quantum computing threats; balancing security with energy/computational overheads in decentralized vehicular networks is critical.

#### Public-Private Key Cryptography (Asymmetric)
- Public key shared openly, private key kept secret.
- **Challenges**: certificate management causes computational overheads — not well suited to dynamic environments like VANETs; OBUs/RSUs have limited resources; managing/storing many key pairs and certificates imposes huge storage requirements per vehicle; suffers from eavesdropping, man-in-the-middle, and Sybil attacks due to frequent vehicle join/leave.

#### Zero-Knowledge Proof (ZKP)
- Three intrinsic properties: **zero knowledge, completeness, soundness**.
- **zk-SNARK** (Zero-Knowledge Succinct Non-Interactive Argument of Knowledge) proves computational facts about data without disclosing the data; ZKP arguments are main building blocks for blockchain privacy solutions.
- Applications: verifying a prover has sufficient transaction volume without leaking private data; secure exchange of digital assets; remote biometric authentication; anonymous verifiable voting; secure auctions.
- **Representative uses**: Jiang et al. — non-interactive ZKP + blockchain for vehicle privacy (proxy re-encryption manages the symmetric key) [82]; Zhang et al. — zk-SNARK-based secure information sharing with IPFS [83]; SE zk-SNARKs (Simulation Extractable) for anonymity and conditional privacy in vehicular networks [84]; Sharma et al. — ZKP-based EHR access control with proxy re-encryption [85]; Luong et al. — zk-SNARK mutual authentication for healthcare networks (Ethereum anonymity) [86].

### 4.4 Trust-Based Consensus Mechanisms
- A consensus algorithm addresses the **Byzantine Generals problem**, establishing trust between interacting nodes in a distributed network.
- Consensus is what decides whether a new block is legitimate; it differs from traditional ACID databases.
- An efficient consensus algorithm is attack-resistant, fault-tolerant, performant, and accessible to all participants.

**Categories** (Figure 6, [88], [89]):
- **Proof-based**: the node that conducts adequate verification is granted the privilege of adding a new block and is rewarded.
- **Voting-based**: based on Byzantine fault tolerance with solid mathematical proofs for security and stability.

**Popular proof-based protocols**:
1. **Delegated Proof of Stake (DPoS)**: one vote per share; less energy, faster transactions than PoW/PoS; nodes vote for randomly selected witnesses who are incentivized/penalized; limits decentralization via many validators.
2. **Proof of Activity (PoA)**: Bentov et al. combine PoS + PoW — PoW gives decision power to computational performers, PoS to stakeholders.
3. **Proof of Authority (PoAu)**: PoS variant for permissioned blockchains, in the BFT family; lighter message transmission than BFT; high throughput, highly scalable, near-zero processing overheads; tends toward strong centralization (few controlling entities).
4. **Proof of Elapsed Time (PoET)**: Intel (2016); energy-efficient; participants solve a hash calculation like PoW but the winner is selected randomly; depends on dedicated hardware, restricting cooperation and decentralization.
5. **Proof of Stake (PoS)**: staking economic share; validator selected pseudo-randomly instead of solving a computational puzzle; faster block finality than PoW; supersedes PoW's high energy consumption.
6. **Proof of Work (PoW)**: first blockchain consensus (Dwork and Naor originally for spam); computational-load based; high computational power required, lacks scalability, long latency for transaction confirmation.

**Popular voting-based protocols**:
1. **Practical Byzantine Fault Tolerance (PBFT)**: introduced 1999 to reduce exponential to polynomial complexity; most widely used; ensures normal consistency and order of up-link transactions; inappropriate for SCM/energy trading.
2. **Ripple (Proof of Concept, PoC)**: financial institutions use it for faster cross-border transactions; validating nodes keep a Unique Node List (UNL); requires 80% agreement within the UNL.

**Alternative protocols**:
- **Delayed Proof of Work (dPoW)**: hybrid, by Supernet/Komodo project; leverages another blockchain's security; prevents 51% attacks and double spending.
- **Proof of Energy (PoE)**: designed for peer-to-peer energy trading with smart contracts and low power consumption.
- **Casper**: PoS alternative with dynamic validator sets and correct-by-construction forking; adds PoS on top of PoW for finality; cannot handle 51% attacks.
- **Proof of Claim (PoC)**: PoS derivative deployed by CLAIM Coin; removes proportional incentives to enhance security.
- **Proof of Cooperation (PoC)**: proposed by Khalid et al.; enhances cooperation among network entities; all agents have an equal chance of being selected as the combiner.
- **Trust-Dependent Consensus (TCON)**: Prabhakar and Anjali; trusted cluster heads (CHs) validate blocks; a mathematically formulated trust metric decides the number of validating CHs and transactions; proven to save computational power and communication energy.
- **Proof of Endorse Contracts (PoEC)**: Cheng et al.; cross-blockchain consensus resolving trust between a supervisory (permissioned/private/consortium) and a supervised (permissionless public) blockchain.
- **Proof of Majority (PoM)**: Praveen et al.; eliminates resource-intensive tasks, reducing carbon footprint; nodes become miners without resource-intensive tasks; outraces PoS and PoW on throughput, decentralization, and entry barriers.

*(The paper's Tables 4 and 5 provide comparative analyses of proof-based and voting-based algorithms by features and application scenarios.)*

---

## 5. Blockchain-Based Trust Management in Smart Grids

*Addresses RQ4 for the energy domain.*

### Overview
- Smart grids are significant in modern energy infrastructure; blockchain applications span power generation, consumption, transmission, and distribution.
- Otoum and Mouftah's review [123] discusses design principles for trustworthiness, secure energy trading, and remote monitoring, envisioning future smart grids at the intersection of **AI, federated learning, and blockchain**.
- **Commercial/platform examples**:
  - **Brooklyn Microgrid (BMG)** — world's first blockchain energy transaction; Ethereum smart contracts + PBFT consensus let prosumers sell excess energy.
  - **Green Wallet (Germany)** — rents residential storage systems, uses blockchain to generate surplus energy from renewables.
  - **Verdigris Technologies** — cloud-based AI solution for optimal energy consumption.
  - **Verv (UK)** — AI-steered; customers track appliance-level energy consumption and itemized costs.
  - **PowerScout** — partners Google and the US Department of Energy; AI/ML to predict cost and energy consumption for smart homes.

### Cryptography-Based Approaches
- **ECC / ECDSA / SHA-256**: traditional cryptography for trust management.
- **Zhang et al. [111]** — *keyless trust scheme* between smart meters (SM) and service providers (SP) without a trusted third party (TTP); SHA-256 + elliptic curve multiplication generate public/private keys stored in the signature device instruction (SDI); SPs and SMs are registered and verified in the service provider network (SPN) via hash function and public keys.
- **Zhang et al. [124]** — Shamir's Secret Sharing (SSS) for safe power resource-sharing; a new **Proof of Random Trust (PoRT)** consensus selects a leader node by dynamic random trust value; the leader selects validators, signs/broadcasts to the power distribution node, validator list, and current blockchain height (encrypted with group members' public keys) and broadcasts blocks to the consortium chain.
- **Muzumdar et al. [119]** — ECDSA-secured energy trading via energy-injection, bidding (Vickrey auction), trading, and utilization contracts; blockchain updated through PoS after each contract.
- **Wang et al. [105]** — edge-computing-based authentication and key agreement; registration authority registers the smart meter; genesis file with configuration parameters; smart contracts manage the key-materials table, providing conditionally anonymous authentication.
- **BlockSLAP [106]** — lightweight authentication for smart grids; nodes upload hashed IDs to a registering authority; system parameters live in smart contracts visible only to initiators; contracts auto-generate public keys and signatures; smart grid and utility center negotiate a session key for bidirectional secure communication.
- **Zhong et al. [107]** — blockchain-enabled authentication and authorization; each user has a public key visible on the blockchain; token signed by private key verified by service provider; timestamps authenticate transactions; implemented on the FISCO consortium platform with embedded PBFT.
- **Bera et al. [112]** — pairwise secret keys for access control between smart meters and service providers (node authentication + key establishment); secure consensus among SPs; blocks added via voting-based PBFT.
- **Hussain and Farooq [36]** — cloud-based framework for trust between the distributed system operator (DSO) and smart meters; smart meters enter the DSO blockchain via public-key cryptography; DSO aggregates power computation data (PCD) with its private key and validates via **Clique PoAu** consensus; transactions stored in an AWS cloud server.
- **Li et al. [110]** — blockchain-based architecture for trustworthy smart grids; each user maintains its own public/private key pairs, registers via a DApp; micro load management devices (M-LMD) measure micro-area load; local grid aggregators (LGA) at the edge layer feed a cloud server that computes the dynamic electricity price onto the blockchain; privacy-sensitive data encrypted and stored at the blockchain overlay layer.
- **Dorri et al. [125]** — secure distributed energy trading (SPB) via destination public-key routing and atomic metatransactions; each smart meter builds a Merkle tree; signed root is a "certificate of existence"; miners match the public-key hash against the transaction signature.

### Trust Management Models
- **Samuel et al. [118]** — multi-agent-system (MAS) trust management with a four-layer architecture (blockchain layer, aggregator layer, prosumer layer, physical layer); blockchain stores all trust values and encrypted feedback; aggregators run an incentive mechanism for direct trust (DT) and recommended trust (RT) evaluations; **weighted average** method computes trust; upper layer checks trust credibility (consistency, distortion, reliability).
- **Khalid et al. [127]** — incentive provisioning scheme; **Publicly Verifiable Secret Sharing (PVSS)** protects sensitive information; trust credibility computed from consistency, distortion, and reliability; **tit-3-for-tat (T3FT)** repeated game strategy encourages agent cooperation.
- **Patsonakis et al. [126]** — permissioned blockchain with a virtual node layer between customers and the aggregator; fog-enabled intelligent devices (FEIDs) clustered in virtual networks using optimal profiling and segmentation; aggregator enhanced with a decision support system for self-balancing and grid stability; privacy and anonymity via standard encryption and built-in identity mixing based on zero-knowledge proofs.

### Certificate Generation
- **Dehalwar et al. [108]** — a central authority creates a block in the blockchain for every IoT device (e.g., smart meter) by authenticating its identity; device transmits relevant information to the block; the grid operator verifies energy at each node/transaction via the hash key (Merkle Root); device authenticity checked against the registration authority.

### Smart Contracts
- **Prabhakar and Anjali [102]** — two smart contracts in a consortium blockchain: **AccessContract** defines access policies (modified token-based FairAccess scheme, all access transactions recorded) and **TradeContract** enables efficient energy trading (records EnergyTraded transactions, updates net energy available for sale). Also propose the **TCON** trust-dependent consensus, resilient to one-third Byzantine voting power.

### Hierarchical Consensus
- **Jiang et al. [122]** — hierarchical consensus framework: an intra-layer algorithm using the **Raft tenure system and timer mode** for voting; **PBFT** for inter-layer consensus; trust values updated via the **Eigen trust model**; nodes classified as candidate, follower, leader, or key nodes.

### Representative Works (Smart Grids)
| Research | Focus | Key Contribution |
|----------|-------|------------------|
| Zhang et al. [111] | Keyless trust | SHA-256 + elliptic curve multiplication for key generation, no TTP |
| Muzumdar et al. [119] | Energy trading | ECDSA-secured trading, Vickrey auction, PoS consensus |
| Li et al. [110] | Consumer trust | Public/private key pairs, DApp registration, dynamic pricing |
| Dorri et al. [125] | Secure energy trading | Destination public-key routing, Merkle tree certificates, metatransactions |
| Samuel et al. [118] | Multi-agent systems | Four-layer architecture, DT/RT, weighted average trust |
| Khalid et al. [127] | Incentive provisioning | PVSS privacy, T3FT cooperation, trust credibility |
| Jiang et al. [122] | Hierarchical consensus | Intra-layer Raft + inter-layer PBFT, Eigen trust model |
| Zhang et al. [124] | Power sharing | SSS + Proof of Random Trust (PoRT) consensus |
| Hussain & Farooq [36] | DSO–meter trust | Cloud framework, Clique PoAu consensus, AWS storage |
| Bera et al. [112] | Access control | Pairwise secret keys, PBFT among service providers |
| Prabhakar & Anjali [102] | Energy trading | AccessContract/TradeContract, TCON consensus |
| Dehalwar et al. [108] | Certificate generation | Central authority blocks, Merkle Root verification |

---

## 6. Blockchain-Based Trust Management in Healthcare

*Addresses RQ4 for the healthcare domain.*

### Overview
- Blockchain-inspired healthcare systems provision secure smart healthcare services and address unauthorized access to electronic health records (EHRs) and compromised stakeholder trust.
- Anjum Khurshid [145] argues blockchain's distributed structure and privacy-preserving features can build trusted systems for public health (e.g., COVID-19 response).
- **Commercial/exemplar systems**: IBM **Rapid Supplier Connect** (manages medical supply chains, detects counterfeits); IBM **Trust Your Supplier** (transparency, visibility, risk mitigation for stakeholders); **BeepTrace** (University of Glasgow mobile system providing encrypted, anonymized information to authorities). Other uses: patient identification, insurance approvals.
- Trust challenges in centralized computing (per [143]): huge overheads, lack of trust evidence, less adaptiveness, inaccuracy; cloud centers lack full server transparency; many decentralized models still require a third-party trust/certificate center, causing high computational power and network overload.

### Cryptography-Based Approaches
- **Abou-Nassar et al. [129]** — IoHT trust management (DITrust chain); each IoT object generates an ECC public/private key pair; Ethereum blockchain verifies device authenticity; devices grouped into **trusted zones** with association and aggregation interactions, both secured by ECC; smart-contract-based information exchange within zones.
- **Majdoubi et al. [146]** — decentralized trust establishment without TTP using blockchain + **Short Authenticated Strings (SAS, PV-SAS-MCA)** + lightweight ECC; Ethereum stores node identity, public key, and digital signature; full authentication in **under 90 ms**.
- **Tan et al. [141]** — two-sided verifiability for outsourced EHRs on a cloud server; health records encrypted with **Searchable Symmetric Encryption (SSE)** and stored in IPFS; **ECDSA** digital signatures verify authorized medical entities; a bitmap index (created via blockchain rather than a third party) ensures searchability over encrypted EHRs.
- **Bhan et al. [142]** — **Clustered Hierarchical Trust Management System (CHTMS)** resilient against DoS attacks; three phases (node-level trust, cluster-head trust, base-station trust); nodes compute ECDSA signatures with ECC-generated keys; each node assigns others one of three states (trusted, untrusted, uncertain); SHA hash of temporal data; CH alerts the BS (hospital level), which verifies or refutes malicious nodes.

### Trust Management Frameworks
- **Tahir et al. [131]** — hybrid authentication/authorization with lightweight encryption; a certificate authority creates certificates and keys for each healthcare user; verified data sent to a peer-to-peer cloud storage platform, hashed, and mined with **Proof of Auction (PoAu)**; miners rewarded for success, degraded otherwise.
- **Malamas et al. [147]** — fine-grained access to IoMT devices/data; three smart contracts (registration, actor handling, log management); new **Proof of Medical Stake (PoMS)** consensus verifies transaction logs with private/public keys.
- **Mondal et al. [140]** — trusted EHR management using a blockchain **multi-signature stamp**; non-repudiation via hash links with timestamps; identities created by certificate authority and validated by a membership service provider; blocks signed with private keys, verified with public keys.
- **Selvarajan & Mouratidis [74]** — consultative transaction key mechanism; combines blockchain, consultative key generation, **BAN logic**, feedback analysis, and trust-score calculation; **Tuna Swarm Optimization (TSO)** performs nonce-message verification; trust computed from feedback (rejected requests, IP addresses, websites); BAN logic authenticates users for further access.

### Fuzzy-Logic and Probabilistic Trust
- **Zulkifl et al. [134]** — **FBASHI** with three fuzzy inference systems; PBFT nominates endorsing peers with assigned weights who verify parameters, run chain codes, and validate inputs/outputs; gossip protocol updates peer ledgers; a Nonce is generated and recorded on the blockchain upon successful access.
- **Ali et al. [148]** — **BFT-IoMT**; fuzzy-logic trust management at the **fog layer** of the IoMT network; medical devices form clusters with elected cluster heads; trust values computed from collected parameters and stored on the blockchain; nodes below the threshold are declared Sybil (malicious) and isolated; decisions propagated network-wide.
- **Khalfaoui et al. [130]** — probabilistic Bayesian classification + stochastic Markov modeling against insider and on-off attacks; nodes modeled by a time-homogeneous Markov chain and classified into honest/suspicious/malicious; trustworthiness probabilities computed by a Bayesian classifier; **attribute-based access control (ABAC)** updates permissions — honest nodes keep privileges, malicious nodes are banned.
- **Meng et al. [149]** — two-layer blockchain trust management for **Medical Smartphone Networks (MSN)** against insider attacks; MSN layer handles node–server interaction; Chain layer builds a consortium blockchain where nodes upload features of malicious packets, quickly updating blacklists.
- **Li et al. [150]** — MSN trust management with a central server measuring node reputation via Bayesian inference, adaptive traffic sampling, and retrieval of verified data from the blockchain; an Intrusion Detection System (IDS) monitors incoming traffic; the chain component appends malicious-traffic info shared network-wide.
- **Jeon et al. [135]** — pattern-based scheme against data falsification, inconstancy, and misuse in collaborative healthcare; trust built from six attributes and sorted into five risk areas; trust elements (trust concern, uncertainty) deduced from business-process risks and mapped as patterns via BCT.

### Representative Works (Healthcare)
| Research | Focus | Key Contribution |
|----------|-------|------------------|
| Abou-Nassar et al. [129] | IoHT trust | ECC key generation, Ethereum device verification, trusted zones |
| Majdoubi et al. [146] | Decentralized trust | SAS (PV-SAS-MCA) + ECC, authentication < 90 ms |
| Tan et al. [141] | EHR verifiability | ECDSA + SSE, bitmap index, IPFS storage |
| Bhan et al. [142] | CHTMS | ECDSA signatures, three-phase trust computation, DoS resilience |
| Tahir et al. [131] | Lightweight auth | Certificate authority, Proof of Auction (PoAu) mining |
| Malamas et al. [147] | IoMT access control | Three smart contracts, PoMS consensus |
| Mondal et al. [140] | EHR management | Multi-signature stamp, non-repudiation |
| Zulkifl et al. [134] | Fuzzy trust | FBASHI, PBFT endorsing peers, gossip protocol |
| Ali et al. [148] | Sybil attack mitigation | Fuzzy logic at fog layer, cluster heads |
| Khalfaoui et al. [130] | Insider attacks | Bayesian classification + Markov modeling, ABAC |
| Meng et al. [149] | Insider attacks (MSN) | Two-layer MSN/Chain design, malicious-packet features |
| Li et al. [150] | MSN reputation | Bayesian reputation, adaptive traffic sampling, IDS |
| Jeon et al. [135] | Collaborative data | Pattern-based trust, six attributes, five risk areas |
| Selvarajan & Mouratidis [74] | Quantum trust | Consultative keys, BAN logic, TSO verification |

---

## 7. Blockchain-Based Trust Management in Transportation

*Addresses RQ4 for the VANET / smart transportation domain.*

### Overview
- Blockchain has positively impacted transportation (smart transportation), with research focused on autonomous and connected vehicles.
- Vehicle-and-roadside collaboration directly affects transportation safety; trust management protects the privacy, preservation, and identity of vehicles and their data.

### Cryptography-Based Approaches
- **Wang et al. [169]** — privacy-preserving trust management using **ECC**; two smart contracts: feedback aggregation smart contract (**FASC**) and trust evaluation smart contract (**TESC**); RSUs collect vehicle transactions and generate blocks combining **PoW + PoS**.
- **Kudva et al. [170]** — during registration an RSU assigns a vehicle a public/private key pair via **Elliptic Curve Diffie-Hellman (ECDH)**; vehicles compute individual trust values using modified **AODV** routing; authorized RSUs produce aggregated trust scores, dynamically modify denylist node tables, and select the leader RSU via **PBFT** to generate blocks.
- **Liu et al. [172]** — conditional privacy-preserving announcements; vehicles register anonymously with a trusted authority (TA); threshold authentication for non-trusted environments; the TA traces malicious vehicles by matching identity-based keys and pseudonyms stored on the blockchain; RSUs compute message reliability via **logistic regression** based on reputation values; blocks added via a mix of **PoW and BFT**; conditional privacy via identity-based group signatures.

### Trust Management Models
- **Kandah et al. [6] — BLAST**: multi-tier blockchain method for connected vehicles; each vehicle maintains a continuously updated information table; three types of trust ensure consistency and deliver accurate per-vehicle trust factors.
- **Zhang et al. [165] — AIT**: AI-enabled decentralized trust; vehicles compute senders' **local trust level (LTL)** via a **feedforward neural network**; RSUs compute the **global trust level (GTL)**, encoded into a new block; final stage is global-trust-level voting and dissemination by all RSUs.
- **Li et al. [174] — ATM (active-detection)**: three types of trust — **detection trust, reference trust, transmission trust**; vehicles send detection probes, detect abnormal neighbor behavior, and compute direct trust; trust values uploaded to primary servers that update the blockchain **BlackList** field and push it to RSUs.
- **Wang et al. [175]**: multi-layered trust management for intelligent vehicular collaboration in **6G**; combines **PBFT + PoS** to improve scalability and reduce computational complexity; an edge-deployed blockchain aggregates reputation data; global trust is the weighted average of evaluating nodes' local trust values (more trustworthy nodes get more weight).

### Consensus Mechanisms
- **PoW + PoS combinations**: RSU miner competition [8], [169], [173] — prevents high-reputation RSUs from always uploading data.
- **PBFT + PoS**: for scalability in 6G edge networks [175].
- **Proof of Trust (POT)** [182]: highly effective in resource-constrained VANET environments; vehicles generate temporary public/private keys; TA issues a certificate after CA endorsement; RSUs aggregate global-blockchain transactions; PoW used to deploy blocks; regional authorities run global transactions against permanent public addresses to update trust and wallet scores.
- **Delayed Proof of Work (dPoW)** [183]: appends blocks while differentiating registered from malicious vehicles.

### Trust Evaluation Methods
- **Logistic regression** (message reliability from vehicle reputation) [172].
- **Bayesian inference** (message credibility, rating offsets) [8], [173].
- **Feedforward neural networks** (local trust level) [165]; **rule-based + neural network** prediction at RSUs [171].
- **Hidden Markov Model (HMM)** [180]: blockchain-assisted trust management with three layers (network, edge-blockchain, CA); unsupervised learning because vehicle behavior is never anticipated.
- **Fuzzy logic** [181]: vehicles inducted into/isolated from the blockchain network based on trust values; **fault-tolerant optimized link state routing (FT-OLSR)** detects malicious vehicles (trust ≤ threshold); reliable nodes exceed the threshold.
- **Multi-criteria decision-making** [178]: RSU computes a message originator's reputation, packs it into a block, and broadcasts it for other vehicles to access.

### Other Representative Works
- **Malik et al. [171]** — two-phase trust mechanism; vehicles request a unique encryption key from a nearby RSU; keys maintained on the blockchain and optimally tuned with the **Sea Lion Explored–Whale Optimization Algorithm (SLEWOA)**; sink-side RSU predicts node trust via rule-based + neural network evaluation.
- **Yang et al. [8]** — decentralized trust management; vehicles rate message credibility (positive/negative); ratings packed into blocks and uploaded to local RSUs; trust value = sum of per-vehicle offsets (positively correlated with positive-rating ratio); joint PoW+PoS elects the RSU miner.
- **Zhang et al. [173]** — reputation-value management; reputation update algorithm includes message-credibility calculation, rating mechanism (initial and final ratings to detect/penalize malicious senders), and reputation calculation via **weighted aggregation**; PoW+PoS consensus updates reputation changes.
- **Theodouli et al. [176]** — identity and trust framework for IoV using **W3C Decentralized Identifiers (DIDs)** and **Verifiable Credentials (VCs)**; decentralized identity storage avoids a single point of failure and removes the need for a centralized CA.
- **Cinque et al. [177]** — IoV trust management using Libelium Waspmote + ZigBee; blockchain implemented at the **fog layer**; each block holds trust values associated with ledger entities; Trusted Nodes respond to requests; nodes periodically inform IoT devices of host trust degrees.
- **Pu [178]** — trusted communication mechanism; vehicles broadcast event messages, evaluate received-message credibility, and upload trust values to a nearby RSU; RSU computes reputation via multi-criteria decision-making.
- **Dewanta & Mambo [179]** — fog computing services in rural areas (BPT scheme); local trust based on a bidding-price transaction between client/server vehicles; global trust is a payoff assignment from transaction evaluation; certified public credentials (CPC) and certified secret credentials (CSC) assigned at registration; vehicles establish local trust, authentication, session keys, and certified transaction record (CTR) checking; CTRs and offloaded data stored in the fog node for verification.
- **Javaid et al. [183]** — hardware-primitive-based unique identifiers; **Physical Unclonable Function (PUF)** assigns each vehicle a unique identifier in the IoV network; trust via blockchain PKI; each vehicle holds its own blockchain account and public/private keys; **dPoW** distinguishes registered from malicious vehicles.

### Representative Works (Transportation)
| Research | Focus | Key Contribution |
|----------|-------|------------------|
| Wang et al. [169] | Privacy-preserving trust | ECC, FASC + TESC smart contracts, PoW+PoS |
| Kudva et al. [170] | Scalable trust management | ECDH, modified AODV, PBFT consensus |
| Malik et al. [171] | Two-phase trust | SLEWOA optimization, neural networks, rule-based evaluation |
| Liu et al. [172] | Conditional privacy | Logistic regression, identity-based group signatures, PoW+BFT |
| Yang et al. [8] | Decentralized trust | Bayesian inference, trust offsets, PoW + PoS RSU mining |
| Zhang et al. [173] | Reputation values | Message credibility, initial/final ratings, weighted aggregation |
| Zhang et al. [165] | AI-enabled trust | Feedforward neural networks, GTL voting |
| Li et al. [174] | Active-detection trust | Detection/reference/transmission trust, BlackList updates |
| Wang et al. [175] | 6G multi-layered trust | PBFT + PoS, weighted global trust on edge blockchain |
| Theodouli et al. [176] | Decentralized identity | W3C DIDs and VCs, no centralized CA |
| Kandah et al. [6] | Connected-vehicle trust | Multi-tier BLAST, three trust types |
| Liu et al. [180] | Behavior analysis | Hidden Markov Model, unsupervised learning |
| Inedjaren et al. [181] | Fuzzy trust | FT-OLSR, threshold-based induction/isolation |
| Singh et al. [182] | Proof of Trust | POT consensus, resource-constrained VANETs |
| Javaid et al. [183] | Hardware primitives | PUF unique identifiers, dPoW consensus |
| Dewanta & Mambo [179] | Rural fog computing | BPT bidding scheme, CPC/CSC credentials, CTR |

---

## 8. Research Challenges and Open Issues

*Addresses RQ5. The survey concludes that existing trust management models are limited in sophistication and face significant challenges in both theoretical and practical contexts. Key pitfalls: efficiency, robustness, scalability, and QoS (sparsity, consistency, availability, privacy). Common IoV trust issues: inefficiency, low latency, heterogeneous trust evaluation, and aggregation in highly dynamic node sets.*

### Technical Challenges
1. **Privacy**: Blockchain offers cryptographically empowered resilience (no single point of compromise), but confidentiality is not a primary objective. Risks: losing a private key may expose database copies; network validation may allow fraud through double expenditure or transaction reversal.
2. **Security**: Trust models are not robust against advanced malicious attacks (especially malicious recommendations). Threats: wallet security attacks, 51% (majority) attacks, server breaches, illegal transactions, wiretapping; advanced attacks include long-range attacks, DDoS, P+epsilon attacks, Sybil attacks, balance attacks, and BGP hijacking (see Table 13 per-domain security issues).
3. **Consensus Protocol Selection**: choosing the right consensus significantly affects trust-mechanism operation. Traditional algorithms suffer from high computing-power requirements, slow consensus formation, and low data throughput. Solutions include customized algorithms combining strengths of known algorithms or diverging technologies (e.g., virtual mining); the choice depends on application requirements for security, scalability, and energy efficiency.
4. **Adaptability and Interoperability**: migrating from centralized to decentralized systems requires technical effort; trust management is less deployable with public blockchains due to data heterogeneity, while permissioned blockchains have separate usage modalities. Edge computing integration is constrained by limited computing/storage resources; most trust-value calculations ignore trust between smart devices and edge service providers.
5. **Trusted Third Party (TTP)**: most models are centralized, and even "decentralized" models still need a TTP or certification authority — posing risks of single point of failure, overloading, and credibility loss.
6. **System Overheads**: high resource utilization and computational complexity restrict sophisticated trust solutions in large-scale networks.
7. **Latency and Throughput**: traditional consensus (e.g., PoW) is computationally intensive and slow — unsuitable for dynamic networks like VANETs; PoS/PBFT reduce latency but may still miss stringent real-time VANET requirements; propagation delays worsen with high mobility; Ethereum and Hyperledger have limited transactions-per-second (TPS), a bottleneck in high-demand scenarios.
8. **Data Immutability and Legal Ownership**: immutability preserves integrity, but fraudulent/erroneous data once entered propagates errors across the network and is difficult to correct or update.
9. **Governance Issues**: establishing trust among numerous stakeholders (e.g., vehicle owners and government agencies) for regulatory oversight and coordination is hard.

### Domain-Specific Challenges
- **Smart Grids**: resource constraints of IoT devices; dynamic electricity pricing mechanisms; integration with existing grid infrastructure.
- **Healthcare**: HIPAA compliance; patient-data privacy and confidentiality; interoperability between healthcare systems; scalability of trust solutions.
- **Transportation**: high mobility of vehicles; real-time trust evaluation requirements; heterogeneous trust evaluation and aggregation; integration with existing transportation infrastructure.

---

## 9. Conclusions

### Key Findings
The survey analyzed 51 papers (2018–2023) covering blockchain's definition, characteristics, classification, applications, challenges, and future directions. Three headline benefits of blockchain for trust management:
1. **Decentralization** — eliminates the single point of failure, enhancing security and resilience.
2. **Immutability** — data cannot be altered or tampered with, adding a trust layer.
3. **Traceability** — prevents malicious use of data.

### Limitations and Future Directions
- **Scalability issues**: need for more efficient consensus algorithms.
- **Performance bottlenecks**: optimization of computational requirements.
- **Practical applications**: further research needed for real-world deployment.
- **Resource constraints**: solutions for IoT and resource-limited devices (existing schemes are resource-constrained, high-energy, and incompatible with existing systems).
- **Interoperability**: integration with existing systems and standards.
- **Governance frameworks**: regulatory and coordination mechanisms.

### Research Opportunities
- Lightweight consensus algorithms for resource-constrained environments.
- Hybrid trust models combining centralized and decentralized approaches.
- AI/ML integration for adaptive trust management.
- Standardization of trust metrics and evaluation frameworks.
- Cross-domain trust management solutions.

---

## References Summary

The paper cites 201 references spanning:
- **Blockchain technology**: foundations, consensus algorithms, security.
- **Smart grids**: energy trading, IoT devices, smart contracts.
- **Healthcare**: EHR management, IoMT, privacy preservation.
- **Transportation**: VANETs, IoV, autonomous vehicles.
- **Cryptography**: ECC, ZKP, digital signatures.
- **Trust management**: models, frameworks, calculation methods.

---

## Related Report

A companion, thesis-oriented report summarizing this paper for smart-city trust management exists separately: `Raza_2024_Blockchain_Based_Reputation_Trust_Management_Smart_Cities_Report.md` (not modified here).

---

*Report generated from: Raza, A., Badidi, E., Hayajneh, M., Barka, E., & El Harrouss, O. (2024). Blockchain-Based Reputation and Trust Management for Smart Grids, Healthcare, and Transportation: A Review. IEEE Access, 12, 196887–196913. DOI: 10.1109/ACCESS.2024.3521428*
