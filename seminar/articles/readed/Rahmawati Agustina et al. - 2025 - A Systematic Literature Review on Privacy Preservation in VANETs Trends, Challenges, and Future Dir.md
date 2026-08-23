# Paper Summary Report

## A Systematic Literature Review on Privacy Preservation in VANETs: Trends, Challenges, and Future Directions

**Authors:** Esti Rahmawati Agustina, Kalamullah Ramli, Arif Rahman Hakim, Ruki Harwahyu
**Affiliation:** Department of Electrical Engineering, Universitas Indonesia; Department of Cybersecurity, Politeknik Siber dan Sandi Negara, Indonesia
**Journal:** IEEE Access, Volume 13, 2025 (pp. 88421-88444)
**DOI:** [10.1109/ACCESS.2025.3570491](https://doi.org/10.1109/ACCESS.2025.3570491)
**Funding:** Universitas Indonesia (PUTI Q2, contract NKB-716); LPDP (Ministry of Finance, Indonesia)

---

## 1. Abstract

This paper presents a **systematic literature review (SLR)** using the Kitchenham method to analyze privacy preservation schemes in Vehicular Ad-hoc Networks (VANETs), focusing on **pseudonym implementation** — specifically the completeness of the pseudonym life cycle. The review screened 594 papers, with **113 satisfying primary research (PR) requirements**. Key findings:
- **71%** adopted standard VANET system models
- **12%** implemented a comprehensive pseudonym life cycle (all five stages)
- **73%** conducted both formal and informal security and privacy analyses

The paper classifies VANET system models and their enhancement with emerging technologies (blockchain, cloud, fog), maps these technologies onto pseudonym life-cycle stages, categorizes privacy analyses, and identifies research gaps and future directions. To the authors' knowledge, no prior study has analyzed comprehensive pseudonym life-cycle implementation in the last five years.

---

## 2. Research Questions

| RQ | Question |
|----|----------|
| **RQ1** | What are the trends in VANET system models? |
| **RQ2** | What are the trends in pseudonym life cycle implementation? |
| **RQ3** | What types of privacy analyses are conducted to assess existing schemes? |
| **RQ4** | What are the research challenges and potential gaps for future directions? |

### 2.1 Motivation and Prior Reviews

Prior surveys addressed only parts of the pseudonym lifecycle:
- **Petit et al.**: pseudonymity approaches by cryptographic technique (symmetric, asymmetric, identity-based, group signature)
- **Al Shareeda et al.**: identity-based security/privacy methods
- **Syeikh et al.**: authentication schemes against malicious nodes/fake messages
- **Mundhe et al.**: cryptographic methods for privacy/authentication requirements
- **Jan et al.**: authentication & privacy methods in four categories (security procedures, needs, strengths/weaknesses, countermeasures, performance)
- **Babaghayou et al.**: pseudonym change strategies
- **Farhood et al.**: pseudonym-changing strategies for privacy
- **Khan et al.**: location privacy (attack and defense technologies)

**Gap this paper fills:** no prior review assessed *complete* pseudonym life-cycle implementation (issuance → usage → changing → resolution → revocation) across different VANET system models in the last five years.

---

## 3. Methodology

### 3.1 Kitchenham Method
The study follows Kitchenham's guidelines for systematic reviews with three stages:
1. **Planning the review** - Define research questions
2. **Conducting the review** - Search strategy, selection criteria, quality assessment, data extraction & synthesis
3. **Reporting the review** - Findings per research question

### 3.2 Search Strategy
- **Databases:** Scopus, IEEE Xplore, ScienceDirect (chosen for high-quality coverage of VANETs, cybersecurity, cryptography)
- **Keywords:** "privacy-preserving" AND "VANET" (Boolean AND); multiple search strings with date filters, documented in Table 2 for reproducibility
- **Time Period:** Journal articles from the last six years (2019-2024)
- **Screening funnel:** 594 papers → 64 duplicates removed → **517 unique** → 166 after inclusion/exclusion → **113 primary research (PR) papers** after quality assessment

**Publication trends (Figure 4, 2019-2024):** IEEE-affiliated journals are the **dominant source in every year**, contributing the largest number of papers in all periods — indicating that most privacy-preserving VANET research is published in IEEE journals.

### 3.3 Selection Criteria
**Inclusion:** Peer-reviewed journal articles (high-quality empirical research) published in ScienceDirect, IEEE Xplore, or Scopus.
**Exclusion:** Book reviews, book chapters, position papers, analytical papers, comparative papers, technical reports, workshop reports, lecture notes, and conference papers (often lack rigorous peer review or report preliminary work later extended in journals); studies without full text available.

### 3.4 Quality Assessment
Binary criterion (AQ1) with only two answers: **"yes" (score 1)** if the study presents a well-defined pseudonym and the procedure used to create it for privacy, **"no" (score 0)** → excluded. Only studies specifically discussing pseudonym creation/application for privacy were analyzed.

### 3.5 Data Extraction
A standardized extraction form captured: VANET system model, pseudonym life cycle (per-stage: entity/input/method for issuance; ETSI TR 103415 strategies for changing), and privacy analysis (formal vs informal).

---

## 4. VANET System Models (RQ1)

Six VANET system models were identified. Distribution: Standard 71%, Blockchain-based 13%, Cloud-based 5.3%, Fog-based 4.4%, Hybrid 4.4%, Miscellaneous 1.8%.

### 4.1 Standard Model (71% - 80 of 113 papers)

**Components:**
- **OBU (On-Board Unit):** Communication devices in vehicles with wireless interfaces, GPS, sensors (location, speed, environment)
- **RSU (Roadside Unit):** Fixed infrastructure at intersections/highways for V2I communication, linked to back-end servers/traffic management centers
- **TA (Trusted Authority):** Central authority for security credentials (digital certificates, pseudonyms)

**Advantages:**
- Simple and efficient architecture, practical implementation
- Centralized security framework; TA as guarantor of privacy/credential management
- TA supports law enforcement in tracing malicious vehicles

**Challenges:**
- **Single Point of Failure (SPoF):** TA unavailability affects all entities
- **Privacy risk:** TA knows all identities → prime target; a compromised TA enables widespread privacy violations

**Improvements Identified:**
- **TA Division (Figure 6):** Split into Trace Authority (TRA) + Key Generation Center (KGC); TRA generates pseudoidentities and tracks rogue vehicles, KGC generates keys/security parameters — prevents a single entity from controlling privacy-sensitive information. (PR30, PR53, PR37, PR67, PR93)
- **Independent entities** to mitigate SPoF: KGC, Central Authority (CtA), Regional TA (RTA), Regional Traffic Management Center (RTMC), Certification Authority (CA), Root TA (RoTA)
- **Additional functional entities:** Service Provider (SP), Application Server (AS), Cooperative Vehicle (CV), Local Inspector (LI), Traffic Management Center (TMC)
- **Enhanced OBU:** biometrics (multifactor authentication), tamper-proof devices (TPD) for storing secret/group keys, Physical Unclonable Functions (PUF) for authentication randomness

**Life-cycle contribution:** TRA handles both issuance and resolution; KGC, RTA, TPD contribute to issuance — distributing responsibilities across all five stages.

### 4.2 Blockchain-Based Model (13% - 15 papers)

**Key Roles of Blockchain (14 identified, Table 5):**
1. **Decentralization (KR1):** Eliminates centralized third party (SPoF, privacy risks)
2. **Immutability (KR2):** Tamper-proof data records → data authenticity/integrity
3. **Trust Management (KR3):** Consensus-verified, tamper-resistant message authenticity; reduces Sybil attacks and message manipulation
4. **Reputation Synchronization (KR4):** Distributed-consensus reputation updates, tamper-proof
5. **Conditional Privacy & Traceability (KR5):** Verification without identity disclosure; authorities trace harmful vehicles
6. **Anonymity & Pseudo-ID (KR6):** Publicly verifiable record of issued, non-revoked pseudoidentities
7. **Smart Contracts for Privacy (KR7):** Automatic enforcement of privacy policies/data release conditions
8. **Public Key Management (KR8):** Smart-contract-controlled storage/retrieval/revocation of public keys by authorized entities
9. **On-chain Certification (KR9):** Decentralized certificate issuance, verification, revocation; on-chain revocation lists
10. **Batch Pseudonym Revocation (KR10):** Trace and revoke pseudonyms within a batch without disclosing identities
11. **Secure Pseudonym Distribution (KR11):** Sender/receiver/timestamp recorded with strong hash; no sensitive data published
12. **Revocation Transparency (KR12):** Fast, transparent revocation with tamper-proof audit trail
13. **Smart Contracts for Forensics (KR13):** Electronic forensics/vehicle tracing in accidents
14. **Dynamic Revocation (KR14):** Efficient, scalable identity management without central authority

**Challenges:**
- Computational overhead during consensus (unsuitable for resource-constrained OBUs)
- Latency from consensus mechanisms limits communication efficiency
- Centralization limitations are addressed, but decentralization introduces its own trade-offs

### 4.3 Cloud-Based Model (5.3% - 6 papers)

**Key Functions (14 identified, Table 6):**
- Data Processing (KF1), Data Storage (KF2), Security & Privacy Preservation (KF3, semi-trusted server), Computational Efficiency (KF4), Key Generation & Distribution (KF5), Vehicle Registration (KF6), Secure Communication (KF7), Security Analysis (KF8, hostile-node detection), Reduced Communication Costs (KF9, signature aggregation), Hierarchical Architecture Support (KF10), Reputation Calculation (KF11), Service Provision (KF12), Data Swapping (KF13), Cryptographic Operations (KF14)

**Challenges:**
- High latency for real-time applications
- SPoF vulnerability (cloud outage affects whole network)
- Privacy concerns with sensitive data stored in the cloud (unauthorized access/exploitation)

### 4.4 Fog-Based Model (4.4% - 5 papers)

**Primary Tasks (10 identified, Table 7):**
- Authentication (PT1), Facilitating Communication (PT2), Key/Security Parameter Management (PT3), Mitigating Attack Risk (PT4), Reduced TA Dependency (PT5), Minimizing Latency (PT6), Enhanced Computational Capabilities (PT7), Message Integrity (PT8), Conditional Privacy (PT9), Revocation of Malicious Vehicles (PT10)

**Advantages:**
- Real-time processing at network edge
- Reduced communication delays (critical for collision avoidance, traffic management)
- More computational power than traditional RSUs
- Quick revocation (TA releases only two hash seeds to invalidate all unexpired pseudonyms of a malicious vehicle)

**Challenges:**
- Data consistency/synchronization across dispersed fog nodes
- Security of data processed at the edge

### 4.5 Hybrid Model (5 papers)

**Combinations:**
- Cloud + Fog + Blockchain (PR07) — decentralized trust, immutable records, real-time processing, resource management
- Fog + Blockchain (PR34) — blockchain identity management + fog efficiency for route management
- Fog + Cloud (PR43, PR60) — fog for real-time authentication/privacy, cloud for storage/complex processing
- Cloud + Blockchain (PR92) — cloud processing/storage + blockchain data integrity and oversight

**Benefits:** Combines scalability (cloud), low latency (fog), decentralized trust (blockchain).

**Challenges:** Increased system complexity, coordination overhead, higher costs, interoperability difficulties.

### 4.6 Miscellaneous (2 papers)

- **IoT-based (1 paper):** Richer data collection, smart traffic management; but heterogeneous devices introduce security vulnerabilities
- **SDVN-based (1 paper):** Software-defined networking for dynamic control/rapid security policies; but centralized control introduces controller-attack vulnerabilities

### 4.7 Emerging Technology → Pseudonym Life Cycle Mapping (Key Finding)

All three emerging technologies map onto the pseudonym life cycle for **issuance, usage, resolution, and revocation** stages. Critically, **none supports the changing stage**:
- **Blockchain (Figure 8):** No suitable role identified for changing — immutability, high latency, linkability risks, and off-chain mechanism limitations are ill-suited to the rapid pseudonym changes VANETs need
- **Cloud (Figure 9):** None of the six cloud-based studies implemented a changing strategy — communication latency blocks real-time switching, plus unstable connectivity and centralization hazards
- **Fog (Figure 10):** Role not apparent in changing; in PR43 the change is performed by the vehicle itself, not the fog node

This reinforces that the **changing stage is the least-supported stage** overall, even with emerging-technology support.

---

## 5. Pseudonym Life Cycle Implementation (RQ2)

### 5.1 Overview

| Stage | Implementation Rate | Description |
|-------|---------------------|-------------|
| **Issuance** | 100% | Generation of cryptographically secure pseudonyms |
| **Usage** | 100% | All reviewed studies used pseudonyms in V2V/V2I communications |
| **Changing** | 21% | Periodic pseudonym changes to prevent tracking |
| **Resolution** | 83% | Identification of true identity for law enforcement |
| **Revocation** | 43% | Blocking compromised vehicles |
| **Complete Cycle** | **12%** | All five stages implemented (Table 14) |

> Note: The introduction cites 14% for complete life-cycle implementation, while the abstract, Section IV, and conclusion report 12% — a minor internal inconsistency in the paper. The dominant figure (12%) is used here.

Most schemes focus solely on issuance and usage, disregarding changing, resolution, and revocation — leaving vehicles vulnerable to linkability attacks, Sybil attacks, and unauthorized/illegal access.

### 5.2 Issuance Stage

**Entities Responsible for Generation (Table 10):**
| Entity | Percentage |
|--------|------------|
| Vehicles/OBUs | 37% |
| Trusted Authority (TA) | 27% |
| Joint (two entities, e.g., Vehicle+TA, Vehicle+RSU, Vehicle+TRA, Vehicle+KGC, Vehicle+RTA) | 23% total |
| — Joint Vehicle + TA | 46% (of the 23% joint) |
| — Joint Vehicle + TRA | 35% (of the 23% joint) |
| — Other combos (RSU-TA, RSU-CA) | 2% together |

**Generation Methods:**
- **Hash Functions:** 73% (most common — low computational overhead, ideal for resource-constrained OBUs; fixed-length outputs that are hard to reverse-engineer)
- **Encryption:** used where higher security is required
- **Digital Signatures:** for authentication support
- (Challenge section also cites XOR and multiplication-based generation)

**Inputs for Generation:**
- Original Vehicle ID (**~90%** of studies)
- Validity Timestamp (enables smoother/periodic pseudonym changes)

### 5.3 Usage Stage
- All 113 papers used pseudonyms in their communication schemes
- Applied in both V2V and V2I communications (traffic info, safety warnings, cooperative driving)
- Enables anonymous participation while maintaining authenticated, secure communication

### 5.4 Changing Stage (21% of papers)

**ETSI TR 103415 Changing Strategies (Table 11):**
1. **Fixed Parameter:** Time-based or distance-based intervals
2. **Randomness:** Random timing for changes
3. **Silent Period:** Temporary communication cessation
4. **Vehicle-Centric:** Based on vehicle's own conditions
5. **Density-Based:** Adapted to traffic density
6. **Mix Zone:** Designated areas for pseudonym changes

Ineffective strategies (e.g., fixed-time changes ignoring density or communication patterns) enable **linkability attacks**, where adversaries correlate old and new pseudonyms to locate vehicles.

### 5.5 Resolution Stage (83% of papers)
- Enables authorized entities (e.g., law enforcement) to identify the true vehicle identity via cryptographic information held by the TA/TRA
- TA/TRA acts as mediator; disclosure only to entities with legitimate authority/reason
- Maintains balance between privacy and accountability
- A controlled, transparent process minimizing abuse risk

### 5.6 Revocation Stage (43% of papers)
- Blocks malicious/policy-violating vehicles from network participation
- TA issues revocation notices based on validated evidence of misconduct
- Essential for network integrity, accountability, deterrence; rapid revocation supports adaptive security
- Absence of effective revocation lets compromised vehicles persist, increasing Sybil attacks and unauthorized access

---

## 6. Privacy Analysis Trends (RQ3)

### 6.1 Analysis Types

| Type | Percentage | Description |
|------|------------|-------------|
| **Formal + Informal** | **73%** | Both mathematical proofs and empirical methods |
| **Informal Only** | 16% | Simulations, experiments, qualitative analysis |
| **Formal Only** | 7% | Mathematical models and proofs |
| **No Analysis** | 2 papers | Not conducted |

### 6.2 Formal Analysis Methods

**Theoretical Frameworks (security-oriented, not privacy-specific):**
- **Random Oracle Model (ROM):** Cryptographic protocol security proofs
- **Elliptic Curve Discrete Logarithm Problem (ECDLP):** Asymmetric cryptography
- **Elliptic Curve Diffie-Hellman (ECDH):** Key exchange protocols

**Analysis Tools:**
- **BAN Logic, AVISPA, SPAN:** Protocol security analysis — *not explicitly designed for formal privacy analysis*
- **ProVerif:** The main tool used for **formal privacy analysis** — analyzes privacy properties such as **anonymity and unlinkability**; used in PR03 and PR16 (which also used BAN logic)

**Key insight:** Formal analysis in most schemes addresses *security* rather than *privacy*; privacy-preserving schemes are often integrated with security-preserving mechanisms, and privacy-specific formal verification is underutilized.

### 6.3 Informal Analysis Methods
- Simulation-based evaluations
- Experimental performance testing
- Qualitative security discussions
- Attack resistance analysis

---

## 7. Key Findings Summary

### 7.1 System Model Distribution
| Model | Papers | Percentage |
|-------|--------|------------|
| Standard | 80 | 71% |
| Blockchain-based | 15 | 13% |
| Cloud-based | 6 | 5.3% |
| Fog-based | 5 | 4.4% |
| Hybrid | 5 | 4.4% |
| Miscellaneous (IoT, SDVN) | 2 | 1.8% |

### 7.2 Pseudonym Life Cycle Completeness
- **Only 12%** of studies implemented all five stages
- Most schemes focus on issuance and usage
- Changing (21%), resolution (83%), revocation (43%) are progressively neglected, with changing the most neglected
- Emerging technologies (blockchain, cloud, fog) support all stages **except changing**

### 7.3 Privacy Analysis Coverage
- **73%** conducted both formal and informal analyses
- **7%** used only formal methods
- **16%** relied solely on informal analysis
- **2 papers** conducted no privacy analysis
- Formal privacy-specific analysis (ProVerif-based) is rare

---

## 8. Research Challenges and Future Directions (RQ4)

### 8.1 Single Point of Failure (SPoF) in Standard Models
**Challenge:** Centralized TA creates vulnerability
**Solutions:**
- Distribute TA functions to multiple trusted entities
- Integrate blockchain for decentralized trust
- Integrate fog/edge computing
- Implement **hybrid architectures** combining traditional models with blockchain and cloud-based solutions

### 8.2 Potential Vulnerabilities from Incomplete Pseudonym Life Cycle
**Challenge:** Only 12% implement the full cycle
**Impact:** Vulnerable to linkability attacks, Sybil attacks, unauthorized access
**Direction:** Develop complete life-cycle frameworks without compromising performance or increasing latency, while meeting regulatory compliance

### 8.3 Robustness Trade-offs in Pseudonym Issuance
**Challenge:** Trade-off between method complexity and resource/computing-time requirements (hash, XOR, signature, multiplication, encryption)
**Considerations:**
- Hash functions: Low overhead but may not suit long-term use
- **Future: Post-quantum cryptography readiness** — as attacker computing power grows, current hash-based generation may be unsuitable

### 8.4 Pseudonym Predictability
**Challenge:** Fixed input combinations (real identity + timestamp + random number) enable tracking/linking, especially with predictable change intervals
**Solutions:**
- Add dynamic inputs (road conditions, vehicle routes, geographical locations)
- **Balance unpredictability with traceability**

### 8.5 Diversity of Pseudonym Changing Strategies
**Challenge:** No universal single solution fits all scenarios (vehicle density, speed, network conditions)
**Strategies:** vehicle-centric, fixed parameter, random, or combined
**Direction:** Adapted/adaptable strategies tailored to specific environments

### 8.6 Informal vs. Formal Analysis Gap
**Challenge:** Predominant reliance on informal evaluation; formal analysis focuses on security rather than privacy
**Direction:** Increase formal analysis using **privacy-dedicated tools** (e.g., ProVerif) for anonymity and unlinkability properties

---

## 9. Key Contributions

1. **First comprehensive pseudonym life cycle survey in five years** covering issuance, usage, changing, resolution, and revocation — with issuance classified by generating entity/input/method, and changing strategies per ETSI TR 103415
2. **VANET system model classification** with emerging technology (blockchain/cloud/fog) integration mapping onto the pseudonym life cycle
3. **Privacy analysis classification** distinguishing formal and informal methods and identifying underutilized formal privacy tools
4. **Research gap identification** and key factors for developing robust privacy-preserving schemes

---

## 10. Conclusions

- Standard VANET models dominate (71%), but face SPoF challenges
- **Only 12%** implement the complete pseudonym life cycle — the major research gap
- Most schemes focus on issuance/usage, neglecting changing (21%) and revocation (43%); resolution is fairly common (83%)
- **73%** conduct both formal and informal analyses, but formal privacy-specific tools (ProVerif) are underutilized
- Emerging technologies (blockchain/cloud/fog) do not support the pseudonym-changing stage
- Future research should focus on:
  - Complete life cycle implementation
  - Hybrid architectures (blockchain + fog + cloud)
  - Post-quantum cryptographic readiness
  - Formal privacy analysis methods
  - Dynamic inputs to reduce pseudonym predictability

---

## 11. Glossary of Key Terms

| Abbreviation | Definition |
|--------------|------------|
| VANET | Vehicular Ad-hoc Network |
| V2V / V2I | Vehicle-to-Vehicle / Vehicle-to-Infrastructure |
| OBU | On-Board Unit |
| RSU | Roadside Unit |
| TA | Trusted Authority |
| TRA | Trace Authority |
| KGC | Key Generation Center |
| CtA / RTA / RoTA | Central / Regional / Root Trusted Authority |
| TMC / RTMC | (Regional) Traffic Management Center |
| CA | Certification Authority |
| SP | Service Provider |
| AS | Application Server |
| CV | Cooperative Vehicle |
| LI | Local Inspector |
| SPoF | Single Point of Failure |
| PUF | Physical Unclonable Function |
| TPD | Tamper-Proof Device |
| ETSI | European Telecommunications Standards Institute |
| ROM | Random Oracle Model |
| ECDLP | Elliptic Curve Discrete Logarithm Problem |
| ECDH | Elliptic Curve Diffie-Hellman |
| AVISPA / SPAN | Security protocol validation tools |
| SLR | Systematic Literature Review |
| KR | Key Role (blockchain) |
| KF | Key Function (cloud) |
| PT | Primary Task (fog) |

---

## 12. Summary for Seminar Presentation

### Core Innovation
First SLR in five years analyzing **complete pseudonym life cycle implementation** across VANET system models using the Kitchenham methodology, including a mapping of emerging technologies onto life-cycle stages.

### Key Statistics
- **594 papers** screened → **113 primary research papers** analyzed
- **71%** use standard VANET models; 13% blockchain; 5.3% cloud; 4.4% fog; 4.4% hybrid
- **12%** implement the complete pseudonym life cycle (critical gap)
- Stage rates: changing 21%, revocation 43%, resolution 83%
- **73%** conduct both formal and informal analyses
- IEEE is the dominant publication source every year (2019-2024)

### Key Findings
- Changing stage is the most neglected — and **no emerging technology (blockchain/cloud/fog) supports it**
- Hash functions (73%) dominate pseudonym issuance; vehicle ID is the key input (~90%)
- ProVerif is the only widely cited formal privacy-analysis tool (anonymity/unlinkability)

### Research Gaps Identified
1. Incomplete pseudonym life cycle implementation
2. SPoF vulnerability in standard models
3. Predictable pseudonym generation
4. Inadequate formal privacy analysis

### Future Directions
- Complete pseudonym life cycle frameworks
- Hybrid architectures (blockchain + fog + cloud)
- Post-quantum cryptography readiness
- Formal privacy-specific analysis tools
- Dynamic, unpredictable pseudonym inputs

### Impact
Provides a roadmap for developing robust, complete privacy-preserving schemes in VANETs.

---

*Report generated on: 2026-07-22*
*Source: Agustina, E. R. et al. (2025). A Systematic Literature Review on Privacy Preservation in VANETs: Trends, Challenges, and Future Directions. IEEE Access, 13, 88421-88444.*
