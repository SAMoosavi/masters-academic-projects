# Summary Report: A Survey on Decentralized Identifiers and Verifiable Credentials

**Paper**: Mazzocca et al. (2024) - "A Survey on Decentralized Identifiers and Verifiable Credentials"
**Published in**: IEEE Communications Surveys & Tutorials (Accepted for Publication)
**DOI**: 10.1109/COMST.2025.3543197
**arXiv**: 2402.02455v2 [cs.CR] 16 Apr 2025
**Authors**: Carlo Mazzocca, Abbas Acar, Selcuk Uluagac, Rebecca Montanari, Paolo Bellavista, Mauro Conti

**Affiliated institutions**: University of Salerno (Italy), University of Bologna (Italy), Florida International University (USA), University of Padua (Italy)

**Funding**: Project SERICS (PE00000014) under the MUR National Recovery and Resilience Plan funded by the EU - NextGenerationEU; U.S. National Science Foundation IPA Independent Research & Development Program; Cyber Florida.

---

## Executive Summary

This comprehensive survey provides an in-depth analysis of Decentralized Identifiers (DIDs) and Verifiable Credentials (VCs) — two foundational technologies enabling Self-Sovereign Identity (SSI) systems. The paper goes beyond typical SSI-focused surveys by examining these technologies across multiple dimensions: security threats, practical implementations, diverse application domains, global regulations, and emerging challenges. The survey identifies key gaps in existing literature and fills them by offering a holistic view of the DID/VC ecosystem, making it a valuable resource for researchers, developers, and policymakers.

---

## 1. Introduction & Motivation

### Problem Statement
- Digital identity has become essential for secure online communications
- Traditional centralized identity systems suffer from single points of failure, data breaches, and limited user control
- Federated systems improved scalability but still rely on trusted identity providers, raising privacy concerns
- Growing need for user-controlled, privacy-preserving identity solutions
- DIDs/VCs extend beyond humans: cloud, edge, and IoT resources also need digital identities (with 5G/6G driving connected-device growth)

### Why This Survey?
- Most existing surveys focus primarily on SSI, overlooking broader applications of DIDs/VCs
- Limited coverage of security threats, practical implementations, and global regulatory landscape
- Need for comprehensive guidance for developers choosing among available frameworks
- Growing adoption requires understanding of challenges and future research directions

### Comparison with Related Surveys
The paper compares against 8 prior surveys (Cucko et al. 2021, Soltani et al. 2021, Bai et al. 2022, Schardong et al. 2022, Ernstberger et al. 2023 SoK Data Sovereignty, Krul et al. 2024 SoK Trusting SSI, Tan et al. 2024, Satybaldy et al. 2024). Table II of the paper shows that, unlike prior works, this survey fully covers *all* of: SSI + non-SSI literature review, threats & mitigation, available implementations, regulations/projects/organizations, and challenges & future directions. Only Krul et al. and Ernstberger et al. also address threats; only Tan et al. and Soltani et al. cover regulations (limited to Europe/US).

### Key Contributions
1. **Threat Analysis**: Identifies key security threats and proposes mitigation strategies
2. **Implementation Comparison**: Comparative analysis of main commercial frameworks
3. **Application Review**: Examines DIDs/VCs across diverse domains beyond SSI
4. **Global Landscape**: Extensive review of regulations, projects, and organizations worldwide
5. **Future Directions**: Identifies critical challenges and promising research areas

### Paper Organization
Section II: Fundamentals of Digital Identity → III: Threats & Mitigation → IV: Implementations → V: Applications → VI: Regulations, Projects & Organizations → VII: Challenges & Future Directions → VIII: Conclusions.

---

## 2. Fundamentals of Digital Identity

### Evolution of Digital Identity

#### Centralized Identity (from 1988)
- Earliest form: IANA managing IP address validity (1988)
- ICANN arbitrates domain name validity (1999)
- Central authority controls identity management; relies on usernames/passwords
- **Problems**: Single point of failure, data breaches, fragmented identity landscape, vulnerability to dictionary/phishing attacks, compliance costs for providers

#### Federated Identity (1998-2005)
- Microsoft Passport program (1998): access multiple sites with a single login
- Sun Microsystems Liberty Alliance (2001): open standards for federated identity
- Today Google and Meta offer Single Sign-On (SSO) support
- **Improvement**: Users access multiple services with one login (authentication through an identity provider)
- **Remaining issues**: Privacy concerns, trust in centralized identity providers, limited user control

#### User-Centric Identity (2005-2012)
- Identity Commons (2005), Internet Identity Workshop (IIW)
- OpenID (2005), OpenID 2.0 (2006), OAuth (2010), FIDO (2012), OpenID Connect (2013)
- **Advancement**: Users manage identities independently; consent required before sharing
- **Limitation**: Still depends on trust relationships with service providers

#### Self-Sovereign Identity (2012-Present)
- Core principle: Individuals have full control over their data
- Built on DLTs, DIDs, and VCs
- Eliminates need for central authorities; enables trustless, cryptographically secured interactions
- VCs transmitted off-chain for privacy; verification relies on publicly available information in the VDR

### Decentralized Identifiers (DIDs)

