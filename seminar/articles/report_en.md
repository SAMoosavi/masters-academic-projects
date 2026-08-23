# Privacy and Security in Vehicular Ad-hoc Networks (VANET)

**Seminar Report — M.Sc. Program**
**Department of Computer Engineering, Amirkabir University of Technology (Tehran Polytechnic)**

- Student: Seyed Ali Mousavi
- Supervisor: Dr. Babak Sadeghian
- Seminar Instructor: Dr. Reza Safabakhsh
- Date: Mordad 1405 (July–August 2026)

---

## Abstract

Vehicular Ad-hoc Networks (VANETs), as part of Intelligent Transportation Systems (ITS), enable the exchange of information between vehicles and roadside infrastructure and play a critical role in improving traffic safety and reducing accidents. However, the wireless and open nature of these networks makes them vulnerable to various security attacks, such as message forgery attacks, Sybil attacks, man-in-the-middle attacks, and privacy violations. In this report, the architecture and characteristics of VANETs are first examined, and then the existing security challenges in these networks are analyzed. Blockchain technology is introduced as a decentralized solution to the trust and security problems of VANETs, and its limitations in this domain are reviewed. IOTA Tangle is discussed as a scalable and fee-less alternative to traditional blockchains. Finally, identity management concepts — pseudonyms, Self-Sovereign Identity (SSI), and Decentralized Identifiers (DID) — are presented as modern solutions to security and privacy problems in VANETs. The role of artificial intelligence methods in strengthening VANET security is also given special attention.

---

## 1. Introduction

A Vehicular Ad-hoc Network (VANET) is one of the most important technologies in the field of Intelligent Transportation Systems. By enabling the exchange of information between vehicles and roadside infrastructure, these networks play a very important role in improving traffic safety, reducing accidents, and increasing transportation efficiency [1].

According to World Health Organization statistics, more than 1.19 million people die in road traffic accidents every year, and road traffic accidents are the leading cause of death for children and young people aged 5–29 [2]. More than 92% of accidents are attributed to human error [1]. In this regard, VANETs, with their ability to provide real-time safety warnings and traffic information, have great potential to reduce these figures.

However, the wireless and open nature of VANET communications makes these networks vulnerable to various security threats. Message forgery attacks, Sybil attacks, man-in-the-middle attacks, and privacy violations are among the most important security challenges in this domain [2][3].

In recent years, blockchain technology has attracted attention as a decentralized solution to the trust and security problems of VANETs [4][5]. However, traditional blockchains also have limitations such as low scalability and high energy consumption, for which IOTA Tangle has been introduced as an appropriate alternative [6][7].

Moreover, identity management and privacy preservation are among the most important concerns of VANET users. Modern technologies such as Self-Sovereign Identity (SSI), Decentralized Identifiers (DID), and Verifiable Credentials (VC) have been proposed as solutions to identity management and pseudonymity problems in VANETs [8][9].

This report aims to provide a comprehensive review of security challenges in VANETs and the available solutions. In the following, the concept of VANET and its importance are first presented, then the existing limitations and challenges are examined, and finally blockchain-based solutions, IOTA Tangle, and identity management are discussed.

---

## 2. What is a Vehicular Ad-hoc Network?

### 2.1 Definition and Concept

A VANET is a subset of Mobile Ad-hoc Networks (MANET) that facilitates communication between nearby vehicles and between vehicles and infrastructure [1]. In these networks, vehicles act as mobile nodes and share safety and traffic information with each other [10]. Connected vehicles, through their ability to communicate with their internal and external environment, have become an inseparable part of modern life, and the global connected-vehicle market was projected to reach $131.9 billion by 2019 [11].

Figure 1 shows the general architecture of a VANET and the types of vehicle-to-everything (V2X) communications, including Vehicle-to-Vehicle (V2V), Vehicle-to-Infrastructure (V2I), Vehicle-to-Pedestrian (V2P), Vehicle-to-Cloud (V2C), Vehicle-to-UAV (V2U), and Vehicle-to-Network (V2N).

*(Figure 1: VANET architecture and the types of communications of a vehicle with each entity)*

### 2.2 Main Components of a VANET

The main components of a VANET are:

- **On-Board Units (OBU):** hardware installed in each vehicle that enables communication with roadside units and other on-board units [1].
- **Road-Side Units (RSU):** fixed units installed beside roads that establish communication between vehicles and the infrastructure [1].
- **Trusted Authority (TA):** the central authority responsible for security management and issuing credentials [12].

