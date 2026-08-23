# Summary of report.tex — Privacy and Security in VANET

A structured English summary of the Persian seminar report "حریم خصوصی و امنیت در شبکه اقتضایی خودرویی" (Privacy and Security in Vehicular Ad-hoc Networks). Compiled from the LaTeX source `report.tex` (793 lines) without modifying it. Note: the date "مرداد ۱۴۰۵" is translated faithfully as given in the file, even though it is later than the current calendar date.

## 1. Metadata (from the .tex title page and hyperref settings)

- **Title (Persian):** حریم خصوصی و امنیت در شبکه اقتضایی خودرویی — *Privacy and Security in Vehicular Ad-hoc Networks*
- **PDF title:** امنیت و حفاظت در شبکه اقتضایی خودرویی ("Security and Protection in Vehicular Ad-hoc Networks")
- **Author / Student (دانشجو):** سید علی موسوی — Seyed Ali Mousavi
- **University:** دانشگاه صنعتی امیرکبیر (پلیتکنیک تهران) — Amirkabir University of Technology (Tehran Polytechnic)
- **Faculty:** دانشکده مهندسی کامپیوتر — Faculty of Computer Engineering
- **Course:** گزارش سمینار کارشناسی ارشد — Master's (M.Sc.) Seminar Report
- **Advisor (استاد راهنما):** دکتر بابک صادقیان — Dr. Babak Sadeghian
- **Course instructor (استاد درس سمینار):** دکتر رضا صفابخش — Dr. Reza Safabakhsh
- **Date:** مردادماه ۱۴۰۵ (Mordad 1405, Persian calendar)
- **Typesetting:** 12pt A4 article, XePersian, Vazirmatn font, biblatex (biber, IEEE style)

## 2. Abstract (translated summary)

Vehicular Ad-hoc Networks (VANETs), as part of Intelligent Transportation Systems (ITS), enable information exchange between vehicles and road infrastructure, playing a major role in improving traffic safety and reducing accidents. However, the wireless and open nature of these networks makes them vulnerable to various security attacks — message forgery, Sybil attacks, man-in-the-middle attacks, and privacy violations. The report first examines the architecture and characteristics of VANETs, then analyzes their security challenges. Blockchain is introduced as a decentralized solution to trust and security problems in VANETs, and its limitations in this domain are examined. IOTA Tangle is discussed as a scalable, fee-less alternative to traditional blockchains. Finally, identity management concepts — pseudonyms, Self-Sovereign Identity (SSI), and Decentralized Identifiers (DID) — are presented as modern solutions to VANET security and privacy problems. The role of AI methods in strengthening VANET security is also given special attention.

## 3. Introduction

- Motivation: VANETs are among the most important ITS technologies; by exchanging information between vehicles and road infrastructure they improve traffic safety, reduce accidents, and increase transportation productivity.
- **WHO statistics cited:**
  - More than **1.19 million people die annually** in road traffic accidents worldwide.
  - Road accidents are the **leading cause of death for children and young adults aged 5–29** (cited to Farsimadan et al. 2025).
  - Over **92% of accidents are attributed to human error** (cited to Hozouri et al. 2023).
- Problems motivating the report: the wireless/open nature of VANETs exposes them to message forgery, Sybil, man-in-the-middle, and privacy-violation attacks. Blockchain has recently been proposed as a decentralized trust/security solution, but traditional blockchains suffer from low scalability and high energy consumption, which IOTA Tangle addresses. Identity management and privacy preservation (SSI, DID, Verifiable Credentials) are also major concerns.
- Purpose: a comprehensive review of VANET security challenges and existing solutions (blockchain, IOTA Tangle, identity management).

## 4. What is VANET?

- **Definition:** A subclass of Mobile Ad-hoc Networks (MANETs) that facilitates communication among nearby vehicles and between vehicles and infrastructure. Vehicles act as mobile nodes sharing safety and traffic information. Connected vehicles are an inseparable part of modern life; the global connected-vehicle market was projected to reach **US$131.9 billion by 2019**.
- **Main components:**
  - **OBU (On-Board Unit):** hardware installed in each vehicle enabling communication with roadside units and other OBUs.
  - **RSU (Road-Side Unit):** fixed units alongside roads that establish vehicle-to-infrastructure communication.
  - **TA (Trusted Authority):** central authority responsible for security management and issuing credentials/certificates.