#### Standardization
- Formalized and standardized by the W3C after collaborative efforts from 2017 to 2019
- Published as official W3C Recommendation (DID Core v1.0, 2022)

#### Architecture
- **DID**: Globally unique, cryptographically secured identifier. Composed of three parts: the `did` URI scheme, the DID **method** identifier, and the **method-specific** identifier (e.g., `did:example:123456789abcdefghi`)
- **DID URL**: Extends a basic DID with path, query, and fragment components, enabling precise resource location within a DID Document or an external resource
- **DID Subject**: The entity (human or non-human) the DID identifies
- **DID Controller**: Entity authorized to modify the DID Document; may coincide with the subject (SSI-aligned) or there may be multiple controllers
- **DID Document**: Machine-readable JSON-LD document containing public keys, service endpoints, authentication parameters, timestamps, and metadata (e.g., an `Ed25519VerificationKey2020` public key with a `publicKeyMultibase` value under `authentication`)
- **DID Method**: Specifies the processes for creating, resolving, updating, and deactivating DIDs and DID Documents
- **Verifiable Data Registry (VDR)**: Stores DID Documents (often blockchain-based); publicly accessible for resolution/verification
- **Universal Resolver**: Resolves DIDs across multiple DID systems; each DID system implements a **DID adapter** as an interface between method-specific implementations and the universal resolver

#### Key Properties
- Cryptographically secured; ownership proven with the private key matching the public key in the DID Document
- Globally unique and permanent (reliable even when switching service providers)
- User-controlled (no central authority)
- Resolvable through universal resolver

#### Types of DIDs
1. **Anywise DIDs**: Usable with an unspecified number of parties (typically strangers); broad usage
2. **Pairwise DIDs**: Known only by subject and one other party (privacy-preserving; unique per relationship)
3. **N-wise DIDs**: Known by strictly N parties (general case); pairwise DIDs are the special case when N = 2

#### Communication Protocols
- **DID Auth**: Proves control over a DID to a service provider via a client application (mobile device or browser)
- Challenge-response mechanism customizable per circumstance, potentially replacing usernames/passwords and establishing an authenticated communication channel

### Verifiable Credentials (VCs)

#### Definition
- W3C specification (VC Data Model v1.1, 2022) for an interoperable, cryptographically verifiable, tamper-proof data structure representing claims
- Can represent any attributes (education, employment, health status, etc.)
- Stored in digital wallets, portable across platforms and applications
- Can be expressed in JSON-LD, JSON, or JSON Web Token (JWT) formats
- VCs/VPs are shared off-chain (not stored on the VDR) to minimize data exposure

#### Main Actors (roles)
1. **Holder**: Entity exercising control over one or more VCs
2. **Issuer**: Trusted entity issuing credentials (government, university, bank, etc.)
3. **Verifier**: Entity requiring valid credentials for service access (e.g., an e-commerce website)
4. **VDR**: Acts as a mediator; issuers register identifiers/schemas and verifiers verify identifiers against it

#### Structure
- **Subject URI**: Retrieves the subject's public key, ensuring verification of credential ownership
- **Issuer URI**: Obtains the issuer's public key and verifies credential origin (may itself be a DID)
- URIs uniquely identifying the credential
- Claim expiration conditions
- Cryptographic signatures (e.g., `RsaSignature2018` proof with `assertionMethod` purpose)

#### Concrete Example (from the paper)
The alumni-credential VC enables all alumni of "Example University" to receive discounts on sporting-event season tickets. The credential `http://example.edu/credentials/1872`, type `["VerifiableCredential", "AlumniCredential"]`, issued by `https://example.edu/issuers/565049`, has a `credentialSubject` with `id: "did:example:ebfeb1f712ebc6f1c276e12ec21"` and an `alumniOf` field naming the university in multiple languages, plus a JWS proof.

#### Verifiable Presentation (VP)
- Defined by the W3C Verifiable Credentials Working Group
- Specifies methods for signing and presenting VCs by the holder
- Wraps one or more VCs with its own proof (e.g., `authentication` proof purpose with a `challenge` and `domain` to bind the presentation to a specific verifier)

#### Selective Disclosure
- Allows revealing only necessary claims
- Methods categorized into: **mono claims**, **hashed values**, **Zero-Knowledge Proofs (ZKP)**, and **selective disclosure signatures**
- **SD-JWT**: Current state-of-the-art (IETF); replaces plaintext claims with digests of salted values; the holder reveals the original claim plus the corresponding salt

### Verifiable Data Registry (VDR)

#### Role
- Trusted intermediary storing and providing access to DID Documents, keys, VC schemas, and related data
- Manages lifecycle of DIDs/VCs (creation, registration, revocation)
- Ensures interoperability and standardization via consistent data formats, validation rules, and sharing protocols
- Not implementation-specified by W3C

#### Implementations
- Most use DLTs; **blockchain** is the most popular (hash-chained blocks, tamper-evident, supports smart contracts)
- Alternative: **Information-Centric Networking (ICN)**, where users manage DIDs through HTTP APIs translated into ICN flows

---

## 3. Threats & Mitigation Strategies

The paper enumerates 9 specific threats across 4 categories.

### A. Key and Credential Compromise