### 2.3 The Importance of VANETs

The importance of VANETs can be examined from various aspects:

- **Traffic safety:** providing real-time safety warnings such as forward-collision warning, lane-change warning, and road-condition warning [1].
- **Traffic optimization:** intelligent intersection management, congestion reduction, and improved traffic flow [10].
- **Information services:** providing navigation information, weather conditions, and entertainment services [1].
- **Autonomous vehicles:** supporting automated driving through real-time information exchange [10].

### 2.4 Distinctive Characteristics of VANETs

VANETs have unique characteristics that distinguish them from other wireless networks [1]:

- **High mobility:** nodes can move at high speeds.
- **Frequent topology changes:** the network structure changes continuously.
- **Unlimited computational resources:** unlike sensor networks, vehicles do not have energy limitations.
- **Low latency:** real-time communication is essential for safety services.
- **Data security:** data must be encrypted and protected from modification.

---

## 3. Limitations and Challenges

### 3.1 Networking Challenges

VANETs face numerous networking challenges [1]:

- **Frequent network fragmentation:** high density and mobility of nodes cause frequent connection interruptions.
- **Routing problems:** finding suitable routes for message delivery in dynamic networks is difficult.
- **Spectrum shortage:** the DSRC standard has reliability and scalability problems.
- **Environmental effects:** buildings, vehicles, and trees can disrupt signals.

### 3.2 Resource Management Challenges

Resource management in VANETs faces the following challenges [1][13]:

- **Shared resources:** bandwidth channels and roadside units are shared resources that must be managed optimally.
- **Radio resource allocation:** Medium Access Control (MAC) techniques are essential to guarantee fair channel access.
- **Deployment cost:** deploying VANET infrastructure requires significant investment.

### 3.3 Scalability Challenges

Scalability is one of the most important VANET challenges [10]:

- Increasing the number of connected vehicles requires managing a huge volume of data.
- The data volume generated by smart vehicles reaches thousands of gigabytes per day.
- Real-time processing of this data volume requires significant computational resources.

### 3.4 Standardization Challenges

The lack of unified standards is another important challenge [2]:

- The diversity of communication technologies (DSRC, LTE, 5G) and the need for interoperability between them.
- The need for common standards for message exchange and identity authentication.
- International challenges in integrating different systems.

---

## 4. Security Problems

### 4.1 Threat Model

VANETs are vulnerable to various security attacks. Based on studies, threat and security-architecture analyses of VANETs show that maintaining a balance between effectively reducing threats and minimizing the impact on system performance is of great importance [14][2][3][15].

### 4.2 Attacks on Infrastructure

- **Denial-of-Service (DoS) attacks:** saturating roadside units with redundant information to prevent correct operation.
- **Impersonation:** attackers pretend to be on-board units or roadside units.
- **Eavesdropping:** unauthorized access to private information.

### 4.3 Attacks on Privacy

- **Identity disclosure:** violating the identity information of vehicle occupants.
- **Location tracking:** tracking the position and route of a vehicle by an attacker.

### 4.4 Attacks on Data Trust

- **Message tampering:** changing, deleting, or modifying data during transmission.
- **Forgery attacks:** producing false or fabricated information.
- **Sybil attacks:** creating multiple identities by a single node.

### 4.5 Security Requirements

To guarantee VANET security, the following requirements must be met [2][3]:

- **Availability:** communications must be available to intended recipients in a timely manner.
- **Confidentiality:** data must be encrypted and protected.
- **Authentication:** distinguishing between valid entities and malicious elements.
- **Integrity:** data must be verified in a timely manner.
- **Privacy:** protecting users' personal information.
- **Trust:** confidence between entities for secure data transmission.

One solution for ensuring security in VANETs is RSU-based message authentication systems. The RAISE scheme uses roadside units to verify the authenticity of messages sent by vehicles and informs vehicles of the results, providing better performance than previous methods in terms of message-loss ratio and delay [16]. Furthermore, this scheme uses a k-anonymity approach to protect the privacy of user identity, so that an attacker cannot link a particular message to a specific vehicle [16].

### 4.6 The Role of Artificial Intelligence in Strengthening Security

Artificial intelligence and machine learning methods play an important role in strengthening VANET security [2]:

