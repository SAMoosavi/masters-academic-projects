# Protocol Descriptions — CLAS/VANET Schemes

> Aggregated scheme descriptions from all paper summaries.

## A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET
*Source: [cahyadi2022-clas-scheme](cahyadi2022-clas-scheme.md)*

1. **Setup**: KGC selects system parameters $(q, G_1, G_2, e, P, s, P_{pub})$ and hash functions
2. **Extract**: KGC computes partial private key $D_i = sH_1(ID_i)$ for user $i$
3. **SetKey**: User selects secret value $x_i$, computes public key $PK_i = x_iP$
4. **Sign**: For message $m_j$, signer picks $r_j$, computes $R_j = r_jP$, $h_j = H_2(m_j, ID, PK, R_j)$, $S_j = r_j + h_j x_i \mod q$
5. **Aggregate**: Aggregator computes $\sigma = \sum S_j$, $R = \sum R_j$
6. **Verify**: RSU checks pairing equation

---

## A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks
*Source: [cahyadi2022-survey](cahyadi2022-survey.md)*

The survey describes the generic CLAS protocol flow for VANETs:

1. **System Setup**: KGC initializes with master secret/public key pair
2. **Vehicle Registration**: TA registers vehicles, KGC issues partial private keys
3. **Key Generation**: Vehicles combine partial private key with chosen secret value
4. **Message Signing**: Vehicles sign safety messages with their full private key
5. **Aggregation**: RSU or aggregator combines multiple signatures
6. **Batch Verification**: RSU verifies aggregate signature in constant time

---

## Pairing-Free Certificateless Aggregate Signcryption Scheme for Vehicular Sensor Networks
*Source: [dai2022](dai2022.md)*

1. **Setup**: KGC initialization
2. **KeyGen**: Vehicle key generation (partial + secret value)
3. **Signcrypt**: Encrypt and sign message simultaneously
4. **Aggregate Signcrypt**: Combine multiple signcryptptions
5. **Unsigncrypt + Verify**: Decrypt and verify aggregate

---

## PCAS: Cryptanalysis and Improvement of Pairing-Free Certificateless Aggregate Signature Scheme with Conditional Privacy-Preserving for VANETs
*Source: [gong2023](gong2023.md)*

1. **Setup**: KGC generates system parameters
2. **KeyGen**: Vehicle receives $D_i$ from KGC, chooses $x_i$, computes $PK_i$
3. **Sign**: For message $m_i$: pick $k_i$, compute $R_i = k_iP$, $h_i = H(ID_i \| m_i \| R_i)$, $\sigma_i = k_i + h_i(x_i + D_i) \mod q$
4. **Aggregate**: Aggregator sums all $\sigma_i$ and $R_i$
5. **Verify**: RSU checks pairing equation; batch mode aggregates across vehicles

---

## eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication
*Source: [han2022](han2022.md)*

1. **Setup**: Parameter and master key generation
2. **Extract**: Partial private key issuance
3. **SetKey**: Vehicle public key generation
4. **Sign**: Message signing with timestamp
5. **Aggregate**: RSU collects and aggregates signatures
6. **Verify**: Single pairing verification checks all signatures

---

## An Efficient and Secure Certificateless Aggregate Signature Scheme for Vehicular Ad Hoc Networks
*Source: [iqbal2023](iqbal2023.md)*

1. **Setup**: HECC parameter generation
2. **Extract**: KGC issues partial private key
3. **KeyGen**: Vehicle generates secret value and public key
4. **Sign**: Sign message using HECC operations
5. **Aggregate**: Sum individual signatures
6. **Verify**: Check against aggregated value

---

## A Comprehensive Review of ECC-based Certificateless Aggregate Signature for VANETs and Cryptanalysis of Quantum-Secure CLAS
*Source: [lode2026](lode2026.md)*

The paper reviews multiple scheme architectures:
1. **Pairing-based CLAS**: Uses bilinear maps $e: G_1 \times G_1 \to G_2$
2. **Pairing-free ECC CLAS**: Uses only scalar multiplication on elliptic curves
3. **HECC-based CLAS**: Uses hyperelliptic curves for smaller keys
4. **Quantum-resistant CLAS**: Attempts lattice/hash-based approaches (found vulnerable)

---

## Security Analysis of Conditional Privacy-Preserving Authentication Schemes for VANETs
*Source: [shim2023](shim2023.md)*

The paper analyzes attacks on existing schemes:
1. **Wang et al. CLAS**: Malicious-but-passive KGC attack
2. **Xiong et al. CLS**: Forgery + key recovery attack

---

## On the security of aggregate signature-based conditional privacy-preserving authentication schemes for VANETs
*Source: [shim2026](shim2026.md)*

The paper analyzes Setup, Sign, Aggregate, and Verify phases of the Zhu-Guan and Chen-Guan schemes, identifying where cryptographic binding fails. The countermeasure modifies the signing equation to include hash values that bind the signature to the specific public key.

---

## ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks
*Source: [tao2026](tao2026.md)*

1. **Setup**: System parameters and master key generation
2. **Extract**: KGC issues partial private key via secure channel
3. **SetKey**: Vehicle generates secret value and public key
4. **Sign**: Vehicle signs message with timestamp, producing $(S_i, R_i)$
5. **Aggregate**: Aggregator computes full aggregate $\sigma$
6. **Verify**: Single verification equation checks all signatures simultaneously
7. **Trace**: TA reveals real identity from pseudonym when malicious behavior detected