| # | Threat | Description | Mitigation |
|---|--------|-------------|------------|
| 1 | Private key compromise | Phishing, malware, or direct key theft to impersonate the identity owner | Key rotation + revocation; Multi-Factor Authentication (MFA); Hardware Security Modules (HSMs); trusted third-party key recovery/escrow |
| 2 | Credential theft | Malicious user steals/colludes to present a legitimate user's VC | Associate VC with the identity owner's DID (immutable), require proof of ownership of the private key |
| 3 | Forged credentials | Attacker creates a fake VC or presents a credential from an unauthorized issuer | Digital signatures by issuer; include issuer identifier; maintain a secure register of trusted issuers and the claims they may certify |

### B. Credential Validity

| # | Threat | Description | Mitigation |
|---|--------|-------------|------------|
| 4 | Expired/revoked credentials | Validity changes over time (expiration or loss of privileges) | Validity periods in the VC; PKI-style revocation: OCSP, Certificate Revocation Lists (CRLs); W3C **Revocation List 2020** |

**Revocation List 2020** (W3C): a bitstring where each bit corresponds to an index in a VC; bit = 1 means revoked. Because most VCs remain valid, long runs of identical bits compress well via ZLIB (illustrated: ~16 KB → ~135 bytes).

### C. Privacy

| # | Threat | Description | Mitigation |
|---|--------|-------------|------------|
| 5 | Over-disclosure | VC contains more claims than necessary; providers profile users | Selective disclosure: remove unnecessary claims, present only a subset |
| 6 | Correlation across presentations | Providers link claims to the same individual, or collude across providers | Pairwise DIDs; avoid persistent identifiers unless needed for issuer identification; *linked unlinkability* approaches (e.g., EL PASSO) allow repeat-presentation detection (anti-Sybil) while limiting cross-provider correlation |
| 7 | Holder accessing confidential info | Holder sees information intended only for the verifier | Encrypt claims with a secret key known only to authorized service providers; share reveal-info exclusively with verifiers |

### D. Man-in-the-Middle Attacks

| # | Threat | Description | Mitigation |
|---|--------|-------------|------------|
| 8 | Communication interception | Attacker intercepts/tampers with the communication | End-to-end encryption protocols; digital signatures make modification detectable |
| 9 | Replay attacks | Attacker intercepts and reuses a VP with a different verifier | Nonce/timestamp in the VP; verifier sends a challenge set as nonce; VP must include the matching challenge |

---

## 4. Implementations

### Comparison of Major Frameworks

| Library | Main Target Platform | Programming Language | W3C Compliant | Credential Format | Verifiable Proof Types | Selective Disclosure | Key & Wallet Mgmt | VDR | Learning Curve | Open Source |
|---------|---------------------|----------------------|---------------|-------------------|------------------------|---------------------|-------------------|-----|----------------|-------------|
| **DIDKit** | Multi-platform | Rust + C, Java, Android, Python, JS bindings | ✓ | JSON-LD/JWT | RSA/EdDSA/ECDSA/EIP712/JWS2020 | SD-JWT | - | - | Low | ✓ |
| **IOTA Identity** | Multi-platform/IoT | Rust, Node.js (WASM) | ✓ | JWT | EdDSA/ECDSA | SD-JWT/ZKSD | Stronghold | Tangle | Medium | ✓ |
| **Hyperledger Aries** | Multi-platform | Python, JS, Go, .NET | ✓ | JSON-LD | BBS+/EdDSA | SD-JWT | - | Indy Ledger | High | ✓ |
| **Microsoft Entra Wallet** | Mobile (iOS/Android) | Android, iOS | ✓ | JWT | EdDSA/ES256K/ECDSA P-256 | SD-JWT | Azure Key Vault | - | Medium | ✓ |
| **Veramo** | Multi-platform | JavaScript | ✓ | JSON-LD/JWT | EdDSA, ECDH, ECDSA | SD-JWT (plugin, beta) | - | - | Low | ✓ |

### Framework Details

#### DIDKit (SpruceID)
- **Strengths**: Memory safety (Rust core), simpler dependency tree, compatibility with embedded systems, multi-language bindings, ready-to-use HTTP/HTTPS server accessed via any API (including W3C-specified ones)
- **Features**: Signs/verifies W3C-compliant VCs; supports both major VC signing systems/proof formats; handles, validates, registers, and deterministically generates DIDs; issues/consumes Object Capabilities (ZCaps) authorization tokens
- **Use cases**: Web-centric applications, first-time developers
- **Limitations**: Bindings are wrappers over the Rust core and may add complexity vs. direct Rust usage

#### IOTA Identity Framework
- **Strengths**: DLT-agnostic plus dedicated IOTA method specification; built on the **Tangle** (a Direct Acyclic Graph DLT tailored for IoT)
- **Unique features**: Feeless (no miners/validators, no transaction fees); no cryptocurrency token required; general-purpose DLT (SSI can integrate with payments, data streams, smart contracts, access control); includes a **Stronghold** for secure secret management; simple APIs
- **Use cases**: IoT devices, smart sensors, vehicles
- **Selective disclosure**: SD-JWT and Zero-Knowledge Selective Disclosure (ZKSD), following IETF standards