- **Anomaly detection:** using CNN and LSTM neural networks to identify abnormal behaviors.
- **Wireless attack detection:** using unsupervised learning to identify jamming attacks.
- **Vehicle attack detection:** using unsupervised learning to detect attacks on the vehicle's internal network.
- **Vulnerability detection:** analyzing live network traffic to identify vulnerabilities.
- **Federated learning:** combining blockchain and federated learning for secure, privacy-preserving information transmission.
- **Fuzzy logic:** computing trust for the accuracy and integrity of event messages.
- **Reinforcement learning:** evaluating the reliability of automated-driving vehicles.

---

## 5. Blockchain Overview

### 5.1 Definition and Concept

A blockchain is a decentralized, distributed digital ledger that records transactions securely and transparently [4][1]. Each block contains the hash of the previous block, creating a chain of blocks [4].

### 5.2 Blockchain Layers

Blockchain architecture consists of six main layers [4]:

1. **Data layer:** the structure of blocks and transactions.
2. **Network layer:** peer-to-peer communications.
3. **Consensus layer:** transaction verification mechanisms.
4. **Incentive layer:** rewards and incentives.
5. **Contract layer:** smart contracts.
6. **Application layer:** applications.

*(Figure 2: The general structure of a blockchain: a chain of blocks, each block's hash linking to the previous block)*

### 5.3 Consensus Mechanisms

Consensus mechanisms play a vital role in blockchain operation [4]:

| Algorithm | Key feature | Energy consumption | Scalability |
|---|---|---|---|
| PoW | Computational puzzle | Very high | Low |
| PoS | Based on economic stake | Low | Medium |
| DPoS | Voting per share | Low | High |
| PBFT | Polynomial complexity | Low | Medium |

### 5.4 Blockchain Challenges

Blockchain technology faces several challenges [4]:

- **Design complexity:** the complex structure of blockchain.
- **Privacy and security:** 51% attacks, wallet problems.
- **Consensus protocol:** balancing security, scalability, and energy efficiency.
- **Interoperability:** integration with existing systems.
- **Scalability problem:** limits on transactions per second.
- **Energy consumption:** high computation cost.

---

## 6. Blockchain: A Good Solution

### 6.1 Benefits of Blockchain in VANETs

With its unique characteristics, blockchain can solve many VANET problems [4][5][17]:

- **Decentralization:** removing the single point of failure and increasing security and resilience.
- **Immutability:** data cannot be changed or tampered with.
- **Traceability:** preventing misuse of data through a complete transaction history.
- **Transparency:** transparent recording of transactions.
- **Smart contracts:** automatic execution of security policies.

### 6.2 Blockchain Applications in VANETs

Blockchain is used in various VANET domains [4][1]:

- **Security enhancement:** determining the validity of messages broadcast between vehicles.
- **Privacy:** public-key encryption to protect sensitive data.
- **Trust management:** storing trust values on the blockchain.
- **Identity management:** decentralized management of keys and certificates.
- **Vehicle tracking:** preventing odometer tampering.

### 6.3 Trust Management Models

Blockchain enables decentralized trust management models [4][17]:

- **Recommendation-based trust:** based on the recommendations of other entities.
- **Prediction-based trust:** based on behavioral patterns.
- **Reputation-based trust:** based on performance history.
- **Policy-based trust:** based on rules and regulations.

---

## 7. Blockchain Problems and Solutions

### 7.1 Blockchain Limitations

Despite its many benefits, traditional blockchains have limitations in the VANET domain [4][6]:

- **Low scalability:** limited transactions per second (Bitcoin: 7, Ethereum: 15).
- **High energy consumption:** the proof-of-work algorithm requires significant computational resources.
- **High latency:** transaction confirmation time is not suitable for real-time applications.
- **Transaction cost:** a fee is charged for each transaction.
- **Storage limitation:** the large data volume needed for storage on the blockchain.

### 7.2 Existing Solutions

Various solutions have been proposed to overcome blockchain limitations in VANETs [17][4]:

- **Sharding:** dividing the network into smaller segments to increase scalability.
- **Alternative consensus algorithms:** using PoS, DPoS, and PBFT instead of PoW.
- **Sidechains:** using sidechains to reduce the load on the main network.
- **Scaling layers:** using scaling layers such as the Lightning Network.

### 7.3 Scalable Blockchain Trust Management System (SBTMS)

SBTMS is one of the modern solutions to blockchain problems in VANETs [17]:

- **Decentralized architecture:** using blockchain to create a decentralized platform.
- **Sharding algorithm:** dividing the network into smaller segments for scalability.
- **Bayesian inference:** computing trust based on Bayesian formulas.
- **PBFT protocol:** Practical Byzantine Fault Tolerance protocol.

SBTMS simulation results show that the sharding algorithm increases block-generation time almost linearly, whereas with the PoW algorithm this time increases exponentially [17].

---

## 8. What is IOTA Tangle?

### 8.1 The Concept of IOTA Tangle

IOTA Tangle is a Distributed Ledger Technology (DLT) designed based on a Directed Acyclic Graph (DAG) structure [6][7]. Unlike traditional blockchains that use a chain of blocks, IOTA Tangle uses a Tangle structure in which each new transaction references two previous transactions [7].

*(Figure 3: Visual comparison of IOTA Tangle with a traditional blockchain — a blockchain is a chain of blocks placed sequentially, whereas in the IOTA Tangle the transactions are placed beside each other as a directed acyclic graph)*

### 8.2 Key Features of IOTA Tangle V2.0

IOTA Tangle V2.0 provides important features [6][18]. By removing the centralized coordinator and introducing new consensus protocols, this version has achieved real scalability and decentralization [18]:

- **High scalability:** as transactions increase, the network becomes stronger and confirmations become faster.
- **No fees:** transactions are performed without any cost.
- **Decentralized consensus:** using the FPC protocol.
- **Smart contracts:** supporting smart contracts through ISCP.
- **Ed25519 signatures:** using an efficient and secure signature scheme.

### 8.3 How the Problems Are Solved

IOTA Tangle solves the main blockchain problems in VANETs as follows [6][7]:

| Feature | Blockchain | IOTA Tangle |
|---|---|---|
| Structure | Chain of blocks | Directed Acyclic Graph |
| Fees | High | No fees |
| TPS | Low (7–15) | High and scalable |
| Energy consumption | High | Low |
| Miners | Required | Not required |

### 8.4 IOTA Tangle V2.0 Architecture

The IOTA Tangle V2.0 protocol architecture consists of three main layers [6]:

1. **Network layer:** managing byte-level operations and peer-to-peer exchanges.
2. **Communication layer:** managing messages, tip selection, and rate control.
3. **Application layer:** executing message payloads and running consensus.

### 8.5 IOTA Tangle Applications in VANETs

IOTA Tangle has the following applications in VANETs [9][7]:

- **Storing reputation scores:** securely storing vehicle reputation scores.
- **Fee-less transactions:** enabling information exchange without cost.
- **Fast confirmation:** rapid transaction confirmation for real-time applications.
- **Hardware security:** using Ed25519 signatures for high security.

---

## 9. Self-Sovereign Identity

### 9.1 What is Identity Management?

Identity management is the process of identifying, authenticating, and managing users' access to systems and services [8]. In VANETs, identity management plays a vital role in guaranteeing security and privacy.

### 9.2 The Evolution of Identity Management

Identity management has evolved over time [8]:

1. **Centralized identity (1988–1998):** central control by a single authority.
2. **Federated identity (1998–2005):** single sign-on across different services.
3. **User-centric identity (2005–2012):** independent management of identity by the user.
4. **Self-Sovereign Identity (2012–present):** complete user control over their own data.

### 9.3 What is a Pseudonym?

A pseudonym is a temporary, unlinkable identifier used instead of the real identity [12][19]. Using pseudonyms allows vehicles to participate in the network without disclosing their real identity.

### 9.4 The Pseudonym Life Cycle

The pseudonym life cycle consists of the following stages [12]:

1. **Issuance:** generating secure encrypted pseudonyms.
2. **Usage:** using them in V2V and V2I communications.
3. **Changing:** periodically changing the pseudonym to prevent tracking.
4. **Resolution:** identifying the real identity by legal authorities.
5. **Revocation:** blocking malicious vehicles.

According to studies, only 12% of schemes have implemented all the stages of the pseudonym life cycle [12].

### 9.5 What is Self-Sovereign Identity and Why Has It Emerged?

Self-Sovereign Identity is a modern identity management approach that gives users complete control over their personal data [8]. SSI is built on distributed ledger technologies, Decentralized Identifiers, and Verifiable Credentials.

*(Figure 4: Comparison of centralized identity management architecture and Self-Sovereign Identity)*

The reasons for the emergence of SSI are:

- **Single point of failure:** centralized systems are vulnerable to attacks.
- **Privacy violations:** data breaches are common in centralized systems.
- **Limited user control:** users have limited control over their data.
- **Need for privacy:** growing concerns about data privacy.

### 9.6 What are Decentralized Identifiers and Why Have They Emerged?

Decentralized Identifiers (DIDs) are globally unique identifiers that operate without a central authority [8]. Example:

```
did:example:123456789abcdefghi
```

#### 9.6.1 DID Architecture

The DID architecture includes the following components [8]:

- **DID:** a globally unique identifier.
- **DID document:** a JSON-LD document containing public keys and service endpoints.
- **DID method:** specifies how a DID is created, resolved, updated, and deactivated.
- **Verifiable data registry:** the repository storing DID documents.

#### 9.6.2 Types of DIDs

- **Anywise DIDs:** usable with unspecified parties.
- **Pairwise DIDs:** known only by a person and one other party.
- **N-wise DIDs:** known by exactly N parties.

*(Figure 5: The DIVA system architecture — a DID-based reputation system for secure transmission in VANETs using IOTA Tangle)*

Figure 5 shows the architecture of the DIVA system, which uses DIDs to identify vehicles and IOTA Tangle to securely store reputation scores. In this system, vehicles are identified using DIDs, and their reputation scores are computed based on safety and non-safety messages [9].

### 9.7 Verifiable Credentials

Verifiable Credentials are encrypted, immutable electronic documents standardized by the W3C [8].

The main actors of Verifiable Credentials are:

- **Holder:** the entity that controls the Verifiable Credential.
- **Issuer:** the trusted entity that issues the Verifiable Credential.
- **Verifier:** the entity that requires the Verifiable Credential.

### 9.8 Why SSI and DIDs Are Proposed in VANETs

SSI and DID technologies are proposed to solve security and privacy problems in VANETs [8][9]:

- **Decentralized authentication:** eliminating the need for a central authority.
- **Privacy preservation:** using DIDs as pseudonyms.
- **Conditional traceability:** the ability to identify the real identity when needed.
- **Reputation management:** storing reputation scores in a decentralized manner.

### 9.9 Security Problems Solved by DIDs and SSI

DID and SSI technologies solve the following problems in VANETs [8][9]:

- **Single point of failure:** removing the central authority using DIDs.
- **Privacy violations:** using DIDs as pseudonyms and selective disclosure.
- **Certificate management:** eliminating the need for complex certificate management.
- **Impersonation attacks:** cryptography-based identity authentication.
- **Sybil attacks:** one DID per vehicle.

---

## 10. Existing Authentication Schemes

### 10.1 Solving the Pseudonym Problem in VANETs

The pseudonym is one of the most important challenges in VANET privacy preservation [19][20][12]. Available solutions include:

#### 10.1.1 Pseudonym Changing at Social Spots (PCS)

The PCS approach proposes that vehicles change their pseudonyms at social spots [19]:

- Social spots are locations where several vehicles gather.
- Such as red-light intersections or free parking lots.
- By changing pseudonyms simultaneously at these points, privacy is increased.

#### 10.1.2 Safety-Related Privacy Scheme (SRPS)

The SRPS scheme creates a balance between privacy and safety [20]:

- **Reducing silent periods:** the vehicle exits silence if an accident is predicted.
- **Smart pseudonym changing:** using a multi-objective tracking algorithm.
- **Preserving safety:** close to 10 safety messages per second.
- **Reducing tracking:** up to 20% in high density.

#### 10.1.3 DID-based Reputation System (DIVA)

The DIVA system combines DIDs and IOTA Tangle for reputation management in VANETs [9]:

- Using DIDs to identify vehicles.
- Storing reputation scores on IOTA Tangle.
- Computing reputation scores based on safety and non-safety messages.
- Accurate identification of malicious contributors with approximately 90% accuracy.

### 10.2 Blockchain-Based Security Protocols

Several blockchain-based security protocols have been proposed for VANETs:

#### 10.2.1 Blockchain-Assisted Privacy-Preserving Authentication System (BPAS)

The BPAS system provides a novel framework for decentralized authentication in VANETs [5]:

- **No online registration center required:** only during the setup phase.
- **Conditional traceability:** the ability to identify malicious vehicles.
- **Dynamic revocation:** revoking access of offending vehicles.
- **Implemented on Hyperledger Fabric:** high performance and scalability.

#### 10.2.2 Blockchain-Based Anonymous Authentication and Integrity Preservation (BAIV)

The BAIV scheme combines anonymous authentication and message integrity preservation [21]:

- **Secure transmission:** authentication without a trusted authority.
- **Conditional privacy:** revoking malicious vehicles in case of disputes.
- **Integrity preservation:** preventing message tampering.
- **High efficiency:** using elliptic-curve cryptography.

#### 10.2.3 Secure and Privacy-Preserving Protocol (GSIS)

The GSIS protocol combines group signatures and identity-based signatures [15]:

- **Conditional privacy:** preserving privacy with the ability to trace when needed.
- **Anonymous authentication:** sending messages anonymously.
- **Simplified certificate management:** using any string as a valid public key.

---

## 11. Conclusion

In this report, security challenges and solutions in VANETs were comprehensively examined. The main findings of this study are:

1. VANETs play a vital role in improving traffic safety and reducing accidents, but their wireless nature creates numerous security vulnerabilities.
2. Security attacks, including message forgery attacks, Sybil attacks, man-in-the-middle attacks, and privacy violations, are among the most important security challenges in this domain.
3. Blockchain technology, with its decentralization, immutability, and transparency features, can solve many of the security problems of VANETs.
4. DID and Verifiable Credential technologies offer novel solutions for decentralized identity management and privacy preservation in VANETs.
5. IOTA Tangle, as a scalable and fee-less alternative to traditional blockchains, resolves the scalability and energy-consumption problems.
6. The balance between privacy and safety is one of the most important design challenges of VANET security systems.

Future research in this field should focus on developing complete pseudonym life-cycle frameworks, hybrid architectures (blockchain + cloud + edge), quantum cryptography readiness, and formal privacy analysis methods.

---

## References

*(Bibliography as in report.bib, IEEE style, cited in text as [1]–[21]):*

1. Hozouri et al., "An overview of VANET vehicular networks," 2023.
2. Farsimadan, Moradi & Palmieri, "A Review on Security Challenges in V2X Communications Technology for VANETs," IEEE Access, vol. 13, 2025.
3. Syla, Lala & Biberaj, "Vanet Security and Privacy – an Overview," EIRP Proceedings, 2024.
4. Raza et al., "Blockchain-Based Reputation and Trust Management for Smart Grids, Healthcare, and Transportation," 2024.
5. Feng et al., "BPAS: Blockchain-Assisted Privacy-Preserving Authentication System for Vehicular Ad Hoc Networks," 2020.
6. "IOTA Tangle 2.0 — An Overview."
7. Silvano & Marcelino, "IOTA Tangle: A cryptocurrency to communicate Internet-of-Things data," 2020.
8. Mazzocca et al., "A Survey on Decentralized Identifiers and Verifiable Credentials," 2024.
9. Feraudo et al., "DIVA: A DID-based reputation system for secure transmission in VANETs using IOTA," 2024.
10. Xu et al., "Internet of Vehicles in the Big Data Era," 2018.
11. Lu et al., "Connected Vehicles: Solutions and Challenges," IEEE IoT Journal, 2014.
12. Rahmawati Agustina et al., "A Systematic Literature Review on Privacy Preservation in VANETs," IEEE Access, 2025.
13. Ni et al., "Securing Fog Computing for Internet of Things Applications: Challenges and Solutions," 2018.
14. "Securing Vehicular Ad-hoc Networks" (Maxim & Hubaux / related work).
15. Lin et al., "GSIS: A Secure and Privacy-Preserving Protocol for Vehicular Communications," IEEE TVT, 2007.
16. Zhang et al., "RAISE: An Efficient RSU-Aided Message Authentication Scheme in Vehicular Communication Networks," 2008.
17. Ghovanlooy Ghajar et al., "SBTMS: Scalable Blockchain Trust Management System for VANET," 2021.
18. Sealey et al., "IOTA Tangle 2.0: Toward a Scalable, Decentralized, Smart, and Autonomous IoT Ecosystem," SmartNets, 2022.
19. Lu et al., "Pseudonym Changing at Social Spots: An Effective Strategy for Location Privacy in VANETs," 2012.
20. Al-ani et al., "Privacy and safety improvement of VANET data via a safety-related privacy scheme," 2023.
21. Maria et al., "BAIV: An Efficient Blockchain-Based Anonymous Authentication and Integrity Preservation Scheme for Secure Communication in VANETs," 2022.