- **Importance:** traffic safety (real-time alerts: forward-collision, lane-change, road-condition warnings), traffic optimization (smart intersection management, congestion reduction), information services (navigation, weather, infotainment), and support for autonomous driving via real-time information exchange.
- **Distinctive features (vs. other wireless networks):** high mobility (high-speed nodes), frequent topology changes, unlimited computational resources (unlike sensor networks, vehicles have no energy limits), low latency (real-time safety services), and data security (data must be encrypted and protected from tampering).
- **Communication types (V2X):** V2V (vehicle-to-vehicle), V2I (vehicle-to-infrastructure), V2P (vehicle-to-pedestrian), V2C (vehicle-to-cloud), V2U (vehicle-to-UAV), V2N (vehicle-to-network). Illustrated in Figure 1 (VANET architecture).

## 5. Limitations & Challenges

- **Networking challenges:**
  - Frequent network fragmentation — high node density and mobility cause connections to repeatedly drop/reconnect.
  - Routing difficulties — finding suitable paths in dynamic networks.
  - Spectrum scarcity — the V2V/V2I DSRC standard has reliability and scalability problems.
  - Environmental effects — buildings, vehicles, and trees disrupt signals.
- **Resource management challenges:**
  - Shared resources — bandwidth channels and RSUs must be optimally managed.
  - Radio resource allocation — MAC access-control techniques needed for fair channel access.
  - Deployment cost — significant investment required for VANET infrastructure.
- **Scalability challenges:** growing number of connected vehicles requires managing huge data volumes; smart vehicles generate up to thousands of gigabytes per day; real-time processing needs substantial computational resources.
- **Standardization challenges:** lack of unified standards; diversity of communication technologies (DSRC, LTE, 5G) requiring interoperability; need for common message-exchange and authentication standards; international challenges in integrating different systems.

## 6. Security Problems

- **Threat model:** VANETs are vulnerable to many security attacks; threat analysis shows balancing effective threat reduction with minimal impact on system performance is crucial.
- **Attacks on infrastructure:**
  - **Denial of Service (DoS):** flooding RSUs with superfluous information to prevent correct operation.
  - **Impersonation:** attackers posing as OBUs or RSUs.
  - **Eavesdropping:** unauthorized access to private information.
- **Attacks on privacy:**
  - **Identity disclosure:** breaching the identity information of vehicle occupants.
  - **Location tracking:** attacker tracks a vehicle's position and route.
- **Attacks on data trust:**
  - **Message tampering:** altering, deleting, or modifying data in transit.
  - **Forgery attacks:** producing false/fabricated information.
  - **Sybil attacks:** one node creating multiple identities.