#### Hyperledger Aries
- **Strengths**: Robust security, flexible, production-ready agents; supports multiple protocols, credential types, ledgers, and registries; interoperability tools
- **Agents**: Aries Cloud Agent (Python, embeds Indy-SDK, HTTP controller interface), Aries Framework (.NET, mobile and server-side), Aries Static Agent (Python, no persistent storage, lightweight)
- **Use cases**: Enterprise applications, complex identity systems
- **Limitations**: Steep learning curve, limited development resources (occasional online course), not optimal for process-heavy testing/certification environments

#### Microsoft Entra Wallet Library
- **Strengths**: Mobile-optimized (iOS/Android), integrates with Microsoft Entra Verified ID; complies with OIDC, Presentation Exchange, and VC standards
- **Features**: Uses distinct DIDs per interaction with relying parties (anti-correlation); automates retrieval of exchanged VCs directly from the issuer; supports requirement types: **GroupRequirement**, **VerifiedIdRequirement**, **SelfAttestedClaimRequirement**, **PinRequirement**, **AccessTokenRequirement**, **IdTokenRequirement**
- **Use cases**: Mobile apps, IT admin access management, SSO implementation
- **Limitations**: Requires Microsoft 365 Developer Program registration; primarily mobile-optimized

#### Veramo
- **Strengths**: JavaScript-native, plugin-driven architecture (Veramo Agent), CLI support, multi-platform (Node.js, browsers, React Native)
- **Features**: Create/resolve identifiers, issuance, revocation, credential exchange via plugins; SD-JWT selective disclosure via dedicated plugin (beta)
- **Use cases**: JavaScript developers, rapid prototyping
- **Limitations**: Limited to JavaScript ecosystem

### Lessons Learned
- All frameworks adhere to W3C standards (key for interoperability) and are open-source
- Some are generic/web-centric (DIDKit, Hyperledger Aries, Veramo); others are domain-tailored
- Choice depends on application domain:
  - **IoT/Devices / human+IoT scenarios**: IOTA Identity (its DLT inherently provides the VDR)
  - **Mobile**: Microsoft Entra Wallet
  - **Web/General / first-time developers**: DIDKit (ready HTTP server), Veramo
  - **Enterprise**: Hyperledger Aries

---

## 5. Applications

### A. Smart Transportation

#### Vehicular Communications
- **V2V Authentication**: DIDs/VCs enable secure vehicle-to-vehicle communication without centralized authority (integrity, authentication, confidentiality, privacy)
- **MOBI Alliance**: Introduced blockchain-based **Vehicle IDentification (VID)** standard in 2019, built on the DID specification and enhancing the traditional Vehicle Identification Number (VIN); Connected Vehicle Information Network (CVIN) implementation identifies each vehicle through a DID-based CVID ID
- **Key protocols**:
  - **D-V2X** [67]: Blockchain-based decentralized V2X protocol; the vehicle registers a random DID with the decentralized vehicular PKI (**D-VPKI**, replacing traditional VPKI); the OEM issues a VC binding the VIN; privacy preserved via multiple DIDs linked to a master DID through ZKP-enabled VCs (or MPC), or pseudonyms via two VPs
  - **VDKMS** [69]: Vehicular Decentralized Key Management for V2X networks; authorized vehicles get a VC binding DID to vehicle info
  - **Secure data provenance** [68]: vehicles register with Road Side Units (RSUs) by presenting attribute VCs; provenance checked against RSU tables
- **Privacy preservation**: Multiple DIDs, pseudonyms, ZKP-enabled VCs; V2X reputation transfer [70] changes blockchain address while retaining reputation (Merkle Tree-hashed promise + ZKP, audit-reconstructible deterministic address chain)

#### Vehicular Services
- **Secure registration/authentication**: **BDRA** [71], double-layer blockchain (upper layer: authorized RSUs; lower layer: RSUs + vehicles); collaborative creation of unique VCs for access to route planning / road-condition updates; recipient vehicles authenticate senders and check reputation thresholds
- **Seaport truck authentication** [72]: SSI "vehicle in service" credentials issued by trusted authorities for container operations
- **Vehicle rights delegation** [73]: Pairwise DIDs (private, not on-chain) for temporary access (service checks, borrowing)
- **Data provenance** [74]: DID-based chains of signed, linked data versions for ML-based hazard-detection data integrity

#### Electric Vehicle Services
- **Energy trading** [76]: DIDs for bid submission / seller verification; only DID Documents stored on-chain; transaction details (cost, energy) recorded in VCs
- **Charging authentication** [77]: Integration with **ISO 15118-20** standard, replacing its complex centralized PKI
- **Customer privacy** [78]: Registration with DID + pseudo-ID generating multiple pseudo-IDs per charging session; mutual VC verification; ZKPs validate VCs without revealing extra info

### B. Smart Healthcare

#### Healthcare Services (COVID-19 Context)
- **Immunity passports** [86][87]: Tamper-proof, privacy-preserving certification of test results / vaccinations; trusted entities (pharmacies, national health services) issue VCs; verifiers check eligibility for social activities
- **Onboarding process** [87]: Issuer (pharmacist) fills in-app form → verification through external APIs → two-factor verification → DID stored in issuer's wallet; user uploads ID document photo → hash stored on blockchain → DID goes to holder's wallet
- **Certification process**: Collect identity info → verify → medical test → app retrieves data, creates VC, sends hash to DLT and VC to holder's wallet
- **Decentralized storage** [88]: IPFS for encrypted VCs (accessible only to authorized entities); IPFS hash linked to the citizen's DID; blockchain stores hashes (direct on-chain storage too expensive)