---

## Efficient Certificate-Less Aggregate Signature Scheme with Conditional Privacy-Preservation for VANETs Enhanced Smart Grid System
*Source: [vallent2021](vallent2021.md)*

1. **Setup**: System initialization for VANET + smart grid
2. **KeyGen**: Vehicle key generation
3. **Sign**: Vehicle signs smart grid messages
4. **Aggregate**: RSU/smart grid aggregator combines signatures
5. **Verify**: Aggregate verification at smart grid control center

---

## A Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs
*Source: [wang2022](wang2022.md)*

1. **Setup**: System parameters without random oracles
2. **Extract**: KGC issues partial private key
3. **SetKey**: Vehicle generates public key
4. **Sign**: Sign using standard model techniques
5. **Aggregate**: Full aggregation across vehicles
6. **Verify**: Standard model verification

---

## A Privacy-Preserving Certificate-Less Aggregate Signature Scheme with Detectable Invalid Signatures for VANETs
*Source: [wang2025-detectable](wang2025-detectable.md)*

1. **Setup**: System parameters
2. **KeyGen**: Vehicle key pair generation
3. **Sign**: Vehicle signs message
4. **Aggregate**: Combine signatures
5. **Verify**: Check aggregate; if fail → detection phase
6. **Detect**: Test individual signatures to find invalid ones

---

## ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments
*Source: [wang2025-ecae](wang2025-ecae.md)*

1. **Setup**: KGC initializes system parameters
2. **KeyGen**: Terminal device key generation
3. **Sign**: Device signs data with timestamp
4. **Aggregate**: NDN router aggregates signatures
5. **Verify**: Low-latency batch verification at router

---

## A New Efficient and Provably Secure Certificateless Signature Scheme Without Bilinear Pairings for the Internet of Things
*Source: [wei2025](wei2025.md)*

1. **Attack demonstration**: Shows vulnerability in existing PF-CLS class
2. **Enhanced signing**: Modified signature algorithm
3. **Verification**: Updated verification equation

---

## An Efficient Certificateless Aggregate Signature Scheme Resistant to Collusion Attacks for VANETs
*Source: [wu2025-collusion](wu2025-collusion.md)*

1. **Setup**: System parameters
2. **KeyGen**: Enhanced key generation preventing collusion
3. **Sign**: Signing with collusion resistance
4. **Aggregate**: Signature aggregation
5. **Verify**: Aggregate verification
6. **Simulate**: NS3 + SUMO realistic evaluation

---

## A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs
*Source: [wu2025-pseudonyms](wu2025-pseudonyms.md)*

1. **Setup**: System parameters
2. **PseudonymGen**: TA generates pseudonyms for vehicles
3. **KeyGen**: KGC issues partial keys, vehicles choose secret values
4. **Sign**: Vehicle signs with pseudonym-based key
5. **Aggregate**: RSU combines signatures
6. **Verify**: Aggregate verification

---

## A Security-Enhanced Certificateless Aggregate Signcryption Scheme for Vehicular Ad Hoc Networks
*Source: [wu2025-signcryption](wu2025-signcryption.md)*

1. **Attack analysis**: Public key replacement on Dai et al.
2. **Enhanced signcrypt**: Combined encryption + signature with ECC
3. **Aggregate**: Multiple signcryptions combined
4. **Unsigncrypt + verify**: Joint decryption and verification

---

## A Security-Enhanced Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme for VANETs
*Source: [xu2023](xu2023.md)*

1. **Setup**: Enhanced system parameters
2. **KeyGen**: Security-hardened key generation
3. **Sign**: Signing with enhanced security
4. **Aggregate**: Signature aggregation
5. **Verify**: Enhanced verification

---

## A New Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs
*Source: [yuan2023](yuan2023.md)*

1. **Attack analysis**: KGC + public key replacement on prior scheme
2. **Improved Setup**: Standard model parameters
3. **Improved KeyGen**: Resisting KGC attacks
4. **Sign**: Standard model signing
5. **Aggregate**: Signature aggregation
6. **Verify**: Standard model verification

---

## A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs
*Source: [yue2025](yue2025.md)*

1. **Setup**: System parameters
2. **KeyGen**: Standard CLAS key generation
3. **Sign**: Vehicle signs message
4. **Aggregate**: Aggregator combines signatures AND adds own signature
5. **Verify**: Simultaneous verification of aggregate + aggregator signature

---

## Notes on the Security of Certificateless Aggregate Signature Schemes
*Source: [zhang2014](zhang2014.md)*

The paper analyzes attacks and proposes:
1. **Attack 1**: KGC observes and deduces
2. **Attack 2**: KGC forges using master key
3. **Attack 3**: Signers collude
4. **Attack 4**: KGC + signer collude (most destructive)
5. **New scheme**: Individual validity ↔ aggregate validity

---

## Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT
*Source: [zhang2024](zhang2024.md)*

1. **Setup**: System parameters
2. **KeyGen**: User key generation
3. **Signcrypt**: Combined encryption + signature
4. **Unsigncrypt + Verify**: Joint decryption and verification
5. **Public verify**: Third-party verification without decryption

---

## A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks
*Source: [zheng2023](zheng2023.md)*

1. **Setup**: System parameters
2. **KeyGen**: Vehicle key generation
3. **Sign**: Message signing
4. **Aggregate**: Signature aggregation
5. **Verify**: Pairing-free aggregate verification

---