- **Security requirements:** availability (timely communication), confidentiality (encryption and protection), authentication (distinguishing legitimate entities from malicious ones), integrity (timely verification of data), privacy (protecting users' personal information), trust (assurance between entities for secure data transfer).
- **RAISE scheme (RSU-Aided):** RSUs verify the authenticity of messages from vehicles and notify results back; better performance than previous methods in message-loss ratio and delay. Uses **k-anonymity** so an attacker cannot link a specific message to a specific vehicle.
- **Role of AI/ML in security:**
  - Anomaly detection using CNN and LSTM neural networks for unusual behavior.
  - Unsupervised learning to detect wireless jamming attacks.
  - Unsupervised learning to detect attacks on the car's internal network.
  - Vulnerability detection by analyzing live network traffic.
  - Federated learning — combining blockchain and federated learning for secure privacy-preserving information transfer.
  - Fuzzy logic — computing trust for the accuracy and integrity of event messages.
  - Reinforcement learning — evaluating the reliability of autonomous-driving vehicles.

## 7. Blockchain Overview

- **Definition:** a decentralized, distributed digital ledger recording transactions securely and transparently; each block contains the hash of the previous block, forming a chain.
- **Six layers:** data layer (block/transaction structure), network layer (peer-to-peer communication), consensus layer (transaction verification mechanisms), incentive layer (rewards/incentives), contract layer (smart contracts), application layer (applications).
- **Consensus mechanisms (Table):**
  | Algorithm | Key feature | Energy | Scalability |
  |---|---|---|---|
  | PoW | computational puzzle | very high | low |
  | PoS | based on economic stake | low | medium |
  | DPoS | vote per share | low | high |
  | PBFT | polynomial complexity | low | medium |
- **Blockchain challenges:** design complexity; privacy/security issues (51% attacks, wallet problems); consensus protocol (balancing security, scalability, energy efficiency); interoperability with existing systems; scalability (limited transactions per second); energy consumption (high computation cost).

## 8. Blockchain as a Solution for VANET

- **Benefits:** decentralization (removes single point of failure, increases security/resilience), immutability (data cannot be altered or tampered with), traceability (full transaction history prevents data misuse), transparency (transparent recording), smart contracts (automated execution of security policies).
- **Applications:** security enhancement (verifying the validity of broadcast messages between vehicles), privacy (public-key encryption protecting sensitive data), trust management (storing trust values on-chain), identity management (decentralized key and certificate management), vehicle tracking/auditing (preventing odometer tampering).
- **Trust management models:** recommendation-based (based on others' recommendations), prediction-based (based on behavioral patterns), reputation-based (based on performance history), policy-based (based on rules and regulations).

## 9. Blockchain Problems & Solutions

- **Limitations of traditional blockchains in VANETs:** low scalability (limited TPS — Bitcoin: 7, Ethereum: 15), high energy consumption (PoW requires significant computation), high latency (confirmation time unsuitable for real-time applications), transaction fees (a fee per transaction), storage limitations (large data volumes on-chain).
- **Existing solutions:** sharding (partitioning the network into smaller segments for scalability), alternative consensus algorithms (PoS, DPoS, PBFT instead of PoW), sidechains (offloading the main network), scalability layers such as the Lightning Network.
- **SBTMS (Scalable Blockchain Trust Management System):**
  - Decentralized architecture built on blockchain.
  - Sharding algorithm for scalability.
  - Bayesian inference to compute trust via Bayesian formulas.
  - PBFT (Practical Byzantine Fault Tolerance) protocol.
  - Simulation results: the sharding algorithm increases block-generation time **near-linearly**, whereas **PoW scales exponentially**.

## 10. IOTA Tangle

- **Concept:** a Distributed Ledger Technology (DLT) based on a Directed Acyclic Graph (DAG). Unlike blockchains (a chain of blocks), each new transaction references **two previous transactions**. Figure compares Tangle with traditional blockchain.
- **Key features of Tangle V2.0:** high scalability (network grows stronger and confirmations get faster with more transactions), **fee-less** transactions, decentralized consensus via the **FPC** protocol (removing the centralized coordinator), smart contracts via **ISCP**, and efficient/secure **Ed25519** signatures.
- **Comparison table vs blockchain:** structure (chain of blocks vs DAG), fees (high vs none), TPS (low 7–15 vs high/scalable), energy (high vs low), miners (required vs not required).
- **Three-layer architecture (V2.0):** network layer (byte-level operations, peer-to-peer exchange), communication layer (message management, tip selection, rate control), application layer (message payload execution and consensus execution).
- **VANET applications:** secure storage of vehicle reputation scores; fee-less transactions for cost-free information exchange; fast confirmation for real-time applications; hardware security via Ed25519 signatures.

## 11. Self-Sovereign Identity (SSI)

- **Identity management definition:** the process of identifying, authenticating, and managing user access to systems and services; in VANETs it plays a vital role in security and privacy.
- **Evolution of identity management:** centralized (1988–1998, single-authority control), federated (1998–2005, single sign-on across services), user-centric (2005–2012, user-managed identity), self-sovereign (2012–present, full user control over own data).
- **Pseudonym definition:** a temporary, unlinkable identifier used in place of real identity, letting vehicles participate without revealing their real identity.
- **Pseudonym life cycle:** issuance (generating secure cryptographic aliases), usage (in V2V and V2I communications), changing (periodic change to prevent tracking), resolution (lawful authorities reveal real identity), revocation (blocking malicious vehicles).
  - **Statistic:** only **12%** of surveyed schemes implement the full pseudonym life cycle (per the Rahmawati Agustina et al. 2025 SLR: 71% of primary studies used standard VANET system models, 12% implemented a comprehensive pseudonym life cycle, 73% performed formal+informal analyses).
- **Why SSI emerged:** single point of failure (centralized systems vulnerable to attacks), privacy breaches (common in centralized systems), limited user control over data, growing privacy concerns.
- **DIDs (Decentralized Identifiers):** globally unique identifiers working without a central authority (example: `did:example:123456789abcdefghi`).
  - **DID architecture:** the DID itself (globally unique identifier), DID document (JSON-LD document with public keys and service endpoints), DID method (how a DID is created, resolved, updated, deactivated), verifiable data registry (repository storing DID documents).
  - **DID types:** Anywise (usable with unspecified parties), Pairwise (known only to the person and one other party), N-wise (known to exactly N parties).
- **DIVA system:** a DID-based reputation system for secure VANET transmission using IOTA Tangle — vehicles identified via DIDs, reputation scores stored securely on the Tangle, computed from safety and non-safety messages.
- **Verifiable Credentials (VCs):** cryptographically secured, immutable electronic credentials standardized by **W3C**. Main actors: **Holder** (controls the credential), **Issuer** (trusted entity issuing it), **Verifier** (entity needing the credential).
- **Security problems solved by DID/SSI:** single point of failure (removing the central authority), privacy violations (DIDs as pseudonyms + selective disclosure), certificate management (no complex certificate management), impersonation attacks (cryptographic authentication), Sybil attacks (one DID per vehicle).
- Other motivations in VANETs: decentralized authentication, privacy via DIDs as pseudonyms, conditional traceability (real identity revealable when needed), decentralized reputation management.

## 12. Existing Authentication Schemes

- **PCS (Pseudonym Changing at Social Spots):** vehicles change pseudonyms at social spots where many vehicles gather (e.g., red-light intersections, free parking lots). Simultaneous changing increases privacy.
- **SRPS (Safety-Related Privacy Scheme):** balances privacy and safety — vehicle exits silent period if an accident is predicted; intelligent pseudonym changing via multi-target tracking. Maintains safety with nearly **10 safety messages/sec** and reduces tracking by **up to 20% at high density**.
- **DIVA:** DID + IOTA Tangle reputation system; uses DIDs to identify vehicles, stores reputation in the Tangle, computes scores from safety/non-safety messages, accurately identifies malicious contributors with roughly **90% accuracy**.
- **BPAS (Blockchain-Assisted Privacy-Preserving Authentication System):** no online registration center (only at setup/registration), conditional tracking of malicious vehicles, dynamic revocation of violators, implemented on **Hyperledger Fabric** (high performance, scalable).
- **BAIV (Blockchain-Based Anonymous Authentication and Integrity Preservation):** authentication without a trusted authority, conditional privacy (revoking malicious vehicles in disputes), message-integrity preservation (prevents tampering), high efficiency via elliptic-curve cryptography.
- **GSIS (Secure and Privacy-Preserving Protocol):** combines **group signature** and **identity-based signature**; conditional privacy with traceability when needed; anonymous message sending; simplifies certificate management (any string can serve as a valid public key).

## 13. Conclusion

**Six main findings:**
1. VANETs play a vital role in improving traffic safety and reducing accidents, but their wireless nature creates multiple security vulnerabilities.
2. Security attacks — message forgery, Sybil, man-in-the-middle, and privacy violations — are among the most important challenges.
3. Blockchain, with decentralization, immutability, and transparency, can solve many VANET security problems.
4. DID and Verifiable Credential technologies offer novel decentralized identity management and privacy-preservation solutions.
5. IOTA Tangle, as a scalable, fee-less alternative to traditional blockchains, resolves scalability and energy-consumption problems.
6. Balancing privacy and safety is one of the most important design challenges for VANET security systems.

**Future research directions:** developing complete pseudonym life-cycle frameworks; hybrid architectures (blockchain + cloud + edge); quantum-cryptography readiness; formal privacy-analysis methods.

## 14. Bibliography / Cited Sources (from `\cite` commands and `report.bib`)

21 entries in `report.bib`:

| Key | Work (author, year) |
|---|---|
| `al-aniPrivacySafetyImprovement2023` | Al-ani et al., 2023, Privacy and Safety Improvement of VANET Data via a Safety-Related Privacy Scheme |
| `farsimadanReviewSecurityChallenges2025` | Farsimadan, Moradi, Palmieri, 2025, A Review on Security Challenges in V2X Communications Technology for VANETs (IEEE Access) |
| `fengBPASBlockchainAssistedPrivacyPreserving2020` | Feng et al., 2020, BPAS: Blockchain-Assisted Privacy-Preserving Authentication System for VANETs (IEEE TII) |
| `feraudoDIVADIDbasedReputation2024` | Feraudo et al., 2024, DIVA: A DID-based Reputation System for Secure Transmission in VANETs Using IOTA |
| `ghovanlooyghajarSBTMSScalableBlockchain2021` | Ghovanlooy Ghajar et al., 2021, SBTMS: Scalable Blockchain Trust Management System for VANET (Applied Sciences) |
| `hozouriOverviewVANETVehicular2023` | Hozouri et al., 2023, An Overview of VANET Vehicular Networks (arXiv) |
| `IOTATANGLE20` | Fartitchou et al., 2023, IOTA TANGLE 2.0: An Overview (EDPACS) |
| `linGSISSecurePrivacyPreserving2007` | Lin et al., 2007, GSIS: A Secure and Privacy-Preserving Protocol for Vehicular Communications (IEEE TVT) |
| `luConnectedVehiclesSolutions2014` | Lu et al., 2014, Connected Vehicles: Solutions and Challenges (IEEE IoT Journal) |
| `luPseudonymChangingSocial2012` | Lu et al., 2012, Pseudonym Changing at Social Spots (IEEE TVT) |
| `mariaBAIVEfficientBlockchainBased2022` | Maria et al., 2022, BAIV: An Efficient Blockchain-Based Anonymous Authentication and Integrity Preservation Scheme (Electronics) |
| `mazzocca2025survey` | Mazzocca et al., 2025, A Survey on Decentralized Identifiers and Verifiable Credentials (IEEE COMST) |
| `niSecuringFogComputing2018` | Ni et al., 2018, Securing Fog Computing for IoT Applications (IEEE COMST) |
| `rahmawatiagustinaSystematicLiteratureReview2025` | Rahmawati Agustina et al., 2025, A Systematic Literature Review on Privacy Preservation in VANETs (IEEE Access) |
| `razaBlockchainBasedReputationTrust2024` | Raza et al., 2024, Blockchain-Based Reputation and Trust Management for Smart Grids, Healthcare, and Transportation (IEEE Access) |
| `sealeyIOTATangle202022` | Sealey, Aijaz, Holden, 2022, IOTA Tangle 2.0: Toward a Scalable, Decentralized, Smart, and Autonomous IoT Ecosystem (SmartNets) |
| `SecuringVehicularAd` | Raya, Hubaux, 2007, Securing Vehicular Ad Hoc Networks (Journal of Computer Security) |
| `silvanoIotaTangleCryptocurrency2020` | Silvano, Marcelino, 2020, Iota Tangle: A Cryptocurrency to Communicate Internet-of-Things Data (FGCS) |
| `VanetSecurityPrivacy` | Mansour et al., 2018, VANET Security and Privacy — An Overview |
| `xuInternetVehiclesBig2018` | Xu et al., 2018, Internet of Vehicles in Big Data Era (IEEE/CAA JAS) |
| `zhangRAISEEfficientRSUAided2008` | Zhang, Lin, Lu, Ho, 2008, RAISE: An Efficient RSU-Aided Message Authentication Scheme (IEEE ICC) |

**Faithful-translation notes:** All Persian content above is translated from the .tex. Where the source is terse (e.g., "امضای Ed25519" listed under Tangle applications as "hardware security"), the summary keeps the report's own framing. The date "مرداد ۱۴۰۵" is reported as stated in the file. No facts were added beyond what the .tex and report.bib contain.