#### Rare Disease Management
- **RDIS** [89]: Rare Disease Identity System facilitating communication among specialists
- **Participants**: Verifiers (healthcare providers), Consumers (specialists), Patients, Delegates (for minors / limited-capacity patients)
- **Unique DID (UDID)**: Tied to a digital profile; verifiers issue/sign attestations attached to patient's UDID document; consumers verify via smart contract against the verifier registry; audit log stores only DID + timestamp

#### Healthcare Data Management
- **DSMAC** [90]: Privacy-aware access control using blockchain/SSI; DIDs authenticate access requests; normal conditions use role-based access per the user's VC; emergencies shift to Attribute-based Access Control (ABAC) with contextual attributes; patient embeds access policies in the DID Document
- **EHR management** [91]: VCs represent patient consent; users directly issue VCs determining accessible resources
- **Federated Learning** [92]: Privacy-preserving decentralized learning; VCs regulate trusted client participation (trusted authority e.g., a hospital); differential privacy prevents inference attacks
- **IoMT device authentication** [93]: Device registration via DID + VC; generates authentication tokens for healthcare-provider interaction
- **Personal data trading** [94]: Users authenticate via DIDs, claim data ownership with VCs; data owner issues a VC granting the buyer permission to use purchased data

### C. Industry

#### Smart Manufacturing
- **Anti-counterfeiting** [98]: Unique DID per smartphone using the **IMEI** number as an attribute; specialized DID methods verify IMEI DID documents; VCs prove device ownership
- **Digital Twins** [117]: **SIGNED** framework uses DLT + VCs; each functional unit has a wallet; attributes encrypted via shared secret within the VC; issuers selectively share info
- **Firmware/software updates** [99]: **Gnomon** framework; IoT devices register DIDs with an identity hub, receive VCs; publisher issues new VC; device requests software via VC, downloads via URL in the VC if version is newer
- **Device communications/monitoring** [100]: Each device has a DID certified by a DID Document defining its communication channel; smart-contract supervisor maintains trusted-device list and logs; manufacturers indicate secure endpoints in the DID Document for trustworthy firmware downloads

#### Federated Learning in Industry 4.0
- **TruFLaaS** [101]: FL as a service; participation regulated through VCs issued by the service provider; credentials revoked when submitted model quality drops below threshold
- **FlowChain** [102]: DIDs uniquely identify participants and regulate IIoT device participation in FL training

#### Energy Distribution
- **Credit evaluation** [103]: DIDs for user credit verification (privacy-preserving); energy operators issue VCs granting microgrid / P2P trading access; users issue VCs confirming counterpart supply/buy behavior; VC collection = credit history stored on blockchain (anti-falsification)
- **Flex framework** [104]: Coordinates distributed energy resources; stakeholders register via DIDs; customers present predefined documentation to authorized parties for attribute validation (e.g., hardware vendor verifying inverter capacity/model)
- **Smart grid ABAC** [105]: Pairwise DIDs identify participants per interaction; VCs replace traditional user attributes, attesting validity without disclosing sensitive info

#### Smart Agriculture
- **Agricultural insurance** [106]: DIDs + VCs + blockchain realize trusted agricultural IoT data sharing; each farmland IoT device has a DID; blockchain serves as source proof for device VCs; **oracles** bridge the blockchain to external data sources (e.g., agricultural IoT); smart contracts automate payouts for predefined risk conditions — addressing distrust, information asymmetry, and transparency issues in crop insurance

#### Smart Supply Chain
- **Transparency/traceability** [107]: DLT for immutable info; certifications issued as VCs by authorized bodies, stored on IPFS with the hash signed and recorded on-chain; verifiers retrieve via hash + IPFS
- **Interoperability**: **VSCC** [108] (Verifiable Supply Chain Credential) extends the VC data model to verify asset alterations across multiple blockchains
- **Shipping** [118]: Anonymous-DID mailboxes; marketplace issues VCs enabling delivery access; customer receives proof-of-withdrawal VC
- **Software supply chain** [109]: Blockchain + VCs for SBOM trust; oversight authorities issue VCs certifying vendor adherence to secure development practices
- **Carbon footprint** [110]: Selective disclosure shares only specific certification info, safeguarding trade secrets (e.g., supplier details)

### D. Other Smart Services

#### Smart Tourism
- **Identity authentication** [119]: Tourism companies submit identity requests to regulatory authorities; upon verification receive a DID + VC; IPFS stores DID Documents/VCs to relieve blockchain load
- **Blockchain-based travel** [120]: Paperless travel — tourist presents DID to consulate, which releases a visa as a VC usable for hotel reservations / car rentals; Singapore Airport automated passport-free immigration clearance using biometric data (from 2024)

#### Smart Education
- **Digital credentials** [122]: Issuance modeled as sub-credentials issued over time, recorded on blockchain → dependency graph enables detecting/preventing malicious actions and publicly verifiable causal relationships between achievements; distributed certification among officials reduces compromise risk
- **Blockchain verification** [123]: Consortium smart contracts enforce decentralized verification; institutions register certificate hashes; DIDs of registered institutions mapped to their smart contracts
- **Cross-border verification** [124][125]: **ELMO2EDS** converts EMREX digital credentials into EBSI diplomas (SSI data format enabling user authentication); cross-border pilots: University of Bologna (Italy) ↔ University of Leuven (Belgium), including verifiable student IDs and transcripts; issuer/verifier roles are exchanged depending on the scenario
- **Motivation** [121]: paper-based graduation certificates are slow, costly, easily falsified

#### Smart Home
- **Temporary access** [126]: Technician presents DID + VC to an **OAuth server** (delegated processing for resource-constrained devices), which issues a token granting access (e.g., to a broken refrigerator)
- **Capabilities-based access** [127]: Devices with sufficient resources verify VCs directly; VCs encode detailed user capabilities over the device

#### Reputation-based Systems
- **E-commerce** [128]: Each seller identified via digital identity; feedback tokens issued as VCs after purchases; reviews submit via tokens (authentic, tamper-proof); platform rewards reviewers with discount tokens

### E. Identity Management

#### Users and Devices
- **CanDID** [133]: Decentralized identity system with legacy compatibility — ports identities/credentials from existing web services (social media, bank accounts); key recovery service
- **BIdM** [134]: Blockchain-based cross-domain identity management; **one-way accumulator** accumulates valid DID↔public-key pairs for efficient membership proofs; accumulator states on a blockchain consortium; master identity (on-chain DID) vs. shadow identity (offline, issued by identity provider)
- **SmartDID** [135]: IoT-oriented distributed identity; dual-credential mode using commitments + ZKPs to protect sensitive attributes, on-chain data, and credential linkages

#### Access Control
- **SSIBAC** [136]: SSI-based access control based on XACML; VCs encoded in VPs mapped to access-control policies stored in a policy retrieval point; permission validators bind VPs to attributes/roles

#### Selective Disclosure
- **Privacy preservation** [137]: Claims representing diagnostic records hidden via **HMACs**, enabling selective disclosure to medical personnel
- **SSI + FIDO** [138]: FIDO authenticators generate locally stored key pairs linked to the user's DID; Trusted Execution Environment (TEE) acts as authenticator for users lacking external USB tokens

#### Services and Data
- **IPFS integration** [139]: DIDs as content names; **DNSlink** binds a DID to a content identifier (CID); content owner publishes self-verifiable content (DID document, proof, signed metadata, content); updates propagate to the DNS record
- **P2P service discovery** [140]: DIDs identify threads as global resources, enabling identity verification among multiple organizations
- **Cross-chain verification** [141]: JointCloud model — verifiable claims signed by any entity; cross-chain contracts retrieve/verify claims; credibility values assigned to claims, signers, and verifiers
- **NDN security** [142]: Hierarchical DIDs as content names for named data networking; content owners generate DID Documents with JWK key representation, authorizing publishers to advertise content-name prefixes to routers

### F. Lessons Learned (Applications)
- DIDs/VCs are used as integral components of SSI systems across most domains, but their decentralized-verification + immutability capability extends beyond SSI (vehicles↔RSUs [67], Gnomon firmware updates [99])
- Key enabler: empowering individuals with full control and selective sharing
- Clear implementation↔domain fit: IOTA Identity suits agriculture/transportation (sensors, vehicles); Microsoft Entra Wallet suits mobile credential management (medical certificates, travel info)

---

## 6. Regulations, Projects & Organizations

### A. Europe

#### eIDAS
- **Original**: Regulation 910/2014 (2014) on electronic identification and trust services — based on the **federated** identity model (identity provider aggregates and can profile users)
- **eIDAS 2.0**: 2021 proposal shifting from federated to SSI model; minimum data sharing
- **EU Regulation 2024/1183** (May 2024): European Digital Identity Framework

#### European Digital Identity Wallet (EUDIW)
- **Function**: Secure storage of DIDs and VCs; each wallet associated with a DID; credentials take the form of VCs issued by eIDAS issuers; verification keys publicly accessible
- **Scale**: Expected to catalyze a major shift — Gartner predicts 500M+ smartphone users regularly using digital identity wallets by 2026
- **Use cases**: Opening bank accounts, educational credentials, public/private services, online and offline

#### eSSIF-LaB
- **EU-funded project** (European Self-Sovereign Identity Framework Lab): accelerating SSI adoption
- Collaborative ecosystem: governments + enterprises; secure, open, trustworthy framework for online/offline electronic transactions

#### EBSI (European Blockchain Services Infrastructure)
- Collaborative EU + European Blockchain Partnership (EBP) platform: all 27 EU Member States + Norway + Liechtenstein
- Focus: cross-border services, educational credential verification (verifiable student IDs and transcripts)
- Pilots: University of Bologna ↔ University of Leuven

#### Regional Initiatives
- Active countries: Finland, Spain, Netherlands, Germany (national SSI frameworks)
- Spanish Association for Standardization published the **first global standard on DLT-based decentralized identity management** (2021)

#### GDPR Compliance
- **Right to Be Informed**: Data sharing fully under user control
- **Right to Rectification**: Request re-issuance of credentials with corrected information
- **Right to Be Forgotten**: Users can revoke a VC at any time; selective disclosure + ZKP achieve data minimization

### B. North America

#### United States
- **NSTIC (2011)**: National Strategy for Trusted Identity in Cyberspace
- **DHS grants (2016)**: Total $4M targeted at DID-domain SMEs; funding established the **W3C DID working group**
- **2023 DHS solicitation**: Privacy-preserving digital credentialing ecosystem, targeting USCIS, CBP, and the DHS Privacy Office; technical areas include digital wallets and software-based mobile verifiers

#### Canada
- **DIACC**: Digital Identity and Authentication Council of Canada (nonprofit coalition of public/private leaders)
- **PCTF**: Pan-Canadian Trust Framework (rules, standards, best practices for VCs)
- **VON**: Verifiable Organizations Network (2018) for exchanging data with VCs used to issue digital licenses, permits, and registration documents
- **International collaboration**: W3C Credentials Community Group membership

### C. South America

#### Argentina - DIDI Project
- **Goal**: Increase trust, reduce socioeconomic/financial barriers for vulnerable populations
- **Use case**: Financial inclusion — 2021 project issuing farmers in the Gran Chaco region VCs documenting sustainable practices (contributing to climate risk scores presented to financial institutions)
- **Regional expansion**: Misiones province law allowing blockchain in government management; digital-wallet adoption project

#### Farmer Connect
- **Participants**: Brazil, Colombia, Costa Rica
- **Focus**: End-to-end traceability across the food/agriculture supply chain with SSI; regulatory compliance; customs/trade security

### D. Asia

- **Context**: digital identities widespread but mostly centralized; the Founder/CTO of Aadhaar (India's biometric ID system) has emphasized potential for integration with DIDs/VCs

#### South Korea
- **KFTC**: Korea Financial Telecommunications & Clearings Institute — blockchain-based digital ID for financial services; active in DID Alliance Korea
- **Busan Blockchain ID App (2020)**: Citizens using DIDs for city facilities (e.g., the "multi-child family love" card for households with 3+ children)
- **KISA**: W3C Credentials Community Group member

#### China
- **RealDID** (late 2023): Ministry of Public Security + Blockchain-based Service Network (BSN); real-name verification, data encryption, certification
- **WeIdentity (WeBank)**: Decentralized identity ecosystem using DIDs/VCs

#### Hong Kong
- **ARTRACX Curator**: Digital identities for fine art/collectibles; intellectual property protection and authentication

#### Taiwan
- **Taiwan DID** (with W3C and IOTA, since 2023): VCs for residents after residency verification; use case: digital content subscription services (pricing/content varying by country)

### E. Africa

#### South Africa
- **Gravity Training + Dock Network**: VCs for commercial work-at-height certifications (countering easy credential forgery, e.g., via Photoshop)

#### Multi-country Initiative
- **Diwala**: VCs used in 50+ institutions across 9 African countries

#### Sierra Leone
- **NDIP**: National Digital Identity Platform (2019, ~7M people) using the **Kiva Protocol** (built on Hyperledger Indy); fast, affordable, secure identity verification

#### Kenya
- **Birth registration**: Mobile SSI approach empowering relatives to register births with health workers via smartphones, linking mothers to babies

### F. Australia and Oceania

#### Australia
- **Government VCs**: Stored in device-native or state-government wallets/applications
- **Use cases**: Employment, education verification (recent graduates presenting VCs as proof of education)
- **Cross-jurisdictional**: Credentials issued by one or more state-level jurisdictions

#### New Zealand
- **DISTF Bill (2023)**: Digital Identity Services Trust Framework — legal foundation for an open accreditation scheme promoting widespread VC/digital identity use
- **CVS-NCNZ**: Credentials Verification Service for the Nursing Council of New Zealand; verifies credentials of foreign-educated/licensed nurses so they can work legally in New Zealand

### G. Lessons Learned (Regulations)
- Global momentum: Europe leads (eIDAS 2.0, EUDIW, national frameworks); North America active (DHS, DIACC/PCTF); South Korea/China advancing in Asia; Africa leverages DIDs/VCs for financial inclusion and birth registration; Australia/NZ pursue cross-jurisdictional government-issued VCs
- Regional tailoring to local needs/regulations is a recurring theme (see Table X of the paper summarizing worldwide initiatives)

---

## 7. Challenges & Future Research Directions

### A. Standardization
- **DID Method Specifications**: Inconsistent format, completeness, information density, and versioning across methods → interoperability challenges
- **VC Standardization**: Domain-specific efforts (e.g., EBSI educational credentials) but early-stage overall; IoT lacks standardized VC data structures for devices; industry-specific standards risk fragmentation if not designed interoperable
- **Protocol Standardization**: Cryptographic algorithms, key management, lifecycle management remain **non-normative**; regulatory/legal frameworks still evolving
- **Initiatives**: W3C, ISO standards, Trust over IP (ToIP) promoting unified frameworks and interoperability testing

### B. Scalability
- **Ledger Storage and Maintenance**: Exponential increase in DID Documents; higher maintenance/access costs, query-efficiency bottlenecks, network congestion at peak times (verification itself is off-chain and unaffected)
- **Solutions**: Indexing, caching, sharding; verifiers can locally store public keys of a trusted issuer subset to minimize ledger interactions
- **Selective Disclosure Protocols**: Minimize holder storage and verification data; by 2026 identity owners expected to manage multiple VCs from various organizations; reduces bandwidth and enhances verification efficiency
- **Revocation Mechanisms**: Efficient transmission/storage of revocation info; promising approaches: **cryptographic accumulators** and **tail files**

### C. Usability
- **EU Mandate (by 2026)**: All member states must develop a secure, user-friendly digital identity tool; public/private services, online and offline (e.g., via Bluetooth/NFC); integrating academic credentials to driving licenses
- **User Experience Requirements**: Intuitive interfaces abstracting complexity; clear consent management with straightforward prompts; visual workflows / step-by-step guided VP presentation; cross-platform wallet interoperability (region-specific privacy laws — EU vs. US — affect cross-jurisdictional wallet interoperability)
- **Automated Features**: Credential lifecycle management (renewal notifications, automatic updates, revocation/expiration alerts); cross-device synchronization (mobile, desktop, other platforms)

### D. Integration
- **Collaborative Environment**: Limited number of trusted issuers actively participating; potential: social media verified accounts (addressing bots), VCs eventually replacing government-issued IDs
- **Legacy System Transition**: Overcoming infrastructure inertia; build VCs from data in existing, unmodified services; use **DIDComm** for interoperability and robust APIs/SDKs for wallet integration; GDPR can help overcome established identity providers' resistance

### E. Security and Privacy

#### DID Management
- Risk: third-party access to DID Documents; **DID controller impersonating the owner** by generating a new key pair and modifying the public key
- Solution: robust authorization and auditing mechanisms to detect/prevent unauthorized modifications

#### Key Rotation
- Challenge: unpredictable key compromises; regular key-pair updates minimize but don't eliminate the vulnerability window; usability concerns with frequent updates
- Research direction: flexible mechanisms with **automatic detection and immediate revocation**; MFA integration (e.g., OTP + key rotation)

#### VC Revocation
- Gap: limited research on efficient revocation mechanisms; only one proposed specification exists, on the W3C standards track but not yet a Recommendation (Revocation List 2020); only one work (EVOKE [59]) introduces a novel efficient mechanism for IoT networks
- Research opportunities: scalability in high-throughput / constrained (IoT) environments; cryptographic accumulators + ZKP; cross-system interoperable revocation

#### Accountability vs. Privacy
- Challenge: reconciling privacy preservation with **KYC/AML** regulations; systems must identify/validate user credentials for screening (e.g., sanctions lists, blacklisting)
- Research direction: privacy-enhancing techniques and protocols enabling verifiable information without exposing sensitive details

#### Selective Disclosure Challenges
- **SD-JWT limitations**: credential size grows **linearly** with the number of claims (storage impact); reveals the **exact number of claims** (enabling inference attacks)
- Research direction: privacy-preserving protocols that maintain regulatory compliance

---

## 8. Conclusions

### Key Findings
1. **DIDs/VCs extend beyond SSI**: Applications span transportation, healthcare, industry, tourism, education, agriculture, and more; also applicable to non-human entities (cloud, edge, IoT)
2. **Growing global adoption**: Regulations and projects emerging worldwide (EU eIDAS 2.0/EUDIW/EBSI, US DHS, Canada DIACC/PCTF, Argentina DIDI, South Korea, China, Africa, Australia/NZ)
3. **Implementation maturity**: Multiple W3C-compliant, open-source frameworks available with varying strengths for different use cases; selection depends on domain
4. **Significant challenges remain**: Standardization, scalability, usability, integration, and security/privacy (key rotation, VC revocation, accountability, SD-JWT limitations)

### Future Outlook
- **EU Digital Identity Wallet**: Expected to catalyze a major shift with 500M+ smartphone users by 2026
- **Cross-border interoperability**: Essential for global adoption
- **Privacy-preserving compliance**: Critical for regulatory alignment (KYC/AML)
- **Research opportunities**: Revocation mechanisms, key management, selective disclosure optimization, flexible DID management

### Value Proposition
- **For researchers**: Comprehensive foundation for ongoing studies
- **For developers**: Practical guidance on framework selection
- **For policymakers**: Global landscape of regulations and initiatives
- **For practitioners**: Threat analysis and mitigation strategies

---

## References Summary

The paper cites 184 references spanning:
- W3C specifications (DID Core v1.0, VC Data Model v1.1, Revocation List 2020)
- Academic papers on SSI, blockchain, identity management, and the application taxonomies (Tables V-IX)
- Industry frameworks (DIDKit/SpruceID, IOTA Identity, Hyperledger Aries, Microsoft Entra Wallet, Veramo)
- Government regulations (eIDAS, GDPR, NSTIC)
- Global initiatives (EBSI, eSSIF-LaB, PCTF, DIDI, Diwala, NDIP/Kiva, DISTF, etc.)

---

*Report generated from: Mazzocca, C., Acar, A., Uluagac, S., Montanari, R., Bellavista, P., & Conti, M. (2024). A Survey on Decentralized Identifiers and Verifiable Credentials. IEEE Communications Surveys & Tutorials. DOI: 10.1109/COMST.2025.3543197*
